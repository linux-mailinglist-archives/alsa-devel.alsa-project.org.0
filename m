Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 123DA7298F9
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 14:05:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A646820;
	Fri,  9 Jun 2023 14:04:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A646820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686312315;
	bh=1jjcdKhj/+ouunvIwaeB7ZlxqlPxeod3AFpiYr+Xgnk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sFIAddFk1FraH3tLKnuAXndBBwqPIKATWO9bgrDo8whANVol5z64ndpzApFH4QN97
	 mSk7t5bZwdesgL22smoHad1XSRP+N8fUFg3gHWlNfM1yWBK5fBgS1S6tmqzjrFGWDb
	 fE2q3RcIAJWHuqEMSHoVTxXpElNRJIueO4w55g8w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 176ACF80557; Fri,  9 Jun 2023 14:03:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64831F80548;
	Fri,  9 Jun 2023 14:03:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1B75F80199; Fri,  9 Jun 2023 14:03:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10BE1F800ED
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 14:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10BE1F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hswiHLpV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 875E9637AB;
	Fri,  9 Jun 2023 12:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE37C433EF;
	Fri,  9 Jun 2023 12:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686312201;
	bh=1jjcdKhj/+ouunvIwaeB7ZlxqlPxeod3AFpiYr+Xgnk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hswiHLpVaRU5i3syRy6zKRhlad6hHBUThRgRBxw6c27iv3jKzT6iCS6Hrxiqabr4e
	 3y1R6WV6wwbPQEdpahB2cBx2Me017YjDZ+eq4yXK+64r5HzP/8QPSY4ClzAn+6qLwi
	 zsIx8U5ExAR/r5d2FEuOfJkWUhkCh9Ip8txAzhNueBwLGl2gOuNXwTHFNPkYA0Qj4G
	 gFap5aClVRk+1gIdGsJ6yE41CcYQi0qlYArA/c/7q7EWyr62BgLqIx1IJMoHMtSeAL
	 lrJ02XTMPDZz8P5QZYOPVeODPYJ1bRujONDD0VvXPPK7xdxwz8i2FkLO6HdggSkeSe
	 HwFqZjJhJKwkw==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20230608221050.217968-1-nfraprado@collabora.com>
References: <20230608221050.217968-1-nfraprado@collabora.com>
Subject: Re: [PATCH] Revert "ASoC: mediatek: mt8192-mt6359: Remove " Jack"
 from Headphone pin name"
Message-Id: <168631219815.40482.7959512272039581328.b4-ty@kernel.org>
Date: Fri, 09 Jun 2023 13:03:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: JQ6WP64ONUQC3FANWNH257GSWFAEHS3Z
X-Message-ID-Hash: JQ6WP64ONUQC3FANWNH257GSWFAEHS3Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQ6WP64ONUQC3FANWNH257GSWFAEHS3Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 08 Jun 2023 18:10:48 -0400, Nícolas F. R. A. Prado wrote:
> This reverts commit cbbc0ec6dea09c815f1d1ef0abaf3f2ec89ff11f. That
> commit removed the " Jack" suffix with the reasoning that it is
> automatically added to the name of the kcontrol created, which is true,
> but this name is also used to look for the DAPM widget that will be
> toggled when the jack status is updated. Since the widget is still
> called "Headphone Jack" the jack can't link to the widget and the
> following error is shown:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] Revert "ASoC: mediatek: mt8192-mt6359: Remove " Jack" from Headphone pin name"
      commit: e352f31a863f47adfa54c76b633a21b1ed562387

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

