Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DB63E477A
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 16:24:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A829167C;
	Mon,  9 Aug 2021 16:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A829167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628519054;
	bh=7eKyScnBYBLLjKwpS9AODox9ofWl9H0tYL4HnrAc+mA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P9wPsPa8of5Ik3Cy2AXsZiBJkmRyYYsJjsY7Ek/iklCtckmy43c3ecgrArt5MYLio
	 gobwikKr7SSpeqnxfU3fYpapgZVKmdwE67EvEtLv7ew1lQjGjeLCn/xqfQIQHW/gpt
	 3XbWR/5wbpOzAz2FkKPZek4UINrqYI55MGE1URsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B807BF8032D;
	Mon,  9 Aug 2021 16:22:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7B84F802D2; Mon,  9 Aug 2021 16:22:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2119.outbound.protection.outlook.com [40.107.220.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1EF4F800CB
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 16:22:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1EF4F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="PQ9vonKY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=el8KA1HtBSatWy1i77fAZvpFEBOZsNh+80ebi0N1cCtraR8PZUTeer4vu4pc8qLeVjzouajz9tVfc/sKbYQDoDR4aCboOKhhCz4UfLfZU1kFoPus168Wl7qmI81XoJg/swsZZzQf5tydTSvoKrG0OAkAfR/ZQpmYZ0DuylgDttWMjeeYLKYznFZc0qrCQvQJhNl6RI1KGdVMym7qCSqvROWotH+ahQko7IhM6Oy7QYXvVC49rhpeq81a43C2R6TogdMIjSskj6mBTuugnOxyj4mm4pq1Zxf4/PuCgftU4RikyuYnOhK5y0Y3uRQs4HgztRzZi0sFeKZ97EeCA6Pdww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73OtyT65DQY8atiCrpj3YYzOG64ja7jc+0yls6axJYk=;
 b=hdd7znUs8ZmN4lr1j7QFZug+yGu9op5q/e0MNdAh6FsHxSUNJF4/XDxZUzfPXrzfF2WfB5DHQ/n2Fk0xnx1+ub7I4YwRKXvNpGWvNUmd40ADd2Hi+gpOJLoLrcd84uxj43D2hw1JL/zfwieV26sAU4mhm0gv/634/7t/obUA6wYhvf/R9iwhy1G7zsx7mPzbAmioS8PiRlY5y53Kj+SppAYNyx3EY4wJ6EIB5r/bzHklRhZZbqwHfuX125CDSYuplLRnZ15FAbsr8GQQ7ucOT1uMBR3uLERlNUU83bJHMxFaGBuEFYJcl2hGwTJZ5mxG7+6Mc4YIys1zt6eWuBiYFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73OtyT65DQY8atiCrpj3YYzOG64ja7jc+0yls6axJYk=;
 b=PQ9vonKY89QLpTZcx91RTiYH/hH2CX53FEa2i//3u1QMXqFbPijLct6Bd6SSt9PwfhDPmVBZGSLOoBpdB8vOxN7vp8TX8wTADAsAxeZFum8vgKuaVRfp4CTOK2Akq1WdjqrZwy7yoDhgWi7fdN6wT3IXL/xMaiQTHnJYgoVFnnQ=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by MWHPR11MB0078.namprd11.prod.outlook.com (2603:10b6:301:67::38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.20; Mon, 9 Aug
 2021 14:22:26 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::adef:da48:ea32:5960]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::adef:da48:ea32:5960%3]) with mapi id 15.20.4394.021; Mon, 9 Aug 2021
 14:22:26 +0000
From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, geert@linux-m68k.org,
 rf@opensource.wolfsonmicro.com, shumingf@realtek.com,
 srinivas.kandagatla@linaro.org, krzk@kernel.org, dmurphy@ti.com,
 jack.yu@realtek.com, nuno.sa@analog.com, steves.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: max98390: Add support change dsm param name
Date: Mon,  9 Aug 2021 23:21:40 +0900
Message-Id: <20210809142140.9293-1-steves.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0133.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::12) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (125.129.66.126) by
 SL2P216CA0133.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Mon, 9 Aug 2021 14:22:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc625349-d96f-4103-18cc-08d95b411cd4
X-MS-TrafficTypeDiagnostic: MWHPR11MB0078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR11MB0078E01FE99FA4F8F7B5330E92F69@MWHPR11MB0078.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wA/wShjL0J302IKV1umtcJmTywg51VWDFhSxUxJ3Tj31Ml8KYBg8MYlWEE25wnQOLan+w8VLy5mMmWJXsPQHvXBA7yPeG9jkvDRQztPpwGT3JCdHKaWFhVDpJzov41ox0TdYzRkd0gKANxMaaqk1J1/VDneTPyB4Xs9xzXhygkym+JKy7QgxR9mSkqWAqD32n1U7S/CvCWyZhEGtKFxaD28SDtgCrm7zxMmpM8K1csolZrV1DGL/z66AskloQQR1RNJoc0pDdsH8ej9TGnznB+YgGY4H7W1pfjNrtfrJRaeNsAO8mAZK/hrJob79UzcLpAQxKHqS1uvwex7lCjQ9qZ8O6z+E+unqF1BUgYSEImc7Moo7SrARlHUPAEkYWyth7zPnJkkj+pT4sTK+o0S8IOURAYRe2TtiyBg5k59mZiF2gIZ0+8UXV6cGcOM1liw5egDMrbSrM1xBnx5OugJMf+6OhQHKqY3rDpMEGY1fVPtczXorCr8mGr4fe1N3gawYuQCbI8jsAxoqoqlZ1t8kZ3wCnLqmIvkHV/U/8jQQNxzjtrXEnFC/2MmfR2rVjEZ10L9I8/hG98QPBKrOjM1520WS39d9/J5LwtiZUD8Q2BL6DMN/maC22mPxMaI0LSDljyejfm2ZzYQQAeD+/Ubmfe0Jo2fjE2tNk2y0qAMHXAm6TX2BxdVgNMJo3Xplgg5Zd5Yhbs2ewCnFpNIG6v0TCFpy6heiD9dvtjob1SuEjPk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(2616005)(956004)(1076003)(478600001)(86362001)(7416002)(8676002)(52116002)(8936002)(921005)(316002)(38350700002)(38100700002)(6666004)(6512007)(66946007)(2906002)(66556008)(66476007)(6486002)(186003)(6506007)(26005)(36756003)(83380400001)(5660300002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hlX2yw7Mo3sGeVazGYKtHOeoaJAUfjZcMaWhmuQELolh5KelgQnKa/IiAUGU?=
 =?us-ascii?Q?JqDqhR4bFU9sYhFYAv6JjzPX8PYeGU6CIxSofWm4uuBA9wzyWy8F/HRAoYcK?=
 =?us-ascii?Q?vSqgPpxYFX27W/OiSHiI/IhSJz4DdLE0xZzkeYAzR+f6kbghA7DEcwMXNA9Z?=
 =?us-ascii?Q?Tv4+qLtjzo3GYo8tQhFsFGncNFQptQGaAmJRXL39oC0l9h2Kcr/eKBlkYa2U?=
 =?us-ascii?Q?MXHifvdCIUdajqCJy/3ZVL7dwPq3LCKYsT1NCjAmRkINMU9YG9BmEzv/CtIe?=
 =?us-ascii?Q?LXNsXx5BX+hG+EJvt8Bwunew+/HC0P/Fz+N0NZFNuC2PD0k7Wflbvyb2lhOR?=
 =?us-ascii?Q?f6NG6lmcwVF/4wwAgYPW6JU+6/ezUAbipOxwSy3kGoqEi+ozqU0QcP1dno/K?=
 =?us-ascii?Q?OuQdbAaYxCe+sKfXW4g+0Y55ZXaS1y+UPWLBDxWAUNtC/t8+t08Z0JbIVzGU?=
 =?us-ascii?Q?EzA3N0U4QkFsLA0Rg+GfNiERUBpGh9fL104J9x6s2OR/ET99yr/Nz0CWLSyE?=
 =?us-ascii?Q?m+/vfT1lZJ7J2R5k6oQ2NLX2GfXDFAmxmWpfU4VdbbAkLrNyuWJVbC3QKqrF?=
 =?us-ascii?Q?HmFUWhkz2eoGVf8aVBJ7be0UNbB423h3myrO2D0EuH/zy2rk0nEFnesKRytc?=
 =?us-ascii?Q?sAZJbR6TnNhcteMmU9aFfyuv252lLU0RwJutyrwnZ1lavsAvjeIMALgug+BE?=
 =?us-ascii?Q?TV3F/Iwkey3kXCg39ULy6NjR5Tl2KQkTUcvprhCBW6g3MP8Gd2Y3G7jTkOAt?=
 =?us-ascii?Q?htjEEr9UL/wfu+0s9DAntzvyVhAj3AD+5kTNWPMVnaFEQLitK+CBT2C9NEws?=
 =?us-ascii?Q?HfI82wRBozhU4pOocd4uzl38pqGvNG59DPDVnOHUzUY71OA8Ar3x1ZEI6Spe?=
 =?us-ascii?Q?FLWlxbX+SbSsBl/C5VXc0h6cTk5NrgiBF99j/yXB2YXXvMKN2goZXWXNib/4?=
 =?us-ascii?Q?Jd76x2VlYocYrFehPIijShTIAH6Ymi+GnvlBA0EEnr3cxWYTy7xeK80JYoGQ?=
 =?us-ascii?Q?/kZ7/sMzYaMVmiIkMvcZHOsn9OgFlXfmZuu/TA5Czz6bbcyDZFsslaR8+xzN?=
 =?us-ascii?Q?gEhNVkugwts6S9tOxiu1BhlCiZKuhdfNzxyoAvRnth8JUl7zU5lQZ3YFooX+?=
 =?us-ascii?Q?tOFid4u5m9qOP+p2Lnz0mjmy55rfdlG3ppnScjHi98T+uXfLBYTVzebnmnim?=
 =?us-ascii?Q?DoHBZyEu+V5iU7CnOsDJTvo5knsE0S61DLOhHg4qOdByJoJN6ZPs1a4m/Qus?=
 =?us-ascii?Q?/5oIrFc7QQ9qU6q11VdIVzQH0WMeJ5eqngY1ihCKzbP/mcYjZDVwKVeR4aKP?=
 =?us-ascii?Q?o3vpcIVrOaqVcSYfOwJQ3dGD?=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc625349-d96f-4103-18cc-08d95b411cd4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 14:22:26.6788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17D+RV7/FGm1zBTXPmNsK8SG1vgnD22vs9mIgK1GX8gGUCL9Ui+2aWiaq6Yuxpc/bf+nagyxG5/cnFWXXO7m1Y1k+4r6Fjbbw43v7Pfy4NY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0078
Cc: ryan.lee.maxim@gmail.com, steves.lee.maxim@gmail.com
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

  In case of using different type of speaker, support
 using different dsm parameter bin file for each amp connected.

Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
---
 sound/soc/codecs/max98390.c | 26 ++++++++++++++++++++------
 sound/soc/codecs/max98390.h |  1 +
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 94773ccee9d5..b392567c2b3e 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -765,17 +765,26 @@ static int max98390_dsm_init(struct snd_soc_component *component)
 	vendor = dmi_get_system_info(DMI_SYS_VENDOR);
 	product = dmi_get_system_info(DMI_PRODUCT_NAME);
 
-	if (vendor && product) {
-		snprintf(filename, sizeof(filename), "dsm_param_%s_%s.bin",
-			vendor, product);
+	if (!strcmp(max98390->dsm_param_name, "default")) {
+		if (vendor && product) {
+			snprintf(filename, sizeof(filename),
+				"dsm_param_%s_%s.bin", vendor, product);
+		} else {
+			sprintf(filename, "dsm_param.bin");
+		}
 	} else {
-		sprintf(filename, "dsm_param.bin");
+		snprintf(filename, sizeof(filename), "%s",
+			max98390->dsm_param_name);
 	}
 	ret = request_firmware(&fw, filename, component->dev);
 	if (ret) {
 		ret = request_firmware(&fw, "dsm_param.bin", component->dev);
-		if (ret)
-			goto err;
+		if (ret) {
+			ret = request_firmware(&fw, "dsmparam.bin",
+				component->dev);
+			if (ret)
+				goto err;
+		}
 	}
 
 	dev_dbg(component->dev,
@@ -1047,6 +1056,11 @@ static int max98390_i2c_probe(struct i2c_client *i2c,
 		__func__, max98390->ref_rdc_value,
 		max98390->ambient_temp_value);
 
+	ret = device_property_read_string(&i2c->dev, "maxim,dsm_param_name",
+				       &max98390->dsm_param_name);
+	if (ret)
+		max98390->dsm_param_name = "default";
+
 	/* voltage/current slot configuration */
 	max98390_slot_config(i2c, max98390);
 
diff --git a/sound/soc/codecs/max98390.h b/sound/soc/codecs/max98390.h
index e31516717d3b..c250740f73a2 100644
--- a/sound/soc/codecs/max98390.h
+++ b/sound/soc/codecs/max98390.h
@@ -662,5 +662,6 @@ struct max98390_priv {
 	unsigned int i_l_slot;
 	unsigned int ref_rdc_value;
 	unsigned int ambient_temp_value;
+	const char *dsm_param_name;
 };
 #endif
-- 
2.17.1

