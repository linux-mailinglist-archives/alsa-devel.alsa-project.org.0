Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E45DF60D6
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Nov 2019 19:18:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19EAF1612;
	Sat,  9 Nov 2019 19:18:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19EAF1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573323534;
	bh=wbVmkMBfPHHaAlvVuwhcaTzwXbLcz/KCxCetJUIL9H4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HsZD9TqYZrgKJ+SLfvLJe7EA/qXJ4/OVQGxuhvnhx4QkuPA8F15PGp6RksmVhP+BY
	 akA46rdtGWi/0uf+Fy5ISONh0R84a2HLLGOl5o7JoXuMFNv/OCr+a0lDnpVf+s4Lji
	 CL9mniaB8/SNv7kMirpRBwkR+QTnFX8V1jCKtqWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57B91F8049B;
	Sat,  9 Nov 2019 19:17:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B641BF8049B; Sat,  9 Nov 2019 19:17:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCA4CF800EA
 for <alsa-devel@alsa-project.org>; Sat,  9 Nov 2019 19:17:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCA4CF800EA
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1A47CB40D
 for <alsa-devel@alsa-project.org>; Sat,  9 Nov 2019 18:17:02 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sat,  9 Nov 2019 19:16:58 +0100
Message-Id: <20191109181658.30368-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: Fix missing error check at
	mixer resolution test
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

A check of the return value from get_cur_mix_raw() is missing at the
resolution test code in get_min_max_with_quirks(), which may leave the
variable untouched, leading to a random uninitialized value, as
detected by syzkaller fuzzer.

Add the missing return error check for fixing that.

Reported-and-tested-by: syzbot+abe1ab7afc62c6bb6377@syzkaller.appspotmail.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 3fd1d1749edf..45eee5cc312e 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1229,7 +1229,8 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 		if (cval->min + cval->res < cval->max) {
 			int last_valid_res = cval->res;
 			int saved, test, check;
-			get_cur_mix_raw(cval, minchn, &saved);
+			if (get_cur_mix_raw(cval, minchn, &saved) < 0)
+				goto no_res_check;
 			for (;;) {
 				test = saved;
 				if (test < cval->max)
@@ -1249,6 +1250,7 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 			snd_usb_set_cur_mix_value(cval, minchn, 0, saved);
 		}
 
+no_res_check:
 		cval->initialized = 1;
 	}
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
