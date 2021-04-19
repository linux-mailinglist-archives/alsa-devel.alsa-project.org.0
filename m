Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFDC36479E
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 18:00:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7096167A;
	Mon, 19 Apr 2021 17:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7096167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618848016;
	bh=JvVXypYP0nvfruv6JC37VeCldsJ79N2g+H4r64vve8I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aLfrkf0n6I+/etWF5J+QaPqnEInMWlffT9OPoiUNGjvB+gV1x/0vGBjGZ+kW8shnj
	 t2noaLnaAmk6jf59SQ2JOy3ULrKAc+8CQE5d1UbMXA18nQIUEbpyrJjqjIIzLPycSc
	 fTtsb/P+YU/UaJq3StNXo4EjImGvHO75i7d15QJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFA27F80431;
	Mon, 19 Apr 2021 17:58:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB22DF80430; Mon, 19 Apr 2021 17:58:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11olkn2100.outbound.protection.outlook.com [40.92.19.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B337EF8019B
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 17:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B337EF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="AzqLR6Ag"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+tojzO8IInO9/pufpvFFfUjGjx1vMpLIxD+CoUvEVyREuxdY3yIy1Y8gdFH6h8801luQBip6OrmAxRZH/kdpoHK9g0ujn6QOvaOfakpkm1uvGtlX36qOpX9eAE0MvQ6MEeuMFXNqWLqGnrwaZ4Hzut4N01UczGXMdQ2nFqZADP8XqU7kOoRRFMChnosKVt2Aqv/TNFbPy1cBmM196wp1PkYlrPyI1sO0xbb4wRWwjpT1kBknD/DUtFjKJbxqeuRY9U1o1W0FkyFt+QMeAscYyOQ5j0F5WJYq1Krsf3aqfsE+3bRvYJPO9AuJyInQJlcNIoUKketbViqkxnqulYkUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Z6Ic0XQPavYVgbb8NNlcJMP5J84q3VG8D2ZtPGmfvk=;
 b=jf35dg+iMbswzQCFD62kS3RIGkQnPPeZ7mapGsCwYBQZTBrn8P61XkLUgiH+Z2sbd6IxKEU+8dOndF4gX7wvtdBT0wdZ4maHxAMKDZ8GKmcEEHFMstqBKsbqKkwSYHueW7t5Sr2wQsoEDFHN+l5N7NIz6B9rfuF6tuztqYdahVQrQydQ+Dg9T7qtyGN/5c/9tCFSwtbtRzfrzT6ikRATNSumKjIvLvvngQ6YWaXtDeANtSwhSw1LMYZcu9s9Nwzv0BfUBZvBVF7iiDQL39ect/mxnjuCiu+buTuN7lY8waMPwcsXyzVT2fMShlyLgRXfzRC1EMoJQB5iv5s47lzZoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Z6Ic0XQPavYVgbb8NNlcJMP5J84q3VG8D2ZtPGmfvk=;
 b=AzqLR6AgccmyDLBA5nxQTaIznHYMQNcgv5QJxLr30NtJyJ+wEDvdcfzHdG8w6xpPCUxI6vLV56BSJ7E+yU36PdfAGNlas7Bzpn+8QkvSWIVd1eWy/3SR7hDRFNUYe4oBxea7kR6dNRVdA7etQjdd25aC2TieAXvC5opN71XkPV+RS8e7GXlEnRBOm85ISFmsHv3t+VYtyGGfFSN76GHtZQn6navz7tRmiXzezWpR1VQy0heS0yJ12t8S25+S4LflgYs73C7GWTgj78Q1wldqKu4fHIfhRgzasc8qbq5jEHTjv27ao0eJyZzKziyR+kQRtH2wMdLDVbLmApYPuhmDMg==
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4d::49) by
 DM6NAM11HT024.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4d::286)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 15:57:48 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc4d::40) by DM6NAM11FT058.mail.protection.outlook.com
 (2a01:111:e400:fc4d::216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Mon, 19 Apr 2021 15:57:48 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:89A387789A3EF26CAC33388B3E4B4362F5453AF5D868475C51528DDE9F0BB452;
 UpperCasedChecksum:E8FAA8C873905145236B43E5EBF7441851AAA4328137702DFDFD9161823E3552;
 SizeAsReceived:7718; Count:47
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 15:57:48 +0000
From: Chris Morgan <macromorgan@hotmail.com>
To: alsa-devel@alsa-project.org
Subject: [v6 3/3] dt-bindings: Add Rockchip rk817 audio CODEC support
Date: Mon, 19 Apr 2021 10:57:18 -0500
Message-ID: <SN6PR06MB53420A0E831C17342A73188BA5499@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419155718.17348-1-macromorgan@hotmail.com>
References: <20210419155718.17348-1-macromorgan@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [hVt2db7byR3PlMgHF0tfXiMSW/7RaVHT]
X-ClientProxiedBy: SN6PR2101CA0015.namprd21.prod.outlook.com
 (2603:10b6:805:106::25) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210419155718.17348-3-macromorgan@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN6PR2101CA0015.namprd21.prod.outlook.com (2603:10b6:805:106::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.3 via Frontend
 Transport; Mon, 19 Apr 2021 15:57:47 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: ba6de9fa-2e54-4997-fed3-08d9034be096
X-MS-Exchange-SLBlob-MailProps: =?us-ascii?Q?jGdi06XMWgDV9+cWLlvRA1dJ77iP2R+9OYE7HsfC2Jz5/ClW9XU3KAywnogO?=
 =?us-ascii?Q?qagil7BlnrOnKPzBlFTWQ0mrSgpV4gE8cSp3VtKB7WERtbO2wKmm2fUR+JjF?=
 =?us-ascii?Q?3KHYcnrQp3I50qM6yAcrZVqGFGLEZPNQdCRwXEZhjT34PquKSCenIlMBV/Y3?=
 =?us-ascii?Q?fh0m12uZx9p0OwJnutAikXic0ZtqjCKRy7JFXH670EhTweCB7Uk52t90QBCd?=
 =?us-ascii?Q?3l5IW4kdPpRcvsITobRz2Hb1NHNVXkEkHHNouY2EDEj7s2s73t7650uwKji3?=
 =?us-ascii?Q?dmGoj+S6QsV3MQpcjb69WIYOS8H37MDYD0gzOp6ZXDzUsoN+LOrZWYtDjJgF?=
 =?us-ascii?Q?efuBip1pcMFa6ZjvUmgG9MbIJf6N54o/Pw/hiQvE6hTUL6X4+DW9zjjx3QXG?=
 =?us-ascii?Q?2qo1JW8BAS4KPSoG4bgerHHhfdrtyc4rGxkutusgawz315SbekAA/gyvN7YX?=
 =?us-ascii?Q?REI8yYPLv5f/HUzHjYxCfsC8bUS8nIIdwNQOY/HQwAv13oYgA2gyNqmJoIbH?=
 =?us-ascii?Q?jKjkHjGc9Ccbsj4hPBfkZfwK6vd+V4/1oQCSLCnITRpJGGUFumEebUlQii/3?=
 =?us-ascii?Q?DTZzPJgkTqqOCSsD6qsQR77T+p+BoBDN8fOwF1nmUZ3cRD0I7dyoK9rzxZmz?=
 =?us-ascii?Q?XOG4+jUiHtHtI0eNzCA2kaU9QzaUe0d/5nFXDkOUMFkck3DlxxehxWmgw4QM?=
 =?us-ascii?Q?IzwIBTlFo8d5CQyPlpUrk/JCp3GoBC7QEW5Nas+jKraQ9uOAPpQ9PnzERcW9?=
 =?us-ascii?Q?D9RlIFeaW8IvC6c+vz5QMAkKIl0OUHW0vqJSdB9bN/Om41NclSMgLDYOeT2P?=
 =?us-ascii?Q?UJUzwHIbNCHiSeIEDMlqEzA9W0/E8FoOunnS0ADPwn7YxGidYkDb9PLydqaI?=
 =?us-ascii?Q?EGxU0mYNXm8vEiVVwlSNXvt6Y0gLEW1s1u5uWcgKbUkaOuvr3ZnJxwY8OEcm?=
 =?us-ascii?Q?BYHil1MIwWu3BG1EyeSlbuuS4KuDQw4h?=
X-MS-TrafficTypeDiagnostic: DM6NAM11HT024:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jwbkp5P/UoQGGQ3yCrxlR8k2qalr9i8CDefSCNxD5HEOVMhdCoTskGL8N2GJOM6ZwkCcuvyEQaHLm3yyffsZof65tdeFAZxuJ8st1B/vSi05Eho8Oe0mpge3Ho83OTn4FyM0U/i5TH8/oibb5KSm3MfMBwnbA55GzMenJ51LAq7lm+Lye27j0uZtl8hlDD3DGQPk9o5TCkh+y8/h7sGF8Xeu3p6XWuLm2dI/u5HuQJMvhspt7uP7+nQi8D/i4opVhmsawcnLTmKT3+bIk2yUGuQGrevbE//2TPuwFo21u9Jhkm2MHsH8CF+WzCKudJ6xkgLYkO+qbUbNcmPYE5Y9hwXGY/PfxMvnd5AHEb7BWO9km2uWTNzBQkEUlYyK64bHBu4uSccjMPiC0rkyjuGGu02TE990iPgAIA37pdjBlnA=
X-MS-Exchange-AntiSpam-MessageData: g96FJKnrS39MxErSjmZFppEeWMgFflg8dZmbqFQqZPdGJHMdiKRKZCziDaiERKuavveoqcLvZ+0qysbuK5MuiDJ73KxX1Ajs8ela4WN03hOl0mj4p72PAH7SRw7pax+UOiLZOKKuLd9JNvozbNh/Vg==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6de9fa-2e54-4997-fed3-08d9034be096
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 15:57:47.8686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT024
Cc: pierre-louis.bossart@linux.intel.com, heiko@sntech.de,
 devicetree@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, broonie@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, lee.jones@linaro.org
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
Changes in v6:
 - Included additional project maintainers for correct subsystems.
 - Removed unneeded compatible from DT documentation.
 - Removed binding update for Odroid Go Advance (will do in seperate series).
Changes in v5:
 - Move register definitions from rk817_codec.h to main rk808.h register
   definitions.
 - Add volatile register for codec bits.
 - Add default values for codec bits.
 - Removed of_compatible from mtd driver (not necessary).
 - Switched to using parent regmap instead of private regmap for codec.
Changes in v4:
 - Created set_pll() call.
 - Created user visible gain control in mic.
 - Check for return value of clk_prepare_enable().
 - Removed duplicate clk_prepare_enable().
 - Split DT documentation to separate commit.
Changes in v3:
 - Use DAPM macros to set audio path.
 - Updated devicetree binding (as every rk817 has this codec chip).
 - Changed documentation to yaml format.
 - Split MFD changes to separate commit.
Changes in v2:
 - Fixed audio path registers to solve some bugs.

 .../bindings/sound/rockchip,rk817-codec.yaml  | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml
new file mode 100644
index 000000000000..0059ef54d6b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml
@@ -0,0 +1,57 @@
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
+	pinctrl-0 = <&pmic_int>, <&i2s_8ch_mclk>;
+	#sound-dai-cells = <0>;
+	clocks = <&cru SCLK_I2S_8CH_OUT>;
+	clock-names = "mclk";
+
+	........
+
+	rk817_codec: codec {
+			mic-in-differential;
+			status = "okay";
+	};
+
+	........
+
+};
-- 
2.25.1

