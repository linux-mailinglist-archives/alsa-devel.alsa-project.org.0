Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15835750725
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 13:52:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EF95206;
	Wed, 12 Jul 2023 13:51:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EF95206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689162720;
	bh=tKLfC2rwGbl8YnK4YjwgLzW6T3SVz9CzEGa1Le2ZqKA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sg1Pr7TjGqgAxTkkEjR+8bOq4O77qdK6i00jJd3bX1l7gitNpzvSpxLv2jiFIOJ7D
	 b5+8Nhc/kLdMv8wKTfB8G+Go8zIztJ81CU7LjTOxG0TPnkENMicVIQOFIEZOAC/I4N
	 XIWXECi8KYVJwZ5Pw92n8dv70r7OeWYfzPew4klQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AC84F8061E; Wed, 12 Jul 2023 13:47:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C693DF8061E;
	Wed, 12 Jul 2023 13:47:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 586AAF80615; Wed, 12 Jul 2023 13:47:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99645F80614
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 13:47:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99645F80614
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NgADLBwe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8CBF76177D;
	Wed, 12 Jul 2023 11:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E57FC433CC;
	Wed, 12 Jul 2023 11:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689162442;
	bh=tKLfC2rwGbl8YnK4YjwgLzW6T3SVz9CzEGa1Le2ZqKA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NgADLBweT0/pL8STLLYgRap71SqW9W3ABpkb1f5xw6T76IBKC/4jctVi2o7+yzp8G
	 zEBXWmB+QvSOe0ZX54kbZV7SfMHRd4sdjWNQrHgBBNSwKVxougyW3N8I6uLVCzgpO+
	 +zzoDG4Qkagy71dOKACXasOojrtg0Fa69MDoZFLgjVwROvXa1TxscPExwh1lENdC1t
	 ri82wt37Gl7VYX+ikEzWDn5Zzjz7MFubp7Vuj/Qk8iffvl+tApUECx/kEM4nULNHw8
	 vyvxzH+9VQo6vCrvN8sPNScnAAIFR5GjGtCXo388Fl8uc07s6SwZrasv1BLRDn/sN1
	 9252cpsggdlxQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
In-Reply-To: <20230705214800.193244-1-cristian.ciocaltea@collabora.com>
References: <20230705214800.193244-1-cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v3 0/3] AMD Vangogh support for NAU8821/MAX98388
Message-Id: <168916243923.46574.4640392228923703244.b4-ty@kernel.org>
Date: Wed, 12 Jul 2023 12:47:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 2P7VRBAQXTZNKOB5BN53NO2FI3RRE5MZ
X-Message-ID-Hash: 2P7VRBAQXTZNKOB5BN53NO2FI3RRE5MZ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2P7VRBAQXTZNKOB5BN53NO2FI3RRE5MZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 06 Jul 2023 00:47:57 +0300, Cristian Ciocaltea wrote:
> This patch series extends the Vangogh machine driver to support a variant
> based on the Nuvoton NAU88L21 Codec and the Analog Devices MAX98388
> Speaker Amplifier.
> 
> Changes in v3:
>  * Dropped acp5x_max98388_hw_params() in PATCH 3/3 and rely on dai_link
>    to set format, according to Mark's review
>  * v2: https://lore.kernel.org/all/20230705134341.175889-1-cristian.ciocaltea@collabora.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: amd: vangogh: Make use of DRV_NAME
      commit: a0cb05cb70b469198ad86c0b13b02cbba3ecd8fd
[2/3] ASoC: amd: vangogh: Use dmi_first_match() for DMI quirk handling
      commit: 3dd26e27ccb4f18b4d25c0a49e1888eca9c6a724
[3/3] ASoC: amd: vangogh: Add support for NAU8821/MAX98388 variant
      commit: dba22efd0d177a23c6da2a161e9a1ad29718924c

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

