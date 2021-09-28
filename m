Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5568341B3D1
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 18:26:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAE611684;
	Tue, 28 Sep 2021 18:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAE611684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632846392;
	bh=0O6L4H/cextfv26B46FKY+zqtsTMb2PqJijiEx87F6U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=suXZsZMTfnT1RUv/M24TKmaTxJ9VkQKs//G9SnOolvbQNMIXgG5kWyZixH5c03cn3
	 xC9VtCXz92YYUurRaWUEL1OV8BthoNXiwuurYgHfOVV4XWH6eTwF1NcL6Mga4RXjNc
	 A/UipzxGHTNNtRvAOEuVUPAXIhzm04YLiFs/GXXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCF55F804EC;
	Tue, 28 Sep 2021 18:24:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DB33F804D1; Tue, 28 Sep 2021 18:24:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7B79F804D1
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 18:24:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7B79F804D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EDO+sk4W"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D83E460462;
 Tue, 28 Sep 2021 16:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632846245;
 bh=0O6L4H/cextfv26B46FKY+zqtsTMb2PqJijiEx87F6U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EDO+sk4Wwji7L2scdsEF3f+WFkOFCFOl1U7q9vzm9NWJ8IcF8oRBCXgOfpUb55lr+
 mmGBEPM07EZ0ys049J7VAom4eUh/Zz9ioqlLiv6aOdW0O7N0qvmUZD18ASME+sDy4p
 sn52BtG5hwI30SIi4FNxviuCW/+7thKPUh1+nGjKq7osK7FCV0L56S5G95/bwa3YUv
 XQgty2j9FjApH/4+SYIfcTcn6A79FGhjvfKfTxYzIxvIw8yuikUUxXOciRA/nwe1WY
 psNywYARIBft7yYaavzV9HHO3u5yFSq+AIbmfbxI2lKCoSqWyJDcioUBwXsD0NmpOy
 ZyHsP2zkDFoyA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Trevor Wu <trevor.wu@mediatek.com>, matthias.bgg@gmail.com
Subject: Re: [PATCH] ASoC: mediatek: mt8195: add missing of_node_put in probe
Date: Tue, 28 Sep 2021 17:23:02 +0100
Message-Id: <163284573552.17390.11297095158911786787.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210928063520.23927-1-trevor.wu@mediatek.com>
References: <20210928063520.23927-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bicycle.tsai@mediatek.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, cuibixuan@huawei.com,
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

On Tue, 28 Sep 2021 14:35:20 +0800, Trevor Wu wrote:
> dp node and hdmi node are retrieved from of_parse_phandle(), so using
> of_node_put() on them before return.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: add missing of_node_put in probe
      commit: b05cfb1215223a750cff5367b625f0ed285a36cf

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
