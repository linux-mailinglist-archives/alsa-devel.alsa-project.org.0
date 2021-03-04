Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C4532C4D2
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 01:56:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC7191A97;
	Thu,  4 Mar 2021 01:55:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC7191A97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614819408;
	bh=DnHVHEm1lKEaBb2HEDO79HbcE+nNYRNZRIk3ew/UrtU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nJsqrUASe80n97xPsWaA1SBdCE5Dp7BUvg/xDyQAJMqhcY/FKFJp4jciUwNu2Ta+h
	 tosKsvDh8r5z+voN7k5+8jQKycb7DcNtGISLakpap53n+eBTpWZNd3TWQJqpnkfUiV
	 ykAONIilV8pRQ3zWsJcB92371QJ4tL6nK7qtqGMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F4ACF8026A;
	Thu,  4 Mar 2021 01:55:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38E82F800B2; Thu,  4 Mar 2021 01:55:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96F35F800B2
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 01:55:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96F35F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C6eErzMj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 768CE64EA4;
 Thu,  4 Mar 2021 00:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614819308;
 bh=DnHVHEm1lKEaBb2HEDO79HbcE+nNYRNZRIk3ew/UrtU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=C6eErzMjRsIXoNnol50IAYY4M1kYqqEsc6jlsRzFo+M/S3ksBJ7QkU3BxsvLHvuIi
 POm5ce8W6Nd1gp2SPVr2RbtSqSRcjzg0V2pemcspYDsQHm6rTp6yGBt7urhgKfylb6
 6ep684MTr3+rq94psup8LJ16BqyJ93UDTKFgqLSSYRNVL0oAO9tgqSW7Dv2sgSN4x3
 5PSt6waCuyvA0sRRAhJlqnm1WtP4uyK90wgKXKfRrsW6Q2yohaQBEEV6GCd4NUrOr9
 NSsehCXwNqPEsHdmKhtgJNe5WW/JsqO/du2ssPHIZ9BR1ZQr1G2nuNJ0rXhK0Cz/DX
 HUuQ0w29DRwqg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20210302205926.49063-1-pierre-louis.bossart@linux.intel.com>
References: <20210302205926.49063-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/9] ASoC: remove more make W=1 warnings
Message-Id: <161481924070.9553.15206998571179785512.b4-ty@kernel.org>
Date: Thu, 04 Mar 2021 00:54:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Tue, 2 Mar 2021 14:59:17 -0600, Pierre-Louis Bossart wrote:
> These warnings get in the way of automation/CI, let's remove them.
> 
> Pierre-Louis Bossart (9):
>   ASoC: cs4270: fix kernel-doc
>   ASoC: jz4760: fix set but not used warning
>   ASoC: rt5631: fix kernel-doc warning
>   ASoC: sigmadsp-regmap: fix kernel-doc warning
>   ASoC: amd: renoir: remove invalid kernel-doc comment
>   ASoC: fsl: fsl_ssi: fix kernel-doc warning
>   ASoC: fsl: fsl_easrc: fix kernel-doc warning
>   ASoC: Intel: bytcr_wm5102: remove unused static variable
>   ASoC: qcom: q6dsp: fix kernel-doc warning
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: cs4270: fix kernel-doc
      commit: 8133968501b6d839a3621d553c212b9f3cc1b6ca
[2/9] ASoC: jz4760: fix set but not used warning
      commit: af54170f0c1ba84989e0975b6f67e758b472d00c
[3/9] ASoC: rt5631: fix kernel-doc warning
      commit: 952b3b9f90a2004b14a90d1fe303600dc8c6a98c
[4/9] ASoC: sigmadsp-regmap: fix kernel-doc warning
      commit: de233813778ed0eb8fc8ce03624bcffb29e04564
[5/9] ASoC: amd: renoir: remove invalid kernel-doc comment
      commit: 101d1e201fa1d8fd96f7da7a48288c95e2bae6d7
[6/9] ASoC: fsl: fsl_ssi: fix kernel-doc warning
      commit: 0c6fbbe5ffd1ff233a84e6e8fbc95f4e6deb6b24
[7/9] ASoC: fsl: fsl_easrc: fix kernel-doc warning
      commit: a45c305bbee30506d3bd068b40f6eb8699a88e54
[8/9] ASoC: Intel: bytcr_wm5102: remove unused static variable
      commit: ff321d72e7f31e96f92b36f02883fc0a27eb0a9f
[9/9] ASoC: qcom: q6dsp: fix kernel-doc warning
      commit: 098acd30d38bd8f5e3aa2544a4bc72942bf8b27e

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
