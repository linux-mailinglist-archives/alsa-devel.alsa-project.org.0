Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D347987E
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 22:08:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBE4C17CD;
	Mon, 29 Jul 2019 22:07:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBE4C17CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564430897;
	bh=cQxbq69Mwgq0+XVFr82lBSp42vpEurdt86m7tPVqzjE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T3fy7aLUk69USeqf5liCPyOj2vD81yMgEBZRjLjKU12W46qtWpEIXfOQYDlDPM4Lt
	 b2PKPgngJPdMY/DrvPE8BuPk8lPiz9zT3C6JQmJYY2IxpleVaPxlxPzYEc4i9n7Tlc
	 b7DKATanXAH/MQdeYgTrXF5JK9wN9OrEDp4f03bk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3973F8049A;
	Mon, 29 Jul 2019 21:41:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8FF9F8048E; Mon, 29 Jul 2019 21:41:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0295FF803D5
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 21:41:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0295FF803D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TflF0o6M"
Received: by mail-pf1-x444.google.com with SMTP id r7so28544241pfl.3
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 12:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/Dz0GgmO6qmE4MAFGR84AXHaHxqY/lTl7uea6qX+5fg=;
 b=TflF0o6MX/qgWOrImqmQhbskmpRfUcujvsFhX2SQtANavL0oW5ZxLsZ8OihRYbMJLl
 BNBPgCCLOpCPk5nNeYoGxtruxxdC4QCxCr42U0csHNkcMNLiTre3ZmXyuAeH7gbFPjc2
 Dr8Mi5U2xT5ZW7ToeWuG6rbiKKuTYeGN+GTUhIjK0TO4c35oWVl/dtIIuZiWxxRAmOpw
 LjyRvgswDWQl7v4Eyr8nsOl6Lpf+NGOmgHLLAz9iv+q4ICLFu4nOsj6rIWiFi5GjsEjE
 GRE6MtkCpocWDtzFvils9en7a2003O3ljjYpsgsrUa7DWrqRmkMch0ONFm8IbTgt9I7Z
 OaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/Dz0GgmO6qmE4MAFGR84AXHaHxqY/lTl7uea6qX+5fg=;
 b=pk+R0w+iZCNsTs8wYb9z0KND0UVcnY1tdo/KlEQHW91OfyNepYh3/5W7mpD+V5rE8W
 1em2VoQeorM811Ek64i+5wYzxrWYgufY2YYZgfnnk47zRQsm8BciaRqS2ZXyIK9TYNkF
 KBTn2pjZx5NGtgnhDZ7ZDyKMAx0u28QsqMyjm14010/kSm599rY+rckIU9FiiK8nQe/T
 lr2hAvLw0aOZ4xmSiZYTb5osyFWodBFL68AT/UkpnP90Qeh7BMDXjU2V7c+NsLxOz2vq
 WFk/UbrnSGwlTTtvIRbjl4bWhSVSYwFhhR+qjJyz2K2QzwsWao8vOZyzO8JcoNuywj3w
 mBJw==
X-Gm-Message-State: APjAAAX4R55KVPv80h2Dr2g2NzTMoLZMaItndgoRVsfblbmIfXHH0i3U
 ukEf0Y82vLDTZDrhHtKMCd8=
X-Google-Smtp-Source: APXvYqwYFWImrD12nOO6O4tljP+JRCjkjw66pzAW6I8GeoaAGPbNiPFbQl+QlKHEMKqzZDwQjGv7JQ==
X-Received: by 2002:a62:26c1:: with SMTP id
 m184mr36658332pfm.200.1564429289372; 
 Mon, 29 Jul 2019 12:41:29 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id o24sm18978199pgn.93.2019.07.29.12.41.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Jul 2019 12:41:28 -0700 (PDT)
Date: Mon, 29 Jul 2019 12:42:15 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190729194214.GA20594@Asurada-Nvidia.nvidia.com>
References: <20190728192429.1514-1-daniel.baluta@nxp.com>
 <20190728192429.1514-2-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190728192429.1514-2-daniel.baluta@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel@pengutronix.de, timur@kernel.org, robh@kernel.org,
 shengjiu.wang@nxp.com, angus@akkea.ca, tiwai@suse.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, linux-imx@nxp.com,
 viorel.suman@nxp.com, festevam@gmail.com, mihai.serban@gmail.com,
 l.stach@pengutronix.de
Subject: Re: [alsa-devel] [PATCH v2 1/7] ASoC: fsl_sai: Add registers
 definition for multiple datalines
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

On Sun, Jul 28, 2019 at 10:24:23PM +0300, Daniel Baluta wrote:
> SAI IP supports up to 8 data lines. The configuration of
> supported number of data lines is decided at SoC integration
> time.
> 
> This patch adds definitions for all related data TX/RX registers:
> 	* TDR0..7, Transmit data register
> 	* TFR0..7, Transmit FIFO register
> 	* RDR0..7, Receive data register
> 	* RFR0..7, Receive FIFO register
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  sound/soc/fsl/fsl_sai.c | 76 +++++++++++++++++++++++++++++++++++------
>  sound/soc/fsl/fsl_sai.h | 36 ++++++++++++++++---
>  2 files changed, 98 insertions(+), 14 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 6d3c6c8d50ce..17b0aff4ee8b 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c

> @@ -704,7 +711,14 @@ static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
>  	case FSL_SAI_TCR3:
>  	case FSL_SAI_TCR4:
>  	case FSL_SAI_TCR5:
> -	case FSL_SAI_TFR:
> +	case FSL_SAI_TFR0:
> +	case FSL_SAI_TFR1:
> +	case FSL_SAI_TFR2:
> +	case FSL_SAI_TFR3:
> +	case FSL_SAI_TFR4:
> +	case FSL_SAI_TFR5:
> +	case FSL_SAI_TFR6:
> +	case FSL_SAI_TFR7:
>  	case FSL_SAI_TMR:
>  	case FSL_SAI_RCSR:
>  	case FSL_SAI_RCR1:

A tricky thing here is that those SAI instances on older SoC don't
support multi data lines physically, while seemly having registers
pre-defined. So your change doesn't sound doing anything wrong to
them at all, I am still wondering if it is necessary to apply them
to newer compatible only though, as for older compatibles of SAI,
these registers would be useless and confusing if being exposed.

What do you think?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
