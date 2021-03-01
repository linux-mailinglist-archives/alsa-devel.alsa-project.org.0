Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A812329553
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:44:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CE5F16B4;
	Tue,  2 Mar 2021 00:43:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CE5F16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614642263;
	bh=BTDyXUsipgvB9/RxOCjF7hQ3tDehq3a8IIFVLtpcvew=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HyDAMORej60eIhZHVQG1BFpetSjpcmMn0qM6x5ZK3Tn8bxZhFrHHzUh+1wTvXasW5
	 uYU9hOJXXsgSah8EmojxtPOSY1pRJCwoCxROqnMPln5/EyNBwGKeaVGWbbQuqNBz8V
	 aHsqbIS1rF4LxFb/iLm2po3ddjI0kWXc01RCNtKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36605F8052F;
	Tue,  2 Mar 2021 00:37:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5704F8052E; Tue,  2 Mar 2021 00:37:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F101F80524
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:37:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F101F80524
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TScYrYA7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E3BB6024A;
 Mon,  1 Mar 2021 23:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641845;
 bh=BTDyXUsipgvB9/RxOCjF7hQ3tDehq3a8IIFVLtpcvew=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TScYrYA74KRQn1ezzQgcG+QIv6hcgl2r+sVbjY/KW7Fb39gAh6b/+V+jXC6XOtEj+
 l0Lk6vA4lEQyZFMZ34OAravuVdCwa62XCO8bhV7vF7Tjbda0JWFvwpN31HrMd1uzcB
 faa6HajUM+2ukVqjRT/IBH871YJDMem/YNgD9DFX9smCDU9i5/MLdnZ+8bLnjxfHC7
 aIpaChDabBn3M/aWFZyzWBZ/KiNDtbb0/NTmdhmx9+iE70E4WhrwOWf2NSLpJhe6rK
 naxM/QpoWFOnYoQ3gwc3FVh2VrJNdbkZ3JiWMNmCrd2AwgLoCrNDhM6yINlEPKmrml
 MDpTaSwuV2wFw==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
References: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/10] ASoC: qcom: remove cppcheck warnings
Message-Id: <161464168096.31144.9561845057548508112.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, srinivas.kandagatla@linaro.org
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

On Thu, 18 Feb 2021 16:29:06 -0600, Pierre-Louis Bossart wrote:
> Second batch of cleanups for Qualcomm SOCs and codecs. The only
> functional change is the addition of a missing error check in the last
> patch.
> 
> Pierre-Louis Bossart (10):
>   ASoC: qcom: lpass-hdmi: remove useless return
>   ASoC: qcom: lpass-platform: remove useless assignment
>   ASoC: qcom: q6dsp-dai: clarify expression
>   ASoC: qcom: q6afe: remove useless assignments
>   ASoC: qcom: q6afe: align function prototype
>   ASoC: qcom: q6asm: align function prototypes
>   ASoC: wcd-clsh-v2: align function prototypes
>   ASoC: wcd9335: clarify return value
>   ASoC: wcd934x: remove useless return
>   ASoC: lpass-wsa-macro: add missing test
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: qcom: lpass-hdmi: remove useless return
        commit: 0bf10fbda55679a3fef86f5fae47105b2d61fecc
[02/10] ASoC: qcom: lpass-platform: remove useless assignment
        commit: 25ab7dcdb77e4ecfa1a9e1c7939318b2b90a90f3
[03/10] ASoC: qcom: q6dsp-dai: clarify expression
        commit: fd565b469d21ab1008f5f4fb5ca5cf9eaff83cc1
[04/10] ASoC: qcom: q6afe: remove useless assignments
        commit: 924d4aad24337def5b18cd3225eec7e27dcf0f74
[05/10] ASoC: qcom: q6afe: align function prototype
        commit: 7ca70ca9914c23e1f8a9ae68c96f1fc812cc8575
[06/10] ASoC: qcom: q6asm: align function prototypes
        commit: 63a372715a3c2c13720774698a08d85de5f40934
[07/10] ASoC: wcd-clsh-v2: align function prototypes
        commit: 297ef0a73103c59c107f8b7c013b17d27ea2f772
[08/10] ASoC: wcd9335: clarify return value
        commit: 71ea36550bda7359ab055a4572a5f3ae04369b07
[09/10] ASoC: wcd934x: remove useless return
        commit: 5c3252b3f71184f96cf1bcad3a78aa074d6d7db8
[10/10] ASoC: lpass-wsa-macro: add missing test
        commit: 0076777b8753e3969516dbd514a2c5ffb3ceba3a

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
