Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFEC82921D
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jan 2024 02:29:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D871E76;
	Wed, 10 Jan 2024 02:29:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D871E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704850185;
	bh=u5RSWu6/TEXbQ3G4LGt18RDn57zlptfssGyO+A2xbco=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X2sVY9+PrzWzZnOkChHJ8T1JCGBIIorbYlUTJNJLhwSBKidI3KUJbBl74kW9D7uPa
	 SM4EB4BEnEdfCR8EST+vMzGoDLByDgdHgpJlpClhsWUkUD5yePZNCkt6DAz9GRWAD2
	 u7zZcWoNS3ZhZummxVq7x4DS4/EWG86AK6V6+kIM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D50A3F80618; Wed, 10 Jan 2024 02:28:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 323C4F805B6;
	Wed, 10 Jan 2024 02:28:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 106B4F805F1; Wed, 10 Jan 2024 02:28:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC74FF8003A
	for <alsa-devel@alsa-project.org>; Wed, 10 Jan 2024 02:28:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC74FF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=D5MZhKps
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdQwcn3H9Y7FUEievXdiqnCdG7ylvEZm095XBHoD2oYY1MvvKNJSKi8iy+hwrmGvWKDq9XqopOrr/xF2wpxZ3xj7acbVSZNYB1Dj6oBFZz0WYdikk0Oe3JqmL21CoS0mqbITiRZ5e7UJYOkmEkY/g1fFNNqsmNW3smj0kga5v/IKnlhI3RmsfznHF5w9Rzsd9dq3gZCGgaMTGOk/8Cnmx3BsfuLwFd7HK5e6iYX2F3fQjvP7dul7Pmg79VTVSxcXjvl7a4pZr6aqigywM9q23Us0qL56VNXV4TPHAZ5ksUuKHMYbNKWFIUThfarXJkIrBUhW5IhzFyb0XDuP50IfjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqj65RgyW7bJI+idL+WyiS+7AXJyjx7BF3Z9ipNxKVI=;
 b=jXcG7tbkxA5eeDbzj7Ihw2zZuhMQ95Pr6Mp6teoyfbxbQCEdf3kCE6eguCo5lGuuykjfsMrEEyPYCUZrbj9lGhfUqPXxWgKqfbsdyegWX2514rnNfSLdvVmTYY0IT3g3TsEpcRueCJTPsMCY3gkkU4n5D493I1c75q/TXFxkKkCg6hvvAneeCmNfq+HSnqHzIEJQx7bIC1UFTCunXac3fXUxe0fvKiWJ31KqLnJTZknDjLlR7AAxJWZ3eKAJnbgkfrHPZsauIkLH9hLTUdGXUFlp1SnbdHvBhZGB1gpVAW77WIfeNns9n/kW6zV/cQPZfQLoSzM7vmIffhlvXXSDmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqj65RgyW7bJI+idL+WyiS+7AXJyjx7BF3Z9ipNxKVI=;
 b=D5MZhKpsY6jvJPhdFzfXvIXbXNJxOvtczdBCuacAI15wfLjRjb70o8Beb2eIkKvDULbItPzrHm4OjnJP2tbenVeDgxrJZQAeBZHhe+SM9aTPjAWlnietqF8cYx5o5MoeG+uBqpbJL77qdTTCzMpmcO/uh1ASCIUtnCaRWXAD1+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8341.jpnprd01.prod.outlook.com
 (2603:1096:400:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 10 Jan
 2024 01:28:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 01:28:17 +0000
Message-ID: <871qaqgeof.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <877ckigepg.wl-kuninori.morimoto.gx@renesas.com>
References: <877ckigepg.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/6] ASoC: sunxi: use devm_snd_soc_register_card()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 10 Jan 2024 01:28:16 +0000
X-ClientProxiedBy: TYCP286CA0206.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: fe43abf5-f5c7-4421-eab8-08dc117b6bff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zez8FOLYbyb7T9C8zDKtWf6HSlRJ4LziKD/I3Gt3xfjLLu3uDqq1R2GqjbMFjMIRs4ULz1gzTnPdyl7HE23KR6OW2Dm1Mdc3R4LtvofSMEDTl0JjzX2Pk3e8eJDk0kXxeyf5bwph0esMXqG/JN2s2zwdtDn3ATSQ2UiyJe6ziQDsXcV2rIxSNO79c8AtabUc+2HM8hdC80Z5r0h8w1ANTsc4xgJKf9HgE9pDt9UPg5KoVp8vXGDfnHP598yzrNAhXmtkKQZxJhO93KKkIPqB4PmdJ0nO3stIh5NMYiucG8ZTzGhPUlaukwwwTpNm5kkXVQPo3kciVGi+YOZ1rxbUxCC3H2XCzSQtxkYt/GaxDeMsRITWe6bl8faslPz4YtZfeFOwhAIwjr3pnFVt7irulqIeemz5dnr/zze0qATxF/MOxH9Mw3loHl2qohHXn8GQhLxdRMUm3PSnXKHwndhWs6ec+5tNxN4sXxS+2Auc6Lk15efd7kq95ogkXsP7mYVjU6ITPw7EWm6UaB6MycFjmqRRgvtosWiD0A/xeGhfl//lgIUnhrcu+iJOwNkTeBZsFkoTxiGfAqABnFaepCwrftrKrFuqP8mDhrNsf/596LtNTB07KQChJN5loCczieh/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38100700002)(38350700005)(36756003)(86362001)(83380400001)(2616005)(26005)(66946007)(110136005)(6506007)(6512007)(478600001)(52116002)(316002)(8936002)(8676002)(6486002)(66556008)(66476007)(2906002)(41300700001)(4326008)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JruDj0dCWtd5tBRGrcHklOY0IKoyqVXs9Ier4ZEMb6eS0lVahZIppqD2MI59?=
 =?us-ascii?Q?jJfanwQtUeoDifaTj/CRXFAiF37GucXghjcXV7NRQWH5gM0z4s2ssYzEerYo?=
 =?us-ascii?Q?hsryObEIls9RKNZW/yDB7JyJzQLHUlY4hqQR17ch+lec/df9dXdVrCBK+4xg?=
 =?us-ascii?Q?mSbGvkVvQY6zJYVsLFo59AcOYu+qpZRtWSlXPQBnoog3qcoMHtw8cqJOZXUV?=
 =?us-ascii?Q?g5Ke0MqmYrymJPI0U4XVySoOXpGBMlk37BDjle0jdZWc/idZdFNlpXs3deeD?=
 =?us-ascii?Q?NThjue76qs8XnAQ3Zkif0dXaqXZKfpVKyOLk7kMOFZHC87x+KKEBvWrRat2H?=
 =?us-ascii?Q?NBEFWMNvcbuRmYjq9/StVLp/TaehfnD3EGPghT1xYlV29p8N7kBGJ7HeFFtG?=
 =?us-ascii?Q?ES4xrNIP8WviKjOXdPubPrrSXyzDuaY8YM8V6XoYJ4sY/K1PWy5A7zS7KTUv?=
 =?us-ascii?Q?nQvCDQ1dYxlNElV4gnmiRIQHraB5KCmkUR1py7vpvDXztKFV2Mhvt4fKO9h1?=
 =?us-ascii?Q?rp+otiQnyEQ/RgbZJ4fzelR0rUQ0m7T2EhejJLzO8OEgLNxPFSSuhAja4zZ3?=
 =?us-ascii?Q?4fI0w0+OBu1isw7LnRj7bObSOKQ/3vNAm0kHnzjbzADH3gfpU28nIOt8FQIc?=
 =?us-ascii?Q?iXwt+SSNiOQY501U7hGVCw7+mtEoAyRs6GWSsc/xv4X4UJ5wKfkcrQx6kK9g?=
 =?us-ascii?Q?G41XUFgjMT/Q96JrtUVqBwPQ1Ak6pmvLhiCWN5Zpum0sc20bhFoNwvHUderJ?=
 =?us-ascii?Q?+JJxnjqskWZONgHJRcphchCyWnHEbgGdcp/e/cWz2WjcozfZ22ixVFRjx+uY?=
 =?us-ascii?Q?7vZLVEuvniocQz2VpSJfaT8Sl4cE8BSwZPb+E0NCXRiq0UUHot+rkNnp/7UM?=
 =?us-ascii?Q?smFcQ5ocGqfJfnaHkYiXsurWTvRk0AIlfiJJY0klc8/r2MvO/tbse9XPc/AL?=
 =?us-ascii?Q?itdbD+US7adMeEWLGodDpwbg7i4R9TqqbEdtWWttW9qDITFk0iWTTZFdVcxs?=
 =?us-ascii?Q?IGyES3lJ+4O+XqJ1JtoITj4eiZktX8ue1JKcr6XgxlCAXEgQ8AfmMBtAXLWe?=
 =?us-ascii?Q?zHAwlWKQh3J7PdJ+cEykXkGt3rxYv2MDzFUgmN9q2rRX6Ffok1BaqN7V/fwH?=
 =?us-ascii?Q?zs5IaCzwAhLNkI80Wx5SN0sLXbCl52nETy7YNdRKDbszVOO/dU0NORA0z1Jr?=
 =?us-ascii?Q?1tYQhhPGPh/S4WWcWV4ZqySv++S4wCIDr7V67N1ovYoPL1mef0PTVxHxuKQY?=
 =?us-ascii?Q?D6o7cE22qqSDuH4/k3NNMjtncoPT3l5KuPlFe65+uhk5uAVjgXKC4+iKF8VW?=
 =?us-ascii?Q?a/FM3Jdtslc+43EPpF76Nmq066wun306DS1txn2g1h94I2PzCJFZ69lwivCZ?=
 =?us-ascii?Q?v1rSOqtvD0ULY3nUzWMnulQ4I9Q3dTwN3L8E8zjW33dQdGoDy9nQabvVylFg?=
 =?us-ascii?Q?woYWYlH/dkrak7cokbd2K9DnFwfEKxGk835AWUCddom6OmjYhTbDbdLLFUKW?=
 =?us-ascii?Q?GRcTvhNAocwb9MG13s4q4V7MKbYXJyMKOilo9a+GHIh2OvIdPxMJe3+2aHsZ?=
 =?us-ascii?Q?VhxW6HTtc8huwizu7lA1PfwU+CpIFPkeNNfT+/mq6nrEiSwx0AXVADEzuWcn?=
 =?us-ascii?Q?RbBAY0fghzPtbDhpRyD9bUY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fe43abf5-f5c7-4421-eab8-08dc117b6bff
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 01:28:17.1428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 D0XbjEqmTUwP52BzHC9p7TJfBGvvYW0b4IFS6MWpC68AhBOT6lK0mr9BtsBHEgMAyrHtkC8zr7VYo2eHrDWwyM+uMwtWYWQosIBGiKBE0lNdoAxLjGNTVEogsz6Yv2ty
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8341
Message-ID-Hash: DXHBHA54LYVGVDPOHAWKEJD3U6JUBYQA
X-Message-ID-Hash: DXHBHA54LYVGVDPOHAWKEJD3U6JUBYQA
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Let's use devm_snd_soc_register_card() instead of snd_soc_register_card()
and ignore snd_soc_unregister_card()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sunxi/sun4i-codec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index a2618ed650b0..f278f51ff68f 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1805,7 +1805,7 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(card, scodec);
 
-	ret = snd_soc_register_card(card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret, "Failed to register our card\n");
 		goto err_assert_reset;
@@ -1826,7 +1826,6 @@ static void sun4i_codec_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(card);
 
-	snd_soc_unregister_card(card);
 	if (scodec->rst)
 		reset_control_assert(scodec->rst);
 	clk_disable_unprepare(scodec->clk_apb);
-- 
2.25.1

