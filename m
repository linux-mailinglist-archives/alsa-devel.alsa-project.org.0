Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BAC8FB186
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 13:56:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFCD8DFA;
	Tue,  4 Jun 2024 13:56:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFCD8DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717502200;
	bh=5xynS5Cwt54RsRZeRgz/DpPruiYlzjttr/9pT7oZPno=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kRYbPVJItfX7ZqVoJFFnlkfBUhIQKIjYJC/stQEf0b57jmL3BIb2XDOLahGMvp0Ux
	 HbBlGFB8zhtJ094Xgn8MNL5ug7HcMTrhPsGSxY0K9qp39eit8LPH6uGmUOc1VDKiU0
	 vrl7G/gIoULLtFCff5C2zORUIyLpLUsgJwyax5/E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12A40F805BA; Tue,  4 Jun 2024 13:56:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52312F805BA;
	Tue,  4 Jun 2024 13:56:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69462F805B1; Tue,  4 Jun 2024 13:54:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65689F805AB
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 13:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65689F805AB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DMb/3XWa
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F1513CE1117;
	Tue,  4 Jun 2024 11:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2239FC4AF08;
	Tue,  4 Jun 2024 11:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717502068;
	bh=5xynS5Cwt54RsRZeRgz/DpPruiYlzjttr/9pT7oZPno=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DMb/3XWaUQb2OqrloX95cD48ThhwqczuEgmSk2o7Qqs32NJSz1IfNix1wNRaxtFu9
	 F14B0kufDCtZoMyiI+Yzdi3oKvUonPRresoiNSrTjN5RaJ2yLAES3kuoN/PBf5Bls4
	 JkF4JfcQu6KX+AqAVTtCvh/+yRznuLHJKaXFhLlrZQ+8Y3JnmMZBDF29qTGXZZ9k/O
	 EdVsMWrz1VtUumhnXsCsz3quAYZTjgMVVm/UIjIak0hO6lrIjffr+Mf0VI4NL1nHcJ
	 IV4HjS4OPj3IZpikLvlGgZjZZ0FZCzf1uTVeLy9kNuYlA8KXf/T4g+EAFGEFynfAZZ
	 JYhTUH8cKz2/w==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240602-md-snd-fsl-imx-pcm-dma-v1-1-e7efc33c6bf3@quicinc.com>
References: <20240602-md-snd-fsl-imx-pcm-dma-v1-1-e7efc33c6bf3@quicinc.com>
Subject: Re: [PATCH] ASoC: fsl: add missing MODULE_DESCRIPTION() macro
Message-Id: <171750206485.24919.11440040605308557644.b4-ty@kernel.org>
Date: Tue, 04 Jun 2024 12:54:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: 5DAJCVPSGTQTLZ2MYVUHDBMXNEAY3GUU
X-Message-ID-Hash: 5DAJCVPSGTQTLZ2MYVUHDBMXNEAY3GUU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5DAJCVPSGTQTLZ2MYVUHDBMXNEAY3GUU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 02 Jun 2024 10:00:27 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/fsl/imx-pcm-dma.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: add missing MODULE_DESCRIPTION() macro
      commit: 7478e15bcc16cbc0fa1b8c431163bf651033c088

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

