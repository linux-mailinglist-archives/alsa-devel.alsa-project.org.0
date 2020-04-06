Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BDA19F9BA
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 18:07:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71412167B;
	Mon,  6 Apr 2020 18:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71412167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586189246;
	bh=2Z9RwhPGVJJDgcNSj0YAjiqLZA6stb3+3hGvblRifVo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q/ifrr9q2uqljIzlnbSv1djVl+LwIXHyrYZ2fKGB6MfpSUww0HqazUboFVUucFyO5
	 xvw5i5ciO6X4kT+4uoDKphUkRNIQD8BmscxQuuAlIW60SwRYfTjNWLELdMpEgrTskG
	 GYQcurF3pBHH2q1ozZqSyXSwPtqZJPD3DYYXIIJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D230F80142;
	Mon,  6 Apr 2020 18:05:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 245B7F80121; Mon,  6 Apr 2020 18:05:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55685F80121
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 18:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55685F80121
IronPort-SDR: AW/RSCp4utbdiYMTTUc+YZpBt0eJC8xOTcysPTORrtQRzfOCfrc4vAFJVz+423cg1IYuo+iyTD
 VZfxB8OYXUYw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 09:05:32 -0700
IronPort-SDR: vhyd0vxreIMGFYq5oJgBBhnNAj7O7uHBEngXgEVFKK7JahBwDKPTD52rcpKM3MaSbr3EdKjcRZ
 amXeYPHqZ/pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,351,1580803200"; d="scan'208";a="361256312"
Received: from mmarathe-mobl1.amr.corp.intel.com (HELO [10.212.38.219])
 ([10.212.38.219])
 by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2020 09:05:32 -0700
Subject: Re: [PATCH 4/5] chtrt5645: Remove bogus JackHWMute settings
To: Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>
References: <20200405183454.34515-1-hdegoede@redhat.com>
 <20200405183454.34515-4-hdegoede@redhat.com>
 <d06f3894-6cd7-fd4e-2261-94505fc0db4a@linux.intel.com>
 <c19aadd5-80b4-91de-4e0a-344e21125883@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3198cbfb-f498-2c82-88cd-c8b7d0b53574@linux.intel.com>
Date: Mon, 6 Apr 2020 10:17:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c19aadd5-80b4-91de-4e0a-344e21125883@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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


>> So overall it seems rather unlikely that we can support dmic + headset 
>> mic in parallel?
> 
> Right that is what the ConflictingDevices sections are for.
> 
> Removing the JackHWMute does not allow using both add the same time,
> it merely allows overriding which of the 2 to use (if the headset mic
> is detected by the jack, the JackControl setting is kept).
> 
> So lets say the internal mic is crappy, but the user prefers to
> have their ears free, then they can use a headset around there neck,
> using just the headset-mic and select speakers as output even though
> a jack is inserted.
> 
> Note pulseaudio will still automatically switch to the headphones /
> headsetmic when plugged in, this merely allows overriding that
> choice manually.
> 
> Jacks which actually physically disable (or re-route) signals are
> quite rare now a days so having a JackHWMute in the UCM conf is
> often wrong. After this patch only a few cases are left:
> 
> [hans@x1 alsa-ucm-conf]$ ack -l JackHWMute ucm2
> ucm2/HDA-Intel/HiFi-dual.conf
> ucm2/chtrt5650/HiFi.conf
> ucm2/hda-dsp/HiFi.conf
> ucm2/codecs/es8316/HeadPhones.conf
> ucm2/sof-bdw-rt5677/HiFi.conf
> ucm2/broxton-rt298/HiFi.conf
> ucm2/skylake-rt286/HiFi.conf
> 
> The es8316 case is actually correct, the es8316 has only 1
> output (which is amplified for e.g. a speaker) and at
> least the reference design suggests routing the speaker signal
> through the jack and using a jack which will interrupt the
> signal when headphones are plugged in.
> 
> Note most actual designs implement this with an analog
> switch and a GPIO to control that switch, since 3.5 mm
> jacks which actually can disconnect a signal are rare
> (if they exist at all, but I guess they do). For the
> designs using the GPIO controlled analog switch, the
> JackHWMute technically also is wrong, but I put it
> there (IIRC it was me) because it matches the reference
> design.
> 
> I'm not familiar enough with any of the others to say anything
> about them, but most of them are for HDA setups, where this
> is somewhat more normal I guess.

If I follow the logic, I guess we should also remove the JackHWMute for 
sof-bdw-rt5677, hda-dsp and HDA-Intel. I can't think of a hardware 
limitation preventing the headset mic from being used while the speakers 
are used for playback. Likewise the rt5650 is a cheaper version of 
rt5645 so the same applies.

