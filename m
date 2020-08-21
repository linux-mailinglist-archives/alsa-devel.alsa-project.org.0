Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A483224D74A
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 16:24:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 213121688;
	Fri, 21 Aug 2020 16:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 213121688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598019896;
	bh=kh3MIC6yx1yX0FnY4MwnxbTd2nzE8Tz4EHeWqX9sfB0=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=erXmPqjLQgaPeY8vv40GRyyt8zBDQ36OWcGxxW5uuxe2/Ji7yz48yC3VogaZPLzhu
	 064bdlCNbBJSj/YHqBshwq5e7QHW2Vbs6APAxYZNgRsopqVomKHm/jvHmCgTS1XtoY
	 qPS+5GbxM4Dvw22WRjNIkbuaO2z3vdhN/ez5nzKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51DB9F800C0;
	Fri, 21 Aug 2020 16:23:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDA22F80218; Fri, 21 Aug 2020 16:23:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,FORGED_SPF_HELO,FROM_WORDY,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80071.outbound.protection.outlook.com [40.107.8.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2453F800D3
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 16:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2453F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="XLdjNQeh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJ11sdkWRA8QW0jjZp6xs2szDtuvP9ceCfDHHH1yAU1XooYEIsWdqDKiPfa+dtd5vXYOqzBeg8GPpRoqpdcShM1mbubpfNpaBIPEBZTX1oYqCdNWfiFB0BnWgjIGMBFXMRiJt2u+GHLnUwqVwxhn/v+Nm43W5igd2Sv/wd4htmNvlxSv/zt6wSDkICEJKjTgfOi7xgUpm5ercL88sYV0rFZ1WOnqFAkAvvGQEVVZloehNKP8HUtBMG4/gBWKGwCUMnQRajvSlAluNkG8olhgEjwhO94oFe77RpzNzFsHVQQcZ8g0dFrcURPrGqxrFNfhhRyWavJXgt+mkU8P7VOHTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4BxIhAsnRn4eJES5vWq0GH6y20y+19R5uS+OdV0e3w=;
 b=VfsZOuH73xBBdw2AynHEkcLAphriIK67GTdNB9NarkcspspAaTC03HAj8D/s18h7PevK3Yn/StfIxdAOtkOOSaIUMHPbhLZcWEP/Lp6jc/KNQ2xQ4saEKYU19oWnV2sfYd3nBsYRAZym/5Jc7wjEVYU63vDO1Wem91h1MEierG8pixgsehjN4D+IfvQT/47L/0u4OvRFYzszaqAza28nyJGH+5O3FlET9RCJEZExFtSOmE5I42wklDB89fxor0iC2I3iwuUzu+4pjkQZmiQqbPL/suXEURZ3Xg+RPrsTtFvPO9k1Et9gA+K1KhzRSRHmCv3a/1WXuLTerlrJTm4xeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=neutral (sender ip is
 193.240.239.45) smtp.rcpttodomain=perex.cz
 smtp.mailfrom=diasemi.com; 
 dmarc=fail (p=none sp=none pct=100) action=none header.from=diasemi.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4BxIhAsnRn4eJES5vWq0GH6y20y+19R5uS+OdV0e3w=;
 b=XLdjNQeh/OJQoD1/XF8w5ag3qQp0DCh8TLunmQ7l76HsWi4f+iWIabNLCGAgjoPnegr2gSzyFab1VKBVL4BR8DZCPL4KUlJ9/krIWh1IQ2OBMJAdzYB6jnJ/7bvsH3/FVTuSkpXSInv25k99uJUyX3BbmOf8H5u+Wou76FUJV5s=
Received: from AM6P194CA0030.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::43)
 by AM6PR10MB2887.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:e4::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 14:23:01 +0000
Received: from VE1EUR02FT025.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::e0) by AM6P194CA0030.outlook.office365.com
 (2603:10a6:209:90::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Fri, 21 Aug 2020 14:23:01 +0000
X-MS-Exchange-Authentication-Results: spf=neutral (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; perex.cz; dkim=none (message not
 signed) header.d=none;perex.cz; dmarc=fail action=none
 header.from=diasemi.com;
Received-SPF: Neutral (protection.outlook.com: 193.240.239.45 is neither
 permitted nor denied by domain of diasemi.com)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 VE1EUR02FT025.mail.protection.outlook.com (10.152.12.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 14:23:00 +0000
Received: from swsrvapps-01.diasemi.com (10.20.28.141) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Fri, 21 Aug 2020 16:23:00 +0200
Received: by swsrvapps-01.diasemi.com (Postfix, from userid 22379)	id
 C2ECE3FB96; Fri, 21 Aug 2020 15:22:59 +0100 (BST)
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Date: Fri, 21 Aug 2020 15:22:59 +0100
Subject: [PATCH] ASoC: da7219: Fix I/O voltage range configuration during probe
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>
Message-ID: <20200821142259.C2ECE3FB96@swsrvapps-01.diasemi.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38419e5f-0efb-4a1d-82de-08d845ddb5a8
X-MS-TrafficTypeDiagnostic: AM6PR10MB2887:
X-Microsoft-Antispam-PRVS: <AM6PR10MB28873C53C10AEE1C10E9E52DA75B0@AM6PR10MB2887.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gYSCjpDhUUhXzGc++Mx4luEAAnbDZGfLQ8Ib3u5lHn3MFmYMyup/QHBr1xBjgmqTmUHi/bUT8cR6CEse398GGS8NaAoZFgsFztswYoukia+7DVphM5PbyVbnBmljSjjspJEO76eHybmMFJQlT1ps6RjMVmCOCl/lZfONAf+N+cghhgiEzw1OBrvCPsD3hyN1ivwf5Qi6pYSxk3zh9CHHDUW4jgLiiaGROSCw+sb3tq7DEZvI6J70LHZnhLXNdY09ceZmkO9FyEVnYQuZFET3jb70AC9QI7n2qrqIDoP2DKqpJucx0Vmrp+ioM7ps/wFshKWCgtC7hparGCYVTQc5/ktk552aL4JDEHpAcPGzKop27BHj8YtwBo6su/wGlUrvtkzYGxHEvpcogul5rFTcvia7Q18aEF88w4gh/Wiy8YFHCjRAQITzaLndPfDIHR/KnLgddamjGfpG5DQsOGETmw==
X-Forefront-Antispam-Report: CIP:193.240.239.45; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mailrelay1.diasemi.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966005)(186003)(316002)(356005)(81166007)(426003)(1076003)(5660300002)(82310400002)(2906002)(26005)(6266002)(42186006)(36906005)(70586007)(70206006)(33310700002)(8936002)(82740400003)(47076004)(83380400001)(4326008)(107886003)(33656002)(110136005)(86362001)(54906003)(478600001)(8676002)(336012)(34020700003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 14:23:00.8234 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38419e5f-0efb-4a1d-82de-08d845ddb5a8
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c; Ip=[193.240.239.45];
 Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT025.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2887
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Support Opensource <support.opensource@diasemi.com>,
 linux-kernel@vger.kernel.org
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

Previous improvements around handling device and codec level
probe functionality added the possibility of the voltage level
being undefined for the scenario where the IO voltage retrieved
from the regulator supply was below 1.2V, whereas previously the
code defaulted to the 2.5V to 3.6V range in that case. This
commit restores the default value to avoid this happening.

Fixes: aa5b18d1c290 ("ASoC: da7219: Move soft reset handling to codec level probe")
Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
---
 sound/soc/codecs/da7219.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index ddd422c..045aeb6 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -1862,6 +1862,9 @@ static int da7219_handle_supplies(struct snd_soc_component *component,
 		return ret;
 	}
 
+	/* Default to upper range */
+	*io_voltage_lvl = DA7219_IO_VOLTAGE_LEVEL_2_5V_3_6V;
+
 	/* Determine VDDIO voltage provided */
 	vddio = da7219->supplies[DA7219_SUPPLY_VDDIO].consumer;
 	ret = regulator_get_voltage(vddio);
@@ -1869,8 +1872,6 @@ static int da7219_handle_supplies(struct snd_soc_component *component,
 		dev_warn(component->dev, "Invalid VDDIO voltage\n");
 	else if (ret < 2800000)
 		*io_voltage_lvl = DA7219_IO_VOLTAGE_LEVEL_1_2V_2_8V;
-	else
-		*io_voltage_lvl = DA7219_IO_VOLTAGE_LEVEL_2_5V_3_6V;
 
 	/* Enable main supplies */
 	ret = regulator_bulk_enable(DA7219_NUM_SUPPLIES, da7219->supplies);
-- 
1.9.1

