Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1A4639469
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:09:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C7A617C1;
	Sat, 26 Nov 2022 09:08:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C7A617C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450140;
	bh=rCI3EowLcqoQHUCvkNfkF21xA+XefCElORFm+QkpYEo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uXyS+i+Db7N2+NnRSpzcbrPRUtWOzAC8kLWQKCM3w8inJjFp3l9OnmnygEVnpDWJC
	 bLlpgQFbXvaWw1teKayMdBUNz7nVav3CHMm/uS+l0c2E/sUSJrNKhsVf25UXSWYO+d
	 grDQOqTHilbFqbIAsR+1hL/5TUMyJu8hQnfxeyUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56D23F8061C;
	Sat, 26 Nov 2022 08:59:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F600F8025D; Wed, 23 Nov 2022 14:59:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C35E5F800BB
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 14:59:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C35E5F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iZRqD+AZ"
Received: by mail-ej1-x62e.google.com with SMTP id ha10so6620364ejb.3
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 05:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AJ96Qo939E/LqBCZfcidWQRpLbhFZIXN8NEAiTpAhxk=;
 b=iZRqD+AZI8YXmWPNNo+Fwqqrxkdxxp8sdDhXpzQpS+Z7O6ViZRfqwWBRa1+q6Fn++z
 AayBKunxqdaXyMJwtJZy3prCnDCGQ0bf8s3sNL8v8cU+NRhqFpeFsIofjTg60S/cPv71
 H+sPHuj9u82mvhCqWAi/DQC3hw1wr9h8SadxlGtO1i2opKK+8L4eXSIBcFr67zvlz0zl
 CppQAaJx+cMEavlnguot+la0zcqSDuv3T+S6/PQUa7xI6LA3gJLCSh2MX8CVHkwmdm4o
 1ueE/AeHSGD8djbrX3VA431+kO+OYoaPdqwS1MoX0XoMPIRKU2d/L5Kyjwtu65MvGCmS
 m0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AJ96Qo939E/LqBCZfcidWQRpLbhFZIXN8NEAiTpAhxk=;
 b=wPNhnexa7yB6tJVtJTNRzDl9V/RWKCZjVoV4+usgag1psK5Gz6F2h1NaPMTh0JwboB
 aNQd3UJO4Gf0QSZiMZLpGTqf13+cCC8Ys3ZybJLlt6v0dPkMmJlVhjjO/do6e2Y+3mbu
 mKUvhnWJK/CDVbQ8j4avDym3EGuBSk1tMaACsZcIVqmughhIw3F6NRx+J61I4lUOEZVD
 hAfsZYALuo455l+/2d/4EEbaARuoKCMd0Cw06wcJ7/IFhMfT89RrpJPmVADtkik7C8o4
 TJtDILVDLevdc0asudgPNTdmEBqHlX1lwHn7A+DKxS2GYd8rNNtTUQC4Wwr4xQ087cpA
 91iw==
X-Gm-Message-State: ANoB5pnX804kQ7Dz0v3ArYk/eNkIVK449xGnArJ5yOSkUZncm/En92Uk
 +pKfaufnPK750VAZCk74N1A=
X-Google-Smtp-Source: AA0mqf4zngmNYriYQQf6WQDa/SSuXsv/0hsexE8WPkPKL+mwy2wneQC+ycXRX8UErwxgAKGb3ytkyA==
X-Received: by 2002:a17:906:c30c:b0:7ba:1f48:ccec with SMTP id
 s12-20020a170906c30c00b007ba1f48ccecmr1909635ejz.105.1669211944571; 
 Wed, 23 Nov 2022 05:59:04 -0800 (PST)
Received: from [10.20.0.7] ([37.120.217.162]) by smtp.gmail.com with ESMTPSA id
 d12-20020a056402078c00b0045b3853c4b7sm7741854edy.51.2022.11.23.05.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 05:59:04 -0800 (PST)
Message-ID: <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
Date: Wed, 23 Nov 2022 14:59:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
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
 Dan Williams <dan.j.williams@intel.com>, linux-acpi@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
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

On 11/23/22 14:34, Andy Shevchenko wrote:
> On Wed, Nov 23, 2022 at 02:14:31PM +0100, Maximilian Luz wrote:
>> On 11/23/22 13:25, Greg Kroah-Hartman wrote:
>>> The uevent() callback in struct device_type should not be modifying the
>>> device that is passed into it, so mark it as a const * and propagate the
>>> function signature changes out into all relevant subsystems that use
>>> this callback.
> 
> [...]
> 
>>> -static inline struct ssam_device *to_ssam_device(struct device *d)
>>> +static inline struct ssam_device *to_ssam_device(const struct device *d)
>>>    {
>>>    	return container_of(d, struct ssam_device, dev);
>>>    }
>>
>> I am slightly conflicted about this change as that now more or less
>> implicitly drops the const. So I'm wondering if it wouldn't be better to
>> either create a function specifically for const pointers or to just
>> open-code it in the instance above.
>>
>> I guess we could also convert this to a macro. Then at least there
>> wouldn't be an explicit and potentially misleading const-conversion
>> indicated in the function signature.
> 
> This is an intermediate step as far as I know since moving container_of to
> recognize const is a bit noisy right now. I guess you can find a discussion
> on the topic between Greg and Sakari.

Thanks! I assume you are referring to the following?

	https://lore.kernel.org/lkml/4218173bd72b4f1899d4c41a8e251f0d@AcuMS.aculab.com/T/

As far as I can tell this is only a warning in documentation, not
compile time (which would probably be impossible?).

As I've said I'd be fine with converting the function to a macro (and
preferably adding a similar warning like the one proposed in that
thread). The point that irks me up is just that, as proposed, the
function signature would now advertise a conversion that should never be
happening.

Having two separate functions would create a compile-time guarantee, so
I'd prefer that, but I can understand if that might be considered too
noisy in code. Or if there is a push to make container_of() emit a
compile-time warning I'd also be perfectly happy with converting it to a
macro now as that'd alleviate the need for functions in the future.

Regards,
Max

