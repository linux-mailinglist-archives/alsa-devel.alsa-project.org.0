Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C92EC447D72
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 11:14:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CD8D1684;
	Mon,  8 Nov 2021 11:13:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CD8D1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636366442;
	bh=KJ3wDP+0fRfysj/9Nq5eOXO7exeaflX4PL3YRwtc1Vs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ESG5pNmF/9ag64I6m3J7uLn6MaXE8TI6CLNllVgCrjchwZsBy0kO/jasgZN5pbrBy
	 CuQsbUnpYajD61e9wOFuuwFjirmOr6WWI9vAw/dSswppbiwmlgNaXjEqg787mYWzeM
	 uELvH7fPPGqgbrEHbsFn2V48Ar2Rv2ST8awNZNUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD70EF804B1;
	Mon,  8 Nov 2021 11:12:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51594F8049E; Mon,  8 Nov 2021 11:12:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E81C4F80107
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 11:12:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E81C4F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=alien8.de header.i=@alien8.de
 header.b="GNk0oPHT"
Received: from zn.tnic (p200300ec2f33110088892b77bd117736.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f33:1100:8889:2b77:bd11:7736])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4A3421EC0502;
 Mon,  8 Nov 2021 11:12:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1636366346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dV4yMzKrI1TbB2ks8ruZkP157t7OTN1nFaA3SUb88SQ=;
 b=GNk0oPHTCiJ2Ie3P0UiFdIsZ0u5vyavaxiCWHbuBT8UA06ECOLORBvzPbrc1iS77ZiuzNh
 QfQfGfVRD7sdOVsI0KmFOU/olLRTH2GnuqOFK+wkoBNLms9AI1VH9nTd76n+hoMsBF0pXh
 59/iPfW6ZACUDcSOFrHkV1A4em4teRo=
From: Borislav Petkov <bp@alien8.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v0 23/42] ASoC: soc-jack: Check notifier registration return
 value
Date: Mon,  8 Nov 2021 11:11:38 +0100
Message-Id: <20211108101157.15189-24-bp@alien8.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211108101157.15189-1-bp@alien8.de>
References: <20211108101157.15189-1-bp@alien8.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

From: Borislav Petkov <bp@suse.de>

Avoid homegrown notifier registration checks.

No functional changes.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: alsa-devel@alsa-project.org
---
 sound/soc/soc-jack.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-jack.c b/sound/soc/soc-jack.c
index d798765d168c..0875f5022066 100644
--- a/sound/soc/soc-jack.c
+++ b/sound/soc/soc-jack.c
@@ -181,7 +181,8 @@ EXPORT_SYMBOL_GPL(snd_soc_jack_add_pins);
 void snd_soc_jack_notifier_register(struct snd_soc_jack *jack,
 				    struct notifier_block *nb)
 {
-	blocking_notifier_chain_register(&jack->notifier, nb);
+	if (blocking_notifier_chain_register(&jack->notifier, nb))
+		pr_warn("Jack status notifier already registered\n");
 }
 EXPORT_SYMBOL_GPL(snd_soc_jack_notifier_register);
 
-- 
2.29.2

