Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1118B753E
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 14:02:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7435E65;
	Tue, 30 Apr 2024 14:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7435E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714478556;
	bh=8w+4A+hxgQI/hThP+htf/1vSaLsitNF0Q1FbAOSA1nI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TVfXbZRcEticK+bxV3Yv614A3abNzxrCZMLsrxJBC7SHHHqlTnlhzDs408jUD/iEF
	 dQElfBet1KMzJ0ROWiVy/VlA1LsHWuuGxZzorJPWByxK4I6HbcFTJrUnaQtL1EPy7H
	 QuvvJS6Xc3VTMJZSzxq4EuqKuR4V3aEzkX1UQu44=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23EDCF80612; Tue, 30 Apr 2024 14:01:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E6EBF80615;
	Tue, 30 Apr 2024 14:01:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 959C8F80266; Tue, 30 Apr 2024 14:01:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7518EF80266
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 14:01:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7518EF80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com
 header.a=rsa-sha256 header.s=k1 header.b=lmfQEzr+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=EGJRMa5lGZXxtdcDIwOklX2Yr55CZS7TunS256OH48o=; b=lmfQEz
	r+IEvhfq2BrOf129wb2+M6gRPgc/607BOF2BdSHqUkFQkokBhDi2F12VJUtstyA9
	A9Lqxi2aBLFyfK0Xl1t84OmWmovkj/UwStJIYqpNhFzRDc6/fG46Hqwu0p9xBH7o
	s21Cdwj3mD2DkvdpRGieUiUU9cK/7D4aZlowK8t8tHZfteIvGi6tLs9o2E5F8BO2
	Vzr/7xfI3oUzvpfuqTuIkEaCvBFVni+toRi5JMXw3t98H1NUzAFgHPiVuXYjdWf7
	RJ42iIT5ZtyGVpUhNkR7pLN3X44crRi0PkLW85YbNTGxNJlBJRZwxWJ+lE80CS8O
	qKqoy8fG1i2YcpKg==
Received: (qmail 2623466 invoked from network); 30 Apr 2024 14:01:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 30 Apr 2024 14:01:03 +0200
X-UD-Smtp-Session: l3s3148p1@5wvGH08XmJZehhrb
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: alsa-devel@alsa-project.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/3] slimbus: messaging: use 'time_left' variable with
 wait_for_completion_timeout()
Date: Tue, 30 Apr 2024 14:00:59 +0200
Message-ID: <20240430120102.29459-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240430120102.29459-1-wsa+renesas@sang-engineering.com>
References: <20240430120102.29459-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QJHMMZGJLRLK5PLTJBWTXW2WEQP4IXMQ
X-Message-ID-Hash: QJHMMZGJLRLK5PLTJBWTXW2WEQP4IXMQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QJHMMZGJLRLK5PLTJBWTXW2WEQP4IXMQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
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
 drivers/slimbus/messaging.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
index 4ce0cb61e481..242570a5e565 100644
--- a/drivers/slimbus/messaging.c
+++ b/drivers/slimbus/messaging.c
@@ -111,7 +111,8 @@ int slim_do_transfer(struct slim_controller *ctrl, struct slim_msg_txn *txn)
 {
 	DECLARE_COMPLETION_ONSTACK(done);
 	bool need_tid = false, clk_pause_msg = false;
-	int ret, timeout;
+	int ret;
+	unsigned long time_left;
 
 	/*
 	 * do not vote for runtime-PM if the transactions are part of clock
@@ -151,9 +152,9 @@ int slim_do_transfer(struct slim_controller *ctrl, struct slim_msg_txn *txn)
 	if (!ret && need_tid && !txn->msg->comp) {
 		unsigned long ms = txn->rl + HZ;
 
-		timeout = wait_for_completion_timeout(txn->comp,
-						      msecs_to_jiffies(ms));
-		if (!timeout) {
+		time_left = wait_for_completion_timeout(txn->comp,
+							msecs_to_jiffies(ms));
+		if (!time_left) {
 			ret = -ETIMEDOUT;
 			slim_free_txn_tid(ctrl, txn);
 		}
-- 
2.43.0

