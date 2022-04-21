Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4A15096B5
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 07:24:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 763C11EDD;
	Thu, 21 Apr 2022 07:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 763C11EDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650518660;
	bh=Tbls035kubCqXLx8zqZ8BM2ayVdGOIfqyjPPzy4Xikk=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MZDogYgfAYM0r23uNjDtqyhOodQ2n6zoPBm/YnJHzRSGJpmVg26+oobocGCm/2sHl
	 qh9tRMrvFoyheBZcXMJm/xmUWhiEYHu/SrHdUegdqENqrPLwmbRDQiGJ3gOyE0/G2b
	 e39MFw8UXh3mTAOe2yt5glmhMqMZTd/8R0Bg0HY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBAA2F8052E;
	Thu, 21 Apr 2022 04:56:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42B93F8052D; Thu, 21 Apr 2022 04:56:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::702])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC408F80528
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 04:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC408F80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="Fm2xVhCa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBL1e/1eezdQ0jpozARLXQJ6G2cb8qRqfo85Zeta1gyNZvOXDcbwf9SwCIu/PLgX7JBtNwMyLQk2BsVVtYqTlsAVdMGf2zBQDj49lXEgZ+gna8QHc/F6j/7QKGhSu2TujFZXgVCHB0RwqXj2opk4MAMeL3CAFQE0/p7DYeHjSLsnJv4YjFABw7bwLKnWpAAPWPUfN3GT1hwGWCRCGk/vmo9xiy38ujOAqxgxn5TDsPQETyYN+xmfSPWQbZqL27pPHCYv9UzFUo9Z/JU3i9r0Uz7u3WoWhcF8KTvZlZhEVu/oe45ULBJEcCvLNVwWNPx+Bb2SzDEvCCnQV+BHw2WATA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiU6SiHDM6fQwmllag3Mic0ZstUPfTOPxNma5lFnGmc=;
 b=FGU9vj/JJeVjIE1/vCzBS4dPe71fCnbT6CA3IgxVbBMFjRSCOMPtn05DVSaZycsPhTEZFH/jYVv+hYk9JW3tvf9gubIkpnaN1sCfMRGlxgEj4bTl7dials0W/oOQuM40F7q41w+v4gDqC1yGp63KKLkt1ssWqBRuN/ZTZ3w07+f5e7xyzg5oPOc9be0C2M2Fo5Q/Idr1evl338cQ5xqpNQYVeg6YuOKobPs2EW23gjk9NwVdTj+sroKHfIzyUK1elr92TuHdtMfGjc5Z4zJjlj4BuFj20UWMem1m8oW9xp5zDAvnvtK8NevPHMu5on4MzXsRWG36+nmgxY/282AjIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiU6SiHDM6fQwmllag3Mic0ZstUPfTOPxNma5lFnGmc=;
 b=Fm2xVhCaZXDSJ7djudGzQIgjOQWEjEAzFKWmYNJcFlMAK+LqFtuHnON41TJuR3NtqH/GCItomYB+kIMCRORsT78XglmKIx0yR+83WGoYRhjJSB4zg++rNqZNl+pkArbIuYdw+46VucFXHFUG0IqfnysIa63oCEOw+9WeWG8LTi8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY2PR01MB2314.jpnprd01.prod.outlook.com (2603:1096:404:10::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Thu, 21 Apr
 2022 02:56:18 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::697c:9b30:7de5:706f]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::697c:9b30:7de5:706f%5]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 02:56:18 +0000
Message-ID: <87o80vgn5a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: audio-graph-card2: indicate "Experimental stage"
 warning only when successed
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 21 Apr 2022 02:56:17 +0000
X-ClientProxiedBy: TY2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:404:56::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23253f94-e1f1-4f91-310b-08da234281d2
X-MS-TrafficTypeDiagnostic: TY2PR01MB2314:EE_
X-Microsoft-Antispam-PRVS: <TY2PR01MB2314EB4A33128A8BC1B0CA70D4F49@TY2PR01MB2314.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +rYvI52brCBhOVr0yWkLD0i+lICMo3blR9346Cp9zvUeF02NhzAeEuJQl6f7vcOItmlwemzwiGrOcXupIdsvbwNSrrvOKoKlLLC2xvOq955rxOooFxRRQBkxp1WOJrjYM3ZpPDI+/REA4n2k1kOkhx30C1/awv99G5v324WDKiCNVaiNS5+Ei+0JPYVYVZM3JUm2jHqtQq8JcGaFCMijs0/zTA7VqekJIWxPBZjCsRIw8Ciq3F7XHC1Rqfow7tqYNyFaBAyNGZfQ4a12lN4jPmGh1hvtkCtxmoT7gSPvoblNMoQtCfdwP5pPCBztK1kM5pdfsp4cl+vh+gCKs68yXno6KEnmR3C+4rSyPvtHV5XKN03bkaxQfNi8Yf+fthlAL0LNwOagJyJxeC8cJ97kKXmzY8zITGlocCbsqUG104cgYIGH2CpexRmfz3hbrBqAs1oy3i+gKJOoczOBLplcfH5F1LjGtd4GsqZtkqGnRuQ/RZRN0N+olMgP1m58no4R0iPakoKBNzg6wyOlx6LWeB8WMeFBVcLL9M6wDgMN8htPpp4rBqV9Wi/M/DlVcQ6Tq4E5eh5rId3vMtwe+LR6azfbVqYK+aKUx3DmsIYOLSuypY6KU8zDP30YaPgYFLckdZ+cC7Zn0uIb2MKtG5JPtGdLim/DZ89xT7IFJEV1L/MtAN3Js9gW/3qho95SWyObLyjsTaEv6Fjtp3g9/G2gvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(508600001)(6486002)(4326008)(86362001)(52116002)(38100700002)(38350700002)(6916009)(66556008)(316002)(66946007)(2616005)(8676002)(66476007)(26005)(83380400001)(36756003)(8936002)(2906002)(5660300002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sMJ7euLQO4wAm7XNLyDB5qyrRlKNcK7TeOwnQ8G82wuNR66gEkF2sO45aQV9?=
 =?us-ascii?Q?MOSLEQV7snfpZ7fGwh2ztq2OrPt7aKD9JypaEjka/DaDK7ijD+i2uzEJN6nY?=
 =?us-ascii?Q?mQhFSea394sMjktozQxMSB6MY7G5YsD7gyrnoGNWoE7v8y4h/G88kDRpvVNK?=
 =?us-ascii?Q?SriLdmaGQIJhhmDcwGtqtACRpz2/FfhFsmeeRgt9CPgofTwdgCr/tuGMyxkp?=
 =?us-ascii?Q?qvz/fMHrkECjexdXCB5QzhAb7jx1EYGnQEoL0hKI0VikoFIMvuDiZ0/S2ch5?=
 =?us-ascii?Q?FSBjc6l6XVUb/Uq1ALiKGyJEC0qYj9d85b28v5XmdZv4tVbF97BOpCWWXZCy?=
 =?us-ascii?Q?5HjXKWkOZsKNOow5jREqSnWIqPn8ofydLuShHuY8n1Zlj90zm1KZrEkqK37g?=
 =?us-ascii?Q?YRQ5Dr7MsWe12NU5ZTPLK+emkqd4biKxYTY6wGEv7MoMtFKKL2rcn2VeQ5VT?=
 =?us-ascii?Q?K+KqfrI2aMAU+CSffigQeoLF5Q6aKJL2gLnUz5JQVzJ11jaf1e1pSbuCi1Rj?=
 =?us-ascii?Q?7H7U8Z9k4wMRQXfnWvfpnWpYoh/oYb2T/SlQmHVjlxpbYrhvyKkpnnxborDW?=
 =?us-ascii?Q?g6I8LA7Nqlz6Gwbdf7VWXSp7800RmbMJZvQnBylSBAfcKGtOeEjDszU4O6Xc?=
 =?us-ascii?Q?KII3m2VSiANWAUo95fLfQoxU3t6M/p7tsoHBzEj9opeHPLaiq1ydzf0pUk3V?=
 =?us-ascii?Q?VFMyAfkRpYo4ycwyVOxCTO9eV5cXVLkSZhRioPmvf7LIaXBL19e8XF/CRzsj?=
 =?us-ascii?Q?qBmchbqHenQhrN7MQuJsQ23GRLQPKUiaRg6rfxsI8PRLbiACQIa/BcFrchYo?=
 =?us-ascii?Q?xBSA7KRyg5Vi2RiBs6hVb21sVxpLkNu+QdFAlM69mkehBepenYJ2z48hP3Wz?=
 =?us-ascii?Q?7PO+7AQ/M6H211wRp9rSvD1N5ynU21bp09i9BpO3NLYLkUt2qlNapkyALh5J?=
 =?us-ascii?Q?GXaiJZ65ymHFmCAr9aT7I7GuPLPs8PxEEnQKItL/CKYJmDS1naB2mD1l5R3n?=
 =?us-ascii?Q?f9je15a/W6o6zXBsfGOA4gxeexlmR+kHRoTWhiyfgnv2qqUl21ja8NCvtie7?=
 =?us-ascii?Q?hZ/nA7MOpCi20sw0Kkeao+a4xQinR5IrPR+LW6mwDy7piJYfCSE0hUWYFQxk?=
 =?us-ascii?Q?qHOLWQwAMcplCW999XGrTA7I8S3j1onWjiJ+R6xe+v6ND+QfyOZFZ43T7OMJ?=
 =?us-ascii?Q?5p/1FlfRyoS+jb4ppz5ug8hniCYdMc+xOnjBvKAUhwmWEiqSD+wsSj3n+jUU?=
 =?us-ascii?Q?/TRdlvbk2L3AlX+inLpk5J2qbDp/e1ufgQQGE5ZZMJPDsPkmWpyEr0V/3+I/?=
 =?us-ascii?Q?1wR+hoMQvlMp6vqvpw4lzRVSVg4tQ0pMVH//3YwrrZqxu9gD4dff2gUzcnp9?=
 =?us-ascii?Q?YlxQ4yGB+NtYbhAkGRswGn+L2ofiLhDePetNardLUZpcIsVpbvZAOrmRuAaU?=
 =?us-ascii?Q?lYsOfP9rqXDYtK4zpYZVn8CkFfQ1Dd2DmNXELvZHIrCyYuCnkhdXczfKdKZ6?=
 =?us-ascii?Q?YHvb3ayOc0bq11oJZhpH5eepgSY8d8AuVLci9vAaQB8jdlRpwshz6/dH8wjB?=
 =?us-ascii?Q?xg1dux2pxPIONp42ukZyHE6dXNc/4IY1SdB0LWuIs371FQcJOWKfxZu4OcCi?=
 =?us-ascii?Q?LA82G0Q8P6U1vIWRPu5Em++EP5DypZBjlWMR/T3ioHdR9GK82im2I7/GTViT?=
 =?us-ascii?Q?H/d6/KRkBf+HcAQNGMm1RcBe5YN0yBn/ZxUUlE65x1fI38aFEz4EjCD8JnGy?=
 =?us-ascii?Q?VyTnALTvgIN/I6ak+X4ilbL0si98R6km/nW9iRXUc5YoDoLuCpvI?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23253f94-e1f1-4f91-310b-08da234281d2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 02:56:18.0758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTM3B0lAS0jX4GDFXEE7KBVkHaxR63qt4O/JXsrakPrN6v+m4zC3yIVcy9AId17yQAJ9aVw8GUL3Hh1aZORPqrkazCzevptfwvZyz8k3Fy4Ht1f/hysTaGNrvfU+lfu/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2314
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Because Sound Card needs many drivers to probe, current audio-graph-card2
will indicate "Experimental stage" at top of probe function even though
in case it gets -EPROBE_DEFER, thus it will be indicated many times.

This patch indicates it when probe was succeeded.

[    1.601393] asoc-audio-graph-card2 sound: Audio Graph Card2 is still under Experimental stage
...
[    1.721269] asoc-audio-graph-card2 sound: Audio Graph Card2 is still under Experimental stage
...
[    1.755231] asoc-audio-graph-card2 sound: Audio Graph Card2 is still under Experimental stage
...
[    1.907710] asoc-audio-graph-card2 sound: Audio Graph Card2 is still under Experimental stage
...
[    1.933173] rcar_sound ec500000.sound: probed
[    1.948875] asoc-audio-graph-card2 sound: Audio Graph Card2 is still under Experimental stage
[    1.959558] asoc-audio-graph-card2 sound: ak4613-hifi <-> rsnd-dai.0 mapping ok
[    1.968119] asoc-audio-graph-card2 sound: i2s-hifi <-> rsnd-dai.1 mapping ok

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 75a1aeb75d2c..8b11840d810f 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1174,8 +1174,6 @@ int audio_graph2_parse_of(struct asoc_simple_priv *priv, struct device *dev,
 	struct link_info *li;
 	int ret;
 
-	dev_warn(dev, "Audio Graph Card2 is still under Experimental stage\n");
-
 	li = devm_kzalloc(dev, sizeof(*li), GFP_KERNEL);
 	if (!li)
 		return -ENOMEM;
@@ -1240,6 +1238,9 @@ int audio_graph2_parse_of(struct asoc_simple_priv *priv, struct device *dev,
 	if (ret < 0)
 		dev_err_probe(dev, ret, "parse error\n");
 
+	if (ret == 0)
+		dev_warn(dev, "Audio Graph Card2 is still under Experimental stage\n");
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(audio_graph2_parse_of);
-- 
2.25.1

