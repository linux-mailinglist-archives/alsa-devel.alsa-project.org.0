Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5646D193BB2
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 10:22:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC5421667;
	Thu, 26 Mar 2020 10:21:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC5421667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585214553;
	bh=4xVRCuuuQVzi4Y1H5zzGhkRYIbN9GUZrg74uLD+rjMg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FWWmSPbjXYYZbA4Sr6yvP1KEhFmeBaZFpcyYEhApfAWD5ghJlmlZ8jSiQ1+s5wtag
	 SvvaPYDn7JQ+rnRNpsmM1/cgfB1VJaem5vyiTDCUhWLDBfvMgcMe7AlrRLrvu36bEL
	 jxw0Rb+Hw9c4tDLYST6WBybIVwLJMm2XiZbyh1ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D183BF8011B;
	Thu, 26 Mar 2020 10:20:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 475F1F80227; Thu, 26 Mar 2020 10:20:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 273F1F8011B
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 10:20:44 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 18F9DA0040;
 Thu, 26 Mar 2020 10:20:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 18F9DA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1585214443; bh=P38DdsVe+YFLR9AwHvz3DrIKXB5uNDim2TdvvAs3P4g=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=dpTzvrm5W3miq2tO4IhbhNboxvbzdXVD5Nq/pihGkd5e84CMUcTHNcXv9or8nwRqh
 VBqsWg98bhZbtTn6dxsVDo+NVOBrfzmsJnMI9QCw+y/ba094UfRxNOk83iElkUA2XB
 sCkyfUbgdkt0J8UFkD7QEfHBZ4KsgZLy7UcsnvoY=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 26 Mar 2020 10:20:40 +0100 (CET)
Subject: Re: [PATCH] quirk for Pioneer DJ DJM-250MK2 usb sound card
To: =?UTF-8?B?RnJhbnRpxaFlayBLdcSNZXJh?= <konference@frantovo.cz>,
 alsa-devel@alsa-project.org
References: <e1e0dbc4-7fd0-ac7a-9b15-1f89172257e5@frantovo.cz>
 <5e798ba2-8385-e723-3f3a-b7e32da6520e@frantovo.cz>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <83fa897f-035b-5f81-4052-4bba757f6205@perex.cz>
Date: Thu, 26 Mar 2020 10:20:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5e798ba2-8385-e723-3f3a-b7e32da6520e@frantovo.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

Dne 04. 03. 20 v 17:03 František Kučera napsal(a):
> Dne 24. 02. 20 v 17:29 František Kučera napsal(a):
>> Hello,
>>
>> I have created a quirk that adds support for the Pioneer DJ DJM-250MK2 mixer (acts like a USB sound card, but Vendor Specific Class).
>>
>> Output (from computer to card) is working: 8 channels, 48 000 Hz, S24_3LE.
>>
>> Input is not working. I tried, but I was unable to make it working even under an officially supported OS with Pioneer drivers - Audacity or Mixxx see the channels, but there is no signal. It probably works only with Pioneer proprietary application. But I hope that even mere output support will be useful for someone. (it is usable for playback, just not for DVS)
>>
>> Franta
>>
>> Signed-off-by: František Kučera <franta-linux@frantovo.cz>
>> ---
>>   sound/usb/quirks-table.h | 42 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>
>> diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
>> index d187aa6d50db..dcaf9eed9a41 100644
>> --- a/sound/usb/quirks-table.h
>> +++ b/sound/usb/quirks-table.h
>> @@ -3592,5 +3592,47 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
>>                  }
>>          }
>>   },
>> +{
>> +       /*
>> +        * Pioneer DJ DJM-250MK2
>> +        * PCM is 8 channels out @ 48 fixed (endpoints 0x01).
>> +        * The output from computer to the mixer is usable.
>> +        *
>> +        * The input (phono or line to computer) is not working.
>> +        * It should be at endpoint 0x82 and probably also 8 channels,
>> +        * but it seems that it works only with Pioneer proprietary software.
>> +        * Even on officially supported OS, the Audacity was unable to record
>> +        * and Mixxx to recognize the control vinyls.
>> +        */
>> +       USB_DEVICE_VENDOR_SPEC(0x2b73, 0x0017),
>> +       .driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
>> +               .ifnum = QUIRK_ANY_INTERFACE,
>> +               .type = QUIRK_COMPOSITE,
>> +               .data = (const struct snd_usb_audio_quirk[]) {
>> +                       {
>> +                               .ifnum = 0,
>> +                               .type = QUIRK_AUDIO_FIXED_ENDPOINT,
>> +                               .data = &(const struct audioformat) {
>> +                                       .formats = SNDRV_PCM_FMTBIT_S24_3LE,
>> +                                       .channels = 8, // outputs
>> +                                       .iface = 0,
>> +                                       .altsetting = 1,
>> +                                       .altset_idx = 1,
>> +                                       .endpoint = 0x01,
>> +                                       .ep_attr = USB_ENDPOINT_XFER_ISOC|
>> +                                               USB_ENDPOINT_SYNC_ASYNC,
>> +                                       .rates = SNDRV_PCM_RATE_48000,
>> +                                       .rate_min = 48000,
>> +                                       .rate_max = 48000,
>> +                                       .nr_rates = 1,
>> +                                       .rate_table = (unsigned int[]) { 48000 }
>> +                               }
>> +                       },
>> +                       {
>> +                               .ifnum = -1
>> +                       }
>> +               }
>> +       }
>> +},
>>   
>>   #undef USB_DEVICE_VENDOR_SPEC
>>
> Can anyone review this patch please?

Takashi, could you put this patch to sound-next ? A partial support is better 
than no support.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
