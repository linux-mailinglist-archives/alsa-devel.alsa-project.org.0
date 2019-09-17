Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F33BB44C9
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 02:07:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C096E166F;
	Tue, 17 Sep 2019 02:06:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C096E166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568678866;
	bh=ErRY7VVXjtYH009WUcU4BoDWJnZeCtRE4q53wZIhoPA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nHMsY2esebOXiPuVRgdb1a5ErKmWMZzl6KEhrRpJ7qwyi7TapFx9Rj0svnUeU7BvO
	 SWq3o35cM57GQ6DNnwVVJPHwwQ60NE70cvwn6WksgN5TFfRh4Rn9kuhORqQfjjXq79
	 yXjUtrElYFj0sdFsLwWiNuB2Ga5+oRELUy97Rwf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58295F80535;
	Tue, 17 Sep 2019 02:06:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 823C4F80506; Tue, 17 Sep 2019 02:06:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F3E8F801DA
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 02:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F3E8F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QDkTBI8O"
Received: by mail-pf1-x441.google.com with SMTP id q21so944200pfn.11
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 17:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=baniowhMYStzAeCarx/sh1i/50jPhkdSEMhte1BfHf4=;
 b=QDkTBI8OkV9+U41zSTFDRaG+W3egIuzxRz5itZnmQdqrzqvVJ8Xtln9xvMRJtZZjAK
 Tf56eIYGeByJ/f9FMO1zhyFYtwHRPXBRkTWMbmQGlqq3G3yU9pHj+uSYli5/GZ2nleUy
 i/3w9QBIgH5LhrPkNazF09K1o3/kld6DobWO9umsAeSvaC87oMZySdj5KuagsyM648lf
 OubKTWGcOBcWG6V+aDyDnxDiiJxNQFzItsHH/ObXq/tFCEeB/ETPIn4kxoWfIPMMCsCL
 pctGdCVVklBnwf7LWRT18d0e/QIKy88Af+qvGjHVxB4EFtB+asGhCDW9cYjes0Ty4p9q
 SaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=baniowhMYStzAeCarx/sh1i/50jPhkdSEMhte1BfHf4=;
 b=PDH4EGU+3QD1hllSqmFIphYv+0bGlsbeQkH6ZSwU6j/x18DTLTz6QWMcYtVh3HIjm7
 zkKfjfEz97qoAfTGGShbKOkPmmHKF9QK5PY1p9kNW9nnvQi2Jzzx6wnqgKTBtkDoozRn
 lTcea7Ig6AgjoG/4JQKuOw+DlKWT1SQ56dJkHzCoYPHk7It+Z/ixfKkll2IoeRnFqnFT
 rcYxrTh57yX6wNR3HUTqUz6HTXXa3PLWVbE6me149goIn5h9s9zqLovbJLhcP6DUix4e
 ZCd7PrarvEzAAkutUUGHC58yira+yt8PSzbBWKCN1tfKZxJ/S6ZfSN3Rt+UTdxEr6lg2
 dXTw==
X-Gm-Message-State: APjAAAX7+fdVHUGD27Zai40pTn5hMir/b5wM94Nw3xJn/IorA1jTMuyW
 RUKNjnYHYXHMt8WHeWTF4KU=
X-Google-Smtp-Source: APXvYqz0PeZSDBSC5l5eljSy7AY5XnFCmp2VRvGuofWHCSx/srcu18Ht5AdkvIVeGwgA6Y5TqKZvzQ==
X-Received: by 2002:aa7:9835:: with SMTP id q21mr570191pfl.122.1568678755003; 
 Mon, 16 Sep 2019 17:05:55 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id h18sm266844pfn.53.2019.09.16.17.05.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Sep 2019 17:05:54 -0700 (PDT)
Date: Mon, 16 Sep 2019 17:05:36 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20190917000535.GE12789@Asurada-Nvidia.nvidia.com>
References: <65e1f035aea2951aacda54aa3a751bc244f72f6a.1568367274.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65e1f035aea2951aacda54aa3a751bc244f72f6a.1568367274.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH V2 1/2] ASoC: fsl_mqs: add DT binding
	documentation
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

On Fri, Sep 13, 2019 at 05:42:13PM +0800, Shengjiu Wang wrote:
> Add the DT binding documentation for NXP MQS driver
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> ---
> Changes in v2
> -refine the comments for properties
> 
>  .../devicetree/bindings/sound/fsl,mqs.txt     | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,mqs.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,mqs.txt b/Documentation/devicetree/bindings/sound/fsl,mqs.txt
> new file mode 100644
> index 000000000000..40353fc30255
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,mqs.txt
> @@ -0,0 +1,36 @@
> +fsl,mqs audio CODEC
> +
> +Required properties:
> +  - compatible : Must contain one of "fsl,imx6sx-mqs", "fsl,codec-mqs"
> +		"fsl,imx8qm-mqs", "fsl,imx8qxp-mqs".
> +  - clocks : A list of phandles + clock-specifiers, one for each entry in
> +	     clock-names
> +  - clock-names : "mclk" - must required.
> +		  "core" - required if compatible is "fsl,imx8qm-mqs", it
> +		           is for register access.
> +  - gpr : A phandle of General Purpose Registers in IOMUX Controller.
> +	  Required if compatible is "fsl,imx6sx-mqs".
> +
> +Required if compatible is "fsl,imx8qm-mqs":
> +  - power-domains: A phandle of PM domain provider node.
> +  - reg: Offset and length of the register set for the device.
> +
> +Example:
> +
> +mqs: mqs {
> +	compatible = "fsl,imx6sx-mqs";
> +	gpr = <&gpr>;
> +	clocks = <&clks IMX6SX_CLK_SAI1>;
> +	clock-names = "mclk";
> +	status = "disabled";
> +};
> +
> +mqs: mqs@59850000 {
> +	compatible = "fsl,imx8qm-mqs";
> +	reg = <0x59850000 0x10000>;
> +	clocks = <&clk IMX8QM_AUD_MQS_IPG>,
> +		 <&clk IMX8QM_AUD_MQS_HMCLK>;
> +	clock-names = "core", "mclk";
> +	power-domains = <&pd_mqs0>;
> +	status = "disabled";
> +};
> -- 
> 2.21.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
