Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E03AF49FD71
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 17:01:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F38F1700;
	Fri, 28 Jan 2022 17:00:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F38F1700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643385686;
	bh=xxYQrH2a1nZXptgnuJ7VvYreXv9KZjIEe8yZ2pHXhhk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=maaRu6dnPjLS+yMzGBcfT3oqb0WaKdyTlYF+Tv1hdamiSeOfFf0nNo+OBxiaCNTP4
	 bWumg3oT1gS0xd55jfjvWy6QA7GQZsgAiw3xyQkpPZYrMlYVmsCe68+FHOiGpbySeV
	 1UsTi8DuT1AaNZGO0Y+XAk3hq/4pIFrZ8WLEzVoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12048F8051F;
	Fri, 28 Jan 2022 16:58:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40413F8051D; Fri, 28 Jan 2022 16:58:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAB3FF80519
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 16:58:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAB3FF80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z4v227kf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 938D061EBC;
 Fri, 28 Jan 2022 15:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B206C340E0;
 Fri, 28 Jan 2022 15:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643385533;
 bh=xxYQrH2a1nZXptgnuJ7VvYreXv9KZjIEe8yZ2pHXhhk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Z4v227kfRRGYnf1Q5/FYJ6MKhXs3TzPxC2gd5G5XrWF/m8vdh1N/EMSDSK4maKqUY
 TyFJkcz4I+XSgb/fbldko33Gkl1WpdlAp7g/KYYtaRuHfOVBNaELkJgsQEuVei1RlW
 MDY2jsqLUBEBbb6rafaGJ7qcJbET/ZUi9g/OF/Aw/LaDVo+BVyNtcSkK3WZ+/JDJm6
 8xo+A1E/AfyZQ3swzcivgX1LR8PO3Hvf4Sh6gxczZe0J2eDdj0Bm6kKnOvikcsNl1T
 NNiOBKx6yACa82jCPtn2r+iJsYuN+QHyiRCZGL8h/oHr1S8lTm6T2b+zAZtI8/3Sbb
 OwNLs4CfLOZVQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, lgirdwood@gmail.com, thierry.reding@gmail.com,
 perex@perex.cz, Sameer Pujar <spujar@nvidia.com>, robh+dt@kernel.org
In-Reply-To: <1643373476-8538-1-git-send-email-spujar@nvidia.com>
References: <1643373476-8538-1-git-send-email-spujar@nvidia.com>
Subject: Re: (subset) [PATCH v3 0/5] Tegra234 APE support
Message-Id: <164338552935.1711274.7611891938400157156.b4-ty@kernel.org>
Date: Fri, 28 Jan 2022 15:58:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, mkumard@nvidia.com
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

On Fri, 28 Jan 2022 18:07:51 +0530, Sameer Pujar wrote:
> This adds APE support on Tegra234 and enables sound card on
> Jetson AGX Orin platform.
> 
> 
> Changelog
> =========
>  v2->v3
>  ------
>    * Fixed DT build error related to power-domain and
>      iommu reference.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: tegra: Update AHUB driver for Tegra234
      commit: 4fcc8710fdd91b37760ccd99bbfbe10352df7600
[3/5] dt-bindings: Document Tegra234 APE support
      commit: fed44d6c3bcdb11ed77bc681f1cf80cbe8cfd9a5

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
