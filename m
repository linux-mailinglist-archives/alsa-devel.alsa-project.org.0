Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC2177433D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 19:59:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7999F210;
	Tue,  8 Aug 2023 19:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7999F210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691517578;
	bh=COsy3V5ET+SU728KTKHgRVWYKNpkWiEh5qjoGjo8g1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AiTj8Bne7EyhQUmcWTTlYu+iEsUK55YtyvcjeKVRm1rnuETC6WZq4YhhuBnxoVGW7
	 mlWFr3Ha6ni+2+alow05zECg5pfNyVI8DCGBBW5/AqaLBfxH0MlBv2MZ815w0gSTqO
	 bHA/yh5EBOH+iZ/YmEV04pluIwovbBeqklpGn58Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62109F805B4; Tue,  8 Aug 2023 19:57:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3C88F805AE;
	Tue,  8 Aug 2023 19:57:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80315F8055C; Tue,  8 Aug 2023 19:57:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7273CF80538
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 19:57:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7273CF80538
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AAGVWqnq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 22CA562461;
	Tue,  8 Aug 2023 17:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65321C433C7;
	Tue,  8 Aug 2023 17:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691517429;
	bh=COsy3V5ET+SU728KTKHgRVWYKNpkWiEh5qjoGjo8g1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AAGVWqnqiWseR8/wFi19jekrtO0FhO7dzmKn96YkhNAUgIlD0Oa0cb+gwochbQvjV
	 tEih7Y8xR02k3XM6MDpq9QIMBs80mrXbQwEdyaHjWWpt44e8tYdDkGMYBp6HX0MM7+
	 eSpcU0SJZNoJQ5myqPJ5i3Fm+VWWg+uExKBNXys8R8H9jBB+2q7fSXbS2Z0/bE7VKF
	 OUiBTI1LHCv8QjUyEh3/BqVGZ0ZobSA1ekRp3Rr5fzZmFCVCE66hWqQCGL0Jkua4h0
	 5MP10ySHs8VwkGkYMJifwKZc6L/5QLLqmaXf5yt8kRKfr3CNjPcZRIjxTBIq00fYmu
	 uPf8FkYPyqAMQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, guennadi.liakhovetski@linux.intel.com,
 yung-chuan.liao@linux.intel.com, regressions@leemhuis.info
In-Reply-To: <20230808110627.32375-1-peter.ujfalusi@linux.intel.com>
References: <20230808110627.32375-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: intel: hda: Clean up link DMA for IPC3
 during stop
Message-Id: <169151742693.78353.2991484643013989552.b4-ty@kernel.org>
Date: Tue, 08 Aug 2023 18:57:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: SB3SEGUO7XT26JVLJXIZNZ2UPFKWBP4N
X-Message-ID-Hash: SB3SEGUO7XT26JVLJXIZNZ2UPFKWBP4N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SB3SEGUO7XT26JVLJXIZNZ2UPFKWBP4N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 08 Aug 2023 14:06:27 +0300, Peter Ujfalusi wrote:
> With IPC3, we reset hw_params during the stop trigger, so we should also
> clean up the link DMA during the stop trigger.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: intel: hda: Clean up link DMA for IPC3 during stop
      commit: 90219f1bd273055f1dc1d7bdc0965755b992c045

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

