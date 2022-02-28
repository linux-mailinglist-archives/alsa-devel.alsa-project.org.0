Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E92D4C78BB
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:22:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 981C31920;
	Mon, 28 Feb 2022 20:21:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 981C31920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646076161;
	bh=xHBsD9njTJf8xrmd/MxM7baA+gAbquRLplB4hpTw1Rs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sF5iAi9dboqBnnSd/74pJ7pUROTmr/JBQEP26E1YiCLEzN8UnsBZcFlDLCm+QJmYJ
	 KF27T0y3Q7Em5pzSJjU/qzzTz8c+3WavZWiyc1OxSGP49xBn/uj6A8rOdzvXD3dIkc
	 1XQ8HWT90PNpLrcqU4qHlvFCBr82mdE1+BSdodYs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC5B0F805C2;
	Mon, 28 Feb 2022 20:16:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E83B5F805A8; Mon, 28 Feb 2022 20:15:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EABBF8059F
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EABBF8059F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="es7cRgYS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 59C6A61588;
 Mon, 28 Feb 2022 19:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0156FC340F5;
 Mon, 28 Feb 2022 19:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075744;
 bh=xHBsD9njTJf8xrmd/MxM7baA+gAbquRLplB4hpTw1Rs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=es7cRgYS6f7DNcWE/zmLa+CZZQjBI/eK041zEQFofaZGFYC4Z0+O/1IFEi64MhjO/
 V7zmAKD9NhiOZvQ0EsQ8VfDO63J9Ejbu0oPzPkckDCXKYoeYmcA395gOHU+hD4G2ON
 dgTdJfXDFoXhoAwtDnCS9TZcmGS9Z2+lDPSQeti4jKPqpYgPWOTXsD2WWDgzPKVmM6
 8/d8ZQH7jRAZFJhZfiKIGzgS4aXgZfpg6sSTQeVO8YLBEt+S4bz7jvqEOG2yLCNJjR
 GqRnR66fBwSxYzMsgFKhtPhra+J14tWyfK+jPUotvoKx/Ut0NsQZk38IaQjsfeDHsE
 yTSfAPg+Ue1Pw==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 Meng Tang <tangmeng@uniontech.com>
In-Reply-To: <20220227050928.32270-1-tangmeng@uniontech.com>
References: <20220227050928.32270-1-tangmeng@uniontech.com>
Subject: Re: [PATCH] ASoC: amd: pcm-dma: Use platform_get_irq() to get the
 interrupt
Message-Id: <164607574272.3538791.6539918735401547519.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Sun, 27 Feb 2022 13:09:28 +0800, Meng Tang wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypassed the hierarchical setup and messed up the
> irq chaining.
> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: pcm-dma: Use platform_get_irq() to get the interrupt
      commit: 87d71a12877114b4ad60ce5b93482505bac88d6e

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
