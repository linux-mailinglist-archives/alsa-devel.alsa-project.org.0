Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F213BB26A
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Sep 2019 12:49:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C27B11684;
	Mon, 23 Sep 2019 12:48:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C27B11684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569235763;
	bh=Uj+BlXfPPSSPeM2l8OEpUQIQFmnk8EqlsNMWHJefecQ=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TkNXipXrUMlOvVF/2Ter25+q7WmmvI0bPbZWPb5RKTUTwIcU/GBxCniCDaV+YVCCU
	 JplKMTp5Xm2vJgsDvPLaz+Pn+KYtzh5j03N8ikrZjhhD6E38Ov84T6Tn6V0FJ/Evaj
	 ms1OOYpE8Q0P+C5XrK+Njjoex3XPjktehaXjSSFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AADDF8044C;
	Mon, 23 Sep 2019 12:47:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71EAAF8044C; Mon, 23 Sep 2019 12:47:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FROM,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 173CEF80213
 for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2019 12:47:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 173CEF80213
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id 279971FF3E;
 Mon, 23 Sep 2019 12:47:34 +0200 (CEST)
Received: from [192.168.108.37] (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id 891ED1FF27;
 Mon, 23 Sep 2019 12:47:33 +0200 (CEST)
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
To: alsa-devel@alsa-project.org
References: <f7861989-8a2d-ed89-8f1f-68bad7013a34@free.fr>
 <d67b68b9-49c0-6f78-4649-27b3b437a65f@free.fr>
Message-ID: <878168cb-07e0-cdfd-37e9-9b9fb229155b@free.fr>
Date: Mon, 23 Sep 2019 12:47:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d67b68b9-49c0-6f78-4649-27b3b437a65f@free.fr>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Mon Sep 23 12:47:34 2019 +0200 (CEST)
Cc: Takashi Iwai <tiwai@suse.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] Propagating audio properties along the audio path
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 20/09/2019 11:50, Marc Gonzalez wrote:

> One more concern popped up: if the audio stream changes mid-capture
> (for example, a different TV program uses different audio settings),
> then I would detect this in the eARC receiver, but it's not clear
> (to me) how to propagate the info to the DSP...
> 
> I'm not even sure when the HW params actually get applied...
> Is it for SNDRV_PCM_IOCTL_PREPARE? SNDRV_PCM_IOCTL_START?

I enabled debug logs in the sound layer:
echo "file sound/* +fpm" > /sys/kernel/debug/dynamic_debug/control

and sprinkled dump_stack() in several driver callbacks.

When I run 'tinycap /tmp/earc.wav -t 10 -r 44100 -b 32'
I see the open/SyS_openat call and the capture ioctl call
which together generate calls to
1) dpcm_fe_dai_open
2) dpcm_fe_dai_hw_params
3) dpcm_fe_dai_prepare
4) dpcm_fe_dai_trigger

But everything looks "synchronous", as in "reaction to user-space commands".
I don't see how "asynchronous" events are dealt with, such as the stream
params changing while a capture is active?

Regards.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
