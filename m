Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0910188574
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 14:25:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32EEA1835;
	Tue, 17 Mar 2020 14:25:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32EEA1835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584451553;
	bh=9VWuIaWdOdM0ZAwgu5IkhSCVpTVt5+1PiIssoQmF6jQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RBEjP30LENmZSGxecg5R8JwT01IapDZNN1veYABieUF+NKE06reFdGMFEIq1H+SBL
	 3evm86UxZohT/5ppaY2ijHsQcFrRI9kWoO21e0YYQHtWzkFOjfFkcqSmG8lM3LxQLs
	 22JI3BeNks+SdiBI2l2eDBMF8wh0RRToysIZYhPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 163B4F800CD;
	Tue, 17 Mar 2020 14:24:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B4D8F8022B; Tue, 17 Mar 2020 14:24:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60095F800CD
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 14:23:58 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C0FF1A003F;
 Tue, 17 Mar 2020 14:23:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C0FF1A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1584451437; bh=vZjBKXah3+Gc9+mAJg+XY7h5N6lf2iEmp9JLC6lUDRA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Lsy/7uDYcg1fgDBkqR4KUtzjquns/yy/HDMAo3YRJYatyZM6OUP+ZE01hy3x7oIgp
 b0VtIFEt1VNc5bNI3MXKyjiugo3RdX6g3wc5T4tK8AWmDzD/CnbmKe6ilWlulHIjLw
 mQY15/zm5477Wgbn+nYtjUK+aLqXBm+gHg8tWv/A=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 17 Mar 2020 14:23:53 +0100 (CET)
Subject: Re: [PATCH] ucm2: hdadsp: add basic ucm config
To: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200306113031.713-1-mateusz.gorski@linux.intel.com>
 <4e2e3345-81d0-c698-d589-d4db5faff288@perex.cz>
 <8cd9195d-6104-88ed-22ed-c3151334ee76@linux.intel.com>
 <1bd9d86c-e19f-183c-5355-5b7359c6e4c0@perex.cz>
 <7a44ec22-ed38-5ddd-0f04-097b2befd796@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <9adc9d91-4227-9558-067f-40a9aa3fb561@perex.cz>
Date: Tue, 17 Mar 2020 14:23:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7a44ec22-ed38-5ddd-0f04-097b2befd796@linux.intel.com>
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

Dne 17. 03. 20 v 12:45 Gorski, Mateusz napsal(a):
> 
>>>>> Basic UCM configuration for HDA DSP generic enabling codec playback
>>>>> and
>>>>> capture on both HDA codec and DMIC ports.
>>>>
>>>> Could you describe for what Linux driver (source code) is this
>>>> configuration?
>>>
>>>
>>> This file is for Intel Skylake SST driver. Information added in v2.
>>
>> Ok, do we have this code in the vanilla linux kernel? Which .c file?
>> The driver name 'hdadsp' looks suspicious. We usually have a delimiter
>> in the driver name (like sof-hda-dsp).
> 
> 
> Yes, it is a part of Skylake driver, "hdadsp" is the name of sound card
> created on machine when using HDA generic machine driver. This machine
> driver is made of 2 .c files:
> 
>       - skl_hda_dsp_common.c
>       - skl_hda_dsp_generic.c
> 
> both are located in: sound/soc/intel/boards/
> 
> Example on production laptop:
> 
> test@test-Swift-SF515-51T:/proc/asound$ cat cards
>    0 [hdadsp         ]: hda-dsp - hda-dsp
>                         WL-SwiftSF515_51T-V1.02-Guinness_WL

Ok, I see now. The 'hdadsp' is the user configurable card identification 
(alias to the card number) not the driver name. The UCM should be in 'hda-dsp' 
directory. If the UCM validator works for you, it should be corrected.

Could you point me to the alsa-info.sh output for this hardware?

			Thank you,
				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
