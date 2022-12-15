Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AAD64DFD7
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 18:40:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE19921E9;
	Thu, 15 Dec 2022 18:39:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE19921E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671126027;
	bh=B3Y5fOQUoSGt0TYtxeTcs4ZxQAgDEMdgJClAQNYc+Ig=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UqE05COWQAJD+kCGGGmr9vmjoRX/cd3BZvt5s6MEidPuTXxb9TRYPm8KecmVC31VG
	 02M1P8lTwIfDZk9dEGdTPXReuZNgngJ3baA0SFrSRtiols71ydge6kulPq93uBVIqd
	 jOSRP4QtT/ZOycqdLYxtXEwlCbluWgNBaaTzeg2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7498BF801D5;
	Thu, 15 Dec 2022 18:39:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BDACF804ED; Thu, 15 Dec 2022 18:39:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BF71F801D5
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 18:39:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BF71F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pMltQMFl
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B39E1B81C21;
 Thu, 15 Dec 2022 17:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 786A1C433EF;
 Thu, 15 Dec 2022 17:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671125964;
 bh=B3Y5fOQUoSGt0TYtxeTcs4ZxQAgDEMdgJClAQNYc+Ig=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pMltQMFl74JuDyivFi/bQAsQNn2ojAqrLNwxkADl0inuLpsLCCzIG6Gf6iVZucVwW
 XSCzXD0qMl6kyZ6ipLgtQD6mfvF3gdXo+U0HFxv+Y1Vum9NK4SbUk8NyoDdw6eBMDC
 DMjwSMM4zn9tx9CKnHCq3ywg0X7XAWKZSuiA1xYhMXEd9qc1AjP9RZe1/o7iG3KmyJ
 b/3XHLJqo9+i3Q+V00NV+fRs9QE5BnfpQJgCAy0peRY5pcLw8ClnZoBin4YVDT4UJg
 Dge/devvBtZYyPITovZlWZxEPlz5RgwhEbKOYbqNU8cJVCCn92pYDjHfA7pH32b/Vq
 cyrE1XSHXsIng==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221215134337.77944-1-krzysztof.kozlowski@linaro.org>
References: <20221215134337.77944-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: lochnagar: Fix unused lochnagar_of_match warning
Message-Id: <167112596219.3721867.784009844476079097.b4-ty@kernel.org>
Date: Thu, 15 Dec 2022 17:39:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-7e003
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: kernel test robot <lkp@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 15 Dec 2022 14:43:37 +0100, Krzysztof Kozlowski wrote:
> lochnagar_of_match is used unconditionally, so COMPILE_TEST builds
> without OF warn:
> 
>   sound/soc/codecs/lochnagar-sc.c:247:34: error: ‘lochnagar_of_match’ defined but not used [-Werror=unused-const-variable=]
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: lochnagar: Fix unused lochnagar_of_match warning
      commit: a12a383e59ce486abd719b6bda33c353a3b385e7

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
