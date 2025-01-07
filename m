Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B763EA03E62
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2025 12:58:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4394060381;
	Tue,  7 Jan 2025 12:58:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4394060381
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736251133;
	bh=q0oEMukauLvdlEr9wXzIEd+rWoj+Dc1texb3YrvSzQE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k82JrVK1FhlqhaTQP6eMGg/LCDgdvKUktq/IEyfl34uQhL/Hfun7WS0dnm8VHmfVM
	 rBMDYdY7zQFHQ9pDlulQQDUcRJ8Sk7bVYa8Np3spxWGi4WyF4Mi7cHtuDJBD4Dq2uD
	 OaXT4eYwG0rNwklqd0TDJOTPeXlx9Zp58Vfrg1eM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C90AF805BB; Tue,  7 Jan 2025 12:58:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DC94F805BB;
	Tue,  7 Jan 2025 12:58:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EB88F801D5; Tue,  7 Jan 2025 12:58:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77395F8001E
	for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2025 12:58:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77395F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FP//NdwE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 08E54A40C07;
	Tue,  7 Jan 2025 11:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD94C4CED6;
	Tue,  7 Jan 2025 11:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736251092;
	bh=q0oEMukauLvdlEr9wXzIEd+rWoj+Dc1texb3YrvSzQE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FP//NdwENVnR7GLP+LyWhQJTq3EHna0hsGpaAQMATpNhyVKEySjQGrR43biv5VBI3
	 /tB+ob7mW80JliYWcwNm8N1FHIazkjnTco1OAL3eJWnxOCpEy2p/ydlX5VKjUmw5hn
	 F1bg5SknACS4sNQev2NotLbY3uQyTqVqBiWdg1zhE4bYosFOEwxPRxj5qnjoU0E/io
	 dz7dcEci5hZ/qAIq63WGx8UTY1PDTt6LHcjdRCyJyheD1Qjo8GST+uyxJIXxxp4cDu
	 8ayVq49/HHSQSpk5MTkk56twpWXbkwvw1bdEP4yWRAt5jMshx+NY9bDe3mZRw8RvTc
	 yG2cSkRz5QAxA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
 yangxiaohua@everest-semi.com, zhuning@everest-semi.com
In-Reply-To: <20241230032752.108298-1-zhangyi@everest-semi.com>
References: <20241230032752.108298-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH] ASoC: codecs: ES8326: Adjust ANA_MICBIAS to reduce pop
 noise
Message-Id: <173625109098.23747.3321481870636975691.b4-ty@kernel.org>
Date: Tue, 07 Jan 2025 11:58:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
Message-ID-Hash: BAT4TBKKZNNTCCA4TPE2XJJOGE4KMMQT
X-Message-ID-Hash: BAT4TBKKZNNTCCA4TPE2XJJOGE4KMMQT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BAT4TBKKZNNTCCA4TPE2XJJOGE4KMMQT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 30 Dec 2024 11:27:52 +0800, Zhang Yi wrote:
> We modify the value of ES8326_ANA_MICBIAS to reduce the pop noise
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: ES8326: Adjust ANA_MICBIAS to reduce pop noise
      commit: b1d4ac91a9246d7fb1906b2f38f529b097884c8e

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

