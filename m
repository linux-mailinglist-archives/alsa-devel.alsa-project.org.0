Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9CFF2CBB
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 11:42:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D16A21674;
	Thu,  7 Nov 2019 11:41:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D16A21674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573123334;
	bh=EU5a4UJFOBRCCh9XuVLJ1zbtr7beq8JHWr3MOjgxV3k=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PtVh8fdU/ZbrdZjrIJfWUd+mVxTLys8GjmjXI9BalzWSdFk+om1B12rC+t9OY24Vr
	 gpWTdoJ0vDnFSZP/+BZXmmiFZVxs6SsmDQhHm7Z91pNyIwJv3VW/q/zvwxXTjtprSk
	 fIrP9+Wzr/Xhn207FdP6mGNDmgVc56nmF8OuLt5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C670F8049B;
	Thu,  7 Nov 2019 11:40:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F4D1F8049B; Thu,  7 Nov 2019 11:40:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83B2FF80111
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 11:40:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83B2FF80111
IronPort-SDR: r7lkK+eBZUYLwMrJBbYWs2zdQWR13o9ykW0u4IAUFi8I0eGLuHkrCzpIQhAn2t5nkV57jipokJ
 G5yZ5kvyBAEtazU3K6LW0oDFre7aqlweshHNug0TmQRqsjm2F7KYDLUREib2hIlj885vCIcLYD
 VC7XJ/e3/6KmsGdMQGY74YIsbaO4HjejsZyoofN2OgEdwIJLwJBlfWv4B9f1s7hM+crwber2T/
 pAYzRfXi419SRymZnmBiNHTRi7iQy5Eh+eFseJuol2G7IulX/38H2D2LzkqbQfyM24v+27876s
 Xmo=
X-IronPort-AV: E=Sophos;i="5.68,277,1569312000"; d="scan'208";a="42956678"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 07 Nov 2019 02:40:22 -0800
IronPort-SDR: OBXVEr84vlljD/nalAp8A54rljQ2SYQlCGJOD7FZyWqXJyhLonDrJXg+JubTVGgu/BD0W6L+Og
 MlW8sYfsHBfVKIk5GuAuwvy6Q2JQ/Jtm/0FjaHWrja+slybzu/Gg0lr3lnj1bISWkDO9U9z9SZ
 p3DRxXJaLZJGJQkjVPJjJ+DvSZaf7DXe+QZsjyerr2PDizCU2kWtgMRgYgUWV/ZQr0Lrw0asAW
 ZZDmUTmzhsOoTSZ0A9lFXPIAHBxhJ9dT006b9tKCofLuI+DQnfJ/VDaHZK7b2H9l7I3HKmpbNq
 a9o=
From: "Gabbasov, Andrew" <Andrew_Gabbasov@mentor.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: [PATCH v2 8/8] ALSA: aloop: Support runtime change of snd_timer
 via info interface
Thread-Index: AQHVk+YoG5RC36oMHkeh2PePUSo5Rqd/XLQAgAAn8wA=
Date: Thu, 7 Nov 2019 10:40:18 +0000
Message-ID: <2dc6e7841e97441aa3b91fca8e5629e9@svr-ies-mbx-02.mgc.mentorg.com>
References: <20191105143218.5948-1-andrew_gabbasov@mentor.com>
 <20191105143218.5948-2-andrew_gabbasov@mentor.com>
 <20191105143218.5948-3-andrew_gabbasov@mentor.com>
 <20191105143218.5948-4-andrew_gabbasov@mentor.com>
 <20191105143218.5948-5-andrew_gabbasov@mentor.com>
 <20191105143218.5948-6-andrew_gabbasov@mentor.com>
 <20191105143218.5948-7-andrew_gabbasov@mentor.com>
 <20191105143218.5948-8-andrew_gabbasov@mentor.com>
 <20191105143218.5948-9-andrew_gabbasov@mentor.com>
 <s5hk18c860t.wl-tiwai@suse.de>
In-Reply-To: <s5hk18c860t.wl-tiwai@suse.de>
Accept-Language: en-US, en-IE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
MIME-Version: 1.0
Cc: Timo Wischer <twischer@de.adit-jv.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 8/8] ALSA: aloop: Support runtime change
 of snd_timer via info interface
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

Thank you very much for your feedback!

> -----Original Message-----
> From: Takashi Iwai [mailto:tiwai@suse.de]
> Sent: Thursday, November 07, 2019 11:06 AM
> To: Gabbasov, Andrew
> Cc: alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; Jaroslav
> Kysela; Takashi Iwai; Timo Wischer
> Subject: Re: [PATCH v2 8/8] ALSA: aloop: Support runtime change of
> snd_timer via info interface
> 
> On Tue, 05 Nov 2019 15:32:18 +0100,
> Andrew Gabbasov wrote:
> >
> > Show and change sound card timer source with read-write info
> > file in proc filesystem. Initial string can still be set as
> > module parameter.
> >
> > The timer source string value can be changed at any time,
> > but it is latched by PCM substream open callback (the first one
> > for a particular cable). At this point it is actually used, that
> > is the string is parsed, and the timer is looked up and opened.
> >
> > The timer source is set for a loopback card (the same as initial
> > setting by module parameter), but every cable uses the value,
> > current at the moment of open.
> >
> > Setting the value to empty string switches the timer to jiffies.
> >
> > Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> 
> Unfortunately the whole code here are racy.  It may lead to a crash or
> use-after-free easily.  Some locking is needed definitely.

You are right, using and changing of loopback->timer_source should be protected.
I'll add locking with loopback->cable_lock to the bodies of print_timer_source_info()
and change_timer_source_info() (like in the example diff below), similarly to other
/proc files and mixer controls. All other uses of loopback->timer_source are already
covered by loopback->cable_lock, except for loopback_set_timer_source() call from
loopback_probe(), that is done at the very early stage and doesn't conflict with other
uses. I think, in order to avoid racing problems, this will be enough, won't it?

Thanks.

Best regards,
Andrew

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 415128a97774..ca9307dd780e 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -1684,8 +1684,10 @@ static void print_timer_source_info(struct snd_info_entry *entry,
 {
        struct loopback *loopback = entry->private_data;

+       mutex_lock(&loopback->cable_lock);
        snd_iprintf(buffer, "%s\n",
                    loopback->timer_source ? loopback->timer_source : "");
+       mutex_unlock(&loopback->cable_lock);
 }

 static void change_timer_source_info(struct snd_info_entry *entry,
@@ -1694,8 +1696,10 @@ static void change_timer_source_info(struct snd_info_entry *entry,
        struct loopback *loopback = entry->private_data;
        char line[64];

+       mutex_lock(&loopback->cable_lock);
        if (!snd_info_get_line(buffer, line, sizeof(line)))
                loopback_set_timer_source(loopback, strim(line));
+       mutex_unlock(&loopback->cable_lock);
 }

 static int loopback_timer_source_proc_new(struct loopback *loopback)

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
