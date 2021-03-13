Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BB6339EFC
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Mar 2021 16:49:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9E601711;
	Sat, 13 Mar 2021 16:48:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9E601711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615650546;
	bh=2LJrqVN3y0a+8I6uvTkZyn3EQgZfRbJT1O626Zmb7wM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W3InIefziALUUs9W2Lu3k4dzpa1eRYTNsmSpvaLh+hOQsy1IHCwPNeROTuN0NCejl
	 MrsigMPf5M8K2dXk+40auJFDvLIs5toQnc1cVX101jVtnLZfQ/DYZR63PwstkiB+O2
	 Pc7smY9Qz0Z8ZXgThWLmZtRIDXIdhZMAs7tfuAbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2846F80256;
	Sat, 13 Mar 2021 16:47:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1512F80227; Sat, 13 Mar 2021 16:47:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B0D5F8012A
 for <alsa-devel@alsa-project.org>; Sat, 13 Mar 2021 16:47:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B0D5F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="ftK8VC7Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615650431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FLq3X211LfbU619/ijQXkqri4bO5wBBbciKuxUC8+Lo=;
 b=ftK8VC7QFwmSpx+VZ9FKtKlcIkRmqnqT5Mz9ExpoiswTFBD1E26vTdGf+YGvvDzUVCIbnX
 gQglaQSnWMaxRlJFjGNgE5RocesUasMiuLDnIs0U8ri0r+laEsTbu/Pc2xb8D4KOlZNNNH
 udzhBKS9OQGH1lEss+a6SPz8qRjfew0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-xKVZPQr3M_mOPWsUS4WQnw-1; Sat, 13 Mar 2021 10:47:09 -0500
X-MC-Unique: xKVZPQr3M_mOPWsUS4WQnw-1
Received: by mail-ed1-f69.google.com with SMTP id a26so6259482edt.23
 for <alsa-devel@alsa-project.org>; Sat, 13 Mar 2021 07:47:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FLq3X211LfbU619/ijQXkqri4bO5wBBbciKuxUC8+Lo=;
 b=o4dVB9rDssTZDshx0OKidJu3st0/oKZuAL7fnuaYhYuvbDj+dpx9j8Nit22aGFPFJo
 ELAnuXFs3tSQdPFTGQIvTA3KxecbM+UzH04bHSY8l3xQklx9AlyR73emk6fBUPw9WBBV
 noHkSCtciJ7v/JTbBQSLAYvWnY4Q0/d526ATKKr2v4A+tSNeAzt9vsPCtzfZ2Zbkf/LJ
 LUyy4T6iBF7JFNEL+nGooxbqPUEh0Q5VY0OzfnkHm7vGqX2/xzF7EGBUcw9YstDdTb8j
 sf6S6bdfenhV0S6IutP61E76thWMhGPQm6LIUjkTlbFkJFlv2MXDAJWMUR0e6MqKqtxQ
 B4eg==
X-Gm-Message-State: AOAM532w/esR7o2E7qeAE7BuGhSeMAT06pCFtBf8V+H4Xzwyyp/q5boz
 WVkYqITFJo6naoMwWAErx9GMOlNHgqMWrL4+O1cPdM+DVrgZ3T5JCvTWqcE6iwcgv/99GfxnXl/
 YPMxg/yIMhCqs7qdcGKqO04qj+9se3msvFIlU1PX35fq7PpOuZvoDCnlSYOkbA8a7K4jgwjnJdV
 g=
X-Received: by 2002:a17:907:788e:: with SMTP id
 ku14mr14774484ejc.17.1615650427547; 
 Sat, 13 Mar 2021 07:47:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwiulns+wh157SPSvqQI9OLCPjcj0npOY+xKPiYH5Kkv6o/itGGJyyS03Faalysou8WFsLGfg==
X-Received: by 2002:a17:907:788e:: with SMTP id
 ku14mr14774465ejc.17.1615650427281; 
 Sat, 13 Mar 2021 07:47:07 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id v15sm4675673edw.28.2021.03.13.07.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 07:47:06 -0800 (PST)
Subject: Re: [PATCH alsa-ucm-conf 1/2] codecs/rt5672: Move +12dB input boost
 from 'STO1 ADC Boost Gain' to 'ADC Capture Volume'
To: Jaroslav Kysela <perex@perex.cz>
References: <20210217143436.74209-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <2f424984-ae8f-7393-94f8-fc18e5100e58@redhat.com>
Date: Sat, 13 Mar 2021 16:47:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217143436.74209-1-hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
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

On 2/17/21 3:34 PM, Hans de Goede wrote:
> Both the 'STO1 ADC Boost Gain' and the 'ADC Capture Volume' controls are
> digital and the 'ADC Capture Volume' control goes up to +30dB.
> 
> When adding hw-volume-control support adding the +12dB boost gain on to of
> the max +30dB of 'ADC Capture Volume' is a bit too much.
> 
> So move the +12dB from the 'STO1 ADC Boost Gain' control to the
> 'ADC Capture Volume' control.
> 
> This way we keep the same setting for userspace which does not support
> hw-volume-control, while getting a better range when we start using
> 'ADC Capture Volume' as hw-volume-control.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Ping? This series seems to have fallen through the cracks, AFAIK
there is nothing blocking this series from getting merged.

If you want a resend let me know and I'll resubmit.

Regards,

Hans


> ---
>  ucm2/codecs/rt5672/EnableSeq.conf | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/ucm2/codecs/rt5672/EnableSeq.conf b/ucm2/codecs/rt5672/EnableSeq.conf
> index ddfb1c7..e373275 100644
> --- a/ucm2/codecs/rt5672/EnableSeq.conf
> +++ b/ucm2/codecs/rt5672/EnableSeq.conf
> @@ -26,14 +26,13 @@ EnableSequence [
>  	# cset "name='LOUT MIX OUTMIX L Switch' on"
>  	# cset "name='LOUT MIX OUTMIX R Switch' on"
>  
> -	# 47=0dB, 0.375 dB/step
> -	cset "name='ADC Capture Volume' 47"
> +	# Both the DMICs and the headset mic (even with the 20dB boost below)
> +	# are quite soft, set the default capture volume to +12dB
> +	# 47=0dB, 0.375dB/step, 79=+12dB
> +	cset "name='ADC Capture Volume' 79"
>  	cset "name='ADC Capture Switch' on"
> -
> -	# Both the DMICs and the headset mic (even with the 20 dB boost below)
> -	# are quite soft, set the ADC Boost gain (range 0-3) to 1 = 12 dB the
> -	# next step is 24 dB which is a bit too much
> -	cset "name='STO1 ADC Boost Gain Volume' 1"
> +	# 0=0dB
> +	cset "name='STO1 ADC Boost Gain Volume' 0"
>  
>  	# Headset mic is quite soft, boost it a bit, 1 = 20dB which is the first
>  	# available boost step
> 

