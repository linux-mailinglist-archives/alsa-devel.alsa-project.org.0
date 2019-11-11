Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69978F72D0
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 12:11:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFD721675;
	Mon, 11 Nov 2019 12:10:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFD721675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573470680;
	bh=ewhWTrVjYg66WCQNkoAIaqK62Hbw5f8TmE8Sp2v9uOA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zfdd7XPx7fIbNj5dKxPiKH/ab7bFCF+9paQy98rGBfEs0GsQ13ByA+vUJVJh64EJd
	 43Jk62eZwFeqhqOK/syzIquz/U86EFha5W9TA8B/bL8N0cufu05BvVuRZwqrSiDqSH
	 IunE6Qk9YebaF8U7GHYvFLiinaudly0pHM+dx0m0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A72CFF8045D;
	Mon, 11 Nov 2019 12:09:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF01EF80506; Mon, 11 Nov 2019 12:09:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB08FF80275
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 12:09:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB08FF80275
IronPort-SDR: en28LACCHnlzVgKP580uBM2b3cbjGqQHdAfUImwzfu3EMfyy07PynxjLWYTaOt4qshfQUGUL0f
 TWtSsQhy9iNVpTm56+UIgiNbmJQGCN5N1Td3aGDBxy3tdNiKbMymWN7rko2VgYqo8muW8+oLD4
 Td6xBg+EZKdEeIWMb6pnS041BlDqpceL9/z+MIoUt3LoUz98v2K0/OVcc40Xvd1Nl2z2c8jnIm
 S1vW6YLux4sciDcpVM1baCGZIn0vbIQkX8WOmFRbEeKo1nw54pq/IpNjZw1mVdL94w3sK0dGFW
 Ue4=
X-IronPort-AV: E=Sophos;i="5.68,292,1569312000"; d="scan'208";a="43051099"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 11 Nov 2019 03:09:26 -0800
IronPort-SDR: ToesaAyH0WwAzxyBtbHBkI5bYjovl12mgJ1ap5lo9YDnjmHEec1CQCMcNxFTtNhOMJeo0Hwjja
 Ju9cZLkM/QhpBDdkNKwmSNNsRM88TsaXV+FwDBLyCoPIzppNb3ng19t7i1/lpLoFPaRrBA5n42
 3JzvwMjS/CnUTI4N4uJJp8YBxQAj1QT7zhBvvETOpIzCSjKbwyW6Tsi5uYOgtLxgaHqq/4e8o0
 lNctZaPGYRLd+fkaKn3BXPBV39fPV4EY92vxQyZ90AqNx0RrST1ioNplZaMprCV7lC+/ClS/5o
 gCI=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Timo Wischer
 <twischer@de.adit-jv.com>, Andrew Gabbasov <andrew_gabbasov@mentor.com>
Date: Mon, 11 Nov 2019 05:08:39 -0600
Message-ID: <20191111110846.18223-1-andrew_gabbasov@mentor.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Subject: [alsa-devel] [PATCH v3 0/7] ALSA: aloop: Support sound timer as
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

v2:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/157961.html

v3:
- Change sound card lookup to use snd_card_ref() and avoid direct access
  to sound cards array
- Squash commits on returning error codes for timer start and stop
- Some locking related fixes
- Some code cleanup


Andrew Gabbasov (1):
  ALSA: aloop: Support runtime change of snd_timer via info interface

Timo Wischer (6):
  ALSA: aloop: Describe units of variables
  ALSA: aloop: Support return of error code for timer start and stop
  ALSA: aloop: Use callback functions for timer specific implementations
  ALSA: aloop: Rename all jiffies timer specific functions
  ALSA: aloop: Move CABLE_VALID_BOTH to the top of file
  ALSA: aloop: Support selection of snd_timer instead of jiffies

 sound/drivers/aloop.c | 672 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 637 insertions(+), 35 deletions(-)

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
