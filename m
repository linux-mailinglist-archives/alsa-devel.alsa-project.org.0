Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 340413CA090
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 16:21:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E30E169F;
	Thu, 15 Jul 2021 16:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E30E169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626358865;
	bh=AECOIl1j/iPuLjwQcEbSoOb3RWcgGVlGaZa1vVjCngU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WH0lXXrxAFbz2u2hgGhLHaYnPk+hjcIQ37p/4Mc608A4340YMZxFHzK1HNKyakoN0
	 cFbinWMlW/m3SbKjSqWfleppydhbLcfB44MbPrb3tZzI9cBcAclCPskG4E4MOmfGiR
	 SPQtFmFkyp+iKxnCfzS7kSQmObkLpGYVefUAm9g8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1738CF804EC;
	Thu, 15 Jul 2021 16:18:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59381F804E2; Thu, 15 Jul 2021 16:18:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18A7DF80431
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 16:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18A7DF80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="Lfezue3L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1EXnm4XA8SpFcAYZjQv5sZMgSr9QdYqGTbwVw6uL9doWaAJ9aFPwq30nAYFLVkIm0736NAB7hDIzJid2HArP7JEy4qoNOhnqKMbv2cTdJRLmYNr8VZuU7S12L3ES7mzXPaMx2jrgG2BYPzJTnW5fwSQlkMHp1E21vkJjcTYuLotkLQeyOo4O+2TQ+12oodxtDOsEK/ZRXn2liEh/+uQ3agv3uM9HTsPdp3iJxNtgrCE8MtWhccpb715X5hfTmXgRxtJ2zvzIhsKGrFlpKSGKj+LgXdrekeBxM01GS9PGTHD4GfSxhhy7gqnlihsrdUZJ5yAjQz7nkoe5fwDWnsyGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNWxs69cCWV1EfFdnk29EGsk12tnzfIxTH2XdLwhvnc=;
 b=dAOg2NL/WuL8T/vJniV9N96yT+WGmdmMvVYgEo7V5NUkYg6gz9X51PBVUq/HAlB9ZXdSb88aFVfg6tCw9DJfsYftVM4ySxjfGYhc0SilL2lYEco+ywwPWEzR/Iie8vXg6zuq6npYyYifvNwUAghnZ5gTUYMo4ihWQA6vH2foGfNwK5UhbTuYijjvkiam41HuiQzY+gnIrYOtufkkrd9G0x+4UWYzlvkuaatb35IOajGnyso2VXqoDDRaKn6DlCIXrL3RXgTGxb3PKVyv3RI9gSPrgdxXIdJDkv7+lIzH94DT41hMxhd9SVIH3DvFEruWqDOlDjxdBWyKndrHsGrP9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNWxs69cCWV1EfFdnk29EGsk12tnzfIxTH2XdLwhvnc=;
 b=Lfezue3LiEwL1Ugx4im9pN1/W3ZfHG79YMAsG1ypqU3wiYbbcZSz/AH/hDtvj7h7XU9g9fjt4W3SV2gHo7wTLcrwzGERmdNViA4POuUSEFlZtwlgEjTmDgSUZAzt5P616HIAocqu2C/jxSZJBgmfi70bEuaDnHUMc8hwkeWER3o=
Authentication-Results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com (2603:10a6:208:ca::21)
 by AM0PR04MB4916.eurprd04.prod.outlook.com (2603:10a6:208:c4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 15 Jul
 2021 14:18:40 +0000
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::1105:2d9f:b790:4ec3]) by AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::1105:2d9f:b790:4ec3%6]) with mapi id 15.20.4331.023; Thu, 15 Jul 2021
 14:18:40 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings: dsp: fsl: Document newly introduced fsl,
 properties
Date: Thu, 15 Jul 2021 17:18:02 +0300
Message-Id: <20210715141802.880911-4-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210715141802.880911-1-daniel.baluta@oss.nxp.com>
References: <20210715141802.880911-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P195CA0085.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::38) To AM0PR04MB5140.eurprd04.prod.outlook.com
 (2603:10a6:208:ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5503:9f00:58f1:af0b:2fd9:e70)
 by VI1P195CA0085.EURP195.PROD.OUTLOOK.COM (2603:10a6:802:59::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 14:18:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee5ff288-8dca-49a0-30c4-08d9479b71be
X-MS-TrafficTypeDiagnostic: AM0PR04MB4916:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB491653724D15E3477A135A3DB8129@AM0PR04MB4916.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B5AxKN3AcGW5Jh5qkzcpzo2m3aUTsiBmr6KhjBNqnMv5jPs/lrCn6foE5VSa0zmQix3fS+3SSeyvFSwRvx3Isr5YK8taD70c0FM7vjz965uzuychKt/E1SrBs+brzbhiV7B9DcX0FXgqT1UQ2tf6pEV8xbnRtZq+dQpcaciCln6cjus/xI3DCtW90zECpoLFvbnxdK5BwVhRaIiOf70UCA6lEvG3tnCjGuiuvCD0Xi/8df+hCjWIUJX+emOGdmqAp4rEYdIXFODa62uzu8Xu4Q3ebcgdDE34sOyn+JZxhCyMOk/qTStNqtl3h2sIzvnok0/Z7Wt8TjJd4rLqp386xEreuZmz4X4SH2ydBspxiWGj+mhtJP9+6A1j1oYOjZinLieRMb7xk+nQms+OwHWY71RRzBJ02H+DX4rfyo+mQjyNMJvr+kp1cUZxHUqA+H+JSHu7+u/aYiw3DhswCmcFv1XekoqDz97sSxQkTdAcNg7f+PAT8rzReVI8A5a3da9J7GJtHT1sA+xO97qYqNLBL9mtCCpmFpt9Mc9g/2U31Ldqs8CxQKURZ/1xfsGu5ORfYfX+Vqwtb0xEXAlAEVaF2qYl1CdDjZQLUyeOwycAKZHGDoBkNde1SR3WHFrB8LtTrklPEXfSNFgSC1gYOyiB+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB5140.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(6506007)(1076003)(66946007)(66556008)(478600001)(2906002)(4326008)(6512007)(38100700002)(52116002)(8936002)(86362001)(7416002)(66476007)(6666004)(6486002)(316002)(186003)(44832011)(5660300002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EZWeS0WpBXNNz1Zg/DoGo7JLOLxgDnUKNLbSnife/txFmp3rCWkHBK0hbTvn?=
 =?us-ascii?Q?+MUDMFSRWrMCQCGP+7kAhR2zmVBr5/Yx7L7lSsbT7nYnUP9/skJLNZCiBbEr?=
 =?us-ascii?Q?LznH10jlyP9X8gdoiplXqUm/T5QOBamsC28zatlzosLbM6+9dCysa7XXI2k+?=
 =?us-ascii?Q?PlkERbYZPv/lC/stwNp/bQ51yVuekIZ9u5L632wum29ZHGdzYCY+mLkURxBh?=
 =?us-ascii?Q?8vXn9oMyp3gGzhJbHq8Bts4wTm+rxXRFhb0gbOqV76RsRhe8GkUfWFqnIVpz?=
 =?us-ascii?Q?p27hT8id1i6C+MiDqPDhCKmSJYZsopgfhOOuFHiW4V9Fkk8lS+pHq/llxvOh?=
 =?us-ascii?Q?HP4UuGYXs6KoRs07Lo+AjeDOQKCabBXmFdv3QahKZPU3Mctg0pnCuKRAMXFf?=
 =?us-ascii?Q?acw4vZzIF2UK3uAs2d/uZpyQdr4kaqTnBRgT6hS/g+G+y6NyNDRat0/2/gMu?=
 =?us-ascii?Q?K3KVrkFr51Xm+9jo1HtUM2+EpOfIF0Cb1A0ka9zusuA/vXvtXlrzplFev1Dl?=
 =?us-ascii?Q?XaPLNAqaoTVSUAk/JDEqe7B2qbzvBSXPRPX0bQF0bCVjQD3IhTSE/LwkC/tB?=
 =?us-ascii?Q?v5e2dI24VggZppKNLQsk3jaeeY15ERRl/r+BtfE8awXtmo8oMSsOe/2MVwgZ?=
 =?us-ascii?Q?zCgFjjbOlu+HExLuh9O5msw3L4dDPrpHYG+9e1jlxsYAVLI1/RAhgNZ0Sz7Q?=
 =?us-ascii?Q?rWacnxnx6uRnmq0rAlJ0X4O9KB8v/sx9wjaQ1lMGxVp8zo+b7xrLjN0SXPEO?=
 =?us-ascii?Q?aRRm3BfRukMuF4HH88uLeVU51rp4Ydlr0Vs1FJknWQpcz/+Csuwv0s0gFEzq?=
 =?us-ascii?Q?XO34PoUBCcPdfEZUaI77HpI0/n3qGXPVZgjLC1ySk8XGSo+JoCaVYEEwaX/v?=
 =?us-ascii?Q?qI5md/qk95AgOECSMPmpTt7xAC5UzDkd1i5IWpZu/g/xGIHneISHhBHTw1PY?=
 =?us-ascii?Q?LpgslKazhJd9qWacDWN8yfDfwqcnj0Ew6v5tVDSS1oMIG2WwQddaPZzjVsv8?=
 =?us-ascii?Q?HK3v6lP/PTGV3JL3E1giHUUGwfGulmwjMK+Dvh4Cq34Dt5Wmjho4HY0SS1Pd?=
 =?us-ascii?Q?57GoAS3MZQ5DVnfcnODmTKD9lm875Hf2ZTaSSqCHlVeB13xCkx+MugZ/QPdn?=
 =?us-ascii?Q?uH6ZNVwebUViRKqMaTYI0t8/jW/SWAzZnx+4vUqAEaGQ1zG3qldsyW22Xbqc?=
 =?us-ascii?Q?6mB47j0d76j+5PSnxB6qyLbvUUoXKG86nY7PRFO6h+2lW6dqK3PWJ2UJwUuQ?=
 =?us-ascii?Q?c1cUfjOBQVISSwwHCzHQf9ukSkI3HG2puHh8kNSwbx33kX33JmPNnaG+HnYk?=
 =?us-ascii?Q?OfQjUd4Qto5HXCifc6Zj14lKaNkWLxTg+jXdXuvajPMTLFebmQZJsvvOTDxJ?=
 =?us-ascii?Q?xM9WaooAAZL62+atpkCpzcuUwDSC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5ff288-8dca-49a0-30c4-08d9479b71be
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5140.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 14:18:40.5107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LAC3Fn+ehKiOcAD2F6fnGd6HTIPIbRgmXnG8FNwwZDW3yvJ09s15zSIacw3cBIQS1lHcsjFhVgbv6EDhR7DhpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4916
Cc: daniel.baluta@gmail.com, kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>
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

From: Daniel Baluta <daniel.baluta@nxp.com>

Document firmware-name, tplg-name and machine-drv-name properties.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index 7afc9f2be13a..8095aa178e7c 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -60,6 +60,22 @@ properties:
       used by DSP (see bindings/reserved-memory/reserved-memory.txt)
     maxItems: 1
 
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      If present, name of the file within the firmware search path containing
+      the DSP firmware loaded by SOF at DSP boot time.
+
+  tplg-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Should contain the audio topology file name loaded by SOF driver.
+
+  machine-drv-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Contains the ASoC machine driver name used by SOF to handle DSP audio scenario.
+
 required:
   - compatible
   - reg
@@ -69,6 +85,8 @@ required:
   - mboxes
   - mbox-names
   - memory-region
+  - tplg-name
+  - machine-drv-name
 
 additionalProperties: false
 
@@ -90,4 +108,6 @@ examples:
         mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
         mboxes = <&lsio_mu13 2 0>, <&lsio_mu13 2 1>, <&lsio_mu13 3 0>, <&lsio_mu13 3 1>;
         memory-region = <&dsp_reserved>;
+        tplg-name = "sof-imx8-wm8960.tplg";
+        machine-drv-name = "asoc-simple-card";
     };
-- 
2.27.0

