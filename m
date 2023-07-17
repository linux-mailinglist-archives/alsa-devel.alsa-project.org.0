Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC7E756BA6
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 20:16:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A200DEE;
	Mon, 17 Jul 2023 20:16:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A200DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689617812;
	bh=OmMKDjWAGS0CdP7PK45ZzftVRbXmwhJuz0GNS0T+drM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U/XgDw2xO2GE75RbCSgdOZqCKuRdRdn7a4Noioi1ZtljtWd2sG0X/LAl7hDcyiDKn
	 wUtBRTkYLSq0Ud8sojxerfKhKOX40Gm/tDR9IPY5qW1/ZSwSvASnvy6NGMbco8I+hI
	 6oaItZy62T6rUu5sDlo30KyXT39P4XEP/1X0V5XM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11B12F80494; Mon, 17 Jul 2023 20:15:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6465AF80494;
	Mon, 17 Jul 2023 20:15:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4859DF8032D; Mon, 17 Jul 2023 20:15:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD1CCF8027B;
	Mon, 17 Jul 2023 20:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD1CCF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vL3kOgoX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0ABD7611C0;
	Mon, 17 Jul 2023 18:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC103C433C9;
	Mon, 17 Jul 2023 18:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689617695;
	bh=OmMKDjWAGS0CdP7PK45ZzftVRbXmwhJuz0GNS0T+drM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vL3kOgoXcNqDwcsiB4NA1MXYnWRLMa2oZrr86MKOBFytI6r6L73O/YDOyRITDNQ0m
	 S0Lii6T7KprSe6hRT/AXA/tyYAw5S8Y6fjtZ1Ikk3kQ2gixv0qIDQUbuBqtNzgJJhy
	 fVuMqgNffOTO8XOtPOqEcfDFmmltxBqlByqLr8FuBI+ovuZ/VFnBBO9MXGsfXz2goD
	 mbAnj35sgywOib+DkXucQQYVu/2VJZTlfwb7l6/Mx8/VplihpDMxlc2FDP2waWomOl
	 UEeZDbjtHJNrYc/L0S51KA6Z3dbKPUtIaxXbLZ1+q70RfaaQ6t7nTfg7bMDAS2Gj2F
	 +U/tuEB2sEogQ==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org
In-Reply-To: <74148292-ce4d-4e01-a1a7-921e6767da14@moroto.mountain>
References: <74148292-ce4d-4e01-a1a7-921e6767da14@moroto.mountain>
Subject: Re: [PATCH] ASoC: SOF: ipc3-dtrace: uninitialized data in
 dfsentry_trace_filter_write()
Message-Id: <168961769268.448315.12624204835673463699.b4-ty@kernel.org>
Date: Mon, 17 Jul 2023 19:14:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: WEKYB4FPVA5BB26SMY2STW6HPLZXILBW
X-Message-ID-Hash: WEKYB4FPVA5BB26SMY2STW6HPLZXILBW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WEKYB4FPVA5BB26SMY2STW6HPLZXILBW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 07 Jul 2023 14:25:23 +0300, Dan Carpenter wrote:
> This doesn't check how many bytes the simple_write_to_buffer() writes to
> the buffer.  The only thing that we know is that the first byte is
> initialized and the last byte of the buffer is set to NUL.  However
> the middle bytes could be uninitialized.
> 
> There is no need to use simple_write_to_buffer().  This code does not
> support partial writes but instead passes "pos = 0" as the starting
> offset regardless of what the user passed as "*ppos".  Just use the
> copy_from_user() function and initialize the whole buffer.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc3-dtrace: uninitialized data in dfsentry_trace_filter_write()
      commit: 469e2f28c2cbee2430058c1c9bb6d1675d7195fb

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

