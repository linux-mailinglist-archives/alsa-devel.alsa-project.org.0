Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D45CD2FEFA3
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 17:00:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52A6618F6;
	Thu, 21 Jan 2021 16:59:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52A6618F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611244798;
	bh=x0b4X4cFM5gwF5Yfl7mvCDsEUYAyqksoXnV9+du4GBs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TzFae4WBEw4rWHwrL+eqVn22EJrXCgz9dFnncA2BxmXgeb8yaTew9RAjfZvTcQ+9O
	 cOWLel/CT6H6ZZFeq8tDIMmbyVSO9DjUH071M/V3KZ/q1NfNPZZkztyYtqJxiCkLYd
	 GM3vgokLhlM/R0RwfMyuAgsZc5G7iGvVGa3u0xbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EF4AF8026A;
	Thu, 21 Jan 2021 16:58:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84378F80257; Thu, 21 Jan 2021 16:58:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02791F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 16:58:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02791F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="PSlNsTdi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611244699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gxg++XI0YPfZVOGn773w0joNP2UVCis1+mi7+/xwU2g=;
 b=PSlNsTdimrPBwuM5MLMsHqS11aWGtKcTpt8JSVhqMHKsKIG2Ib8aP8dLzYi9TLcnU4JcO9
 hmtdjGabpcgxQVpnunLTsPfrSMT6rWCDa4KXYGDsI8bcY0MbEqlk2wn4JsksLNiPCvzRHa
 e+k6JcwypkVJq2j+isKMRPGsIHnip3A=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-6UVnnXCrOOyduuSRE-8koA-1; Thu, 21 Jan 2021 10:58:17 -0500
X-MC-Unique: 6UVnnXCrOOyduuSRE-8koA-1
Received: by mail-ej1-f70.google.com with SMTP id f26so936349ejy.9
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 07:58:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gxg++XI0YPfZVOGn773w0joNP2UVCis1+mi7+/xwU2g=;
 b=FM1V79sJUVVjhbsILZ0ty4ZuJngtcq23nLbEYYfG2mylNNcAJSLDhW+JcwxGhblHOG
 yJdMYBPNkw1B/+1E3xFOMKPmXcdsSZyIaggzTb7tU72ZI1V0hbkQDopUVaoho/gjNyqP
 fyCNhoPMtpQ9hmJ7eD9PFOSHmV2KfighsEdFqbWnNbTe0/r91IrIaLL4frCBRygDDcwR
 sr9uiUlwbMwpyN/E8UMFQiQYHb9g5HMy/3nR10FkQ9oI/Ty7XNDNqgLsTcUsQK89jU22
 iW0oATKQJQ9tJXOeHAumZJSJYFzCcF5jaPbYQTd3NvjBR6cjwhfkqjssJtye6JRrS/mM
 DNVw==
X-Gm-Message-State: AOAM530kywLjmB+BTuD1QmvotMeEwehh6ZXCjr8YPboUmH3jJnRDNW4p
 UQEZBdGpPEV9bI/O6J1A6gd6HpyeCKyjMlksLxuTpHCiIqzvh8lsmgQMC8n1L7IralXQ+BpJMEu
 rkTb0yeNXuDqOAtChHAtgMdD9jqOTxWPArz8Zl4vFl00cPQHMYxxFzy1T0/dsOotikutRg1aJTo
 I=
X-Received: by 2002:a17:906:52c1:: with SMTP id
 w1mr110739ejn.214.1611244695449; 
 Thu, 21 Jan 2021 07:58:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+xUZbRk6EKYn3AmKWraZ7fUxA/I8QOIemNGQ8/RMaZjEd/rbynq44e11lmTCnRs86KDPPDg==
X-Received: by 2002:a17:906:52c1:: with SMTP id
 w1mr110715ejn.214.1611244695129; 
 Thu, 21 Jan 2021 07:58:15 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id ar1sm2372508ejc.30.2021.01.21.07.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 07:58:14 -0800 (PST)
Subject: Re: [PATCH v2 03/12] ASoC: arizona-jack: Fix some issues when HPDET
 IRQ fires after the jack has been unplugged
To: Mark Brown <broonie@kernel.org>
References: <20210117160555.78376-1-hdegoede@redhat.com>
 <20210117160555.78376-4-hdegoede@redhat.com>
 <20210118124747.GH4455@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <32d709f7-211e-6cce-a83e-318061e36609@redhat.com>
Date: Thu, 21 Jan 2021 16:58:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210118124747.GH4455@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Lee Jones <lee.jones@linaro.org>
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

On 1/18/21 1:47 PM, Mark Brown wrote:
> On Sun, Jan 17, 2021 at 05:05:46PM +0100, Hans de Goede wrote:
>> When the jack is partially inserted and then removed again it may be
>> removed while the hpdet code is running. In this case the following
>> may happen:
> 
> Fixes like this should be sent at the start of the series (prior to
> things like the move) so they can go to stable as bug fixes.

Ok, I'll reshuffle the series for v3 to put these first and have
them apply to drivers/extcon/extcon-arizona.c before it is
moved to sound/soc/codecs/arizona-jack.c

Regards,

Hans

