Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A4395D96D
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Aug 2024 01:00:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCBA3839;
	Sat, 24 Aug 2024 01:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCBA3839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724454013;
	bh=YEWlAW8EptzlDgh1PYX50kGePpNqMzTDiwHO2I5Gl2k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mJ95Fc65wgMTXjoDa78FcqbmXcYi4kVbO/Iivp7t+VC3flCZPNTHkvJ7KW/itL/Sb
	 DrjqMvXJrxRsxV4vsyAUJCLAPG3ziGydB01FccAyEVKwYo7MZcYUpEiUtkKfissSrU
	 v4ia5j5RmeUq/Xc66O70tUo3ZmB6K+vCBC6CPFsM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30E75F805B0; Sat, 24 Aug 2024 00:59:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90431F805AF;
	Sat, 24 Aug 2024 00:59:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE8A7F8049C; Sat, 24 Aug 2024 00:57:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05A63F800F0
	for <alsa-devel@alsa-project.org>; Sat, 24 Aug 2024 00:57:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05A63F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gDMHd7MU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C48EDCE124A;
	Fri, 23 Aug 2024 22:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA751C32786;
	Fri, 23 Aug 2024 22:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724453827;
	bh=YEWlAW8EptzlDgh1PYX50kGePpNqMzTDiwHO2I5Gl2k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gDMHd7MUyLQN+4VWO6M6ZxUMojaZYC+CQLngo6j60NPuhhoi5GQO/LmfpGXA06vYN
	 OL1HGk6wEJpCWVLIJV5T72eeZUcA8F7IPoUWrHmeRoFjvwj4DZGxzPmpVqX47mQULM
	 rNWR7pAIkWHHghTtdeHHyPS6DBvseCwFknvv/4tEh4lwOX/G3tBbWrPu3NMe7J1gEQ
	 c1Hf/EdxqLa/UT4NmOL+co9xdrZpq2h022oPHlCaiFb+WLQ4ZhsgIIEjuxoFzyMFMw
	 zg3YWuQzE5QpFVAcA0JFeG+jf14+/ln+Y2Vx5BpOQg0xxujKoB8y/jzravjl14u2sL
	 cHzke2vv9lyog==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 stable@vger.kernel.org
In-Reply-To: <20240823074217.14653-1-hdegoede@redhat.com>
References: <20240823074217.14653-1-hdegoede@redhat.com>
Subject: Re: [PATCH 6.11 regression fix] ASoC: Intel: Boards: Fix NULL
 pointer deref in BYT/CHT boards harder
Message-Id: <172445382406.842154.866595904815365634.b4-ty@kernel.org>
Date: Fri, 23 Aug 2024 23:57:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: YE3JYQSBC3LJFSC5TVENDWDLG6WUD3MQ
X-Message-ID-Hash: YE3JYQSBC3LJFSC5TVENDWDLG6WUD3MQ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YE3JYQSBC3LJFSC5TVENDWDLG6WUD3MQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 23 Aug 2024 09:42:17 +0200, Hans de Goede wrote:
> Since commit 13f58267cda3 ("ASoC: soc.h: don't create dummy Component
> via COMP_DUMMY()") dummy codecs declared like this:
> 
> SND_SOC_DAILINK_DEF(dummy,
>         DAILINK_COMP_ARRAY(COMP_DUMMY()));
> 
> expand to:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: Boards: Fix NULL pointer deref in BYT/CHT boards harder
      commit: 0cc65482f5b03ac2b1c240bc34665e43ea2d71bb

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

