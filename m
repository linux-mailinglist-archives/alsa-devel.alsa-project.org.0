Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7C32CFC3E
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 18:09:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4C07183D;
	Sat,  5 Dec 2020 18:08:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4C07183D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607188188;
	bh=+dN6pcggXvOLAu+3bVnEMaqPgedVv39OZjluGpCbUaA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WqdKG/TwpVd27Bw2qOvqs3iszhGeJxZA5TdEeiemI1RO6vXeL4xY6okw+ZXCShww4
	 bBb4nl79ug5hYNVRwjf0QxTgwlV2eUgBSOTc7e1mMksCi9IxR8jUzb69sdGI5ZdCzv
	 OIDDDWBxiEANYwh6laZsKu/2QVi8UMevRSRHE3Ig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7AC8F800E2;
	Sat,  5 Dec 2020 18:08:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13670F8016D; Sat,  5 Dec 2020 18:08:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA74AF800E8
 for <alsa-devel@alsa-project.org>; Sat,  5 Dec 2020 18:08:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA74AF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="O5b3z3iF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607188087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/kYDzaXjgsloBBA3uNwXi2lvZS3l1mNkVoc7CH0uH8c=;
 b=O5b3z3iFurYCqGbM4tq42n1SVPofm72fDW2AZZSGuMHXkyyJS1ZSix5p0MHeaypUJ1Wi4u
 E8isr14PCcLtIVYEqZO5HJdxoLqE3fPztLx8nqq7r0ISLKwPDzyLhLBhDzMcKLNirYBPZb
 ljcz1Qok8qXo12KRDYvjA3EH7Ae5Css=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-Gd2wPQD8MqaQSKgU8kbkFg-1; Sat, 05 Dec 2020 12:08:05 -0500
X-MC-Unique: Gd2wPQD8MqaQSKgU8kbkFg-1
Received: by mail-ed1-f69.google.com with SMTP id i15so3737183edx.9
 for <alsa-devel@alsa-project.org>; Sat, 05 Dec 2020 09:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/kYDzaXjgsloBBA3uNwXi2lvZS3l1mNkVoc7CH0uH8c=;
 b=IV4S0ioXuNBMRjvXbbjZYmItEJvZ18nBtBGQ+HBkQuVYRPG+3Viw0bJDPuLayHTW5l
 79cJrchir2laoPrk0Z9n2fON+AyUP70xC9VP+zwzr49jZ/SjAqYWdneJBLDENphIeFW+
 l+j8Zntiq+sAKLPI7mjndM7JT0iBBtolazUyDW5G7yPnyLHzff1INkv86uxiVpjXCm+f
 oiGPEtdNkCZjBXdJ8hSSA7e4+AVMFECBlW+OnTmzV5VLRnPSxqhoaNMSV8x/g7XzSZaI
 opKsURoVFxQkCMrZUi5q/dLGXR1iXvsZ1xkfQAlaPtawizsEyeb2wo1aGyyLwpco0NRi
 vWHA==
X-Gm-Message-State: AOAM532jnAYfOrdu3p2WXcV+wh8XkE4iebssVPtzn6wU6QT13+gQHyVr
 wwkeozGxt0c31WDj+JdH6rwFBl3kkoD/J+0/j/gdjt7qlbpXrxMsdX9U0v6Y0LH03W3qOTtCxze
 DyQdtLWF5ku2oWVYMDDqT918=
X-Received: by 2002:a50:9344:: with SMTP id n4mr12748365eda.85.1607188084250; 
 Sat, 05 Dec 2020 09:08:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3Pe7DfR7ZCFgcmiW6IShpoHj4cp1lQO3wWwPIsTGqzXt6F5bdDg/8at45NhUIAHWPzzy6pw==
X-Received: by 2002:a50:9344:: with SMTP id n4mr12748349eda.85.1607188084073; 
 Sat, 05 Dec 2020 09:08:04 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id n1sm5519420ejb.2.2020.12.05.09.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 09:08:03 -0800 (PST)
Subject: Re: [PATCH] ASoC: pcm: send DAPM_STREAM_STOP event in
 dpcm_fe_dai_shutdown
To: Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
References: <20201202193343.912942-1-ranjani.sridharan@linux.intel.com>
 <20201203143117.GF4700@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <7053e79c-7b68-c04e-73de-bc6efdbf27b9@redhat.com>
Date: Sat, 5 Dec 2020 18:08:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201203143117.GF4700@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 12/3/20 3:31 PM, Mark Brown wrote:
> On Wed, Dec 02, 2020 at 11:33:43AM -0800, Ranjani Sridharan wrote:
>> A recent change removed the call to send the DAPM_STREAM_STOP
>> event in dpcm_fe_dai_shutdown. But this causes a regression
>> when a PCM prepare is not paired with a hw_free. So, add
>> the DAPM_STREAM_STOP event back to dpcm_fe_dai_shutdown()
>> to fix this.
> 
> Hans, does this fix the issue you were seeing?

Yes I can confirm that this fixes the errors which I was seening with asoc/for-5.11:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

