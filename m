Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CE36D99A7
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 16:29:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9F6BEC3;
	Thu,  6 Apr 2023 16:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9F6BEC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680791397;
	bh=q6hazTR3zs7E7OVM3zxpzK5DagX6jtQENEamOL0SGKU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EGRMr7cGNaqDo9pgN//BNL1Pi7lReDOolIjo2Lkik/FkNA9mui1e3bvFkP5Wn8W6w
	 ca69leIRwjyPCKq6AO/G8l3eAQ7Sk/8hyg4gDnR9U3Z8U1vAWxTQnIM3S+SXkgsk9Q
	 IIwaI9EpanbO4kSRE6bkOWd7UiQVgZCSpgXYTUdU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 613FFF805A9;
	Thu,  6 Apr 2023 16:26:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5139F8024C; Wed,  5 Apr 2023 17:34:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44979F80075
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 17:34:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44979F80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mlbEhXat
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D76FB623C3;
	Wed,  5 Apr 2023 15:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7C9C433EF;
	Wed,  5 Apr 2023 15:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680708886;
	bh=q6hazTR3zs7E7OVM3zxpzK5DagX6jtQENEamOL0SGKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mlbEhXatZkXJ9X7FsGvPf2rH95VpY5tOnyIMJWR/0y9to3LuusuWOEW94RzKcDlKg
	 HsFf5CsPOKukH8P5uoSP2Z0JlxMdLwy9OxF/8G86S5WBCQNQtEOwVMDqSea8cvrsDU
	 564oj+TiTuatTLbxixAITrHG3+c5+iQ5kEWuaj8LLDEFmeZMfABdscXZNA/eAMWJAk
	 0YkRM5fCov8t3qCX2aBvV3kmH3qO4N9tKQnMqdz4QY5qygfyDOUcQlTmMnAu3at4ih
	 jXuoUGUjvrX+RS3OfX29rQcD6mKS146C1VyprHv8nlDm6+/mgIZ+D1r/IpS6sIO5UV
	 4+HTzWQ25QIJA==
Date: Wed, 5 Apr 2023 16:34:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v3 43/65] ASoC: tlv320aic32x4: Add a determine_rate hook
Message-ID: <fcc11e4d-eba6-4eff-b3e5-9488a4da84c3@sirena.org.uk>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-43-9a1358472d52@cerno.tech>
 <01f32440-8dd2-4030-9006-a3123be55845@sirena.org.uk>
 <erm4iq3mygnrr4h2gd5cag3sfuovv47ibdqsbmxcfabngvnwy4@z63ksvj55zuu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rWy5+BLE6plJ+54H"
Content-Disposition: inline
In-Reply-To: <erm4iq3mygnrr4h2gd5cag3sfuovv47ibdqsbmxcfabngvnwy4@z63ksvj55zuu>
X-Cookie: 1 bulls, 3 cows.
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: MQCYCPZC62BE5RR6YZALIIAAVPBYHXZL
X-Message-ID-Hash: MQCYCPZC62BE5RR6YZALIIAAVPBYHXZL
X-Mailman-Approved-At: Thu, 06 Apr 2023 14:26:27 +0000
CC: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
 Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Paul Cercueil <paul@crapouillou.net>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-mips@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MQCYCPZC62BE5RR6YZALIIAAVPBYHXZL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--rWy5+BLE6plJ+54H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 05, 2023 at 05:17:21PM +0200, Maxime Ripard wrote:
> On Tue, Apr 04, 2023 at 04:26:18PM +0100, Mark Brown wrote:

> > To be honest it's surprising that we'd have to manually specify this, I
> > would expect to be able to reparent.  I suspect it'd be better to go the
> > other way here and allow reparenting.

> Yeah, I think I'd prefer to allow reparenting too, but as can be seen
> from the other reviewers in that thread, it seems like we have a very
> split community here, so that doesn't sound very realistic without some
> major pushback :)

For these ASoC drivers I think we should just do the reparenting,
they're very much at the leaf of the tree so the considerations that
make it a problem sometimes are unlikely to apply.

--rWy5+BLE6plJ+54H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQtlQYACgkQJNaLcl1U
h9B5kwgAhgnq7R11Qu+B0UHvMPR+YuXSbduHynE7TqBLfStAOBSo1K13PASgQaa9
wrmguaiF0D05AzsDdSViUh7jt1zNtO3da+OYl8oXujrIbMZbGni9L/fGVLPLH9LH
S4EKLVYbDM7dTpVx0aDXvlVCYW21kOHRWWv/J6PmtESnjJOfnQGHe3Xs1h8ZgovN
olevNVv7bIIBbK+syW2trg9ueeQFhIP8zFvA7seKaKplyJQN6b6ZBpF5/0RIVobC
9KooGdA4p3nEKzSBi+TYDZL/NYxlB7m/Y8nMussyk40gnvHmlVGYXLA0nVd3MP6U
GEwYUUby6V7fvlt7mTxduZug5WAoPQ==
=MZpO
-----END PGP SIGNATURE-----

--rWy5+BLE6plJ+54H--
