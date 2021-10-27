Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5127A43BE69
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 02:16:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C115716C1;
	Wed, 27 Oct 2021 02:15:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C115716C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635293777;
	bh=fz+et/FM95MVrZbmfun09txbBEd0vTIUn4sD6iTXUxk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=komEKkke5tJt3/dZk6JxdXE+XdDuP1qW2nIM1byP4Qq3djhcIB8QkJVmpejAb7sI3
	 E0LfgvJBwpm6TgNEo2nLLdbmJBMBDWEhxSavxCnt+QfSKUmSugTw+9jtiFKX1f7aUJ
	 MLnaxN2Hq/3whkEizFUueWxKHxZ39UZ61qsS/WKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58FBFF802E7;
	Wed, 27 Oct 2021 02:15:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38111F802E7; Wed, 27 Oct 2021 02:14:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2093.outbound.protection.outlook.com [40.107.94.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20EABF80105
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 02:14:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20EABF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="aJRZYuib"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FguoIm604WkBryPFfDdkTpIbL6yJ2Fs2U6h+i/OBwjR3Q5wps57MQ9+lEX1uCKChpyip2GPfUaAqOdWHRF1KQod4dvcAE671wkfbg9Pk40CHZTPSf7Tvz1Ywxz4saEb7Tmtz7LaDMLYlSHHvsb5jS3HLvyHpnBx+giG2Xk6NOPzjzGT9IZdoE/sYl7yw0l+A8js77IOP7XdK/eE10x92K7AEef1zWF7wHNJDNwKIri0UehiKxkB+WpeRRTx2kKSWRr09Jcvleb3uQIT3+Gv+8gB+EOudUH5S6ZE5CVXvGlGx3wy5qI7+vgPZsbxgP9wMw0cJuWcASDfnSfsNMJ4SeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=he95tu/GCl1zPM+El5K0fCOl2Pz8Wu6EEHbySF+QOqU=;
 b=YNKEcuwf449+mBOgi6E9djBn/ojNJ5N/jT6zFS57xlPkai/GpKp9Sig+pjARokX9l6DuTf86ZoYSAO+bSpdBRXf8x/t0jluxBAnBTV6qM2VJvOHAMhdKYTEYyobbXqnlKok3coFfa6AdPGttXc19GsjlL4n9gUB9ahNCFVH04mvCSbOTOUKEyutZ2ueKjwRekhcuiUynehchdc9fszUXGJc5IJIXLKIpZC88v29Sp5M6sYbHiOHlDETMohRSXV0hz+ghxtx1DAiJOC6j0g1tMiaspFGDUENd9elKeZ+RghZKchvM7w6aI8ZVk+UN7IZiOPsH1N0+qhwt4AlBTUCwnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=he95tu/GCl1zPM+El5K0fCOl2Pz8Wu6EEHbySF+QOqU=;
 b=aJRZYuibXYuWM3nuBaNPaGPRfJF1TVOdnIp1vBhejVNvsTjLyvE7Cf7YqutEFvDom8bPG0EGWBEtwhuOEYb3HdTooyxZKPy9xUI1/208cpDJ3US4Smfn2gVvRQ7uXSj5sb+zhLpSkVbCelukIVGSkLT8MHyHUHc1u3dntsDQhNU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15)
 by SJ0PR11MB5868.namprd11.prod.outlook.com (2603:10b6:a03:42b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 00:14:47 +0000
Received: from BYAPR11MB3671.namprd11.prod.outlook.com
 ([fe80::49d4:a1dd:5b55:4c94]) by BYAPR11MB3671.namprd11.prod.outlook.com
 ([fe80::49d4:a1dd:5b55:4c94%6]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 00:14:47 +0000
From: George Song <george.song@maximintegrated.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org
Subject: [RESEND,v6 1/2] ASoC: dt-bindings: max98520: add initial bindings
Date: Wed, 27 Oct 2021 09:14:30 +0900
Message-Id: <20211027001431.363-1-george.song@maximintegrated.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:100:2d::28) To BYAPR11MB3671.namprd11.prod.outlook.com
 (2603:10b6:a03:b3::15)
MIME-Version: 1.0
Received: from SEL-LT-028891.maxim-ic.internal (39.117.232.232) by
 SL2PR04CA0016.apcprd04.prod.outlook.com (2603:1096:100:2d::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 27 Oct 2021 00:14:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a1d7c5b-1f01-4b50-be4e-08d998dec8e0
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5868:
X-Microsoft-Antispam-PRVS: <SJ0PR11MB586814773372102AEE2E7E13F4859@SJ0PR11MB5868.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jigHstzifQXjsL/g9o96OnusSnvR8nu0U4ZJtRKDBZRC+aNbdFhUeLk1XGjw2aKk4fOZcoOxsVhh0HFdKgs5SjrCrm/ozU2dij9I2XLyLkFYN633OOqCqXBUj8lTJ18wH+9f9zh8jOrEgXZ6OIYTVMT0Q+L+ZcLM85tUEkwBqFMEruBFlmvR+D4b6eVkgwbJ3GMnItxesxnM2udIlqDdrj2wyhFswV2L8X7H2MqLhh4ePgcohl4fQouL4wgnxmm652ifV2rSlXrVnJvdXmmTeZAKIa95dGHYfkSqUsCDCUY0xmltILbyeRsNHERlvttMYghQ0/YZJGVLAIIyFeQbkytAyYIH2PivYJILXX+U7MOATTWhk4FJiJ0jxlPwwp3JW0D57i3B2POiOZ+KAJ9FORKhz46mayWuL5w0tFD8cdklmNrETBrbC7gk0WdAyBfnVrR9gvCU7erFtevhqzORMPZqCp71Ch93J0vtxnY7L+lw81HPw6/meARN+xT9JqPJobv1YodLlzWpy/7ovaSQw/mbTnrUFG9KLt4nhVX2Hti/GPzZKqO5JtlYNoEzitNzSpKg3gMKWytuKhGwbetCzZhmwNYFci5zKpR5DVSESrGNrJjQ3/ICJ6DC/kuoTUEDznumyG201BhoDsVDzL4OQoDTTHaGgusP904Z6eXpw20qhHeihjoTyBvZhzME3/7lW/w839Y0kS8WsNPOWI3kdwSbMCQy02cWyZTA645HX9KtWO2kRCaZuBAMhOd0KmhTOlfT2gknSctILheTxZkgTxQzyJw6y7/PxMvqOKxalyslNSo/wq5H7K0ACioXg7f8vT1oL9kiycCA7cZnop4QVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3671.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(6512007)(66556008)(2906002)(36756003)(8676002)(8936002)(38100700002)(5660300002)(1076003)(38350700002)(2616005)(66946007)(186003)(956004)(6666004)(52116002)(4326008)(44832011)(316002)(6486002)(966005)(86362001)(26005)(6506007)(508600001)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Y7Djq7M27ZL601laAgEDhudgL5DY3wZbrcfr6vZAAvR2zdrq4i83wxdpGuT?=
 =?us-ascii?Q?du9vnvWzQBsfSLIoHFXbyJfx3fuHQsx1jdQDVm67OLvJ++f3CQkPC/qc9AEf?=
 =?us-ascii?Q?llcjOJh3maMTjcaJFe410Qujaj3S1Aw+LHnZKzPsK/JK9kGqPOCo14WBLzZl?=
 =?us-ascii?Q?EeHxU+5xba7XuReYaa+wZ1O+cHiyp+ithv8oD06WTRl+wRaaXSHcxjlClFrQ?=
 =?us-ascii?Q?HoE6qKEnhIvPNwoB4eu0+kqPOAE9MSCJpKXU2YoWKYXtEeKU674MW9AgatN6?=
 =?us-ascii?Q?YSa6ZthYPhORLSHX0YBqkVD5tBvMd0MvKP/iBldWZmHs+/uPBmNqgNYk4ph0?=
 =?us-ascii?Q?GHkwCHPYmIOAMNykRG7MdWWYVl0mWxBGpKXbRM68Gf+15lTWNFZLHa02H8kw?=
 =?us-ascii?Q?WWT3HKd193O9u0hfoBKT8AjX2/9h5CIcYHFKLAfp2S6Ed9DbuozANWoD8Ewg?=
 =?us-ascii?Q?aPRkh+EhcoLdpBSiwo6xupqACq41aYbG3j2O4MnsUJ3VhUnEmWxXNZy2niBj?=
 =?us-ascii?Q?JALimlsHp/pAFbYbF7Mn4aX+cVqotGyqwCvpDiQoVwdDxQQNgT5kDngplqiS?=
 =?us-ascii?Q?Twgi7fsn0Fs9C0snhe+AXwghGIEdFwO0Iq2GYHIKmRAwy6E7xw6l6kST6IaI?=
 =?us-ascii?Q?CvT4kZ/KJPKIRwo8Sz/5NB9HaoLa6J2jzm/iNUhrc6u6w1nDzgyJp1HZgQj+?=
 =?us-ascii?Q?bQ4MOXkxvgx2IMw7o4H1/PgwjYxqGxYNBZhkU08gAsLcBIFcLfv3GUiLObYv?=
 =?us-ascii?Q?oMcvaXyAx0KNPUvnPMQCfOZWoxGtKrOea5Ut2ijAHbfXwTGBXDmIPSMC4RfU?=
 =?us-ascii?Q?hdxg6kKsZJM6ZhhjuGQ4M1haS/ERrDk/FD1S9yqespCJYc2/FZOXRpblJ1Qa?=
 =?us-ascii?Q?PQ+Bi86E179vvg4YIf2cn5P5l8vIL13mNvWaIJ2wtxKwB+Mkn1em+59nQgl5?=
 =?us-ascii?Q?gIWl4ulezl7yktcOsjkSw4qa/nIDnnXHcxoCALbreGldrvXC5xLxvDyZUtMv?=
 =?us-ascii?Q?Dvq4Y9cJIy38cQBbmn+TggYUzUXpf3qkcXZeJhg2UaoCbMOF/cexy0cOdHl9?=
 =?us-ascii?Q?ckvS1SZBdY8pXjuLTqF6Igw/a5lVBLfCBcnFrwfq1t03BlGORp9c6mLTLBea?=
 =?us-ascii?Q?hEocPU4v6c0BndXQyTFj1+DJQhWnRjTazoNQf63JLTaIsgNzUype9ODhnlgj?=
 =?us-ascii?Q?QRTRN4DHCzOH4tTjLoXDMi0OaxlpVL5bi1m3MZrZyl/NJ2jKgqCPtoX98h1/?=
 =?us-ascii?Q?yWG3Cam+t799mCTPZT/4ZEwdSeuC/pUsBcfuyNdqMD9e64BkuO8Ucs1LsKge?=
 =?us-ascii?Q?HLyscvVrlWXkc0p7OiohK/8HmfjzdMs5IELHAIiGHbXwzE/OoFgUTEr+TKyZ?=
 =?us-ascii?Q?6e39Qm7o8niZQV2E6Q1R9eUlw6HJaKl/wlY+UrrjVxToJZiLDyFV6Hi/aobC?=
 =?us-ascii?Q?A3rM5wDssf0W4sLKijVfurZ6c/ubfI0mvFetkDAi4MB/EVbEmpjN3rKo4Yd/?=
 =?us-ascii?Q?yz+0Ex8+H8YxtA0lE5gCpiKDgnNC7BzYoj9fML95MgMF7y68/8lP1gNNR/0x?=
 =?us-ascii?Q?l8xU1aAFv/WL/GHMPC2oBvMJjD26rgM3Qd9xZa404PRLh+zJp/LuUHJQW87O?=
 =?us-ascii?Q?DaRS6ykgFh4mX+vNmZla80+M7r4I8jFTzSYl+c9/SlKfA9bRzGV24AnAjX/n?=
 =?us-ascii?Q?7ZaObQ=3D=3D?=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1d7c5b-1f01-4b50-be4e-08d998dec8e0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 00:14:47.4766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: InuaWpDsf7NE/LAbDgJhRYciHgNch/3IyY4otklQdef/ZhuER0mtgvnEfuES5tXE5/nnWAfUWr+tdA6pCqOKIvEB1QSQPLjz9+ZadfdHzn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5868
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 steves.lee@maximintegrated.com, ryans.lee@maximintegrated.com,
 Rob Herring <robh@kernel.org>, george.song@analog.com,
 linux-kernel@vger.kernel.org, George Song <george.song@maximintegrated.com>
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
Reviewed-by: Rob Herring <robh@kernel.org>
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

