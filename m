Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DAC629502
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 10:58:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAD701687;
	Tue, 15 Nov 2022 10:57:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAD701687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668506304;
	bh=Pd/DcMoOQ6OXMXRY0MWZMWH1Tml+MzCtdYia/sWALok=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PgAz53IW9KtC2WuAsQEBREVEYfrDeAYtykSMe8yv4xMEDpbA3p6m+jYcYxjonxkBY
	 lzE0+nm9UJiPkenul0yvpgbWVsnc2H7GBVA3zwtxZj56ADxkm1ekxaWowkHAeUdA/3
	 lkx/5oLjH6rVQvEXPWeIPq8SI32XfQWUbi/bqXqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F556F80549;
	Tue, 15 Nov 2022 10:57:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E57F7F8047C; Tue, 15 Nov 2022 10:57:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2E05F800B8
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 10:56:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2E05F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OJbBJekL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D767DB81716;
 Tue, 15 Nov 2022 09:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA027C433C1;
 Tue, 15 Nov 2022 09:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668506208;
 bh=Pd/DcMoOQ6OXMXRY0MWZMWH1Tml+MzCtdYia/sWALok=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OJbBJekL8B2BN8yvszQUSIPXrG7LBTyKV3k7dW5rqAAzidQZCbi2/6eEVBUXvFhH1
 i2qkNFJKvU/n54k+FX1uBBhLIKqojCgQLjwVx+dM1zW/TxFJCUfKOkgu2t8ALunjqB
 IY8WEuBZGuG1MMtgaNONhtMfMGpaXxU9+7kKpou4cAs/LrUWcbOwO2GhdNf3rE892q
 r4znV9dAbIeAAiN/nEwhnplhZktumyTNf4ZT71Oco5ck2PITEG/6lXpGS934CavH58
 iq/V9LjrWxb39wRjnBJ4hjKGs882FjSyeAKAlVPOO4qwwU6lal4CeU0MSh3wQi7Yh+
 PWBNgy95hJ38w==
From: Mark Brown <broonie@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>,
 Nuno Sá <nuno.sa@analog.com>
In-Reply-To: <875ca433849025edf8c23624cf29b0e2250bba50.1668287523.git.christophe.jaillet@wanadoo.fr>
References: <875ca433849025edf8c23624cf29b0e2250bba50.1668287523.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: codecs: Remove a useless include
Message-Id: <166850620560.114707.764537802065702365.b4-ty@kernel.org>
Date: Tue, 15 Nov 2022 09:56:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
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

On Sat, 12 Nov 2022 22:12:13 +0100, Christophe JAILLET wrote:
> <linux/gcd.h> is not needed for these drivers. Remove the corresponding
> #include.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Remove a useless include
      commit: 23dab2ec7419280d116dcfd14f067303f7a0313d

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
