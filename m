Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DE92C17E2
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 22:48:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B7B4168E;
	Mon, 23 Nov 2020 22:47:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B7B4168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606168113;
	bh=sFJn+1J1TBIERI0P9wcH+UyvgsrLQ7eIb88H8rhNYAc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pgv9Du+zA2/xhrhYxvPBW/O1JFWLRsVDG7HPmNQ9dDEF7JlajhQdJEzJA/QGNDoRX
	 LYSjjOBCtHNp96oeAypebXb0s6Tlon+5H3GP9X//BligF4pihWZEuIU4YDkgmTKqot
	 eW0xpPd4faRtuqaSWDKLi8vyip+O4doi69x0fuB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C84F8F80113;
	Mon, 23 Nov 2020 22:47:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D227F80113; Mon, 23 Nov 2020 22:46:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B69B6F80128
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 22:46:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B69B6F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WgAk9eCN"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EA6520663;
 Mon, 23 Nov 2020 21:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606168004;
 bh=sFJn+1J1TBIERI0P9wcH+UyvgsrLQ7eIb88H8rhNYAc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=WgAk9eCNillZty/Z/Vj1NgObTXjyzt5MJG67HnqFC/4od6j/iHSWtmatmWof91cdQ
 45bIfaPmtISTyOBhpeYoBrmSteVW3cDl4x7Dw30ltB9q9hZ01/vBb3SHEflY8ihXii
 BLTVxShl4p7gc27+SiWwusL/+pRnLNEylyFPOKZc=
Date: Mon, 23 Nov 2020 21:46:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20201123200917.16447-1-festevam@gmail.com>
References: <20201123200917.16447-1-festevam@gmail.com>
Subject: Re: [PATCH] ASoC: imx-audmux: Remove unused .id_table
Message-Id: <160616797660.26421.6446461016311036480.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 shengjiu.wang@gmail.com
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

On Mon, 23 Nov 2020 17:09:17 -0300, Fabio Estevam wrote:
> Since 5.10-rc1 i.MX is a devicetree-only platform and the existing
> .id_table support in this driver was only useful for old non-devicetree
> platforms.
> 
> Get rid of the .id_table since it is no longer used.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-audmux: Remove unused .id_table
      commit: 6a8b8b582db13a18235f3b0400f103a0573c7859

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
