Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B665784D7E
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 01:53:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA79BA4A;
	Wed, 23 Aug 2023 01:52:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA79BA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692748388;
	bh=ktKDgJrmb3vdkyIschEDKS4OKv0w102ZSExjB9pbuwo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DEpU1GaxQtkA9soLvGkjruH9i46vU0knTVYJerB0RWRldf7NJ2F7CD2Qc2hSjstAw
	 Fg3wvc07z3cM1ZIalYe0RL/WtEv6O14ndKPRy1EFo8P0Aqm0kgxP+fKlDaiinwAxLt
	 FN8FssPtKA7l07PMdxRIsUSUNaEUGRMq+gke/peQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D631F804DA; Wed, 23 Aug 2023 01:51:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5FF3F805A8;
	Wed, 23 Aug 2023 01:51:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D97A8F805AE; Wed, 23 Aug 2023 01:51:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::715])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C7D4F80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 01:51:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C7D4F80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XbKGEKge
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esw/UrAKpAhjQXHD6utA3aqA3583rewbcZd7CKPkQOrytB6LV1qaNTUHV03s1GJjWeEj9f8GGhJnWBxaBmgPPpqi672P0Hn/HfwtR/v3zEWjZPd0Kromi93ZFw95jJQEIK6750z5EkmLqXdZodFENvL/nJSA8cu4/00QUGcldcehA7tdwtX9QHMw8Eu3xfPjHe6XsZtdhL48sCifT9O6YHIvhWQpZ/BNbSZi/SynZhtPB+NlrmLtQnQejtQJBW1/p19WcZ69Jw6UrepGQHv1yawi0yI7z4YEjno4yKorZnO9ibRk6OJlt1T9LCsDlheuWFBGGyrTRSW6k8+aSujfrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1j8KguPYQvHgZKDiVW0d86MHnDNteytQeu7qIxhsuNY=;
 b=XW63VG3Qf23uEEiPF6Yf6U83ErMIEH2cnRD58rsOqz54ZyLGNYkizDpdONhm1pDCz6nneZgPdgn8bnpvjyFXdM+e0K3sTJFj2pV+ZcVxcxFVv9YH1eEdQnWyzz5xKcTdRy4c3DxfEPdoENIb0C/mHNHczUIkFsRn/ipU/o/ki1weNHac+9gNmGuAIbeCDgePGJZRZISYEV9DkIOeUjy2jVQRcU8jirD/dGXxfK/pJnJlTuzDf9CmE1XIzYaInVIlXayFJFZGOMCb1QH3J5tBu2KK/v7q7Di55daWP3YbQpje135GMIqNASjJFQ2wPJupWYMZ2YFohZUfZmIVtYqxcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1j8KguPYQvHgZKDiVW0d86MHnDNteytQeu7qIxhsuNY=;
 b=XbKGEKgeSe/Iw22vdfivaDv6BLxadphLl4TqCpayEbruwlWFtdxi9OQkD3F6w6yhanyPlofX4gk4sGGKOrckkTybPPFAkKAjJm/mhMnuIh7NdCa75ZiWPCs+zQQBLR3+aSZ6UUS8b7xpKAByG2Pp3BCI1oEMtObnp7/8Bqj1Vuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:405::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 23:51:02 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::7b2c:6f3a:1aa:79d3]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::7b2c:6f3a:1aa:79d3%4]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 23:51:02 +0000
Message-ID: <87h6oqzlei.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/5] ASoC: rsnd: setup BRGCKR/BRRA/BRRB on
 rsnd_adg_clk_control()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Adnan Ali <adnan.ali@bp.renesas.com>,
 Vincenzo De Michele <vincenzo.michele@davinci.de>,
 Patrick Keil <patrick.keil@conti-engineering.com>
In-Reply-To: <87o7iyzlfy.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7iyzlfy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 22 Aug 2023 23:51:02 +0000
X-ClientProxiedBy: TY2PR0101CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::18) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TY3PR01MB11948:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d408917-1a03-4f1a-6bbc-08dba36aa44b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ms/2+1jgBK9/+SSdSvPIHJL+pGLagBh3rfV4NnolQuqqdIl6JduRzmUatOCGIZmQebXzfnnvvvDSsN78kGsUy1UQW5eIXZLW8aVUhw9691i03F4EYUZaBOsN+qrI4KwxfRyECpg2Hk3Xq2cq+rQqEGK23RE5R62uW2IYx5yl/FqSKFzeFDmCwKoqS2OvqncdGzhsRf0BlDwcxsyLtvoHpJ66nI9YbB1KnQMMk6MTYpD7Fi2vmQ6hmI11dmmSY8v4vrclJiyj8ihosnKOZIYp9JMVKlZyw1eZCls+q8BNzPOSjtsxpoBDzo2Z2g2/CvXykklBCfPVkF18/SxHCeTeFEnVhKYSNOr2Mth/oZvKo81IuLPbvJquBIWz/rNWpRb3UVauMzjGqu/IWeMwbZMrRYrohkxlOZdNUpZY26Jv+fXWon+hod9U5EGZYiLWP7nOO4H/+WSa/UyuChadnPuaSzuaaa8hhYS4/xqepF1mgKC04IjGaN30KFdEmUCGDyji2nWOh0jnR2TkXfbF49QYeeHe2GHLDgc+LR/sq/0p5IS6xDULbwN3PchtW1PO2V6wrhmY5W6YFYhVTC3QI5KWmfN6j+YtAm2305UFOWtyeuvvwug9xMUzms8P9QytHak/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(366004)(396003)(376002)(1800799009)(451199024)(186009)(41300700001)(66946007)(52116002)(54906003)(6506007)(66476007)(6916009)(316002)(66556008)(6486002)(4326008)(38350700002)(38100700002)(2906002)(26005)(8936002)(8676002)(2616005)(6512007)(5660300002)(83380400001)(86362001)(36756003)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LG7+L31iqKm9+z1LdFnINuYi2FmwvThM++lJvCQguHTxZaiu2M8vRUsJVrlY?=
 =?us-ascii?Q?7tHWgMYEXgBulicCkw+TkUoIhbZmCVktQL1/NJpTdbAHmRdHBogIqH+lhgRA?=
 =?us-ascii?Q?9hwgm8TPwml+WBqtpIwCbj7cM6H7Bu6t4tn5FIf2zZEqyE5dVUQA5TywoC+9?=
 =?us-ascii?Q?oru+2LqKOehqwnqIKECro5Xj78gvtlNMw0fYNTO9X6FaIuDcqw4SY4auCQMP?=
 =?us-ascii?Q?ApYroTbJ69Jb6ZvW+NidK/yEDZnNQA2VXu2T3p3cCMG1xL2wmACK+3RDhAgQ?=
 =?us-ascii?Q?brNpYaonh3IK7Zu82aJI1Ys1hVpvYi0w5HOmCo5rEknO4AKwHgM682TuBUBD?=
 =?us-ascii?Q?zqL2ci/C7PJjSqOklshUyncdSljekM7Qgs6lZxIoPPy2kLirj6rw3AmmbjRl?=
 =?us-ascii?Q?Cz8dKiXwsXxVuMxgSCWUolzqZ6Ytnsbm3Qzksy7iuBrccDQyasZih84Z3uiE?=
 =?us-ascii?Q?HAjt9zZi3FWOekObv6LVFX8feS9BxCRo3b9bHa7R7HZbKLSsSwQvqD8L+9JS?=
 =?us-ascii?Q?yvSoaukAXYQU/3bu+4/8PSLCLQmviL/BbT6PyTv4zi59X9HehwZeE9caS8qm?=
 =?us-ascii?Q?36kZudsXkOnqHMmvDhBdUcnc6eLGKTI5lDuZDNN8izQQxCa3WO861t3P0VGW?=
 =?us-ascii?Q?na1jDDKYCN6auRm80kkh2RCPATHhDHvlUIYKfDgURV15+ywD4kOumFSuzycy?=
 =?us-ascii?Q?zw0U3lS+v0Jxpz40IYe/dVITXgTD9qxGVqmVUIiLySxkkU135p6yy2C1GjlA?=
 =?us-ascii?Q?vTHVYYJohdWbjvqS9cTBrFmFDM69VV/l+rvpDZXoYNuPrbaeUZZrNt+fUIaL?=
 =?us-ascii?Q?/+wJukBJlYAsAIhAu9koioHgR4uLIovTKF8OHv7BKojqIGk668QcX4yfvc9x?=
 =?us-ascii?Q?JuEXUj9NOa6CtNW+rvaNW3g6OPlZAQvN3UJVkbOHmHmdyUbeUa0D0DySdN2K?=
 =?us-ascii?Q?9dau4TDFTz6IMM8eKNaA0hHUyHOixReRUn+hCoct2XD+4KBRf7JY2NT0M4Ux?=
 =?us-ascii?Q?mlyyKDhRRrenfWTo1NMw5uP4UmSUAAzV0v09t6MEtjKKO/e2VyCNLx16V14O?=
 =?us-ascii?Q?iMITK2Frd/+CjEfG1s6rQBMfbn0O1bLV88O1tZKwN1X9l98aw3jaBbmsKKAX?=
 =?us-ascii?Q?UVkZCvDdMz4UkUjh1Xt99lg3eKuP10FB+ZEtN1PUR5KbpgBwBaODCRgIufir?=
 =?us-ascii?Q?89zH04by8lADwcXez4CVsUdW1ux2nWl4vykCsxF+IB/xPEh+wV0Hv6WAsmN9?=
 =?us-ascii?Q?GH2ENsXLrTTAU9eSTHzgl2MheDD5B76ftExZEfJGPOVE6OBwN6tYFqT0FiZh?=
 =?us-ascii?Q?g205+Z8nRtPqSvG+s7WCkW3LFFfGMh4Cuu6mgNbW0uGP5XKU9JY0RIpz84vc?=
 =?us-ascii?Q?ojsDtwgiOIleOvVw+rqVqobE86nFRZnuAuIp2VS0xbQJoVFsDN21m3am+5e2?=
 =?us-ascii?Q?/z/ex39nxLqj3NsMiEAEbn2e9aDTuqttiSrVX9Mf+4wn8rYId9PK/pW0GrJb?=
 =?us-ascii?Q?r1FjgDqvpMbkB+2o7noR+4QM150kkVDE6TaRbWTtJkVhEjvPj2ZP+QZsXD0V?=
 =?us-ascii?Q?TyjhobZOSCtt0z5XNjrE1Lqdk4GYHBya27XO5Pf1SvTQakk2sfQ/S53y1tc/?=
 =?us-ascii?Q?8XITRlSIFLoj1rC7bAd4aiI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9d408917-1a03-4f1a-6bbc-08dba36aa44b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 23:51:02.2343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /0libedTd377di8GwMDBXIj56whLPhc71W3huyGoPDpgt23sBg069vzO5gvZOjiRj1GTmd4D29lLSWfl1ZHVEScMYaHSnokCDbn3pWOxu+dGHrh/Q1LfcnQYkiADhSIZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11948
Message-ID-Hash: FK4GMNWFBU5XSK63IHTRNBLM3JH4ZKCY
X-Message-ID-Hash: FK4GMNWFBU5XSK63IHTRNBLM3JH4ZKCY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FK4GMNWFBU5XSK63IHTRNBLM3JH4ZKCY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current adg.c will configure BRGCKR/BRRA/BRRB to output clock
when it start sound. OTAH, rsnd_adg_clk_enable() will enables
clk_a/b/c when driver was probed.
But it is strange, these should be set in the same time.
This patch fixup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/adg.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index 94e048614c81..f0888cf31208 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -359,8 +359,6 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
 		ckr = 0x80000000; /* BRGB output = 48kHz */
 
 	rsnd_mod_bset(adg_mod, BRGCKR, 0x80770000, adg->ckr | ckr);
-	rsnd_mod_write(adg_mod, BRRA,  adg->brga);
-	rsnd_mod_write(adg_mod, BRRB,  adg->brgb);
 
 	dev_dbg(dev, "CLKOUT is based on BRG%c (= %dHz)\n",
 		(ckr) ? 'B' : 'A',
@@ -373,9 +371,16 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
 void rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
 {
 	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
+	struct rsnd_mod *adg_mod = rsnd_mod_get(adg);
 	struct clk *clk;
 	int i;
 
+	if (enable) {
+		rsnd_mod_bset(adg_mod, BRGCKR, 0x80770000, adg->ckr);
+		rsnd_mod_write(adg_mod, BRRA,  adg->brga);
+		rsnd_mod_write(adg_mod, BRRB,  adg->brgb);
+	}
+
 	for_each_rsnd_clkin(clk, adg, i) {
 		if (enable) {
 			clk_prepare_enable(clk);
-- 
2.25.1

