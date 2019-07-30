Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 983B77A2CB
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 10:07:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17E1117EC;
	Tue, 30 Jul 2019 10:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17E1117EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564474070;
	bh=QKEQr831xaDet/BmrQio48GwCmV57uxB1lct5G25jZ4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IH++QuxMf0leIGcHv11eXAP8atPeWXO1shHFNzPTjqhQlcsdSx2DnNkXnwugqhUkd
	 ymv8CC7uwnW7/19djrIpwKgL507nKRJezUUy/ygQPTW+bbjGnU0uIiNBbpVLUp+F6W
	 20i3APlhlcYTLo8Kr5nviYLx2FaG8JB2NzpDDV6w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F3FFF804CA;
	Tue, 30 Jul 2019 10:06:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0351F804CA; Tue, 30 Jul 2019 10:06:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B19EF800AB
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 10:06:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B19EF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Y78bswDR"
Received: by mail-pg1-x543.google.com with SMTP id l21so29635219pgm.3
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 01:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nK3/4x5NFOFF3oypb62NSdxsSYTDvzZWRrwefUu2HNE=;
 b=Y78bswDRD2RbS5DclyAkgDNCNYGF5tNENHw0Q0RvMmx6BgvibdVTxxPbv+Pa1+HCR6
 MbgDZA1yo2d/1YkGujCC2mulqo8MsG/dppVmsf2t3ZRaTA4li3AFbGRQAjwVFkE0kCzy
 LhjuvC4AT3BwiJLehh3d1bV1q9C1OZUngYZmYUSDbDQFNRxUWwrw+9T+tMdrg0Tbahv4
 2mpqH1IFpNa1B9agVc/ZnoCDSo28VebGBbk6hcNBk97amjnMObA0BZUliBqk8U4s0r7u
 lzqJlipEIk/brQbgMBxnGJ75UGgvzGJFbb/QpaAATc/lgcMO9R2D7Wf2PkZrskEjRuuC
 IXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nK3/4x5NFOFF3oypb62NSdxsSYTDvzZWRrwefUu2HNE=;
 b=F7vDvwzITUoW71sJhfC4cgVe8gowd4m+xDJrZuDXFZ/SLwpgU30PG1tbfUr4IfE53W
 XwP8YeB2z3lHjTV28KMoWo63/7NA1lKLwq9CqUPmQh9JTnCuqgLpjBSRSGKABTiY+Hn7
 dp5kXo7bqmPZvo88Vpo97viMqhEdFFiO5B7O6mL4JZ6eaziEKcC/fvaUR9MZY3Oo5xwr
 gX1A9DlPGyD48zhSoH9CFS9pmrtaYGkudu8gngw6YrK2nZyELqRuY/hAjw3D35GNt6wO
 c2l7yk0gx5/0CjkpblFYHBS3p0pUh2wkQ2FeWnJlcUgxW0n4aySwae+SLIb+PRF9YRSq
 CKKA==
X-Gm-Message-State: APjAAAVXzcRQwXVmwZ+a2SSmKxt3twT2TbZDHnxe/giKkNQe7Sh/h/dZ
 1A1BDrEYiJrWc5xYFgm2iAg=
X-Google-Smtp-Source: APXvYqwcWuXpzYPhzMAYQKDGxMxFYEY4mRBESlsr603Ceh+GLoj/fQuDNyNUfqD6447Ze+SKRIdySg==
X-Received: by 2002:a17:90a:3225:: with SMTP id
 k34mr114195494pjb.31.1564473959118; 
 Tue, 30 Jul 2019 01:05:59 -0700 (PDT)
Received: from Asurada (c-98-248-47-108.hsd1.ca.comcast.net. [98.248.47.108])
 by smtp.gmail.com with ESMTPSA id
 p7sm69133287pfp.131.2019.07.30.01.05.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 01:05:59 -0700 (PDT)
Date: Tue, 30 Jul 2019 01:05:52 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190730080552.GC5892@Asurada>
References: <20190728192429.1514-1-daniel.baluta@nxp.com>
 <20190728192429.1514-7-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190728192429.1514-7-daniel.baluta@nxp.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel@pengutronix.de, timur@kernel.org, robh@kernel.org,
 shengjiu.wang@nxp.com, angus@akkea.ca, tiwai@suse.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, linux-imx@nxp.com,
 viorel.suman@nxp.com, festevam@gmail.com, mihai.serban@gmail.com,
 l.stach@pengutronix.de
Subject: Re: [alsa-devel] [PATCH v2 6/7] ASoC: fsl_sai: Add support for
	imx7ulp/imx8mq
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

On Sun, Jul 28, 2019 at 10:24:28PM +0300, Daniel Baluta wrote:
> SAI module on imx7ulp/imx8m features 2 new registers (VERID and PARAM)
> at the beginning of register address space.
> 
> On imx7ulp FIFOs can held up to 16 x 32 bit samples.
> On imx8mq FIFOs can held up to 128 x 32 bit samples.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> ---
>  sound/soc/fsl/fsl_sai.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 54e5e9abae01..0fb6750fefd5 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1030,10 +1030,24 @@ static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
>  	.reg_offset = 0,
>  };
>  
> +static const struct fsl_sai_soc_data fsl_sai_imx7ulp_data = {
> +	.use_imx_pcm = true,
> +	.fifo_depth = 16,
> +	.reg_offset = 8,
> +};
> +
> +static const struct fsl_sai_soc_data fsl_sai_imx8mq_data = {
> +	.use_imx_pcm = true,
> +	.fifo_depth = 128,
> +	.reg_offset = 8,
> +};
> +
>  static const struct of_device_id fsl_sai_ids[] = {
>  	{ .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
>  	{ .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
>  	{ .compatible = "fsl,imx6ul-sai", .data = &fsl_sai_imx6sx_data },
> +	{ .compatible = "fsl,imx7ulp-sai", .data = &fsl_sai_imx7ulp_data },
> +	{ .compatible = "fsl,imx8mq-sai", .data = &fsl_sai_imx8mq_data },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, fsl_sai_ids);
> -- 
> 2.17.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
