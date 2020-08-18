Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34551248C96
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 19:10:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E275A1703;
	Tue, 18 Aug 2020 19:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E275A1703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597770604;
	bh=/wLU2CDdRv6SSSUVf9PLh6PRAK0Mxi2PgY4Zys9S4aU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KX0bFiQmdSGYMB7kTus/qz1h7RUm6RXz2TDRXNID5tndstzStCd0TjLwuMExKS2xj
	 jseDbruEfOFE9ufzSTCh03fG62yzVDtu4qXHFPJz+OH3jB+bxAYPo/R97PeBiRj8UE
	 YqVV/8HDxsKvBieKHfYw8gRBh+OmgjBwE648lTzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 061B3F80391;
	Tue, 18 Aug 2020 18:56:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABACEF80392; Tue, 18 Aug 2020 18:56:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E302F8038F
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:56:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E302F8038F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="J39oCvdR"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B603B20829;
 Tue, 18 Aug 2020 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769771;
 bh=/wLU2CDdRv6SSSUVf9PLh6PRAK0Mxi2PgY4Zys9S4aU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=J39oCvdRk1AZdO4sOeWt7Y98pvyzVuNk1J2c51gTPDEMSRWBXFLmttCW3tDRINPl+
 uAWizb9IPpu5jFYbbzQH3Ptlo/Z+1Fa7HD4T0WqiRGhC/2S9EKMT7NNCDPwLsuTRFk
 Q4HjoJ3PJrbOhKOuCdjYAFpRXyk78ucHdegOBBko=
Date: Tue, 18 Aug 2020 17:55:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20200727093806.17089-1-srinivas.kandagatla@linaro.org>
References: <20200727093806.17089-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 00/10] ASoC: qdsp6: add gapless compressed audio support
Message-Id: <159776961930.56094.14674636616850967795.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org
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

On Mon, 27 Jul 2020 10:37:56 +0100, Srinivas Kandagatla wrote:
> This patchset adds gapless compressed audio support on q6asm.
> Gapless on q6asm is implemented using 2 streams in a single q6asm session.
> 
> First few patches such as stream id per each command, gapless flags
> and silence meta data are for preparedness for adding gapless support.
> Last patch implements copy callback to allow finer control over buffer offsets,
> specially in partial drain cases.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: q6asm: rename misleading session id variable
        commit: 99b7db5f6d4090e98eee79cefc8521fdf4f46ad8
[02/10] ASoC: q6asm: make commands specific to streams
        commit: 789e3b6c5238448a6dcfc9bc998dfe3ea9d87150
[03/10] ASoC: q6asm: use flags directly from q6asm-dai
        commit: e0c078a8da333eb45745d1c5e4b72f0314b8b742
[04/10] ASoC: q6asm: add length to write command token
        commit: 50d4e2146cdd48fcc1cd748dfb06dd0fc486eb26
[05/10] ASoC: q6asm: add support to remove intial and trailing silence
        commit: 39376129783168c51981bd2c195a1d10ae63104f
[06/10] ASoC: q6asm: add support to gapless flag in q6asm open
        commit: 983b8864f6033336e619a5936a02aea3026c5742
[07/10] ASoC: q6asm-dai: add next track metadata support
        commit: 135bd5ea190f3e31d2289da98a53d28e1be5b6bf
[08/10] ASoC: q6asm-dai: prepare set params to accept profile change
        commit: 5b39363e54ccca8fee700e5cc6acf42a80ff1de3
[09/10] ASoC: q6asm-dai: add gapless support
        commit: ee941a338ad67dfd852826eec381d8584edf29f2
[10/10] ASoC: q6asm-dai: add support to copy callback
        commit: a08cd56a45245ea422d77e7ee5ce20d5f21f5b5d

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
