Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A856C67D8E9
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 23:57:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4402F86E;
	Thu, 26 Jan 2023 23:56:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4402F86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674773825;
	bh=lUlV7aiI0si0/W517FBDa/HeRq2i5wQgYiZ8e4/VPhs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Z6Ca7g/Z46rmMlvCMNNfqpLSbcaC9+m9e81GI5FtVOWVC7tH6Sn5Z1DCtSeeUTD3C
	 0Vzy811yykZ59SVpzrCAApCZnp9GW1LXs5sCWzQ8loPde9O1DAFZSNeWe8DG0Al0ex
	 WyeN4MQRPZhwtIWPwEGHa9RelxsSQumlD8RvEUXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 876DBF8030F;
	Thu, 26 Jan 2023 23:56:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A069F8027D; Thu, 26 Jan 2023 23:56:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4AE1F80224
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 23:55:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4AE1F80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NJ8I2pTH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E526EB81C5E;
 Thu, 26 Jan 2023 22:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FBA7C433D2;
 Thu, 26 Jan 2023 22:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674773757;
 bh=lUlV7aiI0si0/W517FBDa/HeRq2i5wQgYiZ8e4/VPhs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=NJ8I2pTHBLWb9hqw76GjVnV6JAeuMwrghH7OCL69Ywnzcw0hma9owHEn0ajjkcR+2
 LDPToCsgG14hdUcA1a71FHfrreEjFtpjY5lyDWaTsJp2yLsyJDgyMG36v/SwuT+D0a
 hXXGPROBCuaiQoTpNbVqWtw2TE/G3+H39NbPP91qI24Y9LGZrpht/e8kQXcx6jUp/V
 4OM2AJpgoMtuOjANAvLc3QL806WDoHVtRAu3jjbhqGgs+9I62knDXsh2kxSgtFqrH8
 Blumk/pfW4u8siG8Ljt3B/8XnxVu2GBLuAtuShCCoGgRFQxP3RlzKIusfqZ4ngyacJ
 qIKP5PQHppuEg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Dan Carpenter <error27@gmail.com>
In-Reply-To: <Y9JHSwcfdNcfMjjt@kili>
References: <Y9JHSwcfdNcfMjjt@kili>
Subject: Re: [PATCH] ASoC: mediatek: mt8188: remove some dead code
Message-Id: <167477375499.524795.3525968034845691950.b4-ty@kernel.org>
Date: Thu, 26 Jan 2023 22:55:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Yang Li <yang.lee@linux.alibaba.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 26 Jan 2023 12:26:35 +0300, Dan Carpenter wrote:
> We know that "irq < 0", so delete the unnecessary check.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8188: remove some dead code
      commit: aa326917f58fa577bfba8976da214080bdec2699

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

