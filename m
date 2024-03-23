Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE192887C29
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Mar 2024 10:49:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E555162C;
	Sun, 24 Mar 2024 10:49:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E555162C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711273799;
	bh=dqNdFzDav8LT0eeQGhnGEPZYDofLjfHq/dxayOwpeo4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ri2iXy8MLuiVm7R1SkZKSXsMS0CeI4n4y8wFbZc/j7md34wWyq+vGMm+4y03Xx5d1
	 LQJqY1ksrbcR+hE86Jd2XKopvOY5jpoxV65rzD8vh1owVg3bFXFJVZt7fYDeHhFVdV
	 3+R4LQRjBDbg8fSkhE28g+BO3RqzVCuvhm4Z6/Zg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46412F805B2; Sun, 24 Mar 2024 10:49:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD8B9F805C2;
	Sun, 24 Mar 2024 10:49:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C63BF804E7; Sat, 23 Mar 2024 07:05:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65532F8010B
	for <alsa-devel@alsa-project.org>; Sat, 23 Mar 2024 07:03:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65532F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nppct.ru header.i=@nppct.ru header.a=rsa-sha256
 header.s=dkim header.b=YsHkIRqv
Received: from mail.nppct.ru (localhost [127.0.0.1])
	by mail.nppct.ru (Postfix) with ESMTP id 0E2491C14D0
	for <alsa-devel@alsa-project.org>; Sat, 23 Mar 2024 09:03:54 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:content-type:content-type:mime-version
	:x-mailer:message-id:date:date:subject:subject:to:from:from; s=
	dkim; t=1711173832; x=1712037833; bh=dqNdFzDav8LT0eeQGhnGEPZYDof
	LjfHq/dxayOwpeo4=; b=YsHkIRqvWQKYIMxnD97F0HIXWNpS6EkxErXonl3SSFP
	p+c2GiRkYrjB6bKpRhk1uzvoY8PFbIVEtTZ+rW1t6JLE9Dw9J+WxSQxjekpsb5VY
	p6q1UymDgt0st5IcHKoo7Wq24URe+bgcpGjqKmESGwBNDGvAs8kdKJccpOXHKZlk
	=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
	by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jMJjwX2BQctY for <alsa-devel@alsa-project.org>;
	Sat, 23 Mar 2024 09:03:52 +0300 (MSK)
Received: from localhost.localdomain (mail.dev-ai-melanoma.ru
 [185.130.227.204])
	by mail.nppct.ru (Postfix) with ESMTPSA id B46AC1C14A0;
	Sat, 23 Mar 2024 09:03:50 +0300 (MSK)
From: Andrey Shumilin <shum.sdl@nppct.ru>
To: Clemens Ladisch <clemens@ladisch.de>
Cc: Andrey Shumilin <shum.sdl@nppct.ru>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	khoroshilov@ispras.ru,
	ykarpov@ispras.ru,
	vmerzlyakov@ispras.ru,
	vefanov@ispras.ru
Subject: [PATCH] amdtp-stream: Checking a variable for zero before dividing
Date: Sat, 23 Mar 2024 09:03:38 +0300
Message-Id: <20240323060338.663707-1-shum.sdl@nppct.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: shum.sdl@nppct.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: INX547PJOROZVQ67IGOTDT6FQTQT2A52
X-Message-ID-Hash: INX547PJOROZVQ67IGOTDT6FQTQT2A52
X-Mailman-Approved-At: Sun, 24 Mar 2024 09:46:15 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/INX547PJOROZVQ67IGOTDT6FQTQT2A52/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The step variable is initialized to zero.
It changes in the loop, but if it doesn’t change
it will remain zero.
The patch added a variable check.

Found by Linux Verification Center (linuxtesting.org) with SVACE.
Signed-off-by: Andrey Shumilin <shum.sdl@nppct.ru>
---
 sound/firewire/amdtp-stream.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index c9f153f85ae6..b61aa30f43a9 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -168,7 +168,8 @@ static int apply_constraint_to_size(struct snd_pcm_hw_params *params,
 		if (snd_interval_test(r, amdtp_rate_table[i]))
 			step = max(step, amdtp_syt_intervals[i]);
 	}
-
+	if (step == 0)
+		return -EINVAL;
 	t.min = roundup(s->min, step);
 	t.max = rounddown(s->max, step);
 	t.integer = 1;
-- 
2.30.2

