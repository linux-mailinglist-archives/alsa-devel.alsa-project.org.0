Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 172BB5114E5
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 12:38:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 858BD1765;
	Wed, 27 Apr 2022 12:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 858BD1765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651055888;
	bh=lZLiGHVWuFZSASNVf7fH/qfz+Cn+fM7FoWXZ1ncVXRs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cFcdGeC74SR5K8EukLug7V9rsjCDe4IMuiyoFZ0KkS4vta9pvXu9TY+iFD8WvLV4K
	 eeUh0YGS1okyBn2pDqO4RIn44qEZyUKoYwgHaKQ4tMFLK7iCRxK/mT/0XJCdkp6ISu
	 XJF/PCK0lfjj9P7L4BvYwhJCie/DWyhl6V23Guis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02DC0F80253;
	Wed, 27 Apr 2022 12:37:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF014F8016E; Wed, 27 Apr 2022 12:37:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21256F80152
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 12:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21256F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="MHXUq4mU"
Received: by mail-pj1-x1034.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so2707168pjb.3
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 03:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mWK3Ah0FDk22pf9sujkcYspgwVYCPqr0+KwmeDIU3uQ=;
 b=MHXUq4mUw74vqzVFqwrQdLU4aBqFCaf5uW2+N1mMXPHa+8um6EJ9n9ZrkgxthmEKJv
 SqOa1SD4dxp8OBo0A4cp+TOoYmVCZHwGsWfpufoOB+MhC7TMfInW61siUW3Olx/X4jRr
 y6o4daF6MvDT9FknB+NRUfn4zcUsS4bmUxQVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mWK3Ah0FDk22pf9sujkcYspgwVYCPqr0+KwmeDIU3uQ=;
 b=msqhyrdr2CdOIAbkwIZSuOx9eIhQ5Phi/YhnAkeHf3WHhUjFeW1VcmsHOxuf1T8TTi
 6gjMzZm7rMJbWs8NU8WP+RCjuyCxFv3lKbqQgWWLX0157f95nRdiPt3i7uQL44mwlqRT
 tGwfv84jwLWzRmxRl6b7jT4fD0fRrgWznHjTffJ9GFvmwVMnPSz5RyRJeA+aHGBCyD7K
 Rt/W+CqilB6AnaG9p2MGIJqCbyOrrvc8FSh3q7UhercvwWce69Mf8RhKMO6ub6alq5KB
 aIiR3a0I75FTI4k4dndD5JetaBLI93xDaPE2c5pJ2Rm1H4JrtcwMOgjhdWV1hpjKRi+9
 Kf+w==
X-Gm-Message-State: AOAM533EjGtdRUkENNEY9eBoRkU7rbDrUFBiGfsvSNBpO0dKTzF8tqK2
 xmyi3VWSQ9gsSRdLcV09B/SaUA==
X-Google-Smtp-Source: ABdhPJyIfZE7AnuSSKuBTrhRzVlSuqyrTXEssSf4e9t4V/jp+JJY8YclrTyAC5EbCFgEr/RQAQ8h0Q==
X-Received: by 2002:a17:902:b286:b0:15b:335b:53e6 with SMTP id
 u6-20020a170902b28600b0015b335b53e6mr27552600plr.169.1651055822228; 
 Wed, 27 Apr 2022 03:37:02 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8e2d:263:26e7:c039])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a17090a3d0800b001cd4989ff4asm2403647pjc.17.2022.04.27.03.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 03:37:01 -0700 (PDT)
Date: Wed, 27 Apr 2022 19:36:57 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc3-topology: Correct get_control_data for
 non bytes payload
Message-ID: <YmkcyRlTeTRYeUH+@google.com>
References: <20220427085011.21805-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427085011.21805-1-peter.ujfalusi@linux.intel.com>
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

On (22/04/27 11:50), Peter Ujfalusi wrote:
> @@ -784,16 +785,23 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
>  		}
>  
>  		cdata = wdata[i].control->ipc_control_data;
> -		wdata[i].pdata = cdata->data;
> -		if (!wdata[i].pdata)
> -			return -EINVAL;
>  
>  		/* make sure data is valid - data can be updated at runtime */
> -		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES &&
> -		    wdata[i].pdata->magic != SOF_ABI_MAGIC)
> -			return -EINVAL;
> +		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES) {
> +			if (!cdata->data)
> +				return -EINVAL;
> +
> +			if (cdata->data->magic != SOF_ABI_MAGIC)
> +				return -EINVAL;
> +
> +			wdata[i].pdata = cdata->data->data;
> +			wdata[i].pdata_size = cdata->data->size;
> +		} else {
> +			wdata[i].pdata = cdata->chanv; /* points to the control data union */
> +			wdata[i].pdata_size = wdata[i].control->size;
				^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
A question, so here wdata[i].control->size is

	scontrol->size = struct_size(scontrol->control_data, chanv,
					le32_to_cpu(mc->num_channels));

Right?

If so, then is this really what we memcpy()? We memcpy() control->data->chanv
and its size is `sizeof(chanv) * le32_to_cpu(mc->num_channels)`, isn't it?

[..]
>  	if (ipc_data_size) {
>  		for (i = 0; i < widget->num_kcontrols; i++) {
> +			if (!wdata[i].pdata_size)
> +				continue;
> +
> +			memcpy(&process->data[offset], wdata[i].pdata,
> +			       wdata[i].pdata_size);
> +			offset += wdata[i].pdata_size;
>  		}
>  	}

So should sof_get_control_data() have instead of this

	wdata[i].pdata_size = wdata[i].control->size;

something like this

	wdata[i].pdata_size = wdata[i].control->size - sizeof(struct sof_ipc_ctrl_data);

So that we will copy payload data, which is a bunch of chanv structs 8
bytes each.
