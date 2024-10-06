Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AD2992124
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Oct 2024 22:30:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20B2384C;
	Sun,  6 Oct 2024 22:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20B2384C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728246645;
	bh=4c9+KGTiwcO0wZGDXDgLt2CmDO69Os6Wz+W7uBwFA0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OpUbC24wWl/jwe/Nk5nkAM/PHQZFTzbtBJRo3WE7ZGiof+IlVj9K4TghDmH1VGWmD
	 6vem0SFmCCZTrgSfXbNlsaA2VvuotObE3Qk9HAHA+h8NxUeZfZi65Ss21M6bBMoJBM
	 SqK9AqcdBTRrZxQ0FTwZ9NChE10EtxmczPOsTfTI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4502BF8058C; Sun,  6 Oct 2024 22:30:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 367F9F805B1;
	Sun,  6 Oct 2024 22:30:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F4EEF80528; Sun,  6 Oct 2024 22:30:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31E4FF8001E
	for <alsa-devel@alsa-project.org>; Sun,  6 Oct 2024 22:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31E4FF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=G1DA9IPb
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2fabe5c8c26so32913461fa.2
        for <alsa-devel@alsa-project.org>;
 Sun, 06 Oct 2024 13:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728246606; x=1728851406;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rKRJXoG/V96zfzQlXk7NxT0mKPnxf8KDSvA2Wf0bVAw=;
        b=G1DA9IPbDqJXjAxsUDJULxh0EFpVS0+JzWhvwcf8n1V4pM8WtYChnS5ovEh/v33aWP
         /Niw9sMris7FVjvAsvpIKfanQOmdT7veXnlkhQs6zX2C+9q/+gnoh3zAQk3+veZ6ms5y
         wbhUy8UGwWzrJba4/CEnsoe4mgR48AMWXTRd2Y7sr7NUgWNYjc6475+MnbM3D2e1Ae0/
         qSE5TZw5ZVMNApCnMgTmZqtyfdOeXcNudUA/e4mgcsrZsFn6BM6JbjJtL6Ui0ZHRb1RH
         Pekv2IH+dyB5P+YBGvX3ZmXLR/rFPqXAY7nfVghRbjgOKQaDM7uKiDnyr6GVIoW+VS63
         BtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728246606; x=1728851406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKRJXoG/V96zfzQlXk7NxT0mKPnxf8KDSvA2Wf0bVAw=;
        b=gHrYOk8jKB38CcwaVdXCyuLFm2JC8KBwE2NS6XNRIuelOkqnbqSI0qgT/JP8DrKago
         1fw4dq5unz+GgCQZX4uS1t5qygxKvZR7cIP6o2KHrT+Sa/UHOF4Hby/dIKvdFjdMmja9
         D/7bvjszxt8yKs3cn1gsU1UwpzGlYPa4VfiAZOvv73EHnHd1Ymx8J8xseRvsGkEEYWJT
         ZEmC6OdZZgjm4FuV1fD4M13CuTarLW+i/c8PAdviE4674wPfgpvx9tufz6dR3ISSsVGn
         HdZLBHiNfLgdg+JRqtDmvTkUh+u6sYPog1RzxiHzlEOxv2GENryeeSqHEjf7sdRSXNVR
         aKkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGNVAzZHEJJBwcee0aVM73QjDm1RdRpREIs0bSM0186XOPClL5meRUDZuELgW0LuP/2E/SALSLSG+h@alsa-project.org
X-Gm-Message-State: AOJu0YwdLXQPxHYs5ex/i7SYUgqFeeYhESXwUejDEVJk5U4LIx8IcI6+
	3RLynFO0rkMKbHs06ihBXsLlJ1acFqIcq3Bx4MxGwFukhABC8nSAKY1U++9AFbQ=
X-Google-Smtp-Source: 
 AGHT+IHGm8iXDV3xjDyilH88qj9I+HIKb78i59wZamBlD9e+iLmpZqrH0JJkihn3M1K3x9pCGJ9pwQ==
X-Received: by 2002:a05:6512:33d2:b0:539:9e9d:18b5 with SMTP id
 2adb3069b0e04-539ab86655fmr4313110e87.21.1728246605637;
        Sun, 06 Oct 2024 13:30:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff27a3fsm610809e87.246.2024.10.06.13.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:30:05 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:30:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, perex@perex.cz, tiwai@suse.com,
 linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org, elder@linaro.org,
	krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org,
 linux-kernel@vger.kernel.org,
	a39.skl@gmail.com
Subject: Re: [PATCH v2 2/7] ASoC: qcom: sm8250: add qrb4210-rb2-sndcard
 compatible string
Message-ID: <b6was3uqd4vcs5dsu556xkbsqodqfp75vhtvclzokpzuvbqjw5@q7f2nfvdxpdb>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
 <20241002022015.867031-3-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002022015.867031-3-alexey.klimov@linaro.org>
Message-ID-Hash: VNI7LD3VFWSGRXQHWEX6USINCRKOPPXC
X-Message-ID-Hash: VNI7LD3VFWSGRXQHWEX6USINCRKOPPXC
X-MailFrom: dmitry.baryshkov@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VNI7LD3VFWSGRXQHWEX6USINCRKOPPXC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Oct 02, 2024 at 03:20:10AM GMT, Alexey Klimov wrote:
> Add "qcom,qrb4210-rb2-sndcard" to the list of recognizable
> devices.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  sound/soc/qcom/sm8250.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
