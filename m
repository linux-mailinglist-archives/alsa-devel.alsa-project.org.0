Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 716793A7DE7
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 14:09:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA13316A2;
	Tue, 15 Jun 2021 14:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA13316A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623758952;
	bh=2MYmjJV9kAgn72HGkFP0R9jgnz9kNJ3Xe1//XX3a8f8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kgN5ij8rs2BmLF8ytIEx7q4D469MVX2ciYTnUFj8GHubaUC4VvyAVKlOuLRjmJbhq
	 9GHfoi7mHPEIexYM0AgK8Q1HhfbhijYuergFL165ptOMfTPrCQkBjlVlYmG6cdCzhH
	 9nHf0ngY8oUF1wmoTm/W9dUIbcCYBYE1Gv7/jOL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3195FF804E4;
	Tue, 15 Jun 2021 14:07:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C761F804D0; Tue, 15 Jun 2021 14:07:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88FFCF8016D
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 14:06:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88FFCF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WoY9S/pQ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FFD161241;
 Tue, 15 Jun 2021 12:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623758814;
 bh=2MYmjJV9kAgn72HGkFP0R9jgnz9kNJ3Xe1//XX3a8f8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WoY9S/pQjlqu+ItTrh1MNzzt7UVqQL8NVJdXc1d0E6QVoMlQ4toGCsu+CDnvoymxD
 xLs5QP+qnERBjzPdzNGWcUIVmbY7tiMzcUbZFRcaBY4Cl+4/gcKao123EfYd8RQzQY
 T3XBXqtAoW6VykGUdozFuIc8RRS84euwrgxy7k4FIorBycyp5Nhg4yAFhUY7AMvNgR
 3nDzXGRQBN1hfCeVXEOmmHQruKIrdqWuwUzHqjCD3YxRpg345T7djnrtRvLT0pXmMt
 M+NGtW5S3cnKSqjfGAeQZ73Wfj6+Iamey8658EOuHJ1VmRQkCk/yEKpr7HdrsgHoEq
 6OywpKOIBbhww==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: fsl-sai: Add compatible string for
 imx8mm/8mn/8mp/8ulp
Date: Tue, 15 Jun 2021 13:06:27 +0100
Message-Id: <162375817571.30661.11566703557624039707.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1622613770-10220-1-git-send-email-shengjiu.wang@nxp.com>
References: <1622613770-10220-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Wed, 2 Jun 2021 14:02:50 +0800, Shengjiu Wang wrote:
> Add compatible string for imx8mm/8mn/8mp/8ulp, these platforms all
> support SAI IP.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: fsl-sai: Add compatible string for imx8mm/8mn/8mp/8ulp
      commit: 6f73de7da10b9476232820558fb7b3eb6bb9afe4

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
