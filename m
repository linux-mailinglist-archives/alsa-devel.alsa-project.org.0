Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8334241DD09
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 17:12:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 259F516CE;
	Thu, 30 Sep 2021 17:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 259F516CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633014741;
	bh=iE1X9E0p6TNu61f3EF7Up/wcM4t7qbtggBfvQBBV1/c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h9I9pvzNn3UkyMEQICdriGrbaj0Z3bYBJcmhgKqY7NdpL8i6n15pf08mnz05MWAxn
	 i4qytj/SAnjAHlQ3AC8pZscjGrWJjPSK8BCm1l+WyYDbzLidPRCi1tFtxq9T34Qza/
	 1agYxm34EjfkiTYY+IGS9DIl8HCOJbWObWA5LtbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7051F804BC;
	Thu, 30 Sep 2021 17:11:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 466B4F80227; Wed, 29 Sep 2021 14:32:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310119.outbound.protection.outlook.com [40.107.131.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC961F80113
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 14:32:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC961F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=vivo0.onmicrosoft.com
 header.i=@vivo0.onmicrosoft.com header.b="kLUWpHby"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HpaEcd8U1058vDJ9QMch/LaKUE7G5EZKirt+dcSOGMEbczJyH6erarYIOHzs6vxV2kM4g0zRJoiemyx8kyGfa/inaPCcCRnrNjEMy6Vp+cSPHnrLn/1LnLRMZsE2Q1LoWl6rJlg65US8AftHaMoXEwgZe3Iv03mTyHaCrjwNBdmhj7rTNEHg8oV2nWLCmgwvmtY8gXOR7bXkmNO9YFXlcMElxYPfEsFcMyss8PJcBO9QrPH1HzNozEAJRFQeNK0KiSyrE6MZ1gquVq5TE1f92+QQJnKaOGlVT+NQi0lhwksa5fQ5VoIBz3mw099OTAY/qPeTwnD+GhcKNSsei9diRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=nQ7h0dUFMgNwmTWPuSgrJRwTaGumITXenfdhbjo10PI=;
 b=LiDJuGhjRfRxYOUmLa9prmIgIkhH1352st/NFXOHeN8ZpBa8A81BaG9QdEaiaBOdI3p9LiEWzdHOBr7qJtjUeadAP4sRuSxIiMpc9ibxJSzHc2Gn4Q7MhKqDHPW7MQ3aeoEcXhu3SonJlN7J+lDATeo2K7StXAIdaiooZ2SAHEYV08hwfP3SQa731Ct2Hmzt9XfD67akpAhCH0rp5y4ZDjsNLuaMkwDnmsx6WsNqFhOJFKqoTIPxEYVU6VljGNQEd54Byc01ic8H6ksz9DUWBUvQtW0HMo+Iu5XS2XeahNMe2BzrT5Qzx+a2R5sKaJeaAEnM5o4b9FNEZQ+EA+KUwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQ7h0dUFMgNwmTWPuSgrJRwTaGumITXenfdhbjo10PI=;
 b=kLUWpHby1WTw3BqoqFRYlFjcK57t/FrkDO2U9Af23n1IAlkcTZUbrhjMHjUxVNosigfatSq/NXG2HcWB6nTiRTO2WqvsSliOhNKzqPqi8zv09KQdvsU5+oIiyS/8cHr80PUt1VWw6kiFMiCoQIf1nzYkKQLOnLC+Vm7N/Oebz98=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by HK2PR06MB3283.apcprd06.prod.outlook.com (2603:1096:202:3c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 12:32:36 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::80d9:d4e4:300f:3156]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::80d9:d4e4:300f:3156%5]) with mapi id 15.20.4544.022; Wed, 29 Sep 2021
 12:32:35 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: wm_adsp: remove a repeated including
Date: Wed, 29 Sep 2021 20:32:15 +0800
Message-Id: <20210929123217.5240-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0185.apcprd02.prod.outlook.com
 (2603:1096:201:21::21) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
Received: from localhost.localdomain (203.90.234.87) by
 HK2PR02CA0185.apcprd02.prod.outlook.com (2603:1096:201:21::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.13 via Frontend Transport; Wed, 29 Sep 2021 12:32:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52bddf69-36d3-4dfd-7048-08d98345377e
X-MS-TrafficTypeDiagnostic: HK2PR06MB3283:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK2PR06MB3283625D3EAA48D06C3BAA83C7A99@HK2PR06MB3283.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XsOoUw/AV+naxZUq8rgMIaBK0shzCqNXQfsiPg3txwPPUCeEIXEqN49gc6IFYHBXvwayvIFjKKRdXGnzt9DjiF4vperQaG7J6imrJoY571jexExH/qbLIvUEdtFGBl1c3EkrAcVdtvqawPCfAM7QBWumVoMeU6+miCrBq/B+UwXa4NYd+UmU27bfaDFeU/9NqFVNiDvnl/HNp7yLb+F7jrgU/+aIRZF3V9p0bEFQLNd/ZNPp8fX3bs1mr1d2Sggn+NYjMZC1svAvpQyqFCIbMVqy3k7kz9WMAij5xbiM38RG8iaP/f2nMrnpa0tHnWEwdwxuprsxIIULnlwuwDEza2o4A6bInwXAYUsuiHklZk3Kc5mRHrV0OpTzQDsHnm4jr9j1igKuiuAmljqomBnTQJHRYwVqKsCkCsVknd7Y9Iwt4se4mS/Ma7ZF0l1Fst65K+YcqyHjnXxZQ/DoAsCCYFQrZBGf6X2vtB8d0ODBAjxIqMWhbsuGqBz1EGtYAp0Y8cYjkuXayZ4Vw+Aegx4wloDYw/y5/hQwX99ggO6R0v8NMsA1jQ/hIYOraLQQF5vuPI2bR9adKXpqQ9AFBgb9iEPijrvJT5aIFFsfoo5GBsyuLni1ez4EP1natymz3peBTUFJEkxluRmg1GyqAjjaT+6/acvFLRB4vggGWqyg6e7VraZ/MrA02YWJzdX+Kt5pe1t0fgzBHK5SrPsS8HtUfpFEKV08Taz6pSEiwz/LZKc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(316002)(4744005)(110136005)(1076003)(2906002)(7416002)(36756003)(4326008)(508600001)(5660300002)(66476007)(66556008)(38350700002)(38100700002)(921005)(186003)(956004)(6486002)(107886003)(26005)(2616005)(86362001)(6506007)(8676002)(83380400001)(52116002)(6512007)(8936002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qplReyKVEKw9flKppKQbG/Xs7IvOYFI6P3kcw29GqX0zU3HQKB/7BJR+1CLy?=
 =?us-ascii?Q?jv7J8zNVvt4aBGAHUGbn+LcAPgNzWDK29/9hJdvzz3TQ1JrZG63kEMDG4MnD?=
 =?us-ascii?Q?cHmSY9E2DGOqWWQZKkjo8auwbP7R6FcpXsqR886RR2usU1COCyuNsPl2C0lM?=
 =?us-ascii?Q?cGzU8gWTZwAP1uBF5qS0HQE4YRVB8quW5RvdMpkJN4xBRAdC03cH6/jV7E2u?=
 =?us-ascii?Q?xsXlMl0cCJcYx6RObrlYCta1IBlyLVXDDE2jOw+JPLaEpu0bfWTNDHalghTN?=
 =?us-ascii?Q?jW0kbakKlIgyu+137tkuvSXuNjAf6dRZI/+QUd9DueCd97Fa6/J/rugwspyZ?=
 =?us-ascii?Q?re/fkc0hYFbuvQaHWBDXikV8IeA8lF/uMwMF/Oq03/GGYWtGgxN4N/chSeep?=
 =?us-ascii?Q?0BhXBh+ijFOmQD7BoKvaIUk6fbUllKuaccKD7Qnzkl0aJtPNJjfq74ed+A/H?=
 =?us-ascii?Q?V+FliTDZo2CZBOBLLYNGjTckB0RfX/qInnjK8tw0PiAuRniXl/hUa7lWjMXe?=
 =?us-ascii?Q?IJXFU9sH8eUOiO2AW0Q5ZVhMEeaaEMJY7o+bzKjXixSpn6uTYItDYwFZFKyj?=
 =?us-ascii?Q?pQo/xgCvkqWSZThTri1lVQDaSBrKgIQt5HoVVMbJIBE0Qy1YkWIBEPqtrMQ/?=
 =?us-ascii?Q?RWvR1A1zYhIgll2au9TLABJ4yxX59ubEJ/YNjz+HgeuVyv1XE2J/xVZzh5Vs?=
 =?us-ascii?Q?z87KS1ln4lTkAsDGw9FPkkoUZLk4EEyRmXD85qFux50ywWQki3VzcoVKMvfk?=
 =?us-ascii?Q?bYn7M3Pzk+eNMWqqtdim/GyaP51c1TLpy/NcV78CvIeZT2M7JlZHrSDvxidI?=
 =?us-ascii?Q?tM09h3XTOsJYL82yM6h+ITiCqoKfDkxEM9jkQ5iyHUYgrwQPaUZDErXdsQZx?=
 =?us-ascii?Q?yTz3jCTwnBMg10Hew+ZzaNQrnksAzh5eDmieqWg2SvBz2FvUtIMqHzGm65Xn?=
 =?us-ascii?Q?p4ns0acY+A7J/DhDLALBwpaUcuJemQFogdaHC9zFcazwLAgp7K8xf8tfmHYc?=
 =?us-ascii?Q?K5xnWgoqUE94BqdIzNj0+yvASemeAz2MTQwpo6XO1kyc2lXyt/Sr/f8d7y7f?=
 =?us-ascii?Q?pYaKcX2JZT6OnAxP6PL37eTO0dGM9jeC/7oFQ0ND1YsqkTVFyJfUabuy7TnW?=
 =?us-ascii?Q?YooG4GRpzXX6ILLC2ajqyHOPHa4IWoJ7J/nGG/h/Qih94ruhiky1jNAAWiBb?=
 =?us-ascii?Q?A9wkrQsp2831X8MEBsnVtt87lKoCKnxHiBh9QYPfx4Gb0Gmf6xkWfDy0MdcB?=
 =?us-ascii?Q?2vykZKRsDnQwFbWUwE8iSQTWqYIa6XF/+oEy+58Moc4kNeTdCpcETS+ePnxf?=
 =?us-ascii?Q?riziTBdL1XnRpQTA5mXkWzyB?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52bddf69-36d3-4dfd-7048-08d98345377e
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 12:32:35.8310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1YRF9aL7XFtzdwc4FeePPFVTh6YcUNpodU0sb/V6KsXuFvwQxORlSEOpUzw90Umjmyrzr1NN7Di2EG+kSge2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3283
X-Mailman-Approved-At: Thu, 30 Sep 2021 17:11:01 +0200
Cc: kernel@vivo.com, Guo Zhengkui <guozhengkui@vivo.com>
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

Remove a repeated "#include <linux/firmware.h>" in line 32.

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 sound/soc/codecs/wm_adsp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 6c5d55b3b311..b9fb4f547d5e 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -29,7 +29,6 @@
 #include <sound/jack.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
-#include <linux/firmware.h>
 
 #include "wm_adsp.h"
 
-- 
2.20.1

