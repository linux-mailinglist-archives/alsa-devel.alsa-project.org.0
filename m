Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A03451EB79C
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 10:46:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA9901660;
	Tue,  2 Jun 2020 10:45:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA9901660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591087576;
	bh=fwyIT/SmSgrdcmS6vNVe5PtqmUa5sZloqh+5qJzNMhc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z+e9HjXGu5AVgn6a4ZnrgATVvyq5pcihGLy4jLA1HTjZgmaEZ7nITb2hnQ2Zy7jtO
	 itrQhKgeCwRN2FHKDPfdXFQDBZU8S5frVztrAOgzH8z1PMkH+5DiD5h9f6SJLdLnq+
	 EV9d4VI/T/CHT99wiMhGiCREEupogh5D6eR+mwXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D66F8F80272;
	Tue,  2 Jun 2020 10:44:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A33C9F8026F; Tue,  2 Jun 2020 10:44:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2103.outbound.protection.outlook.com [40.107.223.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E36D2F800B8
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 10:44:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E36D2F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="ZftUt73G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sq6MOXsdxk9ETP5Sdl7ZjC9U2RdOiJ/P1ongxHqLIDBzrIxlClYp2b9CjeZwWlvhF3jDwCasCBJrRvTfuMTBxzn99ReFYiPqKf90x9+sohNcr/uXkGwMcaIlFjSdaEVMyPMuvdwId+zIBKOfggIHBl3JbQ+hboQOnLZ3WdKRX8nRqk1oH+bpXBsRmMDUWKh2jv3UgO+Z1YZ7lFzQIhwtpAWuFVzHl+K+1ZMN43PjWBPjqj2tc63Nn2kfy0vqZUEP96QV2ZvGH34OmyHCdaMi7Ft5iJjsrTwz+1A5AVI1Idor9PWx3gFRgb88bmm/vGF/Ti1w1GEHe4rIPffeKUw2BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymLiV1mrG5Oz7Ulv3QIq03ZuC8dnksniBhorGy+hhIo=;
 b=nnB3M6B8BAtdpIGgtrSmp5cCkJarZzWGjMd2b8yuG07hBPpfa4BEr/ydQdTvQBLUJWV1Jvy9O6WXHLvpSkbB1cPKN3KNS03ilpuPTB1TiSSDnxbeMfiqIhb2sY2FwFF4pQNyqIIKWDcOUFDfH0DHs9sbgMen5kd1w0h/wEsdOLNfbXAdyBgKcbxFrHMX97OtICp31lPRxUgtkVsgPSknbRqHyGGhCQeZ60HsmcUhil7IPiyxFIckh0FN3TTsKtVCkM5MJ9t1WJvaqPkjSJaipMnx9YckI1O4F2wQKX1egvsftVHzZTfmsf1xXvmcR6sxs20Zd2J+z5PEsnwKwheQ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymLiV1mrG5Oz7Ulv3QIq03ZuC8dnksniBhorGy+hhIo=;
 b=ZftUt73GL3IhEIs+u35CLsrd6xYUGe0yIZjTNn0DcF0v/QcaBWr8DVEluou6J09AsVVt1+OXQEtplsASl/65zf9FbLJQYRcIR/uh5ijmijCebq7hD6RI6gsCrCS6o/3BOLxBI7i2KAcfJM69QgBJWaAMuSRynwP+nyULEQpjx2g=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from MWHPR11MB2047.namprd11.prod.outlook.com (2603:10b6:300:2a::12)
 by MWHPR11MB1901.namprd11.prod.outlook.com (2603:10b6:300:110::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.22; Tue, 2 Jun
 2020 08:44:18 +0000
Received: from MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363]) by MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363%5]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 08:44:18 +0000
From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [V7 PATCH] dt-bindings: Added device tree binding for max98390
Date: Tue,  2 Jun 2020 17:43:37 +0900
Message-Id: <20200602084337.22116-1-steves.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:100:2d::23) To MWHPR11MB2047.namprd11.prod.outlook.com
 (2603:10b6:300:2a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:2d8:959:1878:d447:7247:839:5c8e) by
 SL2PR04CA0011.apcprd04.prod.outlook.com (2603:1096:100:2d::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.17 via Frontend Transport; Tue, 2 Jun 2020 08:44:14 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2001:2d8:959:1878:d447:7247:839:5c8e]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6f522d1d-9d2e-4fbe-3f42-08d806d122e3
X-MS-TrafficTypeDiagnostic: MWHPR11MB1901:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR11MB1901C186D34E721354E26AC5928B0@MWHPR11MB1901.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JHy5y2AL/A5U2QeIavo71uB0iQi0otvvlTIIcpqc+kAiLyJ7D3Kxz0ib9wl+qg+yPXbiMSKA3EWpj3YPx2eh+CVHlT0srjXW6WL23lq8QSOdf3L+57LxMSBbZ+btddsNBf0QlRgkgWI1UVpnY29Ytjb3Ac0tm67CEGABzOpc/jrHWBJNHqtpmjolbn+awEhAgF1djofqxNMjBkwio24Szpl8+WEBxnDTNwbKtgPJtWJRvirIT7YAImt7uHB/e0BCo2BzYkx0iJIxBxrh7aGOLTC7juBibo/fmO1D2KQrS460h9XVVuphDGL/tHsOMxTODRa282JdwaNR+XaAHPYC/N3moaMt5BInumSUUBvVoIGQ2c9v0zJEyJZ8zdBTqHXkkbAuZweCgNz6tfC7FpgfJDVU8/5RG4o+FYteXzeuxpBxPSkL03nWDsvbtBjr963ZpLRC82i/huXX/ZBTuKsCaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB2047.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(86362001)(6512007)(1076003)(83380400001)(478600001)(2906002)(6486002)(186003)(66556008)(4326008)(316002)(5660300002)(966005)(52116002)(6506007)(107886003)(66476007)(16526019)(69590400007)(66946007)(2616005)(36756003)(8676002)(6666004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: j0xOhFrB3CyQwRO3ZsAab1Y6xmPJ674ieSlEuyy6ZiXUAOpyOvU0t+IC0eO+lB/Iw3zKMX2C8kn7Vct/4rTANK5lZiy30HOXjMQ3YVt6+cA9ncOBvEmPmwec1+3ig+p8sv8C2uO4HIh8kPFugSu7dEKv9NrrRfcbRbJ2d617fQy4prU17vx135Fq76F5Gm0v4S7wht9+WAd282JS0aL3k//a/AndJrtf346PIcs1FpkfvJ6GSRNBYElr5xnTjjIQrH+dMkixYuGwJTZsyTmEpCnkJYy7tWiTVaACSEl3wvhA8VExYcdaTcBvcXoJuN5HvSIIDh6cl8piNvBOXf7to81cyoUaczzcG6mhH2g3YQ6ar9gORL/6owYi16woMHmHtXSzwhRDmz4+/m7fVU/wG5KDsZDFqk/hXjITr8Ll2TvCwqqo/RiIdZ6OVBL8+BGuK43OUbAeXwZ4bT+0TseR2rwxqs9rFK40iTmDQ1n6Z78zrs8jgEvU6FrkJgS6ftaLefu91jzAszMNgGe+qeG4zqAlzVRlXsLjZfBuvC3s510=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f522d1d-9d2e-4fbe-3f42-08d806d122e3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 08:44:17.8683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8R93IdWgxgTeQpd2lL4+K9UXddTFYZjJzOZt236Zvd3Q22DkeKk6qix07g+qDdA0MIALrr7Wg6pH8H/HfPEmWO8x+2fgv3GobMSn8u6osA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1901
Cc: ryan.lee.maxim@gmail.com, Steve Lee <steves.lee@maximintegrated.com>,
 ryans.lee@maximintegrated.com, steves.lee.maxim@gmail.com
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

Add DT binding of max98390 amplifier driver.

Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
---

Changed since V6:
	* Re-confirm yaml dt binding check
	* Add minimum and maximum value for each temperature_calib and r0_calib
	* Add maxim prefix for naming.
Changed since V5:
	* Change txt to yaml and fix up the examples.
Changed since V4:
	* No changes.
Changed since V3:
	* No changes.
Changed since V2:
	* No changes.
Changed since V1:
	* Modified sample text in example

 .../bindings/sound/maxim,max98390.yaml        | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98390.yaml

diff --git a/Documentation/devicetree/bindings/sound/maxim,max98390.yaml b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
new file mode 100644
index 000000000000..e5ac35280da3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX98390 Speaker Amplifier with Integrated Dynamic Speaker Management
+
+maintainers:
+  - Steve Lee <steves.lee@maximintegrated.com>
+
+properties:
+  compatible:
+      const: maxim,max98390
+
+  reg:
+    maxItems: 1
+    description: I2C address of the device.
+
+  maxim,temperature_calib:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    description: The calculated temperature data was measured while doing the calibration.
+    minimum: 0
+    maximum: 65535
+
+  maxim,r0_calib:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    description: This is r0 calibration data which was measured in factory mode.
+    minimum: 1
+    maximum: 8388607
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      max98390: amplifier@38 {
+        compatible = "maxim,max98390";
+        reg = <0x38>;
+        maxim,temperature_calib = <1024>;
+        maxim,r0_calib = <100232>;
+      };
+    };
-- 
2.17.1

