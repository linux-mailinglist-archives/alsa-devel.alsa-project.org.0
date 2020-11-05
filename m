Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FD02A83E8
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 17:48:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0BB51687;
	Thu,  5 Nov 2020 17:47:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0BB51687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604594893;
	bh=5GtUcMVbIbMwJINTBvMDEPNB9/OMZ9q79CwICoAHVno=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O2MiZ4c6bthbt51vwNWkGpvj106KfOR/eaNUHPXPycieyrVjXxN5JdN9bgUqEeHwv
	 jg7b7A5VaiNzR2m2pHdnUSx7ktjSXpfYyaBfhdsfILN0H9K5NCmJUINV1odikjpjDg
	 Oj44kjaf/ilxsnHa2HlrTyMWJfR1gSuqQ+WY9YDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B00DF804C2;
	Thu,  5 Nov 2020 17:45:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C28EBF804C1; Thu,  5 Nov 2020 17:45:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A697F802A9
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 17:45:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A697F802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="yj5inxN+"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 910AA20936;
 Thu,  5 Nov 2020 16:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604594745;
 bh=5GtUcMVbIbMwJINTBvMDEPNB9/OMZ9q79CwICoAHVno=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=yj5inxN+mnKyEYIugr+Z1fkoZh6rAraTbztF8eD02BARmtelJx0x7HaGKkXyrjJqh
 FaMrtz370+hPKjSnrI0pCNFTu1SG/ZAU2A8067G3rYZnp0XD4Kqsdc4/xRkK/Bhw4G
 PH+HAWASy/aWu7jbfrg+JCjnJVDuT2qdywnQVT8I=
Date: Thu, 05 Nov 2020 16:45:33 +0000
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, Zou Wei <zou_wei@huawei.com>, tiwai@suse.com,
 matthias.bgg@gmail.com, lgirdwood@gmail.com
In-Reply-To: <1604579287-25251-1-git-send-email-zou_wei@huawei.com>
References: <1604579287-25251-1-git-send-email-zou_wei@huawei.com>
Subject: Re: [PATCH -next v2] ASoC: mediatek: mt8192: Make some symbols static
Message-Id: <160459472201.54851.5938224676364159324.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jiaxin.yu@mediatek.com,
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

On Thu, 5 Nov 2020 20:28:07 +0800, Zou Wei wrote:
> Fix the following sparse warnings:
> 
> ./mt8192-dai-i2s.c:2040:5: warning: symbol 'mt8192_dai_i2s_get_share' was not declared. Should it be static?
> ./mt8192-dai-i2s.c:2060:5: warning: symbol 'mt8192_dai_i2s_set_priv' was not declared. Should it be static?
> ./mt8192-afe-gpio.c:15:16: warning: symbol 'aud_pinctrl' was not declared. Should it be static?
> ./mt8192-afe-pcm.c:70:5: warning: symbol 'mt8192_get_memif_pbuf_size' was not declared. Should it be static?
> ./mt8192-afe-pcm.c:2137:39: warning: symbol 'mt8192_afe_component' was not declared. Should it be static?

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192: Make some symbols static
      commit: df3d6390fa0ad48eecbe0b48acb4d364a70cd378

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
