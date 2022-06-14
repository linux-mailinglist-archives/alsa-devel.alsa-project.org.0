Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AA454AE4C
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 12:27:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADDD61863;
	Tue, 14 Jun 2022 12:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADDD61863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655202447;
	bh=/4wjBN/XD9r9d8fn277nelFLTt+axEseUdjXrsmW1cU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AJxMveWEYvrbDOQTQOaae+HzrMM9G/d0ZwEz/QznB0AtGWgIYIN0sLRnnLUcQSy4J
	 09R1zICGUWUNLLqOcMyheSrsE7QHj7T7vdcnf5VJue0eqYPkgcnA1DDSSGa+BIfeh5
	 yYKHXQRYUJddhne9/07+NVD1IVWgvOLfbL3dQ/7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D65CEF80536;
	Tue, 14 Jun 2022 12:25:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92C22F8052F; Tue, 14 Jun 2022 12:25:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23CADF8052D
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 12:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23CADF8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JdeSQWXL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 054F460C97;
 Tue, 14 Jun 2022 10:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1194C341C0;
 Tue, 14 Jun 2022 10:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655202314;
 bh=/4wjBN/XD9r9d8fn277nelFLTt+axEseUdjXrsmW1cU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JdeSQWXLchu9QxQUVDqhSTbVyAhOjuRuArsn0syriXa+9Qq9BrxzCpSbML5WI6MvX
 rieOOwWnvg/qq0YjsQmfXXIgeK6bx8mQHr+Cp7jItHCN2TGh12ndouxY2FFFPOMzoV
 OIj9Mb9xNVeeg7e7EYjwZAe452Iwx8BRu9WNpRbfAaEvucIA6+u0M2XLRpTQgF4owu
 hkJKkhk4nlzqH98aZNLkIRN8piFSAYzExErE7j+l41MzNbTwRZ3EqFPXUSTgcaT58B
 RjsjdaMcL3qclOjPvMSkjIE7/PkiKj4D6GIXIZdSp95ObCXd5jSt0nEnh7dDi9Gs33
 rlAatUrbYIFqw==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.cirrus.com, samuel@sholland.org
In-Reply-To: <20220613161552.481337-1-ckeepax@opensource.cirrus.com>
References: <20220613161552.481337-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] ASoC: sun8i-codec: Partial revert to fix clock
 specifiers
Message-Id: <165520231251.3607327.1586830877046934824.b4-ty@kernel.org>
Date: Tue, 14 Jun 2022 11:25:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, lgirdwood@gmail.com,
 wens@csie.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-sunxi@lists.linux.dev
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

On Mon, 13 Jun 2022 17:15:51 +0100, Charles Keepax wrote:
> Recent updates accidentally updated the clock producer/consumer
> specifiers on this device as part of refactoring the CPU side of the DAI
> links. However, this device sits on the CODEC side and shouldn't have
> been updated. Partially revert the changes keeping the switch to the new
> clock terminology but going back to the CODEC defines.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: sun8i-codec: Partial revert to fix clock specifiers
      commit: beb89d1d49e9ae1188356d6e37581e5f0b5f62b4
[2/2] ASoC: mediatek: mt8186: Use new direct clock defines
      commit: 845a215558647acd4290dd773b9c0de62c123335

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
