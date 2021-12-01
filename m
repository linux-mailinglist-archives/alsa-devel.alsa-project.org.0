Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD054655A0
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 19:36:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 360F926ED;
	Wed,  1 Dec 2021 19:36:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 360F926ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638383817;
	bh=4g5v88qsCsd2eOxSUuIi5nfN0VvYnTAxUAxeb2Tfytw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tg9iMZKWIyZn/dH6EyXJcEcA7afSy2tK/67FYpYKj7kn5Hlhu6eddw6cRyfbgIJXb
	 3twLP1Z70nU6B/4esoSAJaam1sm+gkFSFYwgut45x5MMSToh0fq5rsXrzTQ98eVDXb
	 YG34FUfvwkrjVQKmWdP5HDJexZSDlVnScOjERhJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1657BF8053B;
	Wed,  1 Dec 2021 19:32:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66A45F80534; Wed,  1 Dec 2021 19:32:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B540FF80526
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 19:32:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B540FF80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EiKCubea"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 532EDB820E0;
 Wed,  1 Dec 2021 18:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A096C53FCD;
 Wed,  1 Dec 2021 18:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638383543;
 bh=4g5v88qsCsd2eOxSUuIi5nfN0VvYnTAxUAxeb2Tfytw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EiKCubeadJNn/PHgCLjVjjAtpedMYyGlyEzDsIuLfsuC4bsRfNHPGYUCDM3bA2ppQ
 FF20EIagtMESiQPT4ruwPZhdu+wQmj3P15w9vYA7EFcxJzccUwoffoa++4Jsb4oA+f
 fbabmk65q/nbSY4N8QNquvyp24Vlt3eF1CbQn6uuj8kKs6ucHwyKjkLhAG3va7gvVV
 K6gAo8a2bS8TQekkeJ/jDoNN5ofos5ehd3EsZZQFqwgih0Q5JtkQQ7hvBF/+6U+1AF
 O8q1iFKf5stU7gLqsN7LhwI5G1WfAqyFEhOlasjl2p/qHUbBYlT25g3z7VPRpFcKA5
 H7EV93Ea5bBmw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Takashi Iwai <tiwai@suse.com>, Colin Ian King <colin.i.king@googlemail.com>
In-Reply-To: <20211129224236.506883-1-colin.i.king@gmail.com>
References: <20211129224236.506883-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: make several arrays static const
Message-Id: <163838354089.2179787.18120653222525343560.b4-ty@kernel.org>
Date: Wed, 01 Dec 2021 18:32:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, 29 Nov 2021 22:42:36 +0000, Colin Ian King wrote:
> Don't populate various arrays on the stack but instead make them
> static const. Also makes the object code smaller by a few hundred
> bytes.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: make several arrays static const
      commit: 91745b034dca6044407b559fe28dd1cf7efccc29

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
