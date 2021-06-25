Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC3B3B440F
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Jun 2021 15:06:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6EDF1685;
	Fri, 25 Jun 2021 15:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6EDF1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624626407;
	bh=DHUSyGNhjK8tOy3w/HjIzKd6B8Qf5Llj66xsHm07YOU=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CPB6obaCGVUo5dMZZ7bjyPkuPKVrhR7h8qou7Hl50BljHw7gh/j0/Lc0493WWoBkK
	 pKnr+2FVyHKZeGP1HA0TcvA6nFdWYhmUWYUeTwG7boKSugKuXFKa8vK9NCl+ijhJvV
	 86snWbY1zT7Wl0LwLYV4M1hc2/yPgJDS1m5F+pk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 356C2F800E1;
	Fri, 25 Jun 2021 15:05:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6BF1F801D5; Fri, 25 Jun 2021 15:05:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E1E8F80137
 for <alsa-devel@alsa-project.org>; Fri, 25 Jun 2021 15:05:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E1E8F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="XSf+pcDo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624626309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0YNr90GiVaf7rB1wxzZTIutrbJPYnXsp+tTDEzfuGZ8=;
 b=XSf+pcDon6NTR2Go5VPjBtad4T2tJ1+tLurjaDelCHfWhBZf+FeQfbNAy5ZoPUywJ9zdjc
 67N/Q2Cl6vHPBjbpojJUg0uc2ykdysDrmFJ20oH10fawBP6hVSyaHEYoIsNwaL4vBCjk6z
 qSTqNVViIppVIbfnU8VSZnNmcc9rBHo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-oEbuLY6NNNeSeyZDcptiEA-1; Fri, 25 Jun 2021 09:05:07 -0400
X-MC-Unique: oEbuLY6NNNeSeyZDcptiEA-1
Received: by mail-ej1-f69.google.com with SMTP id
 mh17-20020a170906eb91b0290477da799023so3094447ejb.1
 for <alsa-devel@alsa-project.org>; Fri, 25 Jun 2021 06:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0YNr90GiVaf7rB1wxzZTIutrbJPYnXsp+tTDEzfuGZ8=;
 b=JI5K7KYwfGO7gRsw2inSh3IQ38BfSiaNWXWm/PpohNk1zkFo3282s7r4o5h+LdKIvq
 1nO8/oDaC4cFMFInKrdUqDlgqe2osKoGlcthYJQFJvlU7NrkvBSQW/EqphtajRFKvLHn
 pudyguPuHOU3h9hYTs2PaKqk4tmJoAocN59HUuPQ6yAg3zndpNxHMdkl4OmKz6TSC+Gk
 0C565e+0G+bNac2CkiB+S7Z6OGoExHf75iaNmWeFJ/vbFwOmOWodmrwxDF03CnPz+MJO
 W00V30wyVkzRoeCWKLIDmTQJCsiK/J/1RWtu4RuhDVBuFnpeBWVk4L8QRdzuhYkUskRy
 2GZw==
X-Gm-Message-State: AOAM533+0vkbNDZKG567MDUbPmmgnqkbYvaDRfWdQjZLiCumt14w+NIo
 TgS1QVF8fn9tDYbyYS2so58h1xLMagtGvzYoX1ocqR43FbB/7YqExQR3uRylHL5bs+UDjS9ZYOt
 lSo5OaObMfrPnGypBRvIMn+V5ikoR+JuiMmWeg6Sp8+2rzU7+yVjdTzjZzGnS7oSVS45QFz798I
 w=
X-Received: by 2002:a17:906:dbf8:: with SMTP id
 yd24mr10667350ejb.160.1624626305655; 
 Fri, 25 Jun 2021 06:05:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwz9qfwcD2EOtVhw1TTXP2m4flNeiT1NSZvpapnoXv37mP1JBiLU+aXknYe/HYYg5HQ380+8A==
X-Received: by 2002:a17:906:dbf8:: with SMTP id
 yd24mr10667260ejb.160.1624626304743; 
 Fri, 25 Jun 2021 06:05:04 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id cn10sm4070944edb.38.2021.06.25.06.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 06:05:03 -0700 (PDT)
Subject: Re: [PATCH alsa-lib 0/5] Add generic exception mechanism for
 non-standard control-names
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20210503205231.167346-1-hdegoede@redhat.com>
 <0f7f1063-4a14-5d99-71b2-e700c74828c2@perex.cz>
 <67840562-7f54-bb9b-7876-6079b4ff7f47@redhat.com>
 <95924d6e-e2b7-0b9b-b62c-27e57fe88a80@perex.cz>
 <cc686b48-b27d-74bf-4fb4-21fdd23a9c89@redhat.com>
 <d92ad13d-4ee0-a125-053f-56ee99092053@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <c1ef3c53-59ec-77b6-97d3-f687100dde4f@redhat.com>
Date: Fri, 25 Jun 2021 15:05:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <d92ad13d-4ee0-a125-053f-56ee99092053@perex.cz>
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

Hi,

On 6/23/21 9:27 PM, Jaroslav Kysela wrote:
> On 23. 06. 21 20:59, Hans de Goede wrote:
>> Hi Jaroslav,
>>
>> On 5/18/21 6:16 PM, Jaroslav Kysela wrote:
>>> Dne 04. 05. 21 v 17:47 Hans de Goede napsal(a):
>>>> Hi Jaroslav,
>>>>
>>>> On 5/4/21 10:53 AM, Jaroslav Kysela wrote:
>>>>> Dne 03. 05. 21 v 22:52 Hans de Goede napsal(a):
>>>>>> Hi All,
>>>>>>
>>>>>> This series seems to have fallen through the cracks,
>>>>>> so here is a resend of it.
>>>>>>
>>>>>> Regards,
>>>>>
>>>>> Thank you, Hans. The problem with this implementation is that it's really card
>>>>> specific. Also, ASoC codec drivers have usually ID names based on registers so
>>>>> the mapping for the user is problematic anyway (the functionality is different
>>>>> from the name or not related to the name). I'm actually evaluating another
>>>>> solution which is more flexible:
>>>>>
>>>>> 1) add control remap plugin to allow the control ID remapping in the
>>>>> alsa-lib's control API, so we can mangle those identifiers there (already
>>>>> implemented)
>>>>>
>>>>> 2) add local and global alsa-lib configurations per UCM card specified in the
>>>>> UCM configuration files; the configurations may be for both control and PCM
>>>>> devices (restrict or set specific parameters)
>>>>
>>>> Ok, thank you for working on this.
>>>>
>>>>> I will notify you when I finish my tests.
>>>>
>>>> Yes, please let me know when you've something ready to test, then I'll take
>>>> a look at adding the necessary bits for the bycr-rt5640 and cht-bsw-rt567
>>>> UCM profiles, as some control renaming is necessary to make sure that
>>>> the hw-volume control on these devices also correctly controls the
>>>> hw mute controls (which in turn are necessary for both full muting and
>>>> for mute LED control).
>>>
>>> It seems that things started to work. I pushed everything to the repos
>>> (alsa-lib/alsa-utils/alsa-ucm-conf) and picked bits from your configs. If you
>>> can give a look and a test, it would be nice. The changes for the specific
>>> codecs are quite straight like:
>>>
>>> https://github.com/alsa-project/alsa-ucm-conf/commit/2072ab794b69cdf4f070db5467387d08a65c4309
>>>
>>> The global alsa-lib's configuration does the redirects to the hw specific
>>> configs (if found) per card. UCM can store this "per card" configuration to
>>> /var/lib/alsa/card<NUMBER>.conf.d tree, which allows us to define the hw
>>> specific configuration. Both control and PCM devices can be (re)configured.
>>>
>>> UCM was extended to allow inline the alsa-lib's configuration which can be
>>> private to UCM or saved to a global config file (/var/lib/alsa tree for example).
>>>
>>> By default, I made the private alsa-lib's configuration for all UCM
>>> applications, so the users cannot break UCM with their configuration changes.
>>
>> Thank you for your work on this.
>>
>> I've been testing this on a HP x2 Bay Trail + rt5640 laptop, and I've
>> found 2 issues:
>>
>> 1. After renaming there are now 2 "Speaker" and "Headphones" switches:
>>
>> "Speaker Playback Volume" stays    "Speaker Playback Volume"
>> "Speaker Channel Switch"  becomes  "Speaker Playback Switch"
>> "Speaker Switch"          stays    "Speaker Switch"
>>
>> And then alsamixer only shows one of the 2 "Speaker [Playback] Switches"
>>
>> This can be worked around by changing the renames to e.g. :
>>
>>                 "name='HP Playback Volume'" "name='Headphones Playback Volume'"
>>                 "name='HP Channel Switch'" "name='Headphones Playback Switch'"
>>                 "name='Speaker Playback Volume'" "name='Speakers Playback Volume'"
>>                 "name='Speaker Channel Switch'" "name='Speakers Playback Switch'"
>>
>> Or to:
>>
>>                 # Rename the 'Headphone Switch' DAPM PIN switch to avoid it getting
>>                 # grouped with 'Headphone Playback Volume'
>>                 "name='Headphone Switch'" "name='Headphone Output Switch'"
>>                 "name='HP Playback Volume'" "name='Headphone Playback Volume'"
>>                 "name='HP Channel Switch'" "name='Headphone Playback Switch'"
>>                 # Idem for the 'Speaker Switch'
>>                 "name='Speaker Switch'" "name='Speaker Output Switch'"
>>                 "name='Speaker Channel Switch'" "name='Speaker Playback Switch'"
> 
> This variant looks better in my eyes.
> 
>> So this is not really an issue.
>>
>> 2. PlaybackMixerElem statements don't take the renames into account, this means
>> that muting the speakers or the headphones output the UCM (pipewire/pulse) level
>> does not mute the 'Speaker Channel Switch' / 'HP Channel Switch' control, meaning
>> that we are not muting things at the hw level, which in turn is causing the speaker
>> mute LED on the HP X2 to not be turned on when muting.
>>
>> I guess the fix here would be to make the renames apply to PlaybackMixerElem ?
> 
> Yes, this change is required. I forgot to update this part.

Ok, so I've taken a (quick) look at this but I'm afraid that I don't fully
grasp how the control remapping is working. Can you give me some hint how
I can make the renames apply to PlaybackMixerElem or a rough patch for me
to test (and fixup if necessary, I mostly need an idea where to start).

Regards,

Hans

