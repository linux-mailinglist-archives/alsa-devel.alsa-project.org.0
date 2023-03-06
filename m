Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 939E16AB460
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 02:45:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7466101D;
	Mon,  6 Mar 2023 02:44:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7466101D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678067110;
	bh=mqW36VC/fypionQ2dYGLOdxe5CaViIKAffJozvpRv5I=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GjPaTEzD5IXUH2UDEdjweYYQziAsZZa/0tm7aESrap79zuZMlNSwbDSKMTIFAPyoS
	 0EIDnfD2VH5EP9+X4HhUbv9vApWlOlF3TVGdZtC0SySzBc0vQ8J17J8f9I0MUBZgUW
	 LJAVQc++o9ye1uzroKQZeuPHY1QK0a1Q/N+SCAeo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2064FF80236;
	Mon,  6 Mar 2023 02:44:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3AD9F8042F; Mon,  6 Mar 2023 02:43:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-3.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20730.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::730])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E28F4F8007E
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 02:43:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E28F4F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mnrBtTG0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VukN+D8atl7oQMxMaulWsNJ1PqkE4BUdoz3i0oWGuaAxUrm+FJvjd8JhNJo6LkNTBTNM3gRaAHLuu7B6NWE4cD57/wnoXrYkh639fsz/Bnac3nY5WJxUaehZYMSVHWMCPErllmnugNXsalnULLWghTDI6mW44VSR2+UiiQ7la1xxm8dwXExkh4h1Ecccre1v8CWMiCS5oGmJKtqEgH1W2y+9PDar3dhMTQYqItkhqhCV53HlAfLEoMY3u3hlSLaIuIFfbwTsM+0BPIm+g8UuAta+LTXxti5G6XrkLZSkajkbctpr1cmpMMD9jIJfGNOVk/zTVYgSgBZpTIxdY7dF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCDqd11+jFDOlmV2Rpy+kTqVtNvPgWZxAcd85GjsBvo=;
 b=IP1IzLRIk7cP1kjL+uSpG78S5axg3YOguN7ykzns6WUn7GY+VBep0NPB0vYnELp6wm2ovx6ehbo5b5tOT7G9WHK+/VsvCTbrssEU6wUMnjT49k29ZdPTmheo+4+WrD4aJKR2RLf/K7afyjcGiE/ep06fFSjNTSVo5cGR9eoV/W5Rt9kFes9GYIDf8BgnKbWplldmOLi7Poz44mFU5eCB4/O7+3lY7F89zRKUVkzUK61AN6MnULDylXPZxZkC/P7kDZrCyU1vR4GafzBXKOk68+jcLJvb3YXA7rRyNTB8xHoiciTs5/3ddzipSDp7Dnmmf1dX/vbxG3J4zHSbOcVUqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCDqd11+jFDOlmV2Rpy+kTqVtNvPgWZxAcd85GjsBvo=;
 b=mnrBtTG0lwHyhbfISGLpz5BYEBRfEk8JMJziMLFKfnUjZSSL7Bf/s2b62v+l+VuAW9tHxQ3a2MPt+R8v45Kvg6f/rEixHHEveeXnCZSpgFF3t+sV9NJR/mDBi7d6Z2qTZyAGIwK+MkyPmbr3zZrS2zrLSq78zC9wi+w6Q9lKdOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8747.jpnprd01.prod.outlook.com (2603:1096:604:17d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 01:43:30 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 01:43:30 +0000
Message-ID: <87wn3u64e6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-dai.c: add missing flag check at
 snd_soc_pcm_dai_probe()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Mar 2023 01:43:30 +0000
X-ClientProxiedBy: TY2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:404:f6::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: 8facd3a0-2b18-4b90-3d78-08db1de4306f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YMrRZdTk64A5xCqup/1W/SBnLCPaysaaz5Ol1gHH0BVcnwG+yJqXOnv0rpxcaVPX8Hlood7O81N2ovtQ8fxY7YBcEPQfNsJJWJiSF0UFj7H5bZ6d3zBI68T5nweoXYX5MIbltdggCYbgaGbB3UBuXa19zF+jmEmFsQpDRq4jKZr9eFESVytUOD2bNWnxhu6EneFic+KnQdAF74Gk7aLIKP2/qOUQplMm2g7IOyZXTz+NjyxGqT5FmHTE+MS7uUxMU2XEWXFag1sTleGf//U/OqpwToPel8Mevu8iKkdgOpPk7p0jrW7w9VfU2vShRM1WLa1KKWc/cqEBvtGOBYyKULgjXSEW+6cqwLW/17vsb6tW/KCqvHirRKBJtyDHsElhrzwMhqV7Ao4ngcDJW45K2tCEbjPkmyj0qgL3aDi5+Jf4Uk/66Hd/kPVE6FXUKjbQU4lswemWdfGpSmtRYq06oGsRFuzXrDQbG3kfkvcYJ1iLrESRVkNymnzwoJ0IVIaWME/oi3vlO2Y1pUQXbbnR0yC/1G1eqb6BsaHG48HmwQrpgdUQHPNB71bjP/vBLjVxux4yjwGNcouJRAPsL/x4oP4+oAL951Lju9Ryw8Na11+6lL9RTyMvOjunT60be66I8k6e+LrfkKEwoWhG3gWG6uawxN7kOT7uBbbz8GeMy7ZcBERiIzTPLFBAaVjajbPCyrHzsDKgyPEU8B2F3CNQHA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(39860400002)(366004)(396003)(376002)(451199018)(186003)(38350700002)(38100700002)(8936002)(66556008)(4326008)(6916009)(8676002)(66946007)(41300700001)(66476007)(2906002)(5660300002)(52116002)(478600001)(2616005)(6512007)(6506007)(26005)(6486002)(316002)(36756003)(86362001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fCfQYYBcstBrY/Ejqssq2Vej5puq1UydFpndAwU3kTK2gxlaPtrjV82ors92?=
 =?us-ascii?Q?kSxCGiVf++1e692bo4etu80narmPgIc83Kk5fF3ZqZR4b4vOP+1iUsVlUj8X?=
 =?us-ascii?Q?B1y+sVJVc8YN9N8k2Nx0GS2jtOdgYA6/PK955/Dr74Q0oXsTk4TW6bIQGgqP?=
 =?us-ascii?Q?9dIGNaiVNs2JSOtPkAHvUFQVyotZYQKQX9wwhyX0w29dTPnJP8qCEf8vB/RC?=
 =?us-ascii?Q?LO3SpHOn6m2CabCXz8fF9JXvf9QGmcgJc0KksqX1JOWYNsDmUlZjUSTl3xy4?=
 =?us-ascii?Q?N39LkemRnYmM4Wj9Fndiz7PRDTMD3JAemWCKXOJHedeovuRA/AqAeJ1bNj2P?=
 =?us-ascii?Q?78cBmlp10PNV3yQMe1d4rX56NLG1LO7dh84hMD65OlkDcMk9+RZyluoeCfN/?=
 =?us-ascii?Q?Hl5m4Dx/jVPdVzGBss3KvDF6e70gt6JTvaDdbF8QIl65eXXujqPvqfwf/mjn?=
 =?us-ascii?Q?dCxn1rmVSwSH9HTY7oeGnRVSMIziYCXTfQDJuyL7kD/XclOW6PRAQlUd4vKk?=
 =?us-ascii?Q?8aW4VihSa1uFG0pYlxzUd2XlIbjxAO+Vi2jcBYoU9DcwMuygna+Od6YRSow2?=
 =?us-ascii?Q?Pr+Vg+0cD78xwW6AwusnYWyHBcwZ3vr5LBKRJqslMg5+M57fsbFgdeENM2jY?=
 =?us-ascii?Q?MmJImEc1WpbkSrflyTzjegPKvSSuOls6ziqO9rv/Icuf38tHp956TECLSplw?=
 =?us-ascii?Q?ys0ywaaQU9nOkTysCcgl4lPD4DVJ5HBWUQCHWF3XYHJi65sehmqBxEncp4H6?=
 =?us-ascii?Q?rawRVrn86z9BUOwcqwg6QPLCXTCltWu7PFfakIRetlfcvyezXLKeiysfbYaR?=
 =?us-ascii?Q?5AvZavO7dDrCfBlE46BulQUdeev4r0QjCprr1ZC7JLVC6wYvq419fd5kuUkE?=
 =?us-ascii?Q?MWRsOh8s2udSL+g94c3LLiec52alVSwC3Ir4lDgS6099l64mOtTq/UnlWjhT?=
 =?us-ascii?Q?TyXBKhFyVQ6BJHmLIWHEWTohLa597sdry5fFEUONl4k9tR47LWbgzUK6orwT?=
 =?us-ascii?Q?gV14/p2WBo5Egxk7UklMtY+K8Cm1AYh6AaASarjzBke+ptB+jBr5JSzVS0jj?=
 =?us-ascii?Q?kQpk8SD5TcpT446LKRNf4G+NisZkbdQsfWBXfaUB71taxxcZf0PbjOG2vbOO?=
 =?us-ascii?Q?M5jeYcsJSA6n/L1jbFSyIuJbe/8/+EjxQh0ULQskIQbQw4ziNDHOhf+jDmKr?=
 =?us-ascii?Q?KPLYSnhid3tVI1MG2S/3+ebzQjWI66oBOOaiqp1rkGBZf8wNkgjfhuG3q0vX?=
 =?us-ascii?Q?aAmqgvpkkjOh8DgglX98RpDiDRtW5vW5NVf+NGaBqjL5gvtqJ7rRmzLCCUEs?=
 =?us-ascii?Q?4z8NVvdHPNhdYGW/nnTTC0wKl9qWkj0rBxcQQYxS/6J1vc78V4wuSMrwTCsb?=
 =?us-ascii?Q?QMPlbr71NCOWnLPx4z/uBNpebb8kQqTZ/fNqpM32XZY1/iEtQOrYNHL/izce?=
 =?us-ascii?Q?ClVh4ezFmB1iFouwkarZvWIKAP5nWbpyxZJ1v3ZojWZPi6ImjgQkhU+q8L6o?=
 =?us-ascii?Q?EUKvNr5m9vVzrKbxwW97C247SqAonPAtVyXPandzIQt7mZn4LvnN8MYpSl1T?=
 =?us-ascii?Q?/oxaGJB2RiVh/YvT9SwKck5tg3PPAPtI/tT58lXOgsnViYfDECIb+FE3Bq2u?=
 =?us-ascii?Q?OQjNVW6qFnJTV2ACu93SqdQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8facd3a0-2b18-4b90-3d78-08db1de4306f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 01:43:30.6652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ldMJBTkW0YGQSHswjaMwjAEU/PLgjidZnthicAn6/APq4OxROxTJq/bpDQKK3ivc/H9UWhMZDQRT+I38mPE4moMMkm2kHO0eekBMfPhxUOfVkcyop8lXdSsQ03RvHWWZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8747
Message-ID-Hash: WXH7JFSOG7I4N4D5YKSAB2XY3ARS7OPG
X-Message-ID-Hash: WXH7JFSOG7I4N4D5YKSAB2XY3ARS7OPG
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WXH7JFSOG7I4N4D5YKSAB2XY3ARS7OPG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dai->probed is used at snd_soc_pcm_dai_probe/remove(),
and used to call real remove() function only when it was probed.

	int snd_soc_pcm_dai_probe(...)
	{
		...
		for_each_rtd_dais(rtd, i, dai) {
			...

			if (dai->driver->probe) {
(A)				int ret = dai->driver->probe(dai);

				if (ret < 0)
					return soc_dai_ret(dai, ret);
			}

=>			dai->probed = 1;
		}
		...
	}

	int snd_soc_pcm_dai_remove(...)
	{
		...
		for_each_rtd_dais(rtd, i, dai) {
			...
=>			if (dai->probed &&
			    ...) {
				...
			}

=>			dai->probed = 0;
		}
		...
	}

But on probe() case, we need to check dai->probed before calling
real probe() function at (A), otherwise real probe() might be called
multi times (but real remove() will be called only once).
This patch checks it at probe().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dai.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 0119afbd01fc..02dd64dea179 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -542,6 +542,9 @@ int snd_soc_pcm_dai_probe(struct snd_soc_pcm_runtime *rtd, int order)
 		if (dai->driver->probe_order != order)
 			continue;
 
+		if (dai->probed)
+			continue;
+
 		if (dai->driver->probe) {
 			int ret = dai->driver->probe(dai);
 
-- 
2.25.1

