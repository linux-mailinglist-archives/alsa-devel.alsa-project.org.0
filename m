Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCB7348791
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 04:38:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 830491660;
	Thu, 25 Mar 2021 04:37:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 830491660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616643519;
	bh=QmLq1Apj2fnps+TZlQvLdeKxlOjWy1hLtvRNTE9ARio=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tz2B2+s0I/GgqLTTgRuE/+vEVrXg5JbAgzHMvI8LFcyQYUrZwNejyhuCuZrqoNps2
	 ZXwlTFdkQ+XBc5jDSxMjlSwuMZT+dL0vLkTBIQgjqUX/eu0avfTWAy4k32PRyVSWZt
	 hPfu2aDfRNkMuWH9Y5g0/Zv7StpC1KPqp7ZgCNjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96FC7F80268;
	Thu, 25 Mar 2021 04:37:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22A25F8026D; Thu, 25 Mar 2021 04:37:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::70f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67894F80103
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 04:36:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67894F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="YeT9qLgz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxvqn/Mv0vpDgvPY8RFu4LUp/AiBJZX23HgeXn+OhcvY71OBfPDg08b2aHomwFmv5LCxAklU2bDjc8htCJ5y48cQ8tJhwKMS8Vi9YuvtEE2OPK6eHuXJvKaV3MdK1KY/rRNzmuZP+sWjWWTOcS95jHLSaTeqnOoBZNgjE80updy8oAi4T4t/lISvr+2mqvqpmkjFCQSMbTwGAHsscLH2I+sXs3JAlxO52ZY480X73u5L94kQ+GLnW8S4gtko5Gq8Joz+g0u6H0K4FNl2suFHjXfOxlen5lYi/XihDjDZ343y2q4OLB3CbMDd7Hyq4QHXlWwZbLw6D8nMOMrSiMzImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1N1bLfntiyv0Dz7c/VGfeIsYpZDEd5Lw66+H1uF/v0=;
 b=VQoMzmQEjyW1ZBycoOmaqNbUpa2OUiAISK6GQlQVC9GLCx5joOk9D0co8cEvW4KGwoK0DRy9+fgF9gnU4PgqFoGFRN+BYmw8G7hhyz5TXYclVsLwy0w45GADaUM0lrdxEvQBirtfaabGo1B/7lHCs2aAdBzxvGUvjE5+sg2XKbjFec6jIfvvWolu5Ha6Z3e5zJznIIx3RNronWTf4ROAlbr8R6+1GXVxxMEENa4jBeQDfUwSHXMfWu23mPXPejeA0Sw6uI5gqUXBa/+ygHwgQId+8CRZf+gfBy6UJavms8tmPs1AS/bJVsGf2bebnUItTzMT8HDbO9fS41oCbR7Fig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1N1bLfntiyv0Dz7c/VGfeIsYpZDEd5Lw66+H1uF/v0=;
 b=YeT9qLgzWH9iWfADpD4Td95JwXzdENTvGgl9rWzGvHqgBEoYOwUnwuSL6FvmRGGfjqjlJxaGf3Hys157boze8VdzLLDy17aOz3t3ExV4EQRC4tWhpOQoFBKglf/AmI1rhqUFDTqgO7o7pvNOePHiWFrQntU/1SNN9D993q/iPkg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from BYAPR11MB3382.namprd11.prod.outlook.com (2603:10b6:a03:7f::15)
 by SJ0PR11MB4798.namprd11.prod.outlook.com (2603:10b6:a03:2d5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 03:36:35 +0000
Received: from BYAPR11MB3382.namprd11.prod.outlook.com
 ([fe80::cce5:1aa1:302f:a956]) by BYAPR11MB3382.namprd11.prod.outlook.com
 ([fe80::cce5:1aa1:302f:a956%5]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 03:36:35 +0000
From: Ryan Lee <ryans.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, rander.wang@linux.intel.com,
 ryans.lee@maximintegrated.com, guennadi.liakhovetski@linux.intel.com,
 vkoul@kernel.org, yong.zhi@intel.com, judyhsiao@google.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ASoC:codec:max98373: Changed amp shutdown register as
 volatile
Date: Wed, 24 Mar 2021 20:35:53 -0700
Message-Id: <20210325033555.29377-1-ryans.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [73.189.52.211]
X-ClientProxiedBy: BY5PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::11) To BYAPR11MB3382.namprd11.prod.outlook.com
 (2603:10b6:a03:7f::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (73.189.52.211) by
 BY5PR04CA0001.namprd04.prod.outlook.com (2603:10b6:a03:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend
 Transport; Thu, 25 Mar 2021 03:36:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e763d465-6eb6-4bfb-7e54-08d8ef3f304c
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4798:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR11MB4798086D74B7E34D4EB2E750E7629@SJ0PR11MB4798.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qdsDGkXNF1fMRFea5hSbyJ9dAAOv6mVoVnyCS2I+OOSlmmFPXWi8YJo7/vNuOgMtX9UFdmBomoqLpDT4NBU60ohiygXVUNNEUb85Kdj3D2fQaH+QGPfM96kaSI6bB1tCute7IhIgStz1MAXqDbgOdOp0QuqGyFygxcXlY/IwNxrGi1apkQs9wZi+iibmRO2ZTdzL4IH39DDR9dYmifQpSERzYGiV8z7H4WoSDsmE6gjjItMyUoi4ZrsFEke26Hn6jgVZp+8O9QlIvm1ubcyJSxvTd3WRCTKL83kMSsQOZ0KYm2PGYIp9/dX6g+WMYQ6wjqwTCBTnPsGnobO9yMEkg+dCzPdMx4kwf2uzEabVO0dqIrcsr/FRgcn2nsnLlY9da7MxWmMlOpeaCLs132IWEmOzK7o0BYPVi9J0zMiKE1Ijpq4U9xRJ+OYtDTs6mceOQhrbiZTK9+pZ9t5LSWqqcZ2rEROHynOQCEScq4NJZ51kuNSX6wgbnUxj3KzsudT8HUJdNuSU8U+AKdt5GykgoP80+62KkU1yENKkPL6bOJ0g/quHtNR5V/zkZ4YMALfRvGdQnFPXFgzwE4TNW0Rs5254uYBoKplGYWE1RpD3Xwu/LRgmXb8qIpZ7jylvR47ERD86teB9t0Sudym6RcJFp/8SPRZEqqCSIfKSOJfpgq/VYbp8O5NKvsaM3dnAkEmWzaEbZikqFMJ0vfu/dfO9zA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3382.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(921005)(478600001)(52116002)(6486002)(4326008)(6666004)(7416002)(186003)(69590400012)(26005)(2906002)(6506007)(16526019)(6512007)(316002)(8676002)(2616005)(66476007)(1076003)(36756003)(66556008)(5660300002)(66946007)(86362001)(38100700001)(956004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?petIvoBotv8fUya4cWFqEVAn/xLAAC3GESGZKN8s7ooOGohJR2jUhiM+dXZV?=
 =?us-ascii?Q?NeF+58AcPcUGNXBnEfnInD/DVqJC+7a4M3Lya0shgIfL/lfIj+euiVAqHxBp?=
 =?us-ascii?Q?wMlhOcAdaFGOR+N87PBfin5uZy6Uk1J306SyZ4E7qgvRdTuG+SbMY/BXVS0Y?=
 =?us-ascii?Q?jk1Iu9DeSVU988AZMoNbxyiZOtPdr5JB6SKoVax86taOExsPRuOmDCYahKaR?=
 =?us-ascii?Q?O1Zo3hPipqLnk3OyQXkS8G9SI5WH9Eya4IDaWu0vZeiz3XzBu7hVTngaGtHf?=
 =?us-ascii?Q?v+bLr34J4CYtFLLt6ESweq8YkTFZkrv2FYO0ksRucW9rTqEcrKslwHygPydA?=
 =?us-ascii?Q?f6A4PbIJTRhyvw3YZcFpSLitNn/piwyGLZ5/Va65SjzfdCpmyRfecYg+shxi?=
 =?us-ascii?Q?v7iCJ4oLj4Ffg59xsCEiAv3lwl12SSboiL4vAir0EtBPp0jclfxOsxwFkkqS?=
 =?us-ascii?Q?wJbMEdVuWuaCn1F/dFyN6a2whAXODLRzFMwFrX0eWRBwRIyQcQbGyTl+I7bV?=
 =?us-ascii?Q?5cOP6TYaE5RExZHAgbXCj9gy4GXS5uK8fNWBBTfFRvX+/4CcuUhHjxGS5p5v?=
 =?us-ascii?Q?ogMR88/Auep9zJeZ7jkkzvJswALRAp/db2clOiIVq5ddjYU7/FAdXHXzYpNI?=
 =?us-ascii?Q?EXjhVHqa87b9kte+Iqq+E8QLRXTUTOoQPgkFQU/di0mBTyo4xMnYXsSDS97G?=
 =?us-ascii?Q?WCYcsMk1PgQz7JYkppbnKWUu3R54Lp2IshjajegYrDZnmS9kvJfwga1gvSL4?=
 =?us-ascii?Q?93zwvkg3C1Dnv2jv/fWpkbME71wSY1sZZnCuMSM9RXRj25a3AMdlbci3nqFi?=
 =?us-ascii?Q?c8G1kKS8bbT8iO3Ws5NWze/7hLGpXS2siTBbQrmSuIQNVlo94StnTDYoFCJM?=
 =?us-ascii?Q?y3I2t7HV7KVHoDRxJYnYVqST7SXte83yVsJpyVWNm4cCZhbzyeGviNmJFoMi?=
 =?us-ascii?Q?q/0y46OifHXvBMeb+s1bI35mCz3btDcy++a58JMfscoeQGBarSCexAwZ/+sC?=
 =?us-ascii?Q?PrabDACRAwn/1OQvrQpiiDuqn6OST6KiaZyDaxascQazLqlZeQ+lCPfrwSoD?=
 =?us-ascii?Q?KCOyFvA57oJGtS3DmrsKBhZtC0E5e2Ojc5yY3Yfp6SE/MSmHQ8hf4r/zZc2J?=
 =?us-ascii?Q?jGm0+wGdigwpmzxomUrIu7GS0BldB9oI4smnlMWjr1pOGrrC8lDSBKyxgf/k?=
 =?us-ascii?Q?xXzbRQfUApGe5gMVOhOkFiWhhaPLbZDvpa6qoPVphKE2+i9nwHUgp/T275nf?=
 =?us-ascii?Q?EBI2kfNo9+KE3I26hUiAVgBpKS9/j0npPRjSjE5EFt3KExmwgjtcf+Z0mnVz?=
 =?us-ascii?Q?5jiiIi7GOfR7xitB/0Qd4YC4?=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e763d465-6eb6-4bfb-7e54-08d8ef3f304c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3382.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 03:36:34.9180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIS5gcr1AdFc7EJDwKsu+frR8HxwbAkFq5ihl6SSN2jjWuGPPhLcMl5IDLHiw3CZ2dj8okdhZZbdcuUTGXvxpygslW1yolIyvINNZ5DU79g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4798
Cc: ryan.lee.maxim@gmail.com
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

0x20FF(amp global enable) register was defined as non-volatile,
but it is not. Overheating, overcurrent can cause amp shutdown
in hardware.
'regmap_write' compare register readback value before writing
to avoid same value writing. 'regmap_read' just read cache
not actual hardware value for the non-volatile register.
When amp is internally shutdown by some reason, next 'AMP ON'
command can be ignored because regmap think amp is already ON.

Signed-off-by: Ryan Lee <ryans.lee@maximintegrated.com>
---
 sound/soc/codecs/max98373-i2c.c | 1 +
 sound/soc/codecs/max98373-sdw.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/codecs/max98373-i2c.c b/sound/soc/codecs/max98373-i2c.c
index 85f6865019d4..ddb6436835d7 100644
--- a/sound/soc/codecs/max98373-i2c.c
+++ b/sound/soc/codecs/max98373-i2c.c
@@ -446,6 +446,7 @@ static bool max98373_volatile_reg(struct device *dev, unsigned int reg)
 	case MAX98373_R2054_MEAS_ADC_PVDD_CH_READBACK:
 	case MAX98373_R2055_MEAS_ADC_THERM_CH_READBACK:
 	case MAX98373_R20B6_BDE_CUR_STATE_READBACK:
+	case MAX98373_R20FF_GLOBAL_SHDN:
 	case MAX98373_R21FF_REV_ID:
 		return true;
 	default:
diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index d8c47667a9ea..f3a12205cd48 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -220,6 +220,7 @@ static bool max98373_volatile_reg(struct device *dev, unsigned int reg)
 	case MAX98373_R2054_MEAS_ADC_PVDD_CH_READBACK:
 	case MAX98373_R2055_MEAS_ADC_THERM_CH_READBACK:
 	case MAX98373_R20B6_BDE_CUR_STATE_READBACK:
+	case MAX98373_R20FF_GLOBAL_SHDN:
 	case MAX98373_R21FF_REV_ID:
 	/* SoundWire Control Port Registers */
 	case MAX98373_R0040_SCP_INIT_STAT_1 ... MAX98373_R0070_SCP_FRAME_CTLR:
-- 
2.17.1

