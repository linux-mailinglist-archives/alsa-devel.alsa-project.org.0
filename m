Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5BB90CAD1
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 14:01:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1BFBDEE;
	Tue, 18 Jun 2024 14:01:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1BFBDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718712070;
	bh=jc50N0RnVWNFD2GgL6AtQC0sltoDiHKgy3x3xfHb+ew=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NT7j/vHU1AOp61zI3bXocSvSgq15uUQt+dkpirkeDuleXiEI1OagvRVpFkdJBotDk
	 +Z1UBzWqLmK+qot80jboPHboQFdI2lsJuE6U35mEWzLbg6rwG7ECVdVH0+Qug9Mu1t
	 OTQbQ8GMiqfD399U3LIldGjY6TVED0M1gUUl7qAs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2742F805AC; Tue, 18 Jun 2024 14:00:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CB02F805B4;
	Tue, 18 Jun 2024 14:00:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF61AF8023A; Tue, 18 Jun 2024 14:00:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5EDA6F800FA
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 14:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EDA6F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=S/tXZM8/
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45IA2Cuf014186;
	Tue, 18 Jun 2024 14:00:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=pRncs9djhWB9Ja92W3g41f
	UBElkvpH4tn5xTWy10eG0=; b=S/tXZM8/EV++30E8fS2Xvuf5Z0QCJH1k5K8+Ri
	8pgtJS+4aBG+qT56h/wb62Zh9qFZS6ZpM3AYtfqQfmRvCJC+OUudFZSnYzxBTV5A
	OPWgbBc16XtxSPw6+Eqj7IkhNMH8waXw0NBrJhDemrIj9ShGqi1cl1Yqqc6cMhDa
	syihGUqouebz49ENPUyKnIg1KlC7HMkuOY/N0uJEZFmbkJzcZR4Apu6a8ONLM4+g
	2HGECQaxT3S7spWfvLdhF85cARpW/9N7awzOb3NueNgw5ouowHK+nu/eIjPBH4JH
	f5zN719srZ3DNUwt/8KClIR0l9PK94D/yvHXTDPT8C9d/Ruw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ys035k7pb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 14:00:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 720F040044;
	Tue, 18 Jun 2024 14:00:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55CFD21682C;
	Tue, 18 Jun 2024 13:59:24 +0200 (CEST)
Received: from localhost (10.252.27.64) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 18 Jun
 2024 13:59:24 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>
CC: <alsa-devel@alsa-project.org>, <linux-iio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] dt-bindings: iio: stm32: dfsdm: fix dtbs warnings on dfsdm
 audio port
Date: Tue, 18 Jun 2024 13:59:12 +0200
Message-ID: <20240618115912.706912-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.27.64]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
Message-ID-Hash: LEAFHSF5NBXB5CQTFXZEZFPUJMDR6H4U
X-Message-ID-Hash: LEAFHSF5NBXB5CQTFXZEZFPUJMDR6H4U
X-MailFrom: prvs=68998c6755=olivier.moysan@foss.st.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LEAFHSF5NBXB5CQTFXZEZFPUJMDR6H4U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix warnings on DFSDM dtbs check
Unevaluated properties are not allowed ('dfsdm-dai' was unexpected)
'port' does not match any of the regexes: 'pinctrl-[0-9]+'

Fixes: 11183ac07a74 ("dt-bindings: stm32: convert dfsdm to json-schema")
Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
index c1b1324fa132..2722edab1d9a 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
@@ -246,6 +246,10 @@ patternProperties:
                     From common IIO binding. Used to pipe external sigma delta
                     modulator or internal ADC output to DFSDM channel.
 
+                port:
+                  $ref: /schemas/sound/audio-graph-port.yaml#
+                  unevaluatedProperties: false
+
               required:
                 - compatible
                 - "#sound-dai-cells"
-- 
2.25.1

