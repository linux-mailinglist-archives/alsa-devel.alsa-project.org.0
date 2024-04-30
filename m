Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDF58B7576
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 14:11:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1592B65;
	Tue, 30 Apr 2024 14:10:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1592B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714479068;
	bh=fjGYOTfQaev/sG7B+dCuEUURcaZ6RPsvq/Kn6R5WNA4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fEduopTxhjdlDQrhmom9ilxWHKBdCVYLxwWoSTkZzFb/sD3OcbIcKKpL496EkGF2w
	 t5PuZdp/djkNsxGIWoDeEgDoi2K+c8qez6pv4MEo7pMzj4rE3/uadKXWs6yfPf47y+
	 qH9oSNQF+AI0R/Ga5EKMAatRxYQ0i1+XZ50aHzdE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6E1DF80589; Tue, 30 Apr 2024 14:10:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09B5BF805A0;
	Tue, 30 Apr 2024 14:10:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00792F80266; Tue, 30 Apr 2024 14:10:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48F65F8023A
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 14:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48F65F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com
 header.a=rsa-sha256 header.s=k1 header.b=NC7lA5mm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=V+732hzn1l15Eh
	TbXn3tkfLxL3DCfbD6/48+e8dQkGs=; b=NC7lA5mmCa8iyeQTDcuyxglnUmYDfO
	e+gXEdceVW1jtNvmiJb7dxHaTlqu6jwVijUEULxJSyu048MoqIRPR2y4ci7aN4Hx
	4xuGqKjg1xdWiXPwNA4pZG9atSmjIaXJsiIJp+XghabDOR4tjCAP+zvsJ9mlnm0c
	eQQseMtXBAIbrdOcfXqcWutpVGY9imomP90dymVPbdKoy4B9cdiU3UQFU2rT4hCt
	p5YDZsun2mHSCzDKjoOTrXcCqi55OIRs81ySfdFSExFC77VqyCOil4JH02XWq/1w
	iIxVnJGhJmzpQeKY9W2y+mmH3eMcI1/OSYoa+ot8KtGhh6prSKaB7oRA==
Received: (qmail 2626393 invoked from network); 30 Apr 2024 14:10:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 30 Apr 2024 14:10:28 +0200
X-UD-Smtp-Session: l3s3148p1@I/N0QU8XZMtehhrb
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: alsa-devel@alsa-project.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/1] ALSA: aoa: soundbus: i2sbus: pcm: use 'time_left'
 variable with wait_for_completion_timeout()
Date: Tue, 30 Apr 2024 14:10:27 +0200
Message-ID: <20240430121028.30443-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UTM2T6I47462M4B5XDV5DYVPIMBKWEAP
X-Message-ID-Hash: UTM2T6I47462M4B5XDV5DYVPIMBKWEAP
X-MailFrom: wsa+renesas@sang-engineering.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UTM2T6I47462M4B5XDV5DYVPIMBKWEAP/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Fix to the proper variable type 'unsigned long' while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 sound/aoa/soundbus/i2sbus/pcm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/aoa/soundbus/i2sbus/pcm.c b/sound/aoa/soundbus/i2sbus/pcm.c
index 07df5cc0f2d7..98b812ffbde6 100644
--- a/sound/aoa/soundbus/i2sbus/pcm.c
+++ b/sound/aoa/soundbus/i2sbus/pcm.c
@@ -255,24 +255,24 @@ static void i2sbus_wait_for_stop(struct i2sbus_dev *i2sdev,
 {
 	unsigned long flags;
 	DECLARE_COMPLETION_ONSTACK(done);
-	long timeout;
+	unsigned long time_left;
 
 	spin_lock_irqsave(&i2sdev->low_lock, flags);
 	if (pi->dbdma_ring.stopping) {
 		pi->stop_completion = &done;
 		spin_unlock_irqrestore(&i2sdev->low_lock, flags);
-		timeout = wait_for_completion_timeout(&done, HZ);
+		time_left = wait_for_completion_timeout(&done, HZ);
 		spin_lock_irqsave(&i2sdev->low_lock, flags);
 		pi->stop_completion = NULL;
-		if (timeout == 0) {
+		if (time_left == 0) {
 			/* timeout expired, stop dbdma forcefully */
 			printk(KERN_ERR "i2sbus_wait_for_stop: timed out\n");
 			/* make sure RUN, PAUSE and S0 bits are cleared */
 			out_le32(&pi->dbdma->control, (RUN | PAUSE | 1) << 16);
 			pi->dbdma_ring.stopping = 0;
-			timeout = 10;
+			time_left = 10;
 			while (in_le32(&pi->dbdma->status) & ACTIVE) {
-				if (--timeout <= 0)
+				if (--time_left <= 0)
 					break;
 				udelay(1);
 			}
-- 
2.43.0

