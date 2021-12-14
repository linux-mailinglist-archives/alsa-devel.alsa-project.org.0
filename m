Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5973247436E
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 14:26:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9025C1AA9;
	Tue, 14 Dec 2021 14:25:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9025C1AA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639488403;
	bh=Kfpg8F/M83/BGQDlYPcnf3fKEKL4vgzfFaEYnWCRd5M=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AaY9Uu/38Eu4bvqhqC61kiTX+cRw522pYvoPbOMrO86NyZINxIPyTTGaiDsl2Uf77
	 RKTaKgWpJI+57krhBoz0lSRLshTxAwOBQrfJC1RlVeJFwRAjOkRIXgyYyPSurrdRFy
	 mO0hmT57SuD+WfYEgRK8XAGyPPOdyDLkVJz5HHG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CCEEF8025A;
	Tue, 14 Dec 2021 14:25:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C7FCF80249; Tue, 14 Dec 2021 14:25:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FAF5F8013C
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 14:25:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FAF5F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WxUOtrNo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 337156149A;
 Tue, 14 Dec 2021 13:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5368C34601;
 Tue, 14 Dec 2021 13:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639488324;
 bh=Kfpg8F/M83/BGQDlYPcnf3fKEKL4vgzfFaEYnWCRd5M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WxUOtrNoJsZzUDkAZoEnCQpr8bYiQ7GZi5DCSyW5ApQv+Jk5QJGEkfyhaWJtC9/RC
 0fbXIU7EaEdQE0YHC0TXJk6+bcyP4xpvzuuL7PPMjqAgiTd97JhGUsoDIf2GziwL8V
 RADhkcRjbvjXYQmQ0+57gxkRRP19kibc2bDQGLeZ9ZzKPE0MYshi12g5WJvZQs2rGp
 o3V8+/Xi0B6/064bZ0FC2JjaOBbC0w0fRuENKuUuVKT44Dw3jvoLli8ESaMJgLbh92
 NXcIH97XXqqQbVZyjZO34RESiOfMfh5H+BGJUIM8SYxMt4Ne87OUH98VXvE9RDOopo
 VjvAEHH8ws6xg==
From: Mark Brown <broonie@kernel.org>
To: linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20211209073224.21793-1-jiaxin.yu@mediatek.com>
References: <20211209073224.21793-1-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: assign correct type to argument
Message-Id: <163948832239.2865729.5262628793021796967.b4-ty@kernel.org>
Date: Tue, 14 Dec 2021 13:25:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tzungbi@google.com, kernel test robot <lkp@intel.com>,
 trevor.wu@mediatek.com, yc.hung@mediatek.com
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

On Thu, 9 Dec 2021 15:32:24 +0800, Jiaxin Yu wrote:
> Fix the following sparse warning: (new ones prefixed by >>)
> >> sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33:
>      sparse: sparse: incorrect type in argument 3 (different base types)
>    sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33: sparse:
>      expected unsigned int to
>    sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33: sparse:
>      got restricted snd_pcm_format_t [usertype]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: assign correct type to argument
      commit: 03c2192ab636987db72e99f319a942cc4f3cb352

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
