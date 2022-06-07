Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 483A653FC8E
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:58:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCB991ABC;
	Tue,  7 Jun 2022 12:57:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCB991ABC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599497;
	bh=RMxBLzAW7Q9aqyjIr5rMgScv+pfwT+8lbeF5Fd1v700=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CB9APNaVZKEGE1y3XAPurq6iDCcg9y5uEY0sGWcOP7dAZ93MhxCFb4pylsFHw04ea
	 rF+FBxj/vilrP9EoPdVEoQDSqjhOXXpIDHDkDGIXAW9aimS4Yrsg+fATPJyTxjOBW7
	 nyg+kbpopGVDispqklilGNTOmUtll+3ytnTbOjIE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C9BEF80571;
	Tue,  7 Jun 2022 12:55:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A755F8056F; Tue,  7 Jun 2022 12:55:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17F42F80557
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:55:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17F42F80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qFXaEbfP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A2807B81F0E;
 Tue,  7 Jun 2022 10:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44ECC385A5;
 Tue,  7 Jun 2022 10:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654599312;
 bh=RMxBLzAW7Q9aqyjIr5rMgScv+pfwT+8lbeF5Fd1v700=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qFXaEbfPLM9891/pU83KYLFlThljzmRkg1Gnb/Zv2rjp4HWgtsmwgTWlk4nQZ7SEk
 KwG4y58qXF1jTacp0XL8O7ABwpRlHij3weDb94mx20VKfkJ+9rZ5z876ySns1iKB5e
 Kk3GLRoVxRHWvesYIKn676HPwdVHT4kmGpvPkKDPppyfVn+hy+WQwL0B/4Yk/fXoI0
 nQtD+C11pv+YRIHVFN+ZX8WX+jOGuYkF+3R+WSHCN7AQr08P/UPfX2/22Db+Upx8mK
 quulXl067G/NVEI1xkwBvic8I3BLUYBSSTiNlaG4xlFOEttmWkl6+HmzbWYp/GzUTf
 YuCn7Gl2B3FAA==
From: Mark Brown <broonie@kernel.org>
To: thierry.reding@gmail.com, tiwai@suse.com, spujar@nvidia.com,
 robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org, perex@perex.cz,
 krzysztof.kozlowski+dt@linaro.org
In-Reply-To: <1654238172-16293-1-git-send-email-spujar@nvidia.com>
References: <1654238172-16293-1-git-send-email-spujar@nvidia.com>
Subject: Re: (subset) [PATCH v3 0/6] OPE support on Tegra210 and later
Message-Id: <165459930944.399031.17402863866991236523.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:55:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Fri, 3 Jun 2022 12:06:06 +0530, Sameer Pujar wrote:
> This series adds support for Output Prcoessing Module (OPE) module on
> Tegra210 and later generations of SoCs. OPE is a client of AHUB and
> it has sub blocks of PEQ (Parametric Equalizer) and MBDRC (Multi Band
> Dynamic Range Compressor) for data processing.
> 
> An ASoC component is registered for OPE, which includes PEQ and MBDRC
> functions as well. This can be plugged in audio path using ALSA mixer
> controls. The series adds necessary binding documentaion, driver and
> DT binding patches to enable OPE module on Jetson platforms.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: tegra: Add binding doc for OPE module
      commit: 45c6c5e052df2ee0d87e74743d8bb72e70fd0887
[2/6] ASoC: tegra: Add Tegra210 based OPE driver
      commit: 7358a803c778f28314721e78339f3fa5b787f55c
[3/6] ASoC: tegra: AHUB routes for OPE module
      commit: 7ee0910d03168535ffeea2f4ce924eebb3b24863

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
