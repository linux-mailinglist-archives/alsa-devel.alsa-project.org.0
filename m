Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4AD77D343
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 21:20:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8229AE9;
	Tue, 15 Aug 2023 21:19:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8229AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692127215;
	bh=eFvjIQpfpLn04fUrutil1i4WgaNEC1I7mt3ZBcQfd9Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IUqJGlOY9C3ET9sU8e7+nLY/L7I68ujXao5LIbgbqFA0Wq+sjHotU2HEl2iafE7VY
	 gf0u2bqEipDauq+ivKiTuEwwfF0Q27QLK/OO+TeDM6VurMSrXhp5ZKfuObeVs3wtCr
	 ghy6H1tcplSI4j453hnVBkaTObERuD5QmR6oj7N8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D623EF805B3; Tue, 15 Aug 2023 21:18:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B187F805AC;
	Tue, 15 Aug 2023 21:18:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D44FFF80553; Tue, 15 Aug 2023 21:17:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E261F80549
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 21:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E261F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O1QikjCE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AB07F660BB;
	Tue, 15 Aug 2023 19:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1FAC433C8;
	Tue, 15 Aug 2023 19:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692127072;
	bh=eFvjIQpfpLn04fUrutil1i4WgaNEC1I7mt3ZBcQfd9Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=O1QikjCECQLMD6PgOJRk4l6VMHKL9lxYP08dKPODzP3JTCIbiCIlipOyThytW84u3
	 HMkpJAABC3MQk4k3tLPshAeiAOuuyg21fH1+L4ITmL9XIbsHc5QWX9aAZ1THOM3eNG
	 5qOmBMpsi/Wx5O6MSysAkV7Tp8689txlUgrj38t97T9Zb2HYWcRVkkT9I1hlmnRv2Y
	 hEpJG8eLzGtbf/ZCOTzc794rw1wjWRKjIx1UJ94iLDGdiJv31v5R3+uwizEU5Q8XT7
	 A6L9x/aim7jMpUxcyI+5/VBfIk8+Z9E3yT4+EsvBHoHCh5ypRNjKwhboqSinJ4zoXj
	 UGpeGcMerntXg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de
In-Reply-To: <20230814232325.86397-1-pierre-louis.bossart@linux.intel.com>
References: <20230814232325.86397-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: topology: simplify kcontrol names with
 token
Message-Id: <169212707116.68178.17692815683017511265.b4-ty@kernel.org>
Date: Tue, 15 Aug 2023 20:17:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: BV5SOPXSZLKJVNZ37FQZPNBOSBUJJBE5
X-Message-ID-Hash: BV5SOPXSZLKJVNZ37FQZPNBOSBUJJBE5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BV5SOPXSZLKJVNZ37FQZPNBOSBUJJBE5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 14 Aug 2023 18:23:23 -0500, Pierre-Louis Bossart wrote:
> The use of the widget name as a prefix for the kcontrol name is quite
> useful in the case of multiple pipelines going to the same endpoint,
> but it's overkill in simpler cases.
> 
> This patchset extends the existing DAPM code to drop the widget name
> prefix and make the kcontrol names simpler when there's no possible
> ambiguity, e.g.  "gain.2.1 Main Playback Volume" becomes just "Main
> Playback Volume".
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dapm: Add a flag for not having widget name in kcontrol name
      commit: f7f4a5ad8e11de4edb7b62d099f0501c8610c92b
[2/2] ASoC: SOF: topology: Add a token for dropping widget name in kcontrol name
      commit: 56ce7b791b787e0aee19601e422f13a18d4eafe7

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

