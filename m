Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9B17A2C1
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 10:03:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AEB517F5;
	Tue, 30 Jul 2019 10:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AEB517F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564473814;
	bh=IEBAI9hlkdeZinLdeVhYO9dSgO/bVFRFzDQXHj5DWeo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qcy7Xlru7vDDksOMCZWxgOX3CtvrzWCFitSzSARX/si6MWK9UGsX2k0kRI8xLiKwu
	 OChqqtiE4Fv3BuY2BQO0Gc13MR9cT+ahDf2L7b8sx/zn5Ry2OGl4L+LakggI+T/IZM
	 /XyX4jGijoBPxwzW1bH9QBEC+46TgHdLLGfueHfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D3B1F804CC;
	Tue, 30 Jul 2019 10:01:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDA5EF804CA; Tue, 30 Jul 2019 10:01:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FF43F800AB
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 10:01:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FF43F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="T4M+viem"
Received: by mail-pg1-x543.google.com with SMTP id r22so2031407pgk.10
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 01:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qb+k+IflEc/XKNcEL8wcO85r4kdnoHed1qavVtD26A4=;
 b=T4M+viemc2mgjfoNgtBEbNrHi4++XWQ1uuVWtDnxMAEaopanQDFqANVTDntykuRyXa
 9pZUS5u1W7nk6GgXn3SPzeeZFaWUO85khfULWHtP3yWfiLB8wybXW+0u4iiLBaJMoIMM
 SOfbUcjwoVIhXdd0okwNsq9zD6/9P5P5di1gGcRXBpKCWvIq43/WcA8idHuP5g0x2CxI
 e7Hc/Nyfg4nexZ1FF3Y+ojiLY2luk9hegwrPLtoRUuWqyc++n8JjWycagPdu1B4qxXVW
 6K4zagiDF/4BJ9ldNK1SXzKBB5df8FyWejHkCAsxEJhfuKT4y7iRzHF7EWTs8AyEoVW+
 OOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qb+k+IflEc/XKNcEL8wcO85r4kdnoHed1qavVtD26A4=;
 b=fc3iYal7syBAx/B6bwaWoyuQzWkk0DMXQ0kekIdLjWG+VXMbwLMrc5AuA24zPpejy6
 /9rxS6+X92GpBroTIKqy8tgwLuoADORUtdNvmjK6h+8KJLvanQi9M9sZhS6CAHpIUSHV
 U8TVbihb6n69Thvf/I5KppnONi6Vmpl2qiLpicq07efuvyKyEwg99eP9iWI/nE7NYaNC
 Er6P3lBB2meZEHA2jPFaBn9SKLPDqns+1yENHEdxa2hN+rgoJOnPq3meJVKTumDFuk2h
 mZ5IHn8s4s35Q21CLgzhJirjLNywN8u1L9ShjUv9yMJaTSR6OZ+C7o04ZxckF0WDPvO2
 SApQ==
X-Gm-Message-State: APjAAAXeebTowSL1c149MG+LvHHGlBni3z809gb6SvKI9O+Fr8MN4r7Q
 fKhYAmhcNcGZoHkOLp6UkcU=
X-Google-Smtp-Source: APXvYqzaK5prno8UGLcxc2Eoqgvtduo5CAG6Z3vyHnKkjPt+3dikjtKC/5TlXGUB1Mx5Ga6cXlzL5A==
X-Received: by 2002:a17:90a:c68c:: with SMTP id
 n12mr117813485pjt.29.1564473703136; 
 Tue, 30 Jul 2019 01:01:43 -0700 (PDT)
Received: from Asurada (c-98-248-47-108.hsd1.ca.comcast.net. [98.248.47.108])
 by smtp.gmail.com with ESMTPSA id
 u7sm56293369pfm.96.2019.07.30.01.01.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 01:01:42 -0700 (PDT)
Date: Tue, 30 Jul 2019 01:01:36 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190730080135.GB5892@Asurada>
References: <20190728192429.1514-1-daniel.baluta@nxp.com>
 <20190728192429.1514-8-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190728192429.1514-8-daniel.baluta@nxp.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel@pengutronix.de, timur@kernel.org, robh@kernel.org,
 shengjiu.wang@nxp.com, angus@akkea.ca, tiwai@suse.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, linux-imx@nxp.com,
 viorel.suman@nxp.com, festevam@gmail.com, mihai.serban@gmail.com,
 l.stach@pengutronix.de
Subject: Re: [alsa-devel] [PATCH v2 7/7] ASoC: dt-bindings: Introduce
 compatible strings for 7ULP and 8MQ
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

On Sun, Jul 28, 2019 at 10:24:29PM +0300, Daniel Baluta wrote:
> For i.MX7ULP and i.MX8MQ register map is changed. Add two new compatbile
> strings to differentiate this.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl-sai.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> index 2b38036a4883..b008e9cfedc1 100644
> --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> @@ -8,7 +8,8 @@ codec/DSP interfaces.
>  Required properties:
>  
>    - compatible		: Compatible list, contains "fsl,vf610-sai",
> -			  "fsl,imx6sx-sai" or "fsl,imx6ul-sai"
> +			  "fsl,imx6sx-sai", "fsl,imx6ul-sai",
> +			  "fsl,imx7ulp-sai", "fsl,imx8mq-sai".

A nit, could have that 'or' :)

>  
>    - reg			: Offset and length of the register set for the device.
>  
> -- 
> 2.17.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
