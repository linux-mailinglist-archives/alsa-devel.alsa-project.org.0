Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C48382A565
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jan 2024 01:52:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F4AFDFA;
	Thu, 11 Jan 2024 01:52:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F4AFDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704934342;
	bh=d7uOzJxjsRNEFFPORUmUYkeW/hZOJVYlExWtaYbSvjk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AvlM32N/zQWK83+quZsgUnhfHU8zr5BeCflpIUIQ7mJy1gLN7wk7j/t2ovKvf/rpU
	 XGcF1BHtF925IKSVZHMcChTo5M3uS4o4oIEbhGYVlzWPAc6oADLUjCSTd16rySRITN
	 ip5UawgciM+SK+uJGLm6o2ffG1XDDhalFqdEsduE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 041B5F805A0; Thu, 11 Jan 2024 01:51:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90A21F80254;
	Thu, 11 Jan 2024 01:51:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4ACB2F80254; Thu, 11 Jan 2024 01:50:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 722BDF80086
	for <alsa-devel@alsa-project.org>; Thu, 11 Jan 2024 01:50:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 722BDF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lwl2KI98
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IF18uE/VVTCJSdp6izkfboEzrd0EiHYuYCGujTR8psconCU1FsXgwjrCSXHWP4Ahb8u1xQNmviYR/sF0iTNqLRwmjDOw2aYBfWBsponylQxxdvZmnwqUzhIopFMhEMsvjO9nx+gROtdaFponZY8/lkfNfXcxKiAfBq2qXZuiPX6+PbYOpKPt8Bv2kwR/5M8WpNh6gHRJwLVkKJpdfNWX+548kg+z6SrI/agyX+a94uz49HSgtBD00YO7x4ZEiI9FCKYVU+oQFZdfXoF+LsfHR95LB5kqQoijZNP6PvYj+x6cctV8J1fa5l02usJwAorQmWBszT/PeVq1dbGOjTnOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p91QWSJrlgn0zYE5g7UQPaX2BOvogxbw47aAlSwdV6Q=;
 b=jMoj0yT1dYV4TXVbO//inhuqX6632/9sZiRyogZAkNe3YZWHVgISFHF7VyR3lYxLJXqyeUEh6BVCAfZFAqUj4AYQ+bn1Pkqd4Nh4vJkc3/3DNqksKC2JuIBEmg20Va5cRO7taLwSfmbeQTuMzlxMC+RwJ26CW6RMfjb8rK+Fku2m1t4EdUENfoB26uThX+87VvRPa6j26TckLwTW7UrIjQWo37I3V1n2iPDK4sRWRbm9dC54++9kXzsQeiSMGt3cdk0+M9/0qJLevBSorg1SC1RVzlgJEWnsL1itQwe0reXx2FqKZGVYPKm5GSM2aGphBz/qjfuZXacq64gfruQfwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p91QWSJrlgn0zYE5g7UQPaX2BOvogxbw47aAlSwdV6Q=;
 b=lwl2KI982TZXPWpvT384IIFUMUKJU2vVxmefXNU/PoSr+LrvB+n5W14QIfrJQ7Ho9sTwdKjm/RpIIQJ0GupT0bTs8lNXIcT0j+AZrdtrE5nbBaJca9frxaIL6ricPbjXgtTN7pYWxyC1gb1n5npblmFJ2rWelW7l9KzkAa8Ke/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10908.jpnprd01.prod.outlook.com
 (2603:1096:400:393::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Thu, 11 Jan
 2024 00:50:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Thu, 11 Jan 2024
 00:50:09 +0000
Message-ID: <871qaoy9q7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Peter
 Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH v2 0/3] ASoC: use devm_snd_soc_register_card()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 11 Jan 2024 00:50:09 +0000
X-ClientProxiedBy: TYCP286CA0222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10908:EE_
X-MS-Office365-Filtering-Correlation-Id: 425cc141-839b-4d0f-8076-08dc123f430f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t6s9gQzzr0vE2Y5vWuYf8qyHaW5EK9GyTAijqw4C+L43TVYtXlrMSW1kWnl9uz7E0u9mGiXvBaeou4dh+lmFauHciHzCGMVEi9kgt0CojWyiKxB4nG4byAn6XkV059NWheF3V2BuxR9xxfbgm8vkKVzJSyeHP0OGPT9Z2KL5mWrmmr0nWu5nIvfAC4qOchhox3D/0idQnBGweNWB6YUT8PNzEg0LbCAtEOw0nRcJUuU4saK+3f+OZg3Y/o9c+QUKtq2qJbotVOIf9vjY9bR7aF6NxfJXVVFO4FYtvlojf5w3IaXeL6uSjOzBW8qLR6oy/I6APDlej0pfI0I2Y69yIlqVBy8yoRJDjIxZKVwTBlcEmtInYUvQB4Q8Ssm9B1wSuUoOUQGKh59afHXiYLSZ54bLXWeiwFGQ8xGvCjLxzMxVLiSJpBEmNj7Pnt0huXh38qpBgqE02DdWyCPqeouWdJZ6v4bINQ8cFV3/EVM5g1yfD7LTKdrs2bO9zJGv/qwNX8vNM4idL+7fgi9Hj6jXYmhI6xlZCtWVrEai1qeaav0xxAlCyi1VbDWmfEvcAqqy+9E8A3nI0jSyGI0tGiLULrfovkZ4jYL465PcnzVBO/mYPRYKLOFxspdEWpQnAfLmMkaDNG3911v3t7iJyKUG3w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39860400002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(2616005)(83380400001)(26005)(6512007)(6506007)(52116002)(478600001)(38100700002)(4326008)(2906002)(86362001)(316002)(5660300002)(4744005)(110136005)(41300700001)(8936002)(6486002)(8676002)(7416002)(66946007)(66556008)(66476007)(36756003)(38350700005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xRNpXoIxExsrmMtK0vfF3T3QQmQsPrZMea8Pnb11TL2uNM0WjTrMplJWqbgW?=
 =?us-ascii?Q?v2h0gRE9g7I0rAE20CKcfULyKuaQM9t0P8/KJ3y1lKSjyElgkwbYA8Yo7T+d?=
 =?us-ascii?Q?efwWQhEoMBGvzFPMmY1DWgFrx8NaDrWNX7aAu1g9msCZWMF0S/qqyFgUCoX5?=
 =?us-ascii?Q?dSGJLOur0FsiipgOH5GSoJLfuafhlDQtjY2AoNGP3yTa4360G57wDpWel7Pm?=
 =?us-ascii?Q?vGm+Wz7JcbbM+SpzXM/5adnk20RYXKG5n4IKm+pDKOPjtigF0zDTa6sHCbjr?=
 =?us-ascii?Q?rZxc0vH2BheZRis0KtRzdFTUEmwSOGzvNJRwI/zkHsYBOa5Kp6yENsFAagBj?=
 =?us-ascii?Q?qQoGOc/Eb/1C9lmpd3BMroXs1WrmWyvaVEsWnwAZeZ2zUGnOoU7G08OZJJAq?=
 =?us-ascii?Q?s+Pz5xvyF7ODm9fnotriCCTJAFDOyLm5EmXUdWqunYr0ZDrInS43dfvAeHTN?=
 =?us-ascii?Q?sDZXIyCM5XeCL+7fOD346dmx7PV8YSKpUsjv+OCSh7JSr8/4RdHncDMPilZJ?=
 =?us-ascii?Q?KotmRcOO0rh75XWwvmFwB0c9m0QxoF1zsaurvjRp5AqLlsWv7OA8zfEpJuBC?=
 =?us-ascii?Q?4q2rqUmpn+lZbWlOp3lMQ/cFnso6JfBfHxsS5TzP3p7N6KmBBknkk87jUmUK?=
 =?us-ascii?Q?vnZLR+cY7Pfo+w3MsrOkFeo0uAKuYYCRdQTUHBd1mq7KBn91M/U+W1agiHGR?=
 =?us-ascii?Q?TvCjYzOoCDkd4LdYIzlcYLizLGY2LZC2o6ohN5zexYro87sJ1AbDpKRxxElN?=
 =?us-ascii?Q?jGMvDznXHtZndBMOzmzke0tCAm1aUDzMyxF9MnnJ0E2m227WiSmdNUx7eN0o?=
 =?us-ascii?Q?3CMKL6FUhSsW3tK722nzZqifIlH/Wg2yoLamEoEZPcyvW2l45nfILB23eEXS?=
 =?us-ascii?Q?9cFJ7nsR/ajcI0Y83NUOWxUOduh9TMFKbfDI8tF0fRD0Javrrjodti9TNqST?=
 =?us-ascii?Q?rn5VH/ldKOIyINtDQWLcIPMhWzUuhHLwONjDZCl1i+KHH8bnlrtAaOlYdDAk?=
 =?us-ascii?Q?hvWQL8qNi9jM/28L0dudaGAr5+uJK4457a4DIcw85j5OuVuDVC6MjHTqMBvU?=
 =?us-ascii?Q?7eA1Yy+7napva4t+nj6vLXl49OlT6AuCNUsPOO0gce4pcloQnatoF44NdwLy?=
 =?us-ascii?Q?71lhpW1eZZxgEYnunotJaD6rBJZQ+w2rZPKN+94EmW/BPX79U1kFcEia9jee?=
 =?us-ascii?Q?ad4IJp0AoGypX5kHmvARqnYB6tLsA9HwTJptkdFCCjN/8F7VHz90biIRVKBD?=
 =?us-ascii?Q?jhJRE6tJr5VFSeckYA/YXELxm5haR4uUaZJSZ8dRNfYmv8s6yfFSdTuJ1rgJ?=
 =?us-ascii?Q?Bf93N6hbkoH0C+nqEvnScLJRExNOSkK6N8AHpSsJCAE1ByPA3doQ7FUE6SIi?=
 =?us-ascii?Q?U1Yhd4vt3O8k8hRuLzgHbLi+QAibCvLr9LSN6Zdv5vk4RFVxM6euqqM4NJBp?=
 =?us-ascii?Q?uYdjGtWOsE7QifyHVp9BkbjsQiGzuo6j0qbmmaGlmPYRzJdUEh8Z/WmTqMiX?=
 =?us-ascii?Q?19WUOPNyUocqVtEuogb16ygoLfOCReP6zPXQxM1OWnLDtf+bvABmOD8NH9L1?=
 =?us-ascii?Q?I3t5ks3MR8xgqE+rYocCYAqHyFW++ni4+2hByp+m4xaxXHQ2aSjTh9myVaOF?=
 =?us-ascii?Q?OV08+9wJH9qADv4jwF1l80g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 425cc141-839b-4d0f-8076-08dc123f430f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 00:50:09.8461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Y/nD8C+dnoKw8QoiUpagFWmVQclXd8YgwSV3skgwBomF7RyVU0g1pBFnnZGUS3MS6vZzTPkjUM9s0my2Lzvaa9ulHCJnNXhyljtKkketfVQSUsnmb6P6RK2qs/mf0HXj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10908
Message-ID-Hash: 6LT6NYLG3R6ATDS3YZ6YIT2ACACCQZIG
X-Message-ID-Hash: 6LT6NYLG3R6ATDS3YZ6YIT2ACACCQZIG
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LT6NYLG3R6ATDS3YZ6YIT2ACACCQZIG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

These are v2 to use devm_snd_soc_register_card() on ASoC.

v1 -> v2
	- focus only simple case.

Kuninori Morimoto (3):
  ASoC: ti: use devm_snd_soc_register_card()
  ASoC: fsl: use devm_snd_soc_register_card()
  ASoC: atmel: use devm_snd_soc_register_card()

 sound/soc/atmel/mikroe-proto.c |  8 +-------
 sound/soc/fsl/eukrea-tlv320.c  |  8 +-------
 sound/soc/ti/omap-hdmi.c       | 10 +---------
 3 files changed, 3 insertions(+), 23 deletions(-)

-- 
2.25.1

