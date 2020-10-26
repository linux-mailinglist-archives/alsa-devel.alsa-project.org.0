Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C86229901C
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 15:54:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B619516AC;
	Mon, 26 Oct 2020 15:53:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B619516AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603724077;
	bh=mUh+qUcMNnFPYFcOFpmsVX9FoERh1yVLdZ86celiQVk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WRZaJawganTxWfRnu06++o4QrQKzrIUDgmwnR1xVw5bB45rR3FDksZ+bNmCOkGJvO
	 p0/Y1v7M53NC/pRN7N7/ok05AsYo4REUlmJSQ1cnSJU+l4gSSepF9x/eEcZMaC8Ct9
	 haFg+wi5ZBlGEF7gczck2hIl5y3v6B8q6PndsG10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2A54F80249;
	Mon, 26 Oct 2020 15:52:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5818F80086; Mon, 26 Oct 2020 15:52:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC80DF80086
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 15:52:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC80DF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GbcCABbn"
Received: by mail-wr1-x444.google.com with SMTP id b8so12983893wrn.0
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 07:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p1ATpOW7fjmmAl8xtmCr7FlKnqWcx/tsWTiaC0juAts=;
 b=GbcCABbn1MZFMyY8cJ/56fcj0+99V3U20gVd6W+DTtpqeh2pRBDHXc2kPz3NECc09R
 SFP5KXC7nzZ4pSDHJ//lx3ABs34GR8mF22hsFPkOBHNHwua1ZmE3Ynpiu6ZfIuBcZ62T
 et2Q84Pi+O672GcidITbxefBnFxMNBxiTbrHioJSoF5dEDws5lISknG0QmiQja3ga9Ii
 u2PpyKc4BSOagB2n1WiDiDOZCs4kAZ9nZRuTuXs1OU+Bjz66ll7uoBXfY3V/QJf4l9g6
 TItcw6UVuXLjA6W6bqHSIrlQDJnFMfnPh9QLhKDGfiH/AafJOirtwKmNyzkPbhnmghl9
 R/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p1ATpOW7fjmmAl8xtmCr7FlKnqWcx/tsWTiaC0juAts=;
 b=h5vDvymMvot7+8dDycytXsVajxfo+CWevx7H+389+hl4rBcXPKSDOjN3p0E7zvUivS
 gBUwgdwtQs3ge9kl8PSyLFz51Ed9JdyEg02WBXFLhjTW8kajkh5xRWWw68HSBK27xZNh
 6PzCYo//s81kXYA16rdxsIt/jSwIR3CqKbbjG4NrTmGqwhG3FHzWNg7BJfI5vtX1gRPQ
 qW+frKV5oCqdg7AVICFAM+EioSL4d60nu1OQkp8d0c7WcVbLiJljkGCJToPaMiRUyID5
 yNFfBI1a95DK/ggObjYDmoqhkhpswVnJQzSRuxIX3r9417dPY4YwhQvbjvg5buiPuDYF
 tiNA==
X-Gm-Message-State: AOAM533ePU9wjILNyw5Op/JFF9pxpuchIXixa9mj0KJBjsgvIBPY+Bp2
 gunG64+fmX4lFAQhDCjn9nVdzA==
X-Google-Smtp-Source: ABdhPJxdpFTwysYkqbRSmVcQK0EOy70eZY5M5Qd3me5h/gpBQEZ0sPw8BPz+c1sg2SluLFkLJ2uflg==
X-Received: by 2002:adf:9dd1:: with SMTP id q17mr18548114wre.317.1603723973333; 
 Mon, 26 Oct 2020 07:52:53 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id j9sm23341810wrp.59.2020.10.26.07.52.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Oct 2020 07:52:52 -0700 (PDT)
Subject: Re: [PATCH v3 28/56] slimbus: fix a kernel-doc markup
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
 <7a581d05aec5ebbd02be27513de1c5e5a25b7922.1603469755.git.mchehab+huawei@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <7b37a351-9f11-e639-66d6-4ca251bcfeab@linaro.org>
Date: Mon, 26 Oct 2020 14:52:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7a581d05aec5ebbd02be27513de1c5e5a25b7922.1603469755.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>
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



On 23/10/2020 17:33, Mauro Carvalho Chehab wrote:
> Fix the name of the enum on its kernel-doc markup:
> 	enum slim_ch_aux_fmt -> enum slim_ch_aux_bit_fmt
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>   drivers/slimbus/slimbus.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
> index c73035915f1d..00a7f112574b 100644
> --- a/drivers/slimbus/slimbus.h
> +++ b/drivers/slimbus/slimbus.h
> @@ -244,7 +244,7 @@ enum slim_ch_data_fmt {
>   };
>   
>   /**
> - * enum slim_ch_aux_fmt: SLIMbus channel Aux Field format IDs according to
> + * enum slim_ch_aux_bit_fmt: SLIMbus channel Aux Field format IDs according to
>    *	Table 63 of SLIMbus Spec 2.0
>    * @SLIM_CH_AUX_FMT_NOT_APPLICABLE: Undefined
>    * @SLIM_CH_AUX_FMT_ZCUV_TUNNEL_IEC60958: ZCUV for tunneling IEC60958
> 

Applied thanks!

srini
