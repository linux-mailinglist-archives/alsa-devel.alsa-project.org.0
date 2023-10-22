Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4075D7D231F
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Oct 2023 14:54:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3DDD201;
	Sun, 22 Oct 2023 14:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3DDD201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697979243;
	bh=7WK6x0DalcDHfRBw45qm1uftJFNrcz+wp52p6Q+J4tg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MZjU994XxThSe2yB3qtx0vGofCRQiuQhhEXRduBUqOya6va2xul1d8V7PcuaePq0+
	 mDbgnL5LIIz/EDaA52bP/bFOUJBAM6B7bsaRcwGRdBdFo5ZIe6OTUPhcxEUTnb+nsn
	 TYkpk0cpSyVCXhEVcMYjwjM0T8bWLIvbq+97r2X0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43DE2F80558; Sun, 22 Oct 2023 14:53:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F18EBF8032D;
	Sun, 22 Oct 2023 14:53:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66059F804F3; Sun, 22 Oct 2023 14:53:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 190DDF8024E
	for <alsa-devel@alsa-project.org>; Sun, 22 Oct 2023 14:52:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 190DDF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=c25RfbE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697979177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8mNmvCbAT0TAM9wjamIFYDBn/ptBM0XM2ykNLILbdd8=;
	b=c25RfbE9a9Oy2zsscUTKd3w0QVy7DzUEgBe6R4XLzpY7dVzg1KhVBCLzzE5v/1ObtFBScG
	JFIhHRbHKCfUuaoRZm+pigY+oUGKX7BIlMqJ61Q9bV84+VU0wuAoP1XSVm3i2/WMbUoTwY
	nx32muUUhULhkd1igxP6taXYwGrIL1k=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-JemylddfNhe2pxjUKGMcKQ-1; Sun, 22 Oct 2023 08:52:45 -0400
X-MC-Unique: JemylddfNhe2pxjUKGMcKQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-53e2acda9d6so1421881a12.2
        for <alsa-devel@alsa-project.org>;
 Sun, 22 Oct 2023 05:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697979164; x=1698583964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8mNmvCbAT0TAM9wjamIFYDBn/ptBM0XM2ykNLILbdd8=;
        b=aAWu+2S7LGpBWQ+xEfS5jBMytovspwO3HHslLAGE4D3VnRLnKijhOAAvMJ6FOPI5fR
         CUutEAVjGzszjGKzmHgPb1T3AOXI/xl0DcDbMz34eHAxY8+/SYVj7yp+MX8Ie8lUyP86
         46mX9SZvC12AAcPI8kxz3MMvU411qPagxrVT4KBOXyx3D9pRki7nzMQvGYU0WXeCfpmk
         BKYixwjKXgs0OULtFcDCFk4gfE9RnOv7KjJ1p8r7cDgt37yOgV2Axin+e6ZHsj1kXgQP
         6BW+2u0FwUFUta0eKoCzO8kFbLd0z1z4tmDXSitsiOogYGx783V5fbHf9amJ2ynVJTAm
         wvCw==
X-Gm-Message-State: AOJu0YwCzJKbSevONSfI8LHALGgKFBDQ1pdViSkdkyWcHzoSwwGCkr+O
	pYuO5nEb2GgReMqIPMZTZAfZdpEScVLbcTkQDCqKshEV0W64UHnR3deBS5uLeJQcaSzf5GjSBeY
	hqT3rEzFxYRPSsApULCjD2fY=
X-Received: by 2002:a50:d597:0:b0:53e:395:59d with SMTP id
 v23-20020a50d597000000b0053e0395059dmr3971446edi.8.1697979164119;
        Sun, 22 Oct 2023 05:52:44 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IFJmw82cpfTbR81uCD3ZzvLbXt3p1PBviiV+OKdZVawJZSBxjiQxak51anrS2JvH1t8HMVnGA==
X-Received: by 2002:a50:d597:0:b0:53e:395:59d with SMTP id
 v23-20020a50d597000000b0053e0395059dmr3971433edi.8.1697979163817;
        Sun, 22 Oct 2023 05:52:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id
 d23-20020a50cd57000000b0053defc8c15asm4899921edj.51.2023.10.22.05.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Oct 2023 05:52:42 -0700 (PDT)
Message-ID: <a07c183f-76cd-6cc9-5eba-0fd6a62dad3a@redhat.com>
Date: Sun, 22 Oct 2023 14:52:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: soc-core.c: Log components string to help with UCM
 profile development
To: Jaroslav Kysela <perex@perex.cz>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
References: <20231021211710.115239-1-hdegoede@redhat.com>
 <3dbee1fa-87c2-d6ee-64d3-f2c97928797d@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3dbee1fa-87c2-d6ee-64d3-f2c97928797d@perex.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: J2KCZXIRQL7DM7OKWS6LTC3YWMEGWNFK
X-Message-ID-Hash: J2KCZXIRQL7DM7OKWS6LTC3YWMEGWNFK
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2KCZXIRQL7DM7OKWS6LTC3YWMEGWNFK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Jaroslav,

On 10/22/23 11:21, Jaroslav Kysela wrote:
> On 21. 10. 23 23:17, Hans de Goede wrote:
>> Various ASoC board/card drivers use a components string to communicate
>> to userspace which output (speakers / headphones) and input (internal mic /
>> headset mic) routes have been setup by the card driver so that the UCM
>> profiles can dynamically adjust to this.
>>
>> ATM it is sort of hard to figure out what the component string has
>> actually been set to by the kernel. Log the components string set on
>> the snd_soc_card to help with UCM profile development.
> 
> I don't think that it's hard to invoke command like 'amixer -c 0 info' to view the components string.

Ah I wasn't aware that this info could be easily retrieved with
'amixer -c # info'.

But since I know now I don't need this patch anymore, so lets drop this patch.

Regards,

Hans


