Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB2A33F9EA
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 21:23:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BB9416C5;
	Wed, 17 Mar 2021 21:22:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BB9416C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616012628;
	bh=RVTCmPeWjNoDtFKx49R9tWgAfSoiWbXqyigFcQK3YRI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KKOKTi2rGO5o3XoFjfMoV8PzafKv3meuz3pkNgu+FO+jPUX4tTezInwe2nzXraNn5
	 SxOUwPhm3LQ4B2BA/uVCDLdNeI9znANWsU23lpHFqvby5FMF8yNX6ak01tMcWq/VfJ
	 wQEw+/zoVZ/RJShvtpiFMmxYGin1D/K8pd/Ap3lg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B66A3F8032B;
	Wed, 17 Mar 2021 21:22:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC4A7F8023E; Wed, 17 Mar 2021 21:22:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-oln040092003019.outbound.protection.outlook.com [40.92.3.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A43F7F8021C
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 21:21:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A43F7F8021C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="OZPzc+HV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGxT+aOAS/MXj6sjei3nY8dThmQ/uZj9/SpPZQn46XE0q9jJRV9FXrSAVEo7kfxHE3BkJwGzU8fv/s6+Mmm+i+Z2KrHh9C3pbZlIxcqD7/Nl1ClSQe10Bo2aDF1RqTRFBHfhSdHLyWiUvW3Yz4fg2O+hPy1CpD+oKynTc7chPrj76viaW6e7BkbtTUEClmGvBz+0FgxX8rE3g0ZryGU2TR7ZO/thKgZVy/vhTesQcE3o1SAVPmcRPcc6znAlSzuo0wWL7uy6vlYxhL+MLraZo+bTxhjC0cWjNJvFHID5BAfaK6KiRDGxnhDpqmTapEM+IylMbK9rjRtJHsYz2bUocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEyWJlF6Z5pYBCuZnQmZpPoBlbmf5jug0/JmmlBfoZ0=;
 b=mO5eehOlqNNypTvGc1bUeObM54TJSEyZocoueO3OmBbQqfeNdHjZsdaqUw9kmalR4XEIZRuVgHDHWEHWdTx/14XprDb6fS7pgovE0GhVLrrx8ZE9yBU/QOXiyIFlrjdoUAlBnbS9mPqxVqK4F1W9qWy0hoXaT0s0k+XfoEyRfZSy6RzpAXHpBq1QIeYbV53t0U66KEl4bg10O7LIiob4d/r8hhCBD+e+bjbubeX9jMB2xXCKMykwyxpq8AiVgph0i8B6OemFFHKiMfSlxPFMLyi5L4PY8dqOZqaAzr3/kc/Dfu/fWsPXxVQczcA8RTTEDqCeQQkob82nugDIU02lRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEyWJlF6Z5pYBCuZnQmZpPoBlbmf5jug0/JmmlBfoZ0=;
 b=OZPzc+HVqCo4B4W2II/gYcnl0QRte8F38XxfSwlKFlsADBeE/WxQgAat3LMDz6+9HcqWcHCej7yiL4MFJlykNProJlUAOyGeAj25pgSr9hRxZKUnjWZI4Ud3rGovt6tcW/AP2NyBEQporon31EkwzsW8k4Wh54XAw5qy8NtjYqAp1PoQ+7VaI84xS1R43BEbu5SQEGpf8V0ZRi/FTIrWaaquN8h/KApjlLYQSXjkTiW21clBeR666BmoeS8Qy07kAGs1QMc29CssVi+XhWAjwAbLFgmP3OYNtl0I6CgTUG4D/yl/ykFM7Pqw26bFCKWY3BxgnVeKH16ROlsD6quZ2A==
Received: from SN1NAM02FT061.eop-nam02.prod.protection.outlook.com
 (10.152.72.56) by SN1NAM02HT263.eop-nam02.prod.protection.outlook.com
 (10.152.72.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 20:21:55 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:7e44::4d) by SN1NAM02FT061.mail.protection.outlook.com
 (2a01:111:e400:7e44::196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Wed, 17 Mar 2021 20:21:55 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:A55445C96CDBA6097DFB50248A434661416EDE69207F5AFF73F14780AD118878;
 UpperCasedChecksum:6904EACB5F4A67842989BD01B85BA86D0DAC08EC42C36A50A857B473ABDBE55D;
 SizeAsReceived:7520; Count:47
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 20:21:55 +0000
From: Chris Morgan <macromorgan@hotmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 2/3] dt-bindings: Add Rockchip rk817 audio CODEC support
Date: Wed, 17 Mar 2021 15:21:16 -0500
Message-ID: <SN6PR06MB53424766F673FC2427CD9AD1A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317202117.29926-1-macromorgan@hotmail.com>
References: <20210317202117.29926-1-macromorgan@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [FW1Cqb6Ljw2Yh7odgaht0BmN0O62IdEo]
X-ClientProxiedBy: SN6PR2101CA0021.namprd21.prod.outlook.com
 (2603:10b6:805:106::31) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210317202117.29926-2-macromorgan@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN6PR2101CA0021.namprd21.prod.outlook.com (2603:10b6:805:106::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.2 via Frontend
 Transport; Wed, 17 Mar 2021 20:21:55 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 74766d7a-8d31-474b-174a-08d8e9824ef4
X-MS-Exchange-SLBlob-MailProps: =?us-ascii?Q?ZjXS9V3hPinq/XEIKldMjSiUeRagjJwHedRhTr1p0cFeHMVCVP94JqcEzq/F?=
 =?us-ascii?Q?QNRlPGmzFqnMLdQHvlPBnc88VcW7Cj4JECQtAKijOu5IXNTE8vcmIic6Tveh?=
 =?us-ascii?Q?wGrxPY1JI0qeGilH5NidLTs6TDEard3NSCbV5HK83xKo2Taih7BNuIqcCYKM?=
 =?us-ascii?Q?dK+1ToZU3QbqqJuIRmwF+nMcIido/awkeyvAiDSrpyMVpqlO+lV5WAupovs6?=
 =?us-ascii?Q?SbfVhAC83J9p4VPZOtL4BHab8cIOsHqoe9d2Rrlyrayy4VD4pjQI2UqNYZW/?=
 =?us-ascii?Q?4wm1KEKMNuDy37Xp9G+Tc+rRELRFExWSEAhAaDQrRYkvD7mCET9MYjJ3LHBQ?=
 =?us-ascii?Q?F+6HhPuGU00W/ZUB95YfI6DrDvhSfwa1dv3kE9RqcQwYbtxurl+I5YQd9VGd?=
 =?us-ascii?Q?fatDW1HN7IkY4qO0VXRSCrQ+7PJWXsAga/MpvoKCUMWW3lK4PoLi/sJK1iZH?=
 =?us-ascii?Q?LY6C3nZpqaNtOLh52wlbY/ZoeiPPF62iYmim9KKq4Etq9SOaOFFmIvwO7L9w?=
 =?us-ascii?Q?Mj0EXgutfhDJrTArGwqYJIc5p/gVI8F7Sq8lOerVgrLK+hHmZuY2pmG2tQGD?=
 =?us-ascii?Q?ruVEQHTYECz99i7BIdi1tW1GImFF4fkd0N6iW4P5B+n+4p1J7dJo12OTPy1Q?=
 =?us-ascii?Q?9MKywor7T2Nuiqx0xdmFY1jGnwXXkjoQ+V3D2+QcwOmsratJ2kSos97l106G?=
 =?us-ascii?Q?TKEykExglLq28mXlrn8pu/GGtVh3vp1q0tKbmgZCbHjkQYXQo/VUw2LbqTT6?=
 =?us-ascii?Q?UE8LmwHLIgPVcEOQUjZ62gK+OgGjjBq7p7Anglie7hxDTstOxr2jhF+B+864?=
 =?us-ascii?Q?MO0dDwI//F2feLc4vx0rZaKL1et7cGUsVn9T5el3eGK6N4+dszFbBY/qhrJZ?=
 =?us-ascii?Q?M3Z9gdR3lnuLTar8yY+Q4fhh+nTxLAurieGp7Ae3aitQzGRX2UBmxoMibLrb?=
 =?us-ascii?Q?mvFxzFGJxXE+fsgV2uqavbhs6akbQMqAM9/GlW5BC6ynEAQ2I4IsAiCCRs6d?=
 =?us-ascii?Q?2VqTuzrzVNKRip59982SXpsHAQ=3D=3D?=
X-MS-TrafficTypeDiagnostic: SN1NAM02HT263:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y4O6UkdKfWq2swNzA9wL+XC/O7K3RK9P1yt6tjBHdc6FSjeQu2hSep4GHkpWafWJF09dxRr1qwLfhOeenBPGSdpvuSDn0QvBJc0kjRoKvt6Hts7HpV9FSeZ+6NQiZW7vAJzrLPp66EemcJBqS+ztPXoOhOYb6IjDA9x8jngyrDpiqy6mzaPh4f4KiwBGllgPxJ/fIX90HudWAzsZR20x2Ei1+jXETUehbxKFUUFb05gvI8uz65wL+yCZHQtzCPxu7Kct9jEfz0Zi1g5Qh7NRZv8pyA+5S/EQSX1VhuGAb8jlbry/9QdK/rdjYo3sBuswNIq5Mnm93gFcdJI1iYv48/ctvvQeBLjUhzwFZ3jJTDRhPp08YxrJ6EO084NLxgo7JbR8gjf+F3BRir9K/C8Dyohi5UePvhFEVEw7SRcwxog=
X-MS-Exchange-AntiSpam-MessageData: +pNIxm2WJav6tMsDDfS5ZAtpQ/v2AK5uBQewwFkJbszKTtcjHA27pxoG/kxq4Pl6XgF3wp/fMcW3aM0ZdRXYKQCdUP1EdYohThh9QRalVL6CZGNwevjCvCgu6PBDWBPGpZu+zK/ha2zFni8UhdLopA==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74766d7a-8d31-474b-174a-08d8e9824ef4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 20:21:55.5783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT061.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT263
Cc: broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 Chris Morgan <macromorgan@hotmail.com>, tiwai@suse.com
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

Create dt-binding documentation to document rk817 codec.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/sound/rockchip,rk817-codec.yaml  | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml
new file mode 100644
index 000000000000..986cebcd0832
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip-rk817.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip rk817 audio codec
+
+description:
+  The rk817 codec is an I2C codec integrated with every Rockchip
+  rk817 PMIC MFD.
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk817-codec
+
+  "#sound-dai-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: "mclk"
+
+  mic-in-differential:
+    description: the microphone is in differential mode.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+rk817: pmic@20 {
+	compatible = "rockchip,rk817";
+	reg = <0x20>;
+	interrupt-parent = <&gpio0>;
+	interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pmic_int>;
+
+	........
+
+	rk817_codec: codec {
+			#sound-dai-cells = <0>;
+			compatible = "rockchip,rk817-codec";
+			clocks = <&cru SCLK_I2S_8CH_OUT>;
+			clock-names = "mclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2s_8ch_mclk>;
+			mic-in-differential;
+			status = "okay";
+	};
+
+	........
+
+};
-- 
2.25.1

