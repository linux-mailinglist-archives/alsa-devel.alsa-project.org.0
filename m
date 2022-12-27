Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE7D656A3C
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 12:59:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0429473B2;
	Tue, 27 Dec 2022 12:58:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0429473B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672142339;
	bh=g7HIY4b+6IvfdOIQoXlfIzlZiVaWNvMuTc8uzjU4ECA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=m6RH73+OMav64e5ui6zuDC2wp4x/9I/tNc2lWxhPVirM4Va37A9SSGTDKaUbwPLjL
	 /M+qM2UgUR3qcF8+E37RNW6MerqUdYuzXbSu8dZigoMXblSGm8/AsoNB5afwEtdeVV
	 hA801I1XWwKhP3X1gllbCghSpi0avC0ojILPmt7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7507F80539;
	Tue, 27 Dec 2022 12:57:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8F92F80538; Tue, 27 Dec 2022 12:57:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2203AF80535;
 Tue, 27 Dec 2022 12:57:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2203AF80535
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LiVOAfPC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5C8D61046;
 Tue, 27 Dec 2022 11:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB09C433F0;
 Tue, 27 Dec 2022 11:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672142221;
 bh=g7HIY4b+6IvfdOIQoXlfIzlZiVaWNvMuTc8uzjU4ECA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LiVOAfPC6WyqiAdJRU9DEOXhFy8UxDONj3m9SGoHyoVnRLtVT+j5KOZCW3uo3e2UC
 9u5RwntdUtqM2gtA2zOqmQBR36Undpcgv9HZZ3bdrNJ2SViTeMe37LDkDAleuStyM1
 khERj7xQ+MdORdK/q7N7RSAFUwx1AunZjX3mx0pNJb7cYWznF8CO2vXcwoi/p7xurY
 jXwVRnLENyaoh/xg9pROB7Jr5OCS4n/XivabW2lGhLjXt2zV4XqG2knHqVrtNPtvee
 6ekKN5ii6tDXHHW/RqL8tUkm5js3+B3UZpLKtcbzSPcCMvClobtwhabp0qUO6XKGvw
 mJNSHVDJrtpew==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
References: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/15] ASoC: Drop empty platform remove functions
Message-Id: <167214221622.82924.13822151763224793396.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 11:56:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12-dev-7ab1d
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, sound-open-firmware@alsa-project.org,
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Nuno =?utf-8?q?S=C3=A1?= <nuno.sa@analog.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 kernel@pengutronix.de, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Daniel Mack <daniel@zonque.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 12 Dec 2022 21:53:51 +0100, Uwe Kleine-König wrote:
> this patch series removes all platform remove functions that only return
> zero below sound/soc. There is no reason to have these, as the only
> caller is platform core code doing:
> 
>         if (drv->remove) {
>                 int ret = drv->remove(dev);
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/15] ASoC: pxa: Drop empty platform remove function
        commit: e812aa458acf7c47f9f5d8e6c62177317a998263
[02/15] ASoC: amd: Drop empty platform remove function
        commit: 001c6df098834eb5eaa36a2b121bd6a675b38aa9
[03/15] ASoC: atmel-classd: Drop empty platform remove function
        commit: 9d5664fdf6a89e66f806763d76f18337ab3cb18a
[04/15] ASoC: atmel-pdmic: Drop empty platform remove function
        commit: edf2ceb9a2a279d350fdb57c1930554c8675b2b1
[05/15] ASoC: 88pm860x: Drop empty platform remove function
        commit: 9fbfe1d1acf596b5ba9ddbb145c7be6a09b2f1eb
[06/15] ASoC: ac97: Drop empty platform remove function
        commit: 7de12b06eeb2fbe3732e96ae40e38159700f61ec
[07/15] ASoC: adau7002: Drop empty platform remove function
        commit: 06e8ce87356e7751ffea831396f8b3129a805d28
[08/15] ASoC: bt-sco: Drop empty platform remove function
        commit: f9cc66890fb8d695e38486595851701dbfa22487
[09/15] ASoC: cq93vc: Drop empty platform remove function
        commit: 61f62f1fcf7e4a3cb347d2d4c9696dd725c922f0
[10/15] ASoC: mc13783: Drop empty platform remove function
        commit: 140212aefce754f230a28751415c71705f7e3ffa
[11/15] ASoC: wl1273: Drop empty platform remove function
        commit: d09751b3523eb0d6bea345bda99b2f5417feb2ff
[12/15] ASoC: pxa: e740_wm9705: Drop empty platform remove function
        commit: f2211ac36ab0b175cca7a244560923fbeeb6c7ae
[13/15] ASoC: pxa: e750_wm9705: Drop empty platform remove function
        commit: 4ed923e8076b8728c1c1cf587b79a83e34de22b0
[14/15] ASoC: pxa: e800_wm9712: Drop empty platform remove function
        commit: 394296eee2c220283ebc835db61ba4531f865558
[15/15] ASoC: SOF: nocodec: Drop empty platform remove function
        commit: 603d96c917b2e8c2146069bf7db1468fd87f800b

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
