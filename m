Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA85E92FED2
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2024 18:52:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D40C1A4A;
	Fri, 12 Jul 2024 18:52:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D40C1A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720803161;
	bh=NunoeZtgEB7m2qmzgxHSz4ZGe+euAKHwYFP/rBZ8Bx0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qGy8RUsUj2NqN4vSRFRzgMcvbGrYO/7b8NkD5mjBOF0T7RtiFpQXNiGInTlSKNHdt
	 xoBmTD8TQvR9IGTw/TwD4GN/z/J5g0rARI3T2Lb9qCJZeuqHGstYBdUC0fqxsT5nj1
	 jQvkOscL/HcMnmPLOZ9DalnE6wrFhl8pKpoGeIQU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E3EAF805C1; Fri, 12 Jul 2024 18:52:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4DFAF805AD;
	Fri, 12 Jul 2024 18:52:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3C69F801F5; Fri, 12 Jul 2024 18:43:41 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D0B6F800FA
	for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2024 18:38:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D0B6F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MtXLypBy
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FB3E61F06;
	Fri, 12 Jul 2024 16:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D4CC32782;
	Fri, 12 Jul 2024 16:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720802289;
	bh=NunoeZtgEB7m2qmzgxHSz4ZGe+euAKHwYFP/rBZ8Bx0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MtXLypByEcan+P5AnZxQYTNpl2+3Yc0BnHSWwPJ3+9eK/s19ti4VnG5qsp1dlPm5v
	 W8cAMvrQssfM1du1hi2nB4golZuQPsZ2bY8GBb+G8qFe2RA1IkQCxhVfQOOCb1Veym
	 2+f5WL8ywNk20zkoKyTfW25Bmqpv8vtfdSXpWZHibZUdZ1M1zBCVNx+GqcrrxPo//z
	 vl+Cio2m22hZvpoODBZFRroIndlXzq4F2uQlTdkQ5O346D9VwCoUofCVAJsAChZZa3
	 OoJ5WSjkZXZ0NZ3c1v+3cOGPj7dOwt2OlbpVg//oPDtSbH4nw6mo2xTUBIelOgO9oX
	 V3qwBJMQRxK6Q==
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
In-Reply-To: <20240710064238.1480-1-shenghao-ding@ti.com>
References: <20240710064238.1480-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v2] ASoc: tas2781: Add new Kontrol to set tas2563
 digital Volume
Message-Id: <172080228320.548034.2855852943661036499.b4-ty@kernel.org>
Date: Fri, 12 Jul 2024 17:38:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: S3ZMQW3OQWVZBTHOPTGYIPFQBK4FNSX5
X-Message-ID-Hash: S3ZMQW3OQWVZBTHOPTGYIPFQBK4FNSX5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S3ZMQW3OQWVZBTHOPTGYIPFQBK4FNSX5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 10 Jul 2024 14:42:37 +0800, Shenghao Ding wrote:
> Requriment from customer to add new kcontrol to set tas2563 digital
> Volume
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoc: tas2781: Add new Kontrol to set tas2563 digital Volume
      commit: 75ed63a5ab5d1d2872c735bc7edf8fef0e2fa2ea

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

