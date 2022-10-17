Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88060605C68
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 12:35:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 022AC9533;
	Thu, 20 Oct 2022 12:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 022AC9533
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666262101;
	bh=FViSSKwYNLFy/8i7voLq1fvEAiC2E4b3lKUtg6bhSNs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eQtCIPNo+3il9O5+25sVWo1ul3qwef+L0/K1DQo7FFP3mGtYwK9t/KimaxVhPSTDE
	 0MrW8RjNLMr1XCAuMz5mm4qUME8szXCSdzb8hU2k0rXPs+dIgFpOIbr1rfQDS0XIeH
	 YC8Jv+7EVervBmEJVmqBGAqqR08WQt0CS43H/qyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0079BF8053D;
	Thu, 20 Oct 2022 12:33:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7619F80496; Mon, 17 Oct 2022 14:16:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9A51F80149
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 14:16:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9A51F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G4XBw7Ot"
Received: by mail-qt1-x82b.google.com with SMTP id g16so2696658qtu.2
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 05:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FViSSKwYNLFy/8i7voLq1fvEAiC2E4b3lKUtg6bhSNs=;
 b=G4XBw7OtjlEVYhvq3ujakfFtUjrlMIkd5uVVPI4L3fSHgn9r2dYLTBKR1DSk55qy8/
 vjDDH2t4lQErUrsZ81N0WmnCPAq1TAG4psbIGjoQRhntN5Cmq1aF/T5qp0/euyInLZPZ
 /K8bnHyxQYrmvZCrh75klmy5Bz15Y/XvsM73Xs3LGuMo2izmCHPf5UYpUMbW37BEsOEV
 sVucDgXlyB1YZt4pqPGa9U7E85eMuIK9JN+tGTbAMfTNB3gqhaNnxWOxBOHdWu8HWlhw
 4OAFcfWlF4Cka/k2IMLMYdJ1w8Emhfeq9FKglqB57GbZ26ff4iD6Qp74edFo/4+10u7I
 pv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FViSSKwYNLFy/8i7voLq1fvEAiC2E4b3lKUtg6bhSNs=;
 b=4XGkOovb13kdUgSIPvGAfFQIkYCvRPD41zq9AMVzCEJEq6MEQbvxqQAOgYcF19RD80
 SBmfduEfVbmOzGdpha+Xd5DmUupjdlfsrjni5xLyrs01WzZX70o97wzj96i/4J1XowFb
 HbbpulzsPmN/VvbhYFlmI7m+tQdI1r0e/TtpbuXhuCnSLuBmt3bMbmbf/WxMMsW2mDm+
 y3FbIaG0lofgY6Ubnizs7LGxnmw5FswNZNbzNFZmFbk76BRkaoAIYelMjQL85ub+plx/
 gYc8I03wDlzXONzR25PJUlYqfLQSM6Rd3+l/ZFWe9aCZaEMBXlK96MdF3o+x70Awasu0
 fuow==
X-Gm-Message-State: ACrzQf1N7kbAHdnxfMjJ1GZyLnct5KoRDokfoQ1EV0iHRfeQrDkzDeyq
 KIUusP7833GCucB9vKDJVByLTzs0DGDwRNqVvpo=
X-Google-Smtp-Source: AMsMyM5ONAbRwJ0mRV8lFkFN/+yOIGgrHcLBILWbhUW8XaqfnSolfxdkiScuiVdMZUaqcXP+J2a9nYR4SqM8sa8eRyQ=
X-Received: by 2002:a05:622a:1045:b0:39c:e2e1:dc59 with SMTP id
 f5-20020a05622a104500b0039ce2e1dc59mr7379719qte.195.1666008987610; Mon, 17
 Oct 2022 05:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdbdzFR-a_xh8EjLMAshTeesOYhD3-_Bkc=vi7iK72ZKtA@mail.gmail.com>
 <CAMRc=MexjuQw+hUDDfCVxiBEJ573jNb3Ko9SyOU-xJ03wOe8cQ@mail.gmail.com>
In-Reply-To: <CAMRc=MexjuQw+hUDDfCVxiBEJ573jNb3Ko9SyOU-xJ03wOe8cQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Oct 2022 15:15:51 +0300
Message-ID: <CAHp75VftkwPB-+jhCrhCdPRN0hLm5DLADMyAO45eBTRFfxiNuQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/36] gpiolib: tegra186: Add missed header(s)
To: Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 20 Oct 2022 12:33:16 +0200
Cc: Andrew Lunn <andrew@lunn.ch>, Kent Gibson <warthog618@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Phil Edworthy <phil.edworthy@renesas.com>, linux-samsung-soc@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, Tali Perry <tali.perry1@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-omap@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, alsa-devel@alsa-project.org,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-aspeed@lists.ozlabs.org,
 Thierry Reding <thierry.reding@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-media@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-arm-msm@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org,
 linux-gpio@vger.kernel.org, soc@kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>, Nancy Yuen <yuenn@google.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Chen-Yu Tsai <wenst@chromium.org>,
 Orson Zhai <orsonzhai@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Ray Jui <rjui@broadcom.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Tony Lindgren <tony@atomide.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Haojian Zhuang <haojian.zhuang@linaro.org>, linux-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, openbmc@lists.ozlabs.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Prathamesh Shete <pshete@nvidia.com>, Andy Gross <agross@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Billy Tsai <billy_tsai@aspeedtech.com>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 patches@opensource.cirrus.com, Sean Wang <sean.wang@kernel.org>,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>
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

On Mon, Oct 17, 2022 at 12:35 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Mon, Oct 17, 2022 at 10:52 AM Linus Walleij <linus.walleij@linaro.org>=
 wrote:
>>=C2=B7On Mon, Oct 10, 2022 at 10:15 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > Do not imply that some of the generic headers may be always included.
> > > Instead, include explicitly what we are direct user of.
> > >
> > > While at it, sort headers alphabetically.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> Andy: are you going to send it together with the corresponding pinctrl
> changes in a separate PR?

Yes, this is the plan, but I want first to push it to Linux Next (via
my tree) for a couple of days, so we will be sure there are no
compilation issues.

--=20
With Best Regards,
Andy Shevchenko
