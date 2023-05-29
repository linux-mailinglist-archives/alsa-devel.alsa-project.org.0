Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD86714175
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:04:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A660209;
	Mon, 29 May 2023 03:03:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A660209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322287;
	bh=jVO+YGsbwRnAzy9jREUYpNMZuswwebg6ihl8fGfpDtQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M93lDRUxlatmSNsgqMsxBGcOJuUeBN2jGM/rsY3xBmC6poCtWag79mASzKJ755Z0U
	 8eTCAwm57HFjTd6hTIZu0Img4Qrerzaq8AhhK+7xQvI1dPCU7N4I0xBl4nhBlFub5b
	 4kjHzOCobDXbBXFz/IgE1UypeC4/O7bQLgKhA3Kc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48D50F80589; Mon, 29 May 2023 03:03:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 474E3F8057F;
	Mon, 29 May 2023 03:03:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9615AF80580; Mon, 29 May 2023 03:03:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20717.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::717])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BBDAF80579
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BBDAF80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=GzK70zXE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESP1F2QSCyJ1lFoCQwkiUVHDYC4pzm5p/abMx34+z39vqFROsoayCNPXOSmVbK2Qig0KwcXsSdZZMFWYvKbgoIFwWVCPj9jmQJm0w+cjtGNCJytzpgRC00Yp/t+P5hIHHEA76Oa8RVs/oL9qnYVVciLIg4RAOZvCQ9haAJl+p3o1SzcglHJIrUUY/504AaxsIVh+B1dLBGxljY4hiz93DTxZVPjFULYmGi0QehRoDsb8TY/6daz7SDzJK3Un0IYl09LXmoXc6Iea+PYvAzkRnAdwTLdeWmjEiignjosRXvkBF0kkSdp/MlF5SP6JCyq4kFriEaq7HY7x3BZ/Q0JVhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmQ6mb3JrwoxbGRKGzZ43ikrzMM7iiARHn29Pvf66OE=;
 b=dKgYEmLCuDlWuqzRfRLx0nwmm6+rNugDWIX57ke5iOIIsx3d2Jeidnbm+S3RBqWX3RlwyxkGT4ckF/77M1HdT+XDl8USJHA8vNfuCCncJfCpgN1JjAP126mvFkrKjw8ouz1JfF7UDK914wKCdynUXkoOOrRblvKUVJj8B449IJddkobmti6YjkJT95evXmMfZ0Z1D7K1Evw4XUF6LmXRg/6PwU8uu4FE4KrpeM/a70060vbmiCeyJh3kqgJAct6+aFjfWf1J3rHqb7gqHueLHB1P1hQrXw9HToMz6T790MYoDmsWbh/qlfz4EyhUedZpL04c4AuJHBQ5yu4UyhwNKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmQ6mb3JrwoxbGRKGzZ43ikrzMM7iiARHn29Pvf66OE=;
 b=GzK70zXEKUB85QDT7zrltUnJmea4QTPpttRC7ejc13Krlb/npJzjq4pP7RBbP9DXWHBS+WOrN8WwL+bqF60dhOGxZcBo8t1GulBNeX0ZRBPz5zWHO0ygqpFmNRtryK8fIBUKBmpAZU/Agdz85wyeFA8vI8nGvGBi78slVopmNRI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8658.jpnprd01.prod.outlook.com (2603:1096:400:15e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:03:06 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:03:06 +0000
Message-ID: <87jzwslzjq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 03/21] ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
 error
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 May 2023 01:03:05 +0000
X-ClientProxiedBy: TYCP286CA0222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ecce9f6-59c0-4f7e-60fa-08db5fe07609
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r8zsI46HwiGfTWi1Z9STH5mOg01BWuYzUzmEIR95DbzD8dXnd8XxVdztI5mE38bla74cDWZjtDmj7uPxKHaaZtn2UNBeOddJ1JYatR9X1qdRnh/6gQ1CMiyF8xXRIjzT2wnHXM1jUYuVg8B3ZlNhkv8RDDeNaqXlkWkw9CPd0oLzQBlWDaRLQlmGtoDJpcOAa21wKO3GZlYOFCFKN6NRtLaqnnhq7h7UzUpqqSo8BKUxYARMrkZA3VItKxYwgx6SrXVf1Bmqx3fED4m/C5cd5LT2jvsmfBgPdzsDv2qtmTHMJs/jjPSU3bmCxcu9AZhNET5i2UGrJbJWtWHG6m/ojyM76S9pzFYeehz4cH2ATK7uY2WKPrxXKPkNPkemDZtlV/Nyb2uZJK1GaBdNeiKT/yMy+J/VTx4YYDywy/piWf4Pss2pcjxK/JQdTILAk9+05JiBpmsKl4anL0aX5eOflqOvPCQfRy20gqK5ygfmXkxh6/IVFigxVBMWpsXlYUDfQmiQkPhhyktXmAXP4mAJLV2gUNxoT7L5Ms0lmJbpPKkKJeK06BU1kgPa3fu1fDAY+liDNHrAH3MVnrJXZfFGPQWaGfIN7zLZRfTWeUvrba/XolD+08LeO0GpMl2JkGRd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199021)(26005)(38350700002)(38100700002)(41300700001)(52116002)(6486002)(83380400001)(186003)(6512007)(6506007)(2616005)(478600001)(110136005)(66946007)(66556008)(66476007)(4326008)(316002)(2906002)(5660300002)(8676002)(8936002)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?eHPq4O7X5oHAhXI6ngGlZgUtcNr3kYvzM8k9zhZ0d44Oa73q5zZqsrPCD0?=
 =?iso-8859-2?Q?OzV3R5qRnD6vNdV42ogQSAfCzOOojSuJ885QK+p3hOhKVfONAkvmUM6Her?=
 =?iso-8859-2?Q?MRQBweFSjI0qtb17xMekxLwlKdsamZG9nw3ZyuNyy1JtvMzKkESV6+HMBy?=
 =?iso-8859-2?Q?Zy/6amHZVxn4FFs0W6Q+1CNZPzHOD4zjLGkGIjDYZ16y3uauILq6/Fg00G?=
 =?iso-8859-2?Q?RTWit/es9Cw3P5sJIADb6U7pN31MkkQfzM8gRTP3BFgr2F+3WMF7E8FCFR?=
 =?iso-8859-2?Q?P9KzoWthHoemKjeU/WtPkMADTeZgj9pZh5AWw4h/4i5WNnNvTwQrMtkm1m?=
 =?iso-8859-2?Q?cNdjVMHWEBzCmECqu66yxpzaTQ1JqnnkEHYPT6ursYbsz9+/OBzG6GwXSk?=
 =?iso-8859-2?Q?JyjHp4dqRcllVbocMc2o0k7XKALHXlBEJ7Naqh2l1WiqvBkV2/03ZORo4M?=
 =?iso-8859-2?Q?bc0POCyPgLYtKd8cGQ/yV8/SrUI6f6YMGl55vFfFXzrB4BQi4AaBwSEI8w?=
 =?iso-8859-2?Q?eLlDqxHH8XiB2mLFieiwRflrY25Nqit+1DdTp7OAqPOljeCnmBzMYHIefi?=
 =?iso-8859-2?Q?Gxxy9ApCjB5ZMjWPu3xJib3LvWIj1n4JEtnlIvdvtqpVmk6VZl7Gle2plc?=
 =?iso-8859-2?Q?dq15bcVSE6ZvFdlJCDDHpsq+feDJBKzWxLfn4viNsC40X8hYMiWNCO7uzA?=
 =?iso-8859-2?Q?F8t9qqxwxAXx/ggiFEQPi/YWNs9r5zLZNA6hYgjsljFGzAh15HhqBVPIFk?=
 =?iso-8859-2?Q?D/HwsmI80ZCxO+wck2c1tFEORCWZFgzdoUOI+eQWj2VK2tiUKhbievO4pr?=
 =?iso-8859-2?Q?FqAbgHMm6umFLHHVa8ga8Wn426B08qvcJaol73MIC3JX4xRiJaf+/W13pv?=
 =?iso-8859-2?Q?+onb2YZ+xeYYP+a8MV+Xv8521txnNoBt5zmZ3+d8oQCjE0ls1GY9iQpY9g?=
 =?iso-8859-2?Q?TTtZLCBfl7K3nQWUEMzlRTa1N+J1BrVj0cEC8wZjLXP0BdCFkD0fPOzh4U?=
 =?iso-8859-2?Q?bN8DDQJswk6sQj4iph4YmCnHR4Mf1TLLbx/VZbGTGnjMHYQkFwuE44HRQH?=
 =?iso-8859-2?Q?hdEBCQD9C0wZfz6s2vmvnA9SMZbu+JxUaOI8eN0agxR4p5b0Wwah2tsBnQ?=
 =?iso-8859-2?Q?VgA3lYbbUTBTPPcHYettVxoe2Ty6in+KRuGgG/FZD5pV/92liEuZH9SDyh?=
 =?iso-8859-2?Q?RY9Y2N6qr9kuhXW8dfrDANt/toLFFg1Ysm6zcnEOjgszZYlYP3fncKBCVk?=
 =?iso-8859-2?Q?l9WaRJJrKegH9N9agh1XWyet9sHjXdmXgW4WEur5JIow6cwP9g2lhsceAR?=
 =?iso-8859-2?Q?LtHH4OAXC+1IiFIS3duODuvqT+/9ifpMHYJJ8llHJvs7D6UGiFz801Fn4i?=
 =?iso-8859-2?Q?rhC7dRlCGkWCfPZcNi2ZbZq2etBTenYsG1aS2aJYcrilQtqtd7yp1NFv+b?=
 =?iso-8859-2?Q?fvpqmcgkDAlo1E2ef+/Wy0lOOA+zckSvqnGiNO2mtyjujsocOvc5JNxJEd?=
 =?iso-8859-2?Q?MTjCoMGW1sWrbx0a7TLH+XzTmdBSx2ed+sinwX/33ppQwe2ZFGSTPEvrL6?=
 =?iso-8859-2?Q?5Vk0wV/ceBOb7t5QQw3A7I3oTLKPU6HWyDqDAxyizrVeFGXO9proZ2M1vN?=
 =?iso-8859-2?Q?SjmI7qwSwij3XYSwcY92FXqJdNvoWoEJN+1fiqnPSNUA1V3IsuDMUF24DB?=
 =?iso-8859-2?Q?lKCtojGDvtgRjiSjZLM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0ecce9f6-59c0-4f7e-60fa-08db5fe07609
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:03:06.1578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OdhnIRxoJ+CxIqfDuAsZ3oIQWf9Z3rWPWnaKWUAHmpOdcU3YVWoMIigo1nAPslzLtwAGs60TCjNnmj7bFpfpGSovEVZJIegT19N1wf2IH71DUwbCp53HfPyatZ21wShu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8658
Message-ID-Hash: 6VKXX5YLGSNZP5JJTA4SQF5JIG4Z56UC
X-Message-ID-Hash: 6VKXX5YLGSNZP5JJTA4SQF5JIG4Z56UC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6VKXX5YLGSNZP5JJTA4SQF5JIG4Z56UC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() (A) checks dai_link status, and indicate error
if it was not matching (B).

(A)	static int soc_get_playback_capture(...)
	{
		...
 ^		if (dai_link->dynamic && dai_link->num_cpus > 1) {
 |			dev_err(rtd->dev,
(B)				"DPCM doesn't support Multi CPU for Front-Ends yet\n");
 |			return -EINVAL;
 v		}
		...
	}

We can use 100 char for 1 line today. This patch cleanup error code line.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-pcm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index db3fbe1af2ce..47da3be0ff46 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2736,8 +2736,7 @@ static int soc_get_playback_capture(struct snd_soc_pc=
m_runtime *rtd,
 	int i;
=20
 	if (dai_link->dynamic && dai_link->num_cpus > 1) {
-		dev_err(rtd->dev,
-			"DPCM doesn't support Multi CPU for Front-Ends yet\n");
+		dev_err(rtd->dev, "DPCM doesn't support Multi CPU for Front-Ends yet\n")=
;
 		return -EINVAL;
 	}
=20
--=20
2.25.1

