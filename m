Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE32020A57C
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 21:14:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E8691917;
	Thu, 25 Jun 2020 21:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E8691917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593112476;
	bh=tOQefQlo/4WDe+47uHGcZESDTbY90cFY/SuuWR2gmZE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LG3A/0I0esjP16QneATkeEJHfz7AaVSB/xCqA55v8Pd9YgdQctDZFQENjFTOgONFV
	 Dvx87F1pb14/qv4ZxDbVmnuFKfp315guyo4xCRCie0yRqdvHr/WOFMNYbDj/lW5rkk
	 UU8VMI6yZLDLOr34pmHA5c60ViaeNZX55Hh6D49c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 247A4F8025E;
	Thu, 25 Jun 2020 21:12:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AF2CF80234; Thu, 25 Jun 2020 21:12:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68DADF80234
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 21:12:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68DADF80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2i1pA4R0"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7183B2076E;
 Thu, 25 Jun 2020 19:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593112325;
 bh=tOQefQlo/4WDe+47uHGcZESDTbY90cFY/SuuWR2gmZE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=2i1pA4R0O0vpEKWtLxHOZwVCvEavX5cbf1yVu/YA6b5whxhDCGLRkLpX4DG3KwJtW
 wpXceyTXGx3NGjlr2d5C9vQWg0IMmnO5h+uENxBNLLRzpcxOv6QZ4I3KAdIptM+4cc
 rYAW78k/NlZRy6D8Nb4McnMZxRndq6xoVzItwQuI=
Date: Thu, 25 Jun 2020 20:12:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20200625153543.85039-1-tzungbi@google.com>
References: <20200625153543.85039-1-tzungbi@google.com>
Subject: Re: [PATCH v2 0/3] ASoC: rt1015: fix compilation errors and warnings
Message-Id: <159311231750.10637.12370136760007816881.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org
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

On Thu, 25 Jun 2020 23:35:40 +0800, Tzung-Bi Shih wrote:
> The series fixes compilation errors and warnings discovered in the thread
> https://patchwork.kernel.org/patch/11622319/.
> 
> The original patch:
> (1) adds acpi.h for fixing implicit declaration of function 'ACPI_PTR'
> (2) sorts header inclusions in alphabetical
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: core: move definition of enum snd_soc_bias_level
      commit: 10e834099d38dd2c02bf2bd5feaa3997cfcf139f
[2/3] ASoC: dapm: declare missing structure prototypes
      commit: 3d62ef4280a377bb2ccaee4e8f6c5093f5b8f9d4
[3/3] ASoC: rt1015: add missing header inclusion
      commit: 72ac4a4bef48e67bb26bc5a01d68c8163def013d

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
