Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE89222C832
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 16:39:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB109168B;
	Fri, 24 Jul 2020 16:38:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB109168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595601559;
	bh=kuhbtK/xgw6S+iffhFWjMTNgQZBQEum2vNOAOqlhFXI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ol2fzThf4tB96LftuCEAiQBOF422MfdB3gDnzu3+gYoYK2EScQ3WIf42JoN8/BE8e
	 OtUSSIwOKFHacUycwbRm2F9JkPXZZswuCG+y0J5xGvgy55ljTdYXkW9SAjp8E8kU57
	 lOHEX+nvj/4OcfvkY0T12ns5PhljNzbMRlMDNNME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D72CAF80141;
	Fri, 24 Jul 2020 16:37:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EE77F80150; Fri, 24 Jul 2020 16:37:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BD40F8011F
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 16:37:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BD40F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eVK6Dlsn"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 38E952065C;
 Fri, 24 Jul 2020 14:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595601446;
 bh=kuhbtK/xgw6S+iffhFWjMTNgQZBQEum2vNOAOqlhFXI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=eVK6DlsnirpsoMElQq0X8wZ62fM1oJJJxTIs8fcHafFDKVGbybZUNuXxQJnn7paR8
 0BNSpnD0TuntNk+sfMyA00xTzIPGtBisAlkbc7OsJwvid3Ra1ZAdCU0yHqmSo3txK+
 O3bIEJmLn1FOGs6wyj/6h0duCWAEp3EPVMb2zxyk=
Date: Fri, 24 Jul 2020 15:37:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
In-Reply-To: <20200723183904.321040-1-stephan@gerhold.net>
References: <20200723183904.321040-1-stephan@gerhold.net>
Subject: Re: [PATCH 0/7] ASoC: qcom: Use qcom_snd_parse_of() for apq8016_sbc
Message-Id: <159560143160.13017.5020230116568554217.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Cheng-Yi Chiang <cychiang@chromium.org>
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

On Thu, 23 Jul 2020 20:38:57 +0200, Stephan Gerhold wrote:
> At the moment we have two separate functions to parse the sound card
> properties from the device tree: qcom_snd_parse_of() for DPCM and
> apq8016_sbc_parse_of() without DPCM. These functions are almost identical
> except for a few minor differences.
> 
> This patch set extends qcom_snd_parse_of() to handle links without DPCM,
> so that we can use one common function for all (qcom) machine drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: qcom: Use devm for resource management
      commit: ed3b53e7ffe91c32a1277de435e3fcb3ad5e852a
[2/7] ASoC: qcom: common: Use snd_soc_dai_link_set_capabilities()
      commit: 627ab55d745b2a413e0a2856f2ad2e422a697971
[3/7] ASoC: q6afe: Remove unused q6afe_is_rx_port() function
      commit: 0a8c336a1e020be3832b02e1ddbb92d61da87512
[4/7] ASoC: qcom: common: Support parsing links without DPCM
      commit: 47ea88488209226e03559bb8baaa0156b4025fee
[5/7] ASoC: qcom: common: Parse properties with "qcom," prefix
      commit: f0d67fdba5dcf48865fc79f2d63b49bd75d36671
[6/7] ASoC: qcom: apq8016_sbc: Use qcom_snd_parse_of()
      commit: 118205d241ef6fec395086c34f85717a41a8b4a1
[7/7] ASoC: qcom: common: Avoid printing errors for -EPROBE_DEFER
      commit: a63419beafd4edf20761c37dbefd639a0b1b481e

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
