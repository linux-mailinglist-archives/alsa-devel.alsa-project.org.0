Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2475802C26
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 08:37:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 246A1827;
	Mon,  4 Dec 2023 08:37:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 246A1827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701675472;
	bh=lidM2j3zL16LA2CtniKcaUsgmZILmsQ8pkEvgq9V9rs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iLLfvvMG3WhB3s5lEUy6Z3llOEyDY2VuPZXi2pbJyaH9AEiMWkTYdqTZIGrqihJqb
	 inDT9NQKLtNu+JRp4aOUpStamFlAcWnErKCCRtisKh7Tit3ekm6xC1+Nod76Oopcis
	 IHj5TM1SBUtaPRquQSIeOPDh6VFIeqk+31WEucKQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77139F802BE; Mon,  4 Dec 2023 08:37:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3383EF80570;
	Mon,  4 Dec 2023 08:37:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2124CF8016E; Mon, 27 Nov 2023 15:16:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.196])
	by alsa1.perex.cz (Postfix) with ESMTP id A9493F8007E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 15:16:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9493F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=mFk8rvSt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=IGtE5rwax0YMqdt4qD
	HD0apGK11EYOQ+7k2SFJLFuXM=; b=mFk8rvStX8PPZkpjqSzpvZdzZT+XX2wnTY
	Zkh/IlEreaxYi74ujpsXWDJJRANb8y0jxzcAUZwNHjR1NIzCjujxbSiHq4b7yO0o
	BcE6D01pVKw9lUR6kgc1l38oKBV9UT4XC4LzwZqKr0PZK5JLxCyvYYgwxZ6mcy4s
	QXvaJMpw4=
Received: from localhost.localdomain (unknown [39.144.190.126])
	by zwqz-smtp-mta-g5-4 (Coremail) with SMTP id
 _____wDXP_iupGRlxpK2Bg--.25290S2;
	Mon, 27 Nov 2023 22:16:16 +0800 (CST)
From: Haoran Liu <liuhaoran14@163.com>
To: s.nawrocki@samsung.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Haoran Liu <liuhaoran14@163.com>
Subject: [PATCH] sound: samsung: Add error handling to clk_set_rate in
 smdk_spdif
Date: Mon, 27 Nov 2023 06:16:09 -0800
Message-Id: <20231127141609.29008-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDXP_iupGRlxpK2Bg--.25290S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyrXFW8WF1xKr15AF4ruFg_yoW8AF45pr
	yfu39YqFW5tw1Ivryav3WF9F98Jw4rAFW3tr43W34xCF15XFZ0g3yDKryqyF4avFyxWay5
	KrWUKFyUuF1vy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRrcT9UUUUU=
X-Originating-IP: [39.144.190.126]
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/xtbBcgU1gletj1MvSQAAsA
X-MailFrom: liuhaoran14@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TX22YXNTL7ASIBL5ZXGOGGYD4VSO6YJD
X-Message-ID-Hash: TX22YXNTL7ASIBL5ZXGOGGYD4VSO6YJD
X-Mailman-Approved-At: Mon, 04 Dec 2023 07:34:13 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TX22YXNTL7ASIBL5ZXGOGGYD4VSO6YJD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds error handling for clk_set_rate calls in the
set_audio_clock_rate function of the smdk_spdif.c file. Previously,
the return value of clk_set_rate was not checked, which could potentially
lead to unhandled errors in setting the audio clock rate. This change
ensures that if clk_set_rate fails, the error is properly reported and
handled.

Signed-off-by: Haoran Liu <liuhaoran14@163.com>
---
 sound/soc/samsung/smdk_spdif.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/smdk_spdif.c b/sound/soc/samsung/smdk_spdif.c
index 2474eb619882..c31b82b89148 100644
--- a/sound/soc/samsung/smdk_spdif.c
+++ b/sound/soc/samsung/smdk_spdif.c
@@ -75,6 +75,7 @@ static int set_audio_clock_rate(unsigned long epll_rate,
 				unsigned long audio_rate)
 {
 	struct clk *fout_epll, *sclk_spdif;
+	int ret;
 
 	fout_epll = clk_get(NULL, "fout_epll");
 	if (IS_ERR(fout_epll)) {
@@ -82,7 +83,14 @@ static int set_audio_clock_rate(unsigned long epll_rate,
 		return -ENOENT;
 	}
 
-	clk_set_rate(fout_epll, epll_rate);
+	ret = clk_set_rate(fout_epll, epll_rate);
+	if (ret) {
+		printk(KERN_ERR "%s: failed to set rate for fout_epll\n",
+				__func__);
+		clk_put(fout_epll);
+		return ret;
+	}
+
 	clk_put(fout_epll);
 
 	sclk_spdif = clk_get(NULL, "sclk_spdif");
@@ -91,7 +99,15 @@ static int set_audio_clock_rate(unsigned long epll_rate,
 		return -ENOENT;
 	}
 
-	clk_set_rate(sclk_spdif, audio_rate);
+	ret = clk_set_rate(sclk_spdif, audio_rate);
+	if (ret) {
+		printk(KERN_ERR "%s: failed to set rate for sclk_spdif\n",
+				__func__);
+		clk_put(sclk_spdif);
+		clk_put(fout_epll);
+		return ret;
+	}
+
 	clk_put(sclk_spdif);
 
 	return 0;
-- 
2.17.1

