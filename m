Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D62DA3DF873
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Aug 2021 01:23:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34D96170F;
	Wed,  4 Aug 2021 01:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34D96170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628033032;
	bh=GTOm5i1eFHoZWIAtLq1pJZHY6UHGcU6XPXFTbm98e/U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MfB0Fehp1hi257l3yaW2zvCsQ3ZQ/Bu+LzFwr+nXsUHvwMeaI0qsKQarxTXvIjskj
	 wFDEV2DEQDUbPtLbp+JICJdBJ5J0JVI3fO7AFrl1pCrPFO++/VB1oc218HRx/vgJRc
	 20KGdSCb+M6j9i7M4wedJhiMdT5pQL/EBbYzbV0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9F1DF8016D;
	Wed,  4 Aug 2021 01:22:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACE83F802E8; Wed,  4 Aug 2021 01:22:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D5D0F80095
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 01:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D5D0F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Cj8bEyOJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9DEE60F70;
 Tue,  3 Aug 2021 23:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628032935;
 bh=GTOm5i1eFHoZWIAtLq1pJZHY6UHGcU6XPXFTbm98e/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cj8bEyOJUkIviH1NJ3QclFfyphJQRwILTKSm3c2b5TLXM45hugfp6A7A3h6XQUw6P
 yf+TdP3Bxgd6iDmefErVAbpLy2KfVGfIDTtKg85qHtoYpTZciBGJxRTGTuW/zYuuD3
 TwF2oVrn20cEitvmEWQgs28YgN1KlqskTuJEy+cYYADGx2qgmRRqntsG2iCuRP89qu
 B7K1BCHC2isZiL8PXj1w6swkOPiYQxTCO1ebgfummAq+L4hWSTuMU5ADo+NodE8qXE
 siZnQ0DBwb9jElkkuV6e7FzBRh2Y+xRYLffJK7ghP31685BDiJ1xGJCJ6S7a/4C3/W
 VC4eOE6hikbLg==
From: Mark Brown <broonie@kernel.org>
To: Argus Lin <argus.lin@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: Re: [PATCH] ASoC: mediatek: mt6359: convert to use
 module_platform_driver
Date: Wed,  4 Aug 2021 00:22:00 +0100
Message-Id: <162803121460.44131.10692737941162516565.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210531051203.228567-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20210531051203.228567-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 linux-arm-kernel@lists.infradead.org
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

On Mon, 31 May 2021 14:12:03 +0900, Nobuhiro Iwamatsu wrote:
> Simplify the code by using module_platform_driver macro for
> mt6359-accdet.
> 
> 
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt6359: convert to use module_platform_driver
      commit: edcade2e5e942453f001bd7a0d31f55059cec34f

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
