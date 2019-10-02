Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2213BC8B90
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 16:44:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 947FA167E;
	Wed,  2 Oct 2019 16:43:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 947FA167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570027445;
	bh=0EYAPEco4HeclF4WDG/tXQXNK5jshKaDq/O0aYjPBWM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=keQ2gagKjVXH6c8GBVRaT7EmavGuuwySkhBRugqKjwbxvLlx0syTaM9bdR2a5moZM
	 woPOncVngKecL/j+9+O3SHwzL/ofanJvFiWfwP+BELXFuOX2ypH7Dm4uY5rthzAcYx
	 iQHDpT4DiTBL633Q+KNk3H3yeZnQaaPHIpUtFoOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C08B7F803F3;
	Wed,  2 Oct 2019 16:42:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23FFFF80391; Wed,  2 Oct 2019 16:42:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3149F8016F
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 16:42:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3149F8016F
Received: by mail-wm1-f65.google.com with SMTP id 5so7541733wmg.0
 for <alsa-devel@alsa-project.org>; Wed, 02 Oct 2019 07:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zjyo+RChyczV0/eg5T2YT/WXOsDMQxkL4AjVjOH/ZWQ=;
 b=O+JtNH3Pe9IAPVDb8Gh6SB90I5NkHHTKfeEpCTbFKhajIBlEGWopec9y4y6ehXCXbw
 OrpFSHi+lwDDaNNvUZttweiENl2aNCOnzQPVsayh/+wF6k5NCiYRQrotiYyVbx1izoiw
 uLEnSNtGtSXO0bs07tL3MUOe58nwolMKn13lTC5/5Sllo9gjtYIVi8jX3RgY7v3JNql8
 zx7ahPvhRTIADZaScaf5kmInBubv0gvYXkVOwUNLV3YH0Dv34Q0UlzIk53/wxMb18Cec
 Vp6fUvrzm8roVY73WYISfqXyI8hvuVqK79+7FAZKrCMIPdDgBjzOGlDFONNo1U4OM8kR
 dN2Q==
X-Gm-Message-State: APjAAAUc/O7xCl82c7lBdYZ+lNNHQtmpXb3YnxyCeP6a6icouKUHbOva
 206N9oQPTO4/e//83NJiALg=
X-Google-Smtp-Source: APXvYqw/q15Ex1aluyAWrCmSmp8ebyZKx9I38m8wSwWqcDT1DRpshz5FSYSiSjQmwsSdItJLt7i88g==
X-Received: by 2002:a7b:c152:: with SMTP id z18mr3112710wmi.70.1570027334811; 
 Wed, 02 Oct 2019 07:42:14 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id c10sm31210030wrf.58.2019.10.02.07.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 07:42:14 -0700 (PDT)
Date: Wed, 2 Oct 2019 16:42:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <20191002144211.GB15898@pi3>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130324eucas1p118bfab45306a29752bf4c1cfdd8f61a1@eucas1p1.samsung.com>
 <20190920130218.32690-10-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920130218.32690-10-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v2 09/10] ARM: dts: arndale: Add audio
 support (WM1811 CODEC boards)
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

On Fri, Sep 20, 2019 at 03:02:18PM +0200, Sylwester Nawrocki wrote:
> Add sound node and the clock configurations for the I2S controller
> for audio support on the Exynos5250 SoC Arndale boards with
> WM1811 based audio daughter board.
> 
> We need to increase drive strength of the I2S bus, otherwise
> the audio CODEC doesn't work. Likely the CODEC's master clock
> is the main issue here.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v1:
>  - moved &clock, &clock_audss parts to preserve alphabetical order
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts | 27 +++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)

This does not apply. Please rebase and resend.

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
