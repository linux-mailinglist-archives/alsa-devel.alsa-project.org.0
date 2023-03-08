Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 475226B0A1F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 14:56:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87BC6185B;
	Wed,  8 Mar 2023 14:55:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87BC6185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678283784;
	bh=6aEGF+WyXs/FSCLM+GEBLQ0KTC+6lu4hT+dtpiUwheQ=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gyDor7rkI7kbTo0WWdLmtT6dMtIjmHr0FUEnFcB6J8aQ6ner+fQLKsWwu8WKbMDIA
	 pvHz3fOEB7UyCsPxxD2tgsrN4dm6HA+tyW6E+gaxXuK7UWkCo6cPnvU8cOToh1ZG9F
	 L3eufjvrsR6j6+GSlcad+5nipGqqYhSUNuYncIoc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 550B5F80589;
	Wed,  8 Mar 2023 14:53:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6027F80548; Wed,  8 Mar 2023 14:52:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26AF1F8052D
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 14:52:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26AF1F8052D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HUAmZU5v
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DA3F26182C;
	Wed,  8 Mar 2023 13:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E05C433D2;
	Wed,  8 Mar 2023 13:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678283564;
	bh=6aEGF+WyXs/FSCLM+GEBLQ0KTC+6lu4hT+dtpiUwheQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HUAmZU5vxtE+owvyebLVqWSoL9J4h/sBi6loCIS5m1W9SAB3ejCU1qlvfnimregsz
	 gD7vloW/3+VB27xeSHgAp0Er01v4dzfQH82oXuv2tqPxvdvbuerzeG04rElClqynuf
	 SqsND4RBmhHdoI9/49jwJ7Zp+6Sacsm0KgOe52vRjenO7jyb+1t9jyNHO2Dg4/F+iu
	 PIGuYQgcKkUtScI/HcsM9o2s2GjBc5Xne7J4iGbITD6+m3wmIxdrdarhlnPTgLQKW0
	 Mhsvycu567YpyRlhPt8whSXNDOeb6inDzBKoW7wjTlfLhvSII+QTKQmSmdc9FN2N0p
	 gtJcIRrdQHSTg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230307100733.15025-1-peter.ujfalusi@linux.intel.com>
References: <20230307100733.15025-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi: fix copy-paste issue in
 topology names
Message-Id: <167828356240.31859.4629176125322638062.b4-ty@kernel.org>
Date: Wed, 08 Mar 2023 13:52:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: CRIZS7OT4BVJMSVOBVG4MN5RI2PFT3WV
X-Message-ID-Hash: CRIZS7OT4BVJMSVOBVG4MN5RI2PFT3WV
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CRIZS7OT4BVJMSVOBVG4MN5RI2PFT3WV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Mar 2023 12:07:33 +0200, Peter Ujfalusi wrote:
> For some reason the convention for topology names was not followed and
> the name inspired by another unrelated hardware configuration. As a
> result, the kernel will request a non-existent topology file.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi: fix copy-paste issue in topology names
      commit: 858a438a6cf919e5727d2a0f5f3f0e68b2d5354e

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

