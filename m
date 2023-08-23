Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B482E785D3E
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 18:28:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22D4A836;
	Wed, 23 Aug 2023 18:28:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22D4A836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692808137;
	bh=qECGWHKOobEzMxHuX8r68lcnknGzvl9J0XZxy3E5EV0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R3ik+2iel9ch3e7EMqeF45q8IAUJRfHdxYCMWonxhrsl/SBJrHUxgF6s7nSVLiQbU
	 Z86SQjdpwYb+zUz0leWd7g6aQVy1ZYo40rgCYv90Qden4pNyRN8zgIiYlzLrIvXfKS
	 RsRpsPIYqGTsVC+2+SgPkHHkiudw/DytpU19ZzTY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E057BF8057D; Wed, 23 Aug 2023 18:26:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11E49F8057D;
	Wed, 23 Aug 2023 18:26:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F3FEF8055B; Wed, 23 Aug 2023 18:26:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B486EF8022B
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 18:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B486EF8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bf/8ucgp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2810365B1E;
	Wed, 23 Aug 2023 16:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E06AC433C7;
	Wed, 23 Aug 2023 16:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692807983;
	bh=qECGWHKOobEzMxHuX8r68lcnknGzvl9J0XZxy3E5EV0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bf/8ucgpTSoUFaso5roJFNIgYAH9KpnXiC/ZNs3wi/AINC54uiHRcPnH3fEX15bsy
	 b2XFJU1S4tBOH2VMg9e7De3DEA+/F0k0G9dpIuiOVnm3nL0sdDhWvsernsld5x2OzQ
	 xGz5qnvBRUxORlLczRKYtEW6PIqtGMnhKgZPbFnFvZYzHDL2Kx9C0NKoZYAdFHbJEl
	 R8J8gth3skepTKFP6NSRfysIsi7iG9/3y57DcbCcBHbRPdgLvbMcoS2kHvIDNB/JL6
	 A/W+PxjF6PbbBKUUw7+qAGyo6R3uAU/HYjXGBfB8jc+5wJ0cpbox4RRd/Gf1PHhjU1
	 yWz6v1M9Bj86w==
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, conor+dt@kernel.org, YHCHuang@nuvoton.com,
 KCHSU0@nuvoton.com, CTLIN0@nuvoton.com, SJLIN0@nuvoton.com,
 scott6986@gmail.com, supercraig0719@gmail.com, dardar923@gmail.com
In-Reply-To: <20230823071244.1861487-1-wtli@nuvoton.com>
References: <20230823071244.1861487-1-wtli@nuvoton.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: nau8821: Add single-ended input
 feature
Message-Id: <169280798077.53791.13745062802650648258.b4-ty@kernel.org>
Date: Wed, 23 Aug 2023 17:26:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: H4EHENPEGVNGGYD2FNM7CR34R3FSRFCB
X-Message-ID-Hash: H4EHENPEGVNGGYD2FNM7CR34R3FSRFCB
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H4EHENPEGVNGGYD2FNM7CR34R3FSRFCB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 23 Aug 2023 15:12:43 +0800, Seven Lee wrote:
> Add input with single-ended control.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: nau8821: Add single-ended input feature
      commit: 91e28d0b51f994c5968aee2a941e9f62bc9e15d7
[2/2] ASoC: nau8821: Improve AMIC recording performance.
      commit: 014ee0692f29da8b08fed5da0fa14e04698a50f7

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

