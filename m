Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 264D69411F9
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 14:35:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67182847;
	Tue, 30 Jul 2024 14:34:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67182847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722342905;
	bh=V/nbNoqv4wBou6TF1sx+EObG/PtT6EvyCtHrdI+QisE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l8E0JNz1v2DVTRn+QeLywVVp4znK1AD340lvSrK6rHBbUIwTdi2uLJy8AWB1OcNXJ
	 0OOr8OR3kNNOtf/XiWepapp4nb20xUWJo32Hg+Muydt1Lmhs82tS5bLrFcxIx+QNL0
	 YvorDTwUmt67nSGF3pv+yuSWbhIQmM4pX+t2YXBk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04803F805B4; Tue, 30 Jul 2024 14:34:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79230F805AF;
	Tue, 30 Jul 2024 14:34:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6156DF802DB; Tue, 30 Jul 2024 14:30:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D31A1F800C9
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 14:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D31A1F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=r33BRLTK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 48221CE0F21;
	Tue, 30 Jul 2024 12:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E704BC32782;
	Tue, 30 Jul 2024 12:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722342579;
	bh=V/nbNoqv4wBou6TF1sx+EObG/PtT6EvyCtHrdI+QisE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r33BRLTKwEekcwKuJ0gmmWPeTJtBAlNJGrvj+DcmfDGRZgS6G1wvRBCDXmwtwB8ZP
	 0AV+TOGFa3OyzQQDGlk1kiB0CMlvX61ccvMtOYXe10Ey9E0fX/HXZ4DlueXDlxbBce
	 J87JwnbFrt0RYvEIqNkH7dl5qsuVOD0csfQx2lK9kcATMQl8TmvGyT8TcyJYcqmutA
	 Bm2RApsIfwNsVhCQrU7HBv9uiwSPuUPYMEt++CxkgRfhgHbYmf2EVmAI5+QkTiax4l
	 oVq92rbMMlTI6DsYGi5k7g9Hd5ju00FgsLqyJbIR29ke/Z2KRE0P0ngdWBXrGMT68S
	 XaifEsuJ6K3kA==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
 zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
 linux-kernel@vger.kernel.org, j-chadha@ti.com, liam.r.girdwood@intel.com,
 jaden-yue@ti.com, yung-chuan.liao@linux.intel.com, dipa@ti.com,
 yuhsuan@google.com, henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com,
 soyer@irl.hu, Baojun.Xu@fpt.com, judyhsiao@google.com, navada@ti.com,
 cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
 savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com, jesse-ji@ti.com,
 darren.ye@mediatek.com, antheas.dk@gmail.com
In-Reply-To: <20240716064120.158-1-shenghao-ding@ti.com>
References: <20240716064120.158-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoc: tas2781: Add TAS2563 into the Header
Message-Id: <172234257365.30842.9603736031579487587.b4-ty@kernel.org>
Date: Tue, 30 Jul 2024 13:29:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: POI7IZC6QRPIN7KWGQDABXO7N6NDMMBP
X-Message-ID-Hash: POI7IZC6QRPIN7KWGQDABXO7N6NDMMBP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/POI7IZC6QRPIN7KWGQDABXO7N6NDMMBP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 16 Jul 2024 14:41:17 +0800, Shenghao Ding wrote:
> Add TAS2563 into the Header in case of misunderstanding and add
> channel No information for error debug in tasdevice_dev_read.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoc: tas2781: Add TAS2563 into the Header
      commit: e620b496c78706bb71691502e0381eb344afeaea

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

