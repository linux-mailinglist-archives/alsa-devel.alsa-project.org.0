Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B5C72418D
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 13:59:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEE0C828;
	Tue,  6 Jun 2023 13:58:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEE0C828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686052775;
	bh=z7YRpIDKWPoNYYiH61YotTvzMiLYYd4ZUIkjz9L/kbM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M9sy3KsAkneVdvxwj4oDu4oN/ldCXDtTO3ZYxtPj3qc+t0rnKe0W1v9RcuD0XnHhj
	 f3MBqsKUqxkrqOmwG/wEHTILz5XtmqsqyDfpkySHnayYaGOM/CS+tAyEwoND0YQAG6
	 ty6TPMyvVJJfB4L6joF0l+dkbclaZC7DuGs3CfLg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A1CEF80553; Tue,  6 Jun 2023 13:57:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 636B6F80548;
	Tue,  6 Jun 2023 13:57:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57E37F80254; Tue,  6 Jun 2023 13:57:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46DF0F8016C
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 13:57:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46DF0F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=I8ZaIPsC
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 356AaOmZ029810;
	Tue, 6 Jun 2023 13:57:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=NMvffGLP/L495gVeFgiRl7BuyTmCMHMDH0I+QTyHogI=;
 b=I8ZaIPsCZoo8Sx/Tub8rE44RHTcuIij2KR8rUzROdlbUd0jE2oNKX/sAc8eIdAOJe0VR
 +d5kiDUz+3/eTsi/NekILxEuwMc997ZyHaXJxd8ww9kjKDuiOZzITM54xXsfaSR1gRd4
 LXQkF1JGmHUtdoycXbAvlKi4S2P+bdgUHqY84gBn+qSp3YyLFylHNI3HzwHf57WJ18wb
 KM9R4sJH4v+v+PO6s75vGdY9JRJxn7FfWlaA4HbMqChOH8dfJng7atFOkSjnDs82XVdY
 Dux+Sn/EefKJ4eo/RgRRU3MiR36O54ijHBYe8dXVddQimnnzzg1qKwpMtmL/EMfgmpOF 0w==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r236qrffc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:57:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C88C510002A;
	Tue,  6 Jun 2023 13:57:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C0ACA21D3B3;
	Tue,  6 Jun 2023 13:57:45 +0200 (CEST)
Received: from localhost (10.201.20.178) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 6 Jun
 2023 13:57:45 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Lucas Tanure <tanureal@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Olivier Moysan <olivier.moysan@foss.st.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] ASoC: dt-bindings: document audio of graph port for
 cs42l51
Date: Tue, 6 Jun 2023 13:56:03 +0200
Message-ID: <20230606115605.1633595-3-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230606115605.1633595-1-olivier.moysan@foss.st.com>
References: <20230606115605.1633595-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.201.20.178]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_08,2023-06-06_02,2023-05-22_02
Message-ID-Hash: EMBONOBVFJJ7NPXWZXSWU5MTSAAXXSIX
X-Message-ID-Hash: EMBONOBVFJJ7NPXWZXSWU5MTSAAXXSIX
X-MailFrom: prvs=45217e30f3=olivier.moysan@foss.st.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EMBONOBVFJJ7NPXWZXSWU5MTSAAXXSIX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When linking the CS42L51 to another DAI component, according
to audio graph cards bindings, an OF graph port property is expected
in the node. Document the port property.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 .../devicetree/bindings/sound/cirrus,cs42l51.yaml     | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml
index 670b67ec0b61..f7bafbd4f1c2 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml
@@ -44,6 +44,10 @@ properties:
   VAHP-supply:
     description: phandle to voltage regulator of headphone
 
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
@@ -69,6 +73,13 @@ examples:
         VA-supply = <&reg_audio>;
         VAHP-supply = <&reg_audio>;
         reset-gpios = <&gpiog 9 GPIO_ACTIVE_LOW>;
+
+        /* assume audio-graph */
+        port {
+          cpu_endpoint: endpoint {
+            remote-endpoint = <&cpu_endpoint>;
+          };
+        };
       };
     };
 ...
-- 
2.25.1

