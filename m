Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6EC3F5B44
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 11:49:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9433D1614;
	Tue, 24 Aug 2021 11:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9433D1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629798585;
	bh=9OEMyXBOqO5R68S0E43F1pysaOPhnHwrqN7vH6mFehw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VJsrA3+IDHDTM7VbpHPUm2F3V1xY2I9Uy2XphaxBQdkV5woKZj5vKH7uGLNznT8gQ
	 /lqLOA/AMbFDxHJrLNAqZ+0+0wuxkBB7OvkG6snyH3S+mfeQ9U2yd/pDoPsNVsYXrB
	 2NDXYULwHT8VxHQ6MTjKIeQqH22VsXH1Y05vuvBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50AD1F801D5;
	Tue, 24 Aug 2021 11:48:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7170F80171; Tue, 24 Aug 2021 11:48:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B758BF80171
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 11:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B758BF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="O/oA38N8"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="huG4p29E"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 6D78F21CFB
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 09:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629798477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cLEDrPrYMV/FRHUL7Wm4bivBZGnu+HKLLj0m8IHx+BI=;
 b=O/oA38N84wKvI5B13DuUNmDlL2NRI00O37Xv7f/CS6FGyV8XXTIQZcsOttltYUV0LRiXfq
 d42i2pcrtiBYL6jf2p92XnxA2ONzcxAHBKW8foBJC8n0N3+kb/1HVi9HpoTJA/Ngcgfekk
 q97eEc00Tqy2PFGPJ9EMCOn3AaHetNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629798477;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cLEDrPrYMV/FRHUL7Wm4bivBZGnu+HKLLj0m8IHx+BI=;
 b=huG4p29EUmxYVqqv2UHw86Va7Wtof0d1WpqyknSWB2yW2WPHWf1Tc7JqAvgayNxYA+tdcX
 VdFeFPBDNnsd8uDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 5DD14A3BBA;
 Tue, 24 Aug 2021 09:47:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 1/5] aplay: Fix conversion of unsigned samples in
 peak calculation
Date: Tue, 24 Aug 2021 11:47:52 +0200
Message-Id: <20210824094756.12540-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210824094756.12540-1-tiwai@suse.de>
References: <20210824094756.12540-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The XOR with the mask has to be applied before calculating abs value.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 aplay/aplay.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/aplay/aplay.c b/aplay/aplay.c
index cc51dcb48bba..91af244edb60 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -1828,7 +1828,8 @@ static void compute_max_peak(u_char *data, size_t samples)
 				sval = le16toh(*valp);
 			else
 				sval = be16toh(*valp);
-			sval = abs(sval) ^ mask;
+			sval ^= mask;
+			sval = abs(sval);
 			if (max_peak[c] < sval)
 				max_peak[c] = sval;
 			valp++;
@@ -1848,11 +1849,12 @@ static void compute_max_peak(u_char *data, size_t samples)
 			} else {
 				val = (valp[0]<<16) | (valp[1]<<8) | valp[2];
 			}
+			val ^= mask;
 			/* Correct signed bit in 32-bit value */
 			if (val & (1<<(bits_per_sample-1))) {
 				val |= 0xff<<24;	/* Negate upper bits too */
 			}
-			val = abs(val) ^ mask;
+			val = abs(val);
 			if (max_peak[c] < val)
 				max_peak[c] = val;
 			valp += 3;
@@ -1871,7 +1873,8 @@ static void compute_max_peak(u_char *data, size_t samples)
 				val = le32toh(*valp);
 			else
 				val = be32toh(*valp);
-			val = abs(val) ^ mask;
+			val ^= mask;
+			val = abs(val);
 			if (max_peak[c] < val)
 				max_peak[c] = val;
 			valp++;
-- 
2.26.2

