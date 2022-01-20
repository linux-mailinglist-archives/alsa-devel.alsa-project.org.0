Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D19149544D
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 19:40:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD7B12D8F;
	Thu, 20 Jan 2022 19:39:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD7B12D8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642704044;
	bh=dBMQZEw0weGJSpfVW1GK/+I0f5msLItYZg/RC5l3WRw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rIuv6RGKECa1sKhnX43RbyYLqA3yLvPdYgm7r46x+54LQrjz60kQVeby5KJaLAWaI
	 cePrJux2TJP68jjw7SzpfALKVHY/1Df58hUrQKnZ+QsIaCVgazqGPnf91EHiVI1fpN
	 H1Y9GSvt90307eomtHqlECC+GWNfejZrBT8YvQRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67A75F8007E;
	Thu, 20 Jan 2022 19:39:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F367F8012E; Thu, 20 Jan 2022 19:39:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44846F800F8
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 19:39:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44846F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="DJg1T1l0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642703972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2Tr2w2KhGLaZjzwWbGdnBD9ERdi9Y6i7NykFHXA0GU=;
 b=DJg1T1l0r2v2BCv4Djy7hNpSiGb9FjXptb0RATcAYJjNBa5Sg/LpM+cUqH5BZY35u+FQL/
 8iPBWRW9PlC7UmmauHxY1GSzZiBmzgpfo4PZLnLbehM42Wr/vQlFPjwQufTliVnIYb+Fu4
 leyxQqiWh+LgLee4MO7wFffMxwfmcUM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-cP5wzBNNOo2UtxkSr20VCA-1; Thu, 20 Jan 2022 13:39:29 -0500
X-MC-Unique: cP5wzBNNOo2UtxkSr20VCA-1
Received: by mail-ed1-f72.google.com with SMTP id
 z9-20020a05640240c900b003fea688a17eso6721456edb.10
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 10:39:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y2Tr2w2KhGLaZjzwWbGdnBD9ERdi9Y6i7NykFHXA0GU=;
 b=mvF2GW2+A4Bk+aicIDhjWwnFs32xso3ZDvAIy6ICyQLNpLB4FABLdGTwLtVtNV8HaE
 dH0lJ040dLqkW5tOcPQohQXKi0WIazFgNAx8xBIO0n1+ziQqts+BeV4DwHw17jT1tZol
 j8pMlytGacQeqiRCb/M1POvvm8MknKSYal8nUNX/JzrmhZ3rmlUn4BBS5A+Xpvg63b9U
 kKx2IVQGbjDce1NdbUMFTTjKLxloly0dJaKqer4m8OOq1XLLMeJYAlzDsDwbJC01Y+pS
 n+gO/oTgdlee05MceNR/olRh1MzA0mtgnHBgx0f1v3oFHA4U3U2pguFLfZuwybhXKyLb
 Ddsg==
X-Gm-Message-State: AOAM530AHs5lXjt1qzNrQAS/vsbFqcgszR6ge/qzb9aeLGYp7xTu1562
 6PgsGIT1iXC5C6Z1xfijgKpSmvoI97kHiennLLbbNyezHUVdziD+Yxmi4NldTWQwArlMcQ++7zJ
 mUKFTMEkr60hBELDYHa38g2I=
X-Received: by 2002:a05:6402:1855:: with SMTP id
 v21mr419087edy.328.1642703967838; 
 Thu, 20 Jan 2022 10:39:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfZxreaov7LMsQlBiYl+OTguKs/iaak+cSZJpL1mSTLbNg3ad9XAhJtXWD4vipGEMND/YNtQ==
X-Received: by 2002:a05:6402:1855:: with SMTP id
 v21mr419077edy.328.1642703967706; 
 Thu, 20 Jan 2022 10:39:27 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id a26sm1294715ejr.213.2022.01.20.10.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 10:39:26 -0800 (PST)
Message-ID: <c75198ce-8d59-d81c-8355-8beca7bc8136@redhat.com>
Date: Thu, 20 Jan 2022 19:39:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 5/9] platform/x86: i2c-multi-instantiate: Rename it for
 a generic bus driver name
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Stefan Binding <sbinding@opensource.cirrus.com>
References: <20220120134326.5295-1-sbinding@opensource.cirrus.com>
 <20220120134326.5295-6-sbinding@opensource.cirrus.com>
 <CAJZ5v0hMdfnu5PUk3sPvzF_f+xvWaRkE=BUpSAFx_DJ9sB+JDw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0hMdfnu5PUk3sPvzF_f+xvWaRkE=BUpSAFx_DJ9sB+JDw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Gross <markgross@kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com,
 linux-spi <linux-spi@vger.kernel.org>, Len Brown <lenb@kernel.org>
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

On 1/20/22 19:34, Rafael J. Wysocki wrote:
> On Thu, Jan 20, 2022 at 2:43 PM Stefan Binding
> <sbinding@opensource.cirrus.com> wrote:
>>
>> From: Lucas Tanure <tanureal@opensource.cirrus.com>
>>
>> Rename I2C multi instantiate driver to bus-multi-instantiate for
>> upcoming addition of SPI support
> 
> TBH, I don't particularly like the new naming.
> 
> Namely, the "bus" part seems overly generic (and the "bmi"
> abbreviation brings something totally different to mind).
> 
> AFAICS this can cover serial interfaces only and specifically the ones
> where serial links can be represented as resources returned by the
> ACPI _CRS object.
> 
> I would call it serial-multi-instance or similar.

serial-multi-instantiate works for me. That also nice matches
up with the ACPI_RESOURCE_TYPE_SERIAL_BUS which acpi/scan.c
uses to detect these kinda resources.

Regards,

Hans



