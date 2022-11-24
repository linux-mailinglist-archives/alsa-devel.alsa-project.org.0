Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB19637809
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 12:52:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7200416A4;
	Thu, 24 Nov 2022 12:51:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7200416A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669290746;
	bh=q/T7AniVIgc4OZYd56Ga+z8cMoZR9WtfzpPKgoErua0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o2eEkqTXg5Fwhh+Og8Ca4Bl9pm/rWM2roESTCyaJBCyZXMPRmcp366ztnztPqxwac
	 SAGlW06xxrIwQXDR7Z3RVTzv60fM0SHdyKs/8VmT/P2b/H4Dv1NIii1zP2fUgebKDb
	 pfPHcjjTEyKEbW2XBRGX1ZeU+LpFRl2rfmrWy2cY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22FD4F80448;
	Thu, 24 Nov 2022 12:51:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9F46F80245; Thu, 24 Nov 2022 12:51:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE859F80115
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 12:51:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE859F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="KBiG2Tzc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669290682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Upa7JOhV8Luz6o/HTdRR+MHYLEnrm6+OGyDErM/vu0g=;
 b=KBiG2Tzc+P5XywPrOGi1RpKOgO/2juZGZ5ZjGyM/jScPAP52ulQcChBG/xnYwvxE3L9Ecn
 u5iliIcrn7n7knLp1rSSdjUDAE9XlwawG6mELyyLu6GBOKdLdvSOLENilZ1M7eyQxCabIY
 gmV0YQ858eia3ocYqiOQYXwiedXeUk4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-526-wJdM46oSMxSFiR4R-0RcCw-1; Thu, 24 Nov 2022 06:51:20 -0500
X-MC-Unique: wJdM46oSMxSFiR4R-0RcCw-1
Received: by mail-ed1-f71.google.com with SMTP id
 j9-20020a05640211c900b004698365dc84so849194edw.0
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 03:51:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Upa7JOhV8Luz6o/HTdRR+MHYLEnrm6+OGyDErM/vu0g=;
 b=ACbDEfiElmCoUrePvwbjjvXuJf2OH6npSg40Nl81OH8Mn7bp8YX3VJhZwQIXGAemPM
 IPF3kvtD7Dpm5olI8lUtIc/YaUZihytAkb0c7v1VWsNmJkHrtPycm9ljh6guDO9gIfSK
 76K2Qmglh5ADK87VhnfaQCevGeRynHLWdydSo9fThTuO3qiNgoapekrR0r5wz+ALTgbH
 o9uqw5nU6+8uOu1OSKYar19poYncJipbGCjeJFKQmOyUdUPvDVchRlUCLP3T2xY7yZu5
 76dW7PC36ea6hQu+1aGeD9emhPzTOSrUiY/ifp4D7mKqs2jjQUs0rSeId97uHIIdMKHF
 Iv/g==
X-Gm-Message-State: ANoB5pnqLOEFd5RdHQJQ+bseQzeABOYxk/IMJYJ/zgQ7Nf6E9mwqyxnh
 DijwBOlueEs0bZwgHz9fSdIX6PLjvDUhAmxRvb4IBAmL8nX6p78570cb8hl/mpJSWA3WnXe3c+p
 5rgB/LCgNECYtbKvnneczEq8=
X-Received: by 2002:a17:907:c208:b0:7ad:79c0:547a with SMTP id
 ti8-20020a170907c20800b007ad79c0547amr17271765ejc.41.1669290679385; 
 Thu, 24 Nov 2022 03:51:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7zp90EmFXWu2AS+2jsyvw0RuEY/wCJ10Tp+dpiidAQoL7O6kxjm7Rv5tek7hY2r2UaBlb51g==
X-Received: by 2002:a17:907:c208:b0:7ad:79c0:547a with SMTP id
 ti8-20020a170907c20800b007ad79c0547amr17271757ejc.41.1669290679217; 
 Thu, 24 Nov 2022 03:51:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 hs32-20020a1709073ea000b007a8de84ce36sm337523ejc.206.2022.11.24.03.51.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 03:51:18 -0800 (PST)
Message-ID: <51f80121-2e8c-0e8e-6f89-a7dc214207b0@redhat.com>
Date: Thu, 24 Nov 2022 12:51:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 1/2] platform/x86: serial-multi-instantiate: Set fwnode
 for i2c
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>
References: <20221124110718.3925934-1-sbinding@opensource.cirrus.com>
 <20221124110718.3925934-2-sbinding@opensource.cirrus.com>
 <CAHp75VfUqkxyB7J8fbfQKCMaSa55q4zqt7btNb_n5E3-NWhQyg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfUqkxyB7J8fbfQKCMaSa55q4zqt7btNb_n5E3-NWhQyg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Gross <markgross@kernel.org>,
 patches@opensource.cirrus.com, platform-driver-x86@vger.kernel.org
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

On 11/24/22 12:35, Andy Shevchenko wrote:
> On Thu, Nov 24, 2022 at 1:07 PM Stefan Binding
> <sbinding@opensource.cirrus.com> wrote:
>>
>> This allows the i2c driver to obtain the ACPI_COMPANION.
> 
> As far as I get how it's done in the SPI case the real fix should lie
> among i2c_acpi_new_device_by_fwnode(), right?

Eventually maybe, but not for the initial change.

It is complicated, making this change has side-effects
and we want to limit those side-effects to only i2c-clients
instantiated from serial-multi-instantiate for now, see
my other reply to this patch.

I do believe that we eventually want to make this change,
to easily give drivers access to all sorts of info
(e.g. _DSM methods) from the matching ACPI fw-node,
but as I said it is complicated...

Regards,

Hans



