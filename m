Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4855678E23
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:18:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D907EBF;
	Tue, 24 Jan 2023 03:17:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D907EBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526695;
	bh=aBIS9eLwcw2qWqc3fSOiP3StdWrMhyu4mnVwlbnI1yA=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WptuVc+k8ipJje3cl+1uYtT7MunTeRRPOx/nz5xA8fwUJDAaVZuS9lftmw2YC7/bs
	 cgP1D04HbnkRM+kIcYbWuPB9wdeU9xEoTsnjfTCwTLMYQOATx8qIYV0oKQoBsbdB3s
	 POGo4tq/iFsxMG93/26Ed76C6ELWtwwQJUxZD8I8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6063EF80548;
	Tue, 24 Jan 2023 03:17:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BADFF804D2; Tue, 24 Jan 2023 03:17:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2116.outbound.protection.outlook.com [40.107.114.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56CD6F8025D
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:17:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56CD6F8025D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BNpzc5of
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWDLIN1FQA3wLEhvU0MSPWGSLdTAbUbpA1kD6vhtf8t/JiMTmgM4VOeTzfD1snfdjtz6Ainsl9m3iKkyGHzlqgnHeBAXthUvv9le0meI8UWxaHtcMfvH6vwljfRJ/qDWe/t0an55RWEpHPkCAO8HjkGStEenTgtWTGB55M1oHV8dI+nMhr9GMGAtW7WjRV7CXFC5vi6m/Q9DxzTUau2T926vIVx5sd8DcI5yGVW0qq5WlDJaqmtT0WFLVmxREcKQYavI3M98ViST73tnxp+SGR/p8s6H9FhIlRff8t1GMp+MLvbRN33TU9Izfpn3QFSzlLlxAqUYJemDGSOe3qCIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXK2sxJk8N/3kQByOfVX60fjYZw4VWoFiws6HBc0z5s=;
 b=D1SVw4w91WuY6KRrm0z54TuMRaUO+OQPbgkPkGA9S2l9s8eyVwVY7gWgC6/vBGfWWQ4Rjn7mXDTcDBN2Y6zR6ZvIMqtYNsDCN5NjsJPZFuiGaVrZqRPjfp17V+WYkW/itg67h+mbTvRKtTUoG7PDxDADMEoBvjbvRdGj3eMQtm8fBRDPu+frkoZyAVsFfaOYZGvwYOj9ltIjvHAhd+sMRZT3woy5m7tMPDi5oegk4K2S3hVhkrbibM8Z13ZQVaQscuILsLjCQqIo4vUKU2Tc0fuaOWWcFfQBeYTLVnHgKSPmqh6CTU+kh2tQCkBCMrXEmsmNd9gLH3ubM0YPLniEyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXK2sxJk8N/3kQByOfVX60fjYZw4VWoFiws6HBc0z5s=;
 b=BNpzc5ofSsFrVTB10O5M7kcApZe4AzxKXFuwSslro8ULnAOzRozv/T7W4T4KUq2V9TYYr4beriDl4IXeeTvLiCnVOm6JI3dI1iv6uy6B4QGoP5p9QAY910xh34qyPAWa+s4KQ9Jxk2eLh/2o8GN+hfgXU1kd4fImV4Ki8ZUHGT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYBPR01MB5391.jpnprd01.prod.outlook.com (2603:1096:404:8021::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:17:03 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:17:03 +0000
Message-ID: <87zga8smld.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 24/25] ASoC: soc-topology.c: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:17:03 +0000
X-ClientProxiedBy: TYCP286CA0095.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYBPR01MB5391:EE_
X-MS-Office365-Filtering-Correlation-Id: a2958b40-1d4b-42c2-1155-08dafdb11532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UfxwAYLKLq6SbU8gtbtwrJ3u7gZtHksaWYviAhihXMBqmUix4Qj3TggQCPlv+6EjFHOQd6er3YKAmpqV3dBs+GRNVDllifAReMmxrg9goObbNjf7vC4xhim08v6oRjkDbMjiH+obrNhJrMrGSMFYyiOdRyKQohB8Kfie9MqAcmo3zsRnq50Zmkf79Ci8Fj6YhFoDUGarbk75M9glN5KqgAK0/NO9AoTBhuphJSRv9h6AdCs6/31fYMEFa6LqkMTYMyvwB2v661tC5IZLRqtDaw7YSoDHJzDqHrw7+i/z3IqB+NhNC9e1qPyJwIK9K6n7RX6WePVcXhjKy7tVSLuIIIA5YgwiPUqsXOzgqgmkOFjDpc5sJT8vn4rrMwr0I4qVrjYOR1n6aA7pkm511DbedJzZHgcgoL2+PbYRaN9Z6QL48xtqYy8wA8oBwOJuBC8P0PzQZsg/E2xsLBvM7CB4UHd6aki9FZ8upzngk7sOzgu1az4PSxColHVeY2G7aDgg4Uf+yUnZ4oBhZZJOZMfJ5UHsrGGp2w3/O8SxodEYUl1AIRH86EhyL7ZeiCv8MDfAhgMs2gAcvXg1ugT4oXxx/K/PnHSnlY0fUnQzVYCZ1JcdLA/22ZNPcUdzVtjvFgXmU+f16GobvBibpDXw51fcKfy4rWVSnn3m358QqdrcAxwVm9sxOlloIlh3gkmMJ070rttYJI3cC+tL3mRF49pIBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199015)(36756003)(86362001)(2906002)(38350700002)(38100700002)(5660300002)(8936002)(83380400001)(4326008)(41300700001)(66476007)(6486002)(478600001)(52116002)(6512007)(6916009)(8676002)(186003)(26005)(6506007)(2616005)(316002)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6s94qUA8vErGs8MaVL9KPy4SyQTnfDrGsn5er//bJEb9LKuJQ5/I9+SzdRnt?=
 =?us-ascii?Q?UTWKZEZCFZNsM0riPyJYC531LXwVDeadbLrfUSjjFpxkiTxG/SatB3cSOFyZ?=
 =?us-ascii?Q?5sGKoUlPGf9iBDY0FosOePzOIFaHdZ1P48iNcSlfGY3vVHXheEOnhmRaoNfK?=
 =?us-ascii?Q?S9DzfTZYZbZ+a+owGaDKPjs3eAphdFuPaSgIKCguC6MX23ZbNAagPDSAAvgY?=
 =?us-ascii?Q?G6q5udmWOhmIDOCO86ddijUa87rCOCZDUEL4mlSukfKUUb5RU79AwIYDlvgm?=
 =?us-ascii?Q?HcxEFX1Y5zMLgKPHByvm98Ipal62oVIaLYfcvD14RobJxi05lFsd+wGhIyBT?=
 =?us-ascii?Q?w30QbEszWQwhrAWRtejeSrxgjLYolbdh0xOWB6EzAd85maKXfOMuGTgNqNV6?=
 =?us-ascii?Q?m5ER4IlelRzlpCAQeZx5IbjXIl2fEy/3DosX2gxmTpw0C+Hd2eOjiGsBZZn4?=
 =?us-ascii?Q?EKxTg56tEs65ipz2ifC6uJk0/FOsg0ZyFYTrVVDAaL4SlcGjNMxBMS1esdnc?=
 =?us-ascii?Q?G5QhkAAZD1RTdTDF1ZcB9AYUJiqoq6NgOT2qNK0ALvYaA/AR1v/WlNS2D1Tm?=
 =?us-ascii?Q?Vu+tEzl20UrLSzbzkKWbDoQBilHBWCZzIuXnLxE/u0IcAFwyGx0sTdXO3ULh?=
 =?us-ascii?Q?wE6P1f5Qltm1a7HnzTNzYnReLcJ2tgvN43/QrQGAnj6GRx6oOutIGG/jNy4g?=
 =?us-ascii?Q?sKDd1Tg2p/r1uNo0BfXBsEw3rLqUQE/8SYGQYwcMl/5JwnSFaEdIiydNTraD?=
 =?us-ascii?Q?KBPQ7C0a2Mq3hyIgjMLRhZPDkVlcC9MLCfX4An1LoceucMJ7KIZA4xbMbx4n?=
 =?us-ascii?Q?nN6QE4zEn7+FRemMMYWGR74nm/nuhst9Fnrfcviy6vtyB8gAAvL29VicdbgA?=
 =?us-ascii?Q?jUGvUIMAkr/N/hPF+iDRZEDG1CWVMvJIa+Om6mptRyWESitSh0rPk4Q/0kZF?=
 =?us-ascii?Q?p4RfIglD3kF2ZPZ2VC7pomOd/HlxaK+ZdITH4Idy2cLwrL6o5702rQBB3vEv?=
 =?us-ascii?Q?KU0qftm0uZoxVNtMmSR7hCAgRZajKaJrQBk3ZWk/lN3AxqgXmya91Gbbismv?=
 =?us-ascii?Q?nefp+WcTttmQMF2VBD80XEmAGcb+JKPRF3C4zH6Xvht1OPX9gSTY7vO6kzEf?=
 =?us-ascii?Q?VmqMupIGcuxSwoDXyTdphQxgdNovWeX0eRc6xEEuJQbZESSb0I3kyENi6frU?=
 =?us-ascii?Q?elFT3B+loKsNDci9+8R8HbukaBumUcZrkNkWp64GDZJ24JToaZP0u9j79UFd?=
 =?us-ascii?Q?RiM7ak2xl6Z8fBgZm6sqj8VtsGrxyvyh396c5vtZiBcVqTuUavSCMCrP5x6F?=
 =?us-ascii?Q?uMDHyDyzlQHHNPlhaKtPK16dDMVBGgDdn2q82JgoRdE9eXzbwpM2hD6gQGQM?=
 =?us-ascii?Q?97K9Bk1uI2Rrz/3+YYLyV/rMXhKNTK89FEDH0NuLR5ABnJ2qLFKRZCxg2z/0?=
 =?us-ascii?Q?xecUJnt+qlk8YqO4BK53REM8k3LHNmOM+glYfb7cVfLN9eU7cf7+o6wmLfTP?=
 =?us-ascii?Q?eis9stBwOh9cvxBBHcvY/mI69ZGtW9Gw6QYjDdTBKeJZThXS4ur/pknzzrrx?=
 =?us-ascii?Q?YtnfV1H++9X3NZzWVjBnaaD14cCHojzJrm5fixtKDzRnzkhe0ypwk2P8RCss?=
 =?us-ascii?Q?sJQ4MzAjhxzIlGE8r98CJwI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2958b40-1d4b-42c2-1155-08dafdb11532
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:17:03.3769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygXmsiQ9w2tZbG4Tvn0FRVsA5vwiLPSDX6MGTOuFIFpyZPIalU3DaC0c0vBUFEJUAPUMJ8T2RTKcNbdkympKw/1mJrauympuM6uxKqua2/9hb/RzQnbaZDfDD215Es3c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5391
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index c3be24b2fac5..6bb3efcee3b9 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1468,7 +1468,7 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 
 	/* card dapm mutex is held by the core if we are loading topology
 	 * data during sound card init. */
-	if (card->instantiated)
+	if (snd_soc_card_is_instantiated(card))
 		widget = snd_soc_dapm_new_control(dapm, &template);
 	else
 		widget = snd_soc_dapm_new_control_unlocked(dapm, &template);
@@ -1556,7 +1556,7 @@ static int soc_tplg_dapm_complete(struct soc_tplg *tplg)
 	/* Card might not have been registered at this point.
 	 * If so, just return success.
 	*/
-	if (!card || !card->instantiated) {
+	if (!snd_soc_card_is_instantiated(card)) {
 		dev_warn(tplg->dev, "ASoC: Parent card not yet available,"
 			" widget card binding deferred\n");
 		return 0;
-- 
2.25.1

