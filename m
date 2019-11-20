Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2258104291
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 18:52:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1948C1730;
	Wed, 20 Nov 2019 18:51:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1948C1730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574272358;
	bh=dtiN8fpQB8nNPAtXD5JF78rrB1xeFMFeYFoI7Ur6n08=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TvX/lIgfC30cnaN3btaWNFm1XC9M6Nc+P9FxGQTfQYHrpYO/wogauv0cEanvH34lC
	 tUEEkafoBUQK06UKQaKg8i5vxjonkwLK2JAEfFiaxfxttdKDfJBDeiEDTQSnMaf32C
	 5ZXqfYa5Kzs1KfnaAVjP0qOCLKTOecbUjDevdfic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 126BEF800C1;
	Wed, 20 Nov 2019 18:50:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BBF2F8013E; Wed, 20 Nov 2019 18:50:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11F06F800FF
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 18:50:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11F06F800FF
IronPort-SDR: FwdnjRzMsLhtpM38PgrHpGjobUlfYxdx6B/2MIoznxNY/e+TkY91vbvAm+TFBs3UJWQ0Z1uyxU
 qQYUuJfU2m9DepvaXIbOEIiQFc3V2CwwLgDSrGWIxZhw6/QAF4t/j3LHcX3tmGxCOUQBw1rn41
 uKqcpr7f1OxiO47v+y15hDx3ZWKhB1DLFOmIdl/FZiih0103VScOhuO/nQnLDMsBCnq3NNRMSX
 W+ElfTgNUTBmOR/2p/1sC/3Ckbxyh8jpfBtEqg4yoOz1RU83wUGRcj8Uw+/zbUeE97D2ucDrQX
 QOo=
X-IronPort-AV: E=Sophos;i="5.69,222,1571731200"; d="scan'208";a="43362982"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa3.mentor.iphmx.com with ESMTP; 20 Nov 2019 09:50:43 -0800
IronPort-SDR: LwkJ+aBiWzWoO8KlW+Hyofu76NcIufvzvVULf+U7OIz2/XQKmj4zojojWkYvL5RmfcVQOFZBLs
 iCqSoRuUVmGSfhSK43HeObqbwaNYxaXB+a6iymrAWLL6pjC8jJuQyS8g46lgOkSPDvD7eU0vFW
 dKbHJipnJLfqwhCK9DxowwNuT9wMMmyWPnIsbIRo6LWbmlrhhS8rGsuOzaaDMCTIkCFPloO55C
 wOia4dFn8AUcW3tclEYJo2b1RN5e18J0xw/g0UroampewCs07RlioIXlEFUp8B4iQL8OveIuzf
 m+s=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Timo Wischer
 <twischer@de.adit-jv.com>, Andrew Gabbasov <andrew_gabbasov@mentor.com>
Date: Wed, 20 Nov 2019 11:49:48 -0600
Message-ID: <20191120174955.6410-1-andrew_gabbasov@mentor.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Subject: [alsa-devel] [PATCH v5 0/7] ALSA: aloop: Support sound timer as
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
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158312.html
- Change sound card lookup to use snd_card_ref() and avoid direct access
  to sound cards array
- Squash commits on returning error codes for timer start and stop
- Some locking related fixes
- Some code cleanup

v4:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158896.html
- Change to use updated API for snd_timer_open() (separate timer instance)
- Change to use snd_timer_close() returning void
- Some code cleanup

v5:
- Change to initialize timer event tasklet before calling snd_timer_open()


Andrew Gabbasov (1):
  ALSA: aloop: Support runtime change of snd_timer via info interface

Timo Wischer (6):
  ALSA: aloop: Describe units of variables
  ALSA: aloop: Support return of error code for timer start and stop
  ALSA: aloop: Use callback functions for timer specific implementations
  ALSA: aloop: Rename all jiffies timer specific functions
  ALSA: aloop: Move CABLE_VALID_BOTH to the top of file
  ALSA: aloop: Support selection of snd_timer instead of jiffies

 sound/drivers/aloop.c | 663 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 628 insertions(+), 35 deletions(-)

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
