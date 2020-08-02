Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E2A23598B
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Aug 2020 19:52:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19A2F1612;
	Sun,  2 Aug 2020 19:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19A2F1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596390764;
	bh=Fap6mDs2FFmWo3/3V/YY056tGbS9sDLVb/TztDMbfz8=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i6YBAcSDZ8k2Er2P4rWUNrNPVhwFpeMph7Lci1yFH2Czsa+UFmhyY5MCakSU1kFzw
	 yFvQoGxJDHptc61+ZvyOBnJ9az8Sao8lP2om5u57QiyXgOjeAX2oTfPActhlOwHVnx
	 Kfh5nxITf4W/zk2YLzs4uWrxDfEnxrQFo6hdThIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34EC4F8015A;
	Sun,  2 Aug 2020 19:51:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D8B0F80150; Sun,  2 Aug 2020 19:51:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1685F8011C
 for <alsa-devel@alsa-project.org>; Sun,  2 Aug 2020 19:50:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1685F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="Ggu77o7/"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="HHsUxdaO"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 14756A1F79870;
 Sun,  2 Aug 2020 19:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1596390655; bh=Fap6mDs2FFmWo3/3V/YY056tGbS9sDLVb/TztDMbfz8=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=Ggu77o7/Gwlf/2EFn/qEqGS96CisigYHeQj/6B2dOfBi7eFNH2dlgsNFuWJlSvWid
 EB3IAXelLEUhu+SQlHRcyJS4+2qDlEvrvaDziXaAKumu2vD6ltlDlQNEJsUaoj53do
 aG8BkLiMS6ggo5g1gIPqmElG0OjBDLNv1r2CDV2U=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZRg8H1Jb1NEV; Sun,  2 Aug 2020 19:50:49 +0200 (CEST)
Received: from [192.168.105.151] (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id F04CAA1F30493;
 Sun,  2 Aug 2020 19:50:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1596390649; bh=Fap6mDs2FFmWo3/3V/YY056tGbS9sDLVb/TztDMbfz8=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=HHsUxdaO9YeKXcxkQNe25ZSemjnt4dGGFs9vU7lXLm39eCM+5UT7mSgmGGNGo4iOX
 iknCpoo4IDSsm5fPlwgkxeCu80LlAmTAascgHfiAXWvZr0TcwW3tb4LR17Abyxf7So
 jqEqXUUNz9Vjuja4BB9AJZtGwiqis8U7tYPb0q/8=
Subject: Re: pcm_meter.c issue at s16_update
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: Takashi Iwai <tiwai@suse.de>
References: <f56d6a67-014a-e562-c253-830c0ec03717@ivitera.com>
 <9957e124-be4b-cdc9-ffad-579b631455df@ivitera.com>
 <s5hd04ffu4m.wl-tiwai@suse.de>
 <fd493c4d-797e-d76d-771d-7c7483ffdea7@ivitera.com>
 <1cd5de43-5f67-78d3-f5e1-bbbaa8856873@ivitera.com>
Message-ID: <9bad013a-0306-90e4-adc5-547ebcac1b55@ivitera.com>
Date: Sun, 2 Aug 2020 19:50:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1cd5de43-5f67-78d3-f5e1-bbbaa8856873@ivitera.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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


Dne 28. 07. 20 v 20:54 Pavel Hofman napsal(a):
> 
> Dne 28. 07. 20 v 20:04 Pavel Hofman napsal(a):
>> Dne 28. 07. 20 v 19:04 Takashi Iwai napsal(a):
>>> Would adding atomic_add(&meter->reset, 1) in snd_pcm_meter_reset()
>>> help?
>>>
>> Unfortunately not.
>>
>> s16_reset is called correctly, setting s16->old = meter->now;  But at
>> that time meter->now is still 22751, setting s16->old to the same value.
>>
>> s16_update 1: meter->now 22751, s16->old 22751, size 0
>>
>> However, in the next update call meter->now comes from the freshly
>> started application pointer:
>>
>> s16_update 1: meter->now 839, s16->old 22751, size -21912
>>
>>
>> Of course this helps:
>>
>> -       if (size < 0)
>> -               size += spcm->boundary;
>> +       if (size < 0) {
>> +               size = meter->now;
>> +               s16->old = 0;
>> +       }
>>
>> But I understand this is not a solution because:
>>
>> * it will not work at reaching spcm->boundary (after thousands of hours?)
>> * it will cause the same problem when the stream is rewound (which is
>> the problem now too) - size will equal to large meter->now (length from
>> the beginning of the stream minus the rewound = large number).
>>
> 
> IMHO there are two cases of the [application pointer + delay] drop
> compared to the previous run:
> 
> * stream start, rewinding => s16->old = meter->now; size =0, i.e.
> skipping the samples to show
> * wrapping at spcm->boundary => size += spcm->boundary, i.e. showing the
> wrapped samples
> 
> Optionally the second case could be handled just like the first case by
> resetting s16->old, assuming the boundary wrap occurs very infrequently.

The following patch is tested to work OK, no CPU peaks and no meter
output glitches when the size < 0 condition occurs:

diff --git a/src/pcm/pcm_meter.c b/src/pcm/pcm_meter.c
index 20b41876..48df5945 100644
--- a/src/pcm/pcm_meter.c
+++ b/src/pcm/pcm_meter.c
@@ -1098,8 +1098,15 @@ static void s16_update(snd_pcm_scope_t *scope)
        snd_pcm_sframes_t size;
        snd_pcm_uframes_t offset;
        size = meter->now - s16->old;
-       if (size < 0)
-               size += spcm->boundary;
+       if (size < 0) {
+               /**
+                * Application pointer adjusted for delay (meter->now)
has dropped compared
+                * to the previous update cycle. Either spcm->boundary
wraparound, pcm rewinding,
+                * or pcm restart without s16->old properly reset.
+                * In any case the safest solution is skipping this
conversion cycle.
+                */
+               size = 0;
+       }
        offset = s16->old % meter->buf_size;
        while (size > 0) {
                snd_pcm_uframes_t frames = size;



Please will you accept this (workaround) bugfix? If so, I would send a
proper patch.

Thanks a lot,

Pavel.
