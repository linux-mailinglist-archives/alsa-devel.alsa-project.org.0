Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CADD410889A
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2019 07:01:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5887F189B;
	Mon, 25 Nov 2019 07:01:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5887F189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574661717;
	bh=C6o3dYogl+z4UzEztwhXEnJ/beTZyJk4InMpeRsQXC8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mYEjHHQrWKdwTWjlqkeBmZ6uetY1RIMNknLTbqNzvOULu6wkGhCtsW+xnTFMdvavq
	 uTgh/XCQ1kztICQCYtF9mNhQu6QFMWGFZjPNm+QeJxM47I4xNGCfKBW/Z2MtXud0JU
	 Q6N40yuCkSn3o4AL7lyKwXuVFvCesagGv2YUYZOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0CD6F8016F;
	Mon, 25 Nov 2019 07:00:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0165F8016F; Mon, 25 Nov 2019 07:00:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37187F800E5
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 07:00:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37187F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lMUCkUkI"
Received: by mail-oi1-x243.google.com with SMTP id a69so4828278oib.2
 for <alsa-devel@alsa-project.org>; Sun, 24 Nov 2019 22:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eQSarq49DnVw0rcWLXiTYEIu9cTGbAYlx/j0JgRqweY=;
 b=lMUCkUkIx6zDyfj+LRSdHcnBrXHmd7LOs8TV5s0ik4lMR4GRqIkkYCaFkWYk3ja8GJ
 3wr8spZ5sBsgMXOvP/8mpXW9+7YVjYx9JmcqZTSIqB1aukvWhftunZtOPHw/qGuFYDrl
 ByqXNKjKAuPdLrFiBvylCvZOFtgyUPU7lMiLBp3frRuaS0yKw41e8QQK1FcFA98Z9XOz
 xNrDXG4FfSULpnyUvHcRjCpceu2V/YR/erqUQk3jpvBxxdlQngO8fJrt/pPGm3e+X8GC
 089+fj5kQGO70Uxx6wtmMXcZuUsIA0MppdL2FTgg9jqeRm/dbId+usuJXQHfwJ9T3+z3
 bAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=eQSarq49DnVw0rcWLXiTYEIu9cTGbAYlx/j0JgRqweY=;
 b=pfsjSs4S3KeVJGcZsCG97nmqAb/PcVuBdUUSMH9XfYs4xMS8yreQubhmLTMOtY4Dcp
 J2iiCJbrhtV5fQF/jGHDwOC/snCm0Di6uS/dl6uzo4IQVSAAU4OBj2fkQVLPSVDFq3zX
 M1CU6AerX2aSeaF/+IAzr6kjH3sgjYbW8wAM2LkuIfBQef8WKl3QWD1iCEA3Q1imTAsR
 NJ/qBe4i2EnYKkR5z7hCZm6zrKYfSI7O1wwGPQiDNg0PQmHLpayI/k64nd7Yzew7ltCM
 lRAL+iK5WIEaQ8cukux+6/7KxOCxqxtrUvw35Y0CMWGYXvtfyuVQV9u4TJ9/Q4o0t4uE
 soow==
X-Gm-Message-State: APjAAAXjdqP9z80eyTnmkp6Z60Gw6Vm3aOjZ0+O1+IRnwnfzS+xoKsoW
 zyx5vVbftRSglVJDPthBs5k=
X-Google-Smtp-Source: APXvYqwCt0pUp/5ulJPVJkFBTwEMCdOrZj32Tq6wBeqxy3b7qSTAS+1dBmRCxNXy1JlJOaeQ7a/AFQ==
X-Received: by 2002:a05:6808:4c3:: with SMTP id
 a3mr22503775oie.40.1574661601984; 
 Sun, 24 Nov 2019 22:00:01 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id c1sm2101171otn.44.2019.11.24.22.00.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 24 Nov 2019 22:00:01 -0800 (PST)
Date: Sun, 24 Nov 2019 21:59:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Message-ID: <20191125055959.GB5636@roeck-us.net>
References: <1574651030-29519-1-git-send-email-jiaxin.yu@mediatek.com>
 <1574651030-29519-2-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574651030-29519-2-git-send-email-jiaxin.yu@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, yong.liang@mediatek.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 eason.yen@mediatek.com, yingjoe.chen@mediatek.com, wim@linux-watchdog.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v5 1/2] dt-bindings: mediatek: mt8183: Add
	#reset-cells
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Nov 25, 2019 at 11:03:49AM +0800, Jiaxin Yu wrote:
> From: "yong.liang" <yong.liang@mediatek.com>
> 
> Add #reset-cells property and update example
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: jiaxin.yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>

I keep wondering why your series does not show up in the watchdog patchwork.
Turns out that is not surprising, since you don't copy the watchdog mailing
list. That all but guarantees that it gets lost from my workflow. That is
kind of interesting - there are lots of lists in Cc:, but the two lists
that matter because maintainers need to review it (watchdog and devicetree)
are missing.

Anyway, comment and question below.

> ---
>  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 10 ++++++---
>  .../reset-controller/mt2712-resets.h          | 22 +++++++++++++++++++
>  .../reset-controller/mt8183-resets.h          | 15 +++++++++++++
>  3 files changed, 44 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 3ee625d0812f..4dd36bd3f1ad 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -4,6 +4,7 @@ Required properties:
>  
>  - compatible should contain:
>  	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
> +	"mediatek,mt2712-wdt", "mediatek,mt6589-wdt": for MT2712

Is that (still) correct ? After all, behavior is different for those two now.
Just wondering.

Guenter

>  	"mediatek,mt6589-wdt": for MT6589
>  	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
>  	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
> @@ -16,11 +17,14 @@ Required properties:
>  
>  Optional properties:
>  - timeout-sec: contains the watchdog timeout in seconds.
> +- #reset-cells: Should be 1.
>  
>  Example:
>  
> -wdt: watchdog@10000000 {
> -	compatible = "mediatek,mt6589-wdt";
> -	reg = <0x10000000 0x18>;
> +watchdog: watchdog@10007000 {
> +	compatible = "mediatek,mt8183-wdt",
> +		     "mediatek,mt6589-wdt";
> +	reg = <0 0x10007000 0 0x100>;
>  	timeout-sec = <10>;
> +	#reset-cells = <1>;
>  };
> diff --git a/include/dt-bindings/reset-controller/mt2712-resets.h b/include/dt-bindings/reset-controller/mt2712-resets.h
> new file mode 100644
> index 000000000000..e81c8bb311b7
> --- /dev/null
> +++ b/include/dt-bindings/reset-controller/mt2712-resets.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Yong Liang <yong.liang@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT2712
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT2712
> +
> +#define MT2712_TOPRGU_INFRA_SW_RST				0
> +#define MT2712_TOPRGU_MM_SW_RST					1
> +#define MT2712_TOPRGU_MFG_SW_RST				2
> +#define MT2712_TOPRGU_VENC_SW_RST				3
> +#define MT2712_TOPRGU_VDEC_SW_RST				4
> +#define MT2712_TOPRGU_IMG_SW_RST				5
> +#define MT2712_TOPRGU_INFRA_AO_SW_RST				8
> +#define MT2712_TOPRGU_USB_SW_RST				9
> +#define MT2712_TOPRGU_APMIXED_SW_RST				10
> +
> +#define MT2712_TOPRGU_SW_RST_NUM				10
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT2712 */
> diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/include/dt-bindings/reset-controller/mt8183-resets.h
> index 8804e34ebdd4..d582da6bedae 100644
> --- a/include/dt-bindings/reset-controller/mt8183-resets.h
> +++ b/include/dt-bindings/reset-controller/mt8183-resets.h
> @@ -78,4 +78,19 @@
>  #define MT8183_INFRACFG_AO_I2C7_SW_RST				126
>  #define MT8183_INFRACFG_AO_I2C8_SW_RST				127
>  
> +#define MT8183_TOPRGU_MM_SW_RST					1
> +#define MT8183_TOPRGU_MFG_SW_RST				2
> +#define MT8183_TOPRGU_VENC_SW_RST				3
> +#define MT8183_TOPRGU_VDEC_SW_RST				4
> +#define MT8183_TOPRGU_IMG_SW_RST				5
> +#define MT8183_TOPRGU_MD_SW_RST					7
> +#define MT8183_TOPRGU_CONN_SW_RST				9
> +#define MT8183_TOPRGU_CONN_MCU_SW_RST				12
> +#define MT8183_TOPRGU_IPU0_SW_RST				14
> +#define MT8183_TOPRGU_IPU1_SW_RST				15
> +#define MT8183_TOPRGU_AUDIO_SW_RST				17
> +#define MT8183_TOPRGU_CAMSYS_SW_RST				18
> +
> +#define MT8183_TOPRGU_SW_RST_NUM				18
> +
>  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8183 */
> -- 
> 2.18.0
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
