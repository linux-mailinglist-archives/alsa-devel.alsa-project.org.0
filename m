Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD5B4E7A50
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 19:48:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AF941753;
	Fri, 25 Mar 2022 19:47:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AF941753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648234094;
	bh=Tis/qkuOsJgalUtToid2EBrpTpDJXgbEGcTCLIdS8IA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VBinVM3LrfB6sElszid4DbBWbnCdRr3vfEjYfBnJsI3DNpU9MrkgVPL5hkJZ2UREP
	 kPKlafhKQF4F0+OgYu1h2WccVi82l1tyebnhn7d/iWqnaaTDwym8zONoqYejXuRG09
	 nA+sBs1xKHDA2xPzhNNqwYcNSglXmTTzsnVZWAG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87BEEF800F4;
	Fri, 25 Mar 2022 19:47:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42085F80162; Fri, 25 Mar 2022 19:47:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EF6BF80115
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 19:47:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EF6BF80115
Received: by mail-ed1-f41.google.com with SMTP id c62so10231561edf.5
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 11:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LCFeUuL1wHZygJUNv7IbXrchIqyIDdGk//PwJLZZTyM=;
 b=XwPinMR1RWbto8QUYb+C8ks91SEPo4WOKm+BarpR5bIdoRGtRXD8WeUfoAkClUh7fu
 xzMvirDNmecRcX6fb3uHEkqYadC+geNTVzQcNcgFnjf8CcfkUd7RThPGtQ0duYad10TZ
 55nhYwl70rTGRvpAS0fWaoMCA9RF9rKw8QRczDZDY5Z35ROBdRD8laIrLfLaC3Kf7ogd
 vrOZF6OIG7LT59BK7eHdY8ofbN8AKOyCDYvSgDwAkbfW510fuwKCNttKLXPAPPaWUrlf
 TVvPjVyWdoolnxdWxsz3yNIMcFoqS9qDR9btShkWCNnaY0S4qtPyjdJCXK1uuhd1nVKQ
 KoOQ==
X-Gm-Message-State: AOAM530aBjrRZTBUjaPH25oS/WyyegIkyjL3NOyYp2ylY4Cp5u4W/OpG
 cZlxSaeakEZAjT1p7zq+6F8=
X-Google-Smtp-Source: ABdhPJyv9k5MR7nZBdcLPf4KryqF222cdIsjAx1jjv/2ZlzGKqL7eln18chyFPaZjezdCK2bgrVdZg==
X-Received: by 2002:a50:ed91:0:b0:419:979a:ac57 with SMTP id
 h17-20020a50ed91000000b00419979aac57mr83065edr.206.1648234022401; 
 Fri, 25 Mar 2022 11:47:02 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 v1-20020a1709064e8100b006e07d033572sm2173180eju.33.2022.03.25.11.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 11:47:01 -0700 (PDT)
Message-ID: <4032ca01-0576-aed6-fb22-426842852b70@kernel.org>
Date: Fri, 25 Mar 2022 19:47:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/3] sound: usb: Add vendor's hooking interface
Content-Language: en-US
To: Oh Eomji <eomji.oh@samsung.com>
References: <1648109444-196321-1-git-send-email-eomji.oh@samsung.com>
 <CGME20220324081212epcas2p4d2ed1f3a1bb020606cf65016efec085b@epcas2p4.samsung.com>
 <1648109444-196321-2-git-send-email-eomji.oh@samsung.com>
 <Yjwsh4N6dFKvWGav@kroah.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <Yjwsh4N6dFKvWGav@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, JaeHun Jung <jh0801.jung@samsung.com>,
 Leon Romanovsky <leon@kernel.org>, Pavel Skripkin <paskripkin@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

On 24/03/2022 09:32, Greg Kroah-Hartman wrote:
> On Thu, Mar 24, 2022 at 05:10:42PM +0900, Oh Eomji wrote:
>> In mobile, a co-processor can be used with USB audio to improve
>> power consumption.  To support this type of hardware, hooks need to
>> be added to the USB audio subsystem to be able to call into the
>> hardware when needed.
>> 
>> The main operation of the call-backs are: - Initialize the
>> co-processor by transmitting data when initializing. - Change the
>> co-processor setting value through the interface function. -
>> Configure sampling rate - pcm open/close - other housekeeping
>> 
>> Known issues: - This only supports one set of callback hooks,
>> meaning that this only works if there is one type of USB controller
>> in the system.  This should be changed to be a per-host-controller
>> interface instead of one global set of callbacks.
> 
> Sorry, but this limitation alone means that this is not going to be
> able to be accepted.  Almost all real systems have multiple USB
> controllers in the system and so, this will break in very bad ways on
> the majority of devices in the world.
> 
> Please fix this up and make this per-USB-controller, as was
> requested the last time this series was published.

This is a v2 (not v1) and Greg asked this already:
https://lore.kernel.org/all/YiW6ZqnINsOSyN+z@kroah.com/
That time, it was left without an answer.

Ignoring feedback and resending does not help in getting patches
mainlined. :(

Best regards,
Krzysztof
