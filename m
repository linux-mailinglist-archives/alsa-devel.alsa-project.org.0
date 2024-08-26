Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1593195F937
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2024 20:52:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 462D73E7;
	Mon, 26 Aug 2024 20:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 462D73E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724698360;
	bh=iRencXgJAbBojNemkkFVzXL3ZSUJ+fguE/kEQC2n3Ic=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rJqECzox7JlST9BaeAexmHscqGbGGE4liyiwgkHjWblR5c+SNmkyKCfbL8UvCaigD
	 vMnpMLijCj/oxbHzb5Z8ErgHq+MSjOEYApXwI381RHtmqRT9KAKlwvsEBHWqGicXzn
	 sN+LKCnhGLl41objLnObdstvXOZpSGogySvK43m0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAA86F805E6; Mon, 26 Aug 2024 20:52:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02B8BF805BA;
	Mon, 26 Aug 2024 20:52:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D94AF80494; Mon, 26 Aug 2024 20:46:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 045FCF80301
	for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2024 20:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 045FCF80301
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tu4egTkv
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 65A06A40A4D;
	Mon, 26 Aug 2024 18:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29813C4E68D;
	Mon, 26 Aug 2024 18:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724697350;
	bh=iRencXgJAbBojNemkkFVzXL3ZSUJ+fguE/kEQC2n3Ic=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tu4egTkvC4QCGA667BwVh8/pwpOBek5WiG//Lqk+R2Iya2todSYO+c3NX5SZK55MF
	 FHUamumsfYA5iz5PeFis/5W1LKgLYsnzDeJ1XTrbAD88iA3xyirntfpN2Ffpo6nSlz
	 5GUClErhMhVnKjyK+FUB3iZyk3m63fzz4NXCPIHbeR56ziShcG+elnCgZbmC1B7lFw
	 mm6PkaE6AJ61FOCSSyREHOWreqmyNXOOanvxiSrDFtTX2sXOzDGX17I9yrWC8ZicSF
	 f36pLttQ+giE2XeWZoWFh1Ngrh9dg9vIEidXZ/Zjs1piQeqRm63y+9qzKyCG/YjUC5
	 Gj9YdgHnC4RwQ==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
 zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
 liam.r.girdwood@intel.com, jaden-yue@ti.com,
 yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
 henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com, Baojun.Xu@fpt.com,
 judyhsiao@google.com, navada@ti.com, cujomalainey@google.com, aanya@ti.com,
 nayeem.mahmud@ti.com, savyasanchi.shukla@netradyne.com,
 flaviopr@microsoft.com, jesse-ji@ti.com, darren.ye@mediatek.com,
 antheas.dk@gmail.com, Jerry2.Huang@lcfuturecenter.com, jim.shil@goertek.com
In-Reply-To: <20240824060503.1259-1-shenghao-ding@ti.com>
References: <20240824060503.1259-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v2] ASoC: tas2781: replace devm_kzalloc and scnprintf
 with devm_kstrdup
Message-Id: <172469734297.858128.4732116638399885457.b4-ty@kernel.org>
Date: Mon, 26 Aug 2024 19:35:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: ZOPJK2G5R6HJ3LYQ22LLPZ3L26KFTGVL
X-Message-ID-Hash: ZOPJK2G5R6HJ3LYQ22LLPZ3L26KFTGVL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZOPJK2G5R6HJ3LYQ22LLPZ3L26KFTGVL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 24 Aug 2024 14:05:00 +0800, Shenghao Ding wrote:
> Replace devm_kzalloc and scnprintf with devm_kstrdup.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: replace devm_kzalloc and scnprintf with devm_kstrdup
      commit: c8dc1016ba0e249e45863c1da3b951efe7c4214a

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

