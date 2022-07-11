Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B04561EDC
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 17:12:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBCBC16ED;
	Thu, 30 Jun 2022 17:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBCBC16ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656601924;
	bh=l7KxMBhRvrNgW0srsiaNIvYfDYhR6onbRDyQH5tjYrY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bk5fGBlr+XzwHaKtl+5PEr2PKoLoOCmyID/8P3tBftgf2bXpSdFO06zSCk0q5FhDX
	 oVBvn7CtbavXkAH8UCyBv/TGqMHHHdyJ37o8Ad/kMyS7j82QfXeKLmOPxEDc6W7+jY
	 oZuiaK+UCZt9RhsWR8L43NcCn1fNXM7hfhhAc+u0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A782F80537;
	Thu, 30 Jun 2022 17:10:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C197F804FE; Thu, 30 Jun 2022 17:10:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D9FCF804D2
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 17:10:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D9FCF804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qbm2u+66"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 54BA260E8D;
 Thu, 30 Jun 2022 15:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6AFC3411E;
 Thu, 30 Jun 2022 15:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656601815;
 bh=l7KxMBhRvrNgW0srsiaNIvYfDYhR6onbRDyQH5tjYrY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qbm2u+66ATk65SMpLsZsZXOONGGNVrOO3u2KGQ+DXjFczwYDnwYVvV/qViNmxVJl0
 Gl7pqNZtw3Er1FMXGZszn78zFZTVox92IYFqtK6p6pE9ZZ+fbJbC2Kcdf6fCS0zUvC
 Pg6BQGyKpQchJFBB1WdZm5IqiCO92eqJ1L/qfhLdpcVP7762XrZ6D9iNrdeGZ2JpbA
 r/r37P5Rscz7zKHecYdISAb+22HAZChxx3LUSzcppwGyv0MIxakv4EGtYd3FauMghW
 /H58VYSXnziRshuHgMMBxSWphRGy5ZzhHpMAPkmR+yCR4L2gZQuFw1ZZ9rBjmQEJeq
 cc7EF/f0kfoFQ==
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, trix@redhat.com, perex@perex.cz,
 krzysztof.kozlowski@linaro.org, lgirdwood@gmail.com, s.nawrocki@samsung.com,
 tiwai@suse.com
In-Reply-To: <20220629201811.2537853-1-trix@redhat.com>
References: <20220629201811.2537853-1-trix@redhat.com>
Subject: Re: [PATCH] ASoC: samsung: change neo1973_audio from a global to
 static
Message-Id: <165660181358.664251.18405607325309660233.b4-ty@kernel.org>
Date: Thu, 30 Jun 2022 16:10:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Wed, 29 Jun 2022 16:18:11 -0400, Tom Rix wrote:
> sparse reports
> sound/soc/samsung/neo1973_wm8753.c:347:24: warning: symbol 'neo1973_audio' was not declared. Should it be static?
> 
> neo1973_audio is only used in neo1973_wm8753.c, so it's
> storage class specifier should be static.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung: change neo1973_audio from a global to static
      commit: 871325d800ed532ba5874257f04bb4ae75125bc4

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
