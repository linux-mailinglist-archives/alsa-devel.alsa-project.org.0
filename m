Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCE2773150
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:36:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24FF1832;
	Mon,  7 Aug 2023 23:35:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24FF1832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691444165;
	bh=5GQJ0wCGeanBg8sj0enOBlN2hLHdwRvHsgS6oE02LNw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MELvtXegns4p99eLRCb2Isgt9T0Kf0dKECFbE06zYvqs0eDr+Zd2z/LLte95D9fGa
	 LLucMCdst8AY/nbITvLOvr+r+la9xjExALq1WJTzlzatyy0g2Ia0JZrDF0gfhLm2OL
	 du1Tv/cPdbvDo+TEbrHEshSRP64ccndAOy78o6lE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A70BF8051E; Mon,  7 Aug 2023 23:34:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EA00F80549;
	Mon,  7 Aug 2023 23:34:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9206F8016D; Mon,  7 Aug 2023 23:34:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FC9CF80116
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FC9CF80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fP04lBFa
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EEB0C6225D;
	Mon,  7 Aug 2023 21:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B52C433C7;
	Mon,  7 Aug 2023 21:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691444052;
	bh=5GQJ0wCGeanBg8sj0enOBlN2hLHdwRvHsgS6oE02LNw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fP04lBFaQcaP5NL8aPIeIYn+l/YpB1V1f+ZL258OAcfC/9zjhn/Wp+kXc6A/VPaex
	 r/orglspj+m3V5S+PkSw2VamqpsmUGz7x0b7PCAiRaTYd2z3xnEUp6ra6d2enzbkN2
	 /a2QJl8rnB2L0zHaR+MGYTmd9hcfgIrBCZt1W19RLpI+W/B06tV9iTpst6qPj69bFq
	 JOuWYkqv72MG1FjTZOufPtOMTZH4r6633pMfqazRRnhRSVkYs/o+C5WczPWcffNVVO
	 O7r9FD2c22hv9CoBEfq5TmxE8aUZjnWLRoidC+r5/MSacmKwkR2FLAn++JRVHUfLhd
	 TDzYcZ+EBo9sw==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Hans de Goede <hdegoede@redhat.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <20230805171435.31696-1-hdegoede@redhat.com>
References: <20230805171435.31696-1-hdegoede@redhat.com>
Subject: Re: [PATCH v2] ASoC: lower "no backend DAIs enabled for ... Port"
 log severity
Message-Id: <169144405109.324168.4261109077312670482.b4-ty@kernel.org>
Date: Mon, 07 Aug 2023 22:34:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: 4X4OJOGTTSPUD757A3R3ZSWBPHRCY33T
X-Message-ID-Hash: 4X4OJOGTTSPUD757A3R3ZSWBPHRCY33T
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 05 Aug 2023 19:14:35 +0200, Hans de Goede wrote:
> If SNDRV_PCM_IOCTL_PREPARE is called when the mixer settings linking
> frontend and backend have not been setup yet this results in
> e.g. the following errors getting logged:
> 
> [   43.244549]  Baytrail Audio Port: ASoC: no backend DAIs enabled for Baytrail Audio Port
> [   43.244744]  Baytrail Audio Port: ASoC: error at dpcm_fe_dai_prepare on Baytrail Audio Port: -22
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: lower "no backend DAIs enabled for ... Port" log severity
      commit: 1f566435141047ca7db26aa4b0b6647a25badaee

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

