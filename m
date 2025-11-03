Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DC1C47546
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:49:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 993896030C;
	Mon, 10 Nov 2025 15:48:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 993896030C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762786141;
	bh=DswA1willBQzbF6hAF3QyQvRhGbnRQbotxR22cAl3wo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rOvMdKyZ2VmiVVzmUTwkK/TmeZ/eJmeVjYP4Jm4LKqvg7wYNuscw20yivdpyx3BfQ
	 OOOVbwA32QBaSxSBieqPGubjmUCfZ0jLDEXbpuN8c2UkGUx7Ox4XebS1p05LiP8xZz
	 orrizq4ttVZzP1ccQPvjY14w4YtdkM5CDpmQT2ek=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2385F897B8; Mon, 10 Nov 2025 15:42:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CCA1F897B8;
	Mon, 10 Nov 2025 15:42:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B57BF80526; Mon,  3 Nov 2025 09:52:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from cmccmta2.chinamobile.com (cmccmta6.chinamobile.com
 [111.22.67.139])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F58EF800E5
	for <alsa-devel@alsa-project.org>; Mon,  3 Nov 2025 09:51:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F58EF800E5
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee569086d29e30-89f52;
	Mon, 03 Nov 2025 16:51:53 +0800 (CST)
X-RM-TRANSID: 2ee569086d29e30-89f52
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from FHB-W5100149 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee569086d25130-ca7e8;
	Mon, 03 Nov 2025 16:51:52 +0800 (CST)
X-RM-TRANSID: 2ee569086d25130-ca7e8
From: Zhang Chujun <zhangchujun@cmss.chinamobile.com>
To: reddybalavignesh9979@gmail.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Zhang Chujun <zhangchujun@cmss.chinamobile.com>
Subject: [PATCH] selftest/alsa: correct grammar in conf_get_bool error string
Date: Mon,  3 Nov 2025 16:51:46 +0800
Message-ID: <20251103085147.2276-1-zhangchujun@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: zhangchujun@cmss.chinamobile.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6IJMK3MLWFYPFPR5ZHYPX33C2FEYCRFN
X-Message-ID-Hash: 6IJMK3MLWFYPFPR5ZHYPX33C2FEYCRFN
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:40:42 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6IJMK3MLWFYPFPR5ZHYPX33C2FEYCRFN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The phrase "an bool" is grammatically incorrect; it should be
"a bool".

Signed-off-by: Zhang Chujun <zhangchujun@cmss.chinamobile.com>

diff --git a/tools/testing/selftests/alsa/conf.c b/tools/testing/selftests/alsa/conf.c
index 5b7c83fe87b3..317212078e36 100644
--- a/tools/testing/selftests/alsa/conf.c
+++ b/tools/testing/selftests/alsa/conf.c
@@ -448,7 +448,7 @@ int conf_get_bool(snd_config_t *root, const char *key1, const char *key2, int de
 		ksft_exit_fail_msg("key '%s'.'%s' search error: %s\n", key1, key2, snd_strerror(ret));
 	ret = snd_config_get_bool(cfg);
 	if (ret < 0)
-		ksft_exit_fail_msg("key '%s'.'%s' is not an bool\n", key1, key2);
+		ksft_exit_fail_msg("key '%s'.'%s' is not a bool\n", key1, key2);
 	return !!ret;
 }
 
-- 
2.50.1.windows.1



