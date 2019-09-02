Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E4FA51C5
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 10:33:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E0A216A6;
	Mon,  2 Sep 2019 10:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E0A216A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567413209;
	bh=8SpdpePOx19UOt+1fM7kqnoznJ141FIt+p0t4KUSNNc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qlzUXhSVqAakvQ5hB6MHQsrfjD2Xufl/qbRjw6H7o8S/4uv2TZTf32kG0obaXpgSg
	 YdL+sVokZQ+WFIpG+VYUX9TzOHJxKmg6ZZBulgW/acQOwaG2TTqbSxv+SMmUTC7lv3
	 36ZDyHtQCwCz8XDyPVIXk7CgdAQuDTh+KKrDtfD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0C8DF80394;
	Mon,  2 Sep 2019 10:31:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BD9BF803D0; Mon,  2 Sep 2019 10:31:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AC84F8011E
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 10:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AC84F8011E
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1D3DA4E927
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 08:31:34 +0000 (UTC)
Received: by mail-ed1-f70.google.com with SMTP id z39so5634466edc.15
 for <alsa-devel@alsa-project.org>; Mon, 02 Sep 2019 01:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c87BAGVabXocuKu1a4rY5K3qH1J2wkZsvMhdPTiauQU=;
 b=uWpaRU3n09bQw3AKow/H1O6qEVFHCNzgtyv8abShHznZQHW9NIE5yV/yLacU0gsuzY
 vTa21vVwR8X0THpLvCCeN9mqCf5yT/n9VEVAZmPtcaN2dkKdHpfoPZiZ9OQuhuA23Gwb
 TGMJ/b0eSL391fq3K0ROJor5AKVApkhDHJsDsXDUGuh3W1+QUvdPDC3lGIKwlk3Hwyze
 9pXMij877+9RbxPaOcrmLHfWDvKAvPWzeyX8wRmcSaUVvTPMUlUjiW7sQ1m3LZpb/YjA
 Qy/IVPFf7mrgLwBsiiCmF7PvCqHLwQNVirLOX+oc7IPhk6N++0TuGQC596EATuczZa9B
 hWng==
X-Gm-Message-State: APjAAAWHAZYdCa/aTS+aCis41u6xCk30fUqB3j+NtVmTdc/8DUEU1Y0b
 05kicFI4OOnXsZIa1MQV8OJjGHnGVjkoztyBben7E43y6P33Lrf6Kurabf13i6KzcatyVLRDbLk
 OVAcWSV3wFBeDqTiWEABzQzg=
X-Received: by 2002:a17:906:13d5:: with SMTP id
 g21mr23563268ejc.211.1567413092464; 
 Mon, 02 Sep 2019 01:31:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxifImwFtvEsh+GtaVLEQ65x5teBrg5zDJ0Ww3wCNShD9wv/rJCsnNTZ2H6UDV4cSzVAhW6hA==
X-Received: by 2002:a17:906:13d5:: with SMTP id
 g21mr23563243ejc.211.1567413092111; 
 Mon, 02 Sep 2019 01:31:32 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id p92sm307017edb.22.2019.09.02.01.31.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2019 01:31:31 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>
References: <20190831145842.32990-1-hdegoede@redhat.com>
 <s5hef0zjhw5.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <99a375b4-f6e9-ef5e-6f24-9e76db44b2e8@redhat.com>
Date: Mon, 2 Sep 2019 10:31:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5hef0zjhw5.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/2] conf/ucm: Add UCM profile for
 cht-bsw-rt5672 boards
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Takashi,

On 02-09-19 09:07, Takashi Iwai wrote:
> On Sat, 31 Aug 2019 16:58:41 +0200,
> Hans de Goede wrote:
>>
>> Add an UCM profile for Intel boards with a RT5672 codec.
>>
>> Re-use the existing platform enable and disable sequences for BYT/CHT SST
>> support and add a codecs/rt5672 dir with codec specific enable / disable
>> sequences for the various inputs and outputs.
>>
>> This is partly based on earlier work done here:
>> https://github.com/plbossart/UCM/tree/master/cht-bsw-rt5672
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> We've recently set up a new alsa-ucm-conf repo for keeping UCM
> profiles outside alsa-lib repo.  The new repo has a different license
> (BSD3-Clause) for easily adapting to OSes with license restriction.
> 
> I guess we should put the stuff there from now on, as much as
> possible?  The handling of UCM profile is currently pending, and we
> need to decide the general policy, as well as how to transfer the
> existing profiles to the new repo...

I think it is good that we now have a separate repo and I'm fine
with re-licensing all my UCM profile work under a BSD3-Clause license.

But I believe that until we have actually figured out how this is
all going to work and we are actually doing releases from the
new alsa-ucm-conf repo, we should keep adding new profiles to
alsa-lib for now, because these profiles are necessary for things
to work OOTB for our end users.

Regards,

Hans


>> ---
>>   configure.ac                                  |  2 +
>>   src/conf/ucm/Makefile.am                      |  1 +
>>   src/conf/ucm/cht-bsw-rt5672/HiFi.conf         | 27 +++++++++++
>>   src/conf/ucm/cht-bsw-rt5672/Makefile.am       |  4 ++
>>   .../ucm/cht-bsw-rt5672/cht-bsw-rt5672.conf    |  6 +++
>>   src/conf/ucm/codecs/Makefile.am               |  1 +
>>   src/conf/ucm/codecs/rt5672/DMIC1.conf         | 28 +++++++++++
>>   src/conf/ucm/codecs/rt5672/DMIC2.conf         | 28 +++++++++++
>>   src/conf/ucm/codecs/rt5672/EnableSeq.conf     | 48 +++++++++++++++++++
>>   src/conf/ucm/codecs/rt5672/HeadPhones.conf    | 23 +++++++++
>>   src/conf/ucm/codecs/rt5672/HeadsetMic.conf    | 38 +++++++++++++++
>>   src/conf/ucm/codecs/rt5672/Makefile.am        |  5 ++
>>   src/conf/ucm/codecs/rt5672/MonoSpeaker.conf   | 26 ++++++++++
>>   src/conf/ucm/codecs/rt5672/Speaker.conf       | 22 +++++++++
>>   14 files changed, 259 insertions(+)
>>   create mode 100644 src/conf/ucm/cht-bsw-rt5672/HiFi.conf
>>   create mode 100644 src/conf/ucm/cht-bsw-rt5672/Makefile.am
>>   create mode 100644 src/conf/ucm/cht-bsw-rt5672/cht-bsw-rt5672.conf
>>   create mode 100644 src/conf/ucm/codecs/rt5672/DMIC1.conf
>>   create mode 100644 src/conf/ucm/codecs/rt5672/DMIC2.conf
>>   create mode 100644 src/conf/ucm/codecs/rt5672/EnableSeq.conf
>>   create mode 100644 src/conf/ucm/codecs/rt5672/HeadPhones.conf
>>   create mode 100644 src/conf/ucm/codecs/rt5672/HeadsetMic.conf
>>   create mode 100644 src/conf/ucm/codecs/rt5672/Makefile.am
>>   create mode 100644 src/conf/ucm/codecs/rt5672/MonoSpeaker.conf
>>   create mode 100644 src/conf/ucm/codecs/rt5672/Speaker.conf
>>
>> diff --git a/configure.ac b/configure.ac
>> index 2e955760..9ccca7aa 100644
>> --- a/configure.ac
>> +++ b/configure.ac
>> @@ -741,6 +741,7 @@ AC_OUTPUT(Makefile doc/Makefile doc/pictures/Makefile doc/doxygen.cfg \
>>   	  src/conf/ucm/bytcr-rt5651-stereo-spk-in1-mic/Makefile \
>>   	  src/conf/ucm/bytcr-rt5651-stereo-spk-in2-mic/Makefile \
>>   	  src/conf/ucm/bytcr-rt5651-stereo-spk-in12-mic/Makefile \
>> +	  src/conf/ucm/cht-bsw-rt5672/Makefile \
>>   	  src/conf/ucm/chtnau8824/Makefile \
>>   	  src/conf/ucm/chtrt5645/Makefile \
>>   	  src/conf/ucm/chtrt5645-mono-speaker-analog-mic/Makefile \
>> @@ -772,6 +773,7 @@ AC_OUTPUT(Makefile doc/Makefile doc/pictures/Makefile doc/doxygen.cfg \
>>   	  src/conf/ucm/codecs/rt5640/Makefile \
>>   	  src/conf/ucm/codecs/rt5645/Makefile \
>>   	  src/conf/ucm/codecs/rt5651/Makefile \
>> +	  src/conf/ucm/codecs/rt5672/Makefile \
>>   	  src/conf/ucm/platforms/Makefile \
>>   	  src/conf/ucm/platforms/bytcr/Makefile \
>>   	  src/conf/topology/Makefile \
>> diff --git a/src/conf/ucm/Makefile.am b/src/conf/ucm/Makefile.am
>> index 02257048..2ed4e1a3 100644
>> --- a/src/conf/ucm/Makefile.am
>> +++ b/src/conf/ucm/Makefile.am
>> @@ -25,6 +25,7 @@ bytcr-rt5651-stereo-spk-dmic-mic \
>>   bytcr-rt5651-stereo-spk-in1-mic \
>>   bytcr-rt5651-stereo-spk-in2-mic \
>>   bytcr-rt5651-stereo-spk-in12-mic \
>> +cht-bsw-rt5672 \
>>   chtnau8824 \
>>   chtrt5645 \
>>   chtrt5645-mono-speaker-analog-mic \
>> diff --git a/src/conf/ucm/cht-bsw-rt5672/HiFi.conf b/src/conf/ucm/cht-bsw-rt5672/HiFi.conf
>> new file mode 100644
>> index 00000000..b83099d8
>> --- /dev/null
>> +++ b/src/conf/ucm/cht-bsw-rt5672/HiFi.conf
>> @@ -0,0 +1,27 @@
>> +# Adapted from https://github.com/plbossart/UCM/tree/master/cht-bsw-rt5672
>> +
>> +SectionVerb {
>> +	EnableSequence [
>> +		cdev "hw:chtbswrt5672"
>> +		<platforms/bytcr/PlatformEnableSeq.conf>
>> +		<codecs/rt5672/EnableSeq.conf>
>> +	]
>> +
>> +	DisableSequence [
>> +		cdev "hw:chtbswrt5672"
>> +		<platforms/bytcr/PlatformDisableSeq.conf>
>> +	]
>> +
>> +	Value {
>> +		PlaybackPCM "hw:chtbswrt5672"
>> +		CapturePCM "hw:chtbswrt5672"
>> +	}
>> +}
>> +
>> +<codecs/rt5672/Speaker.conf>
>> +<codecs/rt5672/MonoSpeaker.conf>
>> +<codecs/rt5672/HeadPhones.conf>
>> +
>> +<codecs/rt5672/DMIC1.conf>
>> +<codecs/rt5672/DMIC2.conf>
>> +<codecs/rt5672/HeadsetMic.conf>
>> diff --git a/src/conf/ucm/cht-bsw-rt5672/Makefile.am b/src/conf/ucm/cht-bsw-rt5672/Makefile.am
>> new file mode 100644
>> index 00000000..c3d557fa
>> --- /dev/null
>> +++ b/src/conf/ucm/cht-bsw-rt5672/Makefile.am
>> @@ -0,0 +1,4 @@
>> +alsaconfigdir = @ALSA_CONFIG_DIR@
>> +ucmdir = $(alsaconfigdir)/ucm/cht-bsw-rt5672
>> +ucm_DATA = cht-bsw-rt5672.conf HiFi.conf
>> +EXTRA_DIST = $(ucm_DATA)
>> diff --git a/src/conf/ucm/cht-bsw-rt5672/cht-bsw-rt5672.conf b/src/conf/ucm/cht-bsw-rt5672/cht-bsw-rt5672.conf
>> new file mode 100644
>> index 00000000..c79024d9
>> --- /dev/null
>> +++ b/src/conf/ucm/cht-bsw-rt5672/cht-bsw-rt5672.conf
>> @@ -0,0 +1,6 @@
>> +# Adapted from https://github.com/plbossart/UCM/tree/master/cht-bsw-rt5672
>> +
>> +SectionUseCase."HiFi" {
>> +	File "HiFi.conf"
>> +	Comment "Play HiFi quality Music"
>> +}
>> diff --git a/src/conf/ucm/codecs/Makefile.am b/src/conf/ucm/codecs/Makefile.am
>> index 5987b9cf..17c4ebf9 100644
>> --- a/src/conf/ucm/codecs/Makefile.am
>> +++ b/src/conf/ucm/codecs/Makefile.am
>> @@ -4,4 +4,5 @@ es8316 \
>>   rt5640 \
>>   rt5645 \
>>   rt5651 \
>> +rt5672 \
>>   nau8824
>> diff --git a/src/conf/ucm/codecs/rt5672/DMIC1.conf b/src/conf/ucm/codecs/rt5672/DMIC1.conf
>> new file mode 100644
>> index 00000000..9a8db1a5
>> --- /dev/null
>> +++ b/src/conf/ucm/codecs/rt5672/DMIC1.conf
>> @@ -0,0 +1,28 @@
>> +SectionDevice."DigitalMic-DMIC1" {
>> +	Comment "Internal Digital Microphone on DMIC1"
>> +
>> +	ConflictingDevice [
>> +		"DigitalMic-DMIC2"
>> +		"HeadsetMic"
>> +	]
>> +
>> +	EnableSequence [
>> +		cdev "hw:chtbswrt5672"
>> +		cset "name='Int Mic Switch' on"
>> +		cset "name='Stereo1 DMIC Mux' DMIC1"
>> +		cset "name='Stereo1 ADC 2 Mux' DMIC"
>> +		cset "name='Sto1 ADC MIXL ADC2 Switch' on"
>> +		cset "name='Sto1 ADC MIXR ADC2 Switch' on"
>> +	]
>> +
>> +	DisableSequence [
>> +		cdev "hw:chtbswrt5672"
>> +		cset "name='Int Mic Switch' off"
>> +		cset "name='Sto1 ADC MIXL ADC2 Switch' off"
>> +		cset "name='Sto1 ADC MIXR ADC2 Switch' off"
>> +	]
>> +
>> +	Value {
>> +		CaptureChannels 2
>> +	}
>> +}
>> diff --git a/src/conf/ucm/codecs/rt5672/DMIC2.conf b/src/conf/ucm/codecs/rt5672/DMIC2.conf
>> new file mode 100644
>> index 00000000..b960436e
>> --- /dev/null
>> +++ b/src/conf/ucm/codecs/rt5672/DMIC2.conf
>> @@ -0,0 +1,28 @@
>> +SectionDevice."DigitalMic-DMIC2" {
>> +	Comment "Internal Digital Microphone on DMIC2"
>> +
>> +	ConflictingDevice [
>> +		"DigitalMic-DMIC1"
>> +		"HeadsetMic"
>> +	]
>> +
>> +	EnableSequence [
>> +		cdev "hw:chtbswrt5672"
>> +		cset "name='Int Mic Switch' on"
>> +		cset "name='Stereo1 DMIC Mux' DMIC2"
>> +		cset "name='Stereo1 ADC 2 Mux' DMIC"
>> +		cset "name='Sto1 ADC MIXL ADC2 Switch' on"
>> +		cset "name='Sto1 ADC MIXR ADC2 Switch' on"
>> +	]
>> +
>> +	DisableSequence [
>> +		cdev "hw:chtbswrt5672"
>> +		cset "name='Int Mic Switch' off"
>> +		cset "name='Sto1 ADC MIXL ADC2 Switch' off"
>> +		cset "name='Sto1 ADC MIXR ADC2 Switch' off"
>> +	]
>> +
>> +	Value {
>> +		CaptureChannels 2
>> +	}
>> +}
>> diff --git a/src/conf/ucm/codecs/rt5672/EnableSeq.conf b/src/conf/ucm/codecs/rt5672/EnableSeq.conf
>> new file mode 100644
>> index 00000000..bd4f357c
>> --- /dev/null
>> +++ b/src/conf/ucm/codecs/rt5672/EnableSeq.conf
>> @@ -0,0 +1,48 @@
>> +# Playback (I2S1)
>> +
>> +# common
>> +cset "name='DAC1 L Mux' IF1 DAC"
>> +cset "name='DAC1 R Mux' IF1 DAC"
>> +cset "name='DAC1 MIXL DAC1 Switch' on"
>> +cset "name='DAC1 MIXR DAC1 Switch' on"
>> +cset "name='Stereo DAC MIXL DAC L1 Switch' on"
>> +cset "name='Stereo DAC MIXL DAC R1 Switch' off"
>> +cset "name='Stereo DAC MIXR DAC R1 Switch' on"
>> +cset "name='Stereo DAC MIXR DAC L1 Switch' off"
>> +
>> +# speaker
>> +cset "name='PDM1 L Mux' Stereo DAC"
>> +cset "name='PDM1 R Mux' Stereo DAC"
>> +
>> +# headphone
>> +cset "name='HPOVOL MIXL DAC1 Switch' on"
>> +cset "name='HPOVOL MIXR DAC1 Switch' on"
>> +cset "name='HPO MIX HPVOL Switch' on"
>> +
>> +# line out
>> +# cset "name='OUT MIXL DAC L1 Switch' on"
>> +# cset "name='OUT MIXR DAC R1 Switch' on"
>> +# cset "name='LOUT MIX OUTMIX L Switch' on"
>> +# cset "name='LOUT MIX OUTMIX R Switch' on"
>> +
>> +# 47=0dB, 0.375 dB/step
>> +cset "name='ADC Capture Volume' 47"
>> +cset "name='ADC Capture Switch' on"
>> +
>> +# Headset mic is quite soft, boost it a bit, 1 = 20dB which is the first
>> +# available boost step
>> +cset "name='IN1 Boost Volume' 1"
>> +
>> +# Start with all outputs / inputs disabled
>> +cset "name='Ext Spk Switch' off"
>> +cset "name='Headphone Switch' off"
>> +cset "name='Int Mic Switch' off"
>> +cset "name='Headset Mic Switch' off"
>> +cset "name='Sto1 ADC MIXL ADC1 Switch' off"
>> +cset "name='Sto1 ADC MIXR ADC1 Switch' off"
>> +cset "name='Sto1 ADC MIXL ADC2 Switch' off"
>> +cset "name='Sto1 ADC MIXR ADC2 Switch' off"
>> +cset "name='RECMIXL BST1 Switch' off"
>> +cset "name='RECMIXR BST1 Switch' off"
>> +cset "name='RECMIXL BST2 Switch' off"
>> +cset "name='RECMIXR BST2 Switch' off"
>> diff --git a/src/conf/ucm/codecs/rt5672/HeadPhones.conf b/src/conf/ucm/codecs/rt5672/HeadPhones.conf
>> new file mode 100644
>> index 00000000..cb8aad2d
>> --- /dev/null
>> +++ b/src/conf/ucm/codecs/rt5672/HeadPhones.conf
>> @@ -0,0 +1,23 @@
>> +SectionDevice."Headphones" {
>> +	Comment "Headphones"
>> +
>> +	ConflictingDevice [
>> +		"Speaker"
>> +		"MonoSpeaker"
>> +	]
>> +
>> +	EnableSequence [
>> +		cdev "hw:chtbswrt5672"
>> +		cset "name='Headphone Switch' on"
>> +	]
>> +
>> +	DisableSequence [
>> +		cdev "hw:chtbswrt5672"
>> +		cset "name='Headphone Switch' off"
>> +	]
>> +
>> +	Value {
>> +		PlaybackChannels "2"
>> +		JackControl "Headphone Jack"
>> +	}
>> +}
>> diff --git a/src/conf/ucm/codecs/rt5672/HeadsetMic.conf b/src/conf/ucm/codecs/rt5672/HeadsetMic.conf
>> new file mode 100644
>> index 00000000..cc6d8d56
>> --- /dev/null
>> +++ b/src/conf/ucm/codecs/rt5672/HeadsetMic.conf
>> @@ -0,0 +1,38 @@
>> +SectionDevice."HeadsetMic" {
>> +	Comment "Headset Microphone"
>> +
>> +	ConflictingDevice [
>> +		"DigitalMic-DMIC1"
>> +		"DigitalMic-DMIC2"
>> +	]
>> +
>> +	EnableSequence [
>> +		cdev "hw:chtbswrt5672"
>> +		cset "name='Headset Mic Switch' on"
>> +        	cset "name='RECMIXL BST1 Switch' on"
>> +		cset "name='RECMIXR BST1 Switch' on"
>> +		cset "name='Sto1 ADC MIXL ADC1 Switch' on"
>> +		cset "name='Sto1 ADC MIXR ADC1 Switch' on"
>> +		# For unknown reasons the headset mic sound is only recorded
>> +		# on the left channel, we tweak the data-stream reception to
>> +		# use the left samples for both slots, so that we get a stereo
>> +		# stream with the mic sound on both channels
>> +		cset "name='codec_in rx deinterleaver codec_in0_1' 1"
>> +	]
>> +
>> +	DisableSequence [
>> +		cdev "hw:chtbswrt5672"
>> +		cset "name='Headset Mic Switch' off"
>> +        	cset "name='RECMIXL BST1 Switch' off"
>> +		cset "name='RECMIXR BST1 Switch' off"
>> +		cset "name='Sto1 ADC MIXL ADC1 Switch' off"
>> +		cset "name='Sto1 ADC MIXR ADC1 Switch' off"
>> +		# Undo data-stream reception mono-mix workaround
>> +		cset "name='codec_in rx deinterleaver codec_in0_1' 2"
>> +	]
>> +
>> +	Value {
>> +		CaptureChannels "2"
>> +		JackControl "Headset Mic Jack"
>> +	}
>> +}
>> diff --git a/src/conf/ucm/codecs/rt5672/Makefile.am b/src/conf/ucm/codecs/rt5672/Makefile.am
>> new file mode 100644
>> index 00000000..feba0b76
>> --- /dev/null
>> +++ b/src/conf/ucm/codecs/rt5672/Makefile.am
>> @@ -0,0 +1,5 @@
>> +alsaconfigdir = @ALSA_CONFIG_DIR@
>> +ucmdir = $(alsaconfigdir)/ucm/codecs/rt5672
>> +ucm_DATA = DMIC1.conf DMIC2.conf EnableSeq.conf HeadPhones.conf \
>> +	   HeadsetMic.conf MonoSpeaker.conf Speaker.conf
>> +EXTRA_DIST = $(ucm_DATA)
>> diff --git a/src/conf/ucm/codecs/rt5672/MonoSpeaker.conf b/src/conf/ucm/codecs/rt5672/MonoSpeaker.conf
>> new file mode 100644
>> index 00000000..828a1154
>> --- /dev/null
>> +++ b/src/conf/ucm/codecs/rt5672/MonoSpeaker.conf
>> @@ -0,0 +1,26 @@
>> +SectionDevice."MonoSpeaker" {
>> +	Comment "Mono Speaker"
>> +
>> +	ConflictingDevice [
>> +		"Speaker"
>> +		"Headphones"
>> +	]
>> +
>> +	EnableSequence [
>> +		cdev "hw:chtbswrt5672"
>> +		cset "name='Stereo DAC MIXR DAC R1 Switch' off"
>> +		cset "name='Stereo DAC MIXL DAC R1 Switch' on"
>> +		cset "name='Ext Spk Switch' on"
>> +	]
>> +
>> +	DisableSequence [
>> +		cdev "hw:chtbswrt5672"
>> +		cset "name='Ext Spk Switch' off"
>> +		cset "name='Stereo DAC MIXL DAC R1 Switch' off"
>> +		cset "name='Stereo DAC MIXR DAC R1 Switch' on"
>> +	]
>> +
>> +	Value {
>> +		PlaybackChannels "2"
>> +	}
>> +}
>> diff --git a/src/conf/ucm/codecs/rt5672/Speaker.conf b/src/conf/ucm/codecs/rt5672/Speaker.conf
>> new file mode 100644
>> index 00000000..f9291e53
>> --- /dev/null
>> +++ b/src/conf/ucm/codecs/rt5672/Speaker.conf
>> @@ -0,0 +1,22 @@
>> +SectionDevice."Speaker" {
>> +	Comment "Speakers"
>> +
>> +	ConflictingDevice [
>> +		"MonoSpeaker"
>> +		"Headphones"
>> +	]
>> +
>> +	EnableSequence [
>> +		cdev "hw:chtbswrt5672"
>> +		cset "name='Ext Spk Switch' on"
>> +	]
>> +
>> +	DisableSequence [
>> +		cdev "hw:chtbswrt5672"
>> +		cset "name='Ext Spk Switch' off"
>> +	]
>> +
>> +	Value {
>> +		PlaybackChannels "2"
>> +	}
>> +}
>> -- 
>> 2.23.0
>>
>> _______________________________________________
>> Alsa-devel mailing list
>> Alsa-devel@alsa-project.org
>> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
