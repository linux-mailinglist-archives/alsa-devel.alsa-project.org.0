Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5617A355A95
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 19:42:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4F7D1669;
	Tue,  6 Apr 2021 19:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4F7D1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617730948;
	bh=fdAqLNrecElI7SK1mBUMrgnZscfzo3KjrO++6q3ijUw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ThTYG7u6WRi/cZxG1YA4L9tu9/oBT29QfmliYKzbJMR7Jl0Ep+U4mhlL9BAoO2i7Y
	 s4jyeS4CWSvzXa7mzSHfexbrpXAeZ6+QOOaw2Unun5yc8KXhmbrf29VMGAfw0Je3sY
	 5IfQOlW2vXudNp/OnWkXbVw6Jn+czchQrnhakSz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 210BCF80169;
	Tue,  6 Apr 2021 19:40:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76724F8025D; Tue,  6 Apr 2021 19:40:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1132F800E3
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 19:40:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1132F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GYbKikOh"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5FB4B6113C;
 Tue,  6 Apr 2021 17:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617730799;
 bh=fdAqLNrecElI7SK1mBUMrgnZscfzo3KjrO++6q3ijUw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GYbKikOhhiysJWkDX+3LzDOabPHHhiIIrp9uumWVERifH/ftmzrth1/l3zQwOrahC
 wuYUoYSjzpkCwPVCN568qcijOziRaXTNBI993oGuInUaeB3FfVujTFbAsNUb6btirA
 zGPJpb/6sVxX+TfCror3X0h9xR4d9ONPL7/vuZKzfle8iyANhLBYgeJHfgnw9gkafG
 GnpnsETRi1n38kMDOEvVEwQrFWGL58yMITRAVZKCo/dVMJY0DS0P1HgZ9UpepcrjQ+
 8ELmynkzUn4nB0sgoQmMI8OwMJny4kCbjrakFIXl/EgFem6V8SXPbTyvMmaJIv6ypK
 B5cheXiizoI5A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
	vamshi.krishna.gopal@intel.com
Subject: Re: [PATCH v3 0/2] kbl_da7219_max9357a machine changes for wov and MST
Date: Tue,  6 Apr 2021 18:39:38 +0100
Message-Id: <161773049108.51713.2659365364910873959.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405124835.71247-1-vamshi.krishna.gopal@intel.com>
References: <20210405124835.71247-1-vamshi.krishna.gopal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: harshapriya.n@intel.com, mac.chiang@intel.com,
 Mark Brown <broonie@kernel.org>, sathya.prakash.m.r@intel.com,
 biernacki@google.com, pierre-louis.bossart@intel.com
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

On Mon, 5 Apr 2021 18:18:33 +0530, vamshi.krishna.gopal@intel.com wrote:
> This patch series about creating dailink for Wake on voice functionality
> and also adding MST route changes.
> 
> changes in v3:
> 
> -Remove DP from widgets
> -Add MST support in other routing table for kbl_rt5663_max98927.c
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: kbl: Add MST route change to kbl machine drivers
      commit: c7c19ec098b862a688291f5a1101f7de6e4b0a6c
[2/2] ASoc: Intel: board: add BE DAI link for WoV
      commit: 74ed9e9bfb7343b0a6710b651df66f3d68551110

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
