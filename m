Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 458CB271DAE
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 10:14:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA46E169C;
	Mon, 21 Sep 2020 10:13:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA46E169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600676080;
	bh=fIZGQZZYM2FyHIfA+1pya2D9PN88lhv1BbBbmjKpOQY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BHMqJOLbUFSSMNU9k1RVi0D+8gwz+vGB1Lmflg3G9LsW/MJfg1Totf5nsnkAeL3sS
	 b1qmyW5DtV49VD2JhWr7hNpqpqA7/Yqr9NMjiSIQ0RCw9Nnklnpfn10H42kGpayiZ0
	 X0a/u1+y8XdcQxPZdOjRcJO7L/WAOypYh0UyQX0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53DCAF802E9;
	Mon, 21 Sep 2020 10:10:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9878AF8015A; Fri, 18 Sep 2020 16:19:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C6BAF800E8
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 16:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C6BAF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.b="E/Zvmkqb"
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EC382D7;
 Fri, 18 Sep 2020 16:19:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1600438758;
 bh=fIZGQZZYM2FyHIfA+1pya2D9PN88lhv1BbBbmjKpOQY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E/ZvmkqbpHcJAzSJWAcR9DD4mJds6aQ4ZFQLl81hgVUiAjz1lfibYnZHTp00xOuII
 mcjifMkOztY3aI9rZ53HCbQjoKLmJZelTc6VG1oDpdrdIMGDhNOqDxzZ/QnX7EXqLb
 tevVCNbQW2u28SmRYp6swCcNwEWZ9cVPc2mEccA8=
Date: Fri, 18 Sep 2020 17:18:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 01/13] dt-bindings: gpio: add common schema for GPIO
 controllers
Message-ID: <20200918141847.GE28436@pendragon.ideasonboard.com>
References: <20200917165301.23100-1-krzk@kernel.org>
 <20200917165301.23100-2-krzk@kernel.org>
 <20200917200936.GF3969@pendragon.ideasonboard.com>
 <CAJKOXPc=o0vtU0VKE5b5Ro3nF=ra-p7UnbFfjj_++onw8MeSKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJKOXPc=o0vtU0VKE5b5Ro3nF=ra-p7UnbFfjj_++onw8MeSKQ@mail.gmail.com>
X-Mailman-Approved-At: Mon, 21 Sep 2020 10:10:22 +0200
Cc: Amelie Delaunay <amelie.delaunay@st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 Stefan Agner <stefan@agner.ch>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chris Brandt <chris.brandt@renesas.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Anson Huang <Anson.Huang@nxp.com>, Lee Jones <lee.jones@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, Magnus Damm <magnus.damm@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>, Andy Teng <andy.teng@mediatek.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sungbo Eo <mans0n@gorani.run>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@mediatek.com>,
 Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sricharan R <sricharan@codeaurora.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hoan Tran <hoan@os.amperecomputing.com>, linux-arm-kernel@lists.infradead.org,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Scott Branden <sbranden@broadcom.com>, linux-unisoc@lists.infradead.org,
 - <patches@opensource.cirrus.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Yash Shah <yash.shah@sifive.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mark Brown <broonie@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-media@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
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

Hi Krzysztof,

On Fri, Sep 18, 2020 at 09:52:57AM +0200, Krzysztof Kozlowski wrote:
> On Thu, 17 Sep 2020 at 22:10, Laurent Pinchart wrote:
> > On Thu, Sep 17, 2020 at 06:52:49PM +0200, Krzysztof Kozlowski wrote:
> > > Convert parts of gpio.txt bindings into common dtschema file for GPIO
> > > controllers.
> >
> > How about deleting the part that has been converted from gpio.txt ?
> 
> I did not move everything from the gpio.txt and it is really nicely
> explained there. I think to leave it as it works as a overview/guide
> better than YAML.

I'm just a bit worried that duplicating some of the information in two
places will lead to them becoming out of sync, but maybe the risk isn't
that high.

> > > The schema enforces proper naming of GPIO controller nodes and GPIO
> > > hogs.
> > >
> > > The schema should be included by specific GPIO controllers bindings.
> >
> > Instead of including it manually, could we use a conditional select: to
> > apply the schema automatically when a gpio-controller property is
> > present ?
> 
> You mean the same way as generic schema for GPIO controllers work?
> This could be done but the point is to enforce the GPIO controller
> bindings in GPIO controllers, so also in cases when someone forgets to
> add "gpio-controller" property. Although, if given GPIO controller
> schema requires "gpio-controller" then indeed select would work...

You could just make gpio-controller mandatory in the schema, and get
everything else automatically selected based on that, without needing a
manual $ref.

-- 
Regards,

Laurent Pinchart
