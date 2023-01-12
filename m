Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFB86678B9
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 16:13:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF5179150;
	Thu, 12 Jan 2023 16:12:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF5179150
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673536389;
	bh=i0txVsnRMPVTx90fZAVv/lr9sSoXFnlMzEdCAzHbd7Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PbrCv9KEh34TE/iWtS4bKTqGD+C2fqoh+XlRrh74cKl+VBVDynQ2nmEzSIRVI/JWQ
	 pCcc3tqKf80b11DwB6cdHGyWoGx2RKvKRlwkRL5fR3PAizUxSln+zAKLoEDj9W0Ifc
	 MH3WmzCrJhWzKL1KJvquQ2h3moBe2cit094UIAJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76A12F804DD;
	Thu, 12 Jan 2023 16:12:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1337AF8013D; Thu, 12 Jan 2023 16:12:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DFF4F8013D
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 16:12:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DFF4F8013D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lfUeVfF1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A747D62036;
 Thu, 12 Jan 2023 15:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C391C433EF;
 Thu, 12 Jan 2023 15:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673536331;
 bh=i0txVsnRMPVTx90fZAVv/lr9sSoXFnlMzEdCAzHbd7Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lfUeVfF1uD9Jl5jhUegEPsNHMNp8Jv2nzFsvxLY1mgE8QB5ixnYXcXbx3yWBZnIIb
 yOdz7iYpdjo7Hz6viaj3vZoufFie4a7ZGDwfo0RftI9Jlx1fMgTORNC31JBm7zrCiy
 K1kOvaKdgKLOoXpw+FzuX81Tdl2REC5PEDfF2S+l1Xu9s+3IZnkKKWR2Qik3edZmep
 1UauMRowgSiwu6mhI9OpKCslVCm8nevnoDo2iTUsg8xxOxP61+XHKvzB9sIso7AXjl
 zX0eWYf01KKtasGh044lNkr40w17pmxHwdpLToXmPOsvbxl0PlL+pFo5hCFM6VKovq
 scrjuj/Urc++A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
In-Reply-To: <20221220072705.1456908-1-venkataprasad.potturu@amd.com>
References: <20221220072705.1456908-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH 0/5] Add tdm support in acp machine driver
Message-Id: <167353632896.2136827.8680445783031086400.b4-ty@kernel.org>
Date: Thu, 12 Jan 2023 15:12:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-8b3d1
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
Cc: vsujithkumar.reddy@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, ssabakar@amd.com, Vijendar.Mukunda@amd.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 20 Dec 2022 12:57:00 +0530, Venkata Prasad Potturu wrote:
> This patch set is to add new cpu dai, refactor dai format
> implementation and add tdm support in acp machine driver.
> 
> Venkata Prasad Potturu (5):
>   ASoC: amd: acp: Refactor i2s bclk calculation
>   ASoC: amd: acp: Add new cpu dai's in machine driver
>   ASoC: amd: acp: Refactor dai format implementation
>   ASoC: amd: acp: Add tdm support in machine driver
>   ASoC: amd: acp: Enable tdm support for skyrim platforms
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: amd: acp: Refactor i2s bclk calculation
      (no commit info)
[2/5] ASoC: amd: acp: Add new cpu dai's in machine driver
      commit: 099b923fc15d8faa91c5fc1b46cbc483d034f5dc
[3/5] ASoC: amd: acp: Refactor dai format implementation
      commit: af830fc44a2d273b163e76b17f51b128ce694481
[4/5] ASoC: amd: acp: Add tdm support in machine driver
      (no commit info)
[5/5] ASoC: amd: acp: Enable tdm support for skyrim platforms
      (no commit info)

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
