Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D539228D56
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 02:59:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BBB81664;
	Wed, 22 Jul 2020 02:59:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BBB81664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595379593;
	bh=koNxJKTh7G56Ng1o3vV6ECm51Ywis8J9Y2mpLAnScC0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GgXDBlkUOuiiUF4lllYYC+hQS8evlHOUqgoFrTuOR/RKhd8rb/Fotf6PUUzeTlFoF
	 DdvVWfyLJLUuiLbDgP7CWSMpQwJ8REDF9ezRyEsYImQ2ilZ+cvMD/VyeyDTLYDY0PV
	 R7viTyHfe1X44YHfr1HKP/oPPueZmvwwo+3nDU5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18DE1F8028B;
	Wed, 22 Jul 2020 02:57:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4EFBF80278; Wed, 22 Jul 2020 02:57:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6A05F80087
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 02:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6A05F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kSPbLo1M"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E71F92077D;
 Wed, 22 Jul 2020 00:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595379427;
 bh=koNxJKTh7G56Ng1o3vV6ECm51Ywis8J9Y2mpLAnScC0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=kSPbLo1MeunulSDuATEGZ9Rl/xynpCbOnuzduchnnmu1aFgmpoVmCDaOcg+e6MWBK
 ilxgF+sDkwH98LChixBoRvMZTWDmQkyaJ8sr6l7Swr9vd4lzvl3iLg285tewLv9lUn
 IBx7raMYhsrxp/g/IJJ2MwqUQeyPXybIutWIKnlE=
Date: Wed, 22 Jul 2020 01:56:54 +0100
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, tiwai@suse.com, perex@perex.cz, shifu0704@thundersoft.com,
 Dan Murphy <dmurphy@ti.com>, lgirdwood@gmail.com
In-Reply-To: <20200612171342.25364-1-dmurphy@ti.com>
References: <20200612171342.25364-1-dmurphy@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: tas2770: Convert tas2770 binding to yaml
Message-Id: <159537940423.49432.13949737957627950066.b4-ty@kernel.org>
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

On Fri, 12 Jun 2020 12:13:41 -0500, Dan Murphy wrote:
> Convert the tas2770 binding to yaml format.
> Add in the reset-gpio to the binding as it is in the code but not
> documented in the binding.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] dt-bindings: tas2770: Convert tas2770 binding to yaml
      (no commit info)
[2/2] ASoC: tas2770: Fix reset gpio property name
      commit: 58b868f51d6e38146e44cb09fcd92b5fc35d83bc

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
