Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7F115FF44
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Feb 2020 17:27:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3A031671;
	Sat, 15 Feb 2020 17:26:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3A031671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581784032;
	bh=8G4LI1D1SE82OJ6VGbTuXxqeXpoMqWEg45k1cQ4ln/c=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GPxK2uUPKjvWt1Qjk9mHF5euSX8unP9obkvr7k1NN3soPx2mDlSIHAi9YJHSwOMPG
	 EpwCN+SoN8BsVEZf/37xc2vJQ6d0vzk8nI+TKx9Ns+3xdMktKLn87Kkii1FagwedMB
	 sum0AFmc0fSQ3EHpjQsoRmD6/4ScviqYfFyc4G1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 869ABF8015A;
	Sat, 15 Feb 2020 17:25:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF704F80147; Sat, 15 Feb 2020 17:25:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA6B3F80138
 for <alsa-devel@alsa-project.org>; Sat, 15 Feb 2020 17:25:25 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id DDEFEA0040;
 Sat, 15 Feb 2020 17:25:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz DDEFEA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1581783924; bh=YfGEK2MAmAaNYrmGW5D2kBrIDPtxbaCAKNexZbbyk+s=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=ELMVRH5iBlko2ey68PH5RtPGzno9DByXKqs07kEEy9nHtQiIEkM1TbVU+xRUMAayU
 YRRrIy6WS433OdM9Mu4vGW/EBKoIOoTFlYKVKB+11UTnD3NOAMoc3T7nCn7OL2OQ0n
 BboKa36762uAOreJZQIjpm0vQ6Nqu2S0fbRTBrGs=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sat, 15 Feb 2020 17:25:22 +0100 (CET)
To: Tanu Kaskinen <tanuk@iki.fi>, alsa-devel <alsa-devel@alsa-project.org>
References: <50ae39498982ba2fc3fc8df1b9f0eac15a2b98c8.camel@iki.fi>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <cb58008e-e9cc-8390-cfc8-c5c93d31c862@perex.cz>
Date: Sat, 15 Feb 2020 17:25:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <50ae39498982ba2fc3fc8df1b9f0eac15a2b98c8.camel@iki.fi>
Content-Language: en-US
Subject: Re: [alsa-devel] Question about the various mixer options in UCM
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

Dne 15. 02. 20 v 7:29 Tanu Kaskinen napsal(a):
> What's the difference between PlaybackVolume, PlaybackMixerElem and
> PlaybackMasterElem? Other than the obvious difference that
> PlaybackVolume is used only to configure the volume control, whereas
> PlaybackMixerElem and PlaybackMasterElem are used also to configure the
> mute control.

At first, I don't really know if someone uses PlaybackVolume/PlaybackSwitch. 
It was defined for the direct control interface (not the mixer interface). I 
do not think that we should support this.

I defined new PlaybackMixerElem to select the simple mixer element which 
controls both volume and switch (mute) in the ALSA API. The master volume 
might be also in the chain (thus PlaybackMasterElem) was introduced.

It seems that it might be not enough and I play with an idea to build custom 
mixer description to handle the special cases (like several speakers with the 
different volume controls connected to the single stereo stream etc.).

To keep things simple, I would probably hide all functionality to 
PlaybackMixer/PlaybackMixerElem and CaptureMixer/CaptureMixerElem . The 
special mixer name will create the abstract mixer for the applications and 
only one simple mixer element control will set the appropriate volume for
the stream (like pulseaudio actually does for the legacy ALSA support - volume 
synthetizer). So UCM will describe the mixer for alsa-lib and application will 
use only abstract interface to set / get the volume and mute state.

Actually, I am also trying to resolve the description of the speaker 
configuration. It may not be only enough to give the PCM device, because we 
don't know, if user connected the stereo or surround speakers to the sound 
card output for example. I play with an idea to add device variants to UCM, 
but the question is, how we can map this to pulseaudio profile/port schematics.

My quick idea is to export those variants via the verbs, so the exported verb 
names might look like:

HiFi:Speaker-Stereo
HiFi:Speaker-5.1

Where 'HiFi' is the verb name, 'Speaker' is the device name and 'Stereo' is 
the variant name.

If we need to define multiple variants, all may be exported like:

HiFi:Speaker-5.1,Mic-4.0

Also, we can enhance this and store the configuration to a file, thus 'HiFi' 
can refer to 'HiFi@Speaker-5.1,Mic-4.0' by default.

I welcome any opinions on this. The goal is to provide the complete abstract 
description of the sound hardware for sound servers like pulseaudio. We can 
use this abstraction for the command line ALSA applications, too.

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
