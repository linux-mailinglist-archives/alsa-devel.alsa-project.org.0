Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B73E1076DE
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 18:59:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B139A1838;
	Fri, 22 Nov 2019 18:58:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B139A1838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574445582;
	bh=0Wx/iA/CbR5gDbqV7qAaHZdTtW108jfTI2+1cg/l5qU=;
	h=From:To:References:In-Reply-To:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DCoxruKD1kTKkFzH1r0hKt6cA2HNntpFwxDbm3hOG9dFpiBTnNXUaHHDdWtTu97yR
	 AwqBRIa7ugRg4rRuCVwhDdp7JYPNW2py56PZhk/mDfiYF4g8oPDQCB7YwerlwpO8FB
	 5iENSNmQijCv/iorkEzEwhxMMOkB3uD3LNb8tcnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 232A9F8014A;
	Fri, 22 Nov 2019 18:57:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B28AF80140; Fri, 22 Nov 2019 18:57:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62AA4F800EF
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 18:57:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62AA4F800EF
IronPort-SDR: W6goTO94ykNvLWI1XUpfn6cgC8HkjyjS+acPdhN+uSkHRVOWztqxZW9UstCGOXEwFlYSAIwm2D
 PAaQYQ26YAxWxowANKPZATvnQC53ZU2x53jvuV+Q0aFm6o/WuxN0VFbn/ffG3Gr4F+SwmQZQLC
 5QSDWM8b7h5FdYRq2IfpyfEx2Jsi4osEL4TwUG7trA3M8fE8WhWK4dlWqCfaI14+Fq93I1uQoq
 vUd4O0Tc7YvCwLaKF9fLSDdTODlzHrKpyzVXL4azcbH/0WWdwJR467k6wZQEna4rmhyvFXnUbL
 9xI=
X-IronPort-AV: E=Sophos;i="5.69,230,1571731200"; d="scan'208";a="45307818"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa1.mentor.iphmx.com with ESMTP; 22 Nov 2019 09:57:49 -0800
IronPort-SDR: lqQfW2r8D2WklT+Wja549BGc5dY5HXVZ5gKTGsCblkSa1szwOnIRCy9N+EZNGXMgqEfCY6Eyt5
 z7o2QNP/yY2YH26Xvbvr4jaSN/LqY/2Gbmy5W83WVgNG53vYh162eAGRzU4Iqx68qJCsLLUQQw
 Q7zNPbO3MbpaJYmCjua7/TUNusOTdkSmMGbtSwDyT+F/ITjIoWXpk7UqBt6fLYGMC/I88IYGPv
 SIPQMdmPQRZpfzp4n9iJZ2U3ml50HRjTa7xdNPo087ZwMTUx4FDsLoRCyEMP6biYGIBqtZ0VBZ
 JSQ=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: 'Takashi Iwai' <tiwai@suse.de>
References: <20191120174955.6410-1-andrew_gabbasov@mentor.com>
 <s5hblt6v0x4.wl-tiwai@suse.de>
In-Reply-To: <s5hblt6v0x4.wl-tiwai@suse.de>
Date: Fri, 22 Nov 2019 20:56:42 +0300
Organization: Mentor Graphics Corporation
Message-ID: <000001d5a15e$3dc81c20$b9585460$@mentor.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQHVn8sGSSfaGACQHE2XYQ6MReKZVqeUZruAgAKrbqA=
Content-Language: en-us
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Cc: Timo Wischer <twischer@de.adit-jv.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v5 0/7] ALSA: aloop: Support sound timer as
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
> Sent: Wednesday, November 20, 2019 9:49 PM
> To: Gabbasov, Andrew
> Cc: alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; Jaroslav
> Kysela; Takashi Iwai; Timo Wischer
> Subject: Re: [PATCH v5 0/7] ALSA: aloop: Support sound timer as clock
> source instead of jiffies
> 
> On Wed, 20 Nov 2019 18:49:48 +0100,
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
> > https://mailman.alsa-project.org/pipermail/alsa-devel/2019-
> November/158312.html
> > - Change sound card lookup to use snd_card_ref() and avoid direct access
> >   to sound cards array
> > - Squash commits on returning error codes for timer start and stop
> > - Some locking related fixes
> > - Some code cleanup
> >
> > v4:
> > https://mailman.alsa-project.org/pipermail/alsa-devel/2019-
> November/158896.html
> > - Change to use updated API for snd_timer_open() (separate timer
> instance)
> > - Change to use snd_timer_close() returning void
> > - Some code cleanup
> >
> > v5:
> > - Change to initialize timer event tasklet before calling
> snd_timer_open()
> >
> >
> > Andrew Gabbasov (1):
> >   ALSA: aloop: Support runtime change of snd_timer via info interface
> >
> > Timo Wischer (6):
> >   ALSA: aloop: Describe units of variables
> >   ALSA: aloop: Support return of error code for timer start and stop
> >   ALSA: aloop: Use callback functions for timer specific implementations
> >   ALSA: aloop: Rename all jiffies timer specific functions
> >   ALSA: aloop: Move CABLE_VALID_BOTH to the top of file
> >   ALSA: aloop: Support selection of snd_timer instead of jiffies
> 
> Now applied all patches.  Thanks.

Thank you very much!

Unfortunately, I found some issue with locking in patch 6
(sorry for late finding):
loopback_parse_timer_id() uses snd_card_ref(), that can lock on mutex,
also snd_timer_instance_new() uses non-atomic allocation, that can sleep.
So, both functions can not be called from loopback_snd_timer_open()
with cable->lock spinlock locked.

Also, most part of loopback_snd_timer_open() function body works
when the opposite stream of the same cable does not yet exist, and
the current stream is not yet completely open and can't be running,
so existing locking of loopback->cable_lock mutex is enough to protect
from conflicts with simultaneous opening or closing.

So, it looks like locking of cable->lock spinlock is not needed
in loopback_snd_timer_open() at all
(similarly to loopback_snd_timer_close_cable()).

I'm sending a separate patch to fix this:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/159087.h
tml

Also, when you requested to move tasklet_init() call to before
snd_timer_open() call, I should have guessed to look into the
reverse closing side too ;-)
Now, I have to add one more patch to move tasklet_kill() call
to after snd_timer_close().
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/159088.h
tml

Please, take a look at the patches.

Thanks!

Best regards,
Andrew

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
