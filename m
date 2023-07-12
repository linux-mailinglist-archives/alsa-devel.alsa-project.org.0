Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA6975071E
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 13:51:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 238471F1;
	Wed, 12 Jul 2023 13:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 238471F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689162704;
	bh=bTeEZPf59lqakPF2P640QhtCaifAT8KzWjxjRQAvfnc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PN/uOA4XoyQYILMeKBZ8RBsbBKhQF81IddkzQb+vusZl53bjonC1faJ9b272fbwEQ
	 eMHhSfyKLYVSvH1dtR0hQXNT9kbFkxBaStDRE618Mvrgn/F0TcJ4ztLWNmskEsYbMo
	 oQmYRzryKTqhTdguF4KsAQ4+9hDguTU33JNXdQOU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D96F9F80613; Wed, 12 Jul 2023 13:47:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18A82F80613;
	Wed, 12 Jul 2023 13:47:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACBDBF80615; Wed, 12 Jul 2023 13:47:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADD2FF80606
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 13:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADD2FF80606
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EiZoQjZ6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 99A74617A0;
	Wed, 12 Jul 2023 11:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D464C433CA;
	Wed, 12 Jul 2023 11:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689162439;
	bh=bTeEZPf59lqakPF2P640QhtCaifAT8KzWjxjRQAvfnc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EiZoQjZ6OT3Ns26mOvM2p7uoHP09mmBq3LcJaYDrau8QaSqCuLLuh4DZ3E49nM2/1
	 M4cI+gkdiZMs6TAXBaWLu5RVN3pd7cdo6fCfyTe9OLCwdXj/3WKcKYQwd3NFr0QhzO
	 dNxUG3G8BX0lkYfp247WRyI9LMejNflUkUboKNMRs9Yd8g73JHBFMi+rsjzfU4+j0G
	 hRgHDvhfkHlCNb87ystKScAvOaNpBqpGy/6VNHSnbXO5B/uc3k14eqUvL+73sqkLd9
	 /PEku4ywk9LwSaWCUoB/watjzaDERPKE1t7xn7T44egvjg47elD5Wtikk4+Ud0kCS9
	 KW+qXVVi1XuuA==
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 David Lin <CTLIN0@nuvoton.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Antti Palosaari <crope@iki.fi>,
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>,
 Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>,
 Michael Krufky <mkrufky@linuxtv.org>, Matthias Schwarzott <zzam@gentoo.org>,
 Akihiro Tsukada <tskd08@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20230703135211.87416-1-andriy.shevchenko@linux.intel.com>
References: <20230703135211.87416-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 0/4] ASoC: remove copy of intlog10()
Message-Id: <168916243503.46574.8648492910653154560.b4-ty@kernel.org>
Date: Wed, 12 Jul 2023 12:47:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: SOESKWHFLXR3VPVHGSUQE3S5RKI2QROC
X-Message-ID-Hash: SOESKWHFLXR3VPVHGSUQE3S5RKI2QROC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SOESKWHFLXR3VPVHGSUQE3S5RKI2QROC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 03 Jul 2023 16:52:07 +0300, Andy Shevchenko wrote:
> The first three patches moves intlog10() to be available in entire
> kernel. The last one removes copy of it in one driver. Besides already
> good Lines of Code (LoC) statistics the upcoming users, if any, can
> utilize the exported functions.
> 
> The series can be routed via ASoC tree (as Mauro suggested).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] lib/math: Move dvb_math.c into lib/math/int_log.c
      commit: f97fa3dcb2db02013e6904c032a1d2d45707ee40
[2/4] lib/math/int_log: Use ARRAY_SIZE(logtable) where makes sense
      commit: 08f6a14b2d376e96cb7166694193ec3c3a496d25
[3/4] lib/math/int_log: Replace LGPL-2.1-or-later boilerplate with SPDX identifier
      commit: 9ab04d7ed8bdd395b0617a1647dd475681f99151
[4/4] ASoC: nau8825: Replace copied'n'pasted intlog10()
      commit: a04616321f50bc389cd8d19a6d300d3c3f1be77b

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

