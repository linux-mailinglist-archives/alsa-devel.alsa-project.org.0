Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C069538DF
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 19:19:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFC692BCB;
	Thu, 15 Aug 2024 19:19:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFC692BCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723742351;
	bh=2tLBmPl6/ZD2JI0rRzUQa/PrcLuc9M22H+8IHhK6dXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KKMPzIUDa77Vvn8SMu9y4Mv2dMlXCx7qwpGLiW/A0+O0Kx6MhhLaGkWXuPS5pkX7g
	 d3LnlGSknEdyMQCtPEUEz+2qIHUifoUkjxQ+qnlr19zbK2hcjuxmxo4p4CcnqKPZzm
	 H3qEXpcTGVXu+ZQkHksj4qX/CKZbLe0JUyLQYMvs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CC48F805A1; Thu, 15 Aug 2024 19:18:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E954F80580;
	Thu, 15 Aug 2024 19:18:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97761F80423; Thu, 15 Aug 2024 19:18:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F3E1F800B0
	for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2024 19:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F3E1F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jqplYhig
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3DF66CE1CD6;
	Thu, 15 Aug 2024 17:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58ECCC32786;
	Thu, 15 Aug 2024 17:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723742302;
	bh=2tLBmPl6/ZD2JI0rRzUQa/PrcLuc9M22H+8IHhK6dXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jqplYhigypJkpdrEmbcpBrXXAy9ftTg9j/5lg6UPbC1+qRD6CmkO1MZZYcOpUauu7
	 NvEuKVGvNmC13fMCFPQdj6/7Q6+NLfDFMPyD9ixzN1pyvMjZhseZ8PdveAvedVBSOB
	 bOH9EsmdJtxZLXAPXNosXHKUqszdgSMUMmpkqDqsH9DlGPqrJXlGBKc0oFNkcK4ukA
	 ZyDlwBGxPRkiGt/YLN/wUC+xoAljTt+yqOAaHcn5b02GSj7vyQ3AnCgFdI52dx3pFC
	 C2M6x3bSyYca2a4vd6pFB6CFWOLns/Tom1H4xG5HEFBd2G7uB3dMQsvnHeONi7ZkxL
	 oXFOQBkefLKyg==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
 zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
 liam.r.girdwood@intel.com, jaden-yue@ti.com,
 yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
 henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com, Baojun.Xu@fpt.com,
 j-chadha@ti.com, judyhsiao@google.com, navada@ti.com,
 cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
 savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com, jesse-ji@ti.com,
 darren.ye@mediatek.com, antheas.dk@gmail.com,
 Jerry2.Huang@lcfuturecenter.com, jim.shil@goertek.com
In-Reply-To: <20240815042138.1997-1-shenghao-ding@ti.com>
References: <20240815042138.1997-1-shenghao-ding@ti.com>
Subject: Re: [PATCH] ASoc: tas2781: Remove unnecessary line feed and space
Message-Id: <172374229604.84465.4250281224291812315.b4-ty@kernel.org>
Date: Thu, 15 Aug 2024 18:18:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: P7ICRS3TP3ST2CZA2TGGNNQALT5BKILI
X-Message-ID-Hash: P7ICRS3TP3ST2CZA2TGGNNQALT5BKILI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7ICRS3TP3ST2CZA2TGGNNQALT5BKILI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 15 Aug 2024 12:21:35 +0800, Shenghao Ding wrote:
> Remove unnecessary line feed for tasdevice_dsp_create_ctrls,
> and remove two unnecessary spaces in tas2563_digital_gain_get
> and tas2563_digital_gain_put.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoc: tas2781: Remove unnecessary line feed and space
      commit: 0a9173541b3f8cde8ad923eebd2e157650e13f35

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

