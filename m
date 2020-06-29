Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8763220DCC1
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 22:25:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB0E1165D;
	Mon, 29 Jun 2020 22:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB0E1165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593462357;
	bh=Xj+OAeEJPRoxAJQvEjyRlqMtuHya90D5xrA4ZpvytnM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wzr/Oq19BoidFNVnTU2w8fa4DvlkCGr+WvHnmeUfT05SDLTQhpov2PYTUQZVztYAD
	 aMSNw/yPzryYOhFYo6dEoD4Ss1T4ufoOlEmsroF5ywZmCLyZtfR+WZsZjaeaoPsFL0
	 GFvUg0e93byyP6H8QXNk4v9sbstaTrqwYCow0Mu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C31BF8021D;
	Mon, 29 Jun 2020 22:24:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AD7CF80217; Mon, 29 Jun 2020 22:24:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDBEAF80096
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 22:24:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDBEAF80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="cdlkuLxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593462246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E1djRf7LrueEKextjuIFmqetyXTsY7xMMCBsxoNIO1Y=;
 b=cdlkuLxXO1DxNaMedNHcFvF86RlTr7yZoKbJ7kwI3Pk7tNY94uUebz7D7h3fvthpYmvix3
 iHLV0JC/oFIDA56eKkey1oLT2LD51CXQZxJ/O/7CfklIID8z3NuN0/+MB8qLQMGj1LsEWf
 YKfKfqrsksEsIEY8ZwfXB5SEJTVZ2L0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-txzHpHf5OxmnHxYyB7Loig-1; Mon, 29 Jun 2020 16:24:05 -0400
X-MC-Unique: txzHpHf5OxmnHxYyB7Loig-1
Received: by mail-ed1-f70.google.com with SMTP id 64so15099501edf.2
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 13:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E1djRf7LrueEKextjuIFmqetyXTsY7xMMCBsxoNIO1Y=;
 b=hUq9rC46hf6Urx7XFLbVrbBxK+m4sbf8WxOKqmeZRAyktxKVgBti5q3Pm7VH2Y2zEQ
 ru/cxXbjq3Q0JcCTFrH8pYmgAHZGO7sbeiVQX3JYl7iWm+aUvQvRwzKuPV0YY7Y740VI
 cLX1th825y4ymigDOUXo5bR5YMfJXcx+eEKsbfyDesgzKWSmLrvFEgxShzZH0rphr/wm
 Xwn58jdJju7cX3Mng+YMxWLXXnpd9QWTr1ygDt46NeIfeqQllKxkVSFKvdPnY515d5s4
 Dl9wRTKzFINkTZw/EEvNtGk4ZXBPZZRniv5ZD3FqXK37ta5HvPSV2Fya4/6tW+4f6Avt
 tF7g==
X-Gm-Message-State: AOAM532kH4DDBeYlcxYgAoScv6oROIwrh5jXvUdwFtFJLC8Owrtqu3JC
 2JCBdHJ2THJ1lLy03Ih0yhVBxXoR0MZZ4tvTfNpqZnJ8+77M0ukEnGHsR31o2Bz+KYPfDsCUz8S
 LW+fzAzdrEsTb3ieVEGaTOdY=
X-Received: by 2002:a17:906:46d1:: with SMTP id
 k17mr15131681ejs.446.1593462243349; 
 Mon, 29 Jun 2020 13:24:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwfCD7O2zIpYAHP0WdAYE7OqklYxmjPT15dDaOlVcOWHlc8DGe4HQwK+5qMh+cFx19dfmFBw==
X-Received: by 2002:a17:906:46d1:: with SMTP id
 k17mr15131671ejs.446.1593462243185; 
 Mon, 29 Jun 2020 13:24:03 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id g35sm649800ede.74.2020.06.29.13.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 13:24:02 -0700 (PDT)
Subject: Re: [PATCH 5/6] ASoC: rt5670: Remove struct rt5670_platform_data
To: Mark Brown <broonie@kernel.org>
References: <20200628155231.71089-1-hdegoede@redhat.com>
 <20200628155231.71089-6-hdegoede@redhat.com>
 <20200629200904.GK5499@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <25d7879e-8e6e-40db-78eb-c8dc150d6264@redhat.com>
Date: Mon, 29 Jun 2020 22:24:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200629200904.GK5499@sirena.org.uk>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
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

On 6/29/20 10:09 PM, Mark Brown wrote:
> On Sun, Jun 28, 2020 at 05:52:30PM +0200, Hans de Goede wrote:
>> platform_data is an obsolete concept, instead device_properties,
>> set through e.g. device-tree, should be used.
>>
>> struct rt5670_platform_data is only used internally by the rt5670 codec
>> driver, so lets remove it before someone starts relying on it.
> 
> This doesn't apply against current code, please check and resend.

Did you try to apply this to your for-5.9 branch (I know that was
my own suggestion) ?  I must admit I did not think this through,
this patch depends on some of the changes made in patches 1-4 :|

So either you could add patches 5 and 6 to your for-5.8 branch too,
or it might be best to delay these 2 till after 5.9-rc1 otherwise
we are going to get a merge conflict.

Regards,

Hans

