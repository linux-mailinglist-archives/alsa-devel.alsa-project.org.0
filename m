Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4CC7A6102
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 13:16:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA746E73;
	Tue, 19 Sep 2023 13:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA746E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695122205;
	bh=/Epznwospd2bV4wBxS4jo1rlDydK97jIGLrK3lUh2a4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DGRtkIIjDPoX9y+e9UOeL03y8HYv8ezqlMB5knBNyWQ69NDho28+0Usjmp5oUjNYZ
	 w1OdnWwBskcRY1zNvS3mxu5Lu4R8/rZLdoYj4r3eFJZVeEzh3hnIwJtqj0HyP7bT5T
	 rmctsAXrtATTLTQFfRW1esFAkV0lpRrmuVb+uiiM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45009F8055C; Tue, 19 Sep 2023 13:15:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95B6AF8055A;
	Tue, 19 Sep 2023 13:15:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8142F800F4; Tue, 19 Sep 2023 13:15:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10B12F800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 13:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10B12F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HORNzw6l
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB53AC0002;
	Tue, 19 Sep 2023 11:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695122097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xcJ5qTkUsGyUYuUEqs/IjcCp46UKLGP6e0znI032Doo=;
	b=HORNzw6lpAiHBXs3j4eI0uBBoblJEJamSK9dgF5IlOf7BWhXbqnGVYEUNLxQ1bjUjRXqsR
	fb20mBvKvniyOp1ZcWfrYQPeMFo+EuxRaft98svYIz9oWnCBSMuQuzZxWMRKzK+fPrnNP7
	s/e9En3enni+4xQ7oKVV7I7qfWHpXywh3KrBThyomhnOp9QEUf3BV7eGGf+79/dbywBrOt
	oJEArUQSnNy1CKEuSXsiRXon0BF99JuTiF/Q5Q4CikGG0/BTmUtppZ8T6z1U+mUcY3vUQc
	k1FGvjc8RLEbX+fMzgtfGR8rLEJO9KYDRbecEqW0kMHwML82ljAqrwfPRTiKJA==
From: michael.opdenacker@bootlin.com
To: alsa-devel@alsa-project.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] topology.c: include locale.h
Date: Tue, 19 Sep 2023 13:14:29 +0200
Message-Id: <20230919111430.2912326-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919111430.2912326-1-michael.opdenacker@bootlin.com>
References: <20230919111430.2912326-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
Message-ID-Hash: Z7I4YVHMJZ73EMR5SNQW7TZKL2QHRSRD
X-Message-ID-Hash: Z7I4YVHMJZ73EMR5SNQW7TZKL2QHRSRD
X-MailFrom: michael.opdenacker@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z7I4YVHMJZ73EMR5SNQW7TZKL2QHRSRD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This solves an issue compiling with the musl libc.

Fixes: #239
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 topology/topology.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/topology/topology.c b/topology/topology.c
index 1840ffe..5d03a8b 100644
--- a/topology/topology.c
+++ b/topology/topology.c
@@ -32,6 +32,7 @@
 #include <sys/stat.h>
 #include <getopt.h>
 #include <assert.h>
+#include <locale.h>
 
 #include <alsa/asoundlib.h>
 #include <alsa/topology.h>
-- 
2.34.1

