Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B0C279290
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 22:46:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE6BD193C;
	Fri, 25 Sep 2020 22:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE6BD193C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601066795;
	bh=LJ5Wq7Ghlg4aaCr8Y6wHkODK/JS9MUf2NYdYnegp7ew=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZQZPHGkEaQSeY3N/eTgSOTW+38ABKCZmDzbtX4bGv6cbkNIIiK8/ocKI5C71UC6Ad
	 x+vn7HLu2qdHBg2b1UR5ptEur4Gcfr5PdDkSGrgseygKy3r6kNgaGyRFglQJ+ImNUC
	 IP96RS7n30AyhsPp+H/VHRq4MTT1woykbk+YtT+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A4B3F802EA;
	Fri, 25 Sep 2020 22:42:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98932F802E7; Fri, 25 Sep 2020 22:42:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 607EDF802DC
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 22:42:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 607EDF802DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GIUZnJrR"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D82720838;
 Fri, 25 Sep 2020 20:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601066556;
 bh=LJ5Wq7Ghlg4aaCr8Y6wHkODK/JS9MUf2NYdYnegp7ew=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=GIUZnJrR7cU/+X537LFf4l4Pgd3gAxHmvwfaAD2WCed1p5GrKginNxqvvX1jofR3U
 8P3TErmQ7onDMGJoxLG6erq4/UBU/Dm8KPKm8CAUol8Yrc0p84rDTwQ/GnKP3KwcgN
 1y0p3pN+UWpOL6y/kGgw44rVIXXqJb4Xy0PN/qqg=
Date: Fri, 25 Sep 2020 21:41:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20200925163552.20717-1-srinivas.kandagatla@linaro.org>
References: <20200925163552.20717-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 0/2] ASoC: qdsp6: fix some warnings when build without
 CONFIG_OF
Message-Id: <160106647647.2866.17095858742124521206.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org
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

On Fri, 25 Sep 2020 17:35:50 +0100, Srinivas Kandagatla wrote:
> Here are fixes for two warnings types discovered while building qdsp6 drivers
> without CONFIG_OF and with W=1
> 
> One of them was reported by Intel kernel test robot on q6afe-clocks patch, which
> equally applies to rest of the qdsp6 drivers.
> 
> changes since v1:
> 	- added ifdef CONFIG_OF instead of removing of_match_ptr
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: qdsp6: add ifdef CONFIG_OF around of_device_id
      commit: 156d0273f62fd437b25dced944788d8784f0212c
[2/2] ASoC: q6asm: fix kernel doc warnings
      commit: 5d0576bba9eb37bf07dc58a91568a2332a22fbcd

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
