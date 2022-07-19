Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB9357A4BE
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 19:13:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8BC91696;
	Tue, 19 Jul 2022 19:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8BC91696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658250795;
	bh=5iVcq8tomxnH4tiYclWNXIGQuQpwgkJRPWeb2ZiE01A=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IU5XgfgjNSFNAKTVhEgoQAvbBtBbKxBrVLX8l67wn0UzLvxaSzvx6n+7Pxa0RcZlB
	 8x2xvDV7JaGCSDFWFWlqRTsocaM1cBNevVuTmkuyqWShVMytzm52Ei/XKNb4bXyZV7
	 fPXQl3jcRf/rz/AeedIf6Y3L+fICbPTv26Rpv4WQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32E8AF80118;
	Tue, 19 Jul 2022 19:12:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AAADF80125; Tue, 19 Jul 2022 19:12:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7DFAF80118
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 19:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7DFAF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MPAvBpo6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2902361021;
 Tue, 19 Jul 2022 17:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A60C341C6;
 Tue, 19 Jul 2022 17:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658250716;
 bh=5iVcq8tomxnH4tiYclWNXIGQuQpwgkJRPWeb2ZiE01A=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MPAvBpo64jh3a8A+OlzLppzXqbuzrZVCnoPU4KDrhloSbf/6Km0YyCiSAWBiRIg3M
 u2qCSlFjitInByiBd3M995qJwwwmhs3U87n6sYevpxiSS+h1cTG9AvErk0sMDDSef5
 H3H6a6TRK4NHeQwPQIQmw9+ZqE5vh+SFrcwmw2HMV0kLJ00uMthx6pTWS44IrBYNAU
 TmJo+OptvGHwU5dEkUg0HXD704s3xOCicw2v9laJkMFAWU9MLUpUKbSHlxvYlkUZLg
 OMtgUqXC1ouFZMciTmSCLNxUypYqJEgAe75Q15aRh8zuUg2EmYdijad3A9ldApJl4h
 Nh6qj9UY9o9jw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, jiwang_wang@mentor.com, perex@perex.cz,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <20220718110404.1529085-1-jiwang_wang@mentor.com>
References: <20220718110404.1529085-1-jiwang_wang@mentor.com>
Subject: Re: [PATCH v1 1/1] rsnd: ssiu: add missing .quit callback for gen2
Message-Id: <165825071404.372578.3185771887733235033.b4-ty@kernel.org>
Date: Tue, 19 Jul 2022 18:11:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Dean_Jenkins@mentor.com, jiada_wang@mentor.com, alsa-devel@alsa-project.org,
 erosca@de.adit-jv.com, linux-kernel@vger.kernel.org
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

On Mon, 18 Jul 2022 20:04:04 +0900, Jiada Wang wrote:
> From: Wang Jiada <jiada_wang@mentor.com>
> 
> commit 83b220cf8eb2a ("ASoC: rsnd: implement BUSIF related
> code in ssiu.c") moved BUSIF related code in ssiu.c
> which added .quit callback in ssiu.c to disable error irq
> when ssiu quits.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] rsnd: ssiu: add missing .quit callback for gen2
      commit: 11e9318ff7486f375cf246c172c3206a731a2254

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
