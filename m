Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CA49077DD
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:08:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E65A7211C;
	Thu, 13 Jun 2024 18:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E65A7211C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718294909;
	bh=JgcnB+Jnu79wChlRxQ6yAuCFP4ya7asdyOsYYtVBMS4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NtfWF+/MLSaNZH8TAkhY98VF4Ld39QyKOwGoUH03PerVIgGrCC9/uD5CcwcC1/5wb
	 WpSDRtnpOptC1/giqKQSUe1QFw8j6Bg5lSKeO3aGZv+/0XkuzKUL0Ddn2WQAwHLpKx
	 PWUBB2WIDjisZHcJQUR8YGqju0D6FiZKPjqEBeGs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DB29F806D6; Thu, 13 Jun 2024 18:03:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AB20F897DB;
	Thu, 13 Jun 2024 18:03:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31F63F802DB; Wed,  5 Jun 2024 12:52:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx1.t-argos.ru (mx1.t-argos.ru [109.73.34.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02C8DF800AC
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 12:52:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02C8DF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=t-argos.ru header.i=@t-argos.ru header.a=rsa-sha256
 header.s=mail header.b=Gb0W7zja
Received: from mx1.t-argos.ru (localhost [127.0.0.1])
	by mx1.t-argos.ru (Postfix) with ESMTP id 37B29100003;
	Wed,  5 Jun 2024 13:51:35 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-argos.ru; s=mail;
	t=1717584695; bh=qTW8vJZuEk1pq+43pj+Rrt+D8s/7mBU+BfhX8XQU6oY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Gb0W7zjaJ+SUG6qlpLFQf3iQ5WAjAXAstizjVBHtHCb5CaLe9aR1wAeOpP9bvFh6w
	 OkYqgemttLPnaMt/0j1B/P2GQQMk/LpyfaZvLMBEU7q7Nuhs6Zs/0kYmzElTEptDFB
	 8YgPHZDZxyyuaNneF0VNNs0Yg0bCE75yW3l0yvwyUdxe8VpvpUco6vpPqYx2OaMnRj
	 wBLdbGXQ1QM4z3HEufrXSQE71CHexsgbmsfVLl41UXHVzLvYzPTaHFxsGy87VI/Fvz
	 ncDRUkjoT6Mhhrtl239s4l9d6SRWM1SHMyH4StghGCHTmkipvUf6Ms9WS+2xfjzLX5
	 V/xvyKs1L34PA==
Received: from mx1.t-argos.ru.ru (ta-mail-02.ta.t-argos.ru [172.17.13.212])
	by mx1.t-argos.ru (Postfix) with ESMTP;
	Wed,  5 Jun 2024 13:50:23 +0300 (MSK)
Received: from localhost.localdomain (172.17.215.6) by ta-mail-02
 (172.17.13.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Jun 2024
 13:50:02 +0300
From: Aleksandr Mishin <amishin@t-argos.ru>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: Aleksandr Mishin <amishin@t-argos.ru>, Banajit Goswami
	<bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
	Venkata Prasad Potturu <quic_potturu@quicinc.com>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH] ASoC: qcom: Adjust issues in case of DT error in
 asoc_qcom_lpass_cpu_platform_probe()
Date: Wed, 5 Jun 2024 13:49:53 +0300
Message-ID: <20240605104953.12072-1-amishin@t-argos.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.215.6]
X-ClientProxiedBy: ta-mail-02.ta.t-argos.ru (172.17.13.212) To ta-mail-02
 (172.17.13.212)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185736 [Jun 05 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: amishin@t-argos.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20
 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f,
 {Tracking_from_domain_doesnt_match_to},
 t-argos.ru:7.1.1;mx1.t-argos.ru.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2,
 FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/06/05 09:22:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2024/06/05 07:06:00 #25449783
X-KSMG-AntiVirus-Status: Clean, skipped
X-MailFrom: amishin@t-argos.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: R7HZFDXRYF7YW744MEZQB2PVES5PT55B
X-Message-ID-Hash: R7HZFDXRYF7YW744MEZQB2PVES5PT55B
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:02:40 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R7HZFDXRYF7YW744MEZQB2PVES5PT55B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If IORESOURCE_MEM "lpass-rxtx-cdc-dma-lpm" or "lpass-va-cdc-dma-lpm"
resources is not provided in Device Tree due to any error,
platform_get_resource_byname() will return NULL which is later
dereferenced. According to sound/qcom,lpass-cpu.yaml, these resources
are provided, but DT can be broken due to any error. In such cases driver
must be able to protect itself, since the DT is external data for the
driver.
Adjust this issues by adding NULL return check.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: b138706225c9 ("ASoC: qcom: Add regmap config support for codec dma driver")
Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
---
 sound/soc/qcom/lpass-cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index b0f3e02cb043..5a47f661e0c6 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1166,9 +1166,13 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		}
 
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-rxtx-cdc-dma-lpm");
+		if (!res)
+			return -EINVAL;
 		drvdata->rxtx_cdc_dma_lpm_buf = res->start;
 
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-va-cdc-dma-lpm");
+		if (!res)
+			return -EINVAL;
 		drvdata->va_cdc_dma_lpm_buf = res->start;
 	}
 
-- 
2.30.2

