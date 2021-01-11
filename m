Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F592F1E50
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 19:56:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE6421710;
	Mon, 11 Jan 2021 19:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE6421710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610391363;
	bh=nSEcBSpGjdUw/N7IV/KQ30OyHCdl3cldfKUMvEy3ZfI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eMozbqstlEqI1ezDov3kIne2/dDj1ynt+OEbESmX4D5gH2olSJ5yBcl36m0dK1mYd
	 pSkxFHeTzkO1chebCrRj1UraEHMCnpxedOzPWXOadxTaJpfnv9sPEkyihEY3YwGYR2
	 mFJH5YLH4O/y/6sxBG+EMiwZApl/YEqlsN7cAZKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EECF0F80254;
	Mon, 11 Jan 2021 19:54:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BDB8F8016D; Mon, 11 Jan 2021 19:54:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C21E3F8013D
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 19:54:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C21E3F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Po5rRmSL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610391261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uN8LVAFq57erg1VZoogi4pvvwx0ELMzBGbyuGNoOJNQ=;
 b=Po5rRmSLpjT8pjl9UkZAhXGq11XnGkkb9tyuMvuLe84srZhblalCQ4HqBX5WRFStVitR5K
 bvMyLSUK+4jOI8N5MbuNfNMeVQ8e/2h/EyUaQ3Y0Gwg+Orlv4VgzN7KiLW4h7BamQVPKs0
 Td3dtOAVUTJ+Dx8E125S12c02/1GpZ8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-EbzvPXQ8NBqTtszxIPYqTg-1; Mon, 11 Jan 2021 13:54:17 -0500
X-MC-Unique: EbzvPXQ8NBqTtszxIPYqTg-1
Received: by mail-ed1-f70.google.com with SMTP id dc6so98655edb.14
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 10:54:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uN8LVAFq57erg1VZoogi4pvvwx0ELMzBGbyuGNoOJNQ=;
 b=bsXMNTgDyICQPDW1lb/gImhVFn2GXzVGR7cQ/3xLmDnazCBwqKwQTQv7xZFO3VjSgY
 lLy5jLOHc5ISExfRNWvnSIaw6jxP83oNPWIQ4GQJ+g0dIaTvreomg8oQX3NUBIY4dlnZ
 c1kPGZjoCCUOXT2rdhDccb/8qkEUjkA6EI6ec5M9luCXZxmg9UkO/Ud5+D5QcgYutgOQ
 BNuqDOgHDwjy07g6cvP3WutP9VstkinJoDCZqRimtpyrC94JrbaXd7Us5ug1+zb6j5p7
 Csk1S3c66F59HC/bhDRHEtaV6qpT3D3Z9ZqdW48E8nf+SR90nN3hUV23hW6rJta20TFu
 JQ8A==
X-Gm-Message-State: AOAM533ma9hMXJkLomElZuU1/UWD7qDM25ue2nEJFnfDY0GaQLfnuVSI
 ZIv/vShc7ZzOovqrGPu8FOB3izqREtQ5+7Y8HsZsca9F050EthMCeOCjRX/LiAjWiGBHTqdgSqZ
 CAVOEGtTR6YnVimm/y88J26xnScFaw4ZUcezidx3sZvwIwBCSTKXSFdDylzs3RaIPcHeZ3GQxo3
 A=
X-Received: by 2002:a17:906:fb1a:: with SMTP id
 lz26mr618251ejb.194.1610391255786; 
 Mon, 11 Jan 2021 10:54:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVXqLUxJh5i0c1UI1w2DoRmg/BYR5TJnoaTSIEr6tFF0zm1S8TKTiTVqTLEmyXNS1iRoH3pA==
X-Received: by 2002:a17:906:fb1a:: with SMTP id
 lz26mr618229ejb.194.1610391255588; 
 Mon, 11 Jan 2021 10:54:15 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id z10sm201661ejl.30.2021.01.11.10.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 10:54:15 -0800 (PST)
Subject: Re: [PATCH 00/14] MFD/extcon/ASoC: Add support for Intel Bay Trail
 boards with WM5102 codec
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <CAHp75VcMGjhuNWgVx6Jn6vGCN8pvPO5ePz7oprabhiW=Ffc_rg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <ab291026-4e4e-7ab7-246a-f85001092a32@redhat.com>
Date: Mon, 11 Jan 2021 19:54:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcMGjhuNWgVx6Jn6vGCN8pvPO5ePz7oprabhiW=Ffc_rg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Mark Brown <broonie@kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
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

On 12/28/20 3:19 PM, Andy Shevchenko wrote:
> On Sun, Dec 27, 2020 at 11:15 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> This patch series adds support for Intel Bay Trail based device which use
>> a WM5102 codec for audio output/input. This was developed and tested on a
>> Lenovo Yoga Tablet 1051L.
>>
>> This series consists of 3 parts:
>> 1. Arizona MFD drv patches for ACPI bindings, better jack-detect support
>>    and misc. fixes
>> 2. extcon-arizona driver fixes and improved jack reporting (this depends
>>    on the MFD changes)
>> 3. ASoC patches in the form of a quirk for BYTCR detecting, a new
>>    machine driver for BYT + WM5102 and jack-detect support for the new
>>    machine driver (which again depends on the MFD changes).
>>
>> Given that 2. and 3. depend on the MFD changes I believe that it is best
>> if all patches in this series are merged through the MFD tree (once
>> reviewed and acked) and then Lee can provide a immutable branch for
>> the ASoC and extcon maintainers to merge into their trees.
>>
>> I have a patch with matching UCM profile changes available here:
>> https://github.com/jwrdegoede/alsa-ucm-conf/commit/316109e7814926ba984322c1d9190575fab9021c
>>
>> This series + the UCM profile has been tested with both the SST and
>> SOF ASoC drivers for BYT devices.
> 
> Thanks for fixing this!
> I found the series pretty much in a good shape (only two patches I
> think need a bit of work), FWIW
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> after addressing comments.

Thank you, because of the jack-handling discussion I've extensively
reworked this series (and I'm going to split it into 2 series for v2).
I've kept your Reviewed-by: for the patches which are >= 99% unchanged
from v1. I've not added it to a whole bunch of new patches (and some
other patches were dropped).

>> BugLink: https://github.com/thesofproject/linux/issues/2485
> 
> Shouldn't this be somewhere in the "main" fix? (Yes, I understand that
> it may sound silly and should be copied to almost half of the series,
> but if there is a good place it would be nice to have in the Git
> history)

Ack. I've added this to the:
"ASoC: Intel: bytcr_wm5102: Add machine driver for BYT/WM5102"
patches' commit msg now.

Regards,

Hans

