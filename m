Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEA94F20C6
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 04:07:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74F0B16CF;
	Tue,  5 Apr 2022 04:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74F0B16CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649124458;
	bh=gsfJuPEyacIrhsYilWqaJabW+W1plB9KHUCLJuVkais=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZlptoKwpWUFPZY+sprOg6NIsLVx9A/R68GD80ZHaCsuz9D3dxpsSGkWrZXhA/wQOL
	 vS/ED1wjYPX+XhK7YDjI/fGDXRr5eiYB484WjtlOvryWWAoWRQDExRVGC/ZUPGQlaw
	 zcBDEFUNi1a4GhkwEqTBDlbM/oOHz0sOSGlgW70M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09971F8049C;
	Tue,  5 Apr 2022 04:06:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2765F80482; Tue,  5 Apr 2022 04:06:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20710.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::710])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEB42F8016A
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 04:06:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEB42F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="OnnQYqUm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcNi8oJeidBKj3X8JtOs4l0pofx5dVDNiIbZ98evooXCS1zbXElByB217rrII8ARmx6RywotTs6qGdI9BwRLrA0/IMy3yc7lLw0ZD6aytJG738+C5e0iav/HCmTaOPTYV88nmOcJtpt3W2wPqlTDqT/AoSXnsswoA6RKyKW9yR0c+HnpqcgDoigtIEdIgqPL01tMVjOEL2PSpTwyxK5PRmKFO49cD+swRhQk0fMBeKAL8g7PUoO1jW76263QkvPG8jKJl3fcV/U9HiO8tqAAsGsIKwdZ/enXJTerhy79nkbx69bR1K1fyAaFVXotpM3564Y9wL19NZh42yar01DpyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Nkb1tqjNq37ktSZoXWeWfMYDgjepU1MVas12Mp+Om8=;
 b=ktsqW6DXp/JxKe6cQQiXcCIpcsTVxxVPe9Rrk2yzKCDh/0NBLC2MC/hchxgEkU3Yu2IA1/721G0XLl8wG+priEEta2btNB6uuUJh0B7NaKJAOnJc9glSGZI112gPm/3efhScO0FkGQM14OKrvQNaE5llL4Il6cgwBxbJfb4EaGQ2Xnh1DmQMmPuIOtIBvmkIhBHJN17z/OEqt2HHQWhFBszcoWZeQcePqwP/xnKLMgQu+hei0n35qtUuAKwinikDUEd0GyYYLWcAj9lg5YEBKKghKz+GazZp8wCnz3e6xClRgrlO7UdM1bAyIkbz1Iyqn14T6U6M2rKkizef/59SEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Nkb1tqjNq37ktSZoXWeWfMYDgjepU1MVas12Mp+Om8=;
 b=OnnQYqUmQ5lJKhwehALNIqdxKs5PhyVRRfwAEjPBxRs3Z3tMAvTFaYW+ITdPLHb3NjVRaxQ4I/KfdpjQsbG/iZn2UB0uVk8vb9JwZPu5glNH9uIEWvB6YG6a9UQ2JGlV9k5rLDaQIWehPQ1CYXXTcE0eLxhnnLhwwEcWtpwk0sU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8525.jpnprd01.prod.outlook.com (2603:1096:400:172::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Tue, 5 Apr
 2022 02:06:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3da4:1dbe:7a91:8167]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3da4:1dbe:7a91:8167%3]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 02:06:09 +0000
Message-ID: <87fsmsp9m7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/6] ASoC: ak4613: add missing mutex_lock()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87h778p9mx.wl-kuninori.morimoto.gx@renesas.com>
References: <87h778p9mx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 5 Apr 2022 02:06:08 +0000
X-ClientProxiedBy: TYBP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31d45eeb-77e6-4e37-f5db-08da16a8d9ca
X-MS-TrafficTypeDiagnostic: TYWPR01MB8525:EE_
X-Microsoft-Antispam-PRVS: <TYWPR01MB8525F27C95649A4F6FDF2874D4E49@TYWPR01MB8525.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /hLf09H4KhqCLvPVzQXbIA1Oy1hvJp0qloO1xs8hCN5lNbiEXHem0CfN4RrpuAbbS6DBJ4laFV5th/zZycQgf8w2KzLM1lrfHZOx43fbQ8QLzUWAhJVu7JTjCug1LRe5c7kcF0NDyFrBaFPgWB6rM3p/3zFEdeN3LZUNCIfFXoaZg05do7uuX5znpJcAp44pp11K+Qc0ezUkmiOX4uaUcoNPQzRd/muJ2J6GdLf6WUlzCl8PV86PBsTqzzviEJ55R2kFtQVZbDUzrql99fHCyAZDhoC19HhCe/QJwGNL9/kR2gAoMYuSzZcWA29bgu0GxAiroizr9FlYbt8r3O91ktDrG1OtZfRdIDKk/SQkytZUmlFdejLbeSEzQLuvOLCiigQlqJ5kxnK5xQcb+cTljcziKatVHyp/K7JqeR9onTRpXd+vPj0K+BEgIc8niK1jKx/2slmzWCKZBoGS+J512fZp/LnkRwegZssUuTOzgzdqf6WAQT7zWdpZMYweSk/VAvRL7jGjHENYouTwgI0hXWaTyec+8h7B9e6md8aooD/GYXJJnV4HyTwTFI7EcnEip6WcmKYWhljy1Z0Mi14F+4kMTCDK+PsU2iy+SZTg0gLr/O1WL2drNpJt6F7U/Z2jgjhd3oPyAHsW8JNHlvH7/w3oYHd78FpTGjcEzmD9Oc6gtu4yjyy5usuXht2ikJAj6d+6xD8QIS865IDq5UkirQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(4326008)(8936002)(4744005)(5660300002)(36756003)(6486002)(2906002)(316002)(66946007)(66556008)(6916009)(66476007)(508600001)(6512007)(2616005)(186003)(38350700002)(86362001)(26005)(83380400001)(52116002)(38100700002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VRXYjCAzpGcS7NHJ7lHOmL4xM+gXePY41VVdbuVEtUOZsaCFkfSB7QNIQMQo?=
 =?us-ascii?Q?zaUuRZtYbQ1HS5sdRTyYCCcbrr0crJ7SWOIN/u7qyke7Dal+YNR0o+u31Ytp?=
 =?us-ascii?Q?NUIvBiETyol8vnC0sU06NMg8zbA5NlZtSTunC03aNQCbSJCtb0IiiUrnJy06?=
 =?us-ascii?Q?yYmRXJ+WHUpKQz8eHC5bsbeNaOtn/C9eGzPkFxpw95AEj4SJVnLKnEiZv//T?=
 =?us-ascii?Q?aXioOnzix5TJh9qz2X/BopwaCFKZY1YOabWnzR6f555NmC2VpB/xJzENl4L9?=
 =?us-ascii?Q?7ZIpBGWNK4WEt8CmMJIMqW8ltaK5sUEV+/yxbSE6tiLaHZREzkIl/imCayu5?=
 =?us-ascii?Q?ISglQH+07/JuPEorGw/TI3oq+9iUzqeZIrU3CloqLzpKZtKSbyBUcrpzLGJj?=
 =?us-ascii?Q?3wZVvM+WYsOY4ldvIMlDb21zOWlbZ0z5JHU/YJzXa+mc+llrXSFysXXjWMRg?=
 =?us-ascii?Q?Z2eAaS2Nh0D7qzNFA2oCEmUwS8B/r9q6bgC8W3DAQDOerBMTztoGZE5IpJft?=
 =?us-ascii?Q?D5Kn19nl+jTa0ETbpJ1jl0GmI6RNA1t1AK4NxAdSIumNerI4k0DLYp9+9Pda?=
 =?us-ascii?Q?QJtrl6x/xNG0aAUzGtiK7Vbav5xVOpNtJUoeDqoz7kjR+LfDmieI63KBq0U2?=
 =?us-ascii?Q?3Tp/UDxigQR068YVaZGtVeyVL0DBTdII6FI2zQqI+S/UW5qdyaZMKVX6PpLB?=
 =?us-ascii?Q?1Ozezcz+PP22//SFBrPsPPaAtmbduQmrxO3753J8cnvmVnnBYH7cRPUwQUn/?=
 =?us-ascii?Q?GUw4biNRcAOoyAbrm9PHwTuST/l4kovrjeWISkPuvVyHVe4+wwzPbaVmfZFG?=
 =?us-ascii?Q?iTnLADqthHoW+tGCd1ZKK1fkrvhs5tvcDHfvD2ljUwVBjcE/9BWGZfdjKP3A?=
 =?us-ascii?Q?JxtXxYzOArUMVHZqNlHZ9R/yYue9mIQyM6Oq7/6nGVeTqPdDBsms80e7bE2E?=
 =?us-ascii?Q?Jl1FQpE/9Lzrw0kDBtoPRvea8J8XtOt33DFHYFvvj2MxqsCsju3jE9p9hKf1?=
 =?us-ascii?Q?21n0nEB4FVGv6QXGYP2Pmar+jzqhSnocbbVkKwNZtGWnTzq7cfarzdN/Gpxb?=
 =?us-ascii?Q?ZDCbhFeEFF41aQxT88feS7Yzzit4aAIQwMWqtJ1KsZwNj+PLd5IrhcbJFvun?=
 =?us-ascii?Q?arBMsqkMIin6KUrWJkF/eFD2XnhmjAp3KucUVsN53EoDh67sPXeTwbINQy/I?=
 =?us-ascii?Q?iw1hnlB5uIgxiTNC2FRqqtuQu+aSjT+9EgBfJ3xhNsooBhzrrOFdZJuGILI0?=
 =?us-ascii?Q?/rNGOeuh1JLihVMDHNEmf7ldXfRSoOpYfh3LzUQBRhnhMv8okdiAFK1QrmgC?=
 =?us-ascii?Q?SL8ELZOwxjCAjZGmF1ECTc6SkJj9d0BBGzr7Vse3srnVv0xh2O2WwtkXP3CL?=
 =?us-ascii?Q?SlhcVQFBf1ChaZhOU1vHKaO5RAqo2OqThRSZVoaZ8dxpXYGdygBUgXPl1Rxr?=
 =?us-ascii?Q?6F/yXwXzqA5OMHw9tLchCB+p23teFFxQeCRDHYdylgjzmM5I6rZUm9iwKODI?=
 =?us-ascii?Q?i+zQvMKV4RvCdsfovRFYqtgPVFd7AvObv30vO7hIdUu8qVj27gCi2NUFYyke?=
 =?us-ascii?Q?UObvwrMulkHfBd1Gu6wLd0ehsrvU0hrPKp18Q0lK3c3aVf2cDkYcIm5PlgdP?=
 =?us-ascii?Q?FiaHnSFcRg84JgW+qKF5l7rNrm7Kf/uGyBAs7G0vDTqw33eEEdKOWqzvOfUt?=
 =?us-ascii?Q?adC/QCJlsAoElVD57OinocDvdViuKId1mgNUXzOM1HHMTclNW0LT9aZ/R4NS?=
 =?us-ascii?Q?9LQfMX62nE2hthFVGHP+M/QQuREB/l9SAknTxLAQzyswWZWl6C3R?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d45eeb-77e6-4e37-f5db-08da16a8d9ca
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 02:06:09.4525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bHcWbYnPxR8XaTYUJLBbbIFE5tc6wI0vb8J+YF6Go+Q41CPqS4cEgCIL0aNstu/+PrU8pjGJiAV7YzrICpuTGfh4gCduRIUP0Ri1PzOT/FWZiAoYh76WCI1rKZXxnGp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8525
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

We need to use mutex_lock() for priv->cnt / priv->iface,
but we are missing it at ak4613_dai_startup().
This patch adds missing mutex_lock() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak4613.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 034195c83bd7..e0d9a8c58e10 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -304,7 +304,9 @@ static int ak4613_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
 
+	mutex_lock(&priv->lock);
 	priv->cnt++;
+	mutex_unlock(&priv->lock);
 
 	ak4613_hw_constraints(priv, substream->runtime);
 
-- 
2.25.1

