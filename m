Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B351E24C75C
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Aug 2020 23:51:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04BAA1682;
	Thu, 20 Aug 2020 23:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04BAA1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597960284;
	bh=23yUEfhFOmQ/QJGKJF2s1PtUXf40Zt+kxozKC+ATEgk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eBuivQFgiCboF0NC2eVmbxiuQYwB4AGDb27CMNPS7VQ3zt0VVJibDKjLaep1zgOUH
	 w4lRMqM/4dhBYI1XLLdIxBLLVhpKN4NFe2uTsrMp1bClnsANX9PsoUMtOhCR2yQKn4
	 MXq0ppsX1IR7KDxSPCHGXPYxg+P01IhhEbVlf26g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB237F800C0;
	Thu, 20 Aug 2020 23:49:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5DFCF8023F; Thu, 20 Aug 2020 23:48:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25AA5F800C0
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 23:48:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25AA5F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lwaNkhwh"
Received: from localhost (cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 [82.37.168.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EB8D2075E;
 Thu, 20 Aug 2020 21:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597960121;
 bh=23yUEfhFOmQ/QJGKJF2s1PtUXf40Zt+kxozKC+ATEgk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=lwaNkhwhgJpbE/zhVTfYZlNlh5BcgLwoBKqVYtgciUf+XphecrM4e40zZWnoPhWLr
 7LR9JTFTO6VfDbLvzPuUiDJm4fBse8n5dQQE45mqwRzNjQb/wxGiAHr1b4b98oZVQp
 gLXN8JhF5q2DsgDXOykirQXl1G7iYuLaKS2mwiRQ=
Date: Thu, 20 Aug 2020 22:48:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, matthias.bgg@gmail.com,
 robh+dt@kernel.org, tiwai@suse.com, linux-kernel@vger.kernel.org
In-Reply-To: <1597913493-10747-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1597913493-10747-1-git-send-email-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v6 0/2] Add mediatek codec mt6359 driver
Message-Id: <159796008815.44152.16317052982855858224.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, shane.chien@mediatek.com,
 howie.huang@mediatek.com, bicycle.tasi@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
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

On Thu, 20 Aug 2020 16:51:31 +0800, Jiaxin Yu wrote:
> Add mediatek codec (MT6359) driver
> 
> MT6359 support playback and capture feature.
> 
> On downlink path, it includes three DACs for handset, headset,
> and lineout path. On unlink path, it includeds three ADCs for
> main mic, second mic, 3rd mic, and headset mic.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt6359: add codec driver
      commit: 8061734ab65498f4802578564fc0948ec9aaf933
[2/2] dt-bindings: mediatek: mt6359: add codec document
      commit: 539237d1c609c0fd23389369939b5cc93feb16fb

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
