Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C850656615
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 00:36:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 231C165D6;
	Tue, 27 Dec 2022 00:35:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 231C165D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672097786;
	bh=hI0abZTfZBfmL7iS41Sw/Kw7JuoSmWB5bH2uy6CIx0Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ozkx29qhkOzon/IhgsJJ59n13T/USrcCPP+UJaYBWi5SdwAchXkUmSFLx0EGJsBVT
	 GTg49L+kPPQ8rbKIEgh2wqSXmDnZSCwW9qqp5RCLWAtKvbeV1ZwUtM+kgwkXbC4PlE
	 Q5ob0oRp8w+dLpfFifkQektVUVEn+Z88zrNHYpQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26A38F8055A;
	Tue, 27 Dec 2022 00:34:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13B39F80538; Tue, 27 Dec 2022 00:34:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22E58F8052F
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 00:34:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22E58F8052F
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SO5NI+Q8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D158A60F5A;
 Mon, 26 Dec 2022 23:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C2AC433F1;
 Mon, 26 Dec 2022 23:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672097652;
 bh=hI0abZTfZBfmL7iS41Sw/Kw7JuoSmWB5bH2uy6CIx0Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SO5NI+Q8paXlF7tZMy3yL1VvIsR8LUFy1NOHEw7fxL2wJT08iQDN+HPe7hAd8wQhi
 S3KaqrRQ9EbvAvIbrCXgjuvBrzpBjnaYGlHkb6RCYX//PeRwmmlnjW//sVi9eJ8CDm
 JTvetu5X0ghrAQRcJFc5j1PIHsxC7cir5nh7NAVE3vgWgdaKzarPSvYph/n+ERPmpe
 NDO562ouyEeJdZ94jfLHSy3WHyvWL0F5Af5oEQAakm3QdzWWyT53XdiSh6VkYN6qdH
 0GzKgFEt6e7ljg7Fe+dWG2cG+M6GVwfC6GZbD+hNygvg/6WZ1KOdu+7unjIn5E7OqJ
 G/mDKqY4Yb45w==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20221222042624.557869-1-ajye_huang@compal.corp-partner.google.com>
References: <20221222042624.557869-1-ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v3] ASoC: Intel: sof_nau8825: add variant with nau8318
 amplifier.
Message-Id: <167209764839.330820.10080062555953013632.b4-ty@kernel.org>
Date: Mon, 26 Dec 2022 23:34:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
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
Cc: Libin Yang <libin.yang@intel.com>,
 "balamurugan . c" <balamurugan.c@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 David Lin <CTLIN0@nuvoton.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 alsa-devel@alsa-project.org, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Yong Zhi <yong.zhi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 22 Dec 2022 12:26:24 +0800, Ajye Huang wrote:
> This patch adds the driver data for two nau8318 speaker amplifiers on
> SSP1 and nau8825 on SSP0 for ADL platform.
> 
> The nau8315 and nau8318 are both Nuvoton Amp chips. They use the same
> Amp driver nau8315.c. The acpi_device_id for nau8315 is "NVTN2010",
> for nau8318 is "NVTN2012".
> The nau8825 is one of Nuvoton headset codec, and its acpi_device_id is
> "10508825".
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_nau8825: add variant with nau8318 amplifier.
      commit: ba7523bb0f494fc440d3a9bb0b665cfcaa192d0c

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
