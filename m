Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 494903D2ADB
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 19:13:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1F171710;
	Thu, 22 Jul 2021 19:12:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1F171710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626973985;
	bh=c/r05jnGbq/nHLz0Un8lx7+6395Tpl4CZ/372Di0ubA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OkMj6My9WMqAQRvdQUmQImlj0ppLwodqkF7+hzGWSXgHARHWLmMyJVq9K8TMDMUZQ
	 gzvvUwIGv/eC9Crub2eBiKBnCPtDGadNRb5WOMBUTe9iahPdaUOaMlj5F/KRDgLzgz
	 pS3/TkQFGNTqCx2cjrZHCvfFjDVsP4KhRiUVaB8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DECB8F804E3;
	Thu, 22 Jul 2021 19:10:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98756F804E2; Thu, 22 Jul 2021 19:10:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36EC4F80218
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 19:10:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36EC4F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="olNEVnFT"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 310D161241;
 Thu, 22 Jul 2021 17:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626973835;
 bh=c/r05jnGbq/nHLz0Un8lx7+6395Tpl4CZ/372Di0ubA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=olNEVnFTyFbQoyrC8A/9Yy6oBYdSLuvNi2OjFMAb9JzNH0Uk55451ktbiyg2C9U7C
 TwhhA4NcNtStIymtbAJ6LDGkQ+rTOsbtBcA4Nn+fh9m8MGPoxCydKnWjUGUYX32coC
 5lUS8BpxO2hWevUwsmFT7na1yMHRE+Vy3fWkoFamCs7mTiCsIVyYybRF3whkQguvbE
 1wX2s9LiZnFp3brNA7W2g+k8k53bS/iccagDWuoPZheg4BnGeS2qlanCIGeHDIuhRY
 su3SN+zzH4O3F7F5dKMGcpe11GBsEXteGtOhTstrg180KQYF+JGxlquVZdH1rQe02x
 kQpQtDtsJp3mg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
	Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] ASoC: tlv320aic32x4: Fix TAS2505/TAS2521 processing block
 selection
Date: Thu, 22 Jul 2021 18:10:04 +0100
Message-Id: <162697068325.1747.58888733005352259.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210720200348.182139-1-marex@denx.de>
References: <20210720200348.182139-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, ch@denx.de
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

On Tue, 20 Jul 2021 22:03:48 +0200, Marek Vasut wrote:
> The TAS2505/TAS2521 does support only three processing block options, unlike
> TLV320AIC32x4 which supports 25. This is documented in TI slau472 2.5.1.2
> Processing Blocks and Page 0 / Register 60: DAC Instruction Set - 0x00 / 0x3C.
> 
> Limit the Processing Blocks maximum value to 3 on TAS2505/TAS2521 and select
> processing block PRB_P1 always, because for the configuration of teh codec
> implemented in this driver, this is the best quality option.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320aic32x4: Fix TAS2505/TAS2521 processing block selection
      commit: 090c57da5fd59fb59adc9d9341a77558c93b0abd

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
