Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB2A372D47
	for <lists+alsa-devel@lfdr.de>; Tue,  4 May 2021 17:49:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17847169D;
	Tue,  4 May 2021 17:48:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17847169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620143368;
	bh=owu8LdpL57kx2maiJtiho0hMJhjdfytDJOyksiVBK48=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZVtG1NFLToAKnoEEbxOy0MyArE0ViUNLSECPVoSfXyGYVxJ6+YD3wCX7jcg9Bx+KH
	 tjzfgFMulPTF6N/yqKnY9rf1dVD4kxwx90DfQl7fug24V9mDrMU3U/rrNq/I6KqZNT
	 gC/xFQK3sD3w08oQF8UOxt1/h4P8/JN7zezJ7VKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D62DF801F7;
	Tue,  4 May 2021 17:48:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51E56F8021C; Tue,  4 May 2021 17:47:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAF3CF80108
 for <alsa-devel@alsa-project.org>; Tue,  4 May 2021 17:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAF3CF80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="BphM0QkI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620143274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xVWLHOZlwEeP3aDjtRM32sjjUFVUebjUzuF4DHFhNRk=;
 b=BphM0QkIWd45qN54fEUJPzy9IGsL17M0qX4russSSd/FQK4zYYuWyIkUM50JSFerjSVy1r
 aNRbAHPieRUZansDyIYK5HLldgFjoK9oOyYm83Q+TfZxG28qD5lzcnx27S+8J2YVMsxPH3
 fU4V7+xhrVs3CSsJ/Amk8Ks2uJEX/Fw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-hRJUe4NWO6uQoQMZwIhp2Q-1; Tue, 04 May 2021 11:47:47 -0400
X-MC-Unique: hRJUe4NWO6uQoQMZwIhp2Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 s20-20020a0564025214b029038752a2d8f3so6613146edd.2
 for <alsa-devel@alsa-project.org>; Tue, 04 May 2021 08:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xVWLHOZlwEeP3aDjtRM32sjjUFVUebjUzuF4DHFhNRk=;
 b=N2w8p9fTgDrRj5ERXvzZyg+McaMKx7j9XVK9vgsbJZ0teAzRf3pSIABEOESmj7Wl4E
 Cia1hDZMs7r3IYNjP4Oodg+nSbUaNswjU9Ir1T+47ULwoK0rCfVcHJiDDiK8HpERhwKa
 DCIDLd1M2uY7a7nsxP59rSq8PB9yYyAvr2Ps+eL8y/PplJcwDOzNG3UfdPShO803aPse
 4jtvrKAzHtO0Duw9t+Ts6tPG2z1dAdOjK9Y2T0nCrlGPxoyE7r2XHmA8py25xRoEUcee
 hURxa7CBLfUpSUbnAO2Ii2tKTU60mqY7DGySrVpgTjiQvNuD47RaRdkgZjC+Pm3euunx
 J6xg==
X-Gm-Message-State: AOAM530znCd7scB876ASD1hMAX6WbC5BNBGgd0dY57595rp0xUHMqLhC
 7EtGYRkb162faL/8QpkzzyAUoxfgMORS+JSDJ1ynBg+XSe5G5u5NmNw32+PFgxWsfghJm8DVA3X
 8/XXV1mHq9kRz5UK5xtyeGy6hV3DFBBC1jiAigwWAm2Oc6iOmhwEHy9SMX2sE1HBuAXS5bCptZE
 g=
X-Received: by 2002:a17:906:2a46:: with SMTP id
 k6mr21864121eje.406.1620143265751; 
 Tue, 04 May 2021 08:47:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7Ncbt4BIgKdHhJSDU/RIAn+VYuXZOUqWiih3Dpp3+HrgA6LqNcuVM1g9LdHBfvsdJ6IlAzQ==
X-Received: by 2002:a17:906:2a46:: with SMTP id
 k6mr21864099eje.406.1620143265489; 
 Tue, 04 May 2021 08:47:45 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id h9sm2545012ede.93.2021.05.04.08.47.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 08:47:45 -0700 (PDT)
Subject: Re: [PATCH alsa-lib 0/5] Add generic exception mechanism for
 non-standard control-names
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20210503205231.167346-1-hdegoede@redhat.com>
 <0f7f1063-4a14-5d99-71b2-e700c74828c2@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <67840562-7f54-bb9b-7876-6079b4ff7f47@redhat.com>
Date: Tue, 4 May 2021 17:47:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0f7f1063-4a14-5d99-71b2-e700c74828c2@perex.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi Jaroslav,

On 5/4/21 10:53 AM, Jaroslav Kysela wrote:
> Dne 03. 05. 21 v 22:52 Hans de Goede napsal(a):
>> Hi All,
>>
>> This series seems to have fallen through the cracks,
>> so here is a resend of it.
>>
>> Regards,
> 
> Thank you, Hans. The problem with this implementation is that it's really card
> specific. Also, ASoC codec drivers have usually ID names based on registers so
> the mapping for the user is problematic anyway (the functionality is different
> from the name or not related to the name). I'm actually evaluating another
> solution which is more flexible:
> 
> 1) add control remap plugin to allow the control ID remapping in the
> alsa-lib's control API, so we can mangle those identifiers there (already
> implemented)
> 
> 2) add local and global alsa-lib configurations per UCM card specified in the
> UCM configuration files; the configurations may be for both control and PCM
> devices (restrict or set specific parameters)

Ok, thank you for working on this.

> I will notify you when I finish my tests.

Yes, please let me know when you've something ready to test, then I'll take
a look at adding the necessary bits for the bycr-rt5640 and cht-bsw-rt567
UCM profiles, as some control renaming is necessary to make sure that
the hw-volume control on these devices also correctly controls the
hw mute controls (which in turn are necessary for both full muting and
for mute LED control).

Regards,

Hans


>> Hans de Goede (5):
>>   mixer: simple - Add generic exception mechanism for non-standard
>>     control-names
>>   mixer: simple - Move handling of 3D Control - Depth controls to the
>>     exceptions list
>>   mixer: simple - Add exceptions for non " Volume" suffixed capture
>>     vol-ctls used in ASoC realtek codec drivers
>>   mixer: simple - Add exceptions for some capture-vol-ctls which have a
>>     " Volume" suffix
>>   mixer: simple - Add exceptions for some Playback Switches with a "
>>     Channel Switch" suffix
>>
>>  src/mixer/simple_none.c | 74 +++++++++++++++++++++++++----------------
>>  1 file changed, 46 insertions(+), 28 deletions(-)
>>
> 
> 

