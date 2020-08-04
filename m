Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAAE23BC62
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 16:39:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 882011662;
	Tue,  4 Aug 2020 16:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 882011662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596551986;
	bh=pt6nSEN4hsIdukRjC56DjAQsF8joQR8hEYXJxSQwXUw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HH3wpg2ONxGWIUryuV4vvmorvmEiqCGZgkv5XmYcTt9YGjtN4+Q9vzuFOgB6ambYk
	 OJ6RTtpoqd7VrKM/xpPh7k/aX45kGJy+9yuU/g/Gezxn3Gmi55mav+L0OJ+pDi4VV0
	 gWxTeoF4Qb3+kQGGt2aSCcdo09n9zB8Y219toIz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A907FF80148;
	Tue,  4 Aug 2020 16:38:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F3EFF80150; Tue,  4 Aug 2020 16:38:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D577CF80148
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 16:37:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D577CF80148
IronPort-SDR: yguTYRDQbLd46fLgt9wzWSmjyLZQYCkjiXkMAJdgRAUGGYjdsUkossUU8cxoFeTSd6ETewnfaq
 iIQEfI2x+0SA==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="149765754"
X-IronPort-AV: E=Sophos;i="5.75,434,1589266800"; d="scan'208";a="149765754"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2020 07:37:47 -0700
IronPort-SDR: 0O2MZEl7Eg48SOUPqrBUngI5U3PdOkw65Bg26mV8nsF5Wrvd+a/hJjrh8564lXjrc35WYSuWrh
 f6aQpovRXosw==
X-IronPort-AV: E=Sophos;i="5.75,434,1589266800"; d="scan'208";a="288582905"
Received: from gggmerek-mobl.amr.corp.intel.com (HELO [10.212.131.193])
 ([10.212.131.193])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2020 07:37:46 -0700
Subject: Re: Lenovo m720s combined audio jack not working (ALC233)
To: Bastien Nocera <hadess@hadess.net>, alsa-devel@alsa-project.org
References: <fd8d4a187c86c3514e4442a404ad2568014c5d0b.camel@hadess.net>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <def6195d-776d-409d-518c-872a0dff17b6@linux.intel.com>
Date: Tue, 4 Aug 2020 09:37:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fd8d4a187c86c3514e4442a404ad2568014c5d0b.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Mark Pearson <markpearson@lenovo.com>, David Henningsson <diwic@ubuntu.com>
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



On 8/4/20 4:56 AM, Bastien Nocera wrote:
> Hey,
> 
> The front audio jack on my newly purchased (but not new) Lenovo m720s
> doesn't make a microphone output appear in PulseAudio when a headset is
> plugged in. The headphone part works correctly though. The "sof-hda-dsp
> Front Headphone" evdev device will switch the state of
> SW_HEADPHONE_INSERT as expected.

I would first try with the HDaudio legacy driver to separate variables. 
This will likely prevent your internal DMICs from working but will help 
you test without UCM.

options snd_intel_dspcfg dsp_driver=1

That way you'll be able to see if the jack detection actually works.

If it doesn't, it's a codec configuration/driver issue.
It it does, it's somehow a PulseAudio/UCM issue. If indeed the 
information is reported as an event then I am leaning to a UCM issue 
with the wrong mixer being used.

> Does anyone know whether the headphones/headset switching is supposed
> to be automatic, or would that trigger a "what did you plug in"
> dialogue as on some Dell machines I've worked with?
> 
> I couldn't find any quirks in sound/pci/hda that would be directly
> related to this problem (eg. Lenovo, ALC233 and mic presence), so I'm a
> bit stumped.
> 
> I've attached the pinout information from alsa-info.
> 
> Any ideas?
> 
> Cheers
> 
> 
