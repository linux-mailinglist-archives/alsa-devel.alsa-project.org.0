Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA5C22C18D
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 10:59:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2E12168C;
	Fri, 24 Jul 2020 10:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2E12168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595581183;
	bh=1OcZmcXNYQZD1EKk8WQIXIwRUSo0zXg6OAq/rYQvPnM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rtC4Oa1V77CeLlmu4/4NeztZ7DQkatNUumIbXIIiEvtoV9vU8BN2VeD1MM/elYtL2
	 abNSqTy6wc5KmB2A90oNy7bTRSZpcobg7YBfp9+PvSKpJd4QXYLfGtnepXDEVzqxOb
	 Os5f4hj7HnBaatT070AHMyofPLe8STbZ4+TdzOVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27A90F80150;
	Fri, 24 Jul 2020 10:58:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64A2FF800DF; Fri, 24 Jul 2020 10:58:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2110.outbound.protection.outlook.com [40.107.220.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C576FF800DF
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 10:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C576FF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="bwyNDH8h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qht9cVZoevc4Xjk1gN8zexGQj+09PRcsIKcjp9xkg/4DSdNWdvndo4tSSW5bldyg6Cr+6Rvy4OHDqoqGkU/Eo1XsXCLhwIJP3u3L580CqL1uxiyRaoc4VKYVNpyDcEbChJsftpQCW7zegJNrz/IS2I62f5RrplGSHB6yMjid5rEmslRd+xfObPAY+XOYlkRBtNKDEPUncycEuWEuF6q4AGNHaV96Pjp+4VC71+Ty+b8JYij9NzTunR07piTIRe3WDbAg72LLsir/X+GNKQRk1c7gXYGEvYo31PU4Upqtw6VET35cw/Sbk1wNWK3um7dX2+lK7o76d+awe7qm1EIBnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKG3yzcoft3LwZCwxMMfU41Lqv6EcNO1eqJ8SY5JAhM=;
 b=E8p2XFaM7+mBxh74lbDAlm3NQnSnm4hLGVob44jphiXD+PCM3X9Z33x1B/CyhA0VUh9iuooba7nfgWQQW9vLKUDcgaRabbDVZ5YIKgXWsJqp9BP+s2EZwMhaJkia/AERkbQUW4ATEDJcfcXpI91KVyjOB9XeoP0NlOypjyotIGg5ZCUcx6trrTXUusdCYd+q3vwiJPkeipy3Y8vYNI7Yk18z6E2Tl/6Wimdcva3JmeayOaUCjbymCpicmhEJ525c/gIbuq/0KQpA80kpcFt/bDnITyBeI1fMfXQdpqVuox9P3Wr1WNFf6rgC6fSYYJQLiCwcw2mTVWGDK+WYy/1vng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKG3yzcoft3LwZCwxMMfU41Lqv6EcNO1eqJ8SY5JAhM=;
 b=bwyNDH8hfZ3P9kSqr/OTsnoPnF80Pji5sI2obfj9UOYoGkSxmMiZ1RlCTkncqOSAeQ6h1MxavoWzCitfG172OxWKvOiKcwGEOd4NhbDmcKmDBfiN4kf3gLFyepzuadCLjQduaStf/KwYVdbMfX2BXW3lTR5Z5Okxd3wxuEBAWlY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from MWHPR11MB2047.namprd11.prod.outlook.com (2603:10b6:300:2a::12)
 by MWHPR11MB1871.namprd11.prod.outlook.com (2603:10b6:300:111::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 24 Jul
 2020 08:57:44 +0000
Received: from MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::d9e8:a3eb:4f08:e795]) by MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::d9e8:a3eb:4f08:e795%5]) with mapi id 15.20.3216.026; Fri, 24 Jul 2020
 08:57:43 +0000
From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, geert@linux-m68k.org,
 rf@opensource.wolfsonmicro.com, shumingf@realtek.com,
 srinivas.kandagatla@linaro.org, krzk@kernel.org, dmurphy@ti.com,
 jack.yu@realtek.com, nuno.sa@analog.com, steves.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: max98390: update dsm param bin max size
Date: Fri, 24 Jul 2020 17:56:44 +0900
Message-Id: <20200724085644.9837-1-steves.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2PR03CA0022.apcprd03.prod.outlook.com
 (2603:1096:100:55::34) To MWHPR11MB2047.namprd11.prod.outlook.com
 (2603:10b6:300:2a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:2d8:e716:8b4b:b4b1:36e4:d148:7e35)
 by SL2PR03CA0022.apcprd03.prod.outlook.com (2603:1096:100:55::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.15 via Frontend
 Transport; Fri, 24 Jul 2020 08:57:38 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2001:2d8:e716:8b4b:b4b1:36e4:d148:7e35]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0e41edd9-45b0-4610-7689-08d82fafa025
X-MS-TrafficTypeDiagnostic: MWHPR11MB1871:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR11MB18713C720B8F6E23E29749BA92770@MWHPR11MB1871.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y+G8WvJ2ULe0sVGjwdjQsL7U0Pz9LjRGuNg1ZO5/03LBYWVMD4iDXo7tH5VwLhE48QliaqbbawCr6cQt+MdGtV1bZ8JnyC35D+jhKyStK/myZo6gCSnP3KWD2JeyylHxMJhe3mrq4r83xMXdws1xLWwzl0lXGA+wHBW5FnQQsaWCrw45b9p4fQB/EPlnk8XvPvepjHtM/UeWSAfS1wqWQnaA9cXbYCUOgRJS5ktEkrkOAwMF6bWgQY8W/PO6EiFPQ8aFc1VfcRFQhPFKqjEexIO4ctzq8tIy24k64agVIG0QrTUvcOKS32OUV6OxX/ihoQM1PcNgli8/TRl43rqVroIgrVn0gsakwgrZvk4vCkzdc5dbNsT/z2wH70Yi5NhPOeQ9Wl2NGW2TDuuJpKfeSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB2047.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(66476007)(66556008)(5660300002)(66946007)(478600001)(83380400001)(1076003)(6512007)(69590400007)(86362001)(6666004)(52116002)(4744005)(15650500001)(6486002)(16526019)(8676002)(186003)(8936002)(316002)(2616005)(2906002)(36756003)(6506007)(4326008)(7416002)(921003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: YxTQcWYfM25EiOsy6cftYiRmPq7X/IUvdfeuEh1mEhTi5Wa+Ug0/Q2Vz9H/zXV7OiHCwyRSk00qFYPU6tEtDpkmlbAWVAxuGAkNMDA4A/4toObhhQmpyMff9NEVZY7/M+Aq/A800mk42T0dx4OjTL9yLBdlB9wo+J+1FTpsBaBqTFhwZjT4g4yVWDptWVZchpClunB7aqBU8DjTvywWVP8qYf9kr9dl++iyxWFsqhc7ds2I6VQLa1srzZYDxi4ES8pivNG3vSLXzdU9rMl+GHdJHVJLrT+pXKtz9uMf2hhKW1ic1NbhlB2W/s8VfKknckokJNBaVpcUtKDM3CKimlq531crvLCeCe/KOxOfJ4mcNhL+CbOQ9Ji/1gYA0/qP+g3zmO1SExFhYDLaZjxKGlbFALCKn+del8781/WmjnsUvpNaSQv+6tKFmCaLgrP1uuePkgJQuwJxpue3IZ3JGQxrJoo2VpS4M8ZVcmqsIaOk4mIiSY1cwfryrm3KAyUPlVwS4QFLf1YpFKEhz5Lx7RBa8CeuLZNxpLSZqqF3Lav6DkaUUhHN/Ljw9XG6lL/Qv
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e41edd9-45b0-4610-7689-08d82fafa025
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB2047.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 08:57:43.0554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1m2Y8iNN4iXVAtC0IGS7kPvky8ELrwZQqg27xbABv3aNajxiGKbcJedoI2I8dhsGOJjqmQNieGdHFkpZUeLn4ul+bkUcH4Zt344XBsPqQkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1871
Cc: ryan.lee.maxim@gmail.com, ryans.lee@maximintegrated.com,
 steves.lee.maxim@gmail.com
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

 MAX98390_DSM_PARAM_MAX_SIZE is changed to support extended
 register update.

Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
---
 sound/soc/codecs/max98390.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98390.h b/sound/soc/codecs/max98390.h
index 5f444e7779b0..dff884f68e3e 100644
--- a/sound/soc/codecs/max98390.h
+++ b/sound/soc/codecs/max98390.h
@@ -650,7 +650,7 @@
 
 /* DSM register offset */
 #define MAX98390_DSM_PAYLOAD_OFFSET 16
-#define MAX98390_DSM_PARAM_MAX_SIZE 770
+#define MAX98390_DSM_PARAM_MAX_SIZE 1024
 #define MAX98390_DSM_PARAM_MIN_SIZE 670
 
 struct max98390_priv {
-- 
2.17.1

