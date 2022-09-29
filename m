Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAF15EF87A
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 17:17:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4E3F86F;
	Thu, 29 Sep 2022 17:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4E3F86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664464642;
	bh=mVEW7JO/5gg4rXh1VB/iXP+N7uIZwhJ9sprNGbG8dR8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TOfbIplPljCBUJzxKwGAAqsV8jcOXWMZzUZRKYYpVgvmBkYSiVsSWSbB/fxuBbfmc
	 nu3Ur8jwkekElQJX4Cx2ZirwaC3xf7qg8+AKMWP955Sf+oNoVbs12u5wb9ePs2iaFu
	 NL0pGuY9mqHB4KK57hHsDM73M2w+XUI9hSyzvS+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A539F800AA;
	Thu, 29 Sep 2022 17:16:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0ADA9F8023A; Thu, 29 Sep 2022 17:16:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DFDEF800AA
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 17:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DFDEF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ms21SE7B"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7C0C0B820D1;
 Thu, 29 Sep 2022 15:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F887C433D6;
 Thu, 29 Sep 2022 15:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664464578;
 bh=mVEW7JO/5gg4rXh1VB/iXP+N7uIZwhJ9sprNGbG8dR8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ms21SE7B1GAZIuKbydj1TVvkdbHH24K9WjGzBPO37BM/vPYBV7sUFMIcWSyXLUxte
 MCndNlidJ523R/WRkwnVzCgShZtzLMQ8iCtawPQe60wBZrvNH48yjlG9cz7XbclF/K
 nSWYvMqIKdkluiEmNEW0Mvs8aLvXvEp4egc7Itn9KOdmCsC1DUVk5jnVOxxNmhK9xf
 4UlF4auB09qZ7HO/hoAkEb5XLM6lEP7rgXdDYBWEXqmJKn2zveKN8+nai3o8h5chaF
 chD/kVO/51/N3tgLmKhMJbWM/cZStg74nqDjb3rhb0tadd47boUXd9y8zEQP4EHfDD
 sb/HcXZjiTsjA==
From: Mark Brown <broonie@kernel.org>
To: Banajit Goswami <bgoswami@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220929131528.217502-1-krzysztof.kozlowski@linaro.org>
References: <20220929131528.217502-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: wcd-mbhc-v2: Revert "ASoC: wcd-mbhc-v2: use
 pm_runtime_resume_and_get()"
Message-Id: <166446457527.149592.13835062357104188946.b4-ty@kernel.org>
Date: Thu, 29 Sep 2022 16:16:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 stable@vger.kernel.org
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

On Thu, 29 Sep 2022 15:15:28 +0200, Krzysztof Kozlowski wrote:
> This reverts commit ddea4bbf287b6028eaa15a185d0693856956ecf2 ("ASoC:
> wcd-mbhc-v2: use pm_runtime_resume_and_get()"), because it introduced
> double runtime PM put if pm_runtime_get_sync() returns -EACCES:
> 
>   wcd934x-codec wcd934x-codec.3.auto: WCD934X Minor:0x1 Version:0x401
>   wcd934x-codec wcd934x-codec.3.auto: Runtime PM usage count underflow!
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wcd-mbhc-v2: Revert "ASoC: wcd-mbhc-v2: use pm_runtime_resume_and_get()"
      commit: e18f6bcf8e864ea0e9690691d0d749c662b6a2c7

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
