Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1F275D64A
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 23:15:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CDA31FA;
	Fri, 21 Jul 2023 23:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CDA31FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689974157;
	bh=DHkPT0Cmp3PyMM5gTqpS+61cZX7UIasRFY9k4g0yDk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LQ0KClzZ9Ry1dCW6HDyC0XXiIO9igvj54wlXPg3Z5RB0aT0lAE3F4NuX0viG2R6on
	 rKU9LHw9TkrInAH/wYEGeFoU7Y5eNOfPXA+iF0MRxCmUzk+FXXyeQhxacvgvFjngV7
	 UEKPMII89kYGov8fgesW0lGFAFuo9K46BskJvZyI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92502F80527; Fri, 21 Jul 2023 23:15:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16C38F8032D;
	Fri, 21 Jul 2023 23:15:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A0CFF8047D; Fri, 21 Jul 2023 23:14:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15BD3F8027B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 23:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15BD3F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Km0dWAq2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689974086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AucQCy4EnWPkoso2uzU/nf9OwRCQs6NxgaktwWeEhXE=;
	b=Km0dWAq2eh9IRm3XR0qCCHa/rWdYWTnJa1mLVwDuS8jjqqEcQWEqUad8hxo/KPM5Nv5bqH
	HojGtsB0sDgHVdJ24lhamyZIwyKrTE0nn388GTOTmV9L18n+qvMJ4PTrAYbnStAtoMLjxi
	jldqPHYg29rFZzXmw0dG1Gr3BcHHd3s=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-q3hna0OGP6K7nMVxYUXGfQ-1; Fri, 21 Jul 2023 17:14:44 -0400
X-MC-Unique: q3hna0OGP6K7nMVxYUXGfQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-635e91cba88so28612926d6.0
        for <alsa-devel@alsa-project.org>;
 Fri, 21 Jul 2023 14:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689974084; x=1690578884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AucQCy4EnWPkoso2uzU/nf9OwRCQs6NxgaktwWeEhXE=;
        b=k5a+NxpJXqtuzsxFf59XeAnVVW5MbFJnTTlstel1y0aUQaT6FEwZ5oQluXYWsl9lwq
         akzF2IdbbqEF6Vs9VGZwl8VJVcAtAc6AIoXvnJTHNLtX7xdGp8rHg9qB38cTDs/hftzM
         bdGCWaZV3x4teEMjanz6TuSBywtbolrIw411LgfEbf44NYCk2Kw1YoqfPWLyNMGdCo3K
         p/8gJbXcKBAH4iEzGirsVjR5DrT7Ip3JmeMFpFriTQHYuXgagObuA6mmveVuMhc0vgCB
         0S1wuIYQ0randIOmuIcUbsVN7P90p8l0G0TAwvHDlqi8Dz4WoYhNXvk/mPKb9McWtOzo
         3CVw==
X-Gm-Message-State: ABy/qLbeuJcyTaMK/jEUbLQe7/VT1GpaCK3Cj/rLx3YnihQofQRlkhBB
	KGbrs4zWd6vUn5XUbxoD0malvXlIREwoJSSvfEIUwIB0LM/FlSjt8OtWzsagIa/2gQzGVkCAKe+
	35QAkeDrs5uQ20JqQJnxcMYc=
X-Received: by 2002:a0c:f907:0:b0:5f4:5af6:1304 with SMTP id
 v7-20020a0cf907000000b005f45af61304mr1213658qvn.16.1689974084333;
        Fri, 21 Jul 2023 14:14:44 -0700 (PDT)
X-Google-Smtp-Source: 
 APBJJlGVrQNjzF4DBXjYQf8nrO32CEZALTxhI79MrPwcX2lK9z4QDzLcWJNFd+xdC4Hmp+SIWIpFuA==
X-Received: by 2002:a0c:f907:0:b0:5f4:5af6:1304 with SMTP id
 v7-20020a0cf907000000b005f45af61304mr1213645qvn.16.1689974084073;
        Fri, 21 Jul 2023 14:14:44 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::17])
        by smtp.gmail.com with ESMTPSA id
 m6-20020a0cdb86000000b0063c7037f85fsm1565490qvk.73.2023.07.21.14.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 14:14:43 -0700 (PDT)
Date: Fri, 21 Jul 2023 16:14:41 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soundwire: qcom: Log clk_get("iface") failures
Message-ID: <ydy3ubtg75kzml23cowxpkmapoe2vlajm3r5sjglilffuhxr5q@t77ck5lknudy>
References: <20230721164901.2155287-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20230721164901.2155287-1-quic_bjorande@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: PXRXE52TYSQ2SOTCPCRHFW7ZVNES7RDM
X-Message-ID-Hash: PXRXE52TYSQ2SOTCPCRHFW7ZVNES7RDM
X-MailFrom: ahalaney@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PXRXE52TYSQ2SOTCPCRHFW7ZVNES7RDM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 21, 2023 at 09:49:01AM -0700, Bjorn Andersson wrote:
> Failing to acquire the iface clock makes probing of the Qualcomm
> SoundWire driver fail without providing any indication to the user. Make
> the driver log the error to aid debugging system configuration issues.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/soundwire/qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 55be9f4b8d59..e51b1dfce82d 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1550,7 +1550,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  
>  	ctrl->hclk = devm_clk_get(dev, "iface");
>  	if (IS_ERR(ctrl->hclk)) {
> -		ret = PTR_ERR(ctrl->hclk);
> +		ret = dev_err_probe(dev, PTR_ERR(ctrl->hclk), "unable to get iface clock\n");
>  		goto err_init;
>  	}
>  
> -- 
> 2.25.1
> 

