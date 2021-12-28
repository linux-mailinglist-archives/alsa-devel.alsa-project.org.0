Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C80CA480CEC
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Dec 2021 21:03:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AEFA168F;
	Tue, 28 Dec 2021 21:03:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AEFA168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640721832;
	bh=OzQsJxaSTH9Xc/W/6g197Z+Zc+OgtspoDjWxjKmpFMA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gXL3r7AdNIHih/toSGRdSxk2tSc2MOw/SC0hXZ3i+kyn6IBZKY0mtK6P54ROriMmK
	 o9V48y1CScQOW64U4dDUGRnAPuIgRwaAzvoecl0XCLx6DSxva2u9+36zCyJVwgWA98
	 FxlDQviDXDmZ6B7In+eFvbQcGWYo6JidCyzPkTLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DE87F80246;
	Tue, 28 Dec 2021 21:02:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E08E2F80224; Tue, 28 Dec 2021 21:02:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 66071F800D3
 for <alsa-devel@alsa-project.org>; Tue, 28 Dec 2021 21:02:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66071F800D3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1640721760342704058-webhooks-bot@alsa-project.org>
References: <1640721760342704058-webhooks-bot@alsa-project.org>
Subject: [patch] /usr/share/alsa/speaker-test/sample_map.csv is not accurate, 
 not affecting operation of speaker-test
Message-Id: <20211228200243.E08E2F80224@alsa1.perex.cz>
Date: Tue, 28 Dec 2021 21:02:43 +0100 (CET)
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

alsa-project/alsa-utils issue #133 was edited from ZjYwMj:

With alsa-utils 1.2.6:
```
--- a/usr/share/alsa/speaker-test/sample_map.csv	2021-12-06 18:44:25.000000000 +0000
+++ b/usr/share/alsa/speaker-test/sample_map.csv	2021-12-28 19:48:02.390305957 +0000
@@ -1,2 +1,2 @@
-0, "Front Left", "/usr/share/alsa/samples/Front_Left.wav"
-1, "Front Right", "/usr/share/alsa/samples/Front_Right.wav"
+0, "Front Left", "/usr/share/sounds/alsa/Front_Left.wav"
+1, "Front Right", "/usr/share/sounds/alsa/Front_Right.wav"
```
Although this file is not accurate, it does not affect the operation of speaker-test. Perhaps the paths to the wav files are hard coded within speaker-test. Still, I find it a minor bug.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/133
Repository URL: https://github.com/alsa-project/alsa-utils
