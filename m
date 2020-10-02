Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D82C9281D48
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 23:00:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62A9D1AB7;
	Fri,  2 Oct 2020 22:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62A9D1AB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601672416;
	bh=FyJohXOK/KJdaykrGzT4mSI8I/QzPpTMyYnfVJll6sk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oon+4gFDEn6Pt77VhoMVTOl44B/VWUjH/ATWHunxh9/wkhwssuws3DxKWBhVNpQQz
	 Ebt0PlhmjUWp65+wADzgUlqZXPiOgRjdovkaBg/GH0Yrie/tehs7o5wuPqV2feR9jY
	 TLy+q1nQwdC3oYZcW5eNNvD4+2d+7/POOetw0Voc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F7DCF80292;
	Fri,  2 Oct 2020 22:59:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C37EDF80228; Fri,  2 Oct 2020 22:59:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28AC4F801A3
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 22:59:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28AC4F801A3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="n6KZ9IX7"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 25707206B6;
 Fri,  2 Oct 2020 20:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601672346;
 bh=FyJohXOK/KJdaykrGzT4mSI8I/QzPpTMyYnfVJll6sk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=n6KZ9IX7fRgmg0IBJmHMXoRiSWLIQSlbE7GkHzJsOnDmgDQly+Ie05kTzgPmh6JPl
 P6ZT+izZDFWRCAybNsTkUhGD+a+CU2y5w74fRbYKYH0hAQaFpE1sD4P3Lx2nYKb0FQ
 STAv7rdtRXs/CDIxzOMuRONau91JRA22Pqdp9rrA=
Date: Fri, 02 Oct 2020 21:58:06 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20201001183537.5781-1-rdunlap@infradead.org>
References: <20201001183537.5781-1-rdunlap@infradead.org>
Subject: Re: [PATCH -next] ASoC: qcom: fix SDM845 & QDSP6 dependencies more
Message-Id: <160167211499.21762.6643224130461458588.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
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

On Thu, 1 Oct 2020 11:35:37 -0700, Randy Dunlap wrote:
> Fix a build error and Kconfig warning in sound/soc/qcom/.
> 
> ld: sound/soc/qcom/qdsp6/q6afe-clocks.o: in function `q6afe_clock_dev_probe':
> q6afe-clocks.c:(.text+0x182): undefined reference to `devm_clk_hw_register'
> ld: q6afe-clocks.c:(.text+0x19d): undefined reference to `of_clk_add_hw_provider'
> 
> After adding "depends on COMMON_CLK" for SND_SOC_QDSP6, the Kconfig
> warning appears because "select" does not honor any "depends on"
> clauses, so fix the dependency for SND_SOC_SDM845 also.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: fix SDM845 & QDSP6 dependencies more
      commit: 2bc8831b135ce1a55285663505245cb79422af76

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
