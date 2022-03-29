Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B48F4EACC9
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Mar 2022 14:01:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE1D01E0;
	Tue, 29 Mar 2022 14:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE1D01E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648555265;
	bh=4Js7Okx3WZ5YiFvXlAEg4Lq61fA5nt0LHlshY/hwiE8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tQ9xdE3/moX5Wn76nbWoj2dP/g4Nkc/fAc+DajfhWFY/GFL5+e+/7WwkBnp7ssrZL
	 TtrVsMk+5PIY3HWXo/ZI6QUd9n4F19d0LKXheY9cy1mQE06zSMZPRsbEn5mYvlpNyG
	 q6n/hjFMPxEJrDQ3gAXhkqQmGNIGeNdrOTIxYYoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31769F804B0;
	Tue, 29 Mar 2022 13:59:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4BA4F800F2; Tue, 29 Mar 2022 13:59:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC6DEF800F2
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 13:59:51 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C41E8A0040;
 Tue, 29 Mar 2022 13:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C41E8A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1648555190; bh=30HjX/XteObhjoD4FWtYPMTGpsW39qr6KPqj72ltdQY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ec/KZ6lwPm57EE/HAm+5gYnP4bmh86UyPXhNEYtPwWPHcPea+fJ9RdjheVRTvjFgg
 LKYZ1RNI1UQtuRpO+t2XVZBzBmafIFpf9KVgJX97gUiIIZmehOi4u1lqSmV+StfhMD
 JL++7y9pSzIzXTH8gFU0E0mDsoOPcgHvVZmA+/SY=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 29 Mar 2022 13:59:44 +0200 (CEST)
Message-ID: <1d4d3051-c4e8-6972-993c-2fd8254a5501@perex.cz>
Date: Tue, 29 Mar 2022 13:59:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: SOF: topology: use new sound control LED layer
Content-Language: en-US
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20220329080351.2384110-1-perex@perex.cz>
 <5d966a7e-816a-0c68-0dda-adde0d8a2f8c@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <5d966a7e-816a-0c68-0dda-adde0d8a2f8c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

On 29. 03. 22 12:16, Péter Ujfalusi wrote:
> Hi Jaroslav,
> 
> On 29/03/2022 11:03, Jaroslav Kysela wrote:
>> Use the new sound control LED layer instead the direct ledtrig_audio_set()
>> call - see 22d8de62f11b ("ALSA: control - add generic LED trigger module
>> as the new control layer").
> 
> Don't we need to select SND_CTL_LED from SOF to make sure that the LED
> trigger module is available?

This feature is optional and the current code does not even forcefully select 
the LEDS_TRIGGERS and LEDS_TRIGGER_AUDIO, too. There was 
IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO) condition. I think that this change 
should be handled separately (if required).

Unfortunately, I forgot to call snd_ctl_led_request() to load the LED trigger
module when available. I will send v2 ASAP.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
