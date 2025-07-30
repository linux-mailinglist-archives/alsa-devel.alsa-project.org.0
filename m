Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F26AFB19C5C
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Aug 2025 09:21:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99A386025F;
	Mon,  4 Aug 2025 09:21:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99A386025F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754292107;
	bh=oIzyWmAeFK6YgCfn98Wc23JYDRn4luDgLFkFv001LP8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lCy0BVyxdtx7MWJYaW7De/KLFCov3ZIEmvcIDVujfVl0qmtBZPVirExCgfoJwU8ZW
	 a/lVsc9DJw/+r3o0mlAIx9kMh3Uojd+x0pet9ogk4QJIp61kqt6b9nrCiNt8CXRhMt
	 mPjKL/WdLnhizAR60nKUV+Sh9kDTO9cfypquehRk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D89F0F805BF; Mon,  4 Aug 2025 09:21:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61491F804FB;
	Mon,  4 Aug 2025 09:21:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3733F80254; Wed, 30 Jul 2025 14:19:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mailproxy06.manitu.net (mailproxy06.manitu.net [217.11.48.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 809FCF80152
	for <alsa-devel@alsa-project.org>; Wed, 30 Jul 2025 14:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 809FCF80152
From: Jochen Sprickerhof <git@jochen.sprickerhof.de>
To: alsa-devel@alsa-project.org
Cc: Jochen Sprickerhof <git@jochen.sprickerhof.de>
Subject: [PATCH] ucm: use close_range on _GNU_SOURCE
Date: Wed, 30 Jul 2025 14:19:01 +0200
Message-ID: <20250730121901.117101-1-git@jochen.sprickerhof.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: jochen@sprickerhof.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QBFFSQRYDUWKSXQK6FRA5XZGEC7J4ESC
X-Message-ID-Hash: QBFFSQRYDUWKSXQK6FRA5XZGEC7J4ESC
X-Mailman-Approved-At: Mon, 04 Aug 2025 07:21:04 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QBFFSQRYDUWKSXQK6FRA5XZGEC7J4ESC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

---
 src/ucm/ucm_exec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/src/ucm/ucm_exec.c b/src/ucm/ucm_exec.c
index 276cf592..b79a84ae 100644
--- a/src/ucm/ucm_exec.c
+++ b/src/ucm/ucm_exec.c
@@ -254,8 +254,12 @@ int uc_mgr_exec(const char *prog)
 
 		close(f);
 
+#if defined(_GNU_SOURCE)
+		close_range(3, maxfd, 0);
+#else
 		for (f = 3; f < maxfd; f++)
 			close(f);
+#endif
 
 		/* install default handlers for the forked process */
 		signal(SIGINT, SIG_DFL);
-- 
2.50.0

