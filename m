Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A43471BDB
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Dec 2021 18:21:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD5CC192F;
	Sun, 12 Dec 2021 18:20:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD5CC192F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639329701;
	bh=Ira0PueS7yhSH5CeooyZ5psZsxqzd+GTzn3Svp08uS8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f1h8a3zPSLH0kDvdJ3gtpmkhrgfWhGD6NCa2m1xs/qBuf9l+/2R6xfHrMLsVtaax1
	 3wg6PdK0cHYjHn4G5O8o6E54pijJTIBAfiAsBqTlnC8C6CXeAK+6/AtNyGV1MmKpRl
	 ItRJf25C+82a3Vg8tTrvrBFpJm+fsj6cJx9rKNko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FEFCF80059;
	Sun, 12 Dec 2021 18:20:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCD8FF80246; Sun, 12 Dec 2021 18:20:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73B2BF80059
 for <alsa-devel@alsa-project.org>; Sun, 12 Dec 2021 18:20:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73B2BF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Vk4M6zc/"
Received: by mail-wr1-x429.google.com with SMTP id d9so23420332wrw.4
 for <alsa-devel@alsa-project.org>; Sun, 12 Dec 2021 09:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=70CgJ9RKaeuujO3f4MTS8HwBDoID9iAqD2HNuMNQGgc=;
 b=Vk4M6zc/V03u8SMNQp3AmcUN2udBSD6jv++9AYTr/xVgE1RSdJ44izCc8ZPDn63CHg
 2uRQiILu5UoP9BUwHY2KC8oKeVqYZC78q8A07HtI4TrPi6hapgEg7xbAPBQUlOtuRrNZ
 AC/2uL5rm9VY7Wwbjuxp+qcSaWivHcWKxQFxzULW+2zublISMut+4V50jVcw9jhLfluC
 ELnV0P5ilzsforioqQ5REMrozofxFsBoYVwbKxLbnHfESjMz50DTRypNwt0FcH+xixlS
 L59abvgW7pNTN8jB8MvOBV4ZsrCzgrGqSBoBwG1tcylmDcrWcme0gRubd2vIg8bVT+Hi
 uMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=70CgJ9RKaeuujO3f4MTS8HwBDoID9iAqD2HNuMNQGgc=;
 b=HIfPbwPzIIV3DhxwBX3MQOiKDCzhagZxzlXCEGem/I5InIRW+wBzdahJqMqtPcJfxr
 KzwoXoG/gW9OWrKibx5Fjgq7+kCMmToA2f9bJgZM0uCK2Ofy1Syw5WTIfRIon1P79bQT
 BUsgh4o3KAkGzJ9OeMJQJFCrTAAAZ5tPoANRDo59wNOSk2pxAw2ZXjdKl4YSUaXapQta
 krfOdHkwNNTymG+KsXrK7ED7h6g5KuMKf+QkbE8zMVA0/dG5GqSymGeGnQgc01bg7s5Q
 kyekxKeZWtSCAVxDLnmFrJuEzANqwVPfSam1aS/IQLmuqtvJl0B4lSrz7+GvaJgdYx3V
 i48w==
X-Gm-Message-State: AOAM531w6a5wEKN41/Ki51zALBV/re2hzYAOUPK5C3AfrUixg7H5IJ5D
 COrKjx5NI+Co/teqdjb16fc=
X-Google-Smtp-Source: ABdhPJzJYIQf5+kNr6J5UeKg6XdZX5uI3o2BtWMQr8PWKwxgC3oj7S4QiAP68BE5vI2UQsbV1oBk7A==
X-Received: by 2002:a5d:648d:: with SMTP id o13mr11600499wri.637.1639329627200; 
 Sun, 12 Dec 2021 09:20:27 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id t17sm4757529wmq.15.2021.12.12.09.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 09:20:26 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: drivers: opl3: Fix incorrect use of vp->state
Date: Sun, 12 Dec 2021 17:20:25 +0000
Message-Id: <20211212172025.470367-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

Static analysis with scan-build has found an assignment to vp2 that is
never used. It seems that the check on vp->state > 0 should be actually
on vp2->state instead. Fix this.

This dates back to 2002, I found the offending commit from the git
history git://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git,
commit 91e39521bbf6 ("[PATCH] ALSA patch for 2.5.4")

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/drivers/opl3/opl3_midi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/drivers/opl3/opl3_midi.c b/sound/drivers/opl3/opl3_midi.c
index e1b69c65c3c8..e2b7be67f0e3 100644
--- a/sound/drivers/opl3/opl3_midi.c
+++ b/sound/drivers/opl3/opl3_midi.c
@@ -397,7 +397,7 @@ void snd_opl3_note_on(void *p, int note, int vel, struct snd_midi_channel *chan)
 	}
 	if (instr_4op) {
 		vp2 = &opl3->voices[voice + 3];
-		if (vp->state > 0) {
+		if (vp2->state > 0) {
 			opl3_reg = reg_side | (OPL3_REG_KEYON_BLOCK +
 					       voice_offset + 3);
 			reg_val = vp->keyon_reg & ~OPL3_KEYON_BIT;
-- 
2.33.1

