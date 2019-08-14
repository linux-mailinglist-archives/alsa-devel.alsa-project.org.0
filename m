Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE91B8CBA4
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 08:11:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CFE1165F;
	Wed, 14 Aug 2019 08:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CFE1165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565763080;
	bh=mLDt3Dh/BlS0LBIo/1vNK5y5Ml3pB6HR2GraLmpYMfI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eobeB00mfcibSDBQyz0KgfKpLY33jQ07ssoPCaD7HA3jFfiABgiYHbN5cIj2MGSVk
	 VWriNaxqGbYMyBO2piAM1OkT7dJ4eWFJD9BBV+AR2DmeUxJK2qvzWLm5tqazxdX20a
	 /yokqhsDAMam6GrVE93bm1qI1j1g8HFQ3nmU3ExY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCC64F805AF;
	Wed, 14 Aug 2019 08:08:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF0F2F80214; Wed, 14 Aug 2019 04:37:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E696BF8015B
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 04:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E696BF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="s4jfsXx+"
Received: by mail-ot1-x342.google.com with SMTP id c7so6352916otp.1
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 19:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hV2pKWlMxnhaypGzns6kJSRcp18KAhjsh92Ko5vM2dU=;
 b=s4jfsXx+Cq+klsDPXG+/AvuC0BYDeQjlCJgMXkRlH6uOTDU0uk3KDxxap7JNbXYqZn
 5wymoRYTTpTBAFjfHQvCHNtf9pA6e+DA34DFVNR5sVBCPQFulY4qlafhcJ3i0mh3iw4B
 QsMATqQdvXL/I3B1lqcuI7SeJ4CJL6cnKGVO+o5QfK3rNkM9Zf+gqu6dKGh4UTYoZYKt
 GacMgdbyQQFh+EqCKftFmQJTn9nhX87zjEC6HuvAsaA3wVebgOlYuggqskABTeS8/W+F
 8KWzyETW2o8SuHJQUocXaSek2bkbt8LRpIrGaPk6kJVPttyR+yAaLh39j1WvDavSedYp
 jT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hV2pKWlMxnhaypGzns6kJSRcp18KAhjsh92Ko5vM2dU=;
 b=BTAzmt/PefimSbSbZdDIMIL5pfFWTVYDvGn0JCS6Nf+t8f9d5M4cf+l91lED3DgFH0
 lDqloLW0UVdvalWRhX6k/VVctRgcbrTmR6/og80Uv8bczVtD0Uld8hxwZ44u8kamN5a1
 /qh3wPhMfT00Yllrg4wuCmo1RURpRFAk9pVpTQI8JwEmJyaNC0Kl4M7fnzqvOTm7u/8Y
 Vulxwk6/3RFs05TygJzNeZ8XphFCltX4Awj1TMltT0y+O2okrjdtP0bEVuzVc5E8hsBG
 fZdPdWPcnn+cFTDWmKNqlO6uiIDwDYFTNI9H+UAI9/M4+fuaErpvJwnhCKxv+TU9DXuj
 7PuQ==
X-Gm-Message-State: APjAAAVDyJCV3ETbIVbqtaNaJZUhA+4A90Ke/vWtxpkiugjskWoRVa9b
 28+rqLSGnNessqME3jgi11I=
X-Google-Smtp-Source: APXvYqwCm95c1dn4xfbMaEyHxx8PGMDXqkcsKW7lYisFSX5mPMe4ewDWvMLmZIc03W0kaSBlbWSJSQ==
X-Received: by 2002:a5e:c911:: with SMTP id z17mr13586768iol.119.1565750227338; 
 Tue, 13 Aug 2019 19:37:07 -0700 (PDT)
Received: from peng.science.purdue.edu (cos-128-210-107-27.science.purdue.edu.
 [128.210.107.27])
 by smtp.googlemail.com with ESMTPSA id y19sm14805008ioj.62.2019.08.13.19.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 19:37:06 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: security@kernel.org
Date: Tue, 13 Aug 2019 22:36:24 -0400
Message-Id: <20190814023625.21683-1-benquike@gmail.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 14 Aug 2019 08:07:59 +0200
Cc: Mathias Payer <mathias.payer@nebelwelt.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Wenwen Wang <wang6495@umn.edu>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Hui Peng <benquike@gmail.com>,
 Allison Randal <allison@lohutok.net>
Subject: [alsa-devel] [PATCH] Fix an OOB bug in parse_audio_mixer_unit
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

The `uac_mixer_unit_descriptor` shown as below is read from the
device side. In `parse_audio_mixer_unit`, `baSourceID` field is
accessed from index 0 to `bNrInPins` - 1, the current implementation
assumes that descriptor is always valid (the length  of descriptor
is no shorter than 5 + `bNrInPins`). If a descriptor read from
the device side is invalid, it may trigger out-of-bound memory
access.

```
struct uac_mixer_unit_descriptor {
	__u8 bLength;
	__u8 bDescriptorType;
	__u8 bDescriptorSubtype;
	__u8 bUnitID;
	__u8 bNrInPins;
	__u8 baSourceID[];
}
```

This patch fixes the bug by add a sanity check on the length of
the descriptor.

Signed-off-by: Hui Peng <benquike@gmail.com>
Reported-by: Hui Peng <benquike@gmail.com>
Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
---
 sound/usb/mixer.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 7498b5191b68..38202ce67237 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -2091,6 +2091,15 @@ static int parse_audio_mixer_unit(struct mixer_build *state, int unitid,
 	struct usb_audio_term iterm;
 	int input_pins, num_ins, num_outs;
 	int pin, ich, err;
+	int desc_len = (int) ((unsigned long) state->buffer +
+			state->buflen - (unsigned long) raw_desc);
+
+	if (desc_len < sizeof(*desc) + desc->bNrInPins) {
+		usb_audio_err(state->chip,
+			      "descriptor %d too short\n",
+			      unitid);
+		return -EINVAL;
+	}
 
 	err = uac_mixer_unit_get_channels(state, desc);
 	if (err < 0) {
-- 
2.22.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
