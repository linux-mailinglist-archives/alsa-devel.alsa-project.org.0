Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AA5638C2D
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 15:30:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4F621720;
	Fri, 25 Nov 2022 15:29:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4F621720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669386611;
	bh=I95mCqXAxBgNy1M7H5iHXj3ZCuWyvPCokrJXPIjXYHY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PIWYeRMQ8zC65aibpeuV3gc0ofqLiER2roNNEpmWCcoymFtKwfZ49iqz7w7+iwieI
	 p9ZQOtwmYOr4I7FjfyxwPDLmoG172GQmnmoVYILuqwwaSwvoJU+S462hetTeu0k6XE
	 QzOCZ81+GAwQ6P+BupyW18izA1Wl8Xf01RI1vHys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A25BF805A8;
	Fri, 25 Nov 2022 15:27:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 052B1F805A0; Fri, 25 Nov 2022 15:27:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 660B4F8057A
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 15:27:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 660B4F8057A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WPucsUQf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 240096247B;
 Fri, 25 Nov 2022 14:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECE7C433D7;
 Fri, 25 Nov 2022 14:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669386424;
 bh=I95mCqXAxBgNy1M7H5iHXj3ZCuWyvPCokrJXPIjXYHY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WPucsUQf1aPUC2XcwJVzhcxsYSxRfOOuDTtsWKXyZs3YG4cpIjZq8RgKjlFyjrQuU
 wsLgqI1qFvvOiCSFaHUV3kUbPG9QbbUHi7He/Iaf24oylGSz1JFZgR3jv8bG2mnxl1
 MY/uiOrxc5t8HD8N3zxkcanw36noSW5Y3zo1yKqdnvRcsZpdCyrOIcCYqQUkqciTBo
 76ALgWZ3wMntujc9FxmUwWNvN4zJ9UszZZuaK0R2jOIRWmDWVkw5lJ6MRFqbCPwXBw
 rJ8JvM196aD3DbMARMxyhLBNOsrps8YWEQNBxDZd3sOQze2Mk7i8PqBDDLcyN3qv+A
 ZWOD/MG0X3RHQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221124140351.407506-1-srinivas.kandagatla@linaro.org>
References: <20221124140351.407506-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: cleanup and fix dependency of QCOM_COMMON
Message-Id: <166938642224.506633.17958881347418036982.b4-ty@kernel.org>
Date: Fri, 25 Nov 2022 14:27:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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

On Thu, 24 Nov 2022 14:03:51 +0000, Srinivas Kandagatla wrote:
> SND_SOC_QCOM_COMMON depends on SOUNDWIRE for some symbols but this
> is not explicitly specified using Kconfig depends. On the other hand
> SND_SOC_QCOM_COMMON is also directly selected by the sound card
> Kconfigs, this could result in various combinations and some symbols
> ending up in modules and soundcard that uses those symbols as in-build
> driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: cleanup and fix dependency of QCOM_COMMON
      commit: 8d89cf6ff229ff31cd4f73f5b3928564b81fc41e

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
