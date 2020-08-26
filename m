Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D37942530C8
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 15:59:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69DF01759;
	Wed, 26 Aug 2020 15:59:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69DF01759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598450391;
	bh=XfxUSMNSXa9hRdcmZ4l2beQ1mORrOXnj0dV+YbE1830=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bPweQwucPfWo6CKl9Jq4z6CtjwhdNlre1mpjA8FjGOIEUKBjnn9WFhWnn4BGHGpAQ
	 EQIMBKmTf7qk5AA6e8XkrtWKR0WzXl2eczWcf6v5Du/oqNAPX487FfmxlkteefVkOa
	 Ha4Tx+yi6BgS2FwnmKf2VrpSjJzwDkqpabjF0JSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7081F8016F;
	Wed, 26 Aug 2020 15:58:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 516D4F801D9; Wed, 26 Aug 2020 15:58:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFD60F80143
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 15:58:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFD60F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Bk7UARc5"
Received: by mail-pj1-x102f.google.com with SMTP id s2so314546pjr.4
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 06:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=0FqnOd3YmcV12Oz4t5r7g9q9j9/q135slbpSCK8ntsM=;
 b=Bk7UARc5qoYztF/VbGHAd38RKkSR28cowwXeoZM+mWrQEDQOG+3am/NyRNAR1P9bn5
 7q+bFsRF96YW8z5jVxe7iiC7k1Y8JpPWE5BAExlm9iFEkBABjJgLRRQlk+jOO7n70lj5
 w1BIOZmpn3SHcobcEOIuUHbBOBbrY/F5Tq05HwF7ohLK1VyFbhxI9U8yUP0R7r9F+8DA
 KKircv0pF0JlOacpStQDUpxTAZjG4DhbpiTNNKfrHC7sUTpFUA6lkAjE/TwHIbpXmPr+
 8YByV1488qN8/RYJ0W+mLUlxHtW8b+erPOIKzwGByPwDR2p3c3uJ7gmfrQiHi91LpmB2
 ioeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0FqnOd3YmcV12Oz4t5r7g9q9j9/q135slbpSCK8ntsM=;
 b=hza3grjyUXiedl9DxVf7VrdLQz45T8Boxcdh1dOLKNJwVm3gveOL8E/3cJwJvxR9+4
 xBxDhkb9VzJVvnKIvd39OCsA9SMdjr/uYiBEAtY+oqlVFLKLwIQnlf7DVU0szA5n9ntr
 Fr+sAAC3Nc0Mi0o/C8OU6qQredaH1wAPf/iqfM6+Dm8H/uHoq3FWm5JXPW55If7zlXKI
 +2RTODSJSoTftJouY687r7VRn5nV+72+7fjhtTkqw58F4z4/RG0J97gvaYsqlFR7yWdG
 vSop9g72BZ9OKkTCFmF+XLYHUxukmmPy/brWZ4uNrzo1L8zGyrqXKB7aSpgeFlnO371o
 n8FA==
X-Gm-Message-State: AOAM532NabMqIPqtf0IKRdCUKumKQW3hmpN0mJWnJM2xqKhmvA7P0Q8C
 G5stdiS1VPBUtPUjlQWB6YtnESkKGHWzLA==
X-Google-Smtp-Source: ABdhPJyVPMbmZZb8nyScya1KCSxaIl8mYoFUrhk90eJiu2mzkDXWIykYtkHcVbahkiYKEK3cTQyTqA==
X-Received: by 2002:a17:902:8d8a:: with SMTP id
 v10mr11947164plo.249.1598450277766; 
 Wed, 26 Aug 2020 06:57:57 -0700 (PDT)
Received: from [10.25.99.87] ([202.164.25.5])
 by smtp.gmail.com with ESMTPSA id p9sm2512264pge.39.2020.08.26.06.57.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2020 06:57:57 -0700 (PDT)
Subject: Re: Question about DPCM
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
References: <CAA+D8APKP9Ci7frPsNjCeF3s+kPm-FU-3-DoU36e4aqBBecKPQ@mail.gmail.com>
From: Sameer Pujar <dev.spujar@gmail.com>
Message-ID: <9abb0eb9-2d7f-0516-1003-4c50183a89c6@gmail.com>
Date: Wed, 26 Aug 2020 19:27:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAA+D8APKP9Ci7frPsNjCeF3s+kPm-FU-3-DoU36e4aqBBecKPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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

Hi Shengju,

>       Can DPCM support such a pipeline?
>       FE ->  (FE/BE) ->BE
>       which means I want to connect several cpu-dai together:
>       CPU-DAI1  -> CPU-DAI2 -> CPU-DAI3 -> CPU-DAI4 -> Codec
>
>       Could you please recommend what I can do?  Thanks for you help!

AFAIK, DPCM currently does not support such a pipeline. I am trying to 
address similar requirement in series [0]. Some of the related 
discussion you can find in [1].

[0] https://lkml.org/lkml/2020/8/5/42
[1] https://lkml.org/lkml/2020/4/30/519

Thanks,
Sameer.
