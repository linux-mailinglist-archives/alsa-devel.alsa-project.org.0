Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FC961D868
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:23:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 655E81707;
	Sat,  5 Nov 2022 08:22:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 655E81707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667633008;
	bh=RnKpU/hTdTSmTNhPFE1pRi4HN2+uJR5IYJ3mHMOQJ94=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=phPbrZS1vsKY3L6Y6Bln27GzUP6xLzDrFVHF3ghpRd/qesfluf7ukjUdF0i/BoIGi
	 Y+9IqpAMlgfOGKKHqe7u6FpL+A9mq1wi5tXtdePIBN7G+NUOugc3Qij+CA2znSaWLD
	 6Hf1rUnrgGaagzxW4MwNze058tbpFL8LleuOL5Os=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 230C5F80818;
	Sat,  5 Nov 2022 08:04:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F3BEF80448; Fri,  4 Nov 2022 17:00:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDF74F80149
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 17:00:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDF74F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cT/Z80DQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3396BB82ED8;
 Fri,  4 Nov 2022 16:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 407C5C433C1;
 Fri,  4 Nov 2022 15:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667577610;
 bh=RnKpU/hTdTSmTNhPFE1pRi4HN2+uJR5IYJ3mHMOQJ94=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cT/Z80DQRnPv/70/29SwYeenhOJLyjbBPUFlgfpd/AZinAJl0ffseRleU9nuJBUko
 sIKZREqhjpM5ixmbGPtno+npoo5AfZQueFrKX4MHj5HbO6032QcomMPEs11RxlCRCF
 +npEC1nMjw2yzXE3+8fu/b6DX5Zyh1ekZsGoJSUiBNkV8rAVlWCjALi+TPQALz5yLf
 8JmAJZSyXbUsqNPG3SJPuUdwaXQ/YK17sNKIv6mAuSRsBddzrpVxhgHxOUN/vVDF21
 VhZaoe2BNXMOANIoVRwbo95TtqPu/Q5GIO4aUt0cX2VGbao265lJ1lyL1fG/C3KEu+
 lOiIL5YO6XPRw==
Date: Fri, 4 Nov 2022 15:59:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 43/65] ASoC: tlv320aic32x4: Add a determine_rate hook
Message-ID: <Y2U2+ePwRieYkNjv@sirena.org.uk>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-43-f6736dec138e@cerno.tech>
 <Y2UzdYyjgahJsbHg@sirena.org.uk>
 <20221104155123.qomguvthehnogkdd@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UFrR3s30/s3KKRzK"
Content-Disposition: inline
In-Reply-To: <20221104155123.qomguvthehnogkdd@houat>
X-Cookie: Quack!
X-Mailman-Approved-At: Sat, 05 Nov 2022 08:03:30 +0100
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-phy@lists.infradead.org, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Abel Vesa <abelvesa@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-mips@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-rtc@vger.kernel.org,
 linux-clk@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Daniel Vetter <daniel@ffwll.ch>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <david@lechnology.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
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


--UFrR3s30/s3KKRzK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 04, 2022 at 04:51:23PM +0100, Maxime Ripard wrote:

> Just filling determine_rate if it's missing with
> __clk_mux_determine_rate will possibly pick different parents, and I'm
> fairly certain that this have never been tested on most platforms, and
> will be completely broken. And I don't really want to play a game of
> whack-a-mole adding that flag everywhere it turns out it's broken.

Well, hopefully everyone for whom it's an issue currently will be
objecting to this version of the change anyway so we'll either know
where to set the flag or we'll get the whack-a-mole with the series
being merged?

--UFrR3s30/s3KKRzK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNlNvgACgkQJNaLcl1U
h9CDMAf+IBF/7wHY1CiObYqxme229wA2t2WnnYY98dUUNS5r9zuNUi7juhvrvn+E
VFS2XsBkk6YvHvT2mQdVWxnTb3suMHPfHzr2euHUVwNVevnBNKDVYp8nlYmyRSUC
orLXibEBBMbA69rPzQyaFqZHj17zEyWQvHSrWk44MnQJH2f7JFEmcLPXgug1dpsP
mmWyfYnKKlRXMqDPkJ3ozY2AaABQkWdk64ke2unO7z9M7ySybhybPHBibISAn/WA
8mQ7NgbHPzpVnTCfrRwSEd05eCvJaEacBYFByW87lEEEtfxwwJsXSZCJpmc9ZVPm
WTCliiQC4/Pd0EJKpPQCXYinp/27fw==
=2DXe
-----END PGP SIGNATURE-----

--UFrR3s30/s3KKRzK--
