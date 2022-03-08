Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1834D1F03
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 18:25:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FF6A18CA;
	Tue,  8 Mar 2022 18:24:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FF6A18CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646760349;
	bh=Yfasz//GbWj31pLz9SiA6bXz155z6fMe8IJXsB7WIpA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ses+sfhwYT1W6p2SGxt076AcSKX23ouJkd+m/j3BZc2GMidU+TI/208SjXAhCfOan
	 kMK78Z+BVVKCKdOU1pENB2u0oBOODeh4H+MJmYbecFmS7RnzZIm7bqMPbDqYM/3TK8
	 vZEvWndHnyF68LFltov3kF5LYOtYlCidjhLp8Mzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F91EF8053E;
	Tue,  8 Mar 2022 18:21:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E03CF80537; Tue,  8 Mar 2022 18:21:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EB01F80534
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 18:21:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EB01F80534
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="n11nMwb9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ECE7161274;
 Tue,  8 Mar 2022 17:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B21C340F5;
 Tue,  8 Mar 2022 17:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646760060;
 bh=Yfasz//GbWj31pLz9SiA6bXz155z6fMe8IJXsB7WIpA=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=n11nMwb9nWqKWmlJcFE/z2Z68R6fKnmsJWDEAHmEpFDw337VEC8haxvHUhalJNyiI
 +5F+ghpsKb6jSO1JHlwkbBDRDbB5Sq8X0ALp4G+KbYo6rnuJQNl+P6O8RjJkRarWDq
 3uRrQC4Mcfg4TiaAxZplUtKr81kDfPu7OBmtkXU/nmGMTpzsr5G6QFdYxtKblq84uo
 OjvWfZkATHmZFwuYsPoKrlGE2VJTu56KL4B/2ItejA2NfXwH51SBWfVIe5YQhvEIKJ
 GqtTzEcS8UK2opqMwoRHmtnoETbF0xRFnWFd6sOeSBcx9S/5iHZN4inGGYeKmdyYny
 B/IljWZjCscnw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Meier <florian.meier@koalo.de>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <20220308013949.20323-1-linmq006@gmail.com>
References: <582c39ac-3099-d54f-5de3-d54a4ace0a04@microchip.com>
 <20220308013949.20323-1-linmq006@gmail.com>
Subject: Re: [PATCH v2] ASoC: atmel: Fix error handling in snd_proto_probe
Message-Id: <164676005819.54315.3431589094288420530.b4-ty@kernel.org>
Date: Tue, 08 Mar 2022 17:20:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 8 Mar 2022 01:39:48 +0000, Miaoqian Lin wrote:
> The device_node pointer is returned by of_parse_phandle()  with refcount
> incremented. We should use of_node_put() on it when done.
> 
> This function only calls of_node_put() in the regular path.
> And it will cause refcount leak in error paths.
> Fix this by calling of_node_put() in error handling too.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: atmel: Fix error handling in snd_proto_probe
      commit: b0bfaf0544d08d093d6211d7ef8816fb0b5b6c75

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
