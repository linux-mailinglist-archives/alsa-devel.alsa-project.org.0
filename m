Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A26D05A6054
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 12:10:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 536FE169A;
	Tue, 30 Aug 2022 12:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 536FE169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661854210;
	bh=Z9reXcsrIkZplDNMS02kQlXf12HDGnUx9tXgDy6f+6g=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oR4FsQUhgZQAW8lqMsAMMnYX3Uqc2i5HYhdJKADBN33ISvglYWopA/btinp1K8ZBu
	 SVBPoUaQbkYR8VPrh14GJVhKFV1BSW56aEonmY5H5sVngaI4uVkVDRpibGGW3FdYHL
	 XgifVA6rM0vC6kvnCe1bpbnoVq14Nkyvw8XK54m8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B221AF800AA;
	Tue, 30 Aug 2022 12:09:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD614F800AA; Tue, 30 Aug 2022 12:09:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C7C1F800AA
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 12:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C7C1F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fFrm9OKf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 960BCB8168A;
 Tue, 30 Aug 2022 10:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CBFCC433B5;
 Tue, 30 Aug 2022 10:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661854144;
 bh=Z9reXcsrIkZplDNMS02kQlXf12HDGnUx9tXgDy6f+6g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fFrm9OKfAgFgpYV2gknVg/eV61X6HNOuAgbFpOOS2MeVcE8lk3wMi1LdDnrFqV1v0
 vjdTWL1LViLVPOpvSxBwNGX8OImrfoKC6gyZIgzdnxdxvPzkY3rGqXKRIjui+NEo8m
 G3VCSaCxbyz7Cn0EMdqiJDPs0M1Jx3UvvqrYfQ+vJkpqFUHZnZdUfTu2HN5nUbL8RR
 tls+V9wxQaLO8xe+10HawNWxUxeEJDUyOKNPn/wn1uHE9WhTv8e+/v98wpsPw9keRh
 665dxvuxsjIDIuCm9L7ogNWVFBkW4ybd+FOeyjcYi82QLuVT/pCXUdJZOB9w56Yoso
 d6dsdjtDL+1CA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
In-Reply-To: <20220830075855.278046-1-krzysztof.kozlowski@linaro.org>
References: <20220830075855.278046-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: rk817: fix missing I2C dependency in
 compile test
Message-Id: <166185414198.1099664.6211983817122051754.b4-ty@kernel.org>
Date: Tue, 30 Aug 2022 11:09:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-65ba7
Cc: kernel test robot <lkp@intel.com>
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

On Tue, 30 Aug 2022 10:58:55 +0300, Krzysztof Kozlowski wrote:
> SND_SOC_RK817 uses I2C regmap so compile testing without parent MFD_RK808, requires I2C:
> 
>   WARNING: unmet direct dependencies detected for REGMAP_I2C
>     Depends on [n]: I2C [=n]
>     Selected by [y]:
>     - SND_SOC_RK817 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && (MFD_RK808 [=n] || COMPILE_TEST [=y])
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: rk817: fix missing I2C dependency in compile test
      commit: 5204e836544763cb085e653c82d4da77a427591a

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
