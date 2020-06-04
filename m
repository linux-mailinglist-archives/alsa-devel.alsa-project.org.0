Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 664611EDCC2
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jun 2020 07:50:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7791166F;
	Thu,  4 Jun 2020 07:49:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7791166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591249804;
	bh=Iq6+hu0xhHv4MWnO8BAG8/q/NTjbZQcfEKIL2NPK81M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PlYCflumDqw80d6P9RfUhSeu+oTP5Mm0oQatjV0uV2eSZw59CJcdoix9PSC6vknvq
	 sHQwWpoQotN2e2zELGNu8/WAMZcA7VJlnhdP4BJWVvduRJP8sjqR3y9uPBgttyeG7w
	 BticIiMnA4Lx5stxh9bqu1hAtKnPv91c9PS9H3m8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DB0CF80260;
	Thu,  4 Jun 2020 07:48:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5357FF80254; Thu,  4 Jun 2020 07:48:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2102.outbound.protection.outlook.com [40.107.236.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D68E9F80108
 for <alsa-devel@alsa-project.org>; Thu,  4 Jun 2020 07:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D68E9F80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="hO14UI19"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juK1PDugEsbEztneHnUtZgaBThRH2hWcyaOquc2ojkqK+dkG/QajtXSigr1CbffavSYbyfcpuwnZl9iJwT2PvVVXZcXO6cr+8nTg5q1FLGRn2CRRGJMazUrDt80JXcqGwaWSS6CwOA8x1y4W23C0tCjMuwcsUdw5x3X3jmkqKkyVLB16m5YBwYprPk3fjs8XzoHjmEtQRf1GrGIo6jEPKqcaWpvFG89Zs9LgOWqjZFB0oWRWtdxsEKUwIqvCZIFJET4ikIKezJCNuXhWcDNJtFaA3oGawaH851yOfofXFDQvwz9pvOugCq+Av834S2Nm6LNwX95zE/wdeu8JsMwBzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vc+zknLvdPhgXi6ikB0cvs+Wx+AShXJvSY7GeUphE5o=;
 b=iiSmUD06XpADupUXrUDJM3B2qrVcSreovzoKznopCFvYhE9qPcfQ+mza7rU19j9vP3LJMggrdWtj1oaGYdA17ZIgVIR7/JRnhCWL0UzT5qFJfZZW/z/1oNJ7W3+NCL/pajeo/Kf/PdTk0bEKXuFtPZ303rP5ej08duk0FPkaTe3Xp/4hsku1A2NhcLRpQu7QC5LVIC22wWEFmSEefa1h5AgcYhMfomM26hw1bWjBn+CjyUi81eMsp8hzehnLeU0iwzjyyOXhNXethMPjjYYM3mdcOQb8S8cgURks9Mk1xUggqUv6dk3EGfk6eDC0QjrOl2/Ft6N/fBXi+6XISahSwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vc+zknLvdPhgXi6ikB0cvs+Wx+AShXJvSY7GeUphE5o=;
 b=hO14UI19WbPCBQlZ64JzIQWzw4GL4scQEQd4R0JLg46J/6vrNx2TrWNWHfYMY7yjaDK9Wovf2Y0HLRv71KOzCnEDaFqsLVvFHbDq706/AqjtodOO04dJAz5kbhJ7yvzaPmv5Lk6qejWb8cCqO90dSnL1+clHSbCR4nAaXvd6xV0=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from MWHPR11MB2047.namprd11.prod.outlook.com (2603:10b6:300:2a::12)
 by MWHPR11MB1344.namprd11.prod.outlook.com (2603:10b6:300:23::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 4 Jun
 2020 05:48:01 +0000
Received: from MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363]) by MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363%5]) with mapi id 15.20.3066.018; Thu, 4 Jun 2020
 05:48:01 +0000
From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, geert@linux-m68k.org,
 rf@opensource.wolfsonmicro.com, shumingf@realtek.com,
 srinivas.kandagatla@linaro.org, krzk@kernel.org, dmurphy@ti.com,
 jack.yu@realtek.com, nuno.sa@analog.com, steves.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [v2 PATCH] ASoC: max98390: Fix potential crash during param fw loading
Date: Thu,  4 Jun 2020 14:47:31 +0900
Message-Id: <20200604054731.21140-1-steves.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0019.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:18::29) To MWHPR11MB2047.namprd11.prod.outlook.com
 (2603:10b6:300:2a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:2d8:e99b:e5ac:d447:7247:839:5c8e)
 by SL2P216CA0019.KORP216.PROD.OUTLOOK.COM (2603:1096:100:18::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Thu, 4 Jun 2020 05:47:56 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2001:2d8:e99b:e5ac:d447:7247:839:5c8e]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9abf8731-5286-4192-1e58-08d8084ad7d7
X-MS-TrafficTypeDiagnostic: MWHPR11MB1344:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR11MB1344D68C87B22DA20BCEAED892890@MWHPR11MB1344.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-Forefront-PRVS: 04244E0DC5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YrujvaBmEEafSvE73lhwaU8xYZJbpFJbaIC/oNQ1lIQamqOUfqNqSXNOzQ4zemelBzqHvXmrwFMFLR0kY6yQOWG6hjXC7YYrPJonwx0gUblNE8ebPoRfvGKYJIopSmctUJBP3C6YdX8JsLvSMVWYf+SricCillwisESMGV0j6LxhuV/bwkB/2X1J/MFhWuavVYf/IFoSV2Jbu4lz6U3c0yMDUyFookKbfdXvvbBMzWKdDvaTiFuW3OYPcljqdDGoZg5pEKLcgTd60VF9i9Hf8P4K6NK9qJB+OCEYL82Gv/NMAoqORSQZxgbqsNIRTw2WRMVy4IhvaPzMrGjrJWf2OuTmvrlmZ9cZ8JuD241LFBy6Lrhb/PA00xK7eIJ5kyMSLhVzSJevMjFtQAHn4R1+Pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB2047.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(52116002)(4326008)(7416002)(478600001)(16526019)(2906002)(186003)(69590400007)(6666004)(1076003)(5660300002)(6486002)(86362001)(2616005)(36756003)(316002)(66946007)(6506007)(8936002)(66556008)(6512007)(66476007)(8676002)(83380400001)(921003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: zeQfNQwgKkVvbo1/NO+oWPY7vDCII+7T2U8CiPYe7CvA/3ithh5vRAlnJKUb5/VQE3k88TAwsdwoWWhje8TC+NM2aPYQt9gZ+VgJZELeRIYJmZxUhN2xN6I8M73Lr0+3+8Tzh+TpeKXQmhBCBfvA1cgbh2kJFH4QdcGHqT+TR8A1Yj95YFmlPyQN6skXLavKqOW0nWgZFbKwLmPP0PqiEjOo4IqOQf1zeAufnCQi+yTuOHLSv6wBEfjwYhmS2BP3vEcC5g07/WkvXhWtaf0L361WwkWLkNq6dM7nUPPEOdKQDExpB+N2LZUXeFTxPJCXaxy++dzfLnndW1bwJSrmjvU5lZjwnaGrKDhzmf+Z/OvFu6ly+6pBE7LL2WbDjYk7+oYAVpyhu/WvmBnH1j6OJTFu3Uf/96WVgDB7PT0jZTafne4e8kUSoysxxmKybwB3C3YVY8IRYE05liXHIXjfSgG2ZPUit6UTfs6TP366mWH9bkKMK+nPXABb4GbIBbJaMy6Ox4lH51RvWOjKr1CCe0YbHTXoWztFrq2TNErdU+E=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abf8731-5286-4192-1e58-08d8084ad7d7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2020 05:48:01.7115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TlOAgVwHNq58OnbmesxImYglRls+j2ejrJMwsP/73dKEiTj4P+8eCkK5a+ijhVcOsc4ch1/3PBn7wykZJHcWqgX9tNbXToon/VoPVC7Gojg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1344
Cc: ryan.lee.maxim@gmail.com, ryans.lee@maximintegrated.com,
 steves.lee.maxim@gmail.com
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

 malformed firmware file can cause out-of-bound access and crash
 during dsm_param bin loading.
  - add MIN/MAX param size to avoid out-of-bound access.
  - read start addr and size of param and check bound.
  - add condition that fw->size > param_size + _PAYLOAD_OFFSET
    to confirm enough data.

Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
---

Change log v2:
	* add condtion that param_size + _PAYLOAD_OFFSET is less than fw->size
	  to confirm enough data
	* remove unintended code

 sound/soc/codecs/max98390.c | 24 ++++++++++++++++++++----
 sound/soc/codecs/max98390.h |  3 ++-
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index be7cd0aeb6a6..0d63ebfbff2f 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -754,6 +754,7 @@ static struct snd_soc_dai_driver max98390_dai[] = {
 static int max98390_dsm_init(struct snd_soc_component *component)
 {
 	int ret;
+	int param_size, param_start_addr;
 	char filename[128];
 	const char *vendor, *product;
 	struct max98390_priv *max98390 =
@@ -780,14 +781,29 @@ static int max98390_dsm_init(struct snd_soc_component *component)
 	dev_dbg(component->dev,
 		"max98390: param fw size %zd\n",
 		fw->size);
+	if (fw->size < MAX98390_DSM_PARAM_MIN_SIZE) {
+		dev_err(component->dev,
+			"param fw is invalid.\n");
+		goto err_alloc;
+	}
 	dsm_param = (char *)fw->data;
+	param_start_addr = (dsm_param[0] & 0xff) | (dsm_param[1] & 0xff) << 8;
+	param_size = (dsm_param[2] & 0xff) | (dsm_param[3] & 0xff) << 8;
+	if (param_size > MAX98390_DSM_PARAM_MAX_SIZE ||
+		param_start_addr < DSM_STBASS_HPF_B0_BYTE0 ||
+		fw->size < param_size + MAX98390_DSM_PAYLOAD_OFFSET) {
+		dev_err(component->dev,
+			"param fw is invalid.\n");
+		goto err_alloc;
+	}
+	regmap_write(max98390->regmap, MAX98390_R203A_AMP_EN, 0x80);
 	dsm_param += MAX98390_DSM_PAYLOAD_OFFSET;
-	regmap_bulk_write(max98390->regmap, DSM_EQ_BQ1_B0_BYTE0,
-		dsm_param,
-		fw->size - MAX98390_DSM_PAYLOAD_OFFSET);
-	release_firmware(fw);
+	regmap_bulk_write(max98390->regmap, param_start_addr,
+		dsm_param, param_size);
 	regmap_write(max98390->regmap, MAX98390_R23E1_DSP_GLOBAL_EN, 0x01);
 
+err_alloc:
+	release_firmware(fw);
 err:
 	return ret;
 }
diff --git a/sound/soc/codecs/max98390.h b/sound/soc/codecs/max98390.h
index f59cb114d957..5f444e7779b0 100644
--- a/sound/soc/codecs/max98390.h
+++ b/sound/soc/codecs/max98390.h
@@ -650,7 +650,8 @@
 
 /* DSM register offset */
 #define MAX98390_DSM_PAYLOAD_OFFSET 16
-#define MAX98390_DSM_PAYLOAD_OFFSET_2 495
+#define MAX98390_DSM_PARAM_MAX_SIZE 770
+#define MAX98390_DSM_PARAM_MIN_SIZE 670
 
 struct max98390_priv {
 	struct regmap *regmap;
-- 
2.17.1

