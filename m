Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 387B379E026
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 08:41:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9847B950;
	Wed, 13 Sep 2023 08:40:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9847B950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694587301;
	bh=PRTYMd8iA/wFO3uClUtYxUBsUP7RXUeDZmmkpTVxJ1M=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UUV49p5UGDyb+XKGYnktccqfsPEJI6Z9fTO22tEnMV96GPG6pOXL+cEibfLYkP2T1
	 CTcmgxJ2PvftLGL3dFZwWg1MPqInn4QS2JMufPWccK4YI5LQ9BD4BeJyA9s2ZuuQWM
	 nU7aWpnGFa9rq3CtHyZKA9Xu3/0F3X2OpL9j6+Yw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 503E3F80431; Wed, 13 Sep 2023 08:40:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A733F80431;
	Wed, 13 Sep 2023 08:40:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E6F7F8047D; Wed, 13 Sep 2023 08:40:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::624])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 311FAF8007C
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 08:40:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 311FAF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=A/0PvF2E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoOeb59Ve7ljhkrsjmBmnyzXZ0E8pI/pQX5v5nvxHsQ7nJ4yT/9zktV0Q4DtsM8Z/2j/EJ9YpVyc0TnAjR8m7FGkxr9O9lHd48vvAAPWPRXnwmBziozc+b55lNgoKa+Zl/IOVoZVhKbRQUAFS7+Xp5DtqIco6nSw3z9BnHYj5K6NXtZ4nV33Z3XEYv3uwC+vcP6TPAG2EdblFcj+g7oio7F3VaABkc0q0BKFY3ZyrYIwT0xPJq65yWRwgw1ZrmovLsSnkuc0He/Vqcw4MP5cf99wE2kTCj9963vsfx1z5wqkkkkSjxdVS/dOZz297L2BBUDnbklJtl0mA1BguU5O7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIS5ya09kxPVNyCmpLhtRyRhNV0wHzDFQefJlWxre+s=;
 b=LQE75wS4TApNcrrHJJimTkWe+paGWZts13GnaTV/Mef3jpgxeKx/T/tpwJEv+kcpj5lDRjJnSaxj8bq/9RhYcAXvEE0UStgTh+/SPjVCA+Jyo+jeV0NFiQahRCleGrhew5BMvcWRl2PdCtLej/LDOktzVzfvyArggGWvrJjaZUcV0FbB9IW008IhlbZhap2+MvxgXXRHxqw2iQyoQhPez7zFym3koCZa3jObvt6k/AKeoHUk2KyTnl9t0XoiywIA6MrRpGvyQesiUW3na3Wat3rXWTyslseQFKSYFJj5azr/CayWCZmlbPabEzvsn2d1xp7L7zD5XxgheifgNFgkOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIS5ya09kxPVNyCmpLhtRyRhNV0wHzDFQefJlWxre+s=;
 b=A/0PvF2ES4ZAQ87EiB7qPdv4DfO0CMcU2HsyuHr3xCgiV2J+zOoiHOM4pslcZhx1FIjVdoJw9L7rcKXFdCVqTbxzDX9Vz6yoa+9R2wXNrCE6lId4z7iUitIHGjAVSyNgkZbKLfSKqh/yl+gDIsa/hS1i2z2ueormqqzEt7OsVQk=
Received: from SG2PR02CA0011.apcprd02.prod.outlook.com (2603:1096:3:17::23) by
 SEZPR03MB7417.apcprd03.prod.outlook.com (2603:1096:101:10e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Wed, 13 Sep
 2023 06:40:19 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:3:17:cafe::8d) by SG2PR02CA0011.outlook.office365.com
 (2603:1096:3:17::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19 via Frontend
 Transport; Wed, 13 Sep 2023 06:40:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS04.nuvoton.com; pr=C
Received: from NTHCCAS04.nuvoton.com (175.98.123.7) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.6792.17 via Frontend Transport; Wed, 13 Sep 2023 06:40:19 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Wed, 13
 Sep 2023 14:40:05 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 13 Sep 2023 14:40:05 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<YHCHuang@nuvoton.com>, <KCHSU0@nuvoton.com>, <CTLIN0@nuvoton.com>,
	<WTLI@nuvoton.com>, <SJLIN0@nuvoton.com>, <scott6986@gmail.com>,
	<supercraig0719@gmail.com>, <dardar923@gmail.com>, Seven Lee
	<wtli@nuvoton.com>
Subject: [PATCH] ASoC: nau8821: Revise MICBIAS control for power saving.
Date: Wed, 13 Sep 2023 14:40:03 +0800
Message-ID: <20230913064003.2925997-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|SEZPR03MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: d9c7e4c7-0038-4a2c-1627-08dbb4244c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Xi2VkQgNl/9Z8fuVAAXfMvDW+Cn+TAl7mgXik5g8GdStgv3SjgKe7/gq6yXJ3nObEmGPCpOrfBLEinsn/Af5D9wI6nMBUzlHHJJJoMUS9dzyBmncO9CXDHNtHHRXJUHt51a7FYf/3EDh1meaibLJR4GmnmTtC6K8LqemKZ61p9nt0lCDtT8hl4YCckPhGLu0Curk3nl3xHYRSYMMieXtkYamS1DHNMoQ3PAX7oGtsUvFl3f6jVcknIM4o9Xk74qMpH3h7XLmdjKrsSGgFIphcERD2HHxxb33XiTzxuxeadxkBL6yISBYUep1+wuRp+0ym0ai/fLE5i7Aucjaw2Ub1MtfNmQpkIfJRUAq+MTDjboG92MNPJNb8TKEBgGsEdgyh7cdUCIJQfiQcw9n2Sjwthk4iNTXph7nbJ4bhgvwcl81e0ao1NLUIoXTQKiCcDj2e+7HsRd9I1IfXltJL8VEqvrpNjjkviFUrXjgYcayuQEh50L7WCO+E20WtljKPmvXKM5gnrfsadFIXWjeiQy4+PiwEuKiGsigG4Fum6+EGKodDx9C9mZqdpoNMAOBFRBT4zhh7nlt73b5IQMlAjvqiG5uAsR6SO+9kGiXOxS7IGt0dOBHK5KBRxvnpUccpH4qFSo2gJO0K9D2A0iD1fE6ASQ3CuYQZgtgEm5VR9DzN4RPn3ae/xZYfu0pVveditFEtGhAT4/hr9eUxJ6uzBNiaTTSccmXEsl09RAH02Jn18e1yakxUEpKk8fJJ3FVFvb9EqfC6D5tl224isJ9eg70gjDSAHiMmftkOcBx4QTvNcI=
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS04.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(1800799009)(82310400011)(451199024)(186009)(36840700001)(40470700004)(46966006)(40460700003)(36860700001)(83380400001)(41300700001)(336012)(5660300002)(4326008)(8936002)(8676002)(478600001)(426003)(6916009)(47076005)(26005)(316002)(70206006)(4744005)(54906003)(81166007)(356005)(107886003)(1076003)(2616005)(70586007)(82740400003)(2906002)(86362001)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 06:40:19.0140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d9c7e4c7-0038-4a2c-1627-08dbb4244c0a
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS04.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7417
Message-ID-Hash: 6LT4H3T5QEXJO7IX5GBL3OTWR2Y6OMX2
X-Message-ID-Hash: 6LT4H3T5QEXJO7IX5GBL3OTWR2Y6OMX2
X-MailFrom: WTLI@nuvoton.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LT4H3T5QEXJO7IX5GBL3OTWR2Y6OMX2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The patch helps save power by control MICBIAS. The headset's
MICBIAS should be disabled without button requirement.

Signed-off-by: Seven Lee <wtli@nuvoton.com>
---
 sound/soc/codecs/nau8821.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index f307374834b5..6e1b6b26298a 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -1136,6 +1136,9 @@ static void nau8821_jdet_work(struct work_struct *work)
 				NAU8821_R12_INTERRUPT_DIS_CTRL,
 				NAU8821_IRQ_KEY_RELEASE_DIS |
 				NAU8821_IRQ_KEY_PRESS_DIS, 0);
+		} else {
+			snd_soc_component_disable_pin(component, "MICBIAS");
+			snd_soc_dapm_sync(nau8821->dapm);
 		}
 	} else {
 		dev_dbg(nau8821->dev, "Headphone connected\n");
-- 
2.25.1

