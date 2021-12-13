Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C844737C7
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 23:44:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8ADC18ED;
	Mon, 13 Dec 2021 23:43:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8ADC18ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639435459;
	bh=eGOn9R4/r9WTJ3fguC8+nzmsSiBmWCn5D/O1wRbjkec=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bZ2q2T95T/cp/jNDLxinIiU46Bbt3CFVja/fdsI+tEVR9iuRDOc6u+cspbfBAo1jy
	 JjB3OAh6foTEb/nXLf/NhqShIZHDCtkTW+ZtVi+OzEC/q8F5A5fUGoI69rgV3iu4rQ
	 2kX19GrT/Fh6B2wTiJyQTKCstRpi4Sad+i6DVtUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEBD4F8050F;
	Mon, 13 Dec 2021 23:42:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E410F802E8; Mon, 13 Dec 2021 23:42:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 289A2F8027C
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 23:42:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 289A2F8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ELty3FkC"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2870AB816CE;
 Mon, 13 Dec 2021 22:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B517C34600;
 Mon, 13 Dec 2021 22:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639435351;
 bh=eGOn9R4/r9WTJ3fguC8+nzmsSiBmWCn5D/O1wRbjkec=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ELty3FkCr60mWZyKXZzkFM074a0u2GLBDsaPaxay6zH+YMAKnjCRtZ7TfvOPeFBix
 GTTwtDLrwmtWj5DA/WcThDztMsAbraIw48yxtYolzZlBATX5xVE7nVM1JtDUcylzn+
 TwALQqlGFHlOsCCgec/TuGvocfwi57W9xkxz1V2k1FPRBAyVxQs9sKBTP2LiFj0HLC
 RB7GllpXVT6SFwB+O1RjZSMKarlIhALb3rdLJCLtD8o5OEPmBRgXNZ4QoHYtat039O
 hx6RE7MFR22eHQTKe0dkE9r0ABOBJ3zvbqPH4GcKGwRC/+kHaBM3XJa3c2GoivDxLJ
 0HYqR8oSQzriA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>
In-Reply-To: <20211206154624.229018-1-thierry.reding@gmail.com>
References: <20211206154624.229018-1-thierry.reding@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: tegra: Document interconnects property
Message-Id: <163943534909.1016050.10549071402255477167.b4-ty@kernel.org>
Date: Mon, 13 Dec 2021 22:42:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org
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

On Mon, 6 Dec 2021 16:46:24 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the interconnects and interconnect-names properties to the bindings
> for the sound card on various NVIDIA Tegra based boards. These are used
> to describe the device's memory paths to and from memory.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: tegra: Document interconnects property
      commit: 5f9155a7d2dc067d72a95b42168f944c7710c0d5

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
