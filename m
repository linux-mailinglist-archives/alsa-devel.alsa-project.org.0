Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48250F1CC4
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 18:49:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6FA21686;
	Wed,  6 Nov 2019 18:48:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6FA21686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573062553;
	bh=AxboZmsLICRdWBg+fLoRFfE7F7oQA7wcg3DEA3C2rbQ=;
	h=From:To:References:In-Reply-To:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vbCxreGXTX+/Gt+CW4vY4+7h95m6sgTjPzjTBxFdSXxWFjgzrhSXeBq9B1IRsOHTT
	 VYudjIBvQ4J7DhmRfZTJTS8r8jA8rbkqf49qYV10qenpPk3LLz32lERPin0Y263Do0
	 wPbwoMiaM1IgjQKZzYgxGgIQKJGdtVx6SzFxNgJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29E45F80291;
	Wed,  6 Nov 2019 18:47:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD534F803D0; Wed,  6 Nov 2019 18:47:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CF74F8015B
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 18:47:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CF74F8015B
IronPort-SDR: hMzPcm1S4k5+61saSAY1cMk57Wi9BkrHctrB7r+TaGhnwepv3Z2RAtcf3YwdWNNeKmaGWjHNje
 9fR4nPRzw8akxgEVTVpaDKPeeg+AdlVLJ5P+7R8xDJ33vJBff1CPEcc2ShPhnXixaomKNTHIvo
 o2hphJP9KYhMMNW0CABZbsfoJv8gCCi7ZqapzBhP51h87EdHVMHsAxwsrbVN6M6ZU2iDmCMZH/
 aWyJewP6qV7H10ZK3SzzPzfAbw21Q16z2ulKT2NxU1+PO/zL3U8G0NaqYVuaAN03adEGPIhf5n
 jdQ=
X-IronPort-AV: E=Sophos;i="5.68,275,1569312000"; d="scan'208";a="42964748"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa4.mentor.iphmx.com with ESMTP; 06 Nov 2019 09:47:10 -0800
IronPort-SDR: g9MUu+J8OTyqvHJDx9CiNu5O73/mDmSTZYzD+voBBo9Cj6HpRaWRQjlgURahtsyp/DdA//iJ1L
 bEZE+5fvcdQMqja8husaJyIA2kUIwmCsAp59H4JNgv7R2BaP4xiCrtHDjrm3J7AIK85zDN01PW
 wR/DFh8DvHVrIs9NX1o5T2vkxBM1XFL2C1JWZYIFQwq/61bWQtdu9gS7xPAKTbR6reVxAEckGL
 OPo4yOAv1RvWPrLuR7/EQFodZwvD2cYWZeuxs7bcgWk41hiKNOUo7Oc72X9IsKuRDHWKASuIoD
 6pU=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: Takashi Iwai <tiwai@suse.de>
References: <20191105143218.5948-1-andrew_gabbasov@mentor.com>	<20191105143218.5948-2-andrew_gabbasov@mentor.com>	<20191105143218.5948-3-andrew_gabbasov@mentor.com>	<20191105143218.5948-4-andrew_gabbasov@mentor.com>,
 <s5h36f13sv5.wl-tiwai@suse.de>
In-Reply-To: <s5h36f13sv5.wl-tiwai@suse.de>
Date: Wed, 6 Nov 2019 20:45:51 +0300
Organization: Mentor Graphics Corporation
Message-ID: <000001d594ca$1dd487f0$597d97d0$@mentor.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQHVk+YTmTkKZHEEGEaaN+TTFIVO0Kd+THEAgAAY32M=
Content-Language: en-us
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Cc: Timo Wischer <twischer@de.adit-jv.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 3/8] ALSA: aloop: loopback_timer_stop:
	Support return of error code
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


Thank you very much for your response.

> From: Takashi Iwai <tiwai@suse.de>
> Sent: Wednesday, November 6, 2019 18:51
> 
> On Tue, 05 Nov 2019 15:32:13 +0100,
> Andrew Gabbasov wrote:
> >
> > From: Timo Wischer <twischer@de.adit-jv.com>
> >
> > This is required for additional timer implementations which could detect
> > errors and want to throw them.
> >
> > Signed-off-by: Timo Wischer <twischer@de.adit-jv.com>
> > Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> 
> I'd fold this into the patch 2.  Both patches do fairly same things
> but just for start and stop.

OK, I agree. I'll squash these 2 commits into a single one in the next
update (there will be an update for sure to fix the snd_cards reference
in patch #7).

> 
> And the same question as patch#2 is applied to this one, too, BTW.

As for the notifications in case of timer operation failures:

For stop/suspend operations, the return code of the timer operation,
and of the PCM trigger function as a whole, actually makes no difference,
the streams state is changed anyway, so the notification should be done
in any case.

For start/resume operations, it seems OK to send notifications
even if the timer operation fails, if the cable->running and cable->pause
fields are set before that (as is now), so that the notified control
reflects the changed state. In case of failure the whole operation
will be un-done by upper PCM layer, changing the state back,
and sending one more notifcation.

Alternatively, we could re-order the code and do not set the running
fields if timer operation fails (and do not notify in this case).
But the undoing stop operation will be executed in this case
that will cause the (unpaired) notification, which is probably
not quite correct.

Thanks.

Best regards,
Andrew

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
