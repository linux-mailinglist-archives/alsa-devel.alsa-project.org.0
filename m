Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4BC51F1D2
	for <lists+alsa-devel@lfdr.de>; Sun,  8 May 2022 23:29:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DB201883;
	Sun,  8 May 2022 23:28:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DB201883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652045370;
	bh=CqYEmea9a0DO2lPqRjHLpoQ700bvKptanlJCMDX5cvc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Bw6W+/eBoinWLS6nttsADMX1XVumIlzxkczdNxpH7Pk/KXWLqnuvtfQoIttVQLum6
	 bvkPAQ6zznw3o0k67pu4gTWg0XsyP3+XGvlao0aLJYoIiMJZPESDQ0j+QHMDBA2Sft
	 whBUbQU7ZIK78f0M+5rOSdF5eV8Y9b/0Sknf8KRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A009CF80279;
	Sun,  8 May 2022 23:28:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0BBAF8023B; Sun,  8 May 2022 23:28:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1277F8014C
 for <alsa-devel@alsa-project.org>; Sun,  8 May 2022 23:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1277F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dmpe+mmU"
Received: by mail-wm1-x330.google.com with SMTP id m62so7395089wme.5
 for <alsa-devel@alsa-project.org>; Sun, 08 May 2022 14:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A/zOqb4x/q8KxE0MrgpQFzG6bfh8WIATxK/7TnCd/GM=;
 b=dmpe+mmUEqO2Bi7E0HKUyAPX4i5aQHML9SA2Cp9S+SbSeywomzxtHiPKhBP3T5/+/Y
 WupsVLsHiANQprLBxqlj7xuQHXCa36j9ZmowYYq9se+XIqg1/rvNDIS0PVevvIf6vwxr
 mavAVUPp2V3+QqtTCi/bsIVIyE4i0vXPOuinZx1TzVMTB4wfFO7N8rTu2NIfToO1EVDQ
 Da4+MtG+VxzPKOzwZ1BHXCz7LifXdxjXJr4GWpMXHvJ6WCVXnOzK4k6G+RdJNZQIk/b9
 584u425A8UsTxSBeiGZGIjGjU+v8EZ4ndodQqRBtm6o54J1IhMFW41PbOvsp9Dh7Qxg8
 yBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A/zOqb4x/q8KxE0MrgpQFzG6bfh8WIATxK/7TnCd/GM=;
 b=4WPXxlKCzfrvZ95dah7Nutfyrz8QVLOUbvhtZ9m21POaVeUCunqS502+DFPjk6tIti
 ArAR0syjEUciJeyhAauOtwT3e1hrNrVkMkG0g5lCjXlh/E2Z18aqlg1YeB57dIVeJRHk
 fsJ091LQK6mf2iocTifgzzR0NLsFyRXJyNQVgc4LhjKdRcajMzDfbKF0u2OwpKET+xCi
 nH8PQjn6W5OndhQ2ziuTSqUCBWnUYu60oZgAOfcxgCPVIU9XgYCtzDKsYGdpOSlZZsDe
 jZzGtysrqxXrSWBU4TDGw4mICesrAdtk+U0EjFP44hgTgR20TUJLY/yawYOAg/wwvqFs
 gMAA==
X-Gm-Message-State: AOAM531OVBYByaud1qcfX7oHLNMurrnRr/wnQs4tETVjdVSep8pCGLZO
 BrzzdptRvum1y2YQqobl39s=
X-Google-Smtp-Source: ABdhPJzl/qff/sBxuFnWUAx+AW81h6wIqQ6XCu4smjK1s4+YK0vM34kUo20wHmx1AuGHCQI/j0apqg==
X-Received: by 2002:a7b:c8c3:0:b0:394:547c:e5af with SMTP id
 f3-20020a7bc8c3000000b00394547ce5afmr19608805wml.202.1652045300405; 
 Sun, 08 May 2022 14:28:20 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 x4-20020adfffc4000000b0020c5253d922sm9253047wrs.110.2022.05.08.14.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 14:28:20 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hdsp: remove redundant assignment to pointer kctl
Date: Sun,  8 May 2022 22:28:19 +0100
Message-Id: <20220508212819.59188-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
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

Pointer kctl is being assigned a value that is not being read, buf
is being re-assigned later. The assignment is redundant and can be
removed.

Cleans up clang scan build warning:
sound/pci/rme9652/hdsp.c:3317:28: warning: Although the value stored
to 'kctl' is used in the enclosing expression, the value is never
actually read from 'kctl' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/pci/rme9652/hdsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 3db641318d3a..dcc43a81ae0e 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -3314,7 +3314,7 @@ static int snd_hdsp_create_controls(struct snd_card *card, struct hdsp *hdsp)
 	if (hdsp->io_type == RPM) {
 		/* RPM Bypass, Disconnect and Input switches */
 		for (idx = 0; idx < ARRAY_SIZE(snd_hdsp_rpm_controls); idx++) {
-			err = snd_ctl_add(card, kctl = snd_ctl_new1(&snd_hdsp_rpm_controls[idx], hdsp));
+			err = snd_ctl_add(card, snd_ctl_new1(&snd_hdsp_rpm_controls[idx], hdsp));
 			if (err < 0)
 				return err;
 		}
-- 
2.35.1

