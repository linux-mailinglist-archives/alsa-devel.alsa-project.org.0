Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8518485261
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 13:24:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D36E18C7;
	Wed,  5 Jan 2022 13:23:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D36E18C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641385451;
	bh=ipFYCr5X/883FW8KcIV+LGhind/bLa/2y281TgrASNg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pj13iBzbJahwG+xr+dncyMdD6H90mp4aN6iwa2qKR8CBiRYhwStUuxibd4++OE5T+
	 kWpPXUh3Zxqbl+RH0s+R0O5p0zi2fY2M25mYCSQji/FqE5uR49KxQsyq83f5FU+DAp
	 t6uWuBRdGCjUVz37c+MV6rUNYVla75epc9NHU8nM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E858F8007E;
	Wed,  5 Jan 2022 13:23:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD487F801D8; Wed,  5 Jan 2022 13:22:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55F57F8007E
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 13:22:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55F57F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="ZNHfFJ/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641385370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gRvRJIgsY26oTF6IBVH3wTS3d0//6JJ897QvtoKw37M=;
 b=ZNHfFJ/xAIanVPwUiRe+ZTQH4qZZ8sFQL2Fg7KWtFhix1LpWTK0cq573jezCPLK3BgRryU
 BrimeeLfEMHf/9um0ak8BHyeQvcoITiOU0ZbBe1hv6++m8YYcmfUHC+d30WidnRvLuY3Q4
 rA23JVCyIOKBLOKk9iTXOhndCuPohqg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-HUF0nQSUPOWzcb1NpHqP3w-1; Wed, 05 Jan 2022 07:22:49 -0500
X-MC-Unique: HUF0nQSUPOWzcb1NpHqP3w-1
Received: by mail-ed1-f71.google.com with SMTP id
 l14-20020aa7cace000000b003f7f8e1cbbdso27757405edt.20
 for <alsa-devel@alsa-project.org>; Wed, 05 Jan 2022 04:22:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gRvRJIgsY26oTF6IBVH3wTS3d0//6JJ897QvtoKw37M=;
 b=lI8wGFhzWYtnTJo0lrWRFr8s6Fxv8Uc0gGa2ghoHpziBRyX0thAwIfzXP2q76gA5Fu
 +OGcv7p0uZdBFRRng300ohZSVCroAxIeYKNLXbKe9y673CDp5CTA1fXce5DwFJY5WPUg
 F7r4XDGtH3BJJVRlxvrbivjm56WhHyGfDSt5i6ifIhFyn+r1yvDT1V6S1EfFb9vZfqk7
 RHTN/QZu5t3IIflMT2LbQRDEwjufzAo4xv/Z6jN/MWIM1FJSVXSNCocbOR71Mj3uYAgG
 r66yT8kqZtm2tRl+MGmc6HVKz5eJtMiPNcGcAeibJ/5ZluZpKX1dHD3wXjU2dvAM8sS1
 FyJg==
X-Gm-Message-State: AOAM533FZz9SvdeE+3DnNPNbxE2BfW6/kVXn3zb2HRqeENiVjNuYRVPq
 ElTVNy7Y0gHW9k/Ca4UOg1Bu1EZhxTZXKI3Rn61Un3ZmeLwonOZbs72aKrAdIUbEnx3YpcQJsXS
 Darr090Cwdck0ebteNoe9h7w=
X-Received: by 2002:a17:906:b003:: with SMTP id
 v3mr42786717ejy.770.1641385367429; 
 Wed, 05 Jan 2022 04:22:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3UUcSX7lALS9KOkBsU6F68Plo/OkwdLTHtaQvpCwbAquA3rQ2CyMfg4oAa1GELLnK9KcFtg==
X-Received: by 2002:a17:906:b003:: with SMTP id
 v3mr42786709ejy.770.1641385367300; 
 Wed, 05 Jan 2022 04:22:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id d1sm12362454ejo.176.2022.01.05.04.22.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 04:22:46 -0800 (PST)
Message-ID: <2e4d97a1-339f-d7d2-eca0-d6c70f31d429@redhat.com>
Date: Wed, 5 Jan 2022 13:22:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/5] ASoC: rt5640: Allow snd_soc_component_set_jack() to
 override the codec IRQ
To: Mark Brown <broonie@kernel.org>
References: <20211227153344.155803-1-hdegoede@redhat.com>
 <20211227153344.155803-2-hdegoede@redhat.com>
 <Yc8EMRxc07NphgcR@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yc8EMRxc07NphgcR@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Bard Liao <bard.liao@intel.com>
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

On 12/31/21 14:22, Mark Brown wrote:
> On Mon, Dec 27, 2021 at 04:33:41PM +0100, Hans de Goede wrote:
>> On some boards where the firmware/fwnode information is in essence
>> read-only (x86 + ACPI boards) the i2c_client for the codec may contain
>> the wrong IRQ or no IRQ at all.
> 
> This doesn't apply against current code, please check and resend.

Ok, I will send a v2 rebased on top of broonie/sound.git/for-next

Regards,

Hans

