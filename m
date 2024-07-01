Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE82C91E5CF
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 18:51:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C6EAE97;
	Mon,  1 Jul 2024 18:51:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C6EAE97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719852696;
	bh=Jr6KxU1uZSc1WvMCd1WtXZr02Xg+bpz2196Ms0qOUr8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tBqnvmgI2jWwX3RysXeWmLAu/Uasl3A5UQ1Q3rGQKlZGV+iajXytvqpXa9/7gN8TB
	 xCHTl4hW0evDMf7NhkOhDTXm/LIvzO157qOKBCmgawHEBVR9UTO3jMwTIl5y2P4Il6
	 WT1heX9mn2oeS3AVIaJaxIpN0EIbaNzfCd0BHp7I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A31AEF800E4; Mon,  1 Jul 2024 18:51:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4EF3F805AA;
	Mon,  1 Jul 2024 18:51:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 372CFF8028B; Mon,  1 Jul 2024 18:50:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 906FAF8003A
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 18:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 906FAF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mH8fNkUu
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 07F63CE19B2;
	Mon,  1 Jul 2024 16:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96DF1C116B1;
	Mon,  1 Jul 2024 16:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719852641;
	bh=Jr6KxU1uZSc1WvMCd1WtXZr02Xg+bpz2196Ms0qOUr8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mH8fNkUuawcN6VckXgd3GICxQdsjwe6qhkZbESxaJ/XXKCXSs0xDHv/8K3u2qVqXz
	 mpvH64N2c3R3qC9Xyx5DRKcyXEhooySpgTOecLE9EnDKxY+lQ03AVO3UM7aXMIzzsC
	 KRJVJeidw0nVxDB0mMsSIlO323DJKwnJtrUtRAFub2Un5RVRjC9nIYBe+xWLPuxPI1
	 1d51HOqRynUj5ipX5Wj8LwOQ4ttZMmznESRdvrmJyhECfcw9e4ogRaTlVhS37Xs/Ys
	 MTAXxX/JbqT9oDNlXEfVXhOQxBgzE4nZbl4CwvhpTIb05Wkiu9yoMoJ3Ldbkfo3ca2
	 +d/JzFfqSfc7g==
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
In-Reply-To: <20240629101112.628-1-shenghao-ding@ti.com>
References: <20240629101112.628-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoc: tas2781: Add name_prefix as the prefix name
 of DSP firmwares and calibrated data files
Message-Id: <171985263533.96334.14332115494301599710.b4-ty@kernel.org>
Date: Mon, 01 Jul 2024 17:50:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: ZURE5ILNJLGCZN7YNJFAG7DPMVEV7VLW
X-Message-ID-Hash: ZURE5ILNJLGCZN7YNJFAG7DPMVEV7VLW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZURE5ILNJLGCZN7YNJFAG7DPMVEV7VLW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 29 Jun 2024 18:11:10 +0800, Shenghao Ding wrote:
> Add name_prefix as the prefix name of DSP firmwares
> and calibrated data files which stored speaker
> calibrated impedance.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoc: tas2781: Add name_prefix as the prefix name of DSP firmwares and calibrated data files
      commit: 55f0a1fa6ea4e339c797e9a3292ca0caa4ab3885

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

