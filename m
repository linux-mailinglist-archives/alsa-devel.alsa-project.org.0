Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2A5574510
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 08:29:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 958EC1924;
	Thu, 14 Jul 2022 08:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 958EC1924
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657780177;
	bh=5o/0KCf/BszKzGNEDk5ahwfn/+WsOvFA7c4CtHMEJcM=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rKTuZmK9s0+4HowrRVmcQDgcYWC55JTMz/weJcAczoZNMLrZbRkXqfPayJ0/UWGMX
	 q2dgy99GgTgQ6PqRAADicWshWXJCQKoto+vv3ra4Pd4WM6bkKPoKsXT/Q34lfzZ+y7
	 sux1tVuKHPgc3HoWU5mCyEIQaKKEPk75IZaWpU+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F2B0F8016E;
	Thu, 14 Jul 2022 08:28:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E0E1F80165; Thu, 14 Jul 2022 08:28:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2135.outbound.protection.outlook.com [40.107.114.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BCC4F800AA
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 08:28:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BCC4F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="oOorPC69"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIn/edf69ZXw8qf+BOmQEIgVH5OkNQW2XP5LGd9vkNpIV1GUlZUKHvEy4TOtt6j1RZKiOKwsWCE1q5TEb9s8dJSEC/8qn2xMnsYqzi5L9Ak4/6i9esEsVcbpnzzNx+qWTN4k/6FjoPX8K90XjuElYxVPqtf5+HFtbzOT+yFSzonSYN4sRngX23ZdNmZZderCfPOpOPuKOcI+DX+JTPlO9oZP3I7gNW7m8IigKXPZSfksAOPBuPVEpjanWYWZPzhDn2nxSHrVGc1CXqPL0W8itEdHQ3r/3xIcGP37MAn/NluYxeWTl407riqJrMqz3CL1XcikxLbTAJ4P00R7/N4rJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtKs3pKA5SUUccKAq4gML+HmBG9E5dHuU0NK8jJw2g4=;
 b=I5HY/c7ivHSQSBRwnrtIT/+zgFm7Ua+FNul07sBvHVb5Mut7g5pnwCXSx5xPZxBafXOFWsVOaku9T8Y9xZp0SQ9toDOaCx39ZklHMLRd7N7sP6x5PuTuTEfwMQKj9FEzBk7vZ1S840d/eR3BXVrKUIbN/yWjjcgaC6914KdNIShxKnEVG2BDQ6jvWcAue0P7nOpz9aajJZMWvRrhlgytQTXmjDes2zRiNdfwTpaTS2t2vx3mgn56CH1KGfwDeuAelsVMPm53V+cE/txiVBC9p8h4+1MctThWv/fBRlqNkIqnII7dV9PBNrdhhpXS2weKfnp9kO7eew64TVQj9siH/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtKs3pKA5SUUccKAq4gML+HmBG9E5dHuU0NK8jJw2g4=;
 b=oOorPC6915K+t6bsQqOBcuDbbIkZPMq4855nRuaaIOpX9woDzsohb0rNx5LMxZRbHCubIoC29TTei/7955BH+1H1rpGFdAM935z3QORO6vH5z7VY9BLEBh2go093TY3r0sQt2DpvmOF7mj0EVTE62cmoa0telwo813x1u8RKxb0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB5865.jpnprd01.prod.outlook.com (2603:1096:404:805b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Thu, 14 Jul
 2022 06:28:15 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%6]) with mapi id 15.20.5438.012; Thu, 14 Jul 2022
 06:28:15 +0000
Message-ID: <871quocio1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: rsnd: care default case on
 rsnd_ssiu_busif_err_irq_ctrl()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 14 Jul 2022 06:28:15 +0000
X-ClientProxiedBy: TYCPR01CA0177.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3372cc0b-1d0a-4f94-b679-08da656208b7
X-MS-TrafficTypeDiagnostic: TYAPR01MB5865:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9DuwlUlp53hSx+p0lVsvKv/XawdaBbTlkuoeUNUIiZOI62cAyzXOSNLPm8MlGhALA1k0iYbhlOjxsV0IfOt9wpoq/yBjqezO6ccq8PcHyGxPwqufvCFYSNM6ODx/qSoVsHqXn66H0u31Br4O8gBJy+ZnhPlOAzCzMnnStoqitiLdENQO88FEoDbabW56RKo4whdU8CrZJX54A/8B26eTGhA0o/Ox7dozENjncOO+8c7TaVhWY6A5ZEMfDDlk4sBZpjA72YoJkkB/ezwshCYuq7yIS1N0k3wLFJk7n+g+2ioeJZmvI5GcQXtYD53L+DldM+dLP2eDA0NjC4+z4B8YVIgSG737GEBss9zjzVLwfGU8iURJZlfmNvLsHjqCA5Qy/dvoWkVOIpfHBawikB+gzSjLAKvzh97p3hrnh3LxdG753m1+T2/o6W4kMt7E3UA2bT/ml2tSFJ13qEWxNolIPcBeidI9ZgbgATTQVQKVYEq7V/fzALo+/LmOaLVER9SwPsGiL+rh8C8I2IS+0Q0m9YOXUm5gr7zhz5SOV9n6Ko5lXzQ96tVfpDlB5vJsMwaXlpl8Dg1OWlr+1QpFyje7jASuUkErUFTohysDNn+imdAqK3kG4AD5LsnUj+1xMlpkMFU7Ffs/dXFnEX71vBzmbEJMYLOGH9arxMERgNCJkOQVPAZ7J5FoQqMSTCWVuGyKzpTvLge7KEWggjPaqWb4fVjKcTdUVbtdDQX4LSYHLOEOvC8elbYBMuvl0pfGdPtSMrfi5vzU4+kJwu7Uv2eZUNckdMJXp78QGLQjUKlZRoZzf6ZRQaBv0e7nF6GJTvTq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(4744005)(54906003)(6916009)(8936002)(316002)(5660300002)(6512007)(8676002)(66946007)(66556008)(107886003)(66476007)(186003)(4326008)(38350700002)(2616005)(86362001)(38100700002)(52116002)(41300700001)(6506007)(36756003)(6486002)(478600001)(2906002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x5pcYp1IyROa6JNaK1XFEat2r3MvvuIoHcOoLAwQZGuQKVI4kuw1xni7sKCd?=
 =?us-ascii?Q?oQQMw0kCgpA0YJYnNfxVQ5Vi8pOEzUSWUoABN2rKEMThPx2/1H0lcwe+9QGW?=
 =?us-ascii?Q?joTAVC4eLdRAnxFiMfi/4e7DYjDN3WRSNbx10FgWufkZyFIZbuN9YlfoaLo7?=
 =?us-ascii?Q?hMcZfq+06KjatFATk1Zt3g8m132gXm/MFmG8IR9fgb/Nh2VfhKsk5R/M6/Wq?=
 =?us-ascii?Q?iRm6j3pWoiUQyOrQ5OaNkAnpRAj869HPMYWjOsK7USGJzOCxS5HeY4w9gj5A?=
 =?us-ascii?Q?QbjdX4ReL+TFOqvv3TMQbcF0g3C9HfwGgA8Vl9jpry8wWuM/xycp0A6WOLyP?=
 =?us-ascii?Q?9qQF4MxdxtfRcRQdRkbp7sQF3os29qiHD7gLN4fhPkg3IxRUOcSXtZI0rWXy?=
 =?us-ascii?Q?y1Wbt7pIHfdDY9cM9pkKgRPJTOg0xATI+B/zBqAyW6fu47xtr8rqQq5HPhCE?=
 =?us-ascii?Q?heqmIXK2WRfzSoOJg26Pi7LOjyU8aO2BMQHYx3C0FTZBG9IMCTqhpJ3m2S2T?=
 =?us-ascii?Q?cjhGeLm9r0XoMGjiEtMiOpi0dBEnPQAWOZqONxMx33oDZt1rXFtX5GotifCx?=
 =?us-ascii?Q?3r5NqY+NbiQKAZKWY9CYFD6v9ll3vLjI0V5VWSuwnlwmDbejsSiSWNWRzheQ?=
 =?us-ascii?Q?4aqdfoS7jsF4pio7lJunmbKCeyBVdvF4cZ+OW1Rg8APtfFQd8KU/5ddcgucf?=
 =?us-ascii?Q?E9f/vEPIEy9rCWy/op4Bvl4zGerrRrvLFNHnhkZtpDjphVqQU6Exdu0crRXt?=
 =?us-ascii?Q?rUxj+lW1dzpTiOe9MTuxLMbHNQ5hUsqEsHQwDh2L8gKMIYE7gP5ujwnaSKOX?=
 =?us-ascii?Q?PnnIeOvmqtr59zZqHtlmr5pl3rK/AgVKb8TAYov2IgLsoYSLdCahZ+xoXAN/?=
 =?us-ascii?Q?NpaZEpa+GinYd2Kwg5bhXAtMywdOcGqtYEXw+ouMPNBJ/7LaOmUHZw48rFRR?=
 =?us-ascii?Q?DV/Dg/2CygyW1N4udQYtz5rT52qKsock2AAWPdWT133jR/u4CHyeBFqXvfZ2?=
 =?us-ascii?Q?GmxNzuY/LvyUcfXZokjUQK4r+8/y/oZrz2VtkhEGMaC16Q6Ux1vRDBL76jJH?=
 =?us-ascii?Q?5nGfpP761GRR7EokmG59TdWIHKJFKPrRCuqe4WVrdLwWsRqIUEH9SuQ8umUr?=
 =?us-ascii?Q?X4njPolZYPcLieL+bi7/DcoKu4zcxe+7w6gQWP02RmyghIQSFR3Y1oGRrIyw?=
 =?us-ascii?Q?6KZ33m2EEPPOvOMrdguNWWYptaVqOE5GqlsgXFtXFEUDya5uorIzQS6fWTww?=
 =?us-ascii?Q?HmdXa6+GPWApszij61F0FtpIN0mgajVcuRoqQ19qPZiqxZ8s/o83yE2SOTqg?=
 =?us-ascii?Q?iYTvMdMNJept98Q13lqdQ3UbP2fqXg6k0Nyyx6FwiKLsrCTMrhqtY8fknW5P?=
 =?us-ascii?Q?ikDN4Um35yKzNHXNk2WE3pTd+77JLQ3kNfeM6wXPhzhOyOKJj3p+dX6/T8Z5?=
 =?us-ascii?Q?BsFdiaJAtST8gT+R0bq/NpO3mRUr8PadxjMnKOxU/Ozfs3sUKrh3Adk+BZos?=
 =?us-ascii?Q?P2RR9V4uyRlxDmaH1GiQGHyOBbwzKBd/f+yuJeq4I3CCVhmKwEtkNIB0hcyc?=
 =?us-ascii?Q?GuZ4xG/FTOL7x5NDwczIpIX9lV6Whfjfjzo69yGe86Ry37JCHUzYs2pDSsGg?=
 =?us-ascii?Q?9gigm5hnHfg+plxe8mkLlaY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3372cc0b-1d0a-4f94-b679-08da656208b7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 06:28:15.5593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJ7j7sqYbB+VROyv4DF9dT3OOHHOCcBN9K1X2XYFkGtjywECow0+2CWbPYE7Qzducx58uIgGGHB/OzqHvvTGNjBazJyEZAl6RLwBXSpi0GBlR6e0QmfepckxGaciGAjj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5865
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Nishiyama Kunihiko <kunihiko.nishiyama.dn@renesas.com>,
 Nguyen Bao Nguyen <nguyen.nguyen.yj@renesas.com>
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

Before, ssiu.c didn't care SSI5-8, thus,
commit b1384d4c95088d0 ("ASoC: rsnd: care default case on
rsnd_ssiu_busif_err_status_clear()") cares it for status clear.

But we should care it for error irq handling, too.
This patch cares it.

Reported-by: Nguyen Bao Nguyen <nguyen.nguyen.yj@renesas.com>
Reported-by: Nishiyama Kunihiko <kunihiko.nishiyama.dn@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/ssiu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sh/rcar/ssiu.c b/sound/soc/sh/rcar/ssiu.c
index 4b8a63e336c7..d7f4646ee029 100644
--- a/sound/soc/sh/rcar/ssiu.c
+++ b/sound/soc/sh/rcar/ssiu.c
@@ -67,6 +67,8 @@ static void rsnd_ssiu_busif_err_irq_ctrl(struct rsnd_mod *mod, int enable)
 		shift  = 1;
 		offset = 1;
 		break;
+	default:
+		return;
 	}
 
 	for (i = 0; i < 4; i++) {
-- 
2.25.1

