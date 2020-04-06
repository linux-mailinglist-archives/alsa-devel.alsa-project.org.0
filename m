Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE75519F0D3
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 09:34:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61B1E1662;
	Mon,  6 Apr 2020 09:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61B1E1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586158440;
	bh=6QrKTA2PY8/fQOQcZdVso+4S4wWDinDw+OMAoQX0gc4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bgaGKxPDAwMeny5HaeKHKbEfS+cen43SVxOVMkikDT+Y6T3B3sKvhxf3hYPJ7bori
	 2jzVyFpJWYF93jzQ0v4uIZZpIFaswjqmYYcrLLBu0V43m+uNd3UJb7m/t80lbSL/WB
	 p8iackgsYOEoCFOibkOkvJfEJdcd1VPK03IoCcQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78417F80121;
	Mon,  6 Apr 2020 09:32:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39542F80143; Mon,  6 Apr 2020 09:32:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1657DF80140
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 09:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1657DF80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="ZYIZYGNX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586158329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6QrKTA2PY8/fQOQcZdVso+4S4wWDinDw+OMAoQX0gc4=;
 b=ZYIZYGNXInHduAXBSRb0Ovuvaz9DwVvpB5Xl7ZAGRZbVQzqvpY6OtbOHM9OZxGLCq0pfD+
 wXvX4sdrHzbK+tF2FUR2v+4OdqLoXT/cyfiyBsbqMSKDPwri9wxo0Hzc0dTGCHaU88NMbA
 3QMnjva0O/rN9urXWLpNB4x4DzKk/y4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-9s3I01XiMte9d69RYB2Y8Q-1; Mon, 06 Apr 2020 03:32:07 -0400
X-MC-Unique: 9s3I01XiMte9d69RYB2Y8Q-1
Received: by mail-wr1-f71.google.com with SMTP id g6so2151093wru.8
 for <alsa-devel@alsa-project.org>; Mon, 06 Apr 2020 00:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=55ubdPiGIyC+mVFWwZPPuBva221EUyU8bJtuAYIEMrM=;
 b=gbsj4TXgyj0tcnyh1HCFWADBP5JDazlr6TbyvbbZ6rOWJaehK9ux/adnnNZk0v8cQ9
 Ap3GpbZrk5hx3Y68qcKUgTFpc/wWPK/ZGwz9Qy2C0jxlwSE3ICKVKsLTwjxXiwg10/hF
 RwoR24djf/SfKcV3xnhLRKaZmPtQxeQDZDhc2NHwsaIGm8ZLkHsuFpPbyS1E697JMbbM
 Y/ZBicKfHaYIVWogj9deFJE457l2LWriUa+NEQQ7gcBMIN+HbZCa4V8LhBE/xXiGbHMV
 NFiowv749vJ7ZtZxXbVfinmKPlGNhpwJaNRmxuQLXuVCWjIt/kUq2xbOKQKzvufopniz
 XypQ==
X-Gm-Message-State: AGi0PuZjpiIbPljkbPPl2UtfAhbAx1Os14Kesa3tZJp2Xl8wUCWO2jk8
 +uo/C3BpWECiXWCrR1zF3xgpSYDnTlLRlKhz7WjqwjJDc6qhQBUQ5hQlDhNSvmedT5JIEhf3bHY
 VoIv1W+CO7A2Asxu8TMiYo6s=
X-Received: by 2002:a5d:484b:: with SMTP id n11mr13227526wrs.110.1586158325590; 
 Mon, 06 Apr 2020 00:32:05 -0700 (PDT)
X-Google-Smtp-Source: APiQypKgscJkqgJtr+g9T3IjxCg03i663wXUOHDZOJ5DwAVlsa0N/+GmkoRR4jepg9Y0qK3dRrAyNQ==
X-Received: by 2002:a5d:484b:: with SMTP id n11mr13227499wrs.110.1586158325251; 
 Mon, 06 Apr 2020 00:32:05 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id a8sm22887724wmb.39.2020.04.06.00.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 00:32:04 -0700 (PDT)
Subject: Re: [PATCH 4/5] chtrt5645: Remove bogus JackHWMute settings
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>
References: <20200405183454.34515-1-hdegoede@redhat.com>
 <20200405183454.34515-4-hdegoede@redhat.com>
 <d06f3894-6cd7-fd4e-2261-94505fc0db4a@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <c19aadd5-80b4-91de-4e0a-344e21125883@redhat.com>
Date: Mon, 6 Apr 2020 09:32:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <d06f3894-6cd7-fd4e-2261-94505fc0db4a@linux.intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org
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

On 4/6/20 1:22 AM, Pierre-Louis Bossart wrote:
>=20
>=20
> On 4/5/20 1:34 PM, Hans de Goede wrote:
>> There is no reason why the internal microphone or speakers cannot
>> be used when a headset is plugged in.
>>
>> The jack does not physically disconnect these, so the JackHWMute setting=
s
>> are wrong, remove them.
>=20
> Are you sure about the internal mic and headset input not conflicting? II=
RC they use the same path after the initial routing selector. I may be wron=
g but I'd be surprised if you can use both.
>=20
> Now that I think of it further, in case the SSP0 is used an I2S link is c=
onfigured, so you cannot have both streams in parallel. It may be possible =
to use headset and dmic in parallel with the 4 slot version but we also hav=
e 1 PCM capture only.
>=20
> So overall it seems rather unlikely that we can support dmic + headset mi=
c in parallel?

Right that is what the ConflictingDevices sections are for.

Removing the JackHWMute does not allow using both add the same time,
it merely allows overriding which of the 2 to use (if the headset mic
is detected by the jack, the JackControl setting is kept).

So lets say the internal mic is crappy, but the user prefers to
have their ears free, then they can use a headset around there neck,
using just the headset-mic and select speakers as output even though
a jack is inserted.

Note pulseaudio will still automatically switch to the headphones /
headsetmic when plugged in, this merely allows overriding that
choice manually.

Jacks which actually physically disable (or re-route) signals are
quite rare now a days so having a JackHWMute in the UCM conf is
often wrong. After this patch only a few cases are left:

[hans@x1 alsa-ucm-conf]$ ack -l JackHWMute ucm2
ucm2/HDA-Intel/HiFi-dual.conf
ucm2/chtrt5650/HiFi.conf
ucm2/hda-dsp/HiFi.conf
ucm2/codecs/es8316/HeadPhones.conf
ucm2/sof-bdw-rt5677/HiFi.conf
ucm2/broxton-rt298/HiFi.conf
ucm2/skylake-rt286/HiFi.conf

The es8316 case is actually correct, the es8316 has only 1
output (which is amplified for e.g. a speaker) and at
least the reference design suggests routing the speaker signal
through the jack and using a jack which will interrupt the
signal when headphones are plugged in.

Note most actual designs implement this with an analog
switch and a GPIO to control that switch, since 3.5 mm
jacks which actually can disconnect a signal are rare
(if they exist at all, but I guess they do). For the
designs using the GPIO controlled analog switch, the
JackHWMute technically also is wrong, but I put it
there (IIRC it was me) because it matches the reference
design.

I'm not familiar enough with any of the others to say anything
about them, but most of them are for HDA setups, where this
is somewhat more normal I guess.

Regards,

Hans




>=20
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> =C2=A0 ucm2/chtrt5645/HiFi-dmic1.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 2 --
>> =C2=A0 ucm2/chtrt5645/HiFi-dmic2.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 2 --
>> =C2=A0 ucm2/chtrt5645/HiFi-mono-speaker-analog-mic.conf | 2 --
>> =C2=A0 ucm2/chtrt5645/HiFi.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 --
>> =C2=A0 4 files changed, 8 deletions(-)
>>
>> diff --git a/ucm2/chtrt5645/HiFi-dmic1.conf b/ucm2/chtrt5645/HiFi-dmic1.=
conf
>> index 1a8ee0a..c7e12c9 100644
>> --- a/ucm2/chtrt5645/HiFi-dmic1.conf
>> +++ b/ucm2/chtrt5645/HiFi-dmic1.conf
>> @@ -50,7 +50,6 @@ SectionDevice."Headphones" {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PlaybackPriority =
200
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PlaybackPCM "hw:$=
{CardId}"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JackControl "Head=
phone Jack"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JackHWMute "Speaker"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ConflictingDevice [
>> @@ -96,7 +95,6 @@ SectionDevice."Headset" {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CapturePriority 2=
00
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CapturePCM "hw:${=
CardId}"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JackControl "Head=
set Mic Jack"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JackHWMute "Mic"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EnableSequence [
>> diff --git a/ucm2/chtrt5645/HiFi-dmic2.conf b/ucm2/chtrt5645/HiFi-dmic2.=
conf
>> index d3f880a..95fedb3 100644
>> --- a/ucm2/chtrt5645/HiFi-dmic2.conf
>> +++ b/ucm2/chtrt5645/HiFi-dmic2.conf
>> @@ -50,7 +50,6 @@ SectionDevice."Headphones" {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PlaybackPriority =
200
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PlaybackPCM "hw:$=
{CardId}"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JackControl "Head=
phone Jack"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JackHWMute "Speaker"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ConflictingDevice [
>> @@ -98,7 +97,6 @@ SectionDevice."Headset" {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CapturePriority 2=
00
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CapturePCM "hw:${=
CardId}"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JackControl "Head=
set Mic Jack"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JackHWMute "Mic"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EnableSequence [
>> diff --git a/ucm2/chtrt5645/HiFi-mono-speaker-analog-mic.conf b/ucm2/cht=
rt5645/HiFi-mono-speaker-analog-mic.conf
>> index db866cd..f6180a4 100644
>> --- a/ucm2/chtrt5645/HiFi-mono-speaker-analog-mic.conf
>> +++ b/ucm2/chtrt5645/HiFi-mono-speaker-analog-mic.conf
>> @@ -54,7 +54,6 @@ SectionDevice."Headphones" {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PlaybackPriority =
200
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PlaybackPCM "hw:$=
{CardId}"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JackControl "Head=
phone Jack"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JackHWMute "Speaker"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ConflictingDevice [
>> @@ -84,7 +83,6 @@ SectionDevice."Headset" {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CapturePriority 2=
00
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CapturePCM "hw:${=
CardId}"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JackControl "Head=
set Mic Jack"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JackHWMute "Mic"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EnableSequence [
>> diff --git a/ucm2/chtrt5645/HiFi.conf b/ucm2/chtrt5645/HiFi.conf
>> index 58468a8..116d456 100644
>> --- a/ucm2/chtrt5645/HiFi.conf
>> +++ b/ucm2/chtrt5645/HiFi.conf
>> @@ -50,7 +50,6 @@ SectionDevice."Headphones" {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PlaybackPriority =
200
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PlaybackPCM "hw:$=
{CardId}"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JackControl "Head=
phone Jack"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JackHWMute "Speaker"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ConflictingDevice [
>> @@ -76,7 +75,6 @@ SectionDevice."Headset" {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CapturePriority 2=
00
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CapturePCM "hw:${=
CardId}"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JackControl "Head=
set Mic Jack"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JackHWMute "Mic"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EnableSequence [
>>
>=20

