Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB1963946C
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:09:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA50C1843;
	Sat, 26 Nov 2022 09:08:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA50C1843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450171;
	bh=bXtOLVpwHrNZyog7wrYDH0yz3JHwAtc+bFIIplp9HiI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BG3ZmJcDcGQHLLDpqd6CgIg+B1Xu1E8gsMchD3eH0ubwXgCHM7tAtJeo2f5Xz353G
	 1tXEy43FxzrtcqgZ3nJQTYuphzlqD+KTV5BSv6DqPjgiTPvERnQgyXvEhqoIt1fV+I
	 VpTw1DKe4Us92cGZrQww4lyxbYNnoLTqupvfMiHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82184F8062F;
	Sat, 26 Nov 2022 08:59:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4B5CF8025D; Wed, 23 Nov 2022 16:14:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09E2DF80149
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 16:14:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09E2DF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YMJ/LWVH"
Received: by mail-ej1-x62d.google.com with SMTP id bj12so43380800ejb.13
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 07:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hgnV7dzGWIIK4HLAnWBaJEBL2mTLW/I0cvrJZ3aQwLQ=;
 b=YMJ/LWVHtvivchBTzQwnK1vjlMO+Yz1qi3F+5UiPUgfXYsHW97FLmplkkb1fg1J6+K
 goYB9EqDRSGMEVxvnaAeVTF9Lc9Gf4uLBWSxTIzEd4dGukliptoZ4n3exYdegKJZSLxS
 jqqRYMpOfvNhGznAoadCbX01da13AhoRzrTcCdNaWrn84IMP2tAXwxgcb2DgicvEWWfp
 i43A/VFojKzoOpulaS8VMliUQvFXuOXde7c6MUNzuEGgGRk68D/p2retyzW7n9p5jNzk
 Eo7b36EnX4jR3LhMZcShGFxfcBKk4/LQlmgUCRROq02DkIDupJ6I37wpVS8vwAn/gosV
 VeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hgnV7dzGWIIK4HLAnWBaJEBL2mTLW/I0cvrJZ3aQwLQ=;
 b=vRi3gGzOQuCKURMjUCzsTVEHiQd/haz+Y/OS4wq6VI9gpyokt/ksQyHyyqGP29b0hg
 qY201UVLlYqS2vCkw2c4/W0XtvtegkpEty4epSfoiIi866851ZrSPQFLfTbq4yDy/QTF
 dAtS7MQGbCkBB6tUU+wxCiWcoeAf2AzHtffyMgQIrJ7nfxGm04g7P4tQ+T4R3Qgxs0Ef
 r3lQxwW8L1roCRvhmTUwwjSqphGj58SfwWm07o6ssQMlvAofrnnEkEkUVhHoQzI0N3qV
 nesklCOhJlEGSpEmI1cpmAw01V+3xCGZXgOrqiioep+TN6rJljgufi2H1DeMDIUxP2i3
 RxnQ==
X-Gm-Message-State: ANoB5pn+/6PrcVZR9d2l2kP1Mlz0XXiaYm5OsuVI6Dka3phSNbPE9PGZ
 rXiLv3pD3admZa4xSLe1Xio=
X-Google-Smtp-Source: AA0mqf4dYNQ+ZnGLQviZkjaXr5Ekk3BmqKbpbTm6Z2vYCMarSSYwjqBcLfCq2BgNFKCJrb/e5E7t4w==
X-Received: by 2002:a17:906:402:b0:7a6:fc0f:6fe6 with SMTP id
 d2-20020a170906040200b007a6fc0f6fe6mr23229240eja.694.1669216464581; 
 Wed, 23 Nov 2022 07:14:24 -0800 (PST)
Received: from [10.20.0.7] ([37.120.217.162]) by smtp.gmail.com with ESMTPSA id
 ky13-20020a170907778d00b0077a1dd3e7b7sm7251748ejc.102.2022.11.23.07.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 07:14:23 -0800 (PST)
Message-ID: <f96587d1-2610-8702-ba6a-bc15297eb2ab@gmail.com>
Date: Wed, 23 Nov 2022 16:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <Y34zyzdbRUdyOSkA@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:53 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sean Young <sean@mess.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
 Andreas Noever <andreas.noever@gmail.com>, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-acpi@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Won Chung <wonchung@google.com>, Len Brown <lenb@kernel.org>,
 devicetree@vger.kernel.org, Chaitanya Kulkarni <kch@nvidia.com>,
 Ira Weiny <ira.weiny@intel.com>, Michael Jamet <michael.jamet@intel.com>,
 Ming Lei <ming.lei@redhat.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Jilin Yuan <yuanjilin@cdjrlc.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, Sanyog Kale <sanyog.r.kale@intel.com>,
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org
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

On 11/23/22 15:52, Matthew Wilcox wrote:
> On Wed, Nov 23, 2022 at 02:59:00PM +0100, Maximilian Luz wrote:
>> On 11/23/22 14:34, Andy Shevchenko wrote:
>>> On Wed, Nov 23, 2022 at 02:14:31PM +0100, Maximilian Luz wrote:
>>>> On 11/23/22 13:25, Greg Kroah-Hartman wrote:
>>>>> The uevent() callback in struct device_type should not be modifying the
>>>>> device that is passed into it, so mark it as a const * and propagate the
>>>>> function signature changes out into all relevant subsystems that use
>>>>> this callback.
>>>
>>> [...]
>>>
>>>>> -static inline struct ssam_device *to_ssam_device(struct device *d)
>>>>> +static inline struct ssam_device *to_ssam_device(const struct device *d)
>>>>>     {
>>>>>     	return container_of(d, struct ssam_device, dev);
>>>>>     }
>>>>
>>>> I am slightly conflicted about this change as that now more or less
>>>> implicitly drops the const. So I'm wondering if it wouldn't be better to
>>>> either create a function specifically for const pointers or to just
>>>> open-code it in the instance above.
>>>>
>>>> I guess we could also convert this to a macro. Then at least there
>>>> wouldn't be an explicit and potentially misleading const-conversion
>>>> indicated in the function signature.
>>>
>>> This is an intermediate step as far as I know since moving container_of to
>>> recognize const is a bit noisy right now. I guess you can find a discussion
>>> on the topic between Greg and Sakari.
>>
>> Thanks! I assume you are referring to the following?
>>
>> 	https://lore.kernel.org/lkml/4218173bd72b4f1899d4c41a8e251f0d@AcuMS.aculab.com/T/
>>
>> As far as I can tell this is only a warning in documentation, not
>> compile time (which would probably be impossible?).
>>
>> As I've said I'd be fine with converting the function to a macro (and
>> preferably adding a similar warning like the one proposed in that
>> thread). The point that irks me up is just that, as proposed, the
>> function signature would now advertise a conversion that should never be
>> happening.
>>
>> Having two separate functions would create a compile-time guarantee, so
>> I'd prefer that, but I can understand if that might be considered too
>> noisy in code. Or if there is a push to make container_of() emit a
>> compile-time warning I'd also be perfectly happy with converting it to a
>> macro now as that'd alleviate the need for functions in the future.
> 
> Can't we do:
> 
> static inline const struct ssam_device *to_ssam_device(const struct device *d)
> {
> 	return container_of(d, const struct ssam_device, dev);
> }

There are at least a couple of places (device/driver-management and
device-removal related, I think) using this function and requiring
non-const access.

A bunch of other instances could be converted to const-access only, but
that would require a couple more function signature changes (I should
probably set up a patch for that regardless of this here as being a bit
more strict about this makes sense).

Regards,
Max
