Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 227167F0DD1
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 09:43:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF4D784B;
	Mon, 20 Nov 2023 09:43:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF4D784B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700469832;
	bh=KASfXVHsVHwsB00Aw7SpHRXmZUsoz5CDj60HMS1T6Ic=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qEsr9xLyyuCbL1sBLyckr5W9cEcrsEDOkPO5PYeSkQ9hGm+jus4gMYlVJaiQN1936
	 DdayvKFdbezc9iGAVvvZPPV8Pd/Bts3SylU4C2ACWMUgBetep1zobtRX9GtIJXdG4T
	 jnTUckzsZHPtqTvmeMnz591j1xk6gNYDKdazVc9Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C668F80254; Mon, 20 Nov 2023 09:43:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6FB6F80249;
	Mon, 20 Nov 2023 09:43:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 117CBF80254; Mon, 20 Nov 2023 09:42:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10708F80114
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 09:42:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10708F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=Y/RcFwMB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYh51Kdq8dbVHfdvT6XQYg/rXb4D7COgy5kMy4BtT+roYNOo8oWrRmSC9HksKoeTxXligQL759Qyi9TGdHG2ZgqF1UuR1dGtABBRC0mGpDfCBB6k9zbv5qWlESY2L7JezaU9Mw/TJpk2R6eS6B74ewo2Xc4mTQWegjeiAHbn9x7wa3eEnTaHs5591l08ZVxzQAOF/ok9DA9L40gcZ6v/aVl7QKLxXV51Kpy1L8IEajX8hyrCFDuTAsFnEcgxICCnvKVubvavBl8tv/WLGruKF/gpBOAYEHoWIIYyNYyZJbJ/r7gy1v6cub/O49G/pqR6kIKw6I+dkiahjSL9EDNMkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YloAyrHeqiFQCYPgB54RyN9YXaSTPxicYoJEzNs2lo=;
 b=Jq44Pg/V0AioUXbXstRIBVhoquprCkS14gKjgnecJVaeZoJr97v4LGeOHxCH6z3n+vj7+oJjUkgf4hzFLC//Qgu/e9azJSFF/zEzdyn0djWIlhNZmZu5njbQDk159HnawjX6p5r8xyrdoRoWqZc/Hx5D8rpfM+Z/yIEyt2vDUKFOLYsYCtMa9oL+sEc6oYli5Kbrf3jKV2lFl/s98g/GsdxyQflhR5qUiJx7ipglzODYXNFtABmrgSmvb050uwfnFeVpLSMZUBYSFgGM85Am+NKvdkAQp86SOVNZoAu+Wfs8MG9rP8tMJNlYdWpYvvj5MGqRQg71oDl6mmWA35okKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YloAyrHeqiFQCYPgB54RyN9YXaSTPxicYoJEzNs2lo=;
 b=Y/RcFwMB2NyJ1pQanBS50w0GjLFPVAb9hA7/9Dsn1FJvL08dir5B+yMRHWSRzCvk3ks2zx+uI3pcXbkBoE3nkE4nsdHuvQ455JI2NONJainOg67/GPgd5AN989//T32zm6DDbhBZv8TGgHJ4yLHVhAerltpjKNHF15tDx1VZGIU=
Received: from PS2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:300:2d::25) by SEYPR03MB6649.apcprd03.prod.outlook.com
 (2603:1096:101:83::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 08:42:40 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:300:2d:cafe::41) by PS2PR01CA0013.outlook.office365.com
 (2603:1096:300:2d::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Mon, 20 Nov 2023 08:42:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Mon, 20 Nov 2023 08:42:39 +0000
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 20 Nov
 2023 16:42:37 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 20 Nov
 2023 16:42:37 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 20 Nov 2023 16:42:37 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <YHCHuang@nuvoton.com>, <KCHSU0@nuvoton.com>,
	<WTLI@nuvoton.com>, <SJLIN0@nuvoton.com>, <ctlin0.linux@gmail.com>, David Lin
	<CTLIN0@nuvoton.com>
Subject: [PATCH] ASoC: nau8810: Fix incorrect type in assignment and cast to
 restricted __be16
Date: Mon, 20 Nov 2023 16:42:28 +0800
Message-ID: <20231120084227.1766633-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[211.75.126.7];domain=NTHCCAS01.nuvoton.com
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|SEYPR03MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e8fedd4-34be-4a01-9d23-08dbe9a4a797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m+H2Km29IRob3Cu7ThfBogZg3sgLVnks04CsOXPI2BY4c193M2U1MzkcEBv0bI05QtpVVVSa34av+9elrfkHT/tza6AsBQ1tU/xXpBn7CDdwNa5Z/Ix3WZikt7qdNqaTY3ZdAAVoBzB2gERMfGR9Rk9j/GQDkXTyt62aqs+RA9EocdW1wpn/VFcx7Dj2miCtTHEFOCGtv7Slns5a77bmqVXKiE5eJKx1E06xoWz0N5N8ADGIqbYtuSWY2uYWezhMIiDntBDzQJm4sXQhGEee+l8RtFRbvDrKjmRUgqXQ/EmnMV9wkeXUxRBpzPzctGmdr1uQ84V4288HiaFqzObwdhvQYAyIpj8Py22lDnc7D6l30hw+HNu4FCZBUTi4NgDYZekmeNfs4OYFpcGWIUHp9dSsX3dMHMh0P+K3kVEtZVXRTY7uGjZmkAoc5ZMVr2DGb3YR0itidR5mtMXCQU2zFoIktKt8I0tZimjhWBE+pKBrzMcygAzdwl8TINPbKc9m2BIKE2+3c6zXsn+yatwrKP1wxrXUfFaxK07SL7L7rTNr/cIWy45gMNMJ/aM+HDQ0/PBSBNxYn0yQN5f3cb8hGxzmPduF/tM1sYfq+HCih2pKP9iWViN1nq1EBlkIlOZ47YbCruvIHd6neSaTNdvDqsn9nDxp33FzbbsaOF1ir01X6OQ9z6AWcPRrV40oEi4qkrV9Bmu/N5oDljOgJfG5tZA/jWl/gictczDkdWrSJuqUWYya76Pvz6ocXvWqnnyLUa9dEBW6zvtld4SQahKs4XHnBzPj6A4cxuKZVDQCsOu+jL5hY5KIDhHVafVHKYeHOErGScfoLG1L0tHMG/fmyA==
X-Forefront-Antispam-Report: 
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(230173577357003)(230273577357003)(451199024)(64100799003)(1800799012)(186009)(82310400011)(36840700001)(46966006)(40470700004)(82740400003)(336012)(426003)(83380400001)(107886003)(2616005)(26005)(6666004)(40460700003)(1076003)(54906003)(70586007)(70206006)(36756003)(316002)(6916009)(40480700001)(5660300002)(86362001)(33656002)(2906002)(41300700001)(4326008)(8676002)(8936002)(478600001)(47076005)(81166007)(356005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 08:42:39.7915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9e8fedd4-34be-4a01-9d23-08dbe9a4a797
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6649
Message-ID-Hash: RKVXDOC6SUE2TEORBBDY4ZN6AKNFNLCJ
X-Message-ID-Hash: RKVXDOC6SUE2TEORBBDY4ZN6AKNFNLCJ
X-MailFrom: CTLIN0@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RKVXDOC6SUE2TEORBBDY4ZN6AKNFNLCJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This issue is reproduced when W=1 build in compiler gcc-12.
The following are sparse warnings:

sound/soc/codecs/nau8810.c:183:25: sparse: warning: incorrect type in assignment
sound/soc/codecs/nau8810.c:183:25: sparse: expected int
sound/soc/codecs/nau8810.c:183:25: sparse: got restricted __be16
sound/soc/codecs/nau8810.c:219:25: sparse: warning: cast to restricted __be16
sound/soc/codecs/nau8810.c:219:25: sparse: warning: cast to restricted __be16
sound/soc/codecs/nau8810.c:219:25: sparse: warning: cast to restricted __be16
sound/soc/codecs/nau8810.c:219:25: sparse: warning: cast to restricted __be16

This issue is not still actively checked by kernel test robot.
Actually, it is same with nau8822's sparse warnings issue.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 sound/soc/codecs/nau8810.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8810.c b/sound/soc/codecs/nau8810.c
index 47f000cd4d99..97a54059474c 100644
--- a/sound/soc/codecs/nau8810.c
+++ b/sound/soc/codecs/nau8810.c
@@ -169,6 +169,7 @@ static int nau8810_eq_get(struct snd_kcontrol *kcontrol,
 	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
 	int i, reg, reg_val;
 	u16 *val;
+	__be16 tmp;
 
 	val = (u16 *)ucontrol->value.bytes.data;
 	reg = NAU8810_REG_EQ1;
@@ -177,8 +178,8 @@ static int nau8810_eq_get(struct snd_kcontrol *kcontrol,
 		/* conversion of 16-bit integers between native CPU format
 		 * and big endian format
 		 */
-		reg_val = cpu_to_be16(reg_val);
-		memcpy(val + i, &reg_val, sizeof(reg_val));
+		tmp = cpu_to_be16(reg_val);
+		memcpy(val + i, &tmp, sizeof(tmp));
 	}
 
 	return 0;
@@ -201,6 +202,7 @@ static int nau8810_eq_put(struct snd_kcontrol *kcontrol,
 	void *data;
 	u16 *val, value;
 	int i, reg, ret;
+	__be16 *tmp;
 
 	data = kmemdup(ucontrol->value.bytes.data,
 		params->max, GFP_KERNEL | GFP_DMA);
@@ -213,7 +215,8 @@ static int nau8810_eq_put(struct snd_kcontrol *kcontrol,
 		/* conversion of 16-bit integers between native CPU format
 		 * and big endian format
 		 */
-		value = be16_to_cpu(*(val + i));
+		tmp = (__be16 *)(val + i);
+		value = be16_to_cpup(tmp);
 		ret = regmap_write(nau8810->regmap, reg + i, value);
 		if (ret) {
 			dev_err(component->dev, "EQ configuration fail, register: %x ret: %d\n",
-- 
2.25.1

