Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3001579A102
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 03:43:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 855FEA4B;
	Mon, 11 Sep 2023 03:42:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 855FEA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694396613;
	bh=c7VsjujIuplmt0/otkNE+I3TPF/pMqaTY4rvPYQQby0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LL8dOL3ir618017VgHtvkiUy8nsmhMkeVctEnUiTArY9qc1FNMiBeXY/2UMwJ4MBR
	 kI6DE4JGKgDapgTOHk0I1LDlQnaPaTqPNvrcnEtzbnLZznQrKl+To6Y6QFL7kiX0Al
	 +r/PEGCDrGYeR/iD4DjeDhDoKi3DhDYQEVreohL0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E4F9F8057E; Mon, 11 Sep 2023 03:42:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FCA0F80568;
	Mon, 11 Sep 2023 03:42:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 111E9F80578; Mon, 11 Sep 2023 03:42:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20711.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::711])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C588AF8047D
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 03:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C588AF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=iMw4tjjW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3p6/ZRyZHCEXjZfAs4t635hnBCFjSwAlmNKPFHLQlaGXax7pcwLdHUTY6hfAfq8fWgZ1IhNp24+qLfXNFF1DQKiVVvQubMnLf8/vtclIgOrifdFqyu3VQwPxF3/BnuOZiZJyYHaQsNl1kYqRLDrFn7ecOx8JyNQsDpKNvG/kfGDd3WEIkKxpaiXoXPlu8bhXER2w2nWgzyojCYUpbcNhgEfH2OEic5W5WuOGT49zChOopXsv9WN1iEsY1l/TaRHTRBcrRw10A7Dt9Y+MqeMSL9I28dhDEkZvso/+5Cv91Y3Z8+pfYJBD8L52WnS/MSFJ2mXUOKpbv1gq8WtQs6iiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPaTv0VvMiVla+NgqZx3spnKw6vu9WIfdyvs6btGbMI=;
 b=TybeMaHhvoR6VOiV91+o2V28FvdpSkuABMKwpg8aGjcJg/DdJ8dgaSDBnVEw4Rvu0N1J1KOUTZMSspZ2o0TYVeN6drnADQzqPDXefX1e3gfD86CmkmP3CGNw0kjZfSsM1dsGYM0kAIyrW6S1diKX0bzG4UbIz90xB80ryMZXVEJUzVhXHndFbhVAVy/MM41kxpU+kC2s9TfpPWwZS7PreMC7VPlpFZiNcThk9ryBCfJDy/T7aCfyfCyr+CB9Kdypdgt+RWZuNgnkASrDwyuOEZmAvDwjPpEMbYOVHTw3fQr3Cy0vpsOi+TOPCx2ojekHq8iMQpjEIec1eIbUNg+CkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPaTv0VvMiVla+NgqZx3spnKw6vu9WIfdyvs6btGbMI=;
 b=iMw4tjjWPgRAixSrqUx/1IHEzOVysKH8uQbSljldFmxZtdUEI/xfWayv9aLNqcgUdftvFxBYPTVWBJro09yUcO2EucYak7VbH6Y138WNURrAyHu9/r+jWxZVvwI+HJ7zGZmRtx4OFUomAHXhU78OtBiA0XAAoqKOcodPSSbflB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8487.jpnprd01.prod.outlook.com (2603:1096:400:15d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 01:41:55 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 01:41:55 +0000
Message-ID: <87y1hdh4f1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: da7213: add .auto_selectable_formats support
In-Reply-To: <871qf5ij0d.wl-kuninori.morimoto.gx@renesas.com>
References: <871qf5ij0d.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 01:41:55 +0000
X-ClientProxiedBy: TYCP301CA0053.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8487:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff91647-4ffc-444d-884b-08dbb26847c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kNxh3EHWtu4R+QuWKe6moKR93IJPskyx6pO7KAdbda5nD1UpJgZA6Q4YT0PfhPUW+DaYRdpBCZsaEJarOMf9PEJOuiSV/N0Roc5lASwm0mErz4x2Fxeed0xQ9uxe44/ePDd/5sAMqw0opfKo2PCWFErFNaG3hk4T3pUQAqWJ6WjgRx+7M33VRTARUaCmNMqWot4Awafl3m8Rp+NVdBFdo9pB9ebxUpJSP8GHgc9laEV5vlsDZBbYBQrInf3JtMs1pyE11VjR4kApUf6jOdbI4MjKpUkfoiFlcq18cG07YgfI2NOXFVDaQRfDF/LnfPmw9SEVUvuyrWB4breWKLUAYzXl0Gi6HrIVcBqYJmQfTw0CA/eIZeoyUwtQnDqVU8sdK+LL7ycWlGQzlIVUqzKD3mPhs46HnQGdEQEdKXjhMBkEAjO0YbZiJdbcu1KVYggoEv5M85X1PR2Gd0Ud5Ukkn8PqPv/CpNBFrx2yx8d5CQJkyARzdw/xEdPqiOLZ1Q4JgYACMdO6XeMxfCpVwZmYF3uMBefJyJEfAop0+vaCYg9ZUfVgHlbiBQlqK27Lj43QzIYr3x3b7LYAbZuw4m7MB+qjtNRBDApl/uSJUpjUSf6ttvtgkTfMl4CLFwd/r6YOKdzMKrKQ73ALU85Nutkxlg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199024)(186009)(1800799009)(52116002)(6506007)(6486002)(36756003)(86362001)(38350700002)(38100700002)(26005)(2616005)(2906002)(6512007)(478600001)(41300700001)(316002)(110136005)(5660300002)(4326008)(8936002)(8676002)(66476007)(66556008)(66946007)(142923001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4bVsqon2TQ4AOSP+JW0Qax3jgKg4BsUZ6p3hAqBdCFMSGEFUFAGy6nQbyfJW?=
 =?us-ascii?Q?4qp2saahfYiqupyotoZvLtvWl0PLe6K3z+rqOq2pDRM5/v5GikNO/TO/XS02?=
 =?us-ascii?Q?eUZGLTY9sM0ZcV/xbOQYL9sBj0s4tQ3BKDP/jF83I1M4D5qBWaKfje4mcNJ1?=
 =?us-ascii?Q?Qaw2+QeBfVO6QjDzKnSwdZS3m5Gkv0jPegLbpcvcXLfTTUMMFSMbRmdBhxec?=
 =?us-ascii?Q?bTYyPg7aX2Tjh+FET7E0/mxnq573p3jykZik/eC4TBpLKpf7SLCsvllPM2rL?=
 =?us-ascii?Q?N/KllLYhr4LjUvqHfkpnYdOI/Nx/8ymXzml7cLCGqjBo+FxomYK2OzMSJMF1?=
 =?us-ascii?Q?H4pV/KDY0TsbdhMJpU6RXKgCPe3IICZS2ckBZB3Is/Rjaxoc7lCBwvgkWJBT?=
 =?us-ascii?Q?hEoOlM/P9PhoxXoe+HCY+pr/1ItLpOha1bzGKpDjxhtVcZDa2ngjtVCuyk+1?=
 =?us-ascii?Q?t3BikLxd7xuLfiPHpA3rQ2Vt90OhsgslS586UqxwZBqo6iZ57J3whJs3gYaG?=
 =?us-ascii?Q?jeoh52CvIFgslw9buh9qVvzimUjl6gh32uasoj8uNRnUGpqukCZ5BiSvjj1m?=
 =?us-ascii?Q?LT6ST0ngDXjQmsgmXC+kQGbwk/2cavjCR60IhNBUmWA3aunXxLeKSDHAerXR?=
 =?us-ascii?Q?3pKQU5iPnVOU0k0/jHNPCM/AshAF3W4o6LUZUF88GxAa5ya6FwgtM+SxJQmu?=
 =?us-ascii?Q?Q77I1WKfUSl9TWraY64TU7NGfy3FdONw7uR49Alvcap1cnWuWtmUc1dC9r2J?=
 =?us-ascii?Q?cYnZKDvTZhFP+yx3ztGvgTU8KvQb1/SlMY3Njx37ab8fH5pLy4vN/4dTB7CZ?=
 =?us-ascii?Q?cEC4lRZQljQz4uBTWe578tcm0c4a+v36UWAbZ0nCZIiCqJmcQsy9fIxKpwmW?=
 =?us-ascii?Q?RsbPY6s3AVpnRnfuvmgKpm1zCHpUnxW0sdMI25gSRuCz1J07ABnS57N7ylQr?=
 =?us-ascii?Q?+kOj1eEi/kWignj7/zqEWBlKeVuXGW3r/C06HEfEZW73MeNrFkeuVPC9Otgq?=
 =?us-ascii?Q?CPDyQIpaWB5Z5w3k9I6xsteVZliH+TgMNZdWZXTkQWqT9sc5pVrPmRMQ3MbK?=
 =?us-ascii?Q?bbw7O9lMYR362LIUxiW8TWsntGq1MlNRqFvhA+MgERvtJo/ce1oRiGrjwnci?=
 =?us-ascii?Q?LOqKzZZh8vjyHwLfcAxaxgbbdMZMuumjnatfWKUzoOKhpcjdq3kAxH8v7jHz?=
 =?us-ascii?Q?LD8tzxJkF0QSJ9HkvN23KDDd78moNOdbo3xhKESpOk2sH0xHQU157AzyCTu4?=
 =?us-ascii?Q?3DfHhDbSMpWM0GIQHoBWBKyBWBd5MfMyzsUm/b0C7/tb1KRJtr5GDTIfVyEp?=
 =?us-ascii?Q?Lvb4dJqM1V3QeOQXsCPCTMT2B7wlgUT4X8KNj4hr9FMwPa1s+cQppP0Ei65z?=
 =?us-ascii?Q?KjH0bO9yU4bh7/bDXoB/wpJ28+7s5FbPIY2YFSEVY2mEQ4u2eztXWNYGGkD1?=
 =?us-ascii?Q?a9F/JlVcIZ3pp2ch+mJMVCxUVCXKx6CM37h/Lva3ccQ3neP7RnZsjbvmSvGI?=
 =?us-ascii?Q?yQnC0L7M3I1GmPemZZQBwOaw+ik2fsZUzgmJ12PnrRU4/9qJnDTHz8WCMxpN?=
 =?us-ascii?Q?fbVkI0LjLWOhxGgLifH5ez3EJxLWDaVZsl7qK7BQBOIvklvjy4da1uyWwlut?=
 =?us-ascii?Q?8V+vuHRVIl8q8DU5tvyMGW8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9ff91647-4ffc-444d-884b-08dbb26847c0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 01:41:55.4717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RECMsggrXzf0jiw7AAaNllPMQY5vplwOUW5XxuDJ0U/Q/NsupY7JlhjxU0+DoI/xOsBJbfLIJMYGD/hfzjHek2TlYFQY/IyXfUiAOLeJ3SepCMtYG0MNZIQuBR3y8L2e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8487
Message-ID-Hash: KLQ5NQ6GXQN2ZBG57QKPUKPDVNGUA67S
X-Message-ID-Hash: KLQ5NQ6GXQN2ZBG57QKPUKPDVNGUA67S
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KLQ5NQ6GXQN2ZBG57QKPUKPDVNGUA67S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

By this patch, DAI format might be automatically selected
(Depends on paired DAI, and/or Sound Card).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linh Phung <linh.phung.jy@renesas.com>
Tested-by: Khanh Le <khanh.le.xr@renesas.com>
---
 sound/soc/codecs/da7213.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index d725ec25ce2be..49d97627abc64 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -1550,12 +1550,30 @@ static int da7213_set_component_pll(struct snd_soc_component *component,
 	return _da7213_set_component_pll(component, pll_id, source, fref, fout);
 }
 
+/*
+ * Select below from Sound Card, not Auto
+ *	SND_SOC_DAIFMT_CBC_CFC
+ *	SND_SOC_DAIFMT_CBP_CFP
+ */
+static u64 da7213_dai_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 /* DAI operations */
 static const struct snd_soc_dai_ops da7213_dai_ops = {
 	.hw_params	= da7213_hw_params,
 	.set_fmt	= da7213_set_dai_fmt,
 	.mute_stream	= da7213_mute,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &da7213_dai_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver da7213_dai = {
-- 
2.25.1

