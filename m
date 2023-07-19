Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11573758F2B
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 09:36:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49D0D7F8;
	Wed, 19 Jul 2023 09:35:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49D0D7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689752207;
	bh=vDfHsvFDDHtAtOTKFDpn495+7QnZLBgdCix0dRjOWd4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DfshPs2A8YJy/K7sGWq9wt/thSZKW7pkTiuvP/wdf6SeNFoO8qtKx7xvC/sWWqQXp
	 GaFN560QD4ighc3zjKSRS3FmErpM2LvTU8GrP9PA7Ys7ySx19+mmmWl52cLUZafRav
	 N5Ny286hCCUgMYeZJW2Pi26pQXmn9CRpZyqfWj8E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C409F80558; Wed, 19 Jul 2023 09:35:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEC91F80552;
	Wed, 19 Jul 2023 09:35:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09618F8047D; Wed, 19 Jul 2023 07:47:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.196])
	by alsa1.perex.cz (Postfix) with ESMTP id 552E5F8007E
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 07:47:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 552E5F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=K02t141Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ZCjsQ
	xj97PsNh2/mOZ4iroLyoL86k1KKZ6/WDwJI8Yc=; b=K02t141ZYii7KK+FJz5j3
	EkudIwO/DbutGN73Z9olCrxu1pWpd0D/XLHtYMeR1F3hXyYuqHkFwaONEvPX9iBB
	uXRkpyZjBNaYD5bCL/9xGIY3c+I7O6M3cm6iM1HA4s55KjKQwkBq3jb/xMQQtoAb
	SpOFD6oOOU/gZ2SzdoqO50=
Received: from vm.localdomain (unknown [116.233.75.15])
	by zwqz-smtp-mta-g1-0 (Coremail) with SMTP id
 _____wCHjRrseLdkFdGyAg--.39110S2;
	Wed, 19 Jul 2023 13:47:29 +0800 (CST)
From: Edgar <ljijcj@163.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	Edgar <ljijcj@163.com>
Subject: [PATCH] ASoc: codecs: ES8316: Fix DMIC config
Date: Wed, 19 Jul 2023 13:47:22 +0800
Message-Id: <20230719054722.401954-1-ljijcj@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHjRrseLdkFdGyAg--.39110S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw4UGFy5Cry8tFWxJw15XFb_yoW3CFg_X3
	y8J3yvvFWjkF9Fv34UCF4F9a1093W3CFWqkr1jgFWDJFy5Ar1YkF12gr13u393XFyrAFya
	qF1aqr48CFyjvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiUGY5UUUUU==
X-Originating-IP: [116.233.75.15]
X-CM-SenderInfo: xomlyurm6rljoofrz/xtbCfAixl2DcL1ClQwABs2
X-MailFrom: ljijcj@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LUACY7SNA64IRLH77IBDYKPQJVSOLZNQ
X-Message-ID-Hash: LUACY7SNA64IRLH77IBDYKPQJVSOLZNQ
X-Mailman-Approved-At: Wed, 19 Jul 2023 07:35:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LUACY7SNA64IRLH77IBDYKPQJVSOLZNQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

According to the datasheet, the DMIC config should
be changed to { 0, 2 ,3 }

Signed-off-by: Edgar <ljijcj@163.com>
---
 sound/soc/codecs/es8316.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 34cf60769b62..65e497b455d3 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -153,7 +153,7 @@ static const char * const es8316_dmic_txt[] = {
 		"dmic data at high level",
 		"dmic data at low level",
 };
-static const unsigned int es8316_dmic_values[] = { 0, 1, 2 };
+static const unsigned int es8316_dmic_values[] = { 0, 2, 3 };
 static const struct soc_enum es8316_dmic_src_enum =
 	SOC_VALUE_ENUM_SINGLE(ES8316_ADC_DMIC, 0, 3,
 			      ARRAY_SIZE(es8316_dmic_txt),
-- 
2.34.1

