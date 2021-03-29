Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 924BC34D8BD
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 22:00:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C4371685;
	Mon, 29 Mar 2021 21:59:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C4371685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617048020;
	bh=33BYQBr/4s8xc5+GccSIv0XFr7Cs0xd2pSG0T9cY22E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A9oRIrkp0mV0SSQuL0KbzRS9ulRJrcQQnU9myVicexrHORkCMm46IT6r5I3ahYKXs
	 4PrmsZiLhlKDvg3m21EdXOEzaYv1aq4tznyEkGKqaYSAat3uMMftqp0L3Ur06pPnIC
	 0/02P4RyeWqi/n4X32JOtwrHE+vgxMwW+ynBWLcs=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 833BAF80229;
	Mon, 29 Mar 2021 21:58:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AED5F80157; Mon, 29 Mar 2021 21:58:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 001E4F80141
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 21:58:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 001E4F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K5fZj4fa"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D93B61554;
 Mon, 29 Mar 2021 19:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617047908;
 bh=33BYQBr/4s8xc5+GccSIv0XFr7Cs0xd2pSG0T9cY22E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K5fZj4fa3wTwxBVGVv7q1JKBJm1UWhEvTvaF+2bYcnBgMDkShzw2MgG8NsOTrRLuP
 vQPGU4D+FLGTn9YK4trNp/AD91mkKtF9M8zS4Wc00OkShzwkYi0KjMKAhiz0ePEobD
 IAzie5hN9XALsPgN+KSuBGzNxsZpxwd/8KZ2/pWdf+NnRWqdRCDA5AZ8HcloD8nm7j
 ljEB4eKJINcXF7b/jF0VLQbCpGbEH6icy/BBzwtnUt0LL7yolsVx9UUrIps7KUpURM
 UwDlhs5hpPeSZBXp6e47zMhrZtL/o9XEhpw9FeiMIEc5tHGj8LrJR1ajAmOpL5+4WG
 N4BhJo1/+Bptw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Argus Lin <argus.lin@mediatek.com>
Subject: Re: [PATCH V2 0/2] Add mediatek MT6359 ASoC accdet jack driver
Date: Mon, 29 Mar 2021 20:58:08 +0100
Message-Id: <161704724764.10039.3415916166435567719.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1615383186-18500-1-git-send-email-argus.lin@mediatek.com>
References: <1615383186-18500-1-git-send-email-argus.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>,
 Chipeng Chang <chipeng.chang@mediatek.com>,
 "Shane.Chien" <shane.chien@mediatek.com>, Jack Yu <jack.yu@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Shuming Fan <shumingf@realtek.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, Dan Murphy <dmurphy@ti.com>
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

On Wed, 10 Mar 2021 21:33:04 +0800, Argus Lin wrote:
> All of 3-pole and 4-pole jack are supported.
> 
> change since v2:
>   - fixs missing blank at Kconfig.
>   - fixs comment format and spelling mistake.
>   - changes private structure mt6359_accdet to mt6359-accdet.h and uses this
>     data as function parameter.
>   - removes compatible string declaration.
>   - uses regmap_read_poll_timeout as polling timer.
>   - simplify jack detection and key detection report function.
>   - adds mt6359_accdet_enable_jack_detect for sound card jack initialization.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] dt-bindings: mediatek: mt6359: add ASoC mt6359 ASoC accdet jack document
      commit: e61c589587c772c5f672b22683c3e0b38be20702
[2/2] ASoC: mediatek: mt6359: add MT6359 accdet jack driver
      commit: eef07b9e0925e16457ab9444b56a7f93b541aee3

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
