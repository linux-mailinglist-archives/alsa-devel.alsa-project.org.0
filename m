Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBFA455092
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 23:33:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B24BA1909;
	Wed, 17 Nov 2021 23:32:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B24BA1909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637188417;
	bh=0EBn4iFas/lVt0Plr8qx6oSNvIZ4IcS+xI8hMFa4Mu8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZFujp6k4AAjdDEb0mAEGydT/16R+mN0h8pfT7pUm0yfqT+ke3W6DWD+ji+Jji3W40
	 51fgP+wZfGUGBdyFJI4PCQLsBiGEw5FFmuSOT9Z1NTs7to2KFW5jfWwhWFW3uRpc70
	 wq38LFJo1h/TS18R3KUXZBrEOf1jChCH75ugyUSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71E63F804EB;
	Wed, 17 Nov 2021 23:31:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E93DCF804BD; Wed, 17 Nov 2021 23:31:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36B64F800FA
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 23:31:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36B64F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i93whKvl"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FC9C61B5F;
 Wed, 17 Nov 2021 22:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637188291;
 bh=0EBn4iFas/lVt0Plr8qx6oSNvIZ4IcS+xI8hMFa4Mu8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=i93whKvlivBz1M3F37Lm2fKtFcC/L3usl/3SoZR5qIISZp0IZLXlSVwKP5U69V7vt
 9Fnrim3Io2Ri3J8PgEAaGY+kz1egw3swHcvZ29vzLK39OrA6mMvEPUS+8M2/aoU5KD
 SbQD1kCbxMJ75FxITmFrng+GoxCslLNJmKooNzN65+xIIetVPA8bIh3jCGZbX9MKfV
 Sc0Oa3PLP0Fb112VxoTS+vNhhhq0MPTlsSR8bSKme7h+XLMyk1LcN7mXngoLaWeAXb
 FHOktjxeBs162nyB1EqA0UvMnm7v9WD3NUDqn69c/bZV2r7Ewla0ZJE+TJlHkmLl+T
 rnzIbUfAiwtgA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH 00/21] ASoC: SOF: Platform updates for AMD and Mediatek
Message-Id: <163718828906.136850.1487051712790530066.b4-ty@kernel.org>
Date: Wed, 17 Nov 2021 22:31:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, daniel.baluta@gmail.com,
 AjitKumar.Pandey@amd.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 Julian.Schroeder@amd.com, linux-mediatek@lists.infradead.org,
 Balakishore.pati@amd.com, yc.hung@mediatek.com,
 vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com, daniel.baluta@nxp.com
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

On Wed, 17 Nov 2021 11:37:13 +0200, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> This patchseries adds Renoir ACP HW support and Mediatek MT8195
> platform.
> 
> Notes:
> - I first send the meditatek support in a previous emails but it failed
>   to apply because there are some dependencies on AMD patches related to
>   DAI ids.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/21] ASoC: SOF: amd: Add Renoir ACP HW support
        commit: 846aef1d7cc05651e27c17c3b4e2b5ce5cdec97b
[02/21] ASoC: SOF: amd: Add helper callbacks for ACP's DMA configuration
        commit: 0e44572a28a49109eae23af1545c658b86c4bf00
[03/21] ASoC: SOF: amd: Add fw loader and renoir dsp ops to load firmware
        commit: 7e51a9e38ab204eba2844b8773486392d7444435
[04/21] ASoC: SOF: amd: Add IPC support for ACP IP block
        commit: 738a2b5e2cc9fd63d48faac11c8d60a5a2313a9d
[05/21] ASoC: SOF: amd: Add dai driver dsp ops callback for Renoir
        commit: bda93076d184ad80a8cab09bf29ace7692de18f7
[06/21] ASoC: SOF: amd: Add PCM stream callback for Renoir dai's
        commit: e8afccf8fb75bae9c3292a0e51593af92839415e
[07/21] ASoC: amd: Add module to determine ACP configuration
        commit: f1bdd8d385a803565024c8feeedc17bf86aac4f5
[08/21] ASoC: SOF: amd: Add machine driver dsp ops for Renoir platform
        commit: 11ddd4e371810017faf7ff7cb2349f321e50d1d3
[09/21] ASoC: SOF: amd: Add Renoir PCI driver interface
        commit: ec25a3b14261fcb05568a1fec15ca68152e9d208
[10/21] ASoC: amd: acp-config: Remove legacy acpi based machine struct
        commit: 63fba90fc88b6cee9f8bead761a419169ecda6cc
[11/21] ASoC: SOF: topology: Add support for AMD ACP DAIs
        commit: efb931cdc4b94a0f7ed17a76844f08cef1bdffe5
[12/21] ASoC: SOF: amd: Add trace logger support
        commit: 4627421fb883928af5220c66a304bed1f9b77e8d
[13/21] ASoC: SOF: amd: Add support for SOF firmware authentication
        commit: f063eba3e7a6aeec8e2abb00469e70c51432453b
[14/21] ASoC: SOF: mediatek: Add mt8195 hardware support
        (no commit info)
[15/21] ASoC: SOF: tokens: add token for Mediatek AFE
        (no commit info)
[16/21] ASoC: SOF: topology: Add support for Mediatek AFE DAI
        (no commit info)
[17/21] ASoC: SOF: mediatek: Add fw loader and mt8195 dsp ops to load firmware
        (no commit info)
[18/21] ASoC: SOF: Add mt8195 device descriptor
        (no commit info)
[19/21] ASoC: SOF: mediatek: Add dai driver dsp ops callback for mt8195
        (no commit info)
[20/21] ASoC: SOF: mediatek: Add mt8195 dsp clock support
        (no commit info)
[21/21] ASoC: SOF: mediatek: Add DSP system PM callback for mt8195
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
