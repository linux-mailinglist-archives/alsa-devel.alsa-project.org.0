Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D75124FEFD
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Aug 2020 15:34:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3E261673;
	Mon, 24 Aug 2020 15:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3E261673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598276044;
	bh=kQqPOp5ZCYfc0mhvDYZD0wZbCw7iw9QkX4jllZTFUSI=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FN1/F1CXZYAYc35tqarq0MB0zwf4A1F/v+XoZa8uEoRGg0TQhJbK8I4BHXF4jBFE3
	 JZaXVvjWqiGakxwLKCXVrjWpuDFVOaldNZOO2ICljJTrDhNbc+4zn/CN2edK6zvMZg
	 IV1v5MnlUqOc7s2ynUNV2jwowF7OzsMJEu/mHiS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF9CAF801EC;
	Mon, 24 Aug 2020 15:32:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91F9DF800EB; Mon, 24 Aug 2020 15:32:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3355DF8016F
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 15:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3355DF8016F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eCklyBpB"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D4F721775;
 Mon, 24 Aug 2020 13:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598275931;
 bh=kQqPOp5ZCYfc0mhvDYZD0wZbCw7iw9QkX4jllZTFUSI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=eCklyBpBial1yRqp01SYpxNYkhwfj/NIYL96JuW77mjEGx35i2/NZPCwfnryUfF1D
 fbmxsdpz8xFmdyUTemS9FlsbzZel+3JWmtqVjpKOWN+rOD/tilQ/2/lPtxuUT1wDgz
 Y+9T6EyLbOgrJdWqXdJfR04934FWBFLCDkeOXFII=
Date: Mon, 24 Aug 2020 14:31:36 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, perex@perex.cz
In-Reply-To: <1598190877-9213-1-git-send-email-shengjiu.wang@nxp.com>
References: <1598190877-9213-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: ak5558: Add power supply property
Message-Id: <159827589162.47809.9128717521868705111.b4-ty@kernel.org>
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

On Sun, 23 Aug 2020 21:54:36 +0800, Shengjiu Wang wrote:
> AVDD-supply is for Analog power supply
> DVDD-supply is for Digital power supply

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: ak5558: Add power supply property
      commit: 5edc8c4fe019b920ae9bd1e3413d66f6e8adf29b
[2/2] ASoC: ak5558: Add regulator support
      commit: 2ff6d5a108c6b7c07d1093c38e0def015edd325d

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
