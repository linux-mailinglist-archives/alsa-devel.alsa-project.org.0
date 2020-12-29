Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB902E71E3
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Dec 2020 16:42:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8D3C180D;
	Tue, 29 Dec 2020 16:41:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8D3C180D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609256532;
	bh=aHnlkeEZZopdnF3v0yMOD+iMphMaystpOIbqHfF9xqk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nb2o0IpWRAoiILvkFmykmF6K4BDSyHBDwpZA99ELwbi+Kwva6fwhEUfgO+N0FCK+A
	 kHfwCONodChhAg4EzqYFGMYW3Xs4eTv930IAVihu5O1DY7GIv+qPQ5jEpb0z/qUFeU
	 3gQxqdoBjfwmVaf5Epz7WSbDHl6VOZsP020TA570=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51AE7F80162;
	Tue, 29 Dec 2020 16:40:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C98E5F8022B; Tue, 29 Dec 2020 16:40:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DFA2F80141
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 16:40:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DFA2F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Q38XQmvc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609256424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=St5ow6BktJ+43KSijX9WxkANnyFhd1WZD38g7LbRQnU=;
 b=Q38XQmvcOEOAWx+kTQeg9Z8b/fXt7RmbR4K0I6YqFV3aqnFVjuwQrJ19rdxFh+Y8kempw+
 CQOhSy3ghxty7qPWskJVRkUGsTTsX7HDEB1S91817K+gfNOWmyZsTiAsooB6EnmtX8GNRQ
 EYB0/IU1jYCTs5sgTyS0R2agaRVbR5I=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-3_zLQJ2iPl2VatNOIW_5cA-1; Tue, 29 Dec 2020 10:40:22 -0500
X-MC-Unique: 3_zLQJ2iPl2VatNOIW_5cA-1
Received: by mail-ej1-f71.google.com with SMTP id dv25so5008568ejb.15
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 07:40:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=St5ow6BktJ+43KSijX9WxkANnyFhd1WZD38g7LbRQnU=;
 b=nDmOB2ru+811nDQGGIqHBC8fQrzE/+kB7HmrFd7LnCS56E17QOWu1usxZ3Hg+ufn7k
 /fMz37HungDdDTTMYaTYkMSObb+u9sTzMU0AKvyctWIl0JOJepmkR8sdTdaNNM4A2bEX
 ATEgM1FrQr4OXAp4M2q6FGMan+KJUWOiNARxkaFrCdnwV0NUdTCrjA109aRzkqY3q20O
 qREo/83E9lzqxPMtQCWqfyuH3GDzq+rVIBgmp11iOgjpaxlfBg3LZGbHozudJnokuqxv
 NrRcJt8d46zw6F1aZb/mK7EWkjREchHH+DKQcKfzzgYfSQHth/GlHuOjBmTwoQ5r4/im
 CPEQ==
X-Gm-Message-State: AOAM533EPI2BmvJLfOD7OUhw5XrMdAQH6tI//MMpCEIYEPYTt4GR0AGF
 YObcpaxC/yMEOMd2muZ+4bE24tmFhjj1EtqcY17teOUm1gT4+ATnPNR9WmMewxyKeXE6nOQPYkZ
 l9OcA7nRrIQEvHmwfRzwHvDm5YA/4Fgb425xaohxh9XjPqpIPG7z2Tqisf0JXqlXkQcDLBxmYSI
 4=
X-Received: by 2002:a17:907:c05:: with SMTP id
 ga5mr44328073ejc.32.1609256420778; 
 Tue, 29 Dec 2020 07:40:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwm7L2MghW6vxcPj16+RHJrGVR3ouARaHp79/K0nTwsWgjSGaF4SkRll8L+4h3Qy/71rVr3HA==
X-Received: by 2002:a17:907:c05:: with SMTP id
 ga5mr44328049ejc.32.1609256420559; 
 Tue, 29 Dec 2020 07:40:20 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id n20sm18116708ejo.83.2020.12.29.07.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Dec 2020 07:40:19 -0800 (PST)
Subject: Re: [PATCH 01/14] mfd: arizona: Add jack pointer to struct arizona
To: Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-2-hdegoede@redhat.com>
 <20201228122138.GA5352@sirena.org.uk>
 <44f84485-8efc-39f9-d0a7-cb8db2ea3faa@redhat.com>
 <20201228162807.GE5352@sirena.org.uk>
 <20201229130657.GN9673@ediswmail.ad.cirrus.com>
 <19c2d056-4f71-2c4c-c243-cdcc0115876c@redhat.com>
 <20201229150635.GP9673@ediswmail.ad.cirrus.com>
 <20201229151548.GG4786@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <1d982dd1-eb02-e7c7-357e-83cf5003c624@redhat.com>
Date: Tue, 29 Dec 2020 16:40:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201229151548.GG4786@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Lee Jones <lee.jones@linaro.org>
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

On 12/29/20 4:15 PM, Mark Brown wrote:
> On Tue, Dec 29, 2020 at 03:06:35PM +0000, Charles Keepax wrote:
> 
>> There is maybe more argument for porting the Arizona code across
>> anyways, since for a long time Android didn't properly support extcon
>> either. It supported the earlier out of tree switch stuff, extcon
> 
> Completely moving the driver doesn't cause the same problems as the
> current proposal (unless it drops functionality I guess, there were
> issues with adding new detection types into the input layer but I can't
> remember if this hardware was impacted by that or not).

The input-layer supports the following switches:

SW_HEADPHONE_INSERT
SW_MICROPHONE_INSERT
SW_LINEOUT_INSERT 
SW_JACK_PHYSICAL_INSERT

Which is a 1:1 mapping with the cable-types currently exported by
extcon-arizona.c .

I'm fine with fully moving extcon-arizona.c over to only using
sound/core/jack.c functionality and it no longer exporting an
extcon device.

I guess we should move it out of drivers/extcon then though.
I suggest using: sound/soc/cirrus/arizona-jack-detect.c
Note that sound/soc/cirrus is a new dir here. Would that work
for you ?

And I guess we probably also want to change the MFD instantiated
platform-dev's name to which it binds then?

I suggest using: "arizona-jack-detect" as new pdev name.

It will take me some time before I can make time to implement this,
but this is a plan which I can get behind.

Regards,

Hans

