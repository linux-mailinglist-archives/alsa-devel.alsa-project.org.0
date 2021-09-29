Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AA141C14E
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 11:09:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BE9C1698;
	Wed, 29 Sep 2021 11:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BE9C1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632906546;
	bh=br9/vVUqMQCdjM12t2zntuidrHjVV5LVKelG/DxYifQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qv6D2X93SFGlsreTd4Sz12sWJFOxkJZmwgwhKjCKEsFCm0Cy3W+LnyCIxXjDId/s3
	 eoK69AkTXpNFsJdP+DcEJ+VjybQz17iVA69z42Sj2ZHFqP8PTLIGDGIANUtxUQRS6l
	 ZP4rp+WfksS2F/7iDvDQi+pJLl9afQ1xx2oFTIS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAEA4F8026D;
	Wed, 29 Sep 2021 11:07:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E6CEF80227; Wed, 29 Sep 2021 11:07:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 087F0F80105
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 11:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 087F0F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="LFZC9Uo5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632906461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n++xCjf25lsydxl4FEJyLD2EoHAbGbCE0fDyv+KGuUk=;
 b=LFZC9Uo5eI+Rc/WKe7XsJSqcHYuY0RuGQqVqBjF7Nc1NLpVekaFPcovoaR8Su5kBbSwrsD
 //eZU+IE7maNkjodSUsgHfDb5KwPr67cbDpnqpQexqRZ72b5gz+4v93Y8Pq4vrMd7Pdnvj
 iVzISSQ/dQs1uSuxtkiIpTvfUQNNTlc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-3ZyuaMquOa636P97dcXxhg-1; Wed, 29 Sep 2021 05:07:40 -0400
X-MC-Unique: 3ZyuaMquOa636P97dcXxhg-1
Received: by mail-ed1-f70.google.com with SMTP id
 a7-20020a509e87000000b003da71d1b065so1733174edf.4
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 02:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n++xCjf25lsydxl4FEJyLD2EoHAbGbCE0fDyv+KGuUk=;
 b=61YIGmeIaRAOZlACbQOqhYfsXjt73v4vzbBgKKtyE0yf73vOGkFEJiTW+y9dHS6kM7
 +xCc+wsSxGF/UZElw9i/CAsje/NAtvhGQmcg9WZueuoCmrSZDd+6au0TINZIiF54/ZR/
 eJFxzyIDtQVN6djy30bJv+6xz79BCJHATeeXPxXKbnxcTXZWbVi3XLUMpUp1H3WQpOe1
 wROLjeZgEhEt3gWqIWa/tq3xUV72vncTtPyiS+rra2HuBuYpnR9pAEBDLCajHatGdd3n
 2x8/zvYYAp8Jn7n+vNTMC+s60zgmwWiyiinbkh6bpVFcTW4XCnihQecLssYwp3UbVlS6
 VFXg==
X-Gm-Message-State: AOAM5335BqncxCVxc44Qf1BHkJNt5SwY46KzRHn8JzlHWiTp1fsk6Ij8
 I9BOKpLwyW7v7T/GR4lQBqdR+PEqSRn5M0mWsLQ+hJXl2CXpX8S+mr+zWvb/VvK3kT3ZQPpAbEm
 dDgHxeESUCI+5GQEU+cODK8pUFc46pUbXlrBvTYcBzbebDi35DwACEqvKXU+XPsN6zyQhZegoS+
 M=
X-Received: by 2002:a05:6402:705:: with SMTP id
 w5mr13713824edx.366.1632906459022; 
 Wed, 29 Sep 2021 02:07:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxoP/EAbjTGcIzIAQAsJBHhLVTH71K/mvfdFNBIIFcSdXE9gzwJAPRbWAQu1F62y2fSO9t+g==
X-Received: by 2002:a05:6402:705:: with SMTP id
 w5mr13713796edx.366.1632906458768; 
 Wed, 29 Sep 2021 02:07:38 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id l10sm1090717edr.14.2021.09.29.02.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 02:07:38 -0700 (PDT)
Subject: Re: [PATCH alsa-ucm-conf 1/2] bytcr-rt5640: Fix 'Headphone Switch' /
 'Headset Mic Switch' no longer getting set
To: Dmitry Osipenko <digetx@gmail.com>, Jaroslav Kysela <perex@perex.cz>
References: <20210718175750.12353-1-hdegoede@redhat.com>
 <1dfbddfb-e93d-112f-d787-aa27c88a3b80@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <e092ab94-6b30-5285-bd7f-dbabe4c7f83f@redhat.com>
Date: Wed, 29 Sep 2021 11:07:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1dfbddfb-e93d-112f-d787-aa27c88a3b80@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 9/28/21 10:15 PM, Dmitry Osipenko wrote:
> 18.07.2021 20:57, Hans de Goede пишет:
>> Commit 446d0a71b47f ("codecs/rt5640: Move out BayTrail-specific pin switches")
>> moved the setting of the 'Headphone Switch' / 'Headset Mic Switch' into
>> "If.hp" resp "If.hsmic" blocks. But instead of making them part of the
>> True {} block inside that If, the statements where added add the top-level
>> of the If {} block where they are no-ops.
>>
>> Move them to inside the True blocks so that these Switches again get
>> properly turned on/off. This fixes the Headphones and Headset-mic no longer
>> working on bytcr-rt5640 devices.
>>
>> Cc: Dmitry Osipenko <digetx@gmail.com>
>> Fixes: 446d0a71b47f ("codecs/rt5640: Move out BayTrail-specific pin switches")
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  ucm2/bytcr-rt5640/HiFi.conf | 36 ++++++++++++++++++++----------------
>>  1 file changed, 20 insertions(+), 16 deletions(-)
> 
> Hi,
> 
> I don't see this patch in upstream alsa-ucm, is it still actual?

Yes this patch series is still actual. I also have 3 other patches
pending where I was waiting for the mathcing kernel parts to land
first. Those have landed now, so I'll send out those now too,
including a resend of these 2.

Regards,

Hans

