Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 266F795A164
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 17:29:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5977D839;
	Wed, 21 Aug 2024 17:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5977D839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724254173;
	bh=tOqJ4Sp3k8TWd0V/CZ/nJlVfE8iwPi5+JHFivu0fwAQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ptfgiO4BVSeZoRA8TKm5lS17onBp60evWiOXT2HKDOrTE+M6uxpVtNXiMy75Y0hqE
	 AAKiXdjDMNAFjaA37pyCJXcC0O+Sdt/l9H0najBKvaqptS1GYee5vy6ockhf+pX7/U
	 NQEgiwaiWAoAK25+jgHqbcY2SrKVAJmaFUkzlX04=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A49EF8060F; Wed, 21 Aug 2024 17:28:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAE59F8061B;
	Wed, 21 Aug 2024 17:28:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66049F80496; Wed, 21 Aug 2024 17:27:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 505B1F80494
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 17:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 505B1F80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Xwr1NtCB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D5C361040;
	Wed, 21 Aug 2024 15:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D15AC4AF09;
	Wed, 21 Aug 2024 15:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724253887;
	bh=tOqJ4Sp3k8TWd0V/CZ/nJlVfE8iwPi5+JHFivu0fwAQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Xwr1NtCBzKXAPLdGfkMp0pnkvuULQ86fqbaW17IIvnKq8izRQHxY7dSSUKzV4p+im
	 G3mw7dAd6Fn1xJxwaQb35rGv43Yw9ZLHIinhntRTmkSWkSyWsa4IU+FGN9abDvM3zA
	 QnXg98rSCrHTED3kM+2jfwgHz9BqQZCrP7IDzY0d9AsWjLjFubVnkTeQ0m1By+JxMc
	 5Jxc6jwy0TQmtHNbG1VkisrL5BGc7wq+FeMvgx+bQkAWfn+kLmSbVw2wYGVNbKd+Z0
	 QFDpFIkbkPp7tGRO6FmqG25qpBVe+KJar9ZMFd7zyyIenp3yDqJHxgu3ZnXATi8kxg
	 AwfSGBmz1t3Fg==
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
 zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
 liam.r.girdwood@intel.com, jaden-yue@ti.com,
 yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
 henry.lo@ti.com, tiwai@suse.de, Baojun.Xu@fpt.com, judyhsiao@google.com,
 navada@ti.com, cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
 savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com, jesse-ji@ti.com,
 darren.ye@mediatek.com, antheas.dk@gmail.com,
 Jerry2.Huang@lcfuturecenter.com, jim.shil@goertek.com
In-Reply-To: <20240821072527.1294-1-baojun.xu@ti.com>
References: <20240821072527.1294-1-baojun.xu@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Remove unnecessary line feed for
 tasdevice_codec_remove
Message-Id: <172425388198.1704682.13904947014009773175.b4-ty@kernel.org>
Date: Wed, 21 Aug 2024 16:24:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: WQIQP2OLINQVPXJYXEQSW7XC55GAYV53
X-Message-ID-Hash: WQIQP2OLINQVPXJYXEQSW7XC55GAYV53
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WQIQP2OLINQVPXJYXEQSW7XC55GAYV53/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Aug 2024 15:25:27 +0800, Baojun Xu wrote:
> Remove unnecessary line feed for tasdevice_codec_remove.
> Add comma at the end the last member of the array.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Remove unnecessary line feed for tasdevice_codec_remove
      commit: 8a8dcf702673787543173b8ac5dafae2f7f13e87

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

