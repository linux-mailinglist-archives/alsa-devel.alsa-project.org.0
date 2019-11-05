Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 194E0EFFF5
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 15:35:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EF6816E2;
	Tue,  5 Nov 2019 15:35:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EF6816E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572964551;
	bh=fwK2QL9CMuFIBmcAFE8i0/ZvbkoRttn/2JUPMDbOTPI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tWg+DHJw2uK6xaxwtSzwrHMUAN4rUWAHUqrgel888ynykfNWWEb7hQCPaFSn8vhbx
	 JL73pjwgGNnF0NlH9lcfs+pVhMZlIQzv1H3mh4QgAyRGcgQ78nN31uAg7zm1S7Vhxn
	 Y85/Ld7KYL4M+SWROSv1kGyUWPm4/YX/ZKdNIbbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 593D2F800F3;
	Tue,  5 Nov 2019 15:34:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 870B7F800F3; Tue,  5 Nov 2019 15:34:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 034FEF800F3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:34:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 034FEF800F3
IronPort-SDR: JAq4w3GmTR2k+uE3e4h6VMgPzqDGPlfHIExrypHt6IaJy8i+UYe92vkNBH40BzpXtTdvv1en35
 p4SWZW4hPxA1bi4kP3ZfVy96ZT4IUr/iqzuTkPqy4Cx8X6lPmCt7ghYKOeXcRBkPb7Y5Cp+cVW
 aDhyaa62nDf9UFCoKwZNRszDpDVDX8vrvEjr+OW98xTIDWicm86e5THrxVgdDQcwPsOoVmGhCo
 tL4g5P7O0cPYp7M9mfR7zfI6NwlzvnSd8dd5taGpUTMpov6o1VVYzTrFBiIZNi24YQee2Ou+iT
 9fg=
X-IronPort-AV: E=Sophos;i="5.68,271,1569312000"; d="scan'208";a="44730609"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 05 Nov 2019 06:33:57 -0800
IronPort-SDR: WHcmjCxFx4V0fKAQEcoACmafaB3eEnvN0+XvYs63va+5BPhXc9fk+YbztXdcKi5SGsBsxrOeDk
 3AzI2/gX4dG1vPQe7AfU5WIY4xVsnTdFdL3kzz9IKjG7hvGJN0kYg/ZEEdNB/6KBYkPcYTqHM8
 V25CYEdTjZ8rRBYMsF83ta16AgRW58H1vgfDPw7qLH8no1ySx7FAEwmL0Oqgfk/ydlvR8JFZo+
 ppSKHLFE5ZjQs+erkCHJ/QfieCdKFFcXDoo2+JObO8z3KCMNBqVcNNQAi/Y9DArDxBuaCxcX3C
 7cQ=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Timo Wischer
 <twischer@de.adit-jv.com>, Andrew Gabbasov <andrew_gabbasov@mentor.com>
Date: Tue, 5 Nov 2019 08:32:10 -0600
Message-ID: <20191105143218.5948-1-andrew_gabbasov@mentor.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Subject: [alsa-devel] [PATCH v2 0/8] ALSA: aloop: Support sound timer as
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

This patch set is an updated version of patches by Timo Wischer:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-March/146871.html

This patch set is required for forwarding audio data between a HW sound
card and an aloop device without the usage of an asynchronous sample rate
converter.

Most of sound and timers related code is kept the same as in previous set.
The code, related to snd_pcm_link() functionality and its using for
timer source setting, is removed (as rejected earlier). The changes in this
update are mainly related to the parameters handling and some cleanup.

The timer source can be initially selected by "timer_source" kernel module
parameter. It is supposed to have the following format:
    [<pref>:](<card name>|<card idx>)[{.,}<dev idx>[{.,}<subdev idx>]]
For example: "hw:I82801AAICH.1.0", or "1.1", or just "I82801AAICH".
(Prefix is ignored, just allowed here to be able to use the strings,
the user got used to).
Although the parsing function recognizes both '.' and ',' as a separator,
module parameters handling routines use ',' to separate parameters for
different module instances (array elements), so we have to use '.'
to separate device and subdevice numbers from the card name or number
in module parameters.
Empty string indicates using jiffies as a timer source.

Besides "static" selection of timer source at module load time,
it is possible to dynamically change it via sound "info" interface
(using "/proc/asound/<card>/timer_source" file in read-write mode.
The contents of this file is used as a timer source string for
a particular loopback card, e.g. "hw:0,0,0" (and here ',' can be used
as a separator).

The timer source string value can be changed at any time, but it is
latched by PCM substream open callback "loopback_open()" (the first
one for a particular cable). At this point it is actually used,
that is the string is parsed, and the timer is looked up and opened.
This seems to be a good trade-off between flexibility of updates and
synchronizations or racing complexity.

The timer source is set for a loopback card (the same as initial setting
by module parameter), but every cable uses the value, current at the moment
of opening. Theoretically, it's possible to set the timer source for each
cable independently (via separate files), but it would be inconsistent
with the initial setting via module parameters on a per-card basis.


Andrew Gabbasov (1):
  ALSA: aloop: Support runtime change of snd_timer via info interface

Timo Wischer (7):
  ALSA: aloop: Describe units of variables
  ALSA: aloop: loopback_timer_start: Support return of error code
  ALSA: aloop: loopback_timer_stop: Support return of error code
  ALSA: aloop: Use callback functions for timer specific implementations
  ALSA: aloop: Rename all jiffies timer specific functions
  ALSA: aloop: Move CABLE_VALID_BOTH to the top of file
  ALSA: aloop: Support selection of snd_timer instead of jiffies

 sound/drivers/aloop.c | 656 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 621 insertions(+), 35 deletions(-)

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
