Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D56A741F1
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 01:23:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D04361913;
	Thu, 25 Jul 2019 01:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D04361913
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564010597;
	bh=GKNSqGgWjcvKy9mVrMwFny21Dy3vAHu2M5Ck0dcqspM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LR9VdQw5MoB9SoU864IQ3vdNEIuTjMTrmbu8VGSW7cYk2yT/F46Fi5PF8PFmgk4kU
	 MlDRmbnkwrlaFGHQ54RxEU1HAfydaaY3H6tY/W/oYF1LSQFaSnLyL+6z5cDcxX3KMJ
	 MB44l6OqO+8ZG2Ag3k5tw8nOfYrsn0d+85Jkw+Tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4B5AF80368;
	Thu, 25 Jul 2019 01:21:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C697F803D1; Thu, 25 Jul 2019 01:21:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1AE6F800E3
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 01:21:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1AE6F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="B9aT+H8z"
Received: by mail-pl1-x641.google.com with SMTP id 4so15600195pld.10
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 16:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kcok0LgBsyc/okZx1Ol3rmWhL5MLbD+99FlIboC+ndY=;
 b=B9aT+H8zZb0fNl2vjxmEtT81BPo37zTt5g98LCfuxuy01ddORWh/CB7Q3hnuQ/AX+s
 vowRpzcr6WtyMgKF69p7p/q6KxV83JR231xFia1doXz5wITR+X1KThH8F/31CZ+kYWE7
 H/PfmqrHNBQrYD7eylgT/EsKd/qOanXXwpV+mGeWJdiMWG3eAhPZNNuqg+EP1BZPuqk/
 jRpvuLLnnUf+/O56aqMvbYEjIfEDAOqr/mR56+/imvtR2yMv8sIexbWJd2q9bwB+m9Oa
 HYZ3T5czjU5hRe7Nuw3H73T5+nl9tG6oU29R3sPZm/zfGJZw0xYUb6mVuS2R8nRAG3U7
 8RiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kcok0LgBsyc/okZx1Ol3rmWhL5MLbD+99FlIboC+ndY=;
 b=jRiTBjtEAzaE50Z4ueJ89lXPJWbQdk4TuM7Sck4Zlhp580QHe0hMZUV1Mu31n2cqbm
 66ykPSXK2xN8bfOJ5+jAOiowSpkNXdGB8QAWGKoD9Bh/uRVfpBPz8DMR+FRf7e1XZkg6
 O6GQpzT9EcbArI9djNDGzFGvHb2+9W/8BbAnM+cMXhn7VveEv8VKt+QS90Lqnq9624v6
 1lD51mdn2hXuR7smltQUITjnD8+Y4o+jqh4VkWt581OZj6lzJUn829J27CbH6ScIgrMW
 N6rFrhfD5fhSdcvnJeiek3McJNI9wN0EdkhtZ7Zv9nz7ZVxwU2HvzoIumnaDNr46A7gO
 EmTw==
X-Gm-Message-State: APjAAAX+K5w/4+S9sYp2s4jSy8ldB9hzWxZu5IxueIppZ15PhtgucwGj
 zhAiQO6wfJ70Q2X/ylqcqf8=
X-Google-Smtp-Source: APXvYqxwiudUxvu/coz792oUMUsi+3uSVa3zbEp1vcSY5LXXHGd7MfPYmIfYNlhGJTdsJVApfFFF4g==
X-Received: by 2002:a17:902:29c3:: with SMTP id
 h61mr44698653plb.37.1564010485328; 
 Wed, 24 Jul 2019 16:21:25 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id g2sm61762399pfb.95.2019.07.24.16.21.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 16:21:25 -0700 (PDT)
Date: Wed, 24 Jul 2019 16:22:09 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190724232209.GC6859@Asurada-Nvidia.nvidia.com>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-9-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722124833.28757-9-daniel.baluta@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, viorel.suman@nxp.com, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com,
 angus@akkea.ca, tiwai@suse.com, broonie@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 l.stach@pengutronix.de
Subject: Re: [alsa-devel] [PATCH 08/10] ASoC: dt-bindings: Document
	fcomb_mode property
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

On Mon, Jul 22, 2019 at 03:48:31PM +0300, Daniel Baluta wrote:
> This allows combining multiple-data-line FIFOs into a
> single-data-line FIFO.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl-sai.txt | 4 ++++

This should be sent to devicetree mail-list also.

>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> index 59f4d965a5fb..ca27afd840ba 100644
> --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> @@ -54,6 +54,10 @@ Optional properties:
>  			  represents first data line, bit 1 represents second
>  			  data line and so on. Data line is enabled if
>  			  corresponding bit is set to 1.
> +  - fsl,fcomb_mode	: list of two integers (first for RX, second for TX)
> +			  representing FIFO combine mode. Possible values for
> +			  combined mode are: 0 - disabled, 1 - Rx/Tx from shift
> +			  registers, 2 - Rx/Tx by software, 3 - both.

Looks like a software configuration to me, instead of a device
property. Is this configurable by user case, or hard-coded by
SoC/hardware design?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
