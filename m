Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 692673DCB4B
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Aug 2021 13:03:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C477E18A8;
	Sun,  1 Aug 2021 13:02:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C477E18A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627815807;
	bh=2g1bEYAPvqG5SBDvEs7lQnvBOY44SYgyLYHPh65EwaA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o3TbA6E/od3w9D3RzqOjjTAFmw/33420Rp7m4P9Um1XetqnNXXMfrCIff1xOso9tm
	 JpxLqJMQEdRCESYyDLhSuMHpLASB4GZZWGks0mc3Hz6A59LuD2J6lDASdYEypMnmX4
	 f94mcUnyj6hHr7hdEKz5WvueyJRjXhGbmXiIgzGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50C8CF80095;
	Sun,  1 Aug 2021 13:02:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B4C0F802E8; Sun,  1 Aug 2021 13:01:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,PRX_BODY_30,PRX_BODY_60,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D765EF80095
 for <alsa-devel@alsa-project.org>; Sun,  1 Aug 2021 13:01:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D765EF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hG+U541T"
Received: by mail-ej1-x62f.google.com with SMTP id e19so25984031ejs.9
 for <alsa-devel@alsa-project.org>; Sun, 01 Aug 2021 04:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HaY7BE+zIs6Wp8fTD42qxnu2bftdWvir9jeFi82TTuQ=;
 b=hG+U541TM1JehfC+7jl2/UEmUyNPWQXqPYF6jMc9h73LFe3i2fvXRaynIf30cinq6R
 dhg5+WDSfJPDLxQuVkaW1zPMQ7pmyeAegCMB3xVmM5RuCAdAiX5HOFyHg4B99CnAuJX5
 lnT8FGXmcwU5QHJLudDM+W/gbI1lXSxWa05z1daWBkPFXjMDyEl/GhhXCRBRNAmXGo5J
 Ymbp+2GwLTsRI6FC9FmtLYNZBpsChSvlaxysFc9YnVullIdnnXiVT8JJwT2c2WPa2JcY
 bPlvwZbBpknMFtEYbSfVAIQWizJIXgnGRDJMLtRoDMGlJzokdzHvVClayqhF4rxJ+E25
 VVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HaY7BE+zIs6Wp8fTD42qxnu2bftdWvir9jeFi82TTuQ=;
 b=gDCsalx4OWLmdlONXs6WSuU4DtMkp8dedhqvDy0yMt6osbEPi0xLHs7jHsugv0nPsA
 OIuPHtuehE1hcJFatWdAyrfE7S9D2ZryR5Du+iIdBMBmpfgT+ztmZKJosBfbtVflatg4
 qR5sv6WrB6QEBffMgeH8eoB7jTJTJfvs2xLVHW1bHl0qCaiPOpvvnPmfn32TWR0mJPjn
 AEkRZqN5ugLjWdgieGSshEB4bhcIw+VQU6EnNf4Hj3Ayvp/iG/5S4bL2UaeJmWanAUPh
 uqvsaal8vJ+uXQDRkTQ9HSPlZX4mMMsAo2E1vPjFF67W2b2umLgb3kl1EmM6avdtLRcO
 gZ7g==
X-Gm-Message-State: AOAM531emAsfCoistQwCGUB5Gq0oFp0TtziEcb1qigzsNDOZ6E84ne9U
 EwOWkxK7GLGCm7pxKxO08zI=
X-Google-Smtp-Source: ABdhPJy6myK64KrUPEeWKREeOSKw7KTsXIXdxmtGo+wlZzKvxYnkdpUJfmYyhgQkWm3+Va09fRgySA==
X-Received: by 2002:a17:906:8a98:: with SMTP id
 mu24mr10889294ejc.404.1627815709018; 
 Sun, 01 Aug 2021 04:01:49 -0700 (PDT)
Received: from ?IPv6:2a02:587:9423:c0a8:d967:ca01:966a:f420?
 ([2a02:587:9423:c0a8:d967:ca01:966a:f420])
 by smtp.gmail.com with ESMTPSA id w6sm3904214edd.22.2021.08.01.04.01.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Aug 2021 04:01:48 -0700 (PDT)
Subject: Re: [PATCH] ALSA: hda/realtek: add mic quirk for Acer SF314-42
To: Takashi Iwai <tiwai@suse.de>
References: <20210721170141.24807-1-amonakov@ispras.ru>
 <d6f4a149-12f8-b0d6-477a-c16113511c4a@gmail.com>
 <alpine.LNX.2.20.13.2108010950460.2011@monopod.intra.ispras.ru>
 <s5h8s1l1un2.wl-tiwai@suse.de>
From: Nikos Liolios <liolios.nk@gmail.com>
Message-ID: <4f7a01cb-a452-68cb-3238-3bfe6b8ea390@gmail.com>
Date: Sun, 1 Aug 2021 14:01:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <s5h8s1l1un2.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Alexander Monakov <amonakov@ispras.ru>,
 Takashi Iwai <tiwai@suse.com>
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

On Sun, 01 Aug 2021 10:39:13 +0300,
Takashi Iwai <tiwai@suse.de> wrote:
> On Sun, 01 Aug 2021 09:00:48 +0200,
> Alexander Monakov wrote:
>>
>> On Sun, 1 Aug 2021, Nikos Liolios wrote:
>>
>>> Other quirks for Acer Swift (for Acer SWIFT SF314-54/55/56) they describe the
>>> model using capital letters ("SWIFT" instead of "Swift").  I do think that
>>> "Swift" is better than (caps locked) "SWIFT". Thinking to create a patch for
>>> it since I helped to create this mess.  From my understanding it only affects
>>> the dmesg of which quirk was used, nothing important, but lets keep code
>>> clean.
>>>
>>> What do you think? Rename "SWIFT"s to "Swift"s?
>>> If no disagreement or no reply I am doing it like tomorrow.
>>
>> I agree "Swift" would be better: as far as I can tell, Acer mostly uses "Swift"
>> (both in marketing materials and DMI information). I would support the rename.
> 
> That's a really bikeshed topic, and I don't think we need an extra
> patch to correct it.  The message is only for debug prints, usually
> you don't see it.
> 
> 
> thanks,
> 
> Takashi
> 

I will respect your/Takashi's opinion. Won't do any such patch.

Thank you for letting me know beforehand.
