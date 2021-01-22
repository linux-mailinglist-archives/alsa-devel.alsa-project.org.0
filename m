Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D58822FF931
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 01:05:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72D8C1941;
	Fri, 22 Jan 2021 01:04:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72D8C1941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611273910;
	bh=aCuV9E4pl0WKFbeQvyRC7P2Y6ThofBf0lAOcEnMgH0c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p9iCI5x0a/5zx63+8NGTCaSWGARWW/fxYmkltU4UHNQOGBY/VIPMBO5xNh3WBU3hD
	 CDFRCHy3GFw1uGRgKy+K021Vir80wBoLUkmNH1t/3zB7Dv4BVL/G0OUi45TpHVPZje
	 as9DQxrHniKtGgD4+8QJpQnPjNIwAlxdhd1b/KhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A743F80164;
	Fri, 22 Jan 2021 01:03:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5911CF80257; Fri, 22 Jan 2021 01:03:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55107F80164
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 01:03:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55107F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="F9i8v6KE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611273799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ND7fHh4Ed7bL6Z/DJqsvNrBqRdzbBP9LfTYlWL442E=;
 b=F9i8v6KEBJ4Fi97VHTS5n4wfq505XzNWSGMmN/rDxDj411AyHucvfneWNR+H6gfnhxPhbX
 HfMfw6yqRe2I2itAPz4FXqkSnnhZCuCxYSD5xunkELCjrmJM3geonpwsvXJZei21n52dHh
 vT64p0ZL8hfNxt3lhJtevhVGDjJLcrg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-4GTK6qLINYatIbKltxvUbg-1; Thu, 21 Jan 2021 19:03:17 -0500
X-MC-Unique: 4GTK6qLINYatIbKltxvUbg-1
Received: by mail-ej1-f71.google.com with SMTP id f1so1458356ejq.20
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 16:03:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6ND7fHh4Ed7bL6Z/DJqsvNrBqRdzbBP9LfTYlWL442E=;
 b=F/7dy2OQcHgW9s8KbEXLRP/87b5c2DrJ6+sfk6MT5RrYyukrs+d3+tk48XeirIE4zY
 grQsIWSSyVqtv43AmXa8t9OfXX/72iuPjNVB8+y7Vbu45JmCBtq7wPVlqfMbDlZgzuz5
 5WaRUxq9ccO5ESkQvx8w/VglHzDiGiPjHq5dgO60WpasoEefZSgff96kKTun4AzLPZS0
 6ohGeH+Ho3V/go2B3gc65x2MPUGqfJX0Awm5Oib+P0MKF+0LnN3ZJ+zPf7xQMHestpKp
 gPIzllE5uqgoCe18ZJYq5Pf7+xNwommhl1i9TSIq5sShl5ygbN1VTrFVv3attRxd3rzp
 sIKw==
X-Gm-Message-State: AOAM531EQ9larax07k5T4jg9zseruHVVC0845yiiKZjUWZ/bhiGGC7o5
 bgRcl76yByjUeYCkVB5law25Jg7Ckjb1O1+cPBK4IU/aO4IMbUMX0scs3C3HvIFy8xMNa+0iyIr
 cTWkSlDROEfaEYAXqyZQ+dxqA7p9Mf/6vWerVr6ymNis0c+hkNJ0iYWOtlEL55ZQi7hltQf91Q+
 g=
X-Received: by 2002:aa7:d288:: with SMTP id w8mr1222376edq.241.1611273796027; 
 Thu, 21 Jan 2021 16:03:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXi83FqJFHBssya6jEbrG5TNm97wngLlCaCrVjxAFonRfNhfjVMHSsm4DK+9BhS1HAhSolTg==
X-Received: by 2002:aa7:d288:: with SMTP id w8mr1222351edq.241.1611273795775; 
 Thu, 21 Jan 2021 16:03:15 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id t21sm3745387edv.82.2021.01.21.16.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 16:03:15 -0800 (PST)
Subject: Re: [PATCH v2 07/12] ASoC: arizona-jack: Use arizona->dev for
 runtime-pm
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210117160555.78376-1-hdegoede@redhat.com>
 <20210117160555.78376-8-hdegoede@redhat.com>
 <CAHp75Vc92WoJm5T1jbF7UUjCNrVZr2as8ccEWxCZ9aP7z+ZyLA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <d0189116-d110-f91a-afd9-70f323833e32@redhat.com>
Date: Fri, 22 Jan 2021 01:03:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc92WoJm5T1jbF7UUjCNrVZr2as8ccEWxCZ9aP7z+ZyLA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
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

On 1/18/21 1:02 PM, Andy Shevchenko wrote:
> On Sun, Jan 17, 2021 at 6:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Use arizona->dev for runtime-pm as the main shared/libray code from
>> sound/soc/codecs/arizona.c does.
> 
> Can you elaborate switchings from get() to get_sync() in few places

Sorry, those 2 changes really should have been in a separate commit.
I've put the 2 get -> get_sync() changed in their own commit now
with the following commit-msg:

"""
extcon: arizona: Always use pm_runtime_get_sync() when we need the device to be awake

Before this commit the extcon-arizona code was mixing pm_runtime_get()
and pm_runtime_get_sync() in different places. In all cases where
either function is called we make use of the device immediately
afterwards. This means that we should always use pm_runtime_get_sync().
"""

> along with moving disable()?
The enable / disable calls are not moved, they are removed.

Here is a new commit msg which hopefully explains this better
which I plan to use for v3:

"""
Drivers for MFD child-devices such as the arizona codec drivers
and the arizona-extcon driver can choose to either make
runtime_pm_get/_put calls on their own child-device, which will
then be propagated to their parent; or they can make them directly
on their MFD parent-device.

The arizona-extcon code was using runtime_pm_get/_put calls on
its own child-device where as the codec drivers are using
runtime_pm_get/_put calls on their parent.

The arizona-extcon MFD cell/child-device has been removed and this
commit is part of refactoring the arizona-extcon code into a library
to be used directly from the codec drivers.

Specifically this commit moves the code over to make
runtime_pm_get/_put calls on the parent device (on arizona->dev)
bringing the code inline with how the codec drivers do this.

Note this also removes the pm_runtime_enable/_disable calls
as pm_runtime support has already been enabled on the parent-device
by the arizona MFD driver.
"""

Regards,

Hans

