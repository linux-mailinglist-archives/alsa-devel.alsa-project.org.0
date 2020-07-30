Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD059233B69
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 00:33:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26786168F;
	Fri, 31 Jul 2020 00:32:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26786168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596148412;
	bh=GvpWxvd9qk2+XrI06V1aIgtnRaagWK5auktIrnkn96g=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m47nnsiW11gUycMvThQ59M50ttVv4wmfcCsTpv1P5fQU53JYwV8s90/XIaAYLC5Tr
	 fzkhziwA/9gye5oZ1O8ag0LHxS/Oxg9KYqk5JSPXE1Xugso51Gl3XnruhpEKiGLmMT
	 NN0f8XzxIAGG39sXA0mooPZf/4SXf1Tl0liyWcFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EEF8F802EC;
	Fri, 31 Jul 2020 00:28:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7D63F802E1; Fri, 31 Jul 2020 00:28:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51B44F802E1
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 00:28:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51B44F802E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1/hQuHyl"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC1B42083B;
 Thu, 30 Jul 2020 22:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596148108;
 bh=GvpWxvd9qk2+XrI06V1aIgtnRaagWK5auktIrnkn96g=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=1/hQuHyl+Eu09HNOCnRkosMVMzTwmBsTYm3GcX5DIgKQehYEBLbB0x7BmpUYYnyZA
 fBIgHmXx7zsZ3uRLzJ4m2DUPg66lNm5pXo6NBCG2Ho5z1IV+wNYw3r2wuvYO77p5J6
 w30aeGCoOlrV4E4khuXpJlF+z23wN+kWgg+ttxeo=
Date: Thu, 30 Jul 2020 23:28:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <873659bpbk.wl-kuninori.morimoto.gx@renesas.com>
References: <873659bpbk.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4] ASoC: dt-bindings: ak4613: switch to yaml base
 Documentation
Message-Id: <159614804535.1473.7153174858928627488.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
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

On 30 Jul 2020 13:28:37 +0900, Kuninori Morimoto wrote:
> This patch switches from .txt base to .yaml base Document.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: ak4613: switch to yaml base Documentation
      commit: 4d1976c79946cdf6ba3b53e26992ea0c0abf03da

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
