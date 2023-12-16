Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4318C815A82
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Dec 2023 17:49:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F563DF1;
	Sat, 16 Dec 2023 17:49:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F563DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702745359;
	bh=OnYPNDYYL5a1VVwtVnRbkMJu+Fkmdo8zdDGtsqWLGBw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qOb3kkmxEojKfRCRktPtXAB4CNgCXaMQLAzUt9CyZHC1leNI5bFlFuXaL4hoIsjUE
	 7A4kRZimCDUUOWKntSpCp3KJCNoAkRLDqW4FVnizt7SdUftXAvEOoGEYjNFWI+7H97
	 DwIihrjyhKjvC3uunk8E9VOkyCjZom1hZhbRWY8c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4C11F80537; Sat, 16 Dec 2023 17:48:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3428CF80537;
	Sat, 16 Dec 2023 17:48:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C654F8016A; Sat, 16 Dec 2023 17:47:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr
 [80.12.242.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E548F80124
	for <alsa-devel@alsa-project.org>; Sat, 16 Dec 2023 17:47:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E548F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=tN79UuHH
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id EXpEryfYLLMHAEXpEr0s2X; Sat, 16 Dec 2023 17:47:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1702745261;
	bh=WZUiXIzL+1Xu6VLydlUDdYsPfdAWNV1xrKK5PwkOP6U=;
	h=From:To:Cc:Subject:Date;
	b=tN79UuHHlTwW6A2typtF5+qkXQaaeMWtvf7mFzssLvxbnxe7It0Ky5japWAhjuj4b
	 guRsIEBzyOoyG4x1Yw6Ap+MOs6puK97GHapRIovBQvj+kWnXRZ0p7ftv+x7fpyntXz
	 fU5QhEnpynGKQ6In0P6K9r4ZrF6rsDEEt2G7q8VksHPksdLod6imsCAvoYFnyhg3Dg
	 sDA0U5vlPAmPgZ1reiqWYHvcZ5Rxgub44OT9kd1aRlysapJxOpFGMoYlTg3mNaPWhH
	 NLdzuObSjGFIDQ/ZLwerrf1XZWs2fz8zGCwJ3Ck4RxoodIWJQSE0UOt3npPROeZKq6
	 E907+JCRlg2kA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 16 Dec 2023 17:47:41 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	alsa-devel@alsa-project.org
Subject: [PATCH] slimbus: core: Remove usage of the deprecated ida_simple_xx()
 API
Date: Sat, 16 Dec 2023 17:47:34 +0100
Message-Id: 
 <8402a9a8a45937fe2e62617ff0c7408503692b20.1702745212.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: E7B42W6KXQQ3M3JWNX3GX3EWTUQR2EDQ
X-Message-ID-Hash: E7B42W6KXQQ3M3JWNX3GX3EWTUQR2EDQ
X-MailFrom: christophe.jaillet@wanadoo.fr
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E7B42W6KXQQ3M3JWNX3GX3EWTUQR2EDQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

Note that the upper limit of ida_simple_get() is exclusive, but the one of
ida_alloc_range() is inclusive. So change this change allows one more
device. Previously address 0xFE was never used.

Fixes: 46a2bb5a7f7e ("slimbus: core: Add slim controllers support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
/!\ Untested /!\

The change of behavior is motivated by the comment in
drivers/slimbus/slimbus.h stating that /* Manager's logical address is set
to 0xFF per spec */, so all other values, including 0xFE should be valid,
IMHO.

So considering this as a bug-fix, I added a Fixes tag.
---
 drivers/slimbus/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
index d43873bb5fe6..01cbd4621981 100644
--- a/drivers/slimbus/core.c
+++ b/drivers/slimbus/core.c
@@ -436,8 +436,8 @@ static int slim_device_alloc_laddr(struct slim_device *sbdev,
 		if (ret < 0)
 			goto err;
 	} else if (report_present) {
-		ret = ida_simple_get(&ctrl->laddr_ida,
-				     0, SLIM_LA_MANAGER - 1, GFP_KERNEL);
+		ret = ida_alloc_max(&ctrl->laddr_ida,
+				    SLIM_LA_MANAGER - 1, GFP_KERNEL);
 		if (ret < 0)
 			goto err;
 
-- 
2.34.1

