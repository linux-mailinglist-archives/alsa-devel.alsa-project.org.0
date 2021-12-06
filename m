Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A95A546925B
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 10:27:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C5022023;
	Mon,  6 Dec 2021 10:26:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C5022023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638782847;
	bh=RTdpfciZddK5au99MPVOTE9qCiK314MYLTn91JPbiGA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EQ3ysgZOSZMY4Q+cy1WVnlAVn24/TpgOqQMHdJtW8OMHg10yWDrOTCKgt4VWnQCNz
	 O5XZtW+F6J0cSaPoZl8dTp8O9Ws4bImGJxG3Ydyz320LC4gxbky6rV617Rkao68TQq
	 QmKelAgLGDHQK4LHFsSFLtdcuz0Au+UGzJtqzVno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DC22F80506;
	Mon,  6 Dec 2021 10:24:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45063F80143; Mon,  6 Dec 2021 03:11:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2107.outbound.protection.outlook.com [40.107.255.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D38FCF80143
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 03:11:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D38FCF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=vivo0.onmicrosoft.com
 header.i=@vivo0.onmicrosoft.com header.b="F+Fm6UfO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNl2eSVdWahh82lNUxkKqydt7YgulBBZQoupNO4eDseKFyAHr1RBfCN6ta3GcrHGLfOrT6pneuX7JHDfzJBVgwdHkh1izin+jcy6THtymhHH4WlH3jJse+/6EFzhfnxj9ZQVhoPo+RZnkD4PitQhgjH6WVKBFOSJgYIetx+zT8i/0lxbYds4mrVIhcnUUxRr7Szn2JwErRYt8oRlH9pkbhRr6+Kn7pkEeakbz+yQKwuQ6PML7BxOiyzULRJI2MhNuBam/CI6eR8fpT7WyaWoLpf8oor7ExiFsRa34G6gKovJcZKBpGVrr+o96yR1fmuFkkVXvJDqALNB1P4kWq+iLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiADpoOwnx2JDT4OflN/3QEjPyBZBXzm3MigHR+hC7o=;
 b=luSY9wW1X9TrSrSoZEDn22lotK9XiwiWOFhSo2ofmXK6yBnYIVSqK5wCygH/0BkGr8ZR68OgDAt22ccXgjVU6B9okq6jZqGMomp+9+XvFQ0Z56RJERmS4C96uyMnNDGIRmiv2hMPNOkQyzhAuEOmp6nb1k47g0hkUirtd8VStEMigDNtAH7+est6EXWj8lLnO9FJwu4YtgycRPHP0U4QTKV5ZKvLKJ5V7EqHWBtJn/H+XHjGaOHUzefmXB/D0xWlxzjEpPGauXCdwVQIkC0Rt3eHRn2Lf2gfO4Zg/3c5Ak66lIUlmi+tuj09SVVweoHGVu+mdzOW6MZRw1pZjuIa1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiADpoOwnx2JDT4OflN/3QEjPyBZBXzm3MigHR+hC7o=;
 b=F+Fm6UfOT+FwntKhJPBIIbwf9W/4mKCbb3ZNhjK7pWjbVdAXJF3wPfLd0KlxqpB+EsaMxDoa/P3zyiUuqH+4YYcwEnGhIwk4ara2kjx2tGmygWYTdr0FwCcIrok/34h5Ni0Vqe2fBv4td9K6rIrLnz3gG6t1pm3wZx1JykLvLY0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PSAPR06MB4357.apcprd06.prod.outlook.com (2603:1096:301:8a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Mon, 6 Dec
 2021 02:11:12 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::ad23:f8da:4661:7fe7]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::ad23:f8da:4661:7fe7%7]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 02:11:12 +0000
From: Bernard Zhao <bernard@vivo.com>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH] sound/soc: remove useless bool conversion to bool variable
Date: Sun,  5 Dec 2021 18:11:00 -0800
Message-Id: <20211206021100.321170-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0044.apcprd03.prod.outlook.com
 (2603:1096:202:17::14) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
Received: from ubuntu.localdomain (218.213.202.190) by
 HK2PR03CA0044.apcprd03.prod.outlook.com (2603:1096:202:17::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 6 Dec 2021 02:11:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0d818c9-fa7b-42d7-c87b-08d9b85dac98
X-MS-TrafficTypeDiagnostic: PSAPR06MB4357:
X-Microsoft-Antispam-PRVS: <PSAPR06MB435773C130252A8412F7F6F8DF6D9@PSAPR06MB4357.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:66;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TQYdhC2afvX7dgxm6JaPo4QqBHVizuiMCKDg432JcmrudheWMLqoJ3N88hLzK5sVTynk7Qh0qKypCgVivAKbChi2oPhuuHDROcDZKFEMG5v2m74OzyshutolDZoKgQLX10ewsxBdM42MfAgtFtuACCUT+r1n5e4xAchLM54IY3lS+76RQZRz/BoaGBta/HpFbTX1LLcjf2axWCGiAwrEKDVofnJEg1+lLRAi4ft+kBbOjjNIMRXd6KpDTietnKFsHyaK7TA2SWQ5rrtkQAAt5v/kJcYk0J74nbHlW9Pult+BIfLn1/8xsfRNdQgaXseu1zh+4fi5irbIWy+s5/XGORaJkyAA9D5rp58GlLqRKpAsxDzHxRWRTktLPerrOOITOeDsSdEsMuBiGxScUJ/5GCJlV1YNY8R8BNgo01xjZpRz3knjdHrQ3xQjGADZ/Y1+BAgRVVR+r79KvwVueO2a2pWqQGi7vPH5aI7gr2UreQw2R4rkMy4/e1a7C76o2hEFDDNyG4FA3/3bpGFk4+YMGgLqmJ+i6IBNefW8DEFTbQN0FKAtbygTEVSm+EjdTdOJatewbdTqQyvUeafrQjD+D9tpffOw+CV+aOru9aketFOF+pcJ/x9hsnlIr/wu7xRd/O1YyBhyUmml8YzGv7Vjpa31kjyKtt4EHV4b+O5IFkO2JMktZvUgKCfAy46yNF4X/6OJagRtSDUPslWYUYT4nQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(508600001)(52116002)(8936002)(4744005)(186003)(83380400001)(66946007)(36756003)(6512007)(5660300002)(26005)(6506007)(38100700002)(38350700002)(6666004)(107886003)(8676002)(66476007)(956004)(4326008)(86362001)(1076003)(66556008)(2616005)(316002)(2906002)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cHBFZECoj/qpT7pjotLr5Mj07vEe3GiX2d+bpXcNZgold0HCX4YZUtxA4UTc?=
 =?us-ascii?Q?X6YV2yaJQVxiTtR8kotb+rW13Iv3DcgAHnIY1uATvjltaXjz/mGr9jJdGQlr?=
 =?us-ascii?Q?wI1cm3C7pMPeEsx70V85vuuVEbs997T9hnaV7n0sWHGf8UESffwtdsITUW33?=
 =?us-ascii?Q?ad8OmBVJx2QcfO9dvrNEJQmLP3sa20CNyG4Umahnm2DOVRYY2rkFm8L9LiBa?=
 =?us-ascii?Q?WXUGrihPTAlbUtdS853+zS46YGUNnRcDCsO/pnwxUtI0AZZtHE+XHZn+f9sQ?=
 =?us-ascii?Q?T2kLBLCU6s3CK8etmDossquj7zio2E857JtMJues1WCktz0esJmyR+yLYcKi?=
 =?us-ascii?Q?jzSuq50I4xX1587hjE7WJ5R5HUWPWVW2Lf6p3qUXs0Wwb+DWycJDeK5/OJau?=
 =?us-ascii?Q?WymNuI09DojFgMe468ffDHP/OIT/za5tCxzG5ypHMvWbMig+6iKgluM+8gYO?=
 =?us-ascii?Q?EeaZLs55KWpFJtl41NBnVwEuADwsPkxNiA6RVZcREdSBqU2RiBx6hbg/JiGS?=
 =?us-ascii?Q?naSSt3SGSivW3tl7D21xfE/jhXC+c51oaWmEM1P4RQEnh3+9f6CUnwUNFpXa?=
 =?us-ascii?Q?reoRAHjFzG2bH0R5G/GpGAhR8spBc11NhRKtz9igqiBHpo0XC2JpadlVwz4w?=
 =?us-ascii?Q?M3FgZCmTU9RU3tWhzgLLFoXrnKW1n9gpVo9Rg4+rX2buJfZ045Ph5EbQ68N1?=
 =?us-ascii?Q?synBEWffm2KIkQSbJdSqyBelgkn0SF8ekFHk6YhMEbd/7RmmT7Yt9KepsB87?=
 =?us-ascii?Q?NA3T4BcNf0MWdzl07ltZDdgonqM6o4inNTinvN9sEjSy1/9esW/9vb4pULVh?=
 =?us-ascii?Q?OBJkdywJkCQBY7uEI8O/SqyqRScT2pZPuUDGnq1gt4nRQ+ELHgcJSoPiXxSV?=
 =?us-ascii?Q?rp7a/NzkoYAzjugB8PidgaVW1/48STkA0I+jl/RZIrhsjy7mzTlacVmFvoHi?=
 =?us-ascii?Q?3swCn74fHEvBaarTSBTLsLZBMsE0mr70Nruu4IXk1aIjnrGZDOhBm4c+9Xhq?=
 =?us-ascii?Q?YdSqE40cldfZm8I9Ah7yWmpQUQA8DgDzloWQRvSZPnOh2MTnNvOcinwBx9tk?=
 =?us-ascii?Q?1BVpQZSPAtuDWDBx50c45W2u9JMhN1FC7ioR5mhqpqrOWMycVsNhty3JnwLH?=
 =?us-ascii?Q?kAwBI5/+hoApEHAJNkE5sCVlXRa/AAfoL1hV4BmFh0dUQSFYKtB6mzsAq8Ja?=
 =?us-ascii?Q?V+jltYL1iFvq5PMmssnzf7Y/E9QDBQTcKglruexs2Q2LjVIhq4G125oaIFLo?=
 =?us-ascii?Q?PlBf2gAtdp0Ry0LlyGmUtHInDET+GDhB8XIWJKDb+FXn79/Wqt25UaDA4lyh?=
 =?us-ascii?Q?0G4bEPdUci5YT+wpCV4gBUWKS2H72c17GcnMeAugRXiG7No1bpAHwl6S2FEv?=
 =?us-ascii?Q?ennIVPdgkZvY5JCd1ZNEWNWSSzfWJ8nv7kf2uIaqkxbPiFV7xcx+5chzzz4A?=
 =?us-ascii?Q?rKK0sSB+FHqPDDFOXHK31GL3gP+a55xgwel2TDzdy/8lAuCdH00Fm9xq1eXs?=
 =?us-ascii?Q?s/G+Twk4fBRTdFnprZbCJ0HYUrfebbnjmDvfXi5Hgo4XtQg5xMiGiNFaSuFY?=
 =?us-ascii?Q?A8XBJXubWob/GXOV/mgaGhmIfDWbRWpFWhNzpPxvqvck4ONYxaBRwePAuzyZ?=
 =?us-ascii?Q?p6mbxEGhptpctQ3yose6z3I=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d818c9-fa7b-42d7-c87b-08d9b85dac98
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 02:11:11.8673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maH/Y6BvZeiIlgn3nnkrpp4zBUcJ1atprVxV8/m0OP9EcIVRs6jPA9pRhCJjm3jH22FtrIrbxcY5vd1fy60haA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4357
X-Mailman-Approved-At: Mon, 06 Dec 2021 10:24:03 +0100
Cc: Bernard Zhao <bernard@vivo.com>
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

This patch remove useless bool conversion to bool variable

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 sound/soc/codecs/cs35l35.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index 7a5588f1df01..961a3e07e70f 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -1311,7 +1311,7 @@ static int cs35l35_handle_of_data(struct i2c_client *i2c_client,
 	pdata->gain_zc = of_property_read_bool(np, "cirrus,amp-gain-zc");
 
 	classh = of_get_child_by_name(np, "cirrus,classh-internal-algo");
-	classh_config->classh_algo_enable = classh ? true : false;
+	classh_config->classh_algo_enable = (classh != NULL);
 
 	if (classh_config->classh_algo_enable) {
 		classh_config->classh_bst_override =
-- 
2.33.1

