Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B38578410
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jul 2022 15:44:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D2FF1704;
	Mon, 18 Jul 2022 15:44:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D2FF1704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658151890;
	bh=7tFBGqUCkSt48dOZXzzfz1gzARNR5pWpaicXyiZifAg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=avZqCT4zd3ZToumJCvGoZYF2hyzswJDBPloP4KRpWe06ZvOAeuiVduDVDwuZ10N8j
	 kS775SL+CLKtSeZll+aRQZ1/UDSIWTjcmtcHdBoKvHnWmzeqeueN2he5CAYx16yDnp
	 fBhv2vhTz44jiTKrN/GzTK/GSyrs1m2MGSYIIjtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFB7EF80095;
	Mon, 18 Jul 2022 15:43:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28EDCF80095; Mon, 18 Jul 2022 15:43:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBEC0F80095
 for <alsa-devel@alsa-project.org>; Mon, 18 Jul 2022 15:43:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBEC0F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZpQlyzBX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B11C1B81011;
 Mon, 18 Jul 2022 13:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678A2C341C0;
 Mon, 18 Jul 2022 13:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658151823;
 bh=7tFBGqUCkSt48dOZXzzfz1gzARNR5pWpaicXyiZifAg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZpQlyzBX+qw7XQHIlBSp/jjGa9M1Rd7hoGLTAZAEHVNR6vkW7pre56b/B3TkdfqPG
 YFZuBdAZpYt4TJxpaldPAiAy7NbT7zla/5ts/XDnQOhgg4TaDLYe7dHrm5Fm5uX6IE
 XKREkjDZdbDHAfuaLGK+x5xAtV9IQ1gETwlZLGcXy0s7aLgPLkJxYxJXWXaD8QqaL6
 6oSRXj3cT07k7fWaIbxmSfVeW09vQeANSI8lg8rM6ShSnJXiC7J4ziezzuA4bUgAQi
 AJVYjMSGknCWP0qUkTosPTx1oUEBwupxjk5PKPjZWdn1bdMX2J9Y61tZOvMKw0hjoB
 oRB29qgPRd2Zg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, angelogioacchino.delregno@collabora.com,
 chunxu.li@mediatek.com
In-Reply-To: <20220715085903.7796-1-chunxu.li@mediatek.com>
References: <20220715085903.7796-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt8195: extract SOF common code
Message-Id: <165815182112.53643.17525611218975401104.b4-ty@kernel.org>
Date: Mon, 18 Jul 2022 14:43:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 tzungbi@google.com, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

On Fri, 15 Jul 2022 16:59:03 +0800, Chunxu Li wrote:
> The functions related to SOF can be reused in different machine drivers,
> such as mt8195 or mt8186, so extract the common code to avoid duplication.
> 
> Set mtk_soc_card_data which include machine private data and SOF private
> data as card drvdata, then the difference between machine private can be
> ignored such as mt8195_mt6359_priv or mt8186_mt6366_priv, at the same
> time the SOF related code can be reused in different machine drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: extract SOF common code
      commit: 0caf1120c58395108344d5df4e09359b67e95094

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
