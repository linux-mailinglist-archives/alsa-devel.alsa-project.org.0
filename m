Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A23DC38D717
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 21:01:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C5AC1682;
	Sat, 22 May 2021 21:00:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C5AC1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621710062;
	bh=JFS3FyCquLPUPgVoyQBoWrDB6yHrFB8XYU+6CGj4+XY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uO76p3J/xip24dH1CrmyFQ5ls2j83psVee22msZoglrT6yP0/27mJrYCZyfULrVmJ
	 6T2DLMDjXPrEFCS7NOHYB2pdpWKMY1ol5FHdx70j+X/vjqO4iqs3CnSaZ1Q0Oqd/N3
	 cTYp0UQpabWOyDKLzdOU8kEjvoxZMbKfxEsZyUqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4488F80229;
	Sat, 22 May 2021 20:59:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1A90F80217; Sat, 22 May 2021 20:59:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB17CF80153
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 20:59:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB17CF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="AkVFSLeC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621709967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QxC/Wf7jSJzdkmQnLLsHKhYhaWILzajKsVMVqng36Ps=;
 b=AkVFSLeClktLa9qwmb1VQNmAxit6+00rz82wNJGbbvVs/DT8dlpOwB1NMeIyM//MZ/bAvU
 k3G2pG4O+2haR/hV0uTHygiH2PY4yUgaDgmtQ/ikVNgrTEgPTrEloKpjdJ5mEMgu1BrKmq
 +IP/0TavYMirFL6ZQ1iM6yfPiQ0hOnA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-eSTD_rFxOhG3LTXZMyS9zA-1; Sat, 22 May 2021 14:59:23 -0400
X-MC-Unique: eSTD_rFxOhG3LTXZMyS9zA-1
Received: by mail-ed1-f70.google.com with SMTP id
 ba15-20020a0564021acfb029038d3b33d7ffso10578452edb.23
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 11:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QxC/Wf7jSJzdkmQnLLsHKhYhaWILzajKsVMVqng36Ps=;
 b=jCyElX5/Dy/zYFy2+W2mbYTKLlUMI/jyiZitupCJoM5tArQg8Qe+1hAfr7skjwUxwV
 jdMAxuKOjJjKJH5S6LdOupviR5wk4ikgGAm3XyQK/zjuvUf5k/ZjTsMMMKoSafFjwonA
 l/gzITnKQFYGJBO0f0gnQz/faeCZqVAtV56WbAui342Kchr+GxtHgNK7cnpCAfe+JYKr
 +2WHjhUaFB00twCPyaPOV5OuU1TCyGVHSeLBijuRso6yPYyUIX1wj0m7FRwwm1CvAk2l
 ZWQFruNStFD3+oe5XtWT7/w1K5KeilOxqR+AXuUi2Xl41DqjxdUxXtNWwlgRHoXtf1+1
 znDA==
X-Gm-Message-State: AOAM532fpbcV4MT4I0RKUrmRx0jvwS9N9OqZhTTxhp1dNLdtpgJGI5HD
 n2XoZAbDgmvdsaxlYPaXNvcNCfgS+K/CK7Pbe937k79M6zwOOJJsh/HpKzbCKZQyafdTyH0ck5N
 RP2B1TUiDhdO+9O5g50HyldLQIVfban5L/j1SBKg/zNRf9gn8vwGDBYDqvZpYutHHKp/MOcrDnv
 Q=
X-Received: by 2002:a05:6402:1c97:: with SMTP id
 cy23mr17648245edb.213.1621709962034; 
 Sat, 22 May 2021 11:59:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOERy4cTDs7RSotWaJMAqZJP24uoWXS48eRhBEIoxF1UKEU2Vm6jV0Gsn939GVtpoQfvtEMQ==
X-Received: by 2002:a05:6402:1c97:: with SMTP id
 cy23mr17648226edb.213.1621709961898; 
 Sat, 22 May 2021 11:59:21 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id m13sm6817462eds.21.2021.05.22.11.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 May 2021 11:59:21 -0700 (PDT)
Subject: Re: [PATCH 4/8] iio: accel: bmc150: Add support for
 dual-accelerometers with a DUAL250E HID
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210521171418.393871-1-hdegoede@redhat.com>
 <20210521171418.393871-5-hdegoede@redhat.com>
 <CAHp75Vf_itoC8hiacBPXLK73NLbFre58b=wmVdEbviwEj0ZHHA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <9df6f2a8-cb41-5fd1-c56e-b72fb129e758@redhat.com>
Date: Sat, 22 May 2021 20:59:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Vf_itoC8hiacBPXLK73NLbFre58b=wmVdEbviwEj0ZHHA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-iio <linux-iio@vger.kernel.org>, patches@opensource.cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jeremy Cline <jeremy@jcline.org>,
 Mark Brown <broonie@kernel.org>, Jonathan Cameron <jic23@kernel.org>
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

On 5/22/21 8:11 PM, Andy Shevchenko wrote:
> On Fri, May 21, 2021 at 11:23 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The Lenovo Yoga 300-11IBR has a ACPI fwnode with a HID of DUAL250E
>> which contains I2C and IRQ resources for 2 accelerometers, 1 in the
>> display and one in the base of the device. Add support for this.
> 
> ...
> 
>> +       board_info.irq = acpi_dev_gpio_irq_get_by(adev, NULL, 1);
> 
> If NULL will be there after the series, why not to use
> acpi_dev_gpio_irq_get() directly?

I looked in drivers/gpio/gpiolib-acpi.c to see what is available
and that is an inline helper in include/linux/acpi.h, so I missed
it. I'll switch over in v2.

Regards,

Hans

