Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F7E4C0AD1
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 05:09:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7F3A18F3;
	Wed, 23 Feb 2022 05:08:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7F3A18F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645589366;
	bh=lcmflg6ESyH+RCqAPf8+I3cJ3T/GoheJfaGmr8B8g+Q=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a4PIU107RzxrefPHM1lp9JKba9w3XAFwazAhY+oVi8PApzTERIuGnLw2nO/bC+MIR
	 gfU41vLtu60EwANL7jXRPwuv2hx18ugps8p1GAu/xtyS0+d1jtdY5vWOojRggHd9J7
	 WJ6u375I1tnyoGT9fnRHLzrsghKwKhtR+HvLZW2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34EACF80237;
	Wed, 23 Feb 2022 05:08:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EAD6F8025D; Wed, 23 Feb 2022 05:08:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63447F800B6
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 05:08:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63447F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PSSPjbK1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0AEC4609ED;
 Wed, 23 Feb 2022 04:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C4FC340EC;
 Wed, 23 Feb 2022 04:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645589291;
 bh=lcmflg6ESyH+RCqAPf8+I3cJ3T/GoheJfaGmr8B8g+Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PSSPjbK19l11usiFAJf+5ZOHmNgpP1DJIEdHW0zAKKcCS/hJFrqsWGvjz0tyZ+AqA
 fnIimVQnJaGdbI8s7H6KVT6qPNjofWnjn2PNrlCVYX2cxEe0gAFbXNCLS4RPy+HAwP
 qtz9PjG5XEb7Jqcf47EFc4wxhak/128bmax5wZ3CTg81FZ7SQpGiw2DQWcLduO72E2
 T7ksE81eRbyp4Bl6a9K61YWNc4Cusf7S8sVJEiUFmMie5kth2lIx6UnCJVcUtvBu+6
 Ha1ppZyvZ6TO//K8AmowxImWlQ56AaaPiFFzCDIk3UnLsQS3LW2d6uO25t/A47BLIW
 athpQbHyXwifQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220222183212.11580-1-srinivas.kandagatla@linaro.org>
References: <20220222183212.11580-1-srinivas.kandagatla@linaro.org>
Subject: Re: (subset) [PATCH v2 0/9] ASoC: codecs: qcom fix validation failures
Message-Id: <164558928966.1665019.9762438436009725224.b4-ty@kernel.org>
Date: Wed, 23 Feb 2022 04:08:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 quic_srivasam@quicinc.com
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

On Tue, 22 Feb 2022 18:32:03 +0000, Srinivas Kandagatla wrote:
> Thanks for pointing out to mixer kselftest and VALIDATION Kconfig.
> 
> This patchset addresses some of the issues in Qualcomm codecs that are
> discovered with recent mixer kselftest and validations added to ASoC.
> 
> Mostly these are under
> 1. accessing integer value type for enum controls, which is clearly an array out of bounds access.
> 2. Fix incorrect ranges.
> 3. Fix return values for put functions.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/9] ASoC: codecs: rx-macro: fix accessing compander for aux
      commit: 42c709c4e1ce4c136891530646c9abd5dff3524f
[2/9] ASoC: codecs: rx-macro: fix accessing array out of bounds for enum type
      commit: bcfe5f76cc4051ea3f9eb5d2c8ea621641f290a5
[4/9] ASoC: codecs: va-macro: fix accessing array out of bounds for enum type
      commit: 0ea5eff7c6063a8f124188424f8e4c6727f35051
[6/9] ASoC: codecs: wc938x: fix accessing array out of bounds for enum type
      commit: cc587b7c8fbbe128f6bd0dad025a0caea5e6d164
[7/9] ASoC: codecs: wcd938x: fix kcontrol max values
      commit: b0217519236924f77a8382b4004e43ef8fd0dcbb
[8/9] ASoC: codecs: wcd934x: fix kcontrol max values
      commit: 61163c3e7480106804269182e24db05244866493
[9/9] ASoC: codecs: wcd934x: fix return value of wcd934x_rx_hph_mode_put
      commit: 4b0bec6088588a120d33db85b1f0d9f096d1df71

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
