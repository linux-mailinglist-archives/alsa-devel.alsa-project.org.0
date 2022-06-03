Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 485C453D1B6
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 20:45:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 617C818AB;
	Fri,  3 Jun 2022 20:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 617C818AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654281924;
	bh=qFeh7H+TWfs1iFijXBP/63LZcTjVbQnOzHDX7JLqfCU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yix/qLYNfZzWnaKk74lEmCO8XJsR7SHD97Kgjcq6ycHGcKzbF+ZTlugMQktpoNbv3
	 o83uqUHq8P7QBPeC6zsi0OQQRy+H4dkMs7U0Mc6IvvGZpTwaAhczaKWBxRIRPMMqG0
	 yVXDghpg/F9RjZvevCrkXOKV+dAMlxnfQCHWKdbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCAA4F804D1;
	Fri,  3 Jun 2022 20:44:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9AC4F804CC; Fri,  3 Jun 2022 20:44:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D051F80124;
 Fri,  3 Jun 2022 20:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D051F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PpJRrYcj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654281862; x=1685817862;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qFeh7H+TWfs1iFijXBP/63LZcTjVbQnOzHDX7JLqfCU=;
 b=PpJRrYcjZE7SErsH+q2b7Dxy/Y17emvsZjpjcZCCHQCGd3TpbtLEq+Wu
 p9n8w/deAZ2kYPbZfQOq/ERDIMmFGrSFjrkZ7oFTNWJesoQCcL/BnrwVf
 pFjvDrvxFo9zGaRRNrTqYRKC5wu1U4hcfJTWZZgagn+gf+m+D/HMHD2T7
 guwNV/pSXjM5MycI1CNOPUCa4T9utZqcHmEHlqv+hoMeOtwOHRE8Cnm0v
 MoZvvEk0fsduSZJCO1MM1PRADSH9bxg39PnLubHc1Pq6Tr71FIvyp8T12
 qJkQsbt/fluwkaAMwL930zCBYVnaB06532wo234PA+2UAnkwRNGfLe3mQ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10367"; a="362688936"
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; d="scan'208";a="362688936"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 11:44:14 -0700
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; d="scan'208";a="824881643"
Received: from linwayn1-mobl1.amr.corp.intel.com (HELO [10.212.249.119])
 ([10.212.249.119])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 11:44:13 -0700
Message-ID: <b7ea144b-1541-106f-c47e-7049c62b6df4@linux.intel.com>
Date: Fri, 3 Jun 2022 13:44:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [Sound-open-firmware] jack detection via input/event on linux
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, hede <alsa426@der-he.de>
References: <d8b21eb11013b6dd1e90e425bd808951@der-he.de>
 <fe472e98-82b8-bba4-364a-930d8616b4e2@perex.cz>
 <31258284cefb38127e84b2d098f8e2aa@der-he.de>
 <cb35ce57-7696-3edb-459a-d2e8557a4748@perex.cz>
 <571618d8-fdd8-eaab-a8e8-c26857e97580@linux.intel.com>
 <838d6161-5b17-1fd7-d864-9e0f13bf2ef5@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <838d6161-5b17-1fd7-d864-9e0f13bf2ef5@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 sound-open-firmware@alsa-project.org
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


>>> It seems that many ASoC drivers do not create kctls - the argument pins
>>> is zero in the snd_soc_card_jack_new() call. The SND_JACK_HEADSET should
>>> be remapped to kctl in sound/soc/intel/boards/sof_rt5682.c, too.
>>
>> Did you mean something like the patch below Jaroslav? If yes, most of
>> the Chromebook machine drivers are missing this remapping. That would
>> also explain why the jack detection didn't work on my GLK test device,
>> despite a UCM file that looked good...
> 
> Yes, it looks like a way to go. It seems that the drivers were tested
> only with the CRAS audio server. Note that pulseaudio can be run with
> the user permissions only - thus the input devices may not be reachable.

I added a similar patch on a GeminiLake device, and it does help with
jack detection (along with an update in
https://github.com/alsa-project/alsa-ucm-conf/pull/150).

I can see PulseAudio detecting the changes, but for some reason the
automatic switch only happens when the jack is unplugged. I still have
to manually select the headphone/headset after plugging it in. Likely
still missing something in the UCM file?


D: [pulseaudio] module-alsa-card.c: Jack 'Headphone Jack' is now unplugged

D: [pulseaudio] device-port.c: Setting port [Out] Headphone to status no

D: [pulseaudio] module-switch-on-port-available.c: Trying to switch away
from port [Out] Headphone, found [Out] Speaker

D: [pulseaudio] module-alsa-card.c: Jack 'Headset Mic Jack' is now unplugged

D: [pulseaudio] device-port.c: Setting port [In] Headset to status no

D: [pulseaudio] core-subscribe.c: Dropped redundant event due to change
event.

D: [pulseaudio] module-switch-on-port-available.c: Trying to switch away
from port [In] Headset, found [In] InternalMic


<<< AUTOMATIC SWITCH DONE

D: [pulseaudio] module-alsa-card.c: Jack 'Headphone Jack' is now plugged in

D: [pulseaudio] device-port.c: Setting port [Out] Headphone to status yes

D: [pulseaudio] module-alsa-card.c: Jack 'Headset Mic Jack' is now
plugged in

D: [pulseaudio] device-port.c: Setting port [In] Headset to status yes


<<< NOTHING HAPPENS HERE

D: [pulseaudio] module-alsa-card.c: Jack 'Headphone Jack' is now unplugged

D: [pulseaudio] device-port.c: Setting port [Out] Headphone to status no

D: [pulseaudio] module-switch-on-port-available.c: Trying to switch away
from port [Out] Headphone, found [Out] Speaker

D: [pulseaudio] module-alsa-card.c: Jack 'Headset Mic Jack' is now unplugged

D: [pulseaudio] device-port.c: Setting port [In] Headset to status no

D: [pulseaudio] core-subscribe.c: Dropped redundant event due to change
event.

D: [pulseaudio] module-switch-on-port-available.c: Trying to switch away
from port [In] Headset, found [In] InternalMic

