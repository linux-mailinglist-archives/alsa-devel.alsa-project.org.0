Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 820F8212877
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 17:48:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E97C16CE;
	Thu,  2 Jul 2020 17:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E97C16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593704910;
	bh=sNB0otr3YXbGQdp8LUGPooYFhKBdpdTWobuGYek895E=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a+puNqltybSE3MVRh+7qj+781VqkorA+QBUIErl9yCxKPvGqBzkftNDrbpC5folTj
	 YyVMn2cHNNr9VsMryHK8mAiCpE5xDg5LZvdcGAACRWBPwRZpFLJpGDzqQg5MQ65U2m
	 Nja9lF6ot/9dewnQNhoHs/suzvh2/P5nlD5tdyIE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FC8FF800C1;
	Thu,  2 Jul 2020 17:46:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21D75F8022D; Thu,  2 Jul 2020 17:46:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E886F800C1
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 17:46:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E886F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AGo7RUqt"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CEE220885;
 Thu,  2 Jul 2020 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593704803;
 bh=sNB0otr3YXbGQdp8LUGPooYFhKBdpdTWobuGYek895E=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=AGo7RUqtz2XsmL//2NL5IQlvHgy30k9r6m2tFm6qwHxWQPpilr4A36QAhfsOjOkpE
 9Hqa/40SxXqxV/1GsfRs8j1i1DM4BjSPudx9toXTAD7X1w+woYzcVI7wKwpSu7F7R2
 xv+Dt6kK9i7oxlcUO5FYAW5WO+M1JXirzmgFEWnQ=
Date: Thu, 02 Jul 2020 16:46:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20200630223020.25546-1-festevam@gmail.com>
References: <20200630223020.25546-1-festevam@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: simple-card: Fix 'make
 dt_binding_check' warnings
Message-Id: <159370480067.5443.4442289678532780201.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 kuninori.morimoto.gx@renesas.com
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

On Tue, 30 Jun 2020 19:30:20 -0300, Fabio Estevam wrote:
> The following build warnings are seen with 'make dt_binding_check':
> 
> Documentation/devicetree/bindings/sound/simple-card.example.dts:209.46-211.15: Warning (unit_address_vs_reg): /example-4/sound/simple-audio-card,cpu@0: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/simple-card.example.dts:213.37-215.15: Warning (unit_address_vs_reg): /example-4/sound/simple-audio-card,cpu@1: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/simple-card.example.dts:250.42-261.15: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/simple-card.example.dts:263.42-288.15: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/simple-card.example.dts:270.32-272.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@0: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/simple-card.example.dts:273.23-275.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@1: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/simple-card.example.dts:276.23-278.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@2: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/simple-card.example.dts:279.23-281.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@3: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/simple-card.example.dts:290.42-303.15: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@2: node has a unit name, but no reg or ranges property
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: simple-card: Fix 'make dt_binding_check' warnings
      commit: 88ba5f4a642e4fb6ab7058254967f55375ca068d

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
