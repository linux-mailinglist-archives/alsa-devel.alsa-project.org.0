Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98478593322
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 18:26:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D1FE161D;
	Mon, 15 Aug 2022 18:25:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D1FE161D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660580776;
	bh=LmpGns7c5wLoId8LSEZ+UEolch41Y3wjGy4mOteOmBE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ss0z4aKwKN05/DdOvBPI9QGc0/uGCFzQyIKsSEy29rI/2auA/XShPXjj0X3M2waDn
	 2GLoHmxEjSHKQviWjosGJeeUVf1wbRddJZo82KZoJP4K++jLJdbTjmaf0dxxLeN5FQ
	 n62YUyc1bpxI/Huaa+UTG3ufeNe6VkFxovPfMD0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 044E2F80578;
	Mon, 15 Aug 2022 18:23:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5A0BF8057C; Mon, 15 Aug 2022 18:23:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5911BF80578
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 18:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5911BF80578
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IMAiOSv3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D46AECE1176;
 Mon, 15 Aug 2022 16:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C375FC433C1;
 Mon, 15 Aug 2022 16:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660580591;
 bh=LmpGns7c5wLoId8LSEZ+UEolch41Y3wjGy4mOteOmBE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IMAiOSv3VHv6/nNPdcMyK5VmhwP5QuIWADxtgV9ax/xQb3nqmUS3h4QniqMkXpSAk
 zXEiX5DngrWuz8mT+sNsut/FFBGEFRF+XmU3AfR++4P8+tM/Z0fOKPMDEXoolJz0Pv
 EwII4+u6PoHS/3RuEX8PxT8iczF6n0jryTf5QDs2+Ram8ZhwtCnSyjNAVSEYjTUXtj
 2zHH9rgAPb/yKy1rigi2YBN15XAUtn03PRNcPcBeh4LBdZZw5XMzMtEXX199GD8EFk
 0CdfEgpXowpOP1EUVBlxqofhjrJRuc8HDlyDOiAiiCimlMxQAz1MQVDFSkRmTe91+I
 MUVRnNpu73N3w==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, 
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <fb959b3bda689aa47e1fbe9948de957b77530b24.1659764734.git.christophe.jaillet@wanadoo.fr>
References: <fb959b3bda689aa47e1fbe9948de957b77530b24.1659764734.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: sam9g20_wm8731: Simplify some error message
Message-Id: <166058058851.769843.12342144572880656518.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 17:23:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Sat, 6 Aug 2022 07:45:48 +0200, Christophe JAILLET wrote:
> dev_err_probe() already prints the error code in a human readable way, so
> there is no need to duplicate it as a numerical value at the end of the
> message.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sam9g20_wm8731: Simplify some error message
      commit: 7d67657cb472a80d54457362bc421f2b57ee250b

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
