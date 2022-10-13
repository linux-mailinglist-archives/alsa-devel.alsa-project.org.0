Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 019595FFDE9
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 09:31:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A46037F16;
	Sun, 16 Oct 2022 09:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A46037F16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665905500;
	bh=r+A85jTxRgf0CRicOayM4dLLN5VzvuhrenYOP1O6oTU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nUzhuu2rWbhhCaXHVy/nfiZniH2fqyE6bu0g4a6y9dOK6qeOFU4d1IhaLGWitDiFl
	 mMVEe6McK87lVIlLMOKD27yKDsUM3Dtb+E4yTFIEsWVnf1k883xYUd//6qf7ibqplk
	 lDRgxhXDFyahKgVDu4jh11tpK3nZorsZJZ8VTq2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E10E9F80566;
	Sun, 16 Oct 2022 09:28:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6348F80431; Thu, 13 Oct 2022 16:53:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FD6EF800A7
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 16:53:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FD6EF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="J6DncY20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665672810; x=1697208810;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r+A85jTxRgf0CRicOayM4dLLN5VzvuhrenYOP1O6oTU=;
 b=J6DncY20/ShTs5+i3wsegWxV44y7BgrkS8ovywhJt21S64CgPeqIXc5E
 lerLoI4cNDKzLaHNzRZCCB3FqrjxQsNFCQkkrhUU3gf3yYAgBrLaZY/Le
 KPRZ1aF/khxddj2JL2x87q14f1zn6jSD7e3oQIQ9xHTr3MOPCbvDWZgq/
 poh+akL1K2NYPantfl70wr2cPp3WQtvSQhO/eNRraRCDTjT4bySLjonD1
 ayvUC7c0KFh2IrMfR0SuicCtJ6GAf46O/MfkU//F5J3NA/5LGl0XgkVX8
 D3oo7Ld38j6ViVHS7Q3DKB9jXRSZoypdgcrdbR6jSEnpGiKDm9tUA3EBH Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="284826945"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="284826945"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 07:53:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="731891101"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="731891101"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2022 07:53:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id DC55F26D; Thu, 13 Oct 2022 17:53:31 +0300 (EEST)
Date: Thu, 13 Oct 2022 17:53:31 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 35/36] pinctrl: intel: Add missed header(s)
Message-ID: <Y0gma4fmhWISrKHe@black.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-36-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010201453.77401-36-andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Sun, 16 Oct 2022 09:28:43 +0200
Cc: Andrew Lunn <andrew@lunn.ch>, Kent Gibson <warthog618@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Rafa?? Mi??ecki <rafal@milecki.pl>,
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
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-aspeed@lists.ozlabs.org,
 Thierry Reding <thierry.reding@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-media@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-arm-msm@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org,
 linux-gpio@vger.kernel.org, soc@kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dong Aisheng <aisheng.dong@nxp.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jacky Bai <ping.bai@nxp.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
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
 Shawn Guo <shawnguo@kernel.org>, Andreas F??rber <afaerber@suse.de>,
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
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 patches@opensource.cirrus.com, Sean Wang <sean.wang@kernel.org>,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
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

On Mon, Oct 10, 2022 at 11:14:51PM +0300, Andy Shevchenko wrote:
> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.
> 
> While at it, sort headers alphabetically.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

For all the intel pinctrl changes.
