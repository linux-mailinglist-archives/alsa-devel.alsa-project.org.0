Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9EA213663
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 10:30:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB47816D0;
	Fri,  3 Jul 2020 10:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB47816D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593765014;
	bh=I9YV7wPgLkw4Iq4vx8FH8gJab+HUm3ZHfnA3SOUHKuQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m35JoJ3od8lE2WvVnSjOKoQngy3fKzvJZXEHfAdU6GzZrqzCEF8TLF34JHqvt4V71
	 t7SLlGQUGyZW8SQ0WlmmI2IFQVoHHhqLkX/8W8wq75kg7BIKaCqnqIPN8+RrnWLJQZ
	 WgxS3DX5iKf2z0Zd4fZumLw/3rgJLxaI5TGEQG/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D08CFF800E2;
	Fri,  3 Jul 2020 10:28:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B415F80217; Fri,  3 Jul 2020 10:28:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D52EDF800E2
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 10:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D52EDF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="DJdl31mR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593764901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kcuCW971MtT9fDm0+vC/HbFyI8kTsXqRTn3WmXdz9Pc=;
 b=DJdl31mR/1INaw7VLtfRK89cUAImIENHCLvULd6hvncN17YYNfWYaI+dnLAmeXs/1dIRnJ
 h2e1Yfs3HbJXZuIT0WUIeM+MsME51RdkkdPnP0Q/7EMilLxeUUXPVDtHf3FfVMZ6BUdoGK
 wBH/20j+6WF7B76TMb6eUXny6KH9BF4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-knO5v-0VM76luPtAejgqjQ-1; Fri, 03 Jul 2020 04:28:20 -0400
X-MC-Unique: knO5v-0VM76luPtAejgqjQ-1
Received: by mail-ed1-f72.google.com with SMTP id d3so20023881edq.14
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 01:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kcuCW971MtT9fDm0+vC/HbFyI8kTsXqRTn3WmXdz9Pc=;
 b=Ft8JXslDhfFdDI0cc+1Su/GGrQlkynZGDHaU5FWOGhYp2vNlgEfj34D9ELegWHigji
 OsDDWwY7RKCxmdkxU2ahTbiOLitE8VFShMklQT+UbYYnCisHZmjuG/LtcK1if7yAoJiZ
 bAyVIP6MEAXDk4F/KXTbVJ85OUoXq1//9GNmOXNhtLzWFSoU4ImJeWwGGR7vf+wRN/UO
 ncEr7UghntapHeZN+DFjLTAqtPogR9jEHClmxDLMEO5zdOz2UKeFsGVF+mevJNeKiN8R
 o55JaoGfXQ9Kl9/dAD+sGIHxsR0fq7O9gydTFS7ASjyuEpCMk1bYY3+/VjGkLNA7wlYf
 D0ng==
X-Gm-Message-State: AOAM531iOhOp7dB2o3mChB2GqFRhAgJWsza16jENmBv+8Fb0d5XdWnfV
 ITN/zb5MO7UUxGNw6j+J2Jm9nftsfbIqh2/8LthrCPwr2l7xyU+pzFDuN7s3qOpWD7h2gDodbdH
 Grl8UuM8HhXgvoUdU2f/NmkU=
X-Received: by 2002:a17:907:1050:: with SMTP id
 oy16mr32546073ejb.353.1593764898395; 
 Fri, 03 Jul 2020 01:28:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5F25xNxrjdxmltQqMgp5D7YcIJS+ItkF/2SWSVv0IqXEEONzaxbYjkXzEpAG6b+ZhoOEjkg==
X-Received: by 2002:a17:907:1050:: with SMTP id
 oy16mr32546063ejb.353.1593764898226; 
 Fri, 03 Jul 2020 01:28:18 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id d26sm11356201edz.93.2020.07.03.01.28.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2020 01:28:17 -0700 (PDT)
Subject: Re: [PATCH 1/6] ASoC: Intel: cht_bsw_rt5672: Change bus format to I2S
 2 channel
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sasha Levin <sashal@kernel.org>, Cezary Rojewski <cezary.rojewski@intel.com>
References: <20200628155231.71089-2-hdegoede@redhat.com>
 <20200701193320.C948B20870@mail.kernel.org>
 <869046c6-030c-9243-784d-ecabdb774fa7@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <24708afa-bf28-3c5b-84ef-a6e7fb455bf0@redhat.com>
Date: Fri, 3 Jul 2020 10:28:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <869046c6-030c-9243-784d-ecabdb774fa7@linux.intel.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
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

On 7/1/20 9:46 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 7/1/20 2:33 PM, Sasha Levin wrote:
>> Hi
>>
>> [This is an automated email]
>>
>> This commit has been processed because it contains a -stable tag.
>> The stable tag indicates that it's relevant for the following trees: all
>>
>> The bot has tested the following trees: v5.7.6, v5.4.49, v4.19.130, v4.14.186, v4.9.228, v4.4.228.
>>
>> v5.7.6: Build OK!
>> v5.4.49: Failed to apply! Possible dependencies:
>>      0d1571c197a92 ("ASoC: intel: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer")
> 
> This patch is probably the missing dependency, but it's quite large and invasive.
> 
> if we wanted to apply this patch to stable versions < 5.7, we should replace all occurrences of
> 
> asoc_rtd_to_cpu(rtd, 0) by rtd->cpu_dai
> 
> and
> 
> asoc_rtd_to_codec(rtd, 0) by rtd->codec_dai

This fix affects only 1 model tablet, so I think it is fine to just add it to 5.7
and skip it for older kernels.

Regards,

Hans

