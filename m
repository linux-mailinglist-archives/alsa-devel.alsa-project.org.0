Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B12FA224ECF
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jul 2020 05:10:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FC291670;
	Sun, 19 Jul 2020 05:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FC291670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595128222;
	bh=l46VyF2rTu7UGumQgQdepHR7zS4Id6I1CCvtUuVHYG0=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fD+Ij5NOumJroW4dPYi0wfrJvQSE8osYh/VvHMTU+S1ogUxYVdSHtkFA04kL0u416
	 RvQorjLsYg5hcWLoIVOnpzJVPsDa/lslziocQKylKV+jR7laa1705lRQDSUynGL6XK
	 dUxMUujzEZlVkxTNQbUept0rKs84yrpidBw5WhHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69842F8015A;
	Sun, 19 Jul 2020 05:08:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32C74F8014C; Sun, 19 Jul 2020 05:08:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FROM,RDNS_DYNAMIC,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from qq.com (out203-205-221-210.mail.qq.com [203.205.221.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3473F800F5
 for <alsa-devel@alsa-project.org>; Sun, 19 Jul 2020 05:08:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3473F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="jBMRrOfi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1595128086; bh=t2evcsW91C2o8PepDbqK3HycI/n8Lf+btsMl0h9/L8M=;
 h=From:To:Subject:Date;
 b=jBMRrOfiT/d4UeT7SM7E49rNw9emO48JYZqS2jxHdTComOWGWNzaOfkbRtUMTuyur
 lU/opB4EC9IgXxrgAZOisPCn7uyQAhbwjoP8fCK7Ghq2+InTwE3w0/6v8Xyk1hH9VU
 F+zA45JATz8B1mdmH3PHDvYDu7bz/Zr6u+oGT48U=
Received: from ubuntu.localdomain ([219.145.34.93])
 by newxmesmtplogicsvrsza7.qq.com (NewEsmtp) with SMTP
 id 203BFE64; Sun, 19 Jul 2020 11:08:03 +0800
X-QQ-mid: xmsmtpt1595128083tl4kdv0lq
Message-ID: <tencent_9A57AE970E100BBA15B43AD6BA73D76C5806@qq.com>
X-QQ-XMAILINFO: NPWZKF2Q7EyDBNcw06aW69Z1Nh42cngfszYO3dazq2QbLOigKjh0VQfkzzQInE
 Ypmjob1dHmuNwlDwzzT7kNVdeSQY0jaj7hipHwPYbUizoUhQYW9vnzV6LoOMhNK6/r2Fw40GFORi
 c6og+3jLV2BmHTTkyA+3DZTdgSEdkXgtKcFEH5D3ux9WI5+ByVRNIrsRDEhwnmM54ZSzU2sfqyiu
 Cf8H0TQ2X2TCA7GozhH6+vZlP/F8LnpkSFiYNGxr+4YOLiJFHpdDpOA1bPV2dFoG2uRQO7Jc3Pp0
 J5AP8xmAt2W33wPjEVK+90EioUR85xlPugsSD1zMn1S4oIlfdmEzkPpgCpS56D9UdZN/a0a3YZuh
 D1R63LkPIjeja4nG1hiuItx2kTMwqwrhqRiVWkGSXzMawnbbui4++1ACpd7egYZz6jcdXgl15+Lz
 +SrIe0gw1aMH02d8U+MpZ2pmbEFu9hYMzfQTwDtOxy3qPs2IoN0OPDPc0YxaZpUa/xN5EESu0w9Z
 Mv6UkKEqvHwqTq6U3Hw9jHDlV+T6X9FPCbdwUqydaI+FoItI6pDatoRRptUCJS37Lg4XHT+6Kbns
 VFe6PL3LbS7fFFod6Jddd/7nuB8ecc9ScNtSQyUtS/uJWHMyxI7iEcQB/PwU3Mj0oLpUHKul0mMl
 JWFz2M4EAu6eA0D0Rfi3m6LTyNrwAgZyyOArchtfCBDZncceo2CgDYzvy9EmRsWcVIvXJ3Th+mih
 Rm6ouTUU19CHrkAR3QyvSKTwVLm1LOTW6LtR3jDYUo59rKiV44DQntMA==
From: mnlife qiao <mnlife@foxmail.com>
To: lgirdwood@gmail.com, perex@perex.cz, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, mnlife@foxmail.com
Subject: [PATCH] ASoC: soc-jack: calling snd_soc_jack_report causes a null
 pointer access
Date: Sun, 19 Jul 2020 11:08:01 +0800
X-OQ-MSGID: <20200719030801.9333-1-mnlife@foxmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

From: mnlife <mnlife@foxmail.com>

When snd_soc_card_jack_new is not called or the call fails,
calling this function causes a null pointer access

Signed-off-by: mnlife <mnlife@foxmail.com>
---
 sound/soc/soc-jack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-jack.c b/sound/soc/soc-jack.c
index 0f1820f36b4d..51b799ee98b7 100644
--- a/sound/soc/soc-jack.c
+++ b/sound/soc/soc-jack.c
@@ -44,7 +44,7 @@ void snd_soc_jack_report(struct snd_soc_jack *jack, int status, int mask)
 	unsigned int sync = 0;
 	int enable;
 
-	if (!jack)
+	if (!jack || !jack->jack)
 		return;
 	trace_snd_soc_jack_report(jack, mask, status);
 
-- 
2.17.1


