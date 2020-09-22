Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDAE273725
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 02:10:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3F0816C8;
	Tue, 22 Sep 2020 02:09:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3F0816C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600733433;
	bh=eQm4+4KLm1xSwr5sg6h3TpmW1fONFAnc7NAdHhTHU8E=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IcbUKZiETeXI7afi8WL+pZMXhJOfN1Kg/zeFCM1ig7oxG+3/TIHtf1mp/A1I6a/+B
	 o/nVIwXQB7K0QAu8Wu9k9BGvsaXAqYnY9mOzEYGxCxabHVu+DEKJLZyOk/otkr5Qgf
	 ODKI3R7eBPXzrIfbdGt4IwJZhiTAK2vtmMFxj5a8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 943EDF802E2;
	Tue, 22 Sep 2020 02:06:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8351F802E1; Tue, 22 Sep 2020 02:06:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29FC9F802DC
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 02:06:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29FC9F802DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L3q3mcJ8"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A963D21789;
 Tue, 22 Sep 2020 00:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600733201;
 bh=eQm4+4KLm1xSwr5sg6h3TpmW1fONFAnc7NAdHhTHU8E=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=L3q3mcJ8t6ySMY6obEzhyeNnflr3IqDDMC13/lO9Ca6AM3Bh2mOHUTf1CO9D9/76I
 WIlI6Ndb04i4e4MXnaQv+XYHXHuJyztRiudAM3eg413ttsDzzUJFQDvL26m6KbjqWv
 lSXhS2bpUS4kGJuYYA2lfMbsaL38ha8u3/r4HxTI=
Date: Tue, 22 Sep 2020 01:05:48 +0100
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 Dan Murphy <dmurphy@ti.com>
In-Reply-To: <20200918190548.12598-1-dmurphy@ti.com>
References: <20200918190548.12598-1-dmurphy@ti.com>
Subject: Re: [PATCH 1/9] ASoC: tas2770: Fix calling reset in probe
Message-Id: <160073312817.6173.8370528321313703432.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Fri, 18 Sep 2020 14:05:40 -0500, Dan Murphy wrote:
> tas2770_reset is called during i2c probe. The reset calls the
> snd_soc_component_write which depends on the tas2770->component being
> available. The component pointer is not set until codec_probe so move
> the reset to the codec_probe after the pointer is set.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] dt-bindings: tas2770: Fix I2C addresses for the TAS2770
      commit: b23d9eb897a1209e4d741fd69e5490f1b5b9e7cf
[2/5] ASoC: tas2770: Fix unbalanced calls to pm_runtime
      commit: d3d71c99b541040da198f43da3bbd85d8e9598cb
[3/5] ASoC: tas2770: Convert bit mask to GENMASK in header
      commit: ec9377dca2ca77eaf4fbdb09ac803f379b10d731
[4/5] ASoC: tas2770: Fix the spacing and new lines
      commit: d3964aff7331cd9695d0c18655e053b08837ff78
[5/5] ASoC: tas2770: Refactor sample rate function
      commit: be05ab41c61858cce557a1fe863ed00f38e31e97

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
