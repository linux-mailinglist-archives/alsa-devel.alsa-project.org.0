Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 249FD784D7A
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 01:52:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACCB784D;
	Wed, 23 Aug 2023 01:51:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACCB784D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692748342;
	bh=wSAMprRskOFzOc5cVfHXf3kxkUr+m5T7oI1nyJ+/uZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mNua92S+mgPZ0wY4YIFCKi+zofpLP00yrgbsfXIq8TnkQ1zeat8XB+U6lxrppsmyA
	 1dvFU6UcaOqtGnxqWfE04bZRsJTI1HXGsYZ0Yth4ABh4O30N21Au8NZZJCVtVys9qF
	 N4BEm/JkIOHaOOW8/v8cLSGsnqCSSrpjVVUXRkQo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6500F80567; Wed, 23 Aug 2023 01:50:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27A3EF80563;
	Wed, 23 Aug 2023 01:50:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E79AF80564; Wed, 23 Aug 2023 01:50:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3ED88F8055C
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 01:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ED88F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=FGNB6LGh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DA/Vp1Azh6kshjBTv2fOeUXthUivCQNOOlFWakuXWtPSOgO40VaC4FzeZg9tbZRVC04MF5Gm7bCzDnDh0IGvFuqlL15GJ4Fk3mmUUJTqFemZ/QsFP2/8+GmvLYFCOPmsyMASEY4EL0vNfPCqLxtj4Qx5r0fNeHMx6Fy6HoYlG6CuNSY/8pUeKdZ32WinzwHJQrYXqcalqoBE5UQuIZg4TgiihWK6udig3auB1b0aQVdjtdsGHIDjbgb79n9RSuLoLAT3QoSiGhXtXmd/C+Mwo7W73boE9AEA/wtITSF1mapda/sJJIKH0sLw6ZJJEqblM926eH8tyZxbyuqBf6CX1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmQJmp2q5xrEN3LpIUr6Gfz/kz+vguvS8VKtpO6RLPg=;
 b=LYjQghWIrx/3Jyj27XiHsCjv7CLch25wsV+kWY+zEYmbYR58C2U3OUSIPSvvJMNQGp5EU6Lum8JNUGXWwWdwH5LWsBmfgZ0RmIB5tXF/ZSj4MZ1489ZRsEI5bv+HfZO8w5DnZ3typEImtQL8s1N0URaXAJrlzjHSjZq5TbgRCNG5GkB/4EB3W8AsqdHzz8h3N48iur36PXiIgxYReCjWIdh9NeRQazwo3ReH+mjdIpRmxFzRFjDVtkdYl3jecws3ejjoZdhi/EsCFdo4kFR0SJ+HECykMuZ4qt4ghB+ctZn0tS0f/0MgfnYXYklFX3DXyErzE4pkCrFPbOTbf2c2zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmQJmp2q5xrEN3LpIUr6Gfz/kz+vguvS8VKtpO6RLPg=;
 b=FGNB6LGhoVprwEAhqn5GVgyRV/SYvpKjnP+Evdpm13QQ+VbKbRSBCs2du08t9QMR8fLMb4jrAYgHZgJGJyqquNmisFUo1pXkjeNj7e03EJ4Bcmg8Sm0S0zg0nVy2eXB9jfofqyLGlSjZVF1e2PSdstFWOlsxpJviLHtIfgIIoho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:405::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 23:50:37 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::7b2c:6f3a:1aa:79d3]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::7b2c:6f3a:1aa:79d3%4]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 23:50:36 +0000
Message-ID: <87lee2zlf7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/5] ASoC: rsnd: setup clock-out only when all conditions are
 right
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Adnan Ali <adnan.ali@bp.renesas.com>,
 Vincenzo De Michele <vincenzo.michele@davinci.de>,
 Patrick Keil <patrick.keil@conti-engineering.com>
In-Reply-To: <87o7iyzlfy.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7iyzlfy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 22 Aug 2023 23:50:36 +0000
X-ClientProxiedBy: TYCPR01CA0159.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::15) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TY3PR01MB11948:EE_
X-MS-Office365-Filtering-Correlation-Id: 66eea99b-3aea-4e24-5e9d-08dba36a9533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JYeC+FNdhzkOh6xghwdYXutHLatly6ArH+dQmdofIiQ1uUcST4XDFOV2fF/cXb38okfMahFkT6KZRqfa537bqbTBYVBRV9JeUp3nbB05ZMmi7eaYQAKmR61l//UPASypLefH9ecfrZEuzSaRC9tbvDtMfLUUocUJha6q4ThUgZqdZJXomGFYF/c3ruolhY/B3wJ7OSQrKb8SFDRFSDC1CgLh2sz/RC0qUcEBaT9ozvk7XInlAqzKFW7AvH7+Nqbmffp1fsY5OYsROTUKcHUUvbCgVBxrhXKkE/vrSIaUl91bOjR36NYsLlFYWcFmoNcJBuZx3x8vUVNpx5UdB48SG755nA7mdk3IzUMQ2qPDFNVhY+oItuE38cMzf8MevV7TGuRz/VZ0n5AtOqXKH9vPvZAKHVR+M6TbYW7kz+nozCQGgKGj6EN3IWGHToW9qMCQxSiK67jh7ul6DuU2iBFPBXf21EoyzE2Voxxl6tcVnBKMVHzYMmJM0IRNcRRqhN9CxkpEbk2tXEmEH6tuqOg4yj3Wa66v4kgBIxtwUT+VCxYQoy3BNqK2fYp09ubgy5PUK2Wcolep7uGZTLjnRjlaTjYLR7xFkDWOo43etfYd6NMuatQ7tgPneZy3YBhRSFK4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(366004)(396003)(376002)(1800799009)(451199024)(186009)(41300700001)(66946007)(52116002)(54906003)(6506007)(66476007)(6916009)(316002)(66556008)(6486002)(4326008)(38350700002)(38100700002)(2906002)(26005)(8936002)(8676002)(2616005)(6512007)(5660300002)(83380400001)(4744005)(86362001)(36756003)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1Xl+t+F+zkWItyMDKf1OJrXwdvNxzqm/Psp9zUxAWHlAG8fgY16cmWDo3bg5?=
 =?us-ascii?Q?8ovT5pacHWwEIJ2+NvN1U2Pdc+E3XGLMrD1xSPiA3kFNI9V25G3VLi83fk9T?=
 =?us-ascii?Q?NSk5MefYscfYYBobuUD0avIyPYsYd98cfSwEAueh5BA6mmAZf9Tr4D42B/KY?=
 =?us-ascii?Q?Mqs3+DDgR+5FYWwRZ3PqcdG9BkGjx9GIZuaMAmZTw5a7RnyO0ewTfopySKFt?=
 =?us-ascii?Q?MXezBxcXj9qj2C1T3ozkiTJ3jyf67wvIy7Pv9h8TT9ALStq2gNTHJBSgZULz?=
 =?us-ascii?Q?NS4Iu3BmINKY7JHuqVDT5sMP2zTK1V/g2bilMlm/fnf0WYfGTTaNoSS30aNo?=
 =?us-ascii?Q?JXblhpLt++NupuzZApPHJRPBXsUUS6k3LD7eWcalWUOJ6y22s1Pg4A6LG2N2?=
 =?us-ascii?Q?BLyJ9/rLb9mmdJbqiG/ijWpJ4ENPi32Wm5M9HwKX7QxY8PqNuQZzXnQmdVCN?=
 =?us-ascii?Q?nqrxGa9j+MZDbCSYryFRz6EM2DPStSHh7X+hpJ3477YkAB58zxKXl2C4rAuP?=
 =?us-ascii?Q?jpC8E6z5nstFmVEQA6uIUbqzotiWY+4sMMNHICydJxY44d0x3vVPIBxW1Vle?=
 =?us-ascii?Q?LXaCyrC+/+Wd1NbVkyjfuU3y6uJBPGc9ssONK952mcUyQI78clDI/0Qu0kEG?=
 =?us-ascii?Q?VLDMul97PjIW0bIEn8mdnTDRAAdjx3QPFxdZQsV+xtx7Ke+ZOvVym2IkWFAU?=
 =?us-ascii?Q?AJG41U+v61UFyUK3EvhX0nTZwg36ATDzLDbPlV/OXGluxvPA0GRkDwn8w0GY?=
 =?us-ascii?Q?4TX75A7OiShJ2Ms/snnngHCtYImI8nOPeyz5NaT8m+S92MWQE38uiugjM7LY?=
 =?us-ascii?Q?eGhsbmQBVVxBTZojMpfTOJ39+e08PXDi+q4va1xqlegFdhMh7UG9aW3QYXg9?=
 =?us-ascii?Q?3T18TaoNwAY0BSoPK7U7qGr679yuENq5Mt+WSZNmJ/Cs8sURqMmqveiVibyN?=
 =?us-ascii?Q?wkDpqm+YZon5ONCMoNfXhiKG/NcdR3EAfqZgPn3Sz8kjJIJdiaLl+HOvI1o1?=
 =?us-ascii?Q?D+lwatz1IyxG/R2YgXdALVfgjyNfhyPsgcxFyRcJAwE+snKu4b59t/0uZMp6?=
 =?us-ascii?Q?PH4jLfKRZs0U29KwEh3kV90vX0LLOOL6HG1IQh4oha/xqFU733Qje/KTWTXL?=
 =?us-ascii?Q?zNCzuHBUC4ka6kPsnrSJC44bA9+/c2f7xx+6avRlEZDKSeHvtLtlBS4MqTlY?=
 =?us-ascii?Q?qTTMY1agKS/BpCBG/gxupheSTI9B2KwHQVKK0zEIDHFh98WnxA0+hZjK9shx?=
 =?us-ascii?Q?7QYq6Eo9RU/isKZvYMyLw6wMaVK0aR4dYe+yUS7OBCuQ6Nw7CWUmIosfxyBQ?=
 =?us-ascii?Q?Wq+0w/RTLBP5yw8Pr2v/6Ns3WXEW6rH+WILoBc7xRe3y//0nrOoJE/ugeCir?=
 =?us-ascii?Q?mCdWJXIIylLk1/mU+ocyFq8Jh7V3AFqlYJg9sY/Xpej3+Ym3okfCHMyBmU5k?=
 =?us-ascii?Q?AM2BoEFxw3C0Zg/cuT+G3GJQgdQf1UmbE6OsVEr+LBjqra0CHa4Y2atNNzQN?=
 =?us-ascii?Q?yZdspuRLiRZaV/kJ19+QIn/1G8K7Sq5QzR+GHjy/jYqzycKHwnyCAKh7DNBB?=
 =?us-ascii?Q?SGJhShzgtBkZqbt7qoEVTIXubrBkdXb7aMTTrEfxfMpYsV7p/1wvs+k+n1gJ?=
 =?us-ascii?Q?URCmNAdN74PcgbzUT4e5T0U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 66eea99b-3aea-4e24-5e9d-08dba36a9533
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 23:50:36.9247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PLW/O2bqlBZiDF0f9AYwEd4H637HDoSLKfoJbL5ctyBapsKOQazFrtPlZ+WIOizNDJKr9XRac+RTCfFbIPR0Roi2etsa/0ubqom8DFTyH2uOvtFvEw3V2zp6rLqp855r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11948
Message-ID-Hash: G47FAPJABWLNFTZS6QKXS3Q57ECVHOGG
X-Message-ID-Hash: G47FAPJABWLNFTZS6QKXS3Q57ECVHOGG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G47FAPJABWLNFTZS6QKXS3Q57ECVHOGG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current adg.c doesn't assume that requested clock out divide condition
doesn't match. In such case, it will indicate strange message, and will
register NULL clock, etc. It is just a DT setting miss, but is
confusable. This patch check all conditions for it.

Reported-by: Vincenzo De Michele <vincenzo.michele@davinci.de>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/adg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index 55a51ea12144..5528351c7535 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -608,6 +608,10 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 		}
 	}
 
+	if (!(adg->brg_rate[ADG_HZ_48]  && req_Hz[ADG_HZ_48]) &&
+	    !(adg->brg_rate[ADG_HZ_441] && req_Hz[ADG_HZ_441]))
+		goto rsnd_adg_get_clkout_end;
+
 	if (approximate)
 		dev_info(dev, "It uses CLK_I as approximate rate");
 
-- 
2.25.1

