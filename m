Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC64511829
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 15:14:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 614B617AD;
	Wed, 27 Apr 2022 15:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 614B617AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651065291;
	bh=kKJ/rQr8k+29EN+DB9nAVNHNu7UHm1IR6V5ADbxHDdg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cl1t9G8+2fI4fsbzF+LvFPwUEjF44qMrYdipe1/54C//2CyYg5Cn4RzJ8CaitBLaM
	 NbPGY1ntbHW3EOYwZbgvSDF5kziQcJb+AiySfpaXbgCREKrkjLrX2RDhPZrvlsFOIF
	 Kgx8tczvYvkVo3dIR5dTgAPyCIV9r5Z0WMYlyH/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEF6AF804D8;
	Wed, 27 Apr 2022 15:13:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BB79F802BE; Wed, 27 Apr 2022 15:13:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07DA1F80155
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 15:13:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07DA1F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="G1dbD3+q"
Received: by mail-pl1-x633.google.com with SMTP id q8so1520791plx.3
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 06:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DAl8qDJTRORN7hEDT9exlnjnNkdq2bJvYTAnXba/25E=;
 b=G1dbD3+qXdQ2BbVZ4c1Db3K51vAr4JwIOC8RzLYARkbNa2cdXnoK8QYiNhwptfMYvX
 ber40zrdrgy908ozvsQ6V/Y2WRHsbB1fM70Xr9Bru1z8KASIUTc+FTAA3yuBWuNWvxh8
 h3gA3OGw1NMZ+QwRkp3s4hH/sKLK+1roItha4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DAl8qDJTRORN7hEDT9exlnjnNkdq2bJvYTAnXba/25E=;
 b=8P50nAW+5tAUT4YkKeJQJFzeAJoMjJ8UqxefxuW2Fegdcyz3Q1iK0RktbAh9/EfzEd
 YKxbQEx2OUd+usvun0OgaXZh7F7BDKOT+YSlimeTynXN/M1o+jw9VkBPJ05gra4WbFYN
 P/UxpofFGEbLnO1ezXQ05h4HnKOQqgyGe5N2b1cVyVVzXjJiOdDL5EfGX6bIYrcxiVFZ
 7jGIXmdwUE1dKXPSk0ufRUOzTGwNEn+m/PaItPgOHkpX7nUBmCeRLdBWvtYi1POaIYIR
 xlO8fnZvOZteK70w9GwKNGFXnC0EJufG3wVb9P39X5dH5grb2jyKo15/7VfDZ0uw6Oka
 nLzw==
X-Gm-Message-State: AOAM530b8KsXLkoqSYIHMJIEKiJyd8z7RfcBdUi01is9qtqPYqhxkajJ
 sfJxysOBbr1kiroXGsbjEgu1MQ==
X-Google-Smtp-Source: ABdhPJxh+kwqvN3mbBWx09Oa7ogQ+SWQRHbop1j80rL5p7opPzy8qNaw9M5M7Be2IVGVqzbj7s7nUw==
X-Received: by 2002:a17:903:2495:b0:15a:a0f7:d779 with SMTP id
 p21-20020a170903249500b0015aa0f7d779mr28009148plw.163.1651065222771; 
 Wed, 27 Apr 2022 06:13:42 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8e2d:263:26e7:c039])
 by smtp.gmail.com with ESMTPSA id
 130-20020a621488000000b00505e6092973sm18120428pfu.68.2022.04.27.06.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 06:13:42 -0700 (PDT)
Date: Wed, 27 Apr 2022 22:13:38 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v3] ASoC: SOF: ipc3-topology: Correct get_control_data
 for non bytes payload
Message-ID: <YmlBgsQtrayqK0P6@google.com>
References: <20220427124025.14615-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427124025.14615-1-peter.ujfalusi@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, cujomalainey@google.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com,
 senozhatsky@chromium.org, broonie@kernel.org
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

On (22/04/27 15:40), Peter Ujfalusi wrote:
[..]
>  struct sof_widget_data {
>  	int ctrl_type;
>  	int ipc_cmd;
> -	struct sof_abi_hdr *pdata;
> +	void *pdata;
> +	size_t pdata_size;
>  	struct snd_sof_control *control;
>  };
>  
> @@ -784,16 +785,26 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
>  		}
>  
>  		cdata = wdata[i].control->ipc_control_data;
> -		wdata[i].pdata = cdata->data;
> -		if (!wdata[i].pdata)
> -			return -EINVAL;
>  
>  		/* make sure data is valid - data can be updated at runtime */

A silly nit: does this comment belong to SOF_ABI_MAGIC check below?

> -		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES &&
> -		    wdata[i].pdata->magic != SOF_ABI_MAGIC)
> -			return -EINVAL;
> +		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES) {
> +			if (cdata->data->magic != SOF_ABI_MAGIC)
> +				return -EINVAL;

