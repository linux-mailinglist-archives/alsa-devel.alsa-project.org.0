Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C97D13E24C7
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 10:11:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49E5A16DB;
	Fri,  6 Aug 2021 10:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49E5A16DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628237462;
	bh=hduIIMCMVxG3+kqmzZNQP0PWZTSVRt/rz7ib7kbJUN8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iH+qfkZ6joHo0XU9/n5hTndPsATC/r3uNDX2irbSQTw9664rBPRbEBAmN2d3xGfrc
	 t7+kmzJH5DLsutOcedHKZNPNOxXnJbj/Ouw4RmmMD1UzCrQEAQq8fLSYnBG/rmH9NO
	 gl8hdoZNz9ZnKbQ8puYbXICZkBYOLL0S9ihbsR+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0E42F8010A;
	Fri,  6 Aug 2021 10:09:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DD9FF8025F; Fri,  6 Aug 2021 10:09:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2099.outbound.protection.outlook.com [40.107.101.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EDB6F80169
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 10:09:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EDB6F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="NP1cpowv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lI0ImMT5127KTLreBh8X5xGYQi1o0XTkqf0pFqfwjr9J3QN/ggvC6eaBrw81TX0Dq3hurVTjKLlLOBsS9+47ycwWj76uu/nbuydqu30mWN9of1XirhrzXhJcYde5ZO/OP4EomJVnEhljL4/ph76Fu4H/I+SCzI4hmCasV3iYyu02bQRy+LCpoVtX+2NMtAJbUUfLTYpshzyoW/aM4s4EVBkETX1Sixrim7wvmc9FHMuBCjs/r0NNUEABfLAw0AHewQj/nkltmCSVBcUfwxRQwLRBeJH3k074UZuQ6QHS5jLfQ5Wy33d8DZIKRtM+wr20SqFn5YU8FKIUb4YZmkLcYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMTpp8djj89d3SlEinQf+qDX8jkxILgsQ7YyZLWxWp4=;
 b=BvwoMttBYuOaQ9RbiGnW/Nb6GCDOXlomeDkM81vJgA0wRHcs8pPM2cqXTjNKG++W8fBzEKw6n+t4OuVyJoYNGx+IDqXl+rcfnF7NMMt/SoobvEHLXxcuEVfwKo/MQSy+6IeK9MDI0MWtDbUlNVsmNtDIBrrPBfkp7ZRmU5SD7EX7acvH0ChdCPb7pX8A8iT/Vk1zRJX/U7K5GXwLPeMl//uZPBE5+gmckTvM0zB1T/jOc18Z3utD/WiGan1DrAh4ESYmUEC9rn9zDt8q+OthbLoarqs+j9l11lYI5RDvJnUFZpbPVloslWwGkJ5GmTicyOgKw53YtEqfwt2C7UZ2aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMTpp8djj89d3SlEinQf+qDX8jkxILgsQ7YyZLWxWp4=;
 b=NP1cpowvN1WkLgOj3NzzazarIitjWH/i9A2kuOlEDDjOQrZMRztUVrJHEq6+BomAX3YwwabCMUqr/VH5pMgRfz+t7NpsVkwIATQ2ytBc5FzRyl+LuYYmCcS+ewmv3Ep1dj+W317yEjMWo1DGFlrryTlsKtic3mdQxO5FHQjjryo=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by MWHPR11MB1838.namprd11.prod.outlook.com (2603:10b6:300:10c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Fri, 6 Aug
 2021 08:09:21 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::adef:da48:ea32:5960]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::adef:da48:ea32:5960%3]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 08:09:21 +0000
From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, geert@linux-m68k.org,
 rf@opensource.wolfsonmicro.com, shumingf@realtek.com,
 srinivas.kandagatla@linaro.org, krzk@kernel.org, dmurphy@ti.com,
 jack.yu@realtek.com, nuno.sa@analog.com, steves.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: max98390: Add support change dsm param name
Date: Fri,  6 Aug 2021 17:08:34 +0900
Message-Id: <20210806080834.16705-1-steves.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0124.KORP216.PROD.OUTLOOK.COM (2603:1096:101::21)
 To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (125.129.66.126) by
 SL2P216CA0124.KORP216.PROD.OUTLOOK.COM (2603:1096:101::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.17 via Frontend Transport; Fri, 6 Aug 2021 08:09:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e1b5be2-7964-470d-c756-08d958b17ef8
X-MS-TrafficTypeDiagnostic: MWHPR11MB1838:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR11MB183823CD60D98A88EFD7635C92F39@MWHPR11MB1838.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TsOj29bVc+nof3Hd2Z4lMbTfbgIQe8MXGY+4EnifW2dKYJkOuX0/KSQ4vbQ4dlaGXCxQaWd7civIxGNgvnUJIEbUpCx/Ebg4wSQrb2Luvi2TG0np64RmYj/fTm1/vS5uro5UWM4AQusozlJj3hKis+QPk10DWh5MAhB9naM6VtQoTYypj20RXVKWWfVhZV0K/OMJyy6gdWi30MVSRyOkZWUg0ep0jDa2eCAjtvjj21IEzpsV9NBPYs9NBe5Ea1C/ATrpr1l7ZMWtr61KjU9Cu9aAvLujE0JA4NzYnDqLjUeNd/ro24KpMbFFsjhLJ8nAsJVGcvnWnwUBjD1GE7DNn3LV13yfElQ6nF2I2Gp2U15Xi2WXc8iA8jbTFFCuK/n2SC1FTNrRU/rP0Ifg4UWo+OSIirlBlseL+3/k4GsVpilE5eyE2wULi9Dh0Ho9IGvr2x0yzVo+OJNfN0zfYqEnKeMPb2FbI+qkK90GjSU9rPTW8YSc+Dq4AaBUuhA92WTnZh/eCiv9C5xSCN3DQXWxwfNIgCfQ9xmX+hAReR/1iTZwXCOa+x0spP7/UfUoNnREhT8NItij7NwT4AQjl5LNtsnz6NrEXQkRJu1h6RvxDkCb3ESJIt8+cioo+XkbVhU/CpJjnvhzSlu8vvqj14U5EAS+DaxRCMWSgLyHkMaZeZ/JUQ/I069o+pZDCtrcdEnN5S5NB0H73/scR+gdWl2qh6UoQmmPfun4zAoK3BXlmMk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(508600001)(36756003)(316002)(38100700002)(1076003)(38350700002)(4326008)(86362001)(6512007)(2616005)(186003)(66556008)(66476007)(66946007)(8936002)(26005)(6506007)(83380400001)(5660300002)(7416002)(52116002)(921005)(6486002)(956004)(2906002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+rkzJM5A+UcScB8/y/zngQ617xIhzRwd31RXK/tyS6Qj727jv+Fh7NsG2Eqp?=
 =?us-ascii?Q?FsFIV0YziDNnb7EKaSHga7F488m1bQdlMGxuvqLTaJvYfyP4990RIlkCdOms?=
 =?us-ascii?Q?aJz6Z6GTSyt71qzd/kI6qAfvPMSHGzpdcTxfP3CRqie9mrwSDugzG1tj5RQr?=
 =?us-ascii?Q?vHpgKXU/4+Yd4XWA4pnaliO76MNG6adfM027fMRyWeCg1VxCBu6O/a1Ed+t/?=
 =?us-ascii?Q?i7u4smQpx9BO011m8MFDmIFYZUjtUthmuSnBg5gOnYcOGnO20Mpclt1PbOIK?=
 =?us-ascii?Q?1HpZ2WJ60fqvaH4YB0vzvoDrZcMRtCm9f287+Xa0vZwIgsou4qlFb+tFNFFl?=
 =?us-ascii?Q?QDSRFMWiA4T0OHBnOW4QP9lgvC9DhE8HOLVJepjSj+wSP6bCPhm0pXrWkEjd?=
 =?us-ascii?Q?dYfy4sAj4uhzjRmfTG+Udsd4Xcf8o63k2eKLKFRkBjX2aYSkJXjoNLhu10kC?=
 =?us-ascii?Q?slVuXIoQq15UtsFNavJnjZl37sVKaIvTfI3elg7PamFb8xm1BbOIyhvgo9xP?=
 =?us-ascii?Q?H16HSeoXhucayyCSRm3udf0e7Kw6beP/BpSikvoFCfA73rkif7FymLLsY3CK?=
 =?us-ascii?Q?LsV+sB+wxM5Vg9vn7vg2G1lbxLvQghTbHzGgXmSZ2/wTeEnbUKd+08qotXc/?=
 =?us-ascii?Q?yMj9Tw3O/sbCKfP6TA4eJa7mgcZSvS0FC1EPeJ2LeD0UspDPUFoz5LEBgcKt?=
 =?us-ascii?Q?DsjRl/pFAHaESxC55llPT/451Fs3O+V/fj8fePJVxczpNfSjt1NfuiUL6xQ4?=
 =?us-ascii?Q?bNqNoDGfE8vdhjScZ1/9TQWCP5HGScL+aKhESBODVyXkgfgmEOmkn5RV+Uwv?=
 =?us-ascii?Q?IoIwmtv0qq9Fg/4K1AoLGDlW56w1jveoGzqxdSd3JZJBtmsJxpVLdKAkINO7?=
 =?us-ascii?Q?mKqrUqakL8BAnN7hvbIH5rZPNHgTOorzwyqq5vSBBsze+Hj3D1NmFhffUDEe?=
 =?us-ascii?Q?ermy74nn6GAIKThsftvCekHG8WG5LSzZoePHdiPJq93xC7Z96p2RNMal/kQc?=
 =?us-ascii?Q?eSQgh+ZbhUsqqnI6q1EWsgPhjgQrGtNuEwKTy3Mp00ToCGo2AteIDigXvKw/?=
 =?us-ascii?Q?K/NCBXIw/Sq1oiUAIB3RqQC0y6aZiKj/AIUkfVQqkUDqMKN2+nE4KPaaNaa+?=
 =?us-ascii?Q?wXOipjpYLEAvwcJ/n2hbgltp9+aDYYGawV7VVKFOqWwpBJJKaa55L+vooX/2?=
 =?us-ascii?Q?j4NJOLN7WwPw5yzTbXu894TFwgzUxGjVF6at5s8c0FWis4Qh+ma62EMTUDEW?=
 =?us-ascii?Q?hl9FL8GffUMWYdu6xHd4gP0WiapgPpSL2rfmM466Owr2w9oruXHPHYwnCMUi?=
 =?us-ascii?Q?9O4XYptaEdy8sQKudj65uYYZ?=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e1b5be2-7964-470d-c756-08d958b17ef8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 08:09:21.3857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+TtFOHJrNaCbWt+ylxiQjZvGQyz8NbZlu/FLO18lAwK8K9xqHKjYPpKzfOpfyY4aQyjR9hITqr8p7V4JI7L36MD7c6f9PYM7nk2mGp2s2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1838
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
 sound/soc/codecs/max98390.c | 20 +++++++++++++++-----
 sound/soc/codecs/max98390.h |  1 +
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 94773ccee9d5..82d2dd52c17d 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -765,15 +765,20 @@ static int max98390_dsm_init(struct snd_soc_component *component)
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
+			sprintf(filename, "dsmparam.bin");
+		}
 	} else {
-		sprintf(filename, "dsm_param.bin");
+		snprintf(filename, sizeof(filename), "%s",
+			max98390->dsm_param_name);
 	}
 	ret = request_firmware(&fw, filename, component->dev);
 	if (ret) {
-		ret = request_firmware(&fw, "dsm_param.bin", component->dev);
+		ret = request_firmware(&fw, "dsmparam.bin", component->dev);
 		if (ret)
 			goto err;
 	}
@@ -1047,6 +1052,11 @@ static int max98390_i2c_probe(struct i2c_client *i2c,
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

