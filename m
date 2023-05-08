Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC8B6FBB9F
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 01:53:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 880BC11B5;
	Tue,  9 May 2023 01:52:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 880BC11B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683589988;
	bh=B6pMiZIuiWj4gHxFk9ROuez4bPCBeko7cVhaNMuDFSs=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=arMJDidi9loy33ehSBk/AdYFdyF6vxeR5nnqRZBektpf47psZ2/i6C/kAZb7vnO6e
	 JPOAnngqz8Al2pzJqGPpbzVrCWscbKoKvE3iaMxX5lJNswpP7wnEdYdYtaRnCCazRj
	 e72ndHtCsGExGkjoEUp6VevGEq1hQAlBs6AwkJXY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02673F80557;
	Tue,  9 May 2023 01:52:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71903F80558; Tue,  9 May 2023 01:51:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20709.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::709])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37063F8053D
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 01:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37063F8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RA27uDEE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1YLSbqBG3AYd4BM0IAvq9pGe0zZGBw8OsfAqda/QzVVOrHUBT/kr0A3F4x3EFO88T0AHqfXi2dSiWS/hUJcGH6/878HM+pDy0ArYXimDbHJmne4N9wdVaclR9BVeHBOeai9PSQh34pxR9a90mWp1FHYp1jGMvJmLxgfsAAvkVZmwHfd9OjcRhhgEQlF8bzEMwvvVqukLzlYi2oR66BiySTs9s2K/cd9ikttSEtlOVfJyY4G1F8bx7T91fyZPIQwTAcrsxZXLJLSn1dt8a8jMWILrqzjYSoMZgDaymz3ci9tEH1adFk21iIE63KPgpmvU7gWoQeop7r7ZxZ/BMhH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DG7k8UGtCHvZZMsM3BMgjlksc9muxPdsnEU2Bx8IXzg=;
 b=Oy01/FNDJV/lhhIBR9Th0W8/vE+EWBi42J2ZydjaksXSZN0dkj1yAjT7zJ9+WXAyXPzAQ71gJG83zF3Yvg4W18M//AZ0B3rox9tETqGc46AH4UZh26F302ML3YIVuUSjsho6F/QmOyZqVWbCUXvDK5r9PBp4fMEAzQpu1QWb+8ZcJdMOD7qiS+7RtRolem2Od7klsb5BcHisDr93f/Y+46EXC9gNv/JGVyotNA7QT+/VvbNchDiJKGvTaqlFyQnlLfgBlL4mMFxhv9Ara/Zk8AV2RSTLdTT1i+sMknlirHynRri9w7mcVBMS0wtmS2VCshxr0WKsh01nO3nXh7oVYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DG7k8UGtCHvZZMsM3BMgjlksc9muxPdsnEU2Bx8IXzg=;
 b=RA27uDEES8ycf86T6al8mSHa3EtQaWAL3OS3XauGfdAi/EONFl5+vKX1HkSSyJE30yeMcz++U10GEZHlL13PrFjf3SBqtB6IgIIVvp3VWMbv3/c1+HjoAhvODCF/wJ+LdRPekV2rwHmkxCHOJvsC0mDw55bMpvFBUDqVrl3eU4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8249.jpnprd01.prod.outlook.com (2603:1096:400:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Mon, 8 May
 2023 23:51:49 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 23:51:49 +0000
Message-ID: <877ctil6uj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Banajit Goswami <bgoswami@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, Takashi Iwai <tiwai@suse.com>
Subject: [RESEND][PATCH v2 06/13] ASoC: qcom: use asoc_dummy_dlc
In-Reply-To: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 May 2023 23:51:49 +0000
X-ClientProxiedBy: TYAPR01CA0017.jpnprd01.prod.outlook.com (2603:1096:404::29)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: ac582bde-46df-4fb3-dd07-08db501f30bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mIfk5a44GR2p6SrlBKaTW/ICcSUxQo/DijYhDG5pKNok+gl9NUO7C1eXFwRf1xHDAMT3iJR6JoLoHti7E/GOfC0VjY2X4u5HJCsIcMzoMjG8sRUjBH+NSIME765ZvEeIvyo/n6Ts9DulJ9M9m+RyQhCWMp/W7XNDbdMHj7heRYb11kX+C4acT69Sk+TIp/pNTVS/VDpjWpFPRfl9kca13eLYcgJf3/KgMlEXOREfYtSYDT7HqS8HBQpR61ZSexiEnZStWMHRHk+QkMcrYWvp2I081fM0GTyLvzWpL8DSgCJPEX27Stcy7t+HKE1L1tGtnTCJIcaD453EtQcfrOo6RjdpD36t6JxpQHvXkKh/R+yRItWIgQiKhj9/Es6Uxqn6I7MTVpi5CJBT23UYFSM4VWa2SDwdynkfufsQAetflap5hfHKWS8M2nPz4c38kIM/7ZzuIZukB8ZnpSDDr/3O8nCmPbzztGBKUpJ+/qjkXSUOoXs+Vt665BliC/9SRAubkvkfA2dqVKQAFX7T1hI/rM6x1BIp2iG7gzJqmn83FAH7D7I0IwPXSIAv3kE1H2xLaaHxbB0ClOjQv8xWn2l6/zqh9yzbwHzcUe7/x+SPD/51Vf0ilhLDq83CYVDgdmXj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(4326008)(110136005)(52116002)(86362001)(316002)(66556008)(66476007)(41300700001)(6486002)(66946007)(8936002)(8676002)(5660300002)(478600001)(36756003)(6512007)(26005)(6506007)(38350700002)(2906002)(186003)(4744005)(38100700002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LbMfC1C/mzFkV44sV7iWXv3sz11Dj5TkZ27RIcGr+aNZZXcRc5KxMCEDC5X/?=
 =?us-ascii?Q?QORZXCvUKSsyRZPcvQV0m7SS/VMgB0GcUedgogDv7r5rMLdVu9mammRsK1tI?=
 =?us-ascii?Q?CFXYdCvBq0y/C1J29V/uOkIMN7p5uccnvrAjx0Y8V1LgPk9WKdn94QLod2TO?=
 =?us-ascii?Q?pUj07mlNQcsBVCOX1s0JJwAN5AsQddxOlPhPbPi6ATSd9IqG/ipi6+StpIrT?=
 =?us-ascii?Q?fRYrFZxtuvu7XX5+8CKpR+ec2+2R/iyvGPVLUDC5ty9c64R+JKAHH8sgj5LY?=
 =?us-ascii?Q?bCFw+uRPlIf60Yxk0MLrcynQBnGG3Ba6A5TNfQLvo9l3bnsv19fvw4/qb2Hq?=
 =?us-ascii?Q?ua8nwbRJEI/32Kx/WDWov37yI9QfR9bFFZBqoXKIv4+Gihoruz++4ujAYX+x?=
 =?us-ascii?Q?AhPyi8txtQSFtnQOj4G+iUAjIzIcJfWP3ae5OvzQ1DbVCCEHavdA0C474+6H?=
 =?us-ascii?Q?KDkoZf9/Vfm+l6Kc7NjyPgR2ServjoVA3rnhov6ZGtetvGri87kXmqoAP3hf?=
 =?us-ascii?Q?cSJKybNTDA2BTwU+y6R2luOv1ZRQpIBna1PsA+yEw+K2oqBQiIi5CKv/0C2X?=
 =?us-ascii?Q?7m8uayKaYsRTd/7+VVNvKBJPzwZy1JgcjA7RQBt6bXqV07fcSNAkhj+3m8gb?=
 =?us-ascii?Q?hsYfEI8JC7EWPT+Sej0RkKRtKRdvTyqmGTqb1EwXntYZ4MzAgioPFPzGVEFI?=
 =?us-ascii?Q?3vR6P1MLTTGh0/OoB4iZwZoThkh4Jg7ATOmuVKMWtWTiLEdR+i3sgZuGL9dY?=
 =?us-ascii?Q?+NyA7Q8ibqZ8yr5BgTok2s33nspKGdQJJlc1l0SqGBjafULeQq7UZbYOb5ks?=
 =?us-ascii?Q?lUftIECQ5n4bo9x32Cf2UsszS/bdrCaiHY2upIV+jR9pOrnUGsWNKbkLdanp?=
 =?us-ascii?Q?OGyLX8xseJ/+y2/SH50/IndbG3LXfDaVeFCOf9eo1s0qsMf0f97ifJD2twF9?=
 =?us-ascii?Q?vNHfbjAA4IDwaWcFOMAjqUyg7gsRt0OaLub0ktR1/0wp00nwnWagmxXCd78I?=
 =?us-ascii?Q?OcQT3m3ucl8O99mLJAzgjBNFADxmQXcah3ASHdQyfZBzcMPMy9xe2JJ4w93m?=
 =?us-ascii?Q?oXkqsLwfOGPSieA/yIUcTmqymyfaj9MvSQZNhnWiQb4pFYYUQ6Y4Rqqu0Bat?=
 =?us-ascii?Q?cFzlVZkVtRtsAjq7JRxrxwClrGMScMVYBMEOvcjrXt9BojBNUnimBdRvkvzF?=
 =?us-ascii?Q?+fWAxjB62AeiJRr0nlCdZsOcXiSlEiuo6b1AZQGaNi3I0qCbsamug5g5fEtd?=
 =?us-ascii?Q?w3vD508lhqJp7K40epbESkL31LnD2eMT9JavNd6eHAQOCljgwzKyi5AzxvS9?=
 =?us-ascii?Q?B6L8rd4Q0sQh6PXA0H051zIgI2exJSJ4hP8xGEFW8rpZnVbGamhic1knb14E?=
 =?us-ascii?Q?1om3pspsIccihV5c4KhllHc7awDb+SNBVUQ5UNMUAtA1f1vPDA9d7vTl1/oq?=
 =?us-ascii?Q?kZqJ06bXyGkxvyEBa+5pce8IyQZhiobRAiz/SJR+S8pGA1LV36x0IGy0i522?=
 =?us-ascii?Q?4nVgXfjYG5ZOQxVAfCDbCrBOZm1SdcN8NyBLpa7l+TE8w2QXIDyaoqIljLei?=
 =?us-ascii?Q?IbSuKii2CevjvudzSSIU6zcnFzyoFoSwGlXvfmqsfoK8CofyFT9guHxOH0NF?=
 =?us-ascii?Q?9/YpiXlCIHFNA4ZnGhrkH5w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ac582bde-46df-4fb3-dd07-08db501f30bb
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 23:51:49.6042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9abnUoX1uSXamDoIZf7Gb8ZX/i1pXDuODRGRPEqgQ93zMsALZ1GT1qB3PlPkPLLAa6IMPUAIdUbQgeocOIWkPhUy3vAttMjbXIZxR9RIjW9bL2t2Zjj8NPZmH6+iJAGm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8249
Message-ID-Hash: X46YPCDJHDUCLWKLE63DYDJBEEUPVR4Y
X-Message-ID-Hash: X46YPCDJHDUCLWKLE63DYDJBEEUPVR4Y
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X46YPCDJHDUCLWKLE63DYDJBEEUPVR4Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/qcom/common.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index c1f24af17506..cab5a7937a57 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -140,17 +140,8 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			}
 		} else {
 			/* DPCM frontend */
-			dlc = devm_kzalloc(dev, sizeof(*dlc), GFP_KERNEL);
-			if (!dlc) {
-				ret = -ENOMEM;
-				goto err;
-			}
-
-			link->codecs	 = dlc;
+			link->codecs	 = &asoc_dummy_dlc;
 			link->num_codecs = 1;
-
-			link->codecs->dai_name = "snd-soc-dummy-dai";
-			link->codecs->name = "snd-soc-dummy";
 			link->dynamic = 1;
 		}
 
-- 
2.25.1

