Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD6C481387
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 14:31:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D94901782;
	Wed, 29 Dec 2021 14:30:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D94901782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640784685;
	bh=WF83XAVknA58xaV3lKVpn6rXWqV15kL9ZY8e/opwK6c=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WodQiEHXDp6kWYeWnLEjnevMu/K8ZVJRENs48iCj8IkATnxNBWHOIfsz9lgx2Gs5X
	 IqyZJVOq3GlrodmBq5wzxMQdwerv7DN8G0fCPo1QtTR93JtrTtnZDcXhEohsXW0naV
	 Sj0BADHzaXlEXg6Gj3BUYJ8FLAfTfMvIIBAAbSbo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 988DAF800F8;
	Wed, 29 Dec 2021 14:29:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA732F800D3; Wed, 29 Dec 2021 14:29:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F359F800D3
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 14:29:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F359F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="l615b7Bi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8193FB81907;
 Wed, 29 Dec 2021 13:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9015C36AE7;
 Wed, 29 Dec 2021 13:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640784574;
 bh=WF83XAVknA58xaV3lKVpn6rXWqV15kL9ZY8e/opwK6c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=l615b7BiIHEuIBc9H/gFqlOJ29CFg7Sw541F4PcgL7yEpW+9T9IwabYx9veLLtj3J
 TqMBu4wzZxHFIf84ffLNn/L1e0NMhe8XGZcs+g5mPiZDheJUxUYzCQaUsqbmXFhh3i
 92F5dhZAaRrAowqMZoH8axzBS90XlDqFwTyO5myzFzQ6UPaCJBAeamzjlF4Uxfqwt/
 ZiKMkcB881PwZSdMeKGblwOn9VyFbV0/lYkXudcmGrxI8WSUIJFbFs/iOpJCiJpC+9
 9BY3O9f7RPGa1a9h0rQKmaCu389BoQ8hp9T/DwHfK3XuMDarDFAVYwCcvhwbzpZF8C
 N1KWpuwojvuFw==
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20211227062153.3887447-1-tzungbi@google.com>
References: <20211227062153.3887447-1-tzungbi@google.com>
Subject: Re: [PATCH] ASoC: mediatek: use of_device_get_match_data()
Message-Id: <164078457348.1246652.10436511969265120898.b4-ty@kernel.org>
Date: Wed, 29 Dec 2021 13:29:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Mon, 27 Dec 2021 14:21:53 +0800, Tzung-Bi Shih wrote:
> Uses of_device_get_match_data() helper to clean some boilerplate code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: use of_device_get_match_data()
      commit: 3667a037e50a31555276a7989435126e501f0f15

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
