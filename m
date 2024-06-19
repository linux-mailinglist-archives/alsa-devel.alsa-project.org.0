Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD0790E8BB
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 12:55:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4916B65;
	Wed, 19 Jun 2024 12:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4916B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718794510;
	bh=WLiVIcEsI1MsoU/pGfWwCO4FNjNshUkTXjY2D+QEGRM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=meSPPTvUjTwmjqgSrKaqNjlxa0OOEmSpo/lflaSOSbJvQG2rpqmfu/Be30TB4yUWQ
	 7nSfwIEnbQC1HLuR93VZRkRNDIPaEYgf2suTFBZ+2oZkV9kUMAPMYY8QvwDh5CMvHX
	 RWfCSr8fQA0YdNBoWruyQWF4TV1Upe7KIYiW72sg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBADFF805AB; Wed, 19 Jun 2024 12:54:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB342F805AF;
	Wed, 19 Jun 2024 12:54:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 721C7F8023A; Wed, 19 Jun 2024 12:54:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8E75F8010C
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 12:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8E75F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SD0Kheyq
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1CAE61D40;
	Wed, 19 Jun 2024 10:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE351C32786;
	Wed, 19 Jun 2024 10:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718794462;
	bh=WLiVIcEsI1MsoU/pGfWwCO4FNjNshUkTXjY2D+QEGRM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SD0Kheyq2Me0xq6d66yqChXOJfd5Vn5tqqefdyQ8dtLeW4BOCOYAtZHq9kFFZCo9f
	 i8/+9sgsGnbEPY8J8DZaXK6L4n7/3nxPARNhHsNiLpjwCF89PCX6/8FNwpeZZMop47
	 yv/GA0bEJWjoetNtQ6E+b/I2hOQyhUMNau151eh0dmnLBAWQAwk3rzhIM5asYHkPWI
	 2wcvWePLpRzAHOqFG5Jo3AMvvfkIkp9ZRETOF26vP9beWWZKFPrg7Y/B6d+B1QnNDM
	 2poWtcuRdm4I/VUdIAMosBQ/4ZMYjcixUvhVydks58D8FztUSYWXCG3dlrUi+eXup7
	 ZGToiwKURDdrg==
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
 darren.ye@mediatek.com
In-Reply-To: <20240614133646.910-1-shenghao-ding@ti.com>
References: <20240614133646.910-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v5] ASoc: tas2781: Enable RCA-based playback without
 DSP firmware download
Message-Id: <171879445548.57943.2834143802060399469.b4-ty@kernel.org>
Date: Wed, 19 Jun 2024 11:54:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: KLUFPZUHDF5AU43MBSD366WPXBPWXTYO
X-Message-ID-Hash: KLUFPZUHDF5AU43MBSD366WPXBPWXTYO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KLUFPZUHDF5AU43MBSD366WPXBPWXTYO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 14 Jun 2024 21:36:45 +0800, Shenghao Ding wrote:
> In only loading RCA (Reconfigurable Architecture) binary case, no DSP
> program will be working inside tas2563/tas2781, that is dsp-bypass mode,
> do not support speaker protection, or audio acoustic algorithms in this
> mode.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoc: tas2781: Enable RCA-based playback without DSP firmware download
      commit: 9f774c757e3fb2ac32dc4377e8f21f3364a8df81

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

