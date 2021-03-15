Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4848133C32F
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 18:02:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD5CD18EE;
	Mon, 15 Mar 2021 18:02:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD5CD18EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615827777;
	bh=X9FXDjHHH0l74nuXFjYXBr5zguKiacAJ1oANBMdIGZE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gk1GV6WzNITuwWQusCYuARYOYT/rWWDq0B4IyITTJkgxY/O4AO28OeGJDKGGpLgTS
	 hwiNk20kKMwLaAKV5r+lH7PfzSNcnwY91UL4cJ62ChGQEwrm0oU02GbrsfGImxyhdT
	 xjzCeVebKi/r0qOYqv4QXD/bvA4uVUqKWfHdKBpI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9999F804FF;
	Mon, 15 Mar 2021 17:58:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29A20F804FE; Mon, 15 Mar 2021 17:58:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D7E1F804FB
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 17:58:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D7E1F804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="duBgOd0l"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2890B64F39;
 Mon, 15 Mar 2021 16:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615827507;
 bh=X9FXDjHHH0l74nuXFjYXBr5zguKiacAJ1oANBMdIGZE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=duBgOd0ljdSkO8avX7XwWSobCC3nObKVXmpHaqjF8ge6/ueE/nayyuNDC2QsPpARu
 no4sZYRnR7VttD8SAFCu7vI9tS1X/13XivvNdX6qHKhJnfW0B1+w3THrzYzuTZ+l8h
 Ov2z5FEeHTt+eUDJa4HUnnB4gRwkk1XHYCh4caWGR1FcP3aQ9WZ2cpt+yxU1TSHNGl
 nJSxhgHMD++W/UVXSpeIxAOEJHaV//8aC2RZuYDD5+LXgjgiLdZ3ATDBoLo2+nC299
 RGVuTEg7dEg6Qr7zLKAC0ziGw+oWXKGmPmbcjP2RSOfkJMTrZfJqlxH1kPBpnAHQEH
 lFOJv5YIrExdA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Wang Qing <wangqing@vivo.com>, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] sound: soc: codecs: Remove unnecessary THIS_MODULE
Date: Mon, 15 Mar 2021 16:57:05 +0000
Message-Id: <161582734875.54882.47331867129357785.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1615623786-16302-1-git-send-email-wangqing@vivo.com>
References: <1615623786-16302-1-git-send-email-wangqing@vivo.com>
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

On Sat, 13 Mar 2021 16:23:02 +0800, Wang Qing wrote:
> As THIS_MODULE has been set in module_platform_driver(), so remove it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound: soc: codecs: Remove unnecessary THIS_MODULE
      commit: a5e78cfbd50e33c19236f32693516380d1a61c34

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
