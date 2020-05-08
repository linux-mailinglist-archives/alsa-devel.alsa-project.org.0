Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 579671CB594
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 19:16:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D857828;
	Fri,  8 May 2020 19:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D857828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588958165;
	bh=gLM9qUvxrYiPMfAOqRJ1PoOf5M7hFr7u2n4CEILO50I=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S1utJUxe+U19V2BG/x3gDnYCTjHFM6t/DluCe76CfYL8+CCJUEQ9CntVgU3Zf4+Vw
	 LuwaeNwkQWHfvX7+zKZPnVccbDXNcsKqkI7sCqdNl9miDa2qTLQPPTf0TjfuZzrspv
	 3K0EFiFEnpuafnbIun2EzmBMpp3kb5OuypICQFyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B60AF80292;
	Fri,  8 May 2020 19:13:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAE38F8023E; Fri,  8 May 2020 19:13:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0298F800F6
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 19:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0298F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pSqawFDd"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC6892192A;
 Fri,  8 May 2020 17:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588958011;
 bh=gLM9qUvxrYiPMfAOqRJ1PoOf5M7hFr7u2n4CEILO50I=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=pSqawFDd76MgRyToBM4GrmZnPrfhoRCCqOjCZp1j9YT7EJe1vdGGbozD9MIXSdw/L
 FGR6AumafkY52sb47IYMlOE06dvz2uBlovSRPbvHswEFpV2Z1mMPEN7M57zpugdQOo
 e7CH7dlCgzb3mD5q68T8j6b8yZsHdPRdACerkg4A=
Date: Fri, 08 May 2020 18:13:28 +0100
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, linus.walleij@linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, lee.jones@linaro.org
In-Reply-To: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
References: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v4 00/12] ASoC: Add support to WCD9340/WCD9341 codec
Message-Id: <158895800277.30774.11001800526381716360.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
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

On Thu, 21 Nov 2019 17:04:57 +0000, Srinivas Kandagatla wrote:
> This patchset adds support to Qualcomm WCD9340/WCD9341 Codec which
> is a standalone Hi-Fi audio codec IC.
> This codec supports both I2S/I2C and SLIMbus audio interfaces.
> On slimbus interface it supports two data lanes; 16 Tx ports
> and 8 Rx ports. It has Five DACs and seven dedicated interpolators,
> Multibutton headset control (MBHC), Active noise cancellation,
> Sidetone paths, MAD (mic activity detection) and codec processing engine.
> It supports Class-H differential earpiece out and stereo single
> ended headphones out.
> 
> [...]

Applied to

   local tree regulator/for-5.7

Thanks!

[01/12] dt-bindings: SLIMBus: add slim devices optional properties
        (no commit info)
[02/12] ASoC: dt-bindings: add dt bindings for WCD9340/WCD9341 audio codec
        (no commit info)
[03/12] mfd: wcd934x: add support to wcd9340/wcd9341 codec
        (no commit info)
[04/12] ASoC: wcd934x: add support to wcd9340/wcd9341 codec
        (no commit info)
[05/12] ASoC: wcd934x: add basic controls
        (no commit info)
[06/12] ASoC: wcd934x: add playback dapm widgets
        (no commit info)
[07/12] ASoC: wcd934x: add capture dapm widgets
        (no commit info)
[08/12] ASoC: wcd934x: add audio routings
        (no commit info)
[09/12] dt-bindings: gpio: wcd934x: Add bindings for gpio
        (no commit info)
[10/12] gpio: wcd934x: Add support to wcd934x gpio controller
        (no commit info)
[11/12] ASoC: qcom: dt-bindings: Add compatible for DB845c and Lenovo Yoga
        (no commit info)
[12/12] ASoC: qcom: sdm845: add support to DB845c and Lenovo Yoga
        (no commit info)

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
