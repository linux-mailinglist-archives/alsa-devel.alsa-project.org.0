Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB3D2B9900
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 18:12:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C187B171C;
	Thu, 19 Nov 2020 18:11:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C187B171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605805963;
	bh=70tCoEq9/FYcYDMF8Mq56bnaLykaoi8Dcb4Ao5hv/jo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i/vQu2QuzhBpdasDWLNS3UomPoGXhIgUJfSHNt2bXkz3+7R/JufbcO70mPBWrYjOV
	 qED3/YMgURAj7MyzCkOpmzxalcpbHJYe+ndjLgj4DC7IpGKM4Tw9uouGJHLgqJJqC2
	 xo85aFeGAKjVL/br0cyWrNTAcVJA8WtB8/ukSWCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 777DBF804E3;
	Thu, 19 Nov 2020 18:09:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 194FDF804E2; Thu, 19 Nov 2020 18:09:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E9C1F804D6
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 18:09:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E9C1F804D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="x8+uAopb"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 008222469D;
 Thu, 19 Nov 2020 17:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605805777;
 bh=70tCoEq9/FYcYDMF8Mq56bnaLykaoi8Dcb4Ao5hv/jo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=x8+uAopbQoGBBj12OHyOQ4Ywx5KDw9pvIMKeoSNzkGffSpk+L0CpuA4OoV9j3WFdS
 DNT56KmYclVkEPfx254FJd1KEo++IMYL/ZjVSYEIQevxtgo9yxEdxcn9NfuskeoxZe
 Ewaa+2dsGlyWdsHjgFzf4L8oVSUWy5YtnBtZM+Vk=
Date: Thu, 19 Nov 2020 17:09:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20201105113458.12360-1-srinivas.kandagatla@linaro.org>
References: <20201105113458.12360-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 0/6] ASoC: codecs: add support for LPASS Codec macros
Message-Id: <160580573378.54454.13024216102656641940.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

On Thu, 5 Nov 2020 11:34:52 +0000, Srinivas Kandagatla wrote:
> This patchset adds support for two Codec Macro blocks( WSA and VA) available in
> Qualcomm LPASS (Low Power Audio SubSystem).
> 
> There are WSA, VA, TX and RX Macros on LPASS IP, each of the Macro block
> has specific connectivity like WSA Macros are intended to connect
> to WSA Smart speaker codecs via SoundWire. VA Macro is intended for DMICs,
> and TX/RX for Analog codecs via SoundWire like other WCD Codecs to provide
> headphone/ear/lineout etc ..
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: qcom: dt-bindings: add bindings for lpass wsa macro codec
      commit: ccbd847f15b0f08f8c6ed3ab5384e5f7055b08e5
[2/6] ASoC: codecs: lpass-wsa-macro: Add support to WSA Macro
      commit: 809bcbcecebff86003e13f07444d21b9d6652a64
[3/6] ASoC: codecs: lpass-wsa-macro: add dapm widgets and route
      commit: 2c4066e5d428d47a28f87407b3d73ebe40c06fd4
[4/6] ASoC: qcom: dt-bindings: add bindings for lpass va macro codec
      commit: 67d99b23c881b1411fc6907bc844d63565b536d6
[5/6] ASoC: codecs: lpass-va-macro: Add support to VA Macro
      commit: 908e6b1df26efc9d2df70c9a7bf4f5eae5c5702f
[6/6] ASoC: codecs: lpass-va-macro: add dapm widgets and routes
      commit: 58aad93015b9dc7cb8966c1dc775ec69f0280b79

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
