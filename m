Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FEE1CB5A4
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 19:16:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E891F826;
	Fri,  8 May 2020 19:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E891F826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588958184;
	bh=5t7WJiL5EwvoF0nnqVxBZir0wWe3BIQcNbcs1QJffwA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E3huHaNTsqpPM6CdddDpUr7Ej7iIiKBhR85g6lN+g3md05NtG7jh4t8QdRKJnu8KV
	 xfreU98+WyxMuz1IV9x7Tw9TbU7rSzh+4HR5Pkqyill3SYuBNZRTIQM0z/V7DYg1/Y
	 +UP19yGRWVxWIIASS8XmIjbVRa4v/1QkKjpnylOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A304F80290;
	Fri,  8 May 2020 19:13:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 232DBF8029A; Fri,  8 May 2020 19:13:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9D82F80290
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 19:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9D82F80290
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rAgyn1Az"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A46242063A;
 Fri,  8 May 2020 17:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588958017;
 bh=5t7WJiL5EwvoF0nnqVxBZir0wWe3BIQcNbcs1QJffwA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=rAgyn1AzkpzjDtU1+fwmVGaaW32AsL9fJeQxDyPG+4bENc1L72C8N/5TpqKgFGG9m
 fVSCnRSKUlW1rqiwWnyL1VjbOfKnkKZMqOtQYKcK7yW11nTwDAQx+SjIkWmXvVeTlh
 wIenW1KdCjcuSDpdquykMkHaJ9Bw5hXfIm1zBzdU=
Date: Fri, 08 May 2020 18:13:34 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, s.hauer@pengutronix.de, lgirdwood@gmail.com,
 shawnguo@kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>
In-Reply-To: <20200429094023.12856-1-tangbin@cmss.chinamobile.com>
References: <20200429094023.12856-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: mxs-saif: Add variable dev to simplify code
Message-Id: <158895800277.30774.18095767521738841967.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Wed, 29 Apr 2020 17:40:23 +0800, Tang Bin wrote:
> Add variable 'dev' to make the code cleaner in the function
> mxs_saif_probe(). And now that the function mxs_saif_mclk_init()
> have defined the variables 'ret' as the error returned value,
> then it should be used instead in this place.
> 
> Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> 
> [...]

Applied to

   local tree regulator/for-5.7

Thanks!

[1/1] ASoC: mxs-saif: Add variable dev to simplify code
      (no commit info)

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
