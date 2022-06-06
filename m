Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4228253E402
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 12:11:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD09617F6;
	Mon,  6 Jun 2022 12:10:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD09617F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654510293;
	bh=T64VaQ4NySVI0Ut3FbNkz7xULicSf2v5M/56BepBaos=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vO9FUQCPycstozcoW7jJp5S+AXXSSbuHJwnIC9pqXCoQeIWJY0dEgRuj5+KupZj3m
	 u5aDzCSJ3S0rTwcSgpuIur+Thdqbjc+78EveJWui5EoG/usWjc+Aa0XbKRPov4UQUo
	 t85PUfQmYoR9DjizSZ9AKnj7+sL4O5h+IP5kB1IU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D114F80089;
	Mon,  6 Jun 2022 12:10:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5409F80116; Mon,  6 Jun 2022 12:10:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4862DF80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 12:10:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4862DF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="k+0ldaxs"
Received: by mail-wr1-x434.google.com with SMTP id t13so19173119wrg.9
 for <alsa-devel@alsa-project.org>; Mon, 06 Jun 2022 03:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=EEtIczXOb290W+pz7uEsvHrOu4FcL6xx1WeEBPLY3Hw=;
 b=k+0ldaxsPStEdYkYtq1feLWsz9sDXg7qx7pwcgrtt+joqLVBPgMCa3QRHr2WCmXLw3
 93vbDgVNXS1/A4pljwJI95bsvtzl8vE6uZIPIKhEvxjmgTaSEKIkstoM9KWI9BoZIKBZ
 khKu+rjUT+j3UMdbbWNcyaXdVwEJ6EkngIL0UR3C6uaKMXBIUPwXwbLMcdxWQ1RxSL4K
 hILIo+a0vs8qfcjygC41tTQQLy0Yeyo5z+pMGVggHM0KgW9SlGZcHjbDKAd9Ik0tsk1k
 Ohb1Jy8s81aMtJBNBZLiew/9C5Rkl5wrkJlHKn1xf3pRSo1YFt92OqrGAqc6hlmdmKgp
 +RUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EEtIczXOb290W+pz7uEsvHrOu4FcL6xx1WeEBPLY3Hw=;
 b=yK6J5K3P0SPLomcj8uJESW5+MpaC7q8joEGUEtzamx0ehLFOHbxapOlDL7lmOsilIl
 BIx7prefMSvk0/lTV0JJ0nvj19sNiHPZ6So5q+8yJyu0gQODqgnY1Lnon5eJlbdnP5cD
 LtfcbeYr5RFQDRmabyKXXcKj5OHBeNb/BwNC8hB62mmGhbaIUmEO8qWxdSJCTZwZIuyg
 eq7w3+q1iXAJK6wn/pxL/0ngA8AYuEtatS7ceHZGsQpxEmkCttKjs6gQf/lbGjsljKCY
 bgBzxltcYUXdGjgtuPNVmWgtNsNqXVYJZFExwWrPZRKi/Zz8CywXWUFaM8WnMBXvkpaf
 n9fg==
X-Gm-Message-State: AOAM531eQlPDM940/wMidUNt5BOT2xtmwU0/nZ0cfc2NYKXqp6WOjCo9
 DHnFMX31igv1LRO76eITb3XYsw==
X-Google-Smtp-Source: ABdhPJxM5KE+vxnYfWDTOxBGJUXvolZxgAVtIxd+SN85NugA4dvW6DbnIy3/F1PGAMbEfYS+qGVfhQ==
X-Received: by 2002:a05:6000:1091:b0:213:b515:f46f with SMTP id
 y17-20020a056000109100b00213b515f46fmr17644027wrw.632.1654510224309; 
 Mon, 06 Jun 2022 03:10:24 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 b12-20020a5d4b8c000000b0020feb9c44c2sm14955968wrt.20.2022.06.06.03.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 03:10:23 -0700 (PDT)
Message-ID: <a9ce408f-eaea-40db-34be-26e51cbb3515@linaro.org>
Date: Mon, 6 Jun 2022 11:10:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drivers: slimbus: Directly use ida_alloc()/free()
Content-Language: en-US
To: keliu <liuke94@huawei.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20220527073053.2402630-1-liuke94@huawei.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220527073053.2402630-1-liuke94@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 27/05/2022 08:30, keliu wrote:
> Use ida_alloc()/ida_free() instead of deprecated
> ida_simple_get()/ida_simple_remove() .
> 
> Signed-off-by: keliu <liuke94@huawei.com>

Applied thanks,

--srini
> ---
>   drivers/slimbus/core.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
> index 78480e332ab8..219483b79c09 100644
> --- a/drivers/slimbus/core.c
> +++ b/drivers/slimbus/core.c
> @@ -250,7 +250,7 @@ int slim_register_controller(struct slim_controller *ctrl)
>   {
>   	int id;
>   
> -	id = ida_simple_get(&ctrl_ida, 0, 0, GFP_KERNEL);
> +	id = ida_alloc(&ctrl_ida, GFP_KERNEL);
>   	if (id < 0)
>   		return id;
>   
> @@ -299,7 +299,7 @@ int slim_unregister_controller(struct slim_controller *ctrl)
>   {
>   	/* Remove all clients */
>   	device_for_each_child(ctrl->dev, NULL, slim_ctrl_remove_device);
> -	ida_simple_remove(&ctrl_ida, ctrl->id);
> +	ida_free(&ctrl_ida, ctrl->id);
>   
>   	return 0;
>   }
> @@ -323,7 +323,7 @@ void slim_report_absent(struct slim_device *sbdev)
>   	sbdev->is_laddr_valid = false;
>   	mutex_unlock(&ctrl->lock);
>   	if (!ctrl->get_laddr)
> -		ida_simple_remove(&ctrl->laddr_ida, sbdev->laddr);
> +		ida_free(&ctrl->laddr_ida, sbdev->laddr);
>   	slim_device_update_status(sbdev, SLIM_DEVICE_STATUS_DOWN);
>   }
>   EXPORT_SYMBOL_GPL(slim_report_absent);
