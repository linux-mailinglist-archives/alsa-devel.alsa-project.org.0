Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF41A3FF3
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 23:49:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40A6615E2;
	Fri, 30 Aug 2019 23:48:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40A6615E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567201750;
	bh=jpfZJsdSg3ZMdigf/RgAPxowoyAR1KcIgak2RKpzgmQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oOnkvO+gvDX/5Gc1Oc585H7ZdFtiTzvjQ0eW0q1LKSOCrG60OqWic/eIwWczTK6Rq
	 QUg5R6ulURvjx+8GLyh4rz3XJytN0OMxiJkgJL/dQ08usR6UMUxQCc5xk/gXA14Ap3
	 Wa8eL+8NnJTx3IhftWHrSjJaGoiY2mAT+I4hyMN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94D1DF8036C;
	Fri, 30 Aug 2019 23:47:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46F80F80362; Fri, 30 Aug 2019 23:47:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0937F800E7
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 23:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0937F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PqoH0U6M"
Received: by mail-io1-xd42.google.com with SMTP id o9so17080156iom.3
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 14:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zobn1PfaWdiFKh+2AJisvXaXaN9Pv4+pvGnHv+s5H4g=;
 b=PqoH0U6MfwrpAsH2I8tyCEQptXVIiBeTnOsXbU8Ar8ranL1XpLus6OwSuKVJ3vvw1t
 NyOIEgheKhfIOyWmzehIPpcCMBCbnVBmqAVaIYK8uOQz9qbtKYu743+vuP5K3vLLB86u
 92/oafOaYMZXZ6I/YRq9y0ful6k7Y4g0CFxQwnrPo4oQFzD45FVBN0X23i9z6JCYEP4v
 0AGR2TKK1ckUBolAcqZvVz2e/uzlYquJb61tIlX7sV6wqla4vfB8rVCR9x432k+17SsJ
 cTIu4QtXSiaGkEKed2pxOdm30n1pukvCPAAew81YizAWchrT7FrirRpuA84mqm1+0Jyw
 fDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zobn1PfaWdiFKh+2AJisvXaXaN9Pv4+pvGnHv+s5H4g=;
 b=jInfn4IPbcU6O0u+xwFGruqXXEvynC+Vq4W9PVzt3u8T+BpNfiCmLezpzicTQ3/Q09
 r0BdyoGnT2Hcn4UVqd5HJV1A7UQS4N4mLD6Vk6QR7TeWZPX/+sNkOpJ2LrkNrIoFUKvz
 z0+yb8A14lGw1DiBtuY8Mk7A4722/xWbKbVeFppAWUurr+wkwauNZbCrxwIk5l741GnC
 sZ9GAYExIiaYkp21+nZg4vsRc0lvRM3STDnZi/qsDunavM6QqpiH8nOL537CvlQxyQfi
 fU9PTjqXmGbxehjjY1YkjDmcbg7LMXcgZHWU6NIczLudvqt6xAMSB+BtMwGhMQXtz0PI
 skkg==
X-Gm-Message-State: APjAAAU0aXV7uiDZwNhA2TkXbEjR2ODHRhTiznhab+ecxGYjvm77f7Lv
 voPdFZfZUOaBjOz8LsnZqyg=
X-Google-Smtp-Source: APXvYqzDz5V/Q5AiD+cZ2p5/0vLITIFai9ECVqT6mDBjH8GdVUW+FMbMKnbyxabOxzlGVMoewVzgcA==
X-Received: by 2002:a02:c992:: with SMTP id b18mr18578961jap.128.1567201636655; 
 Fri, 30 Aug 2019 14:47:16 -0700 (PDT)
Received: from peng.science.purdue.edu (cos-128-210-107-27.science.purdue.edu.
 [128.210.107.27])
 by smtp.googlemail.com with ESMTPSA id m10sm5951564ioj.75.2019.08.30.14.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2019 14:47:16 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: stable@vger.kernel.org
Date: Fri, 30 Aug 2019 17:46:49 -0400
Message-Id: <20190830214649.27761-1-benquike@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Mathias Payer <mathias.payer@nebelwelt.net>, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wenwen Wang <wang6495@umn.edu>, Takashi Iwai <tiwai@suse.com>,
 Hui Peng <benquike@gmail.com>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 1/2] Fix an OOB bug in parse_audio_mixer_unit
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

CVE: CVE-2018-15117

Reported-by: Hui Peng <benquike@gmail.com>
Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
Signed-off-by: Hui Peng <benquike@gmail.com>
---
 sound/usb/mixer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 1f7eb3816cd7..10ddec76f906 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1628,6 +1628,7 @@ static int parse_audio_mixer_unit(struct mixer_build *state, int unitid,
 	int pin, ich, err;
 
 	if (desc->bLength < 11 || !(input_pins = desc->bNrInPins) ||
+	    desc->bLength < sizeof(*desc) + desc->bNrInPins ||
 	    !(num_outs = uac_mixer_unit_bNrChannels(desc))) {
 		usb_audio_err(state->chip,
 			      "invalid MIXER UNIT descriptor %d\n",
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
