Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1969A7EEBBA
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 05:33:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4FED1EB;
	Fri, 17 Nov 2023 05:32:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4FED1EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700195598;
	bh=Vdig5au6r61aHEuqWBctB0VfGaQQSZLkX7Wt+vyUBfA=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HZA2Uu4nJVMpLS3dL4mq6wY0GyhzSTR1mzsiWc2LlDJSQfqGEaSoUUv2tQ03zzxJ4
	 9PUf01eh6oy0VBRlZl4Ihz4v91yaUkOoZLXip1zaDk1ra3G/nIHXsGUSlY7WCg665M
	 I7anhdxU2I/dgefo7Lk31EOuv1kd0MA51FZvl5h8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 537B0F80249; Fri, 17 Nov 2023 05:32:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 369E2F8016E;
	Fri, 17 Nov 2023 05:32:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43BD0F801D5; Fri, 17 Nov 2023 05:31:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11AB2F80093
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 05:30:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11AB2F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=SCjVjIbX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHJvcpINaAkyMuV+MLyKPHaYw4eelk7Wed9V1eyA8sssdzipO3BXcQpscA47xA1AC4Joonb3CnDSfIK4JCbSRvjiakbSY6z8HF9UuOg9vUkejy0C0RJ2YYQJZYsATtmMC0KLt/Hw2+fFFaX/j9AndgFk3BPxn0lF6pq5KBvy6Pc0LDY8xJUCe7588SyfCwDTFu7yGhQkuUH8gbasMDIGaRZv3dn60+NJitSxL/jpC0cNJb5BkaAnExrAL7PbC75/QpmBiZ8wb88hXAs66Sn4K281rEUc2qj++8nWyGaHMbSRPUkHp7ZuIK0ffZ7jvptdkezWQmOP5DmxFFrHqvPrgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1A/mCx9CCJ8eoAUdNEFWBtUlmIgRIG+WhHaXbEEX2co=;
 b=QtVgO5RKVoIgcu3bxfHQQRRAti8kT4oMXuTbZyc4yL4POWEOqF/Zdnj75tIYk81Ofqk/In+3yOu32g6VN55jyyM9atBEptbMqcadaIJGIrpz0r/JfPQun8wYltl9hfk0+SyLUeJ1NnmuLJ+vH1wsgpsdz6EvfiGW+BuI9RM9wcVElmwA8bqgwJasFMy9WO1ouhEiMrF2OpfgV0O5M1lf60UlAiN3PS/hu8w+gd6Djm7IA2J3OIuaKD+ZnAVg0V1dQnI4zA1mSoAbvLn4vbHciJ6vdkC9zJxt6xJXtFL38GWa0OwA4y16y4pgp6SnJfydL/8vbJI3Bthchp32ipV9AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1A/mCx9CCJ8eoAUdNEFWBtUlmIgRIG+WhHaXbEEX2co=;
 b=SCjVjIbXNYCCNLy8Nw5V5yhvIovHn4TMVk+fFPLMwXLaDY/L/lo4Rm38SEHxwhhetGT9LaD+fc6eJu3vOZr55BrJcoSfnG1jar19qwUH9gJfIgvIHY2hC3ILhH/DHxQGIcb4i86cAgXYlWftH5q7Kzr+PJwsaDyZq7DAIJy7hVU=
Received: from KL1PR0401CA0009.apcprd04.prod.outlook.com (2603:1096:820:f::14)
 by SEZPR03MB7266.apcprd03.prod.outlook.com (2603:1096:101:72::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Fri, 17 Nov
 2023 04:30:38 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:820:f:cafe::bd) by KL1PR0401CA0009.outlook.office365.com
 (2603:1096:820:f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21 via Frontend
 Transport; Fri, 17 Nov 2023 04:30:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS04.nuvoton.com; pr=C
Received: from NTHCCAS04.nuvoton.com (175.98.123.7) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.7002.20 via Frontend Transport; Fri, 17 Nov 2023 04:30:37 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Fri, 17
 Nov 2023 12:30:32 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 17 Nov 2023 12:30:32 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <YHCHuang@nuvoton.com>, <KCHSU0@nuvoton.com>,
	<WTLI@nuvoton.com>, <SJLIN0@nuvoton.com>, <ctlin0.linux@gmail.com>, David Lin
	<CTLIN0@nuvoton.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: nau8822: Fix incorrect type in assignment and cast to
 restricted __be16
Date: Fri, 17 Nov 2023 12:30:12 +0800
Message-ID: <20231117043011.1747594-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|SEZPR03MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 07213b25-bdc8-4a49-b3bb-08dbe725f2d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	65xtTdn5o9gzSlpfzHAFB9dHj8HkV+C0KeaDiUpucJi5zWcx6yRmoILvYmiepngDg5m7FHOdYtbBZ8ZPlgyMpGwz/m/JbwiH1AAb8+OSQk3Yl1LT3ROYtaSle7OlawFPy16owuRh/Pdev+3212ZOvhialqWjJNxk/CenKaPa68QjO2KSmvdYPWjinr+B+VAoCOnetZOlkCwxvDR0LhrvBYk5Oyc+NaNIJmnemgNqu2wv/XnWnF9EhePFViSIUNuJvmzOBw3Bpp0AFjwhHiPdhQK1dsw1AAmbGM0DLMNNiu6Aj6v/Mjn2r8hqQxESfieCz0SOeJbV+GCcCQl++carf1tw3lgtLposXzVbsu6tU25dMkHAOvvqM1X84SlSi6qd/oY6imGXngyaWYVWz7uoMGKhaKhAfB4/hBEqdDTDBMQwwXnSPU8RIpi1b486qgKmDMm+2KaFxjDZb0NU3cO/lHf464tN6Z+C2fWvjLhB9zym3Gn5WtugSc0Qiv7sf5bgKDXrMhV14diDnx/UCdRcJxO0WNplMrVdbAalX4gK6I27SN+LLep5Oi35oN/nHppFMINfJrXH44oNlkWdahCvS0lwjhIqbEvaRSwZ2wGbFoQyLCuPngA426sd1D7uj/uadg/QLmLtZ+gxwjDlTfGuA1hdgDUq2s+/hsZgwrJVB81OghvLA13qYQBzoNgGgmzIr8RZt7cyJQvDtZrtz6T1BfLcr1wyr3suTAVmMXepMP4cmW4EUnb+NOLVfeXFCLP1V1ArZLsGmQxiobi+liwU15+AxRC/1hHKXdohoEoFQMhaLKsIvlQPVVk8kg3BOaMz
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS04.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(230173577357003)(230273577357003)(451199024)(186009)(1800799009)(82310400011)(64100799003)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(70206006)(70586007)(54906003)(6916009)(356005)(81166007)(33656002)(36756003)(82740400003)(86362001)(36860700001)(83380400001)(426003)(336012)(2616005)(6666004)(26005)(1076003)(2906002)(316002)(8676002)(478600001)(966005)(5660300002)(41300700001)(47076005)(4326008)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 04:30:37.6133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 07213b25-bdc8-4a49-b3bb-08dbe725f2d2
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS04.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7266
Message-ID-Hash: 7ROUEQMX7JLHWO4LH6HXEIB7HS5VIFKM
X-Message-ID-Hash: 7ROUEQMX7JLHWO4LH6HXEIB7HS5VIFKM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ROUEQMX7JLHWO4LH6HXEIB7HS5VIFKM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This issue is reproduced when W=1 build in compiler gcc-12.
The following are sparse warnings:

sound/soc/codecs/nau8822.c:199:25: sparse: sparse: incorrect type in assignment
sound/soc/codecs/nau8822.c:199:25: sparse: expected unsigned short
sound/soc/codecs/nau8822.c:199:25: sparse: got restricted __be16
sound/soc/codecs/nau8822.c:235:25: sparse: sparse: cast to restricted __be16
sound/soc/codecs/nau8822.c:235:25: sparse: sparse: cast to restricted __be16
sound/soc/codecs/nau8822.c:235:25: sparse: sparse: cast to restricted __be16
sound/soc/codecs/nau8822.c:235:25: sparse: sparse: cast to restricted __be16

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311122320.T1opZVkP-lkp@intel.com/
Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 sound/soc/codecs/nau8822.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index ff3024899f45..7199d734c79f 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -184,6 +184,7 @@ static int nau8822_eq_get(struct snd_kcontrol *kcontrol,
 	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
 	int i, reg;
 	u16 reg_val, *val;
+	__be16 tmp;
 
 	val = (u16 *)ucontrol->value.bytes.data;
 	reg = NAU8822_REG_EQ1;
@@ -192,8 +193,8 @@ static int nau8822_eq_get(struct snd_kcontrol *kcontrol,
 		/* conversion of 16-bit integers between native CPU format
 		 * and big endian format
 		 */
-		reg_val = cpu_to_be16(reg_val);
-		memcpy(val + i, &reg_val, sizeof(reg_val));
+		tmp = cpu_to_be16(reg_val);
+		memcpy(val + i, &tmp, sizeof(tmp));
 	}
 
 	return 0;
@@ -216,6 +217,7 @@ static int nau8822_eq_put(struct snd_kcontrol *kcontrol,
 	void *data;
 	u16 *val, value;
 	int i, reg, ret;
+	__be16 *tmp;
 
 	data = kmemdup(ucontrol->value.bytes.data,
 		params->max, GFP_KERNEL | GFP_DMA);
@@ -228,7 +230,8 @@ static int nau8822_eq_put(struct snd_kcontrol *kcontrol,
 		/* conversion of 16-bit integers between native CPU format
 		 * and big endian format
 		 */
-		value = be16_to_cpu(*(val + i));
+		tmp = (__be16 *)(val + i);
+		value = be16_to_cpup(tmp);
 		ret = snd_soc_component_write(component, reg + i, value);
 		if (ret) {
 			dev_err(component->dev,
-- 
2.25.1

