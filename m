Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 752551039DF
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 13:18:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E453916DC;
	Wed, 20 Nov 2019 13:17:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E453916DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574252286;
	bh=mo2MGdW2UOopdu0Bv7PGLV1GEltDAjaovfPw7IN+y+Y=;
	h=From:To:References:In-Reply-To:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j0jx9RwkEZkloRibL3e2NNwT3NyJGJdRf3s7gLqLxlAWhXKjEacTN5fFr3ClXxx40
	 AXDHxd+K8j58J6nKzyenPC05Hx2a92MMuEUF1LTJt/Phm5Q0aURFaJVlTANFZTorSk
	 1TyydIZ8ksEv3jJrUAYUz1U9rX9sQPr42xfb1KNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F179F8013D;
	Wed, 20 Nov 2019 13:16:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E45CF800F0; Wed, 20 Nov 2019 13:16:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 412D7F800F0
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 13:16:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 412D7F800F0
IronPort-SDR: bs3TZ3jzNFulUtOYF3SmAEHMlzQVN4b6zdaNdnyFG3sGqsqsej5VsOo/5K9caiSVW3RDJJ/QV3
 muCjIwsLRg1St0Ur7KSppLRRCG+umYfSiW++H+3o3x1hW0YdMIFkjdEeV8W9GrPP6DtovybHXi
 Ii84sWo7CUwZAAZJylkAao2vPMKFAUol3h/ATdXmVnLP8P0LTUlRWGPYqVcZ4HXNW+EB1i0h1B
 HZeQwcgxtfEBuNtPCLGmjI6o7YelmFsgs3Lot/Z2lRTiCm0qvN55HsB5EWfCNzxW4iFDKJwu1i
 jeo=
X-IronPort-AV: E=Sophos;i="5.69,221,1571731200"; d="scan'208";a="43283363"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa2.mentor.iphmx.com with ESMTP; 20 Nov 2019 04:16:13 -0800
IronPort-SDR: 1moC0hKuD1NbbRb8xhHVukNosiGHF7TfOPI+xQXvyxq6dFFmxwEFbXMKVHWLO7Ngof2/zD/f/T
 Yiw3oyFAlYr/ZSgM6PaBw733VapuF3Fnh4vF7wx/xFMlVsS3u3JbFuly0mwoMxjBIhcZ0YXm9I
 7HX0LquA6ARFkPd4y1PdA/D2BF39bT8s9CE6hUvczUH83jp/kS/F2R7X7+QMJgkBK1h4TmbUvS
 hobFOkTmEC9lLZcutQWJJZP60MEV3Z3fR48ZF4B6ybonmFwdgYYSSSJNV6oAzEQsG0ZnDjA9eK
 B+k=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: 'Takashi Iwai' <tiwai@suse.de>
References: <20191111110846.18223-1-andrew_gabbasov@mentor.com>
 <s5h36eql6xq.wl-tiwai@suse.de>
In-Reply-To: <s5h36eql6xq.wl-tiwai@suse.de>
Date: Wed, 20 Nov 2019 15:15:08 +0300
Organization: Mentor Graphics Corporation
Message-ID: <000001d59f9c$321e51a0$965af4e0$@mentor.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQHVmIB51MVDpXn7r0e76hY1DU59ZaeK6/SAgAkagNA=
Content-Language: en-us
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Cc: Timo Wischer <twischer@de.adit-jv.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v3 0/7] ALSA: aloop: Support sound timer as
	clock source instead of jiffies
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

Hello Takashi,

> -----Original Message-----
> From: Takashi Iwai [mailto:tiwai@suse.de]
> Sent: Thursday, November 14, 2019 8:11 PM
> To: Gabbasov, Andrew
> Cc: alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; Jaroslav
> Kysela; Takashi Iwai; Timo Wischer
> Subject: Re: [PATCH v3 0/7] ALSA: aloop: Support sound timer as clock
> source instead of jiffies
> 
> On Mon, 11 Nov 2019 12:08:39 +0100,
> Andrew Gabbasov wrote:
> >
> > This patch set is an updated version of patches by Timo Wischer:
> > https://mailman.alsa-project.org/pipermail/alsa-devel/2019-
> March/146871.html
> >
> > This patch set is required for forwarding audio data between a HW sound
> > card and an aloop device without the usage of an asynchronous sample
rate
> > converter.
> >
> > Most of sound and timers related code is kept the same as in previous
> set.
> > The code, related to snd_pcm_link() functionality and its using for
> > timer source setting, is removed (as rejected earlier). The changes in
> this
> > update are mainly related to the parameters handling and some cleanup.
> >
> > The timer source can be initially selected by "timer_source" kernel
> module
> > parameter. It is supposed to have the following format:
> >     [<pref>:](<card name>|<card idx>)[{.,}<dev idx>[{.,}<subdev idx>]]
> > For example: "hw:I82801AAICH.1.0", or "1.1", or just "I82801AAICH".
> > (Prefix is ignored, just allowed here to be able to use the strings,
> > the user got used to).
> > Although the parsing function recognizes both '.' and ',' as a
separator,
> > module parameters handling routines use ',' to separate parameters for
> > different module instances (array elements), so we have to use '.'
> > to separate device and subdevice numbers from the card name or number
> > in module parameters.
> > Empty string indicates using jiffies as a timer source.
> >
> > Besides "static" selection of timer source at module load time,
> > it is possible to dynamically change it via sound "info" interface
> > (using "/proc/asound/<card>/timer_source" file in read-write mode.
> > The contents of this file is used as a timer source string for
> > a particular loopback card, e.g. "hw:0,0,0" (and here ',' can be used
> > as a separator).
> >
> > The timer source string value can be changed at any time, but it is
> > latched by PCM substream open callback "loopback_open()" (the first
> > one for a particular cable). At this point it is actually used,
> > that is the string is parsed, and the timer is looked up and opened.
> > This seems to be a good trade-off between flexibility of updates and
> > synchronizations or racing complexity.
> >
> > The timer source is set for a loopback card (the same as initial setting
> > by module parameter), but every cable uses the value, current at the
> moment
> > of opening. Theoretically, it's possible to set the timer source for
each
> > cable independently (via separate files), but it would be inconsistent
> > with the initial setting via module parameters on a per-card basis.
> >
> > v2:
> > https://mailman.alsa-project.org/pipermail/alsa-devel/2019-
> November/157961.html
> >
> > v3:
> > - Change sound card lookup to use snd_card_ref() and avoid direct access
> >   to sound cards array
> > - Squash commits on returning error codes for timer start and stop
> > - Some locking related fixes
> > - Some code cleanup
> 
> The patch won't work with the latest ALSA timer code found in my
> for-next branch due to the API changes.  Essentially you need to
> rewrite as:
> 	timeri = snd_timer_instance_new(...);
> 	if (!timeri)
> 		no_memory_error;
> 	timeri->flags |= ...;
> 	timeri->ccallback = ...;
> 	....
> 	err = snd_timer_open(timeri, ....);
> 	if (err < 0)
> 		error;
> 

The updated patch set version 4 was sent to mailing list:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158896.h
tml

It is based on the linux-next repo master branch as of Nov 19, 2019.

Thanks!

Best regards,
Andrew

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
