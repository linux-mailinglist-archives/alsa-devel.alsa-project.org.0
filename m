Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCC426318F
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 18:19:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB9E6173E;
	Wed,  9 Sep 2020 18:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB9E6173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599668354;
	bh=ZWI8ZIwwaG0xk3zDY/v0B7Ja0OHPsLcZD8PYPK+ImiM=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RqUH1chTsRwZrKocqQUdCulqq05E/XuTdG5H9pPUwic87CF1XUrKH9w4nA30DiPPb
	 rWr1P1Voc6ChKjY9mrvY7qbjFrI4ck8dWzwF7v5PVm71/CciCFRuNU6xF/J8Ho5TgJ
	 n+UdCSl+xIYBM0oQQw3zbZunnEsD+bdJqvVYGT7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07AFEF80227;
	Wed,  9 Sep 2020 18:17:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40B4EF8021C; Wed,  9 Sep 2020 18:17:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FF53F800E9
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 18:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FF53F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mviIVirC"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 459B3206A2;
 Wed,  9 Sep 2020 16:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599668240;
 bh=ZWI8ZIwwaG0xk3zDY/v0B7Ja0OHPsLcZD8PYPK+ImiM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=mviIVirCVmP0xqdQRsgVrxrWvJf3fZlkLSRYDAmQKaurnCBPjlwrNAjI7tAGt5VTt
 O4QUFP4EMiyuaNE4nOc2qS1kKCAI9R8ljt4PptFEUIIe+52cPzmh65awNDDKRi2SfD
 JW+rckVFPgX+7omG043GtVSFGaiBGj7GSkM8P834=
Date: Wed, 09 Sep 2020 17:16:35 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 devicetree@vger.kernel.org
In-Reply-To: <20200909145348.367033-1-codrin.ciubotariu@microchip.com>
References: <20200909145348.367033-1-codrin.ciubotariu@microchip.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: sound: add DT bindings for Microchip
 S/PDIF TX Controller
Message-Id: <159966819527.17677.10566984537165572569.b4-ty@kernel.org>
Cc: Rob Herring <robh@kernel.org>, alexandre.belloni@bootlin.com,
 lgirdwood@gmail.com, nicolas.ferre@microchip.com, tiwai@suse.com,
 ludovic.desroches@microchip.com, robh+dt@kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 9 Sep 2020 17:53:47 +0300, Codrin Ciubotariu wrote:
> This patch adds DT bindings for the new Microchip S/PDIF TX Controller
> embedded inside sama7g5 SoCs.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: add DT bindings for Microchip S/PDIF TX Controller
      commit: 7a8cca56f75ec9fe94550f846e66d62bc3a2778c
[2/2] ASoC: mchp-spdiftx: add driver for S/PDIF TX Controller
      commit: 06ca24e98e6bcc17c32ebe4b2fc579e5bf9ff5b2

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
