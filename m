Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC50F63A0DA
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 06:48:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78E181699;
	Mon, 28 Nov 2022 06:47:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78E181699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669614490;
	bh=/+dvns/+73brOdhGLkRQJG6HeXdol/dt6cy0okIeyt0=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dCjK3Wnc74vjzmL5J+A2PCCwjf0RLwGkgnTk4JZDTjl/iimaiOghkTaQdOLmavm0s
	 fPYLC2vuxQIR0+ndTgnjki1IwmqnsjMXZYIgsZwnkjLJ6QyDut+0N/k+pU9nIfSf+4
	 o81JtwZdIWgnA5qkjYrJLASUG+bbxtl1QLvmRt5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10F56F80166;
	Mon, 28 Nov 2022 06:47:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C24FBF80166; Mon, 28 Nov 2022 06:47:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::708])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7D4CF80166
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 06:47:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7D4CF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="T7GWzobS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5k9iO5oO27BMy52uXleSxTOZp0RGobjeGa6umShZGQefn7IWcbfleTw8KZDtdIxXgyzpiDGgRqGAkkwAciR7sBn20Ni0aEG0UcB9w56cXCJmQpkEGxFRBujmCNbnjXpQ8Mjpzddq0SsK9DGdS08VmEhkE+VgtLKKjdbWt2RKlwo3l6FsHoaY2oV+Kp7M0LS4m/J//hj0h8w0RVXbPUy4HP98IcQKpvflOf5iThTQxmlLlMaGp9qcp/g67YiTwqHtR8mKB09CBofBVFKs4RVEP8MMOVop5NR1ppKVmBFwb5YujiFkCK3xH3sAGTz/noGU5t/hcvI1ygsFHhjr+KgZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cejkpxHhOYyWO4JL4qR5+TB6IYF41zizXtpsW8brZwo=;
 b=JA2Lh4jA2py3CnIfp41DhE//BdqW5akXuomHlg24iIetUU6OvG0SXhFDoqn9kENV8HtQkQq8aM3rdLd06xR7AHAfjTJb3EsNc9tuQGzKBMjbrvPnT74jrIsCpxoyLUp13/m7dlEu74tcYbBEJT3+hYc356uKYu7cAksHcITXSbWe8mXHK+A0f6XRdoWC9R2tTm/FyU4KAhvTIjqY7z+2fJCK5fOOxWE5uQPsofasg+V1KeHpG5JIkUOpfazro6KoPrULe2ATSpmKdfwFBXfC/cXPXJMG9F1fxpzUFn0h4M9zxYP6VcbzEeaotKdE9dx87iy+vDgW+2bS4PdF91It2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cejkpxHhOYyWO4JL4qR5+TB6IYF41zizXtpsW8brZwo=;
 b=T7GWzobS90dUbnkMCcO0GcFkxHY8n6EBHhgwVqQjoYtYaseXyPFuvjrZTQ2ZP8aA+aIWVtRR5NJllFx88uCYrtZs5kkCKc7vkbcjixnr0E3onoXO3gxw7/lvrJAoKUWtpRKiK91lbbo/mzpzdZi+bhgJ8okN2g1r/Z+1fyma3EE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB9845.jpnprd01.prod.outlook.com (2603:1096:400:20c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Mon, 28 Nov
 2022 05:46:58 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::69b3:236b:223:a8f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::69b3:236b:223:a8f7%7]) with mapi id 15.20.5857.022; Mon, 28 Nov 2022
 05:46:58 +0000
Message-ID: <87v8mz8wcs.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: rsnd: adg: use __clk_get_name() instead of local
 clk_name[]
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 28 Nov 2022 05:46:28 +0000
X-ClientProxiedBy: TYCPR01CA0180.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::20) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB9845:EE_
X-MS-Office365-Filtering-Correlation-Id: aa783479-d975-4b4a-368f-08dad103e4e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GfkIi308cKIINy9Rv4Je1WfD+hb383837iEX78BW6tPO6/MCacFYrG1qIdrhniReKZ8L8WtEfSqGkuf5KWPP2qUt/hOtN3AS/Ao4DvEY/jJeMdinWcaWVEJRtbZr62ygEK1tcuYusYDXpXBrJ7hNwMxsW9MKAySix5+9FMPVzKsLqH2PcW53H08VrvufHpkrlKAIhUCUL7GeJk00w9d34nBS0mjxkf+42V7Ho3cRqHW3km+6QxXbJU1FsHJfcqQXbwrpB3kBu6ab5sc3XhtufDU740FAA+0wcMFcHxnGAakHKleB09BucFHOHHOKRetXvW5Cy4u8KZqjUrmWkM3w50/Yyymwd+vyZOXjoz2NZi3OiXi3JN+5Vb9LsPZoTl60TM79OO0ukjQL6rjy/gcsmRkD7s0w2GpH34vj5/SZ/8pClQdIYGX/7Bym96RmJNqeSXdornYngKZwkpLVAJ2IIwKEEmHWZFpImO2WHa/fdz/t5c9NewSUMu7TeV1rE3sVYPXDm3I7cV0rElzbkR9byW9eNkHsWhewdml51V+ubNFKrqaEkFdLmrn5IgOwBHpdZYBS73m1Gb8VjckRa8nfpu9dvrcMPTR5SAlphoAzBxs8SkAxSd75TTblkLqI80WFHec6L5zsw+kmb48SMvjkGwbbVdEYnVQ8EiUzSEw3JjoxSY81slJCCXyezb+j+rJSt7C5pF1QfoVQ6ymNuitXjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB8440.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199015)(5660300002)(66946007)(6486002)(66556008)(66476007)(316002)(6916009)(36756003)(41300700001)(8676002)(4326008)(8936002)(52116002)(83380400001)(38350700002)(38100700002)(478600001)(86362001)(6666004)(186003)(26005)(6506007)(6512007)(2616005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fiYK+vWQ60uRzfcZ9VCJzLxJNbN+gubrdxNlWiO5W2OSxphDXLazoM2fk/KD?=
 =?us-ascii?Q?/pcxrBNIpIYa+VgX8I/trwHL3hufd3YbvI5ylCoKcYuJnYcPQrbXfPgw/0iR?=
 =?us-ascii?Q?hC9FjXkiOCHDXWRDH0NmQwAaYbCXGc0aqQWmj/5HzmRGK1WQdJpRa4BZ0GyE?=
 =?us-ascii?Q?U6coe4iQZRotd5Fl7F3UkrHpYAFWaUtnEV6IlT1TL5YLwDsfactiSGXbb3cz?=
 =?us-ascii?Q?rFhQXailq7jw9sEYRf6/dT/DxQcAVuTqGbsooYmdyRWUaOZZlTZi192Ge2AC?=
 =?us-ascii?Q?216nrjiYi6zC3evo5hL4xfzs3NsJyQGhVtrYh7B6SV8WiSmQu/mSRu7UKRj7?=
 =?us-ascii?Q?VmxDNVufOLmtiT6MuoOyCbuFapi0Ewl0+nhpVze749wb0uvZWiOaZ8sQPP+q?=
 =?us-ascii?Q?QVWcaOS8A6g128SwAZ4lZ8KJIxbUCPbWlYYaG3HlJCV4dDe+3NNmCvLvPjXM?=
 =?us-ascii?Q?q4l3dfPr+tRfKgq+deftJz1Hjlt5Cnp0GrtozB+XJN/Y6vDiimmxvJU7gtnP?=
 =?us-ascii?Q?HS8HrJiIqn22Z+YKNYFWu9SYwrf4Sg5i3P48pk9A+vRJpcqbqyGqv1jeEDsH?=
 =?us-ascii?Q?DOKt4k1R/bVqbl6PX6ZVfSEdzowWLnBcf1KZLNo96IXKtnopde2qRAo5NqGe?=
 =?us-ascii?Q?hZzcqYQx0n+VJAoggD6Rh/9bP6kVOH62uMyD1aDwCSTSncQK8GbbFOYxYFay?=
 =?us-ascii?Q?XtaSVoet+yiJOpnpW4HXu38km2+u2oyuHY7YzCTDhneF4Di4iVFtfgcKrj+I?=
 =?us-ascii?Q?Pv8rgTKwUT77jdZjrAUgFN8uDXtcX4qYc5hHRHvv9KFasyitd9UD4zgtM3Qc?=
 =?us-ascii?Q?izv2oDIcrgn8MzY1A7+AORmbritlu2LHOayfwSq86FMZnb/Yj+s0uGoYmzm2?=
 =?us-ascii?Q?NV9RjsJFpjrmPW4fvbW8chORko+Ybm2BS4q7dnLbwBpHFeWiVBbxmEy0XFFr?=
 =?us-ascii?Q?IIj6esYi5vlt4RDRaw2fBGPwVM7n7mJg+zR31S6OdV6qS01cg4NL/l2eWLeM?=
 =?us-ascii?Q?+RH0G5FX966iObeQmGQ5TgjQHSrZEtd5yGvvOZlDqKYT5x0xXfvNF1ZpUmVA?=
 =?us-ascii?Q?hVPN8/JqAzByQ+bgiICJq1YO9plkbBWGJWqLDBOrTkmaPN89eBBLjWHGbzKx?=
 =?us-ascii?Q?bSK279Q6T2/Um+Qf618xG3ywikSNczL7lFz3zJ5C3eYI21KfMcKe45JjL0AZ?=
 =?us-ascii?Q?Xk8GubheyQ/ft9SXCWxDRtNq+irCKu0EJC7tixho4IQiuoEX7IELXaberJUi?=
 =?us-ascii?Q?720bBXdwpqhx44+n6uLuLFhomHNcaGjdJ04bW9EVHl35lw6CMJ3VOhh3JAxG?=
 =?us-ascii?Q?H2cME5SwHhHdqB+rnFFDxQhjdQI2kxS6fuvwYj98qxpeCnuOOJLTwmepi9r5?=
 =?us-ascii?Q?x13P8kt+vRZR0hZKLfqV5PkEEFIgt1Q7bf8jZbwqY0J/WRlsuonYEhZCjc2p?=
 =?us-ascii?Q?2/BCUGKMX//l+kXL4hOCZW2YXzn2ib0WC4soRT44vupf4lLOdPYt3EbeEy3d?=
 =?us-ascii?Q?3mS5xBtgUKIEk+l75xByHLg4Nl6ux0vGwCDt2PCpEJpGCnbcHxuRz0FFTXOM?=
 =?us-ascii?Q?7TwjgvSeXn9Qg8aQslz+7KRD+BeQ+dv3q45NXuG5nzepGr9Rqvk2OFy0wpW+?=
 =?us-ascii?Q?0cBoSYUB9APEaDAMfZ6W6X8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa783479-d975-4b4a-368f-08dad103e4e9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 05:46:58.1297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GrNlDdQdNwoPXt11lPIU5uHbPt8Rb3LPx2CK+FFlSCeHtH7QdbJdmwt+lI/S4zWjxm8zz4dswxA0JjsCsC02EegCfXFGJjPHz1I90Fg8leE8WjcV47u8j6yAVrAW0RNS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9845
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

Current rsnd_adg_clk_dbg_info() is using locak clk_name[] to ndicating
clk name, but we don't want to use local clk_name[] everywhere when we
support R-Car Gen4 sound to handling non compatible clk naming.

This patch uses __clk_get_name() instead of local clk_name[] for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/adg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index 5f1e72edfee0..ca1e1281cefa 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -648,8 +648,8 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
 	int i;
 
 	for_each_rsnd_clk(clk, adg, i)
-		dbg_msg(dev, m, "%s    : %pa : %ld\n",
-			clk_name[i], clk, clk_get_rate(clk));
+		dbg_msg(dev, m, "%-18s : %pa : %ld\n",
+			__clk_get_name(clk), clk, clk_get_rate(clk));
 
 	dbg_msg(dev, m, "BRGCKR = 0x%08x, BRRA/BRRB = 0x%x/0x%x\n",
 		adg->ckr, adg->rbga, adg->rbgb);
-- 
2.25.1

