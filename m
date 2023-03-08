Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1DF6B09F4
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 14:53:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22E7317F7;
	Wed,  8 Mar 2023 14:52:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22E7317F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678283610;
	bh=6oBAPpAul/0B5v6cpr4OU+Azi16vXki62V+RZ28bMsc=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zao/ULS7CcSz5hL8rUJtm5wpzxL5/ZDBTq6HQMD2VpJnWy3UeMARPwGORaGV9CRMU
	 XddUpa9Q8lpI4Z3CoRGAXbQ44IELQ9DRPjj3DpdRfGjyJd8eq6ZJ9LpqDHO/6/9uos
	 BKtd8moJ3POG2zYPJ0QsOWBjsEazwbkh2wcWfOCA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAF70F8042F;
	Wed,  8 Mar 2023 14:52:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D4DFF80431; Wed,  8 Mar 2023 14:52:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 957C2F8007E
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 14:52:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 957C2F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SZcwnwMV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B3A50B81CD1;
	Wed,  8 Mar 2023 13:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4868C433EF;
	Wed,  8 Mar 2023 13:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678283544;
	bh=6oBAPpAul/0B5v6cpr4OU+Azi16vXki62V+RZ28bMsc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SZcwnwMV1JvZ+ZZBKu9u1pmxUeWwP7D4wovwrc6sl0E9KWpshp2b5IFw4DCr1SCvJ
	 e/Frc/bwFATEa04M2AyONKeqUdAVZ01F+sbd+EfVEnsoqfAcWZHwaUBNgnZ40UolIz
	 eNOkrfYc/0fEWA3M5GTsxgojbvgfdGPal+nSb1zSWX5zDWqcLf+OZZww47OSojczC9
	 f9NT1PAoLsZoaSibiV4PbpkF9d0Zd7TDEX+BeAMIZvd6Cpg1q04cQX+Mhw9wo14BXR
	 6oM2WC0dpln1QQl0OxdJS6EhurEg6n3Tsn3p4cfPGHwmar2LVnqb6hjURWhqF59Nz4
	 WXjhbU+r0N48Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230307095158.2818-1-peter.ujfalusi@linux.intel.com>
References: <20230307095158.2818-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH resend] ASoC: SOF: Intel: hda-loader: use SOF helper
 for consistency
Message-Id: <167828354251.31859.15116670989434071759.b4-ty@kernel.org>
Date: Wed, 08 Mar 2023 13:52:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: 2ADCOD6DRMZZPREKKHGKF6BFLB5P5R53
X-Message-ID-Hash: 2ADCOD6DRMZZPREKKHGKF6BFLB5P5R53
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ADCOD6DRMZZPREKKHGKF6BFLB5P5R53/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Mar 2023 11:51:58 +0200, Peter Ujfalusi wrote:
> Update code to remove mix between legacy and SOF definitions. No
> functionality change.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda-loader: use SOF helper for consistency
      commit: 1d045d77756d07495ce379343455b1f829fe737d

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

