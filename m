Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 703691C3959
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 14:29:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1265416FC;
	Mon,  4 May 2020 14:28:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1265416FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588595388;
	bh=GdIw4lNqvqQjAHmIQlTLFlfM7G6NgCsnVg/dTwDvxBo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=APN13NwmbrLD0abyMDKl90Rt5Ifr4GFXfEeNnqI8lDxYwsmm6YwtuRWq3/NPKcNYS
	 vAacOIumIkWcJ+6pEC5hU4ZETNg5UqPZXkm41bHFUC0WMGWaxgSyxWnPAcfr312ra/
	 ApMl2YK/O4MK97jzAoLmWplTqzzLm0UpCMb/DID4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 840D8F800E5;
	Mon,  4 May 2020 14:27:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC943F8026F; Mon,  4 May 2020 14:27:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC93CF800EE
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 14:27:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC93CF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s3F1M6Mb"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB86B2073B;
 Mon,  4 May 2020 12:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588595237;
 bh=GdIw4lNqvqQjAHmIQlTLFlfM7G6NgCsnVg/dTwDvxBo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=s3F1M6MbxzFWDPRevfiOdS8Zejwyn6cR+8dYusMdcsIVzyjtnQlBiLqhlbvgIyG2N
 XlZAM53uAM/xSPA1f5Pxl3ckkAY0AGvOsyHalt/ZLJOHR6jcN4FmDTaVpNP7enYZ/n
 NmvvJ3pn9Xir0AzbK7Sbi44XvD00JaLHnPcfgys4=
Date: Mon, 04 May 2020 13:27:14 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Oder Chiou <oder_chiou@realtek.com>
In-Reply-To: <20200504074007.13002-1-oder_chiou@realtek.com>
References: <20200504074007.13002-1-oder_chiou@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: rt1308: Revise the devicetree file mode
Message-Id: <158859522870.21499.15573010448220505658.b4-ty@kernel.org>
Cc: shumingf@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 derek.fang@realtek.com, flove@realtek.com
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

On Mon, 4 May 2020 15:40:06 +0800, Oder Chiou wrote:
> The patch changes the devicetree file mode correctly.
> 
> Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
> ---
>  Documentation/devicetree/bindings/sound/rt1308.txt | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  mode change 100755 => 100644 Documentation/devicetree/bindings/sound/rt1308.txt
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

Thanks!

[1/2] ASoC: rt1308: Revise the devicetree file mode
      commit: afcbaa20d662ce8c78b70e953fa8a045c7a243fb
[2/2] ASoC: rl6231: Add the K bypass for the PLL parameters
      (not applied)

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
