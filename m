Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5D19B36EE
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2024 17:44:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D541914DD;
	Mon, 28 Oct 2024 17:44:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D541914DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730133853;
	bh=Lx7Y/CtbDSllmgwM3r5hUnjW+J7gdLlIRGHYXqhXqZQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GPERIdXKxJnaifERuwrSiADwkUgXUpprhL9xBmOk4inDbJ3mTjRXmyvPbesNYoDAn
	 OKrdeiP4GhwuDCYEOv6hfUlbG0wvMDarVfuihk4+sAPU2OTxDkmtUlxgxM1T4/iqTt
	 trbEbd+BVxvPaUxuEvSC7SK4PAtc3yUcp0fIvzc4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CB5CF8065B; Mon, 28 Oct 2024 17:42:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D70AAF80651;
	Mon, 28 Oct 2024 17:42:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CED1F8016C; Sat, 26 Oct 2024 09:54:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 274E3F80104
	for <alsa-devel@alsa-project.org>; Sat, 26 Oct 2024 09:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 274E3F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0BTuk/N5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEt3i/Ceh6P6JbgKcJ681iGu1/Ax3mMwkWUN2QJKDMgBoHLk6mkwHtDFOlBNLCDz5GV03SyF9CJEDUzlbSkLkxewzFl596VHog4k9Pzf3Ee52aTJ7f9fjC7RWb8YlhLAO8CuYMQ1LlCWodQ0BVRv0o33VOk7JRnzMxzoouUCBJY3KcvVwOqRfeu+i5QH6ReDD/ikcXGpAEqk49bydruICphhZSyIqKnG6fsEotI5LJqStezUPep+t41lWgPdu0EwzZQ6+KY06yswHjP9hsQDyZ8SNsIsfp7qpOaQVXL5wRVDzJhjRtcKNO3aq1eVFSBxiBPsDr6q8N9VTycgWs4Hsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQ3Qol7sNvdQUarJ55LAe5qYBoG5zdUjSAG9cZf/yMg=;
 b=gbXJ0W9EGHv8zCT2k9SvYIttMMunEYTk2mpI0Clewvo5msroCDE2BT1eAdaXYeB7Xt5wiV4ShxFXtR+AKd0TVoLrpvWLjK1hDVraBOMT4TeYvbvJSjiZiD8x3Hotr3sVrZ2ldiG7B2odolmM3dLv0imCDUHvHnFYar3bUlZS/bb+wRt0ZKVuDjIaS9T7SoYJUjq2jceP6zLMto3r1v6/gQ1RX7oeb6qUzSbSv7j0lGvBrd18RwNhKyZLQf9OJi+UngugJ9fnS7zNSovDOCZ2B0HtyVdzDtPVJtrz52FGnFbN4C+XR1nkl/gpKZNvhGX3QtQ81KSsc976moTiCDBZ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQ3Qol7sNvdQUarJ55LAe5qYBoG5zdUjSAG9cZf/yMg=;
 b=0BTuk/N5I7K1j9YxpUWYqLCRe5nLnU8eLb7JYUoeZQO45w3Pz21eftWo6UIxpoucCyZH28w47aOEm+PKd5H+kfcchahkpQeOamokJmZBtvb1FO27vZJZ6woXnvpPgHBqLT4FKnAPk/tud/xUorHTW4LdVNwRTim2M6yqPpfcY/w=
Received: from BL0PR05CA0006.namprd05.prod.outlook.com (2603:10b6:208:91::16)
 by SN7PR12MB6716.namprd12.prod.outlook.com (2603:10b6:806:270::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Sat, 26 Oct
 2024 07:54:08 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:91:cafe::a4) by BL0PR05CA0006.outlook.office365.com
 (2603:10b6:208:91::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.8 via Frontend
 Transport; Sat, 26 Oct 2024 07:54:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Sat, 26 Oct 2024 07:54:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 26 Oct
 2024 02:54:06 -0500
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 26 Oct 2024 02:54:01 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <tudor.ambarus@linaro.org>, <michael@walle.cc>, <broonie@kernel.org>,
	<pratyush@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<miquel.raynal@bootlin.com>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<krzk+dt@kernel.org>
CC: <venkatesh.abbarapu@amd.com>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <michal.simek@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <alsa-devel@alsa-project.org>,
	<patches@opensource.cirrus.com>, <git@amd.com>, <amitrkcian2002@gmail.com>,
	<beanhuo@micron.com>, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: [RFC PATCH 1/2] dt-bindings: mtd: Add bindings for describing
 concatinated MTD devices
Date: Sat, 26 Oct 2024 13:23:46 +0530
Message-ID: <20241026075347.580858-2-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241026075347.580858-1-amit.kumar-mahapatra@amd.com>
References: <20241026075347.580858-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: amit.kumar-mahapatra@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|SN7PR12MB6716:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e10ef17-2616-4e47-c041-08dcf5935eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|7416014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?D3aBIOvMLmS89v1T62L4Xecfr87V+qD0KiFCiUBEGrCua05gRGJmHg2buMdr?=
 =?us-ascii?Q?rEvpqzq4F4h/4TksMymVAqBtsiwVUgeiqFu0jtzujAxPi5kwMDSJt1K3jEcI?=
 =?us-ascii?Q?B4snsdRHVcwi8wzuKx9AS0W/hLWH1r3EpfGkTkN36p/Ob6d25InMa1wwsgqP?=
 =?us-ascii?Q?LJPbXkbI3zOoJ/6C7fSYHRf7gcy/ZVQftLweaRlx3h3esyTjAggV4TuL6KPC?=
 =?us-ascii?Q?Ye710bMR5HVf+YB8JstwH9rspeLPTfkO0dYPaEMTdEKGgC+rbktKwv43CXP/?=
 =?us-ascii?Q?PUZsGDNLbhSL0nukO2b4k2BmUXgRFNlP2iBoY4qiKZ1wLZKb/Lj8jg5ySUcm?=
 =?us-ascii?Q?1CXAZwYPyxtBhfYzpV49NGl84R6y1Kzl+W7hk3342oHEYIosojaMu8pOjjTS?=
 =?us-ascii?Q?BYTiTh67WQU+5y0Y68T75jkqa8o/JLT4Y7bhck5fZlBZHL8iAZGj9i8Dlm+l?=
 =?us-ascii?Q?h6JFj5XfY0Z1Ol60qVUgZ/2yQHHVblrr+vbA483qACGasjz8wIt//AYBHCqh?=
 =?us-ascii?Q?LzenIDPQD74tswlgmQ8HiQkZLwjMVILyRWVd9ummyOL+T8QGkW/zWDi456JI?=
 =?us-ascii?Q?2bdWCJ3YMTq5avuG/flPp0JZ7WgBQwYqQ1lVf3lqYeTafaXPTYEWrEPz3Sym?=
 =?us-ascii?Q?SAnymNq299z+BwiiZ3V7MY97ngn1yHVRSRrG+2+/sVd7bw47vU26Nll0pK4z?=
 =?us-ascii?Q?wf3aBFL5/eAZHklMI90V0mdziernO5k8hbnIMmPyZsdO/syIRd72VyoBRMWl?=
 =?us-ascii?Q?1EyxDFkWUj0e3hXm28SHvUEqRwmBaTavCUSRpCSKEXbUiCiUv6LmIBUESbv+?=
 =?us-ascii?Q?Q23ByEb5fHHK1lD9wTXsHUUMjWWEh95vf3A0Rhc20FTBc29HC6eAS8tmuw6D?=
 =?us-ascii?Q?yK/QoBglNCw9mtfzUXj5Lw8ZYou0BUs8B7QRG3avJwf9Am1OOJ8EQwdpkm1d?=
 =?us-ascii?Q?AHuj0k9+6xq2QpF0AQjSMA/TfmaEiUI+5Kg7gBLfDLDlZ5llbySKrS/I2bAH?=
 =?us-ascii?Q?fgILfvjBu/rIDsXmhOsV2oVWhazDhjzV08WIQHYzqrO6rA273J+Qq8UYK/YZ?=
 =?us-ascii?Q?k7muqdwOQ0B5bgj5biF5qnzdcjXc+jydZpmL+vPTHQrT8mUJTx0++7SivqgY?=
 =?us-ascii?Q?fN/Uo3iDtHb8yHKGWBDtOoKJjRB4+AECXqfwEjDROwaAz21oz1w9PL7LHWV4?=
 =?us-ascii?Q?L3n448uKK3Wv9OLTP5bl9FB0nApth1cVjylScbHcRXhOrsvY6F+tSB0zwnnJ?=
 =?us-ascii?Q?tNsNQ90ODBw3oL3lu3jX9lajoWDu+PBp78xb0gVhWQ1EFdAK3snl+7Zt1mdD?=
 =?us-ascii?Q?nXE4B7S8n62PSuucgz2ZNV9bLvpGtlvzXBwhhOV1M+2bD4jwDYlw+BPxpBN+?=
 =?us-ascii?Q?1YLsK7awY0qnzLs0tbV/POG/NAQimCGSNXE/8LSUIKz2H12nnlmfx+k4HrCv?=
 =?us-ascii?Q?AyzJ5rhLEEwWMAwRd3+V/xC8on+8+T3m?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(7416014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2024 07:54:08.0714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0e10ef17-2616-4e47-c041-08dcf5935eec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6716
X-MailFrom: amit.kumar-mahapatra@amd.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RDPIB57RA6BPBSL7H5536CT3QTS3JWTY
X-Message-ID-Hash: RDPIB57RA6BPBSL7H5536CT3QTS3JWTY
X-Mailman-Approved-At: Mon, 28 Oct 2024 16:42:31 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RDPIB57RA6BPBSL7H5536CT3QTS3JWTY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This approach was suggested by Rob [1] during a discussion on Miquel's
initial approach [2] to extend the MTD-CONCAT driver to support stacked
memories.
Define each flash node separately with its respective partitions, and add
a 'concat-parts' binding to link the partitions of the two flash nodes that
need to be concatenated.

flash@0 {
        compatible = "jedec,spi-nor"
        ...
                partitions {
                compatible = "fixed-partitions";
                        concat-partition = <&flash0_partition &flash1_partition>;
                        flash0_partition: partition@0 {
                                label = "part0_0";
                                reg = <0x0 0x800000>;
                        }
                }
}
flash@1 {
        compatible = "jedec,spi-nor"
        ...
                partitions {
                compatible = "fixed-partitions";
                        concat-partition = <&flash0_partition &flash1_partition>;
                        flash1_partition: partition@0 {
                                label = "part0_1";
                                reg = <0x0 0x800000>;
                        }
                }
}

Based on the bindings the MTD-CONCAT driver need to be updated to create
virtual mtd-concat devices.

[1] https://lore.kernel.org/all/20191118221341.GA30937@bogus/
[2] https://lore.kernel.org/all/20191113171505.26128-4-miquel.raynal@bootlin.com/

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 .../mtd/partitions/fixed-partitions.yaml       | 18 ++++++++++++++++++
 .../bindings/mtd/partitions/partitions.yaml    |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
index 058253d6d889..df4ccb3dfeba 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
@@ -183,3 +183,21 @@ examples:
             read-only;
         };
     };
+
+  - |
+    partitions {
+        compatible = "fixed-partitions";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        concat-parts = <&part0 &part1>;
+
+        part0: partition@0 {
+            label = "flash0-part0";
+            reg = <0x0000000 0x100000>;
+        };
+
+        part1: partition@100000 {
+            label = "flash1-part0";
+            reg = <0x0100000 0x200000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
index 1dda2c80747b..86bbd83c3f6d 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
@@ -32,6 +32,12 @@ properties:
   '#size-cells':
     enum: [1, 2]
 
+  concat-parts:
+    description: List of MTD partitions phandles that should be concatenated.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 2
+    maxItems: 4
+
 patternProperties:
   "^partition(-.+|@[0-9a-f]+)$":
     $ref: partition.yaml
-- 
2.34.1

