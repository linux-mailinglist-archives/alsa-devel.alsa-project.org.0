Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B0D56C15D
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 22:48:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E05382E;
	Fri,  8 Jul 2022 22:47:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E05382E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657313314;
	bh=LL1NuwRwj/m/rqIzDfqpFtAGF03Sv+3oYNx8eOgVqHM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SWORztsvkUPeufw8OWTfTtLUnns9F0qIIuzrsmM3p0s/JtNhqxz7dg+KmALYWdO+U
	 +TcndzVIU24in4E1FBfEFN99FOxalekQBkmy+fnXRQD1qUwpKaOFsyFmVBGGID6Vd5
	 jzsTXz+llRfrKedf8PbcWReapqPKJw8Cx2Aj+kdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E013F80537;
	Fri,  8 Jul 2022 22:47:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57202F8053A; Fri,  8 Jul 2022 22:47:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0DE1F80166
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 22:47:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0DE1F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EfJ3N7zj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 758D2CE2D2A;
 Fri,  8 Jul 2022 20:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D84CC341C0;
 Fri,  8 Jul 2022 20:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657313244;
 bh=LL1NuwRwj/m/rqIzDfqpFtAGF03Sv+3oYNx8eOgVqHM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EfJ3N7zj+J5zgeKNRiDGglgB/vwaQCLqZvXiYZEkDot1bBPbzMJgFufQvot1isXkS
 8xnIkNqZpbbEafUns6HVoqt7jQuLaYkb0rfRn+r6q8qsZRETPaJnu/96kuVQYLRH7c
 BnXRxjGex6kbKaQXoiRcbGOtn8pYRXIV2n11FU7ukc6J+ffiUYBWFJAaGcD0EGk+cH
 jwLv6WYzfRxtoc9w59wiek+15lHDwtv2Fq+BZl0MHq00jboZMQf0FU1+Amsht6Peuy
 Kr+O+oaj09olMMNxoqXD8+YWfaDgCOWKqJZPjaOxY9VdMQiX3WE0NfU6idphhduzMg
 P+srB2/SG/PpQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ilohs96p.wl-kuninori.morimoto.gx@renesas.com>
References: <87ilohs96p.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/6] ASoC: audio-graph-card2.c: make Codec2Codec settings
 optional
Message-Id: <165731324388.2467307.4887406267877421316.b4-ty@kernel.org>
Date: Fri, 08 Jul 2022 21:47:23 +0100
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

On Fri, 1 Jul 2022 05:17:51 +0000, Kuninori Morimoto wrote:
> Audio Graph Card2 has Codec2Codec support, but I noticed
>  - Current Codec2Codec setting value is not correct
>    because it is using of_get_property().
>  - simple-card-utils has default Codec2Codec settings
>    and it is overwriting Card2 settings
>  - This default settings works for non Codec2Codec case
>    (= DPCM::BE case) too.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: audio-graph-card2.c: use of_property_read_u32() for rate
      commit: 817a62108dfacebd548e38451bf0e7eee023e97f
[2/6] ASoC: audio-graph-card2.c: make Codec2Codec settings optional
      commit: 7d596d9bb2ae4d0a7a59199792c13ea02f0d2c76
[3/6] ASoC: audio-graph-card2.c: remove pre-alloced Codec2Codec space
      commit: 6976ed0137d98c2ec0f11af8a01716e9f3af873d
[4/6] ASoC: audio-graph-card2-custom-sample.dtsi: add verbose explanation
      commit: d33083f941150dc2079975d032547f6ce9a8e81b
[5/6] ASoC: simple-card-utils.c: ignore Codec2Codec setting if it already have
      commit: 75d1b39067ed6699ec8a906fa9d83609bca9113b
[6/6] ASoC: simple-card-utils.c: care Codec2Codec vs DPCM:BE
      commit: 16b7ba9c0f53032e2a9365f3de89b66426b5716c

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
