Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BCE2D0B32
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 08:39:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC6511737;
	Mon,  7 Dec 2020 08:38:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC6511737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607326759;
	bh=Qw+du/mSlzkBdQUVkkaU3+b9rHnfBCs2s9/6/5XLJug=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X65XeZ7deiQYxjxDngkc6uZDgq+bDUIRKI8m+wpv9YcgUPELYMGvK2iXnJH2sSeJ3
	 dGKL6SnZFM9m47GbXQyHGmC8BFRQLCK3FhVMZ7J3tqoWCo1QAcnuKp7JK+JVJO/uxO
	 8fpVmyJ0xMjou0Shft8g7bzxzQ3oPnNS/lKuSVDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC72CF80217;
	Mon,  7 Dec 2020 08:37:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88DB3F800E2; Sat,  5 Dec 2020 20:18:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04081F800E2
 for <alsa-devel@alsa-project.org>; Sat,  5 Dec 2020 20:18:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04081F800E2
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 694A6804C8;
 Sat,  5 Dec 2020 20:18:37 +0100 (CET)
Date: Sat, 5 Dec 2020 20:18:35 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] dt-bindings: eliminate yamllint warnings
Message-ID: <20201205191835.GC332836@ravnborg.org>
References: <20201204024226.1222-1-thunder.leizhen@huawei.com>
 <20201204024226.1222-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204024226.1222-2-thunder.leizhen@huawei.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8
 a=pGLkceISAAAA:8 a=8AirrxEcAAAA:8 a=KKAkSRfTAAAA:8 a=7gkXJVJtAAAA:8
 a=QyXUC8HyAAAA:8 a=ds-h48H8TGFLVGBnORYA:9 a=CjuIK1q_8ugA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=ST-jHhOKWsTCqRlWije3:22 a=cvBusfyB2V15izCimMoJ:22
 a=E9Po1WZjFZOl8hwRPBS3:22
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:37:43 +0100
Cc: Ricardo Ribalda <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linux-clk <linux-clk@vger.kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 NXP Linux Team <linux-imx@nxp.com>, linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 alsa-devel <alsa-devel@alsa-project.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Shawn Guo <shawnguo@kernel.org>
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

On Fri, Dec 04, 2020 at 10:42:26AM +0800, Zhen Lei wrote:
> All warnings are related only to "wrong indentation", except one:
> Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml:4:1: \
> [error] missing document start "---" (document-start)
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Ricardo Ribalda <ribalda@kernel.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>

For the bindings/display/* parts:
Acked-by: Sam Ravnborg <sam@ravnborg.org>
