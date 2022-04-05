Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 229A44F2983
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:35:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98A831813;
	Tue,  5 Apr 2022 11:35:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98A831813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151354;
	bh=PTjivoyGXs/CkRZCvvCX+908n0DKoSEzUrbI2LgEOkc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A8KkYmGKSUkoORuvAMSZoE0QAtgXnK9W2IaZ32wbaYQ6zyvQ+p6d/jq/qmdyenoIr
	 egytnEIZjA6BKU5qoGAjEeZO5MY6lwrjNauCgBxf1IH+heo9zjZxQ2x1mYEdLgcC1N
	 1TW1eSkvDnYE19LRmQ9rURY0+p8ZGksb3oDWxriA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BC05F80571;
	Tue,  5 Apr 2022 11:31:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B198DF8056F; Tue,  5 Apr 2022 11:31:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A97CF80566
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A97CF80566
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QLoRWQ7g"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E71E4B81CB9;
 Tue,  5 Apr 2022 09:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C23C385A7;
 Tue,  5 Apr 2022 09:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151097;
 bh=PTjivoyGXs/CkRZCvvCX+908n0DKoSEzUrbI2LgEOkc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QLoRWQ7gd5z5sVQg4LVS16yj6W4zJt94Y1TN9AEsL3E9/j73G4vHGYcYX/FH1v/F7
 lFL3Oc/XpMBV1ulsVuHownh37cniGuzMtbPfXZqdeEiNh1EsCuxbew0E+lEpQCsRKO
 ywZ3zPExKGLFm2JDJshIRcjUNv9gtEv/2UCwFOf7gf/5XUajfZYKJaXg4vZfxWKS3r
 vbX7wf/taWf+UF9H/TVSuQarThNOpxLNVtM4zfYsYQEUfd3rfT/BytvnEu3fOx8gok
 V6AyV19s71iP64BMt01EzT4sOkMcv8g+yTWIBY4xcAnrSdTtPZ8KJg87RVEu5IQAgz
 Zffd90+4cW5Yw==
From: Mark Brown <broonie@kernel.org>
To: spujar@nvidia.com, lgirdwood@gmail.com, robh+dt@kernel.org, tiwai@suse.com,
 thierry.reding@gmail.com, krzk+dt@kernel.org, perex@perex.cz
In-Reply-To: <1648735412-32220-1-git-send-email-spujar@nvidia.com>
References: <1648735412-32220-1-git-send-email-spujar@nvidia.com>
Subject: Re: (subset) [PATCH v2 0/6] ASRC support on Tegra186 and later
Message-Id: <164915109452.276574.5258971838741299202.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Thu, 31 Mar 2022 19:33:26 +0530, Sameer Pujar wrote:
> This series adds support for Asynchronous Sample Rate Converter (ASRC)
> module on Tegra186 and later generations of SoCs. ASRC is a client of
> AHUB. The driver and DT support is added to make it work with Tegra
> audio graph card. The module can be plugged into audio path using ALSA
> mixer controls.
> 
> ASRC supports two modes of operation, where it gets the ratio info
> from SW and ratio detector module. Presently the support is added for
> SW mode.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: tegra: Add binding doc for ASRC module
      commit: c54ce1a17232215c4a518149292b41835992eee8
[2/6] ASoC: tegra: Add Tegra186 based ASRC driver
      commit: a2df8c2d5b36fc66b9a6e674f3e0c87c0b9d0a48
[3/6] ASoC: tegra: AHUB routes for ASRC module
      commit: 76821c139d7e0429845e7c0798747e7eec16ec83

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
