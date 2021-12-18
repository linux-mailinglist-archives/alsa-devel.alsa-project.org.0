Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D31F479AC9
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Dec 2021 13:40:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AF431A75;
	Sat, 18 Dec 2021 13:40:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AF431A75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639831256;
	bh=d0HYc7fwgcTxLa6zyFp6qdE56LcLVwdwp8lk6H/MDPE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=su45N2myAjMzmLUDrA/zOFMtpcUyJznuzeqCzjxGxLsJD6KZ0ns0HpKFcS60RZh4U
	 EQzcl1eplbPlBUhHsOglAJN4TKaXkj9Y1+Wc19lz8qNZ886I1Vqn0ZwUOxTvBqdfyI
	 /2zsAFLeJdnN9e8IooPB+Ses+oK3w46L+/0JPWtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70702F8013A;
	Sat, 18 Dec 2021 13:39:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC1BBF800F4; Sat, 18 Dec 2021 13:39:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 022AFF800E9
 for <alsa-devel@alsa-project.org>; Sat, 18 Dec 2021 13:39:36 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 24E08A003F;
 Sat, 18 Dec 2021 13:39:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 24E08A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1639831175; bh=NF2mJk2kv3e4yilXaNDZkRYSePxSxNBzGWMwTzcCLnU=;
 h=From:To:Cc:Subject:Date:From;
 b=PWBv77S/oLdFpeQALBNpDgC4yMQp3GzAt7l66CjHb/MXk0YVHKZ/8Lzsu7XQ0fsgC
 AK/T0fNbm/3Xamqjco8rYiR5bR3KKwZpbYAJQQw2ISwtN3mTlYk8EkFlRa0+uqXfbf
 /x044BvurS+AwH+YibJGs6P6I1rPIi/qY/AqdRy8=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sat, 18 Dec 2021 13:39:29 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: rawmidi - fix the uninitalized user_pversion
Date: Sat, 18 Dec 2021 13:39:25 +0100
Message-Id: <20211218123925.2583847-1-perex@perex.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, broonie@kernel.org,
 syzbot+88412ee8811832b00dbe@syzkaller.appspotmail.com, stable@kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The user_pversion was unitialized for the user space file structure
in the open function, because the file private structure use
kmalloc for the allocation.

The kernel ALSA sequencer code clears the file structure, so no additional
fixes are required.

Cc: stable@kernel.org
Cc: broonie@kernel.org
BugLink: https://github.com/alsa-project/alsa-lib/issues/178
Fixes: 09d23174402d ("ALSA: rawmidi: introduce SNDRV_RAWMIDI_IOCTL_USER_PVERSION")
Reported-by: syzbot+88412ee8811832b00dbe@syzkaller.appspotmail.com
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/core/rawmidi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 6f30231bdb88..befa9809ff00 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -447,6 +447,7 @@ static int snd_rawmidi_open(struct inode *inode, struct file *file)
 		err = -ENOMEM;
 		goto __error;
 	}
+	rawmidi_file->user_pversion = 0;
 	init_waitqueue_entry(&wait, current);
 	add_wait_queue(&rmidi->open_wait, &wait);
 	while (1) {
-- 
2.31.1
