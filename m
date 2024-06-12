Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5D9905CB2
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 22:21:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36332E66;
	Wed, 12 Jun 2024 22:21:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36332E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718223706;
	bh=VF8TXFGMOrc2cxAUxWDWimJvw5tB56D41Lk1keK3LeY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GFBblitYeMD2ZgdwP53WmuI0ziPfwPNzEPNdlep7MBZ1o11N2ws8EnpfmDYrCKn9i
	 1+z9nsAajtqT5oHB2eMbZpGlocFZZ6OE+MNpzyAwpTdr+j4wZnkOKhmtAWZdFLEGEO
	 8Ac6uQkff14OHBpJgijJfa6NsQDmDVNjl/XOlqTs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8383BF805A0; Wed, 12 Jun 2024 22:21:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB6EFF805A0;
	Wed, 12 Jun 2024 22:21:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23BEFF8057A; Wed, 12 Jun 2024 22:21:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B6D7F80496
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 22:21:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B6D7F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=URn75nSC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A43DA608D4;
	Wed, 12 Jun 2024 20:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD16C116B1;
	Wed, 12 Jun 2024 20:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718223664;
	bh=VF8TXFGMOrc2cxAUxWDWimJvw5tB56D41Lk1keK3LeY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=URn75nSC/5cJcxRzqWCubCrsZPUXg+sQT5quwWqRXU9XoCocneYRWaQXa+HrxUI/9
	 4/VyuQaMxztk7v9bKgw/f5E56QBqxmXd2th+W/m8cyde09j+WHqe3pAN4RHI5rbXlJ
	 hJ82/sz4V1lNPDYlW4si+Se31a3cOF6t6neKxAvx5evZPi2TpmjZqUnNGJxlCT9jLn
	 JmfHI3DkUFoZ1IwU1q6sLEdzw7RkOrFXh7GMLrCWOTSseA/rPq5+HgeAj6XLcYtnpg
	 PX3E/Mg/wmWwfoxawleZuSrJC9vbAn9HWM8jAolAiQtap2RUqylNTu/7UH7ILLv8ZM
	 N5DumOTsT3cZw==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Jai Luthra <j-luthra@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Devarsh Thakkar <devarsht@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20240610-asoc_next-v2-0-b52aaf5d67c4@ti.com>
References: <20240610-asoc_next-v2-0-b52aaf5d67c4@ti.com>
Subject: Re: [PATCH v2 0/2] Fixes for McASP and dmaengine_pcm
Message-Id: <171822366136.240528.8303514508385610793.b4-ty@kernel.org>
Date: Wed, 12 Jun 2024 21:21:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-4c370
Message-ID-Hash: ZIJDPAXXADHXUH2NHF5NJSL62N2OUGDQ
X-Message-ID-Hash: ZIJDPAXXADHXUH2NHF5NJSL62N2OUGDQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZIJDPAXXADHXUH2NHF5NJSL62N2OUGDQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 10 Jun 2024 16:25:59 +0530, Jai Luthra wrote:
> This series fixes two patches:
> 
> 1. Fix the dmaengine API usage by calling dmaengine_synchronize() after
>    dmaengine_terminate_async() when xrun events occur in application
> 2. Use the McASP AFIFO property from DT to refine the period size,
>    instead of hardcoding minimum to 64 samples
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ALSA: dmaengine: Synchronize dma channel in prepare()
      (no commit info)
[2/2] ASoC: ti: davinci-mcasp: Set min period size using FIFO config
      commit: c5dcf8ab10606e76c1d8a0ec77f27d84a392e874

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

