Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BC32C233E
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 11:48:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97B9E1687;
	Tue, 24 Nov 2020 11:47:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97B9E1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606214905;
	bh=8Ct0Ud1ZSQ6nAgjZe2GLwy+XEcU67ekgdJK6dQwDmPE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t3nNCsoRT9fgHgGEOmVJdCnSQ0/vWpJWBJdhyAx4Tq9f9CUvr00GEFnfFfK5L144S
	 jiru8ZVirXn8+dV6Hwy9XlQNlO9O7LloHBZRrIEf/H9Jqy2Q+TCdwKmx6jAJm1wKMy
	 nvqs6WLzewFz7snVI0QOb7m6I1eEhgiz6Nql76tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B556F80166;
	Tue, 24 Nov 2020 11:46:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41E43F80165; Tue, 24 Nov 2020 11:46:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA004F800C1
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 11:46:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA004F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="m7qwfa5l"
Received: by mail-wr1-x441.google.com with SMTP id 64so8388842wra.11
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 02:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mY6oFyszQIfjsX+snBAXXOzQ/+55tC9XreosQxbSP0w=;
 b=m7qwfa5lAe1wF7BHNWr6BkwgFgqtZRyyXks6m6NwycCQwRRFi9o1MMnlsRQWTbPrPN
 C5YESKotEqsnENg/FT94JYar1tJSyvwOttzauaH03MHHubqwNzq9EFGJVfj145fn+U6P
 wJy70IqedSLsAis+4p/1U9GcFoRcn++VUogBtu1EEK5M9Hv7o6YEsZ81rtfQvHcviEdj
 9d+4Twlbe9SS5ZNJHSC1Gi9zDm18V29BXnctq+B+ixEDt/K94RPcPeQm9llWwumR+z7y
 /9TC+NKUMIEZWf8P0wnq84d1qC0UHfRQPIO8HjfDWPWWSP/TTroxANhRnop7iagdy7KL
 D36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mY6oFyszQIfjsX+snBAXXOzQ/+55tC9XreosQxbSP0w=;
 b=OpmzxsHH1PBa26W8eCeTehFAjDoFRze/kgISFDRxgMOGcm58MES9RCgjepzFJ0L6Rv
 p1HQXUCJDuhVCmCCTDkckX6nkdykEuOHAJhw3Y89NvJ2Mb1KfdmATz40FqjHaUOjL3Cv
 pO4FRXraAVH1EIfaJ+/qX7W2cdpbMduRUZwBEmwweLvPgWomdhfN2GfwiUAzAgig6SiU
 /8MOeGncYQrMBvRrSOD55XAaszg3MM3Jrl+GmTMAGAiQ2dX2vlM2KE7/JeRHJ6kvuJ4M
 My4XjZ8Ns+gTdYZXqktDn7v0kh7oQojlo18F+bb+iMkCEVNq14uRgoqRazChARREmOZS
 2h7w==
X-Gm-Message-State: AOAM5312JGv2cMsmyIzcRsaez4f5DHcKX478x5S6bIhE4GJdP2lyLNY0
 he+Y+1gKXw18zZHhmr//cYQDDA==
X-Google-Smtp-Source: ABdhPJy9wy9XCIVai3yDDcQ4313iVALrhHqxhJJXEQfKGMnkK2Rcx1MU7GaMNQ+S9lhfklrLdFac5w==
X-Received: by 2002:a5d:560e:: with SMTP id l14mr4674436wrv.191.1606214795065; 
 Tue, 24 Nov 2020 02:46:35 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id a9sm25155168wrp.21.2020.11.24.02.46.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Nov 2020 02:46:34 -0800 (PST)
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Constify static structs
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20201122234253.34047-1-rikard.falkeborn@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a79662bc-be6a-ed22-76be-c492d4cfd600@linaro.org>
Date: Tue, 24 Nov 2020 10:46:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201122234253.34047-1-rikard.falkeborn@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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



On 22/11/2020 23:42, Rikard Falkeborn wrote:
> qcom_slim_qmi_msg_handlers[] and qcom_slim_ngd_qmi_svc_event_ops are
> only used as input arguments to qmi_handle_init() which accepts const
> pointers to both qmi_ops and qmi_msg_handler. Make them const to allow
> the compiler to put them in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---

Applied thanks,

--srini
