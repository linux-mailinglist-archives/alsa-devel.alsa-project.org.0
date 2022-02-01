Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EB54A5E42
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 15:28:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 089A717AB;
	Tue,  1 Feb 2022 15:27:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 089A717AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643725702;
	bh=wSMVO6CTLFE0c6Isvgq1Wlte6ZR52fBLt2pU4TyBAX4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uyoiVO9ZvWVn8BROzRBpiK8Apjm36tsL9McqzRjyYCe+uWUnQwMNbHwRoj6171QTL
	 LqHAG9ExwAXUPQVeeaTqIHoVYXf20rUvD0jp3EXZcbxI+FSvwqjf4rufP2CHJK2iFV
	 81QR8J5bJQCjpupUgB9KJ5JUjBGQqwWfTE35HRN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46D97F8047C;
	Tue,  1 Feb 2022 15:27:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B73E3F80311; Tue,  1 Feb 2022 15:26:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B685F80166
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 15:26:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B685F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="O7jtwIJK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643725599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SHeQ7ycHn7asMx6C36hsAZkE9E18SqcVluALQH8g4t4=;
 b=O7jtwIJKvH5jaYZxFhSyQXjUJ9RD9NMEmSHoT2OJkBBpfSGbHK1UOALFNoqrjvFfD9mFjM
 ShBeUzMTov4eIOxbLcvpeSFCPNI3dG2gk55hYBcqxeMvS/DRhlF6DxINuJrrXLxXthnGYt
 RFWNm2i9biuvZJ+kNh5yTLJP1rUziDc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-Uo45NUyhOk-eDemilgUeGA-1; Tue, 01 Feb 2022 09:26:38 -0500
X-MC-Unique: Uo45NUyhOk-eDemilgUeGA-1
Received: by mail-ed1-f71.google.com with SMTP id
 q10-20020a5085ca000000b0040e3ecf0ec2so919443edh.14
 for <alsa-devel@alsa-project.org>; Tue, 01 Feb 2022 06:26:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SHeQ7ycHn7asMx6C36hsAZkE9E18SqcVluALQH8g4t4=;
 b=pN3x0vh2HoEi9+00zpDde8pwOadJ7SoPwGw+Wgg/2j29pXZJYQIs4gGT7RPpBoqzZZ
 Ji9/7BdKbXELNPEvXwy+yfhVhxAMy0sNA9pMF50QNSoBPp393/8x8eFKpjV28yyOB3D/
 W2U9qabLry8DssP7+zKx/0cL74GqRt2FEpRwWggM86kLSZaBaqLTMtYzPPSInvs0ke6Y
 7HInbTEB7vwwbo3AQtevbpy4yp8+U3HcrzB/tsl9AKU1tf6cmdd7/T4b5QJVkoFhs9Vi
 ecXGpiB+XRow/GaOxTUFxHTiSDPELF+9+5oaMfTZmODc4t6BrKnkIk4tX3YKUG6Anzl1
 Uj6Q==
X-Gm-Message-State: AOAM531FSLIya1dMJOu3UYr1sUsQgiCFBV7Q7E2+LCEh7d3Cb7YIG6mH
 ozY5PPa93H8qEfST1XpSywie80aTECb5sIYNuaQO/qdZBP2yL2SkZa4fk2ujBATgcjwOTLxNC93
 b5dbsNlipAOzMc1LrQMjs9ME=
X-Received: by 2002:a05:6402:1d56:: with SMTP id
 dz22mr26419244edb.82.1643725596793; 
 Tue, 01 Feb 2022 06:26:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcIP8n58f/Us1Fbv32LxxCWhGs8UL07KOLBWbrU0ooPqALPEtbqtU6/lEbqy162NSaUULbng==
X-Received: by 2002:a05:6402:1d56:: with SMTP id
 dz22mr26419221edb.82.1643725596554; 
 Tue, 01 Feb 2022 06:26:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id hh13sm14747228ejb.89.2022.02.01.06.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 06:26:36 -0800 (PST)
Message-ID: <c821953a-6572-d60d-6a00-fccd541268c5@redhat.com>
Date: Tue, 1 Feb 2022 15:26:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 1/9] spi: Make spi_alloc_device and spi_add_device
 public again
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
 <20220121172431.6876-2-sbinding@opensource.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220121172431.6876-2-sbinding@opensource.cirrus.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-spi@vger.kernel.org
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

Hi,

On 1/21/22 18:24, Stefan Binding wrote:
> This functions were previously made private since they
> were not used. However, these functions will be needed
> again.
> 
> Partial revert of commit da21fde0fdb3
> ("spi: Make several public functions private to spi.c")
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/spi/spi.c       |  6 ++++--
>  include/linux/spi/spi.h | 12 ++++++++++++
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 4599b121d744..1eb84101c4ad 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -532,7 +532,7 @@ static DEFINE_MUTEX(board_lock);
>   *
>   * Return: a pointer to the new device, or NULL.
>   */
> -static struct spi_device *spi_alloc_device(struct spi_controller *ctlr)
> +struct spi_device *spi_alloc_device(struct spi_controller *ctlr)
>  {
>  	struct spi_device	*spi;
>  
> @@ -557,6 +557,7 @@ static struct spi_device *spi_alloc_device(struct spi_controller *ctlr)
>  	device_initialize(&spi->dev);
>  	return spi;
>  }
> +EXPORT_SYMBOL_GPL(spi_alloc_device);
>  
>  static void spi_dev_set_name(struct spi_device *spi)
>  {
> @@ -652,7 +653,7 @@ static int __spi_add_device(struct spi_device *spi)
>   *
>   * Return: 0 on success; negative errno on failure
>   */
> -static int spi_add_device(struct spi_device *spi)
> +int spi_add_device(struct spi_device *spi)
>  {
>  	struct spi_controller *ctlr = spi->controller;
>  	struct device *dev = ctlr->dev.parent;
> @@ -673,6 +674,7 @@ static int spi_add_device(struct spi_device *spi)
>  	mutex_unlock(&ctlr->add_lock);
>  	return status;
>  }
> +EXPORT_SYMBOL_GPL(spi_add_device);
>  
>  static int spi_add_device_locked(struct spi_device *spi)
>  {
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index 7ab3fed7b804..0346a3ff27fd 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -1452,7 +1452,19 @@ spi_register_board_info(struct spi_board_info const *info, unsigned n)
>   * use spi_new_device() to describe each device.  You can also call
>   * spi_unregister_device() to start making that device vanish, but
>   * normally that would be handled by spi_unregister_controller().
> + *
> + * You can also use spi_alloc_device() and spi_add_device() to use a two
> + * stage registration sequence for each spi_device. This gives the caller
> + * some more control over the spi_device structure before it is registered,
> + * but requires that caller to initialize fields that would otherwise
> + * be defined using the board info.
>   */
> +extern struct spi_device *
> +spi_alloc_device(struct spi_controller *ctlr);
> +
> +extern int
> +spi_add_device(struct spi_device *spi);
> +
>  extern struct spi_device *
>  spi_new_device(struct spi_controller *, struct spi_board_info *);
>  
> 

