Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADBD19FF24
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 22:35:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A355E15E2;
	Mon,  6 Apr 2020 22:34:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A355E15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586205335;
	bh=Pya7f/qPgktTcBOGR+heSksHGZeLv2K+MTTmwaDJ86g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q4lYGyOujcAoUp//ZvjN7/5iHSOZl4gKy+0eAArsln1qMQR5OPv8R/ejwCM1ICoRf
	 urLjPNUBH9+DDZgwkGPwCvMZ+NzprkAr0VeN8vGw1WP7j2HMqDrAWfERmc0fvmhNFM
	 2vXI9ggmfd3TwjlcOfPyqs0TkZyTV8zfoisu23qk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC8AAF800CC;
	Mon,  6 Apr 2020 22:33:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA833F80143; Mon,  6 Apr 2020 22:33:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F00EF800CC
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 22:33:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F00EF800CC
IronPort-SDR: r1xqGpFlIQFJwh1D57LsTmIbVrjS51FvvpRhvBKWbOce+hswt57FVwqkvxLp5qQ7tE5lOUmXFK
 7C0PQwoN98ig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 13:33:38 -0700
IronPort-SDR: 52clbgKqT2S4Kp/3T53Awfp9PSUN4t1ngCbZpKtZ731wgosgpS+kqES0TK1i0nKEtyei624pCH
 BXKEC1/AyUxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,352,1580803200"; d="scan'208";a="424488414"
Received: from stuartca-mobl.amr.corp.intel.com (HELO [10.134.36.144])
 ([10.134.36.144])
 by orsmga005.jf.intel.com with ESMTP; 06 Apr 2020 13:33:36 -0700
Subject: Re: [PATCH 4/5] chtrt5645: Remove bogus JackHWMute settings
To: Jaroslav Kysela <perex@perex.cz>, Hans de Goede <hdegoede@redhat.com>
References: <20200405183454.34515-1-hdegoede@redhat.com>
 <20200405183454.34515-4-hdegoede@redhat.com>
 <d06f3894-6cd7-fd4e-2261-94505fc0db4a@linux.intel.com>
 <c19aadd5-80b4-91de-4e0a-344e21125883@redhat.com>
 <3198cbfb-f498-2c82-88cd-c8b7d0b53574@linux.intel.com>
 <2ba90327-6a23-7c5f-5b4e-f01e51b59ace@redhat.com>
 <f6832844-8fe1-9a9b-57a5-f13b072b79a1@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a1c67d9a-c327-0d3e-3c89-5487e64d9125@linux.intel.com>
Date: Mon, 6 Apr 2020 13:36:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f6832844-8fe1-9a9b-57a5-f13b072b79a1@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>
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


>>> If I follow the logic, I guess we should also remove the JackHWMute 
>>> for sof-bdw-rt5677, hda-dsp and HDA-Intel. I can't think of a 
>>> hardware limitation preventing the headset mic from being used while 
>>> the speakers are used for playback. Likewise the rt5650 is a cheaper 
>>> version of rt5645 so the same applies.
>>
>> Right AFAIK:
>>
>> JackHWMute "foo"
>>
>> Means that the JackControl listed in the same section does
>> something at the hardware level which makes it impossible
>> for the "foo" input / output to function until the jack
>> is removed. Typically this would be something like actually
>> disconnecting the speakers at the electrical level.
>>
>> So almost always using it is wrong.
> 
> I agree. The description is really straight (use-case.h):
> 
> "Note that JackHWMute should be used only when the hardware enforces the 
> automatic muting."
> 
> Pierre, it seems that hds-dsp uses JackHWMute for Speaker and 
> Headphones, I think that it should be removed. Otherwise PA thinks that 
> those devices cannot be used simultaneously when user wants to..

Right, that hda-dsp UCM config probably needs more work between the 
JackHWMute and only supporting 2 HDMI paths, but that's not maintained 
by me or anyone on the SOF team. Adding Mateusz Gorski in Cc:



