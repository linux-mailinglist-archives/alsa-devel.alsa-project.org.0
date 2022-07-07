Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F97D56A491
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 15:55:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AB041658;
	Thu,  7 Jul 2022 15:54:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AB041658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657202138;
	bh=bfSNl/kqtaSioIPpTfl5sDM6mMgQPB4Brm2wjepEylM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pbPDvwPyoOKg0G/Uen6pRC/0bMjnjB2T3gC21QavLqAOLEdU2j8X6yRdBh6+DCT95
	 viLf+GWLu5MAG/5DNoJrtM4E1zrStN+nckIdGtqyOvFqHEQ3FT4fUZts8ri/lZEYCy
	 yQhs/uZmLMgr9AZWMoz+GOXUd1Rwd/7ZSUl5vkfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95FA9F8053A;
	Thu,  7 Jul 2022 15:54:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C146F80539; Thu,  7 Jul 2022 15:54:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62C5DF80104
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 15:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62C5DF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SPH64QzA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82FCDB82011;
 Thu,  7 Jul 2022 13:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66694C341C6;
 Thu,  7 Jul 2022 13:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657202047;
 bh=bfSNl/kqtaSioIPpTfl5sDM6mMgQPB4Brm2wjepEylM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SPH64QzAwqsLdDnV122DcfIvEvPg6xn5BSGyzcOc3Yh5yuFj+R3dAE4uUJ0xyyP6v
 ylQ7sr3W2x4ZU1hfupBc0JZZCbLFlRYdG58eDvDioEvc4yPcSuJWIlRfOmKB66VQSD
 8rgB6Gli0tjmr903J8LB5t6gWX/J/F4lfS8dPo5oLGgSSPyNkXnkHlFoyLLe2ENgSD
 ACCBnhTe8oX6v21mHV+Vkz/uVbdW1Dxhs8E3iMZnvuSxlLsijX6INZpEsLa9kX87tu
 mqg2DXK3AXs2md4iuelpv4yjDEVSJ0ja+5zLhg+O5EPtfE7hyNYxAOZrWhlj0sEfqD
 Zn7W3wZFmAEpA==
From: Mark Brown <broonie@kernel.org>
To: paul@crapouillou.net, aidanmacdonald.0x0@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, perex@perex.cz
In-Reply-To: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
References: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
Subject: Re: (subset) [PATCH 00/11] ASoC: cleanups and improvements for
 jz4740-i2s
Message-Id: <165720204509.3916612.8521005481587535129.b4-ty@kernel.org>
Date: Thu, 07 Jul 2022 14:54:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
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

On Wed, 6 Jul 2022 22:13:19 +0100, Aidan MacDonald wrote:
> This series is a preparatory cleanup of the jz4740-i2s driver before
> adding support for a new SoC. The last two patches lift unnecessary
> restrictions on sample rates and formats -- the existing ones appear
> to be derived from the limitations of the JZ4740's internal codec and
> don't reflect the actual capabilities of the I2S controller.
> 
> I'm unable to test the series on any JZ47xx SoCs, but I have tested
> on an X1000 (which is the SoC I'll be adding in a followup series).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: jz4740-i2s: Remove Open Firmware dependency
        commit: 98356c89d44dac838dfbab02975645d828de3099
[02/11] ASoC: jz4740-i2s: Refactor DMA channel setup
        commit: 8a7691010992886290b340a1ba943067c2e70f85

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
