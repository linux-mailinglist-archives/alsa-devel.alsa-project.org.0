Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CE24346FB
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 10:32:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 307F1169B;
	Wed, 20 Oct 2021 10:32:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 307F1169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634718776;
	bh=r37ygLBZdAMn3t6pp3ksOLDUhw8ou2Wd/GyefeSUrt0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e0BkqBvi3eFz7uvQeTNq1j1pOjO7iaP0LgukMxv5cy6in2WpdSKn23yoZUdDHVg10
	 +HLR/7tqhLzm9bcmb8UTyatdB7zDIfVHUPASx4Wcctg2b1nolvhIIhbZOTFAtDwDUY
	 7X9BMF3wfVKNAn8VrKo8WwgREF10RxKK7O8UsK/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99F87F80253;
	Wed, 20 Oct 2021 10:31:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF9D4F80229; Wed, 20 Oct 2021 10:31:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2106.outbound.protection.outlook.com [40.107.244.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A90FF800ED
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 10:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A90FF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="OWrmM4WS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kmt+jGt+w8qj421hOratwipREwo3MQqDW0TpyGQeU3tFNV3S7oMMgGrHC+ny8hOK6+/soMucLxNorBII5EPhSpO8+AGPfrRegR6qzOdA4jcny1prz8kR+oFFEvjcfVJQJ0RjHxyt3DfrJaT1PNW9tmp2FD96ZHTLAQXF8PUA86lLpE/HMELfxNEIyXOdEWi3zDlsuwjZEDpodGobOfxT9TtmDxyhg5pZhfn76Iovd4WoVDdQqKKEa/zbydnGp9UybFJ69nmO9EfPZnYS07gnSvFwBrCx1BrD+76GFiL5sY5MIGPDjyhCIRLRO37X+rToB4w1q62cAsxX5kobD+Gwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9Bou5HF8PJcNrcYgfz9ANonmw6Iqu0si8sUnlS2HN8=;
 b=mPZ3X4/44pObUelyWtOin/FRqYuZGMpIkcgzGsYcO5Z6KkV+K9RoHulZN1CjpS/daOLw8j+wbbnqnGL2zjZeZ3PySxv2R3H2EJrGqy9e4HM00IsvA1en+lasNt+tekmL6N0hxIk4VwCeSj7WepBcItTMxrugdbmJ3P4T2jd/vqTbIP81N47PVPCwiciCAmUho0X5rKZQeoKdwEFiU3zAi3mDR+Nz/4v8gRmvG9AkR+U36brNHvNW7eRvrt/UWYw9F6VllnOb2th4TbGl7/DHs4vLZuxC4eoj7QP8yBCLaI5NKlnZEUYFcn6j8J3wiX9B6xwPMKvdoJRfMisImmGfTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9Bou5HF8PJcNrcYgfz9ANonmw6Iqu0si8sUnlS2HN8=;
 b=OWrmM4WSxD5PqAnqrConVD1PlMJt45yajfKvds5j7zrggVcqzuPx6jnfwkE2UD0gXn6ETlxwla5dSbiSbPLznBY0VrN8bjEvrxWR+LeRMhICTx6h+/bgvtFBm/4rkncWAB7Z5C7o1GTK6R43jvkD7DeErgHZXrS9yhg66JrKWSo=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15)
 by BYAPR11MB3447.namprd11.prod.outlook.com (2603:10b6:a03:1d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 08:31:22 +0000
Received: from BYAPR11MB3671.namprd11.prod.outlook.com
 ([fe80::49d4:a1dd:5b55:4c94]) by BYAPR11MB3671.namprd11.prod.outlook.com
 ([fe80::49d4:a1dd:5b55:4c94%6]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 08:31:22 +0000
From: George Song <george.song@maximintegrated.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org
Subject: [v5 1/2] ASoC: dt-bindings: max98520: add initial bindings
Date: Wed, 20 Oct 2021 17:30:54 +0900
Message-Id: <20211020083055.23625-1-george.song@maximintegrated.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0002.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:18::12) To BYAPR11MB3671.namprd11.prod.outlook.com
 (2603:10b6:a03:b3::15)
MIME-Version: 1.0
Received: from SEL-LT-028891.maxim-ic.internal (223.62.204.189) by
 SL2P216CA0002.KORP216.PROD.OUTLOOK.COM (2603:1096:100:18::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.15 via Frontend Transport; Wed, 20 Oct 2021 08:31:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e395590-6a81-47f5-6031-08d993a3ff26
X-MS-TrafficTypeDiagnostic: BYAPR11MB3447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR11MB344749FC53F51165F01BD4BCF4BE9@BYAPR11MB3447.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SUttz9FAN254Bpyb3uFYuW/axlAj0L++b91x80vpvnEjNrSLck+rlLlS+1YARluYTiBu/IJSwS+dAvqAXd7OZfEZTyqTpGz1B409MhTnE+Lz3PhEKgrkqX/+5d94RaF/XfN8KjLGv5Rr/KJAefUDBb695fM3gf6zrR5T8C2BsysLF2ks2021bPBQcyDdEN/AtWkPHQCkivPWIam1TRlwYDwlRHc+8H9HQcv2vTCSR9NbrTq1bFxEGDU1stq4hoscgdj0lsQ+vYDOc3bYAw46KibXG2Ob2qFqjkegqhFlfaTyOemPEs7cdYRx2/UBGlZ7eHh3vqtzoYi5WNxD5aefFZzuJwrGUSMOT1ulmdKudZ8mKiH0uliO5AD2Wq7TpD7WCGCsQZXs8C4I7K5HmeiF8uFIdLS0R1BPB0WpVzUdafKY6cdHZj3+uIo1wVoglG2Lk94PPsMMfRpWYBafQpUT/Slw+OJWo1SEBrKFCCm/IrjbL7Y4r6ja1JQpJ5tiiUyEd7MQtAZ5gShaB/qQVeKsY/ctIAKryiH9YOAziHZxsEyMEXQRVnnDYPXj+fikcrfaGJi2tIPdWFveglQ4KV8INZ5Vk3PeyWfsWVUG/BT1aj5x9zuXQOrbP3tMKflJkh1E4G3NY8Wm/0yffITIuxkRP5h9lLH5SEuIG9PWdAuST53xdDPqb6xKGn8rWF5npMqzt4LfcDfQVR+Vvur11woOqiczTZ2xAFi/sMoNhTOPVhvtyzeq3+0HtPRnggMbwGHAulgUqBcE+BXTl/c12hphMUc4EdpLWB+TDMuIxdUZusJe/IoSyBUFGMlkKdSm5xApcOVaMeumlrmEYsOMOlCMrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3671.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(44832011)(1076003)(86362001)(6666004)(36756003)(66476007)(186003)(8676002)(5660300002)(6486002)(2616005)(956004)(2906002)(316002)(66946007)(508600001)(26005)(6506007)(966005)(6512007)(52116002)(4326008)(66556008)(8936002)(38100700002)(38350700002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/Ch0YREnzVGlAxHHJfOWTnNCNXVEsUwUxRlCqC/wEqwVWALDxJNdWF4m3ZXk?=
 =?us-ascii?Q?SNtim7mWErocDutU4hpkGesGWMC0vJjTuhfMprdRRgXW+Nlm2KBhZ1pW1779?=
 =?us-ascii?Q?1uUn9l2vq6H50B4aPRZGrNVX2FyBYJcaXdaMFbgc7ZnDPZG6Or+GZsZ/XzOe?=
 =?us-ascii?Q?euKqkEFlKZo1UJ4OkJklLf9Wz7li7tb1L60X5r7MslIm1fmpNUTwBVfFAZvO?=
 =?us-ascii?Q?WgKK6nKhhWo94AkY6ZX352GZbf3Smbu6udN+eX/PhBWF4W7IVnuIQ4/1mOnY?=
 =?us-ascii?Q?CLvy5ouZR1BkAyGE+QkuOOeOdaMuo0ieJMQtWuKinV5HQHThJP4WpBtl1IBG?=
 =?us-ascii?Q?vDTIzGp2QM2RHr1URsrnYRXHvtbTr/6B2XTwJhRh0WJXrTcWapJxePA/czTJ?=
 =?us-ascii?Q?xApZTScgXIgfgijg8XyZ/SQTMZKsn3u0KTbp79ZxK38DlUHlONKwxJbtkzmf?=
 =?us-ascii?Q?aZYUfRtgc/OLagWVCo2iu39NZFVZJP2QD2q7N+TF3mZihtBh7FTj0zZKCl/i?=
 =?us-ascii?Q?Kr+X49+yaJlWy3I4+rQ4ZWEmmsoCV6BevP4iVLYC5FO9nxIW0hqmekCvQkjG?=
 =?us-ascii?Q?t6YmJfO3B9p+ESDAwChJhwAR3yaz67ThYi+w0fUjxubFs82IQlk4sgknB79P?=
 =?us-ascii?Q?JF8MPZTN7OCJ9WXEWweSROXX/rK7/OC66t/hVefihq9a3kM8QF5EV/Bl+uLg?=
 =?us-ascii?Q?dPF18GTdVxsHIxsSwMgcF0C9xV/S/Ig1OlPD+7dAB4RADmWkVRuZqThCU1iz?=
 =?us-ascii?Q?l90e8WI7N+r1VZdJ4CjFLRZP0U9BuPLSJ9WAk+rWYjPpB6Ytb+6R4jOZk/qg?=
 =?us-ascii?Q?2N8hgzB5B8OR/QImNWc0hQVAxL1r+MlgxVr5WNoVOyd3VzM/8+eVJl+Szc00?=
 =?us-ascii?Q?6W9pIasCWsP4YB2LLXhDveumMR4zcHEPw6tnYMmCXhBpQ/++iFXffjsAQBS9?=
 =?us-ascii?Q?mzxGEr8dv2Gccv9CxDJQLq7wbepLCtku/S80DAe3Z/LEL+C0b0btmVx42SES?=
 =?us-ascii?Q?ew5+KWeUg+mtYr2nhStsuQd6bor+6pGLoHXsFEQBkHFZl6mq8cuPGvN8DyeO?=
 =?us-ascii?Q?7mxlOGKkJnxmGK0IpCOPHhZePT9OZQBWcBjmjhZYjXQKI7YxpWyTX6piFXbT?=
 =?us-ascii?Q?jj5tfThPtwSLyVgIt61f+HS4+UZ+W53jcc3mF4WAjPxQFpnWjK5+4OF4IHNd?=
 =?us-ascii?Q?SCNXLLujodt4n4xK/0sZp7U1W3dIc/ZFjvNQLjJ/Cj/1cHq0J9j/sYdN5xGH?=
 =?us-ascii?Q?VUoC/B26LZAq7Vde2qA9D0LC+wci0EIKe8A7wesc6KU8MAnkzNWAY2vpCNdp?=
 =?us-ascii?Q?8g3aHIiL65GXk2WaH0e6BflW?=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e395590-6a81-47f5-6031-08d993a3ff26
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 08:31:22.1931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGD47CqDnvaNHQ1aI6cK6rWoZ0uxkOa4ycjoCu3piq7QW50A3ep+9yoX9UWcQsZoSfZW8KZ3D0U/c8bobl1BDgPP/kCu9B85DxyJ7/eK+EU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3447
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 steves.lee@maximintegrated.com, ryans.lee@maximintegrated.com,
 george.song@analog.com, linux-kernel@vger.kernel.org,
 George Song <george.song@maximintegrated.com>
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

add initial bindings for max98520 audio amplifier

Signed-off-by: George Song <george.song@maximintegrated.com>
---
 .../bindings/sound/maxim,max98520.yaml        | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98520.yaml

diff --git a/Documentation/devicetree/bindings/sound/maxim,max98520.yaml b/Documentation/devicetree/bindings/sound/maxim,max98520.yaml
new file mode 100644
index 000000000000..b6509cb2c8e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/maxim,max98520.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/maxim,max98520.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX98520 Speaker Amplifier Driver
+
+maintainers:
+  - George Song <george.song@maximintegrated.com>
+
+properties:
+  compatible:
+    const: maxim,max98520
+
+  reg:
+    maxItems: 1
+    description: I2C address of the device.
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
+      max98520: amplifier@38 {
+        compatible = "maxim,max98520";
+        reg = <0x38>;
+      };
+    };
+
-- 
2.25.1

