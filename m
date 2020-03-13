Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 500ED1845C8
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 12:17:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5D9717DD;
	Fri, 13 Mar 2020 12:16:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5D9717DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584098234;
	bh=EI2XgnaoSzAqcLQzXNmOaHo5x+AxX8QMR5DKuf6vke8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UqL6P8iWvESQwjHL9go6IBIKxUmzwOH5rd0qJWFF+N47KtOf9CXWQnv5MfpnKUgL9
	 xSx7Ab/hbw0UG/4pBH9eCzLDMzgTRlGKhr7uQrDnaw7aIH9hgzC2J8s1V6nUc+zBxh
	 z2egE1oCA0brhVjCCAlFElGYCzPhvokBuQT/LCtQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF281F801F7;
	Fri, 13 Mar 2020 12:15:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EA5CF801EB; Fri, 13 Mar 2020 12:15:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3429AF80090
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 12:15:00 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id ADF3BA0040;
 Fri, 13 Mar 2020 12:14:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz ADF3BA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1584098097; bh=jsrT0wsyRiY0rj19Gl7rejsF9KSnX7VrUj5sr/AyapU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=w5TM5MykOVGGmX1SFcW1MRJU+yWDifyvdeocn87yiV0PSgMCDdQVY/Y6cM6MQwCrw
 WVJn28MOf1xs1PBSsFdk/aXQsng8D57T3ro+RMLl/JtgzM2s0pHL+mhwE1l26A/pZ/
 Zhhtt10iWxua6OBZngNuiLg955Xha7fWCqglgHs4=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 13 Mar 2020 12:14:53 +0100 (CET)
Subject: Re: [PATCH] ucm2: hdadsp: add basic ucm config
To: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200306113031.713-1-mateusz.gorski@linux.intel.com>
 <4e2e3345-81d0-c698-d589-d4db5faff288@perex.cz>
 <8cd9195d-6104-88ed-22ed-c3151334ee76@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <1bd9d86c-e19f-183c-5355-5b7359c6e4c0@perex.cz>
Date: Fri, 13 Mar 2020 12:14:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8cd9195d-6104-88ed-22ed-c3151334ee76@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, tiwai@suse.com
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

Dne 13. 03. 20 v 11:59 Gorski, Mateusz napsal(a):
> 
>>> Basic UCM configuration for HDA DSP generic enabling codec playback and
>>> capture on both HDA codec and DMIC ports.
>>
>> Could you describe for what Linux driver (source code) is this
>> configuration?
> 
> 
> This file is for Intel Skylake SST driver. Information added in v2.

Ok, do we have this code in the vanilla linux kernel? Which .c file? The 
driver name 'hdadsp' looks suspicious. We usually have a delimiter in the 
driver name (like sof-hda-dsp).

>>> +ValueDefaults {
>>> +    PlaybackChannels "2"
>>> +    PlaybackPriority "1"
>>> +    CaptureChannels "2"
>>> +    CapturePriority "2"
>>> +}
>>
>> Remove PlaybackChannel and Priority defaults. The priorities should be
>> defined in the device section.

I will check...

> 
> 
> Thanks, moved to device section in v2.
> 
> 
>>> +
>>> +SectionDefaults [
>>> +    cdev "hw:hdadsp"
>>
>> It should be "hw:${CardId}" for ucm2.
> 
> 
> Thanks, applied in v2.
> 
> 
>>> +    cset "name='codec0_out mo media0_in mi Switch' 1"
>>> +    cset "name='media0_out mo codec0_in mi Switch' 1"
>>> +    cset "name='mch_cap_out mo mch_cap_in mi Switch' 1"
>>> +]
>>
>> This file does not define any devices. Does pulseaudio work with this
>> configuration?
> 
> 
> Devices added in v2. Regarding pulseaudio - are there any guidelines on
> how to test UCM files with it? These UCM files were writted mainly based
> on existing ones for other cards. Of course basic tests were made.

I wrote an ucm validator:

https://github.com/alsa-project/alsa-tests/tree/master/python/ucm-validator

Just type 'make' in the ucm-validator directory, the alsa-info.sh output 
should be added to the configs subtree.

The PA should be used latest from gitlab with the volume control and HDMI support.

					Jaroslav

> 
> 
> Thanks,
> Mateusz
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
