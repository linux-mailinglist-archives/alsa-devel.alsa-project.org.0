Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8442E107162
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 12:30:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 101C417F7;
	Fri, 22 Nov 2019 12:29:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 101C417F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574422247;
	bh=42l/HadBKYDSShYJbHBfynb5O43BlJE7vQnY+MEi5Pw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uIiDMRmJZPG8WFm4NGXi2MY48yyWBCGJM1zn16Uyo/dbyTVq09vZFnGNxB5IYjfZy
	 LFiRPseYNBjQ/LxQKDWBFYhxPTJdwOISzyESeepopgCvhADDIz0hh/E7eDtJdTKyTK
	 KaJ3XXsMCRphRXsMTn6V1FA74XCDcIo5MRiy6L0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B3B1F8015B;
	Fri, 22 Nov 2019 12:28:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE95EF80159; Fri, 22 Nov 2019 12:28:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47ECAF80150
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 12:28:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47ECAF80150
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BC12CB2FB;
 Fri, 22 Nov 2019 11:28:41 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri, 22 Nov 2019 12:28:40 +0100
Message-Id: <20191122112840.24797-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: Fix NULL dereference at
	parsing BADD
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

snd_usb_mixer_controls_badd() that parses UAC3 BADD profiles misses a
NULL check for the given interfaces.  When a malformed USB descriptor
is passed, this may lead to an Oops, as spotted by syzkaller.
Skip the iteration if the interface doesn't exist for avoiding the
crash.

Fixes: 17156f23e93c ("ALSA: usb: add UAC3 BADD profiles support")
Reported-by: syzbot+a36ab65c6653d7ccdd62@syzkaller.appspotmail.com
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 45eee5cc312e..6cd4ff09c5ee 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -2930,6 +2930,9 @@ static int snd_usb_mixer_controls_badd(struct usb_mixer_interface *mixer,
 			continue;
 
 		iface = usb_ifnum_to_if(dev, intf);
+		if (!iface)
+			continue;
+
 		num = iface->num_altsetting;
 
 		if (num < 2)
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
