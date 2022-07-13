Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BA35752F2
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 18:38:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D34F1189B;
	Thu, 14 Jul 2022 18:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D34F1189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657816691;
	bh=671htBTSUJ0xSGhFAufCxN28YFPbw9mcLmml0UlcgI8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rv3szcp8PsJOI3WzOiD/+KCSK3BqVDFde6qANgqCyKlQ4tFsYeiRwVaMR1Q2q7X5Z
	 u3Yy9jt1pHRI69mgAMQH0dODxJMeL1fPTVsEQhATn2Ug5A1/06DPbI4UZZGk+YNjvg
	 BYK6AIdOtuyhct3We6Rw6hrk9+31BjfHOpXlt83c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 278E6F8057B;
	Thu, 14 Jul 2022 18:34:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D6BFF80249; Wed, 13 Jul 2022 15:56:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27C9DF800AA
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 15:56:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27C9DF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Js+WY730"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657720568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IMCa17u/KRBIFaG4KsLRIkbEcc9LdlhpCTT849G+Kvc=;
 b=Js+WY730++hxI99wvFj7mGDWYalICxIgHTgUSWrymHRD4UqewKFNFHeK83b7j7K2GK3syM
 +10wzadBs3N64lfr3HYiQuoy07YTNO9diZQyn09PfcZKKX7Lvxp9mapsFJt6fbyIkmxfdx
 O710G+KCuh5pcYlVetjTrUpFKlWz+Ds=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-CDJVAxJeN32A9sl7BWNSNQ-1; Wed, 13 Jul 2022 09:56:07 -0400
X-MC-Unique: CDJVAxJeN32A9sl7BWNSNQ-1
Received: by mail-ot1-f69.google.com with SMTP id
 99-20020a9d036c000000b0061c30df92a9so4481489otv.5
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 06:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IMCa17u/KRBIFaG4KsLRIkbEcc9LdlhpCTT849G+Kvc=;
 b=xY3p1MMyXjm5g2fmpqQg0yQ5CF63WGQGMwNPysUKcT6cNndIwzQWtxvcepW7eQA/iJ
 WYnCdhPRqe+CvyS0OwTV89PfK+EIjTPYbrRgguR64UWSHLFT8Zs/HcEJl9iRg6PeIy29
 LaKR328JN6aNJJA9mGCmYnhNfwnX5nE14w6f6CFlyB05LpRncjDGWcZ9yGzKcaoOVP7V
 bMuIagVW3f20xDKUyLQNDtz2L5aMeoUuNHzyinKafiTY6KmugIhm4oUSNKZLTFlGGwv9
 Aq4hn2ZbLNXrXTM3l12m2eAskXP7jHnnya800mbo+bPlU7iR7IbIglzUCH6oKRawPYVs
 FvDQ==
X-Gm-Message-State: AJIora+I08DPy48y3uUu60OOtfJ1iTPz3SWPl2+X0+V2pZ44uVChw8Wk
 fIvFbokTYLrZM821lANtH4xaz/p3c/BR7nhM8L+kNCyYMEqCWy+bVBAzIalJInp1GKAdTz5hscE
 pZekOnNOUHiisZK+F1/eulZE=
X-Received: by 2002:a05:6808:209a:b0:33a:537:6d30 with SMTP id
 s26-20020a056808209a00b0033a05376d30mr4804593oiw.294.1657720566491; 
 Wed, 13 Jul 2022 06:56:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vuo5XeROM7lZoIMaa90JjCQfQyQRAPg6yPHfeiuOg8/rxYEdmyhZRf05BhrhKk9Hr1yX1uog==
X-Received: by 2002:a05:6808:209a:b0:33a:537:6d30 with SMTP id
 s26-20020a056808209a00b0033a05376d30mr4804558oiw.294.1657720566055; 
 Wed, 13 Jul 2022 06:56:06 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::2e])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a4ace8a000000b0035ef3da8387sm4791255oos.4.2022.07.13.06.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 06:56:05 -0700 (PDT)
Date: Wed, 13 Jul 2022 08:56:03 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH] soundwire: qcom: Update error prints to debug prints
Message-ID: <20220713135603.4vkyofw6x4mldxzp@halaneylaptop>
References: <1657714921-28072-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <1657714921-28072-1-git-send-email-quic_srivasam@quicinc.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ahalaney@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 14 Jul 2022 18:34:36 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, broonie@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, vkoul@kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, quic_plai@quicinc.com,
 swboyd@chromium.org, judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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

A couple of drive by nits:

On Wed, Jul 13, 2022 at 05:52:01PM +0530, Srinivasa Rao Mandadapu wrote:
> Upadte error prints to debug prints to avoid redundant logging in kernel
> boot time, as these prints are informative prints in irq handler.

s/Upadte/Update/

> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
>  drivers/soundwire/qcom.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 9df970e..a4293d0 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -573,11 +573,10 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>  				break;
>  			case SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED:
>  			case SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS:
> -				dev_err_ratelimited(swrm->dev, "%s: SWR new slave attached\n",
> -					__func__);
> +				dev_dbg(swrm->dev, "%s: SWR new slave attached\n", __func__);

There's no need for __func__ usage with dev_dbg() when giving +f flag
when enabling adds this for you!

With those changes feel free to add:

    Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

Thanks,
Andrew

>  				swrm->reg_read(swrm, SWRM_MCP_SLV_STATUS, &slave_status);
>  				if (swrm->slave_status == slave_status) {
> -					dev_err(swrm->dev, "Slave status not changed %x\n",
> +					dev_dbg(swrm->dev, "Slave status not changed %x\n",
>  						slave_status);
>  				} else {
>  					qcom_swrm_get_device_status(swrm);
> -- 
> 2.7.4
> 

