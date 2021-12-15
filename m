Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B61E476077
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 19:16:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC3811B2D;
	Wed, 15 Dec 2021 19:15:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC3811B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639592184;
	bh=TP76EnotThLbbhCYm+vAG3sh3TqTKaa+2TLkvRyqmBE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jwLYMLYWxHkRuzmiWOj/DrOeSHTxkm+OTAWvdhj4FHlZD0ZSfaa4xTIJQtuHje4N8
	 UCoM4jrELd4iSIFkqZxPay8+dBw2UCC8jll6vICixPs/qHlAJKwQSPPmou97hzC2J0
	 o8lsO150zvQgmOe+4yMeNyMgoCDUEIugpV5LBrcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63256F8032D;
	Wed, 15 Dec 2021 19:14:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDA33F8027C; Wed, 15 Dec 2021 19:14:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62B87F8025D
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 19:14:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62B87F8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="E7p3W7Ho"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7B6F96164E;
 Wed, 15 Dec 2021 18:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FA7C36AE2;
 Wed, 15 Dec 2021 18:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639592054;
 bh=TP76EnotThLbbhCYm+vAG3sh3TqTKaa+2TLkvRyqmBE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=E7p3W7Hot+i4JpIYWGwFGk0/0/GAOHYooihWuRwg8rXP4eOhgi+HrzOfbwkU+7dw2
 2InBZ5urhlyWuBVPkjsA9ouBdGB80BVLOfaB/fY/hqaWF1lOMLBgPHgWQ1ZmJPsIZW
 vWaTUgYgNFGFMTXI4wOB7P9nlEiwmNkuMNaiqpWrcA/Bmw1yasxIMinMjwtqkd/001
 HS61PnNiwSJUmAxzKqEGK5r/0qq2bHbkc3Xs/TRANvJEpyrjd28SmKHHw5paluuZxV
 5bv5b12R8ztqWWquLw+m6TVEgrn4weya8+XavwrnHaVDfROLzg2XibMlbGv7aEJ+DK
 IZ7C77Fg4B3gw==
From: Mark Brown <broonie@kernel.org>
To: oder_chiou@realtek.com, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz
In-Reply-To: <20211215031550.70702-1-jiasheng@iscas.ac.cn>
References: <20211215031550.70702-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: rt5663: Handle device_property_read_u32_array error
 codes
Message-Id: <163959205325.2218314.11285157350197840732.b4-ty@kernel.org>
Date: Wed, 15 Dec 2021 18:14:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Wed, 15 Dec 2021 11:15:50 +0800, Jiasheng Jiang wrote:
> The return value of device_property_read_u32_array() is not always 0.
> To catch the exception in case that devm_kzalloc failed and the
> rt5663->imp_table was NULL, which caused the failure of
> device_property_read_u32_array.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5663: Handle device_property_read_u32_array error codes
      commit: 2167c0b205960607fb136b4bb3c556a62be1569a

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
