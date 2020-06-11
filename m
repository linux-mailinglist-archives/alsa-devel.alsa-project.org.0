Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 584611F64F5
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 11:50:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F13061683;
	Thu, 11 Jun 2020 11:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F13061683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591869027;
	bh=jpd53FZOsQ1pJNcQnfnjCz1rEKwhDZDbdIyz2LxOBoc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H4zUHfgovdRBzMOC3873xFCGuYKrWpgdTEiEq9IvBCd+HPtnw2hiSCU9QpHA/B1Xh
	 1zcaP+9v6idDHrpM6WN606gCqiqW55dZSTuug5Sw45yFhWD7qU+0PAcsHbk4zH47+j
	 FKaS0ycmaiMtSITf5yROmWhl8YDBkNd52lElBnwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4287BF80292;
	Thu, 11 Jun 2020 11:48:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 245D8F80291; Thu, 11 Jun 2020 11:48:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2118.outbound.protection.outlook.com [40.107.236.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1376CF80058
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 11:48:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1376CF80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="Zj/e1O7y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAplxvPei1VUUXlt359XdxyBolXwmf1Bt7ZBVk3W+fGa5NIwDF+LuCcm72lbh/EBAwSQQp1hMJY4wnb2qg6kob4LgO1tEEfY6I5n8msRRw3W/ch2mlPwMJ6rY3xDqGMzAANBYrYsVX0Bzqx26IFb6r8NaxDKey4ZQ1UNb8h91Vbow9UcY6nneaHRCvx0iA6xGgxTCjtbxj9yHbXjmW9b3ZhHQGLZJl+TKTvJUzPceXYueXIYxJ835J5vZv1tTN2GGPLByklq1TuHjszK2Q15749KUYNZ7oUxb2DYQREdWAo6DnR8CObj9gWNl/tSjkNJHnAlWUiBPEFS3hiJKfSgSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pCzmbNOQBVtdHwhX1LDxfWV+hJkeQ+htSCkM4Y64BM=;
 b=KiaSfkT9ZVS+d4XH1gYKt7a4QuKb/1IWwwxll+CXOjqnhNfWBf7CnKWWP9RjL28i0Zd4AOTqor36GGlMVyK6HWqhqwxRCVBz7b8ylngvQm8ceNOIioptde2xwBYC9lUz70lacMDXQhiYmFKDRVlQP2XlOexn1acvPJ4/xIqCjj00SGEHen9wCH8uTiHaTRUKLLfxTRUX7G0PXQ6tACQ5ILPn0ic3NIxT0wl4PmWhI9G25kZBUfbKLE4ZFN47DW5LrUm2C1Jp16G110lfvL2HTmYr77J8cjgXKOGT/3UF36hRhRS79If5C28yXP2o8aQMIeggF9egC491FBU9xGhq6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pCzmbNOQBVtdHwhX1LDxfWV+hJkeQ+htSCkM4Y64BM=;
 b=Zj/e1O7yCBy/PMLlFkSYSz8rbuuAVyxZdTVoiFR1IOamdAbcN/paRvaTkf/L4nmXRAIH5htcxTzMKsN2WEOQ1mv3/91gUmaMW6iqr5CZN2CNQzEwZqUH9BBaEjYnDIDqbCkvO1zxQzLApsvnBJGPJL0Dzt4KkCGXVuuzt6yqnks=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from MWHPR11MB2047.namprd11.prod.outlook.com (2603:10b6:300:2a::12)
 by MW3PR11MB4668.namprd11.prod.outlook.com (2603:10b6:303:54::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Thu, 11 Jun
 2020 09:48:30 +0000
Received: from MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363]) by MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363%5]) with mapi id 15.20.3088.022; Thu, 11 Jun 2020
 09:48:30 +0000
From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, geert@linux-m68k.org,
 rf@opensource.wolfsonmicro.com, shumingf@realtek.com,
 srinivas.kandagatla@linaro.org, krzk@kernel.org, dmurphy@ti.com,
 jack.yu@realtek.com, nuno.sa@analog.com, steves.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: max98390: Update regmap readable reg and volatile
Date: Thu, 11 Jun 2020 18:48:00 +0900
Message-Id: <20200611094800.18422-1-steves.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0052.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:19::14) To MWHPR11MB2047.namprd11.prod.outlook.com
 (2603:10b6:300:2a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:2d8:210:3256:d447:7247:839:5c8e) by
 SL2P216CA0052.KORP216.PROD.OUTLOOK.COM (2603:1096:100:19::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.19 via Frontend Transport; Thu, 11 Jun 2020 09:48:25 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2001:2d8:210:3256:d447:7247:839:5c8e]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cd1eaf44-416e-4ca6-d6a5-08d80dec98f1
X-MS-TrafficTypeDiagnostic: MW3PR11MB4668:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR11MB466848DD62CFD81C8C318E7392800@MW3PR11MB4668.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yRoucuQFpbJYtCMqQB06+dle1yOmTrxt+nNIi4QHT3ohf5X+UfiHm+Ff8LgkByweAABwiRjyHNT87TbOXBpl/S7CQt/+K4nPIira7QUIWd1iCH4ylMgp/kDg5twjXp1Z0qTthWfZZ1W4+VNSbqyVEyhQKSOl2RIeqtpGFEU8yRAfFhZFttp77NRW4zDKQ8BZiOO46aNe9BRwafKM2IAQtPKdXsqCrD2/ZWFSNqDeB+pAkLL5QJqieXMhKE6rQ7JEJfQSNbenIR8ROn3nJDURRm19/IvpF+5DswAl/K/+KxlEjSZ5fVDe4+lAszCf/9GJuOjm3CAkm/LItMT485pBq3wdnItdNRZiDfOTIJybbsBH4oQIS4AU6ibuPNQqdemiTCLeX4oXgrD3LFHq5ZIyHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB2047.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(8676002)(2906002)(16526019)(52116002)(15650500001)(478600001)(66476007)(66946007)(1076003)(316002)(186003)(5660300002)(6666004)(6506007)(86362001)(6512007)(83380400001)(66556008)(4326008)(36756003)(69590400007)(2616005)(8936002)(7416002)(6486002)(921003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: VXPEfrjOxajxhAZoNTzwQM53vKqDyLcr2gYEw4TYOb/EcN5/5jfPjBnncMXdADtBltW5AX7ehxJKVPAhi+ELY0NjQsMaacRoyfFrGZu98FDnVHiI+n1JdXDcEzZia+OcVPNw5WGEL1M4ZSMTvdQgipRNGGRIODIVgVKbLV7bndwhErX+4LPdLwncKoqRRW051xrvw56w9HpWnVsOC+8xPitBejbIeKgY4TpAZqjFuTYpyMhEsJ8+n48Y6Slju/uZln6HYTLaiMxbcACX1vjK5g2EBOaspQWL1KjOb68ksQF1ZwEVO3GTfHGPaZfkl5f9cIB4SLsD//nGBtx2YeErvjYj42rGccgMBD7mI/Vl6ZKRcvUN/cIMOrFGqCK3GdvOhi9vhUc4VLLJuPu4kydP2XWeMJaGwOOwvlarjv4NlhHVBw2ChOnBPCKw3HL3WJQCdhJVz9yWl0Rxo2CbXHL5p2O6BsklNsFHrNG12Y26UEiHQnRKBAJ2MteVfLysTSIE1gOVlKVShYRPeFlEooDSVDFKIjt7djr2gDAICqG39hI=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1eaf44-416e-4ca6-d6a5-08d80dec98f1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 09:48:30.6942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqD92yjCf4dsTPewcHcEJml0zkLVn1cBsL3/RO5bRBtEaA9WC5XzCTdaDfZmMLp3h16qYKT71f7sbeWVE6PXv5uvN1XdPuzdHGBQvsSAhYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4668
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

 Update max98390_readable_register and max98390_volatile_reg

Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
---
 sound/soc/codecs/max98390.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 57d15dbfcda3..b345e626956d 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -700,8 +700,8 @@ static bool max98390_readable_register(struct device *dev, unsigned int reg)
 	case MAX98390_IRQ_CTRL ... MAX98390_WDOG_CTRL:
 	case MAX98390_MEAS_ADC_THERM_WARN_THRESH
 		... MAX98390_BROWNOUT_INFINITE_HOLD:
-	case MAX98390_BROWNOUT_LVL_HOLD ... THERMAL_COILTEMP_RD_BACK_BYTE0:
-	case DSMIG_DEBUZZER_THRESHOLD ... MAX98390_R24FF_REV_ID:
+	case MAX98390_BROWNOUT_LVL_HOLD ... DSMIG_DEBUZZER_THRESHOLD:
+	case DSM_VOL_ENA ... MAX98390_R24FF_REV_ID:
 		return true;
 	default:
 		return false;
@@ -717,7 +717,7 @@ static bool max98390_volatile_reg(struct device *dev, unsigned int reg)
 	case MAX98390_BROWNOUT_LOWEST_STATUS:
 	case MAX98390_ENV_TRACK_BOOST_VOUT_READ:
 	case DSM_STBASS_HPF_B0_BYTE0 ... DSM_DEBUZZER_ATTACK_TIME_BYTE2:
-	case THERMAL_RDC_RD_BACK_BYTE1 ... THERMAL_COILTEMP_RD_BACK_BYTE0:
+	case THERMAL_RDC_RD_BACK_BYTE1 ... DSMIG_DEBUZZER_THRESHOLD:
 	case DSM_THERMAL_GAIN ... DSM_WBDRC_GAIN:
 		return true;
 	default:
-- 
2.17.1

