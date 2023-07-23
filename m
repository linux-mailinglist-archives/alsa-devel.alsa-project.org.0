Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F053375EB7C
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 08:28:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5FAE206;
	Mon, 24 Jul 2023 08:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5FAE206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690180118;
	bh=gPTZMOUB3aLB6Rd6EKINvi2tdnwS9XOOupNKoEHGBKk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=W4J7+YCR5E4OoUWKkcn6LfXksWudr3L8JHkT0U+qy5D5J8fVcwI44jRICyaAtU9GT
	 GnfVnQuZ02N8GJqK6QhAmxLdVerCllWw43MIjqy5BNh/wd9v6X7avLJ2ZtbpuxJ2I8
	 9u2fRuwD4eqdYkBgojvP5pzcmSvnCjgocPEZqL4k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C6ADF802E8; Mon, 24 Jul 2023 08:27:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC9DBF80163;
	Mon, 24 Jul 2023 08:27:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB948F8019B; Sun, 23 Jul 2023 09:08:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,
	RCVD_IN_DNSWL_HI,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com
 [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0A74F800D2
	for <alsa-devel@alsa-project.org>; Sun, 23 Jul 2023 09:07:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0A74F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=yvRQlE6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1690096054;
	bh=BydRQ7LrlxKwL52rvHooi1sAXvD3aBwhb8X0VNEtSOM=;
	h=From:To:Cc:Subject:Date;
	b=yvRQlE6dINJQBlmgcMma/LhinaALn4k57OKer63cItsADC7DpbKAuB/rdWjcb6KJ3
	 7JBStA+MgjFnap1tNjo2VL/aCius8jpxCjGfXk4e4s90o1z8IDSP3MrjFD/rtR4p/S
	 EOAOP0hdgK5/FI3rDLXKJSgqGyLwZISn+5XJUBRY=
Received: from localhost.ust.hk ([175.159.123.184])
	by newxmesmtplogicsvrszc2-0.qq.com (NewEsmtp) with SMTP
	id 1E027011; Sun, 23 Jul 2023 15:07:32 +0800
X-QQ-mid: xmsmtpt1690096052ts63ans26
Message-ID: <tencent_AA66A80A12D4372BB57E5B7A60471EB00A08@qq.com>
X-QQ-XMAILINFO: MtiJdzH17lJXn8+YGVSqosmIrUD6q6uQf2Rq1TAbO/gCztlBx7eFvcvCQ8lNvY
	 90FYDRtiC5jkEcC86Jdhcm0DnOC+7LBqavgEFhMB0xnQjxTm7c6XiGUj1ERsNj/6xzTSGUdaJxTz
	 thQKSDDXCriwUzNhu9rlEWcclYxUfj0xy8p7ZKihAOMnMsKS+6ajYb02pqpZnyVJFWNir3hIzlGi
	 vQgppJOGxBIFC6P8sanuLd3Eyt+GIttiw3sq4+T4nLCwkYv/E1+A8ycPS2Cz1+ZjBUuMlc/i4V+T
	 lnTKTWLAhZzq/zKNaHGLDsYCMGcZKaGvT3QHF9ohTfiTSn82E2rL7i0QHyZIEMJaH0q7CmXozJk8
	 Dtp26om5Zi5yLNB3XYU1nSKbO7VvgEOkriac3emTDIM9j/Hhu/rEbasEr8XLyIKH2dtg773AxoC2
	 og+7zUlQ+MCOmlsGH/5XyTj+25+1P9G0PUV3FG1o8KTL66UZuaWDuyamDgzkw3W+BRT3lpasI0QR
	 h6AMwN7rEHgwFNJJfmyKnN5Zs2xpZrbmhEdQSj0mOVdF90cMbbfTIt/V8CLYoFQkdslHIZSJo2RB
	 Hoc/EooUXK5K6mF+Q9q0/3ertZ7306oBzqlelVy4BMBenVD4eQSTvfTkCseOG/41ueMHm3NpjHKK
	 649NAtCK9ilg7lFDDBnh6b6/5tc3AC3P311EcSANotAhEE8Qis6J+a86v6mRyLz6hQOrBK6FncBV
	 CR9gl+Sq7oMX0IcRH32nMpEa3lN58A5Zxf2bHsYAiMt1sDdZFMRU4UPWg8RP1ebonbYGKsKBowsY
	 exST73kZqa0D/B2HQDAfMRZWU7oxixaL64sFwLkBxMkxE0hIxHgOVq2tSCgPg2F2h+H/D1KmoRMp
	 3B5Mm79aD/RbESeXv4Ptb+LQ/GkgaS8Yl/Xx1pIqZb4+VWyGYx+W0T0e5dc3NAK7DwtJMr2+61zW
	 6a1vzJug9q4sJThXRdlZyMvR/0ZAD8151yHXEoW3YY8C6SggArug==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: oder_chiou@realtek.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [PATCH] ASoC: rt5665: add missed regulator_bulk_disable
Date: Sun, 23 Jul 2023 15:07:31 +0800
X-OQ-MSGID: <20230723070731.6195-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: zhang_shurong@foxmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5REE3S2ZVVKAPT2C75AYUCJQAFPVD5NG
X-Message-ID-Hash: 5REE3S2ZVVKAPT2C75AYUCJQAFPVD5NG
X-Mailman-Approved-At: Mon, 24 Jul 2023 06:27:14 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5REE3S2ZVVKAPT2C75AYUCJQAFPVD5NG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver forgets to call regulator_bulk_disable()

Add the missed call to fix it.

Fixes: 33ada14a26c8 ("ASoC: add rt5665 codec driver")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
 sound/soc/codecs/rt5665.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 83c367af91da..de36cad8a559 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -4756,6 +4756,13 @@ static void rt5665_calibrate_handler(struct work_struct *work)
 	rt5665_calibrate(rt5665);
 }
 
+static void rt5665_i2c_disable_regulators(void *data)
+{
+	struct rt5665_priv *rt5665 = data;
+
+	regulator_bulk_disable(ARRAY_SIZE(rt5665->supplies), rt5665->supplies);
+}
+
 static int rt5665_i2c_probe(struct i2c_client *i2c)
 {
 	struct rt5665_platform_data *pdata = dev_get_platdata(&i2c->dev);
@@ -4786,6 +4793,11 @@ static int rt5665_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
+	ret = devm_add_action_or_reset(&i2c->dev, rt5665_i2c_disable_regulators,
+			rt5665);
+	if (ret)
+		return ret;
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(rt5665->supplies),
 				    rt5665->supplies);
 	if (ret != 0) {
-- 
2.41.0


