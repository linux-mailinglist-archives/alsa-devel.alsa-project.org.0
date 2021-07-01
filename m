Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 164A93B93AF
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jul 2021 17:07:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A469B1697;
	Thu,  1 Jul 2021 17:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A469B1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625152058;
	bh=G3EMVezWNfO7jGjzkTDxFm1Cu/ucv/yME9Q3s/CRom0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sTUmrcKDSWVIQxQi344DTkDBWerVVDjIxWajUjP+g6bhThWJPeKjbWwL359uGFdEJ
	 9Gst9p3T3TDp0SLyjGZyO37ofKyep7bca6TZGPxZyTuwtnabsC7HMtCroBfnshpfgv
	 9qAM9GUYXwNLCBJZYawWLZWk7tUp0y8et1xYuJ2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CEA7F804AE;
	Thu,  1 Jul 2021 17:06:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B4A0F802D2; Thu,  1 Jul 2021 17:06:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B98B6F800BA
 for <alsa-devel@alsa-project.org>; Thu,  1 Jul 2021 17:06:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B98B6F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M08Gy+1Y"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F0E26140C;
 Thu,  1 Jul 2021 15:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625151958;
 bh=G3EMVezWNfO7jGjzkTDxFm1Cu/ucv/yME9Q3s/CRom0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M08Gy+1YIR2APQqYupwoshR6ozFjJ0j5zOOI3z8aFjH20unyIlHrX+oPk8kESbI75
 lelJmXXJLJQJkM52ag4gbD/kY1T3Q3YRfDgaP8yW1cPzLSS75HrzGYpB9CfWQJvKrB
 DFKL1OVFLOf1OoDjCCmenyZgXBQByRuKuTRoY1cgKmaEH4zSNe4EAUp59qalfJkeW7
 1KrgLCfy3fHsUiIah0Tt5dWntS8SK1SRjLTgwkgTugYan1jpELMTEACCAQzCdPMKA7
 l7UylrYBww0b7BW5CLvTmjlcrRN7NGCIGL78P0QGlEho8n4041UYyVhr4zIWQNHOw9
 yIj1QQ9iXSkHw==
From: Mark Brown <broonie@kernel.org>
To: Kyle Russell <bkylerussell@gmail.com>
Subject: Re: [PATCH] ASoC: tlv320aic31xx: fix reversed bclk/wclk master bits
Date: Thu,  1 Jul 2021 16:05:26 +0100
Message-Id: <162514935161.19857.3971653147969197836.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210622010941.241386-1-bkylerussell@gmail.com>
References: <20210622010941.241386-1-bkylerussell@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, grandmaster@al2klimov.de, lgirdwood@gmail.com
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

On Mon, 21 Jun 2021 21:09:41 -0400, Kyle Russell wrote:
> These are backwards from Table 7-71 of the TLV320AIC3100 spec [1].
> 
> This was broken in 12eb4d66ba2e when BCLK_MASTER and WCLK_MASTER
> were converted from 0x08 and 0x04 to BIT(2) and BIT(3), respectively.
> 
> -#define AIC31XX_BCLK_MASTER		0x08
> -#define AIC31XX_WCLK_MASTER		0x04
> +#define AIC31XX_BCLK_MASTER		BIT(2)
> +#define AIC31XX_WCLK_MASTER		BIT(3)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320aic31xx: fix reversed bclk/wclk master bits
      commit: 9cf76a72af6ab81030dea6481b1d7bdd814fbdaf

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
