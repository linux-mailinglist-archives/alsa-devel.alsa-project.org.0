Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E6334220D
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 17:39:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0E88169D;
	Fri, 19 Mar 2021 17:38:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0E88169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616171948;
	bh=3A9Mrcmk8A9XWLKK6rVjytA8qsYQ+enej5Jso7g9Hts=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JMfNAlYDjLqjpX8XaF/cZ7fxsjODsMORyK2N26FdkrfdKsU9oowuA8nFiceZfbMoX
	 G/Os1OtBi2DCA9VYPMvWnqSUSKZnLMiVPGFGYPPbb3rFMYm0qdhevyrESXuQdwmLgM
	 0bl/Cb5j8XofVJclMLYl1eLjFq0YhCj7PX0lGt2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35568F8032D;
	Fri, 19 Mar 2021 17:37:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF2D9F8032C; Fri, 19 Mar 2021 17:37:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1193F801F7
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 17:37:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1193F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZhQdjEhG"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9982E61983;
 Fri, 19 Mar 2021 16:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616171835;
 bh=3A9Mrcmk8A9XWLKK6rVjytA8qsYQ+enej5Jso7g9Hts=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZhQdjEhGW9FyAGjhPqJlZE4KnnlnbSCKMshI+n+FsL0WeYbrpISB+Ybg+SPlDRGqB
 kTVYIPkSi94gZxnzvpYpnrxTScSosNOGGtGsQMAQjXJMnU091num9sM4AuI+VokGlY
 wEiZ1slF8353nO7PYQjaFSlhuIUDUfqvjmTYT1Jt1bbY+ZtdC4ntfGIy4BTWyJY/2p
 6vpIwcGA9cIDk+zp96nRghYn9jMTnIpWjmT1Ic2zyk7Q36wQABn0TqnQd3yL4aNgsw
 +ZB/o/SYB9h2bRehf2soOFbI2lS55rsg3HujUtoOF4ICyfZs40RuYdSDGiuD3XZLZk
 zc8OPfuQhALoA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Oder Chiou <oder_chiou@realtek.com>,
 Jaroslav Kysela <perex@perex.cz>, Jack Yu <jack.yu@realtek.com>,
 'w00385741 <weiyongjun1@huawei.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH -next] ASoC: rt1019: make symbol 'rt1019_i2c_driver' static
Date: Fri, 19 Mar 2021 16:37:05 +0000
Message-Id: <161617160659.9613.1258918288150245651.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210319094102.4185096-1-weiyongjun1@huawei.com>
References: <20210319094102.4185096-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Hulk Robot <hulkci@huawei.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
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

On Fri, 19 Mar 2021 09:41:02 +0000, 'w00385741 wrote:
> The sparse tool complains as follows:
> 
> sound/soc/codecs/rt1019.c:927:19: warning:
>  symbol 'rt1019_i2c_driver' was not declared. Should it be static?
> 
> This symbol is not used outside of rt1019.c, so this
> commit marks it static.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1019: make symbol 'rt1019_i2c_driver' static
      commit: e6d8af6687fa7730885d5c8d8f62e75e8dff29f0

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
