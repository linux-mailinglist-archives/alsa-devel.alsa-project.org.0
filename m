Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A04D1D3799
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 19:08:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FCEB166F;
	Thu, 14 May 2020 19:07:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FCEB166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589476086;
	bh=YW9wuTxuRvYF57tgugoM+Q4D773LEH8szJcXifA1DpU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MKSGSdThaGOtxEw2hTRI9dE8ZX7pNa9NsAv+VLnvHweQqc6FELEranuSOLYi4cU9b
	 ahR6JXSSTzMG53u8r5LDRSahte9HjNiNFbq4kJ/JEQjoLopRkZc74weii6HfOa4aC1
	 jeFUuc/imoI7b/t+4k+oJfYF3ZHv9rX5l1/P2Ddg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC58CF800E3;
	Thu, 14 May 2020 19:05:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F339AF80227; Thu, 14 May 2020 19:05:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8022BF801DB
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 19:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8022BF801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VSFr/FWR"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72C112065F;
 Thu, 14 May 2020 17:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589475937;
 bh=YW9wuTxuRvYF57tgugoM+Q4D773LEH8szJcXifA1DpU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=VSFr/FWRfpW8XQKjLi8GnhOj6GcgNR7W+29Dzelr7M0k1jsiDgAk9uIOU4Pkp/Dp3
 fEYyM1iEqQ7k6I8TTt/jksD5k4X2P079gge+Dgp6Q4MD5NGSyFLZpgWXdwk9FHb5Kt
 VoLhw+BQcMLEWny2kTBy6kxBuljDquTHDq1RjzJ4=
Date: Thu, 14 May 2020 18:05:34 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, lgirdwood@gmail.com, Dan Murphy <dmurphy@ti.com>,
 perex@perex.cz
In-Reply-To: <20200513200549.12213-1-dmurphy@ti.com>
References: <20200513200549.12213-1-dmurphy@ti.com>
Subject: Re: [PATCH v2 1/3] ASoC: tlv320adcx140: Add controls for PDM clk
Message-Id: <158947592846.11145.4394826289935781391.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Wed, 13 May 2020 15:05:47 -0500, Dan Murphy wrote:
> Add ALSA controls to configure the PDM clocks.
> The clocks need to be configurable to accommodate various microphones
> that use clocks for low power/low resolution modes to high power/high
> resolution modes.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/3] ASoC: tlv320adcx140: Add controls for PDM clk
      commit: 7cfa610205d95357f9eface292dc70fce7571f65
[2/3] ASoC: tlv320adcx140: Add device tree property for PDM edges
      commit: 75b0adbb0806a141b0b5f074cd6bd58bb9870c0d
[3/3] ASoC: tlv320adcx140: Configure PDM sampling edge
      commit: 79fc48e41e39d7a98c5f8ae37f613d7ff9953c86

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
