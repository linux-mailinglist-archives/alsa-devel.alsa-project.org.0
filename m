Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFC6674DBA
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:05:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9E852DD3;
	Fri, 20 Jan 2023 08:04:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9E852DD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198343;
	bh=uLwrBroZGudU/DKs+m6vh/yUYrxbeEoAeBSkDh039lA=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cnXXd1E7cLc1sYfTA//v9NVjSspQwyNwzBiU7KA/s43tWX46VaiOjGw2BiBrqGDP5
	 ZzUHakX5ULRkqAYAksbEgo9X/iLXkbn3AZSB4insSp0CNvuGbdCjcKH7+2c4aAJ/zg
	 OnnPmT4ENCmjCEUg9mAhCmM9Zerk9apIyGqBpzGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8645EF805AF;
	Fri, 20 Jan 2023 08:02:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C232CF80524; Fri, 20 Jan 2023 08:02:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2114.outbound.protection.outlook.com [40.107.114.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E43DF80524
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:02:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E43DF80524
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=nkkerXk6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3TAx0eGoTOTGDhu8q8iMP0KaSpg+wA1lQIZ33b1hIxvUvCrgR58azh+qEcw3j7uncAu9HqIY9MEdgpsiqo27z2Adg3kFp+kD5nqVX77XuUj/NCXzQlsjzvxw3Q/uF0U4iCGuLYQ2okN0mLNG/JLREC+gWvaLl5cDLcmntIBnOjv9itAtHQeXiSx3epYL4PdSgynbSUx1IlcsPO+TNhhN6n+HzM6JPWBMG7w8JuHCRWxK7yNxGspfkZeSxX+G/rjLrQfgDZ7A/gHCq4/QxEqWzSBehtpUyp5paC85m9I6DAe2a23P6qVzxhQce69BM7LB8n/rqY7IGl9lFs+sbgXMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y02LuwpzK+tWz3XOhLsWzhp30164SfSO7lnXaEf0RWE=;
 b=dsERBl4DGrPvARus9I/go9z9FlWQWtaZ5uAnSNVNoZvZFt/FRktdGI7vpbpyh9qe8oy1OMN8MGiC+1pdzmdNl0T6uQq94q5GhmnfV9HFfl9aSfRXEZ+ezSLWYrAL6IJYNhOvBx40QHz2q9O0qRO5BSZ8vEjWMZEDHLAqrK/l+CQc1AS3strfwS7VdWWYIjGLABXwyYnaAF+OryegNIbndo7+joElRmL2euhnDLLoWp78krJhojqpH4gEX2meK1gk2b2UoWiUJhR0j8EE3FTvXJqERoAh7+TQi+5uoKsO8ZBTT41rzqNaQoG5RCXEobcthYeiSbvMiVXtZD5m2y7Kyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y02LuwpzK+tWz3XOhLsWzhp30164SfSO7lnXaEf0RWE=;
 b=nkkerXk64lPpBlQ5hfyoQ2/DojGi/kc97R2azt8ndEzgibmThgYJSvmbVEl4ljeLaI0ljQD6KMrGrdhRvvNsP7PRkA2AMkHsBThXPSlQh0FQytB5TiMYrwOXvKZN2aV8pbDX5fuk4Z/zVzg2Gm6X8fWRGW9Cq9vdwSL/yaaZEY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9337.jpnprd01.prod.outlook.com (2603:1096:400:195::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 07:02:49 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:02:48 +0000
Message-ID: <87tu0lk7s7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/25] ASoC: spear: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:02:48 +0000
X-ClientProxiedBy: TYCPR01CA0092.jpnprd01.prod.outlook.com
 (2603:1096:405:3::32) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: 891176b5-4de0-4dc0-2c02-08dafab45703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 89Goi2067C6p7NS/uY6UcV4tzT7ulZNDexpaYEI4UK28XHFUmapXuSecpbdrk+4+PHOKlS8vYPxqukA6BbkUT4VdX15oAKY+9+ZTPj93isF0azfiG36C/27WZZM4ivsU90Erd4hQRhN4gMkz88XTW6LhX7kIeoe4rl3qZnB8YROpFgTcQV2vZaTOIZ+ToCn43qQmzaW4iLzo0XUPBahOhdXCT8n3xH7mczlSdeAIUal/z3AETzLtYbeqqGCH2z57hmAD50bBNJoRrc8QhWZycetXP7WHEG6BgyGkh6B312c1oyiLUxvjPHruhF4oBQMmR7pilXSm/6O1SXfeZm/+SAdCbTRtnhDbieBG51ldLSEthnLq2eBrmwTT3CfRpb2oJKFlr+OlRVyxiPMtqZ5wUmm0Obw9/Wg+CqMTQopIXAfazb/R72m91bOf+hKCyxpxAw3BLWf1ZkGZhbcGOPwmkCCjc1oOTvPX/mVIYQZeGw6VfvyzCs4jXGybcs3X293epXcNdEX4OqqcSAmJKaMTvbZS3XlXks5IBRonIvMnxpM189iym++691sBjJLPUHKlcapp3liFWdF7D2LLVcZa6hE+wTd10iroGj4VVQetxYlDK35DOvrUGatcVq+m/PpvpFwc+5mhXcpMIgAnvN8HAGR8wURW9zZhgeR8B41A5yR5kv7nKOKQM6Y4vfZVJ87rVXlwXymXHJpOlyg0PpR/ew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(2906002)(83380400001)(41300700001)(6916009)(66476007)(8676002)(66556008)(66946007)(36756003)(4326008)(4744005)(7416002)(2616005)(8936002)(54906003)(5660300002)(316002)(6512007)(186003)(26005)(478600001)(38100700002)(38350700002)(52116002)(6506007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4GAnWaNy5Ybh2j6q0rtmNLM9gbhU0FOSbfQb61XeoNXpy93ekbQCKEL6MBYG?=
 =?us-ascii?Q?T0yx5GyV1NLodrIZVho9VBWkOpW4CTc3pCPz4dDRS1yVVGUGcZa0OD9odgJn?=
 =?us-ascii?Q?d1SVKrLIYqptWicZX+a1Wvreb4JRdfL1wX/B3GYmybBFZ2irzcF0wZR9An4p?=
 =?us-ascii?Q?MXpfP7vvLheoLWAx3VNjuCKw89R1TMfsnBetbdgnqZZ43jy4kKNMnnVzMNys?=
 =?us-ascii?Q?QyDOj9hlXj6gsYgUBWvW+1ihpmW0p38O6ZYORa6Asariu1M0yn8w5CeKhFp0?=
 =?us-ascii?Q?L5Nf2hb/JmzCWQscdu6eKPTcto3jtlclvmrSn7M221tLLx/IA7YXZ38eGFf+?=
 =?us-ascii?Q?AckRVg+P9F60NKFogAsszyID26A6ptNeEd1DVIcIvbdSN1lTvpkQWP6YWoS1?=
 =?us-ascii?Q?GmlAYgKhH6RwuNi3iiLhjt3dOvdlTzomYOADNPk6KKDcQ1ltEq89wCkBqyVu?=
 =?us-ascii?Q?Ci9YWDMsdMFTVYkEKFs97y9pOdqBka0UNvXiI/Ny+2IPfk4Nk3BcfjsFKe+e?=
 =?us-ascii?Q?qKruRYBPU2QiZ2ujh9na7GtE59JBfl54vnE+5LKhe+FWDCQd7kF/xpiuD44A?=
 =?us-ascii?Q?gCqS4nZO50D3/OtC6ah5lN+GwOy/saIl+vQMFU8WsoiFI5QNOtLhH5fh4lED?=
 =?us-ascii?Q?c0PSk5536KQVS9sS+xbuNf6hjxOmVmH1IYf0k6nQLY2C8eCWnJyLdJojIGJE?=
 =?us-ascii?Q?bKAAd26zBb3FyF3aZz8nnO9uI0MC7NiRDnbvYw1zmSUhtmYN5gP326hJ0cnl?=
 =?us-ascii?Q?T859kDLPmjvdUz1bsth5nP0/0xkLrbyYYYcQ8E79xU6WAx43ekA4x4Fsk5va?=
 =?us-ascii?Q?ZMnqGZuQRSljnEzNQuetdjgyFvSuCNoKFaul1D/GMIPG7a+KkOQVPuZ3ms6Z?=
 =?us-ascii?Q?CP2blnYngLxf4MzZudKFDGMB8DL5I9jbABTdSKLyp5Vszgtq/AKJSHGkSOnu?=
 =?us-ascii?Q?UJyedYUZd+fm6tQVdcSKyvPxFV2mFYLugf32iBIgbaSFVq3RxqjuZASC0LoH?=
 =?us-ascii?Q?O001xusf6EZnocrWEab7yKCu9ezTzGMzn9wkFHAZTZVOSI5rmN97DTjYFpO6?=
 =?us-ascii?Q?RtsXjD772Xc7XoFstsaz7vP77ZQvUr6ekjR8whZU+N1LW2iHsuzgsC1o94nA?=
 =?us-ascii?Q?jRA7GlCFMyck35o+UvEmn0pR8QBiu+u/2906z9iI09PIxDZu6lQMleGCqDef?=
 =?us-ascii?Q?aKborfT8luXOD+o/nY4AA/hKKRASC+APoFwEV1OHzubKhwjI450ozpDxrYWq?=
 =?us-ascii?Q?jlEHJ1RjwHB3sqFye0OgA3zX5tEZu3b5EJPQcFOK+qRt4FT4eNnel0mAHxEE?=
 =?us-ascii?Q?fivpShq/yHn81Nu44up14sl43kPRgpMvbv69We96b9rKe+B3jJDCGqIJyYgG?=
 =?us-ascii?Q?tHwQSbv1TQUL7bJIW8R73VtwOc7qMWYKlcshz+DXHPAEEFhocPWGluI8JAmo?=
 =?us-ascii?Q?Sifvec8fHbwP7i/ra+EXJYAqqufWb8sASzLEhbCmGGFAcn5TWV6xV1UhBmi1?=
 =?us-ascii?Q?I4bWeWOqWrD8shqd6hloyGSNe5+jeEK9ZVOTRrGOKen+ddxImaNwOTDWZVvK?=
 =?us-ascii?Q?qjIpzEfyHrR275LtQJie3EwT1z0uG1KRYyz4RTONFuCSaNxHo70aNhiKbhRh?=
 =?us-ascii?Q?ezkyqRZi423sElVwb1LUwio=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 891176b5-4de0-4dc0-2c02-08dafab45703
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:02:48.9106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yS8zf6NrZ7hefm3Uzvbc9PVcurMMrppoEbOtR27LYtkq4oXpdllWdRxPr1ut4mxGCK6anpfQU//+91uq4l/o4l1Atmp5vn0zbKjsuNhvUb9HMN5MGjGGrUVwvGfjMW2g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9337
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko Stuebner <heiko@sntech.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/spear/spdif_out.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/spear/spdif_out.c b/sound/soc/spear/spdif_out.c
index fb107c5790ad..469373d1bb41 100644
--- a/sound/soc/spear/spdif_out.c
+++ b/sound/soc/spear/spdif_out.c
@@ -244,7 +244,8 @@ static int spdif_soc_dai_probe(struct snd_soc_dai *dai)
 	struct spdif_out_dev *host = snd_soc_dai_get_drvdata(dai);
 
 	host->dma_params_tx.filter_data = &host->dma_params;
-	dai->playback_dma_data = &host->dma_params_tx;
+
+	snd_soc_dai_dma_data_set_playback(dai, &host->dma_params_tx);
 
 	return snd_soc_add_dai_controls(dai, spdif_out_controls,
 				ARRAY_SIZE(spdif_out_controls));
-- 
2.25.1

