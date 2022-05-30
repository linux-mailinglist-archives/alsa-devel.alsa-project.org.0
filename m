Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29851537B5A
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:24:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7FF11A74;
	Mon, 30 May 2022 15:23:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7FF11A74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653917041;
	bh=YXty0/7z6ZrZUHicFDv5v5G4RXIzi2GkxPp9HpTszn8=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kxbet6OOhdOj9kpWosb/uuDzhyoVYmsL9ut8n5ZX9Gui0RKwQ44NWEQ0zrf1Oy6e6
	 37WwfC8x1T6Am9R7BvlkbvSohCyyDrOKJFMuuhdX3z/LsgLUpwFaoZU2y7gfJ1b5dl
	 /NOnjPfnGazKOM2nA7MwBMszlOhvhthcA6Aeyzy0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D59FF804EC;
	Mon, 30 May 2022 15:22:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B10CEF804BD; Mon, 30 May 2022 15:22:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D97C6F800E5
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D97C6F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="zuui1emS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8PE3TiWEaO8o2QIKbgsb4gBZ7ze6T/CPgVtv29HzdVrHdBbb181v0cnj4cjxya1KTIdCVGDz2RY1cco1uGGFFxdBFZOJxRhp+fSgTP6+A1cc84q2dRgoFWRrzZ6YzsfyplA1lukNY3Ig9zVa46FWT/HdQrmqG6P8GADF0IU8GU0zhVh4ztG/GGVMBoP9X3XZbV+WipBz9bshcjKWwWCjEmYrB0acup7ihYhINiR9K7KzK66wGtWocM/E9+M5fz75saA5aXjHUIiPQdo4y9lCJhj1ShQUns2IN8J0EcQ535QocT+FWeopkHtDyDLR9ZBsONCp/KmJX29vLRQhBbQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2dXRhO2zN4O/VMDv2A5cVohtgsMei5ctsybRNuD968=;
 b=PzVa329GJHYb8Emm/yKQziz//A6qVmdFyTCATPteVBg1MhT61Y91pLogdv4WVyh5lGUhSHfCc2fjPc99PAjIFEgm4yDKQXToO/RoluG4HvmMPOtwgWFmMCgxqcMxRKXVlzZYBguO7xOe+LDFvYY0C77ADTm+ImHI6DcqCymYAfVu/PquJEbyHdxXfIDiMNvDXQKTaYonfBeD8EnhyzLF0rXPAFvnyIE7xS8uuKK3EAQBvQsLSbpSibNc96UHHo1prAd+Z/neXiSN3s5stNDEO2D+RM2B+2yEfkDasnkwQh1pkyQYgCDACl2oGaRioek/GhfpBdxilQz5A+V1vDfAHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=dm.renesas.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2dXRhO2zN4O/VMDv2A5cVohtgsMei5ctsybRNuD968=;
 b=zuui1emS/jiP6TGXumOfT+goC2jqxPgyMqaqlq7zUmjuhlUSPHMb8jFHcl7WK9mwMN2HHDTYS5MOBExVo874IumvVl5YbNc5hxoIYlpnGeE1fApR2luBua2Ew0dE6zt3UJwxSvTpJHVlWfV3RUk0k0oooP2O4NUuPkVrUO89/WA=
Received: from AM6P195CA0037.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::14)
 by AM0PR10MB2833.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:125::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 13:22:23 +0000
Received: from VE1EUR02FT103.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::c9) by AM6P195CA0037.outlook.office365.com
 (2603:10a6:209:87::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Mon, 30 May 2022 13:22:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=dm.renesas.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 VE1EUR02FT103.mail.protection.outlook.com (10.152.13.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Mon, 30 May 2022 13:22:23 +0000
Received: from nbsrvex-01v.diasemi.com (10.1.17.243) by
 nbsrvex-01v.diasemi.com (10.1.17.243) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 30 May 2022 15:22:22 +0200
Received: from slsrvapps-01.diasemi.com (10.24.28.40) by
 nbsrvex-01v.diasemi.com (10.1.17.243) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 30 May 2022 15:22:22 +0200
Received: by slsrvapps-01.diasemi.com (Postfix, from userid 22379)
 id CD1C580007F; Mon, 30 May 2022 13:22:22 +0000 (UTC)
Message-ID: <e0a627725c189dd50d6ce24571aed87fe2597395.1653916368.git.DLG-Adam.Thomson.Opensource@dm.renesas.com>
In-Reply-To: <cover.1653916368.git.DLG-Adam.Thomson.Opensource@dm.renesas.com>
References: <cover.1653916368.git.DLG-Adam.Thomson.Opensource@dm.renesas.com>
From: Adam Thomson <DLG-Adam.Thomson.Opensource@dm.renesas.com>
Date: Mon, 30 May 2022 13:22:22 +0000
Subject: [PATCH 1/2] ASoC: da7219: Fix pole orientation detection on certain
 headsets
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7253d793-1107-4905-d7a9-08da423f6ed0
X-MS-TrafficTypeDiagnostic: AM0PR10MB2833:EE_
X-Microsoft-Antispam-PRVS: <AM0PR10MB283397B5C951A49D0005596CA7DD9@AM0PR10MB2833.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: maFO8AoOl8J3f0+wKnQ80cxPaDWyuHi3jAyZKEM6aRSagia5UBjteYCeSG/fCWxhkH14vxenrxWPXIvfS/Nklx0WHEt2oW0rfMUGXApNJ9/hX8ReU5JYz1+K3vItOeV8MCqd5qBoAwo0hWv1Z1UJQ9E3MXwZvV948G490NzQcd5xwCBkGzhVBCW9WbPRZBKdiPHqWwy+mnKN7NMpqTrwF2aqeekQbxn0XndVbwKN9kMNLx6Cr1a6bHIdQDCLk0fTNRQaJhhjeb17Bt/NtGzG7Kg28HAv/NwdFw6iDF+u7XW8n9Xz+7fZWT1Ldbifl5ZuPDyybdRgBVhE1PrZh6A5TYp0YLXWX5+YfBNX97+9xSpSfLs0gppPSAn5AJHkvMDAeq+vCfHKc/bnra4COE5v/x0pofYUoKW9QbOHP0heaf5oZthteEuiNERWTipkZzxc7ypvIvAl1HqldaFTRs4DUZwab09d4Wi8jNUn3p71O1SHUpG8BLZxFKEZvvoJvFzZcRNbQeMzfUt44lxlMxhLH64Dr8yM6nake8MfhSTDxg9I/+aUYc7X3o/kI3oiOi4ukT3XXIyDE61nQHaVwJYIMD4xdrQlJE8OAFbgnM8TaOjTai+BvfuroFc7tztl5OQch29O+NbSuMsWM1jDhD8zm601jPh1Uke912GeVuvVUFkGf6IDiAgXPuh1tj6ac6gmFnt41471oboLguID74Z1iTuweu2atZ72IRnP9oEGLBOUpBBBEbLvgJO5n2n7pyyH
X-Forefront-Antispam-Report: CIP:193.240.239.45; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mailrelay1.diasemi.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230001)(4636009)(136003)(346002)(376002)(396003)(39860400002)(40470700004)(46966006)(36840700001)(42882007)(42186006)(54906003)(70586007)(70206006)(110136005)(316002)(8936002)(186003)(336012)(82740400003)(5660300002)(40480700001)(2616005)(2906002)(508600001)(81166007)(6266002)(83380400001)(83170400001)(36860700001)(40460700003)(26005)(41300700001)(356005)(47076005)(82310400005)(4326008)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 13:22:23.5118 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7253d793-1107-4905-d7a9-08da423f6ed0
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c; Ip=[193.240.239.45];
 Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT103.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2833
Cc: alsa-devel@alsa-project.org,
 Support Opensource <DLG-Support.Opensource@lm.renesas.com>,
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

It has been recently found that certain 'active' headsets can
be mis-detected as OMTP instead of CTIA, causing obvious issus
with audio quality. This relates to increased resistances which
negatively impacts the pole detection circuitry within the device.

To counter this, ground switches on both headphone channels are
available to enable/disable and these allow for the detection
process to operate as intended, even with active headsets. This
commit adds control of the ground switches to the AAD logic.

Signed-off-by: Adam Thomson <DLG-Adam.Thomson.Opensource@dm.renesas.com>
---
 sound/soc/codecs/da7219-aad.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
index 7998fdd3b378..e7d8c33e02cc 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -60,6 +60,9 @@ static void da7219_aad_btn_det_work(struct work_struct *work)
 	bool micbias_up = false;
 	int retries = 0;
 
+	/* Disable ground switch */
+	snd_soc_component_update_bits(component, 0xFB, 0x01, 0x00);
+
 	/* Drive headphones/lineout */
 	snd_soc_component_update_bits(component, DA7219_HP_L_CTRL,
 			    DA7219_HP_L_AMP_OE_MASK,
@@ -153,6 +156,9 @@ static void da7219_aad_hptest_work(struct work_struct *work)
 		tonegen_freq_hptest = cpu_to_le16(DA7219_AAD_HPTEST_RAMP_FREQ_INT_OSC);
 	}
 
+	/* Disable ground switch */
+	snd_soc_component_update_bits(component, 0xFB, 0x01, 0x00);
+
 	/* Ensure gain ramping at fastest rate */
 	gain_ramp_ctrl = snd_soc_component_read(component, DA7219_GAIN_RAMP_CTRL);
 	snd_soc_component_write(component, DA7219_GAIN_RAMP_CTRL, DA7219_GAIN_RAMP_RATE_X8);
@@ -444,6 +450,9 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 			snd_soc_dapm_disable_pin(dapm, "Mic Bias");
 			snd_soc_dapm_sync(dapm);
 
+			/* Enable ground switch */
+			snd_soc_component_update_bits(component, 0xFB, 0x01, 0x01);
+
 			/* Cancel any pending work */
 			cancel_work_sync(&da7219_aad->btn_det_work);
 			cancel_work_sync(&da7219_aad->hptest_work);
@@ -899,6 +908,9 @@ int da7219_aad_init(struct snd_soc_component *component)
 	snd_soc_component_update_bits(component, DA7219_ACCDET_CONFIG_1,
 			    DA7219_BUTTON_CONFIG_MASK, 0);
 
+	/* Enable ground switch */
+	snd_soc_component_update_bits(component, 0xFB, 0x01, 0x01);
+
 	INIT_WORK(&da7219_aad->btn_det_work, da7219_aad_btn_det_work);
 	INIT_WORK(&da7219_aad->hptest_work, da7219_aad_hptest_work);
 
-- 
2.17.1

