Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCF0495528
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 21:01:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D45CF2E67;
	Thu, 20 Jan 2022 21:00:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D45CF2E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642708874;
	bh=T262GO2fo+VOcTwX7twErsaQPenhl/UJ+YDwyFGNVcs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OokwXvyz9lGB1URlY+N9oBcgzcCODaS10/l8Jg4aG3qpthRRd0KlTRxpkzBUqOSMw
	 KBhUym1maLRAFQpQB9iql89ZYOGcZgDc32KkjPAV3LhPyVxDT8n1L/Vs4ZYje6d7AI
	 s/gpQYw2Z4Ru8kDllCWkjn7nvTKdUYZ9jQv7M2X0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5E2DF8051C;
	Thu, 20 Jan 2022 20:59:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ADF2F8051A; Thu, 20 Jan 2022 20:59:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com
 [67.231.150.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3455F804AA
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 20:59:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3455F804AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="SYkVYK1Y"
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20KBlB4W009477;
 Thu, 20 Jan 2022 14:59:03 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2057.outbound.protection.outlook.com [104.47.60.57])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dpmt68sbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jan 2022 14:59:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFFID0xniu+6EAjZGa1vp12g6eGpJvV5tZkAEeYf/ApXrIKC0iAwHuCeUUx0HN/qFVvh/ec7G+JUbwgv+4hqdNugWwIyHuZazdPMkEWBzI7ZTeupWNw1vI3iKBjbMfrvQBEI6K286ZIqPOSnv0L8yMMZcGE0ugvv3pje9F/0YM+UK9F57/V97SgcRkCaKx8FtKgdK+q+JSpE3Ihcy7o8aKmWyx2wkQTotYAn6loNh3kA155jtvehfSgTMgh0T8GEG/L53di1ltI/dujE+0fpJ3Fj6596hv/rW+rO3LCeftycykQzY1DrgoC6IrItbZB4PFL9MaX2UqtsfqmWDfaVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSl/POU3KzFauayXA4pKCo4khldV4nGRDbvejzPM0Pc=;
 b=c0WbrEtXN/cJXyAIJZeo7n0tIR/RIvyFXifd5rrJfflmTaZmpzuOvvARkda2HRuhF8CvsdbS35QDZsIhX4nuKY7GBXrN6A86F6c4r1jZgV0YkXcgjaKwY1GDOJpZHOn0rL09YDgNuLGf0KuWNT5PUVMhqx3qwwwu0NvuxZWnziso8LSiZ5tma/13S/NjcjOig8vF9j7rkW8ID4L8B2tLzVrDMkL7Ejew8LVBZEnTS/3z299ki54SoEE7MAQqHUc82bKidnoD9W1WuTlPALjV/4T/4CKcON9XBF2kKdKgHiKn+Jfp05jbCjVGYXQogIx/ZYPAxk4t+nN7gKSj2C789w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSl/POU3KzFauayXA4pKCo4khldV4nGRDbvejzPM0Pc=;
 b=SYkVYK1Y+6QKE1O5VFyTqpgtWnSPpbYsURQ5LACQ/qqzCczVCpUoEpc1/iuOI1y7jSTQa4neFw5EthhR+gRpHz0+yNWD91eEq6ufUo/3N3PP+gka502VSvVmzv1jTjq0g8RUD0WUoVJjho8VCL8EbGcna5+grBDw452seDt5ZtQ=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YQXPR01MB5019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:27::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 20 Jan
 2022 19:59:00 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 19:59:00 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 5/6] ASoC: dt-bindings: simple-card: document new
 system-clock-fixed flag
Date: Thu, 20 Jan 2022 13:58:31 -0600
Message-Id: <20220120195832.1742271-6-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220120195832.1742271-1-robert.hancock@calian.com>
References: <20220120195832.1742271-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:610:76::29) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 458bb950-4588-42f1-0f30-08d9dc4f4c32
X-MS-TrafficTypeDiagnostic: YQXPR01MB5019:EE_
X-Microsoft-Antispam-PRVS: <YQXPR01MB5019811D04D8216BE74041CDEC5A9@YQXPR01MB5019.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4cmdW7nazTAIzt65SV9c2qnnQ54/V5ZJwlBk/QNKi4iqmOc3+EXYBQCzuNfnhJZZcedLKk2SZ58ZRPkzbWQrv1l2aw++hKqfHj6EIVco33mXIak/QUXnw0rBa+mGrWiWCWSfqO+8tXBxpkx5h5f48Ayt0W2wvaW0j+j7mgYq5B9qAWPFY4/i4dxcnRu0Dkvml5kOvmNWTfptbGoROUdUO0zGWVj7MbI8kmSdGp4oPGB/dPe8seyk3JzzmnjZX16MllNihZ9HBGO4NGDvJRWTQCzK0zCIylZSzJbiNBdnENMDP6bfvopZnzX099TMPWU+3yA3bqJMHwShGFPBXvyHL+jXjVAhW23AE/VD/mRn6FuqmSStKTruOgpQp7dgN1d0/MqNSGXEQjd4CeB0BhV42mHXJiStfWKBRY+f8qGt+ijawGUHNOGcdX6+IcRiS8JzwLahgGLSHNPmpPPuCA6Fc+5HBLHZBhHsBoJVu6kUO6XEfrTuKXNJlDebbzAcOLc3lBTk5YREO03NEPIpjeheTJ7uO3XKDeTtOp+b18e2UMWPzbz3q2Jd6bqbEXgrTypnJ19fR9vdRBFAUIGcgE01//te4PMdWPorqfTSewyVyCrr+uW8MjlmscLs+VKbRFc3OJFQJMZAFMxQORs2oanRzjyL+UB6aUPyrOWdZGT499ZdU//cOOdbPnko0/wSepu2rmDOF4OmIZeNWD5ZytxI5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(38350700002)(6916009)(186003)(38100700002)(1076003)(36756003)(6506007)(8936002)(86362001)(4326008)(2906002)(6666004)(107886003)(52116002)(83380400001)(7416002)(508600001)(316002)(2616005)(5660300002)(44832011)(66556008)(6486002)(66476007)(66946007)(8676002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q9i78p6XXxnDm94dE6Vm+ZlKpDI8iIhU4Q4T1RKtKFeutbURTRlBAkHUEVMn?=
 =?us-ascii?Q?8kAZM9q1lAIJXX5BscO7VImIzM9deUsPezsVmEVfHMeQWCOKvacLppfJVMum?=
 =?us-ascii?Q?66pDKX3/nyz8Xq/pnFENNgPCh6FaKA8IVwWxeQ3jc9PnDTL5p9sAFfvrtZnS?=
 =?us-ascii?Q?zgcMzbqawT7zPHnGG0qsO1rMwU51m6w4NENdVyYXzfMqcZDxluih7k7QBUf2?=
 =?us-ascii?Q?e169VuI296zJNk/eCEqZLuiL58TsFWsbdn4TvPev1Qz8eyPwNnR1/MQzoJbk?=
 =?us-ascii?Q?PbZ9IT8l6PpxaEUXmrYu6qFQ4u1R37L/AMN8L7mPgDNc2+HG72Bhu20TXYkP?=
 =?us-ascii?Q?6kzPbkGa5EzByu0Y7xsBP/m/YRevAZbStXvBlN+vKUrQZoC9QE7u438jlhbx?=
 =?us-ascii?Q?lY5ObtEft55oZfh+WQQEVUn46gYjib+zFTG8ntdT1wLY/rOqgBMI5c21EUtu?=
 =?us-ascii?Q?2StOcXemueg3yaG7w62TAF6IIwt4e+JXxzGE3yxu+ZrwtCpc5HQCj50D6EuH?=
 =?us-ascii?Q?36pIe4xRAW59KMrUitnEZp3zxCnQpAc2dhIa7tlYIexYNBpmXtYIBGCG8EmW?=
 =?us-ascii?Q?+IjyPcZ2p2OPLCSVFoSYO/yGBNdbsbDzs842w3iAJh9GEkHNbZCMjcbN9cqU?=
 =?us-ascii?Q?V+C3XGF+fJcZeRTRxZlerdyIwEcTZDbE7CQGKDoDJm/0lPepxjTXvUFw+Xe0?=
 =?us-ascii?Q?9vVsEualcWMB7BHUWZyH9UHyZ4eQOYTUjaz9WFzTSAJua+oLbOPYvIIexiEd?=
 =?us-ascii?Q?DFfvT4D+iS99siI+vUe9Q0W2vuRJQrxTszGXCfhVftN/82FRclmqzWIUJ74x?=
 =?us-ascii?Q?YZD2gnbVV7TV5w5ccR6TDcdSwX6IlWMzFUN3eHcT4YvYhw05cVBWLNtZlXnp?=
 =?us-ascii?Q?5oy6+BjEOHtwVk2sbPt6g/rqHTeNt6cRKW52m/0tSIpq2osZqqoLLrZljeSq?=
 =?us-ascii?Q?oN1TOXE7u2pZl1W/mMT4B7FKlMZoO4CcPujKk4zVkwemhXoZtdZgbgBTmUy5?=
 =?us-ascii?Q?CbJNxBlcKJO/8tKnYsrfwoLhlj0J1y/xiCzsuNObp3CJD+tRV9KbkIT1Q5QY?=
 =?us-ascii?Q?UZNg1qtmokK0jSeSGXXTJdjmI4Tbyjs3paLBDM0E8K9Pvd3/kMJK/vyYK54b?=
 =?us-ascii?Q?mqwnpV8EN3KK8GPB16pRNYDwX6S3AkWWd9B7x8ujA9SZwbNerI9hAwqwmnkW?=
 =?us-ascii?Q?AG+/NwQ3r3CQDnv7asJPnbJ9CCG1irP+giHAHb9dPNnByLam2OfoPMuxPgjZ?=
 =?us-ascii?Q?u5q4H+JKpnVm1HLnlq7gu18RiYZONgRvmtqcLagWkp7te6gCALkVA7mHpB7m?=
 =?us-ascii?Q?UJN9bzTeWG/j5USXpaEN9L82EXqRKrnvBrjtWb6DcCzilkhIaXzRrwhR82s0?=
 =?us-ascii?Q?N5woF1/blAWibmD+6W+kPy+zSFWa3HItiuMqsdi8E6bWmXNQxKZLQUycaoU3?=
 =?us-ascii?Q?6ZdGo9cedJbuaC/CmNquGczhSpqb8BRnHP/5HRoZgNaVyHADFITreN3EhAzt?=
 =?us-ascii?Q?9NU4IpGsw9i87gf9YMwCw+Vv4bQgKWoYggKyL+72K0zpS4aHHuWR99GAflgd?=
 =?us-ascii?Q?yMFOf+dt8peUYXUW6kpfQqwZ2mBzrEW9h1R5KcxS30CwtiDIkGW2iBpM9u5R?=
 =?us-ascii?Q?zOsktq1BqiFXyM2YiWLAGuuXz6cQsNohfgTTGVamtovziuHnNvhlRgRq5iDK?=
 =?us-ascii?Q?G/9GEJX5AxfzbP7V127PWyeXk0U=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 458bb950-4588-42f1-0f30-08d9dc4f4c32
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 19:58:58.9918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvHTEHhn6kMkmBm/4qDVmmXppnIVvgz+NVlJbHmSGBs4GOJ8B9bNVVQpV+fzou9Yi1FcdP5YsIx89ThqDokAA+qvek3Zu97ITgMjJBXOSPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR01MB5019
X-Proofpoint-GUID: 0NKANkMP3z_8fDW69PV31J1PA_GNfocm
X-Proofpoint-ORIG-GUID: 0NKANkMP3z_8fDW69PV31J1PA_GNfocm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_08,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=543 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201200100
Cc: devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, tiwai@suse.com, robh+dt@kernel.org,
 michal.simek@xilinx.com, Robert Hancock <robert.hancock@calian.com>,
 broonie@kernel.org, maruthi.srinivas.bayyavarapu@xilinx.com
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

Document the new system-clock-fixed flag, which can be used to specify
that the driver cannot or should not allow the clock frequency of the
mapped clock to be modified.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 .../devicetree/bindings/sound/simple-card.yaml        | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 45fd9fd9eb54..00597dc4f396 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -48,6 +48,15 @@ definitions:
       It is useful for some aCPUs with fixed clocks.
     $ref: /schemas/types.yaml#/definitions/flag
 
+  system-clock-fixed:
+    description: |
+      Specifies that the clock frequency should not be modified.
+      Implied when system-clock-frequency is specified, but can be used when
+      a clock is mapped to the device whose frequency cannot or should not be
+      changed. When mclk-fs is also specified, this restricts the device to a
+      single fixed sampling rate.
+    $ref: /schemas/types.yaml#/definitions/flag
+
   mclk-fs:
     description: |
       Multiplication factor between stream rate and codec mclk.
@@ -134,6 +143,8 @@ definitions:
         $ref: "#/definitions/system-clock-frequency"
       system-clock-direction-out:
         $ref: "#/definitions/system-clock-direction-out"
+      system-clock-fixed:
+        $ref: "#/definitions/system-clock-fixed"
     required:
       - sound-dai
 
-- 
2.31.1

