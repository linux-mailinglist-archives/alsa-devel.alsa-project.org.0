Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54853193F7F
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 14:11:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC420166F;
	Thu, 26 Mar 2020 14:09:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC420166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585228249;
	bh=D8VACJjYB1OQsInHQWoGxncQxZnlx24MYWhyRTeWrC4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n/326ZwZXukd1OCKHi1/7isyPD2TYPxFri0J7RZ9ZNlkojsifb8R5w0VrdLlO3ofU
	 CPwHkALrSyu9ikeUHZ16A+R2hklOORiePo5rZ6xaTnkPvNdsYlfA2O833vfgDUlpOy
	 g612OkKGtMrkYGOJpXuYwy/NCwnvmbBwdEDKfIWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A038BF80234;
	Thu, 26 Mar 2020 14:09:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51701F80227; Thu, 26 Mar 2020 14:09:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14787F8011B
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 14:09:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14787F8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="tFcfXjdR"
Received: by mail-wr1-x441.google.com with SMTP id 65so7752940wrl.1
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 06:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nesUQSo9Vy5oi7lhwsgMDQiIGSwXYZh1lt04KTBMkDM=;
 b=tFcfXjdRVhPsDI+TBYBqK0xDPMuNUggKrctOuYnFzJJtwQp2ffy8uQKhBM8w7ozTe9
 5t5EFj8nU1rqY/4HmIBU8oJ9snyrAxrTDpEt8ioxutKT008f0/RIp7CF2uJ0lQK/iBed
 7nc0OZFSOtUuzC0HJ1dGpPtz1/gTGK3CBRZ/PpshpDh3i8o/F8N4Q5uEjfHsAJXNEQsf
 rnTCUjbGngL22dpjlHz7ykw+sallnQutRtIsJnjgy1+U9ysEex7ldEDbp4LulE29B8iw
 G07DiyJDrSOCZB4I/8ZyAhNFIyYwkBhQfV8Ug0GS1n5R65M9xU2AR2EAGXbPRR0iWl+5
 XA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nesUQSo9Vy5oi7lhwsgMDQiIGSwXYZh1lt04KTBMkDM=;
 b=n40iJlA3geSEEnBsKjU5FdqOc6+L/R1QZSlalrcDKrCjsICOtyiuTKyeYZ0fWtNDvH
 WJ0sR1YBkxOUzuNdCf3XjS9e8hOyBxfl2cRMIlXoIkEiIQNjBgNR5oHeoFm2jWOsRGZ2
 J8JJ1vmJfnCXAU5SiRVMvNFTGc15ofFV1TwkGeJHChXuYSKOAGOmBsFwhkEc63h2LnsH
 /37Jus3JHoszy2o49/r/pWlYg/KfRJRrjYXLvGKNX1KzlwSKR8F9aege1JH3HUIbuaDT
 RG2tzZWjpGer9LmWHHGjzj4qM1aHru4b2nTsYJXzwrykokQUZJpPR5Yp3SDOC4HbvdHf
 du7A==
X-Gm-Message-State: ANhLgQ2P24cn0inuggI/Ao0e8MeboaWPuQ/6Rw5NB4Nz4DYG3CiDLLYt
 ew5LpF52KrM2vuqLCO7IayorKA==
X-Google-Smtp-Source: ADFU+vuiRdwL7ByDiPYmrvKBbOq29uYwlV7UlDd4ZcEJ8oqWH61S0lpU7HC3vUP+I31uRwLraXF5oQ==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr9987504wrs.39.1585228141513;
 Thu, 26 Mar 2020 06:09:01 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id b80sm3657335wme.24.2020.03.26.06.08.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Mar 2020 06:09:00 -0700 (PDT)
Subject: Re: [PATCH v1] slimbus: core: Set fwnode for a device when setting
 of_node
To: Saravana Kannan <saravanak@google.com>
References: <20200326061648.78914-1-saravanak@google.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <dfeacd9d-fed6-10fb-0b9d-9a1fceb075f5@linaro.org>
Date: Thu, 26 Mar 2020 13:08:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200326061648.78914-1-saravanak@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org, kernel-team@android.com,
 John Stultz <john.stultz@linaro.org>, linux-kernel@vger.kernel.org
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

Thanks for doing this!

On 26/03/2020 06:16, Saravana Kannan wrote:
> When setting the of_node for a newly created device, also set the
> fwnode. This allows fw_devlink to work for slimbus devices.
> 
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Change-Id: I5505213f8ecca908860a1ad6bbc275ec0f78e4a6

Once Change-Id is removed as Greg suggested!

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini

> ---
>   drivers/slimbus/core.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
> index 526e3215d8fe..44228a5b246d 100644
> --- a/drivers/slimbus/core.c
> +++ b/drivers/slimbus/core.c
> @@ -163,8 +163,10 @@ static int slim_add_device(struct slim_controller *ctrl,
>   	INIT_LIST_HEAD(&sbdev->stream_list);
>   	spin_lock_init(&sbdev->stream_list_lock);
>   
> -	if (node)
> +	if (node) {
>   		sbdev->dev.of_node = of_node_get(node);
> +		sbdev->dev.fwnode = of_fwnode_handle(node);
> +	}
>   
>   	dev_set_name(&sbdev->dev, "%x:%x:%x:%x",
>   				  sbdev->e_addr.manf_id,
> 
