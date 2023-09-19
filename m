Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE517A6103
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 13:16:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49CF0E75;
	Tue, 19 Sep 2023 13:15:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49CF0E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695122207;
	bh=6vGvuq3edWFvEIYnGi7DfD2ZuPSLCKvONauykgWN11g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dPlrj9Z/3Cp85fA3SBQXB7Ay3SaXFky0YLvTTBMgJKYjgctQEERLigP+F4ikeX1FG
	 Rh3wBVJCEXNnrDGZb6rAUQgTFKFTnV9Q6kWh85ZuPYDPbUElcTfjKWmPNAWHX1q6eG
	 Nnay2YXET7HJ9q6TwTS5/33XDSE8jwqTcEU1gyHU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80994F8056F; Tue, 19 Sep 2023 13:15:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E498F80564;
	Tue, 19 Sep 2023 13:15:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BDABF801F5; Tue, 19 Sep 2023 13:15:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4C1DF8025A
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 13:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4C1DF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e2NZjuh2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2DB421BF20D;
	Tue, 19 Sep 2023 11:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695122098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vn1OYxPJZmugDdmcYTUvoJzdJtA9Bic0H2R9QcpxV5s=;
	b=e2NZjuh2CgKlERh+LtY7CoY6i5y8zQZKPMCUxXjaAhgXXCELN1ao5SZZLu1OUJweIoPXyz
	PbmImCQmlYa0+mEyNP1MVWaDCpY64BjPnJDhWfMnNCuEvqr5TM3WgsdPKL/t3jIZ7YR0C1
	M1nnwtiOaRzn0zZZI/XnRHHQeJV6DSWzAin2iNL/Njzpb3rVKiFT8IGEbe6ZrFx77XiwA5
	u+PJVnFWzZ8fODLHty0tLNhsrpUD8GVfmM0bp/jzqVySklQbxNVpBlWi7+Fsn1bcy+lznU
	SFWYoEhbopoD7yHm08X+IwCQqtHIi+xxBtWIKz2KcNdLqGxHE3wyXhaj9hpp4g==
From: michael.opdenacker@bootlin.com
To: alsa-devel@alsa-project.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/2] nhlt-dmic-info.c: include sys/types.h
Date: Tue, 19 Sep 2023 13:14:30 +0200
Message-Id: <20230919111430.2912326-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919111430.2912326-1-michael.opdenacker@bootlin.com>
References: <20230919111430.2912326-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
Message-ID-Hash: PEG6WRW5XHPZARSWZRZT2KSYSLGMP7NY
X-Message-ID-Hash: PEG6WRW5XHPZARSWZRZT2KSYSLGMP7NY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PEG6WRW5XHPZARSWZRZT2KSYSLGMP7NY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This fixes an issue compiling with the musl libc.

Fixes: #238
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 nhlt/nhlt-dmic-info.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/nhlt/nhlt-dmic-info.c b/nhlt/nhlt-dmic-info.c
index 3f6c64d..331555a 100644
--- a/nhlt/nhlt-dmic-info.c
+++ b/nhlt/nhlt-dmic-info.c
@@ -33,6 +33,7 @@
 #include <fcntl.h>
 #include <getopt.h>
 #include <sys/stat.h>
+#include <sys/types.h>
 #include <arpa/inet.h>
 
 int debug = 0;
-- 
2.34.1

