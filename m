Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 326813AA1AF
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Jun 2021 18:43:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 907C116E4;
	Wed, 16 Jun 2021 18:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 907C116E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623861802;
	bh=lkKn+lkEJJ+ozPy0zm9VRrQFGnFLXGgS7OXbAJotx0M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZiGxjf83FSJx4X4PsjcRCJcZqJWi8A0MMWOCq3SqaUEoKqdCCLnBK376vYnPa9AyE
	 lB0jjjfdi+5qQCYGTAcZHRNkl2F6AwWLhtqtJEPAeB651GUgRFhVlTMgCkRUPr9jdp
	 yfsSBQO61ch6+agdYkgwzpWbBsgVWAflretVCXNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10766F804B0;
	Wed, 16 Jun 2021 18:41:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4226EF80424; Wed, 16 Jun 2021 18:41:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FC16F80165
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 18:41:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FC16F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SNRIUDLM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3201961351;
 Wed, 16 Jun 2021 16:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623861705;
 bh=lkKn+lkEJJ+ozPy0zm9VRrQFGnFLXGgS7OXbAJotx0M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SNRIUDLMQlKFOGCwVuHdqbqEYl6HMv6/k+UtPXI2aRR4XVPJGkV66r2XvAkjVfiDs
 JSyg1KAi+xyZ61Q+uaj3yHWuod+SBrODBULgEXZ2oTFj3AYmUqIPu35WflfCOQ1Acr
 eoVvtao9hHxQQCNoIw9COB4i4TZaVJFm8iqWSPHB8/CFidyB73KxmG7vghMuM3QyhV
 ckODk6NHfL4QuOE4e3J384prvdc+NU57BCaUbDvzNaDlTdtS6bbRX1M8YYxqCcWKxf
 KJtoTfXMfGa38jbfsSDATP44/Kv6OZsHfl1RkjVhxaBHOTFnUFmTvncLE4u8IiSA98
 +hRt3vDAtIt1Q==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l42: Correct definition of CS42L42_ADC_PDN_MASK
Date: Wed, 16 Jun 2021 17:41:13 +0100
Message-Id: <162386001970.25644.8882454434561067128.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210616135604.19363-1-rf@opensource.cirrus.com>
References: <20210616135604.19363-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Wed, 16 Jun 2021 14:56:04 +0100, Richard Fitzgerald wrote:
> The definition of CS42L42_ADC_PDN_MASK was incorrectly defined
> as the HP_PDN bit.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l42: Correct definition of CS42L42_ADC_PDN_MASK
      commit: fac165f22ac947b55407cd3a60a2a9824f905235

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
