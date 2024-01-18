Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C256831B60
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 15:31:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 519BBE9A;
	Thu, 18 Jan 2024 15:31:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 519BBE9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705588290;
	bh=ylSjPkkGJ8BeL6beWllqIu7WO1+Woc+cSxpoGcJTrh0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qwxfCmIWFGyjpM0kJ8TyXj+tpjkPB0eQCBueg7MfFc7PGs9KwLzIcq9Ul8e6LqQ9c
	 ugJO2DhUT2uJWpPe4g5xJP5o0qp6R8GDe+Fx0EqponJ4N0p760lqZqKIR7u8DRis2P
	 pB2E/QnLXKcloneDa5OaZ4Ep6WKs3r8Pt8ygjH08=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1A13F8057D; Thu, 18 Jan 2024 15:30:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54214F8057D;
	Thu, 18 Jan 2024 15:30:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3036F80236; Thu, 18 Jan 2024 15:30:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4FC8F80074
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 15:30:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4FC8F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0GsojAh4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+SvKPlBE9d7K7lAwiNxCVoRtt+OEKFXyUz7QunxYY6Gz/nsdvlDijpTvDzbR9R3vazT0Y2+4YM/VnKO5E+K9FTWK26A0hfKZ1OqRbNbDrS43aY38Vi/YzpZbT0Oiic5rnOgunEKpB5k8UAqkkYx5lHdjYOIO3KYw7Cu3LmqklMyuofN1p2oBsxWaCeGBbKn2ceSQQcE9oJKFl1yVA6tTQGHbxO71pY/WOmcZcfBwIFlEkORqMuRdfHckzYnGAi1FoybbPZASfx5XeN+jPw2JtzpFycYHEunbT1g0ouPqSwn4FignZ41C9yR+oF3eu5IJDKABur+y7vowxEqcA0itQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3xET7IjH+V2KLOSOX+7zCVySi5nBDvoo7+XKjtjYeg=;
 b=BX0Ztvj6CbO7SwZn5EhcmeYskAXEA0t70g3vTxBs3o9ygyabh3QZjNCDi4B000WYjyXZjcr8tyiyIR48jBsbt5kAbMIRAj1wGEj1AFC78dEjttyTLaCpStwUk7vAD2J7cnLtEBogW/61uJezL95tBe2qhwN6RFn/oc4yv1xMFAiMnGH60585QGtCw1eyQZlpg59mbkjriuKgPH+YpTNZ+y5I0hZ0nmAsyxHGo22mL9Dw1y+6F4je3vEpGYOWx5KXnVzJ7sfZWwdxKK/9d9UzI9fFwQmkAaHCwLqIDCGwLT/MMf70brciUeWw5Yfw+CYgwi9IPmHbxDE/hIntDU3RYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3xET7IjH+V2KLOSOX+7zCVySi5nBDvoo7+XKjtjYeg=;
 b=0GsojAh47+aw9PR/OFQUbZ6F51LO4exJqMTIw7ag2pcGVFretvtYr7/DeHOC05C7U2vZxZtw3Jeivptk2GgB0bSVydWXah19Xvole8SMo9tWY5D4FuQXYWPj0kmQEsg1kaAbO2OUudp7gHAlgmqnvjMvCMcEbj+MPfHiXgKRuuI=
Received: from CY5PR18CA0036.namprd18.prod.outlook.com (2603:10b6:930:13::21)
 by DM4PR12MB6302.namprd12.prod.outlook.com (2603:10b6:8:a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Thu, 18 Jan
 2024 14:30:36 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:930:13:cafe::79) by CY5PR18CA0036.outlook.office365.com
 (2603:10b6:930:13::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23 via Frontend
 Transport; Thu, 18 Jan 2024 14:30:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Thu, 18 Jan 2024 14:30:35 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 18 Jan
 2024 08:30:32 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 18 Jan
 2024 06:30:32 -0800
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Thu, 18 Jan 2024 08:30:23 -0600
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>, "Alper Nebi
 Yasak" <alpernebiyasak@gmail.com>, Marian Postevca <posteuca@mutex.one>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "open list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open
 list <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] ASoC: amd: acp: Enable rt5682s clocks in acp slave mode
Date: Thu, 18 Jan 2024 20:00:19 +0530
Message-ID: <20240118143023.1903984-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|DM4PR12MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c2a7aa-a6db-4938-d29e-08dc18320914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q+IMjM6QxEEjsptgBWKDjuV+eKBZPpPqEswJe/GLcExkP8iq/YtbJsF3fQPd0u9hrfXK6vfQCfu6o8ENLNGTO97M2Ivk+M91AjJSpO60JSTevd0QHX0n52y2q3EzQHjm8ON/19grhLfHmgvFx+/w7AKVIFMFgoRw9uHttsiOJwbBW9twUy9xFbY610gvhUnIGo9raSIG+sLSZPGmUEHn9eYV6oSiMm2cj8s6EYTfiHN+8ODhdOJNxBOHhnWOBa6BxFals7JI2t4fWWfxc5Z8EnipJZMkpsSnDpSlhMXn2Z9JsAXxfEupqaMUuyQTszg1/jt2DiQnxoJ9dCuO+mhTjtm3iJjiIlNlx5sls65kzocZ2UTq7UN2ThYuAfjrniAw1NiqGXb1NLNuSHC6oxd0e5254SNYsLD9UR2td3d0IbB+pNTJpF6odiA6kS8hskCwiXUqwPCSI8AFRD+TCSkS+g2Uxr25M3o+PvwyeQSzE8lZgxL/YroRcRUOCSx+4pdWjrKGuCiu57x1fPa+wK7Spc2Qlq0VHes9ZY+jnN4sCK0UX4UCG+d2kxf/jmUGAs7exHl32wwgncvVi9F6lv50mHMQ1GIrrR6A9DhLlozNQFnN0hXmWGuZwh6dGUv59BJQgKblsIlZd4PmpK/IBCvfk3GIT0FcBIbjA8HnLwSGs1I2BmJl5/o8qd3H2AJQc4xz0AwCLoYf8hm1oArx4u9ie2bSwU/fhqPy+ZqnYOOZKU0pVA4zte3/Er9T1obNJpES339jTUa9kLLdBEep9/8n6g==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(64100799003)(82310400011)(1800799012)(451199024)(186009)(40470700004)(46966006)(36840700001)(40480700001)(40460700003)(26005)(1076003)(426003)(336012)(6666004)(86362001)(36756003)(356005)(81166007)(4326008)(36860700001)(7416002)(5660300002)(54906003)(110136005)(7696005)(2616005)(47076005)(70206006)(4744005)(82740400003)(316002)(70586007)(8676002)(8936002)(478600001)(41300700001)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 14:30:35.8465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 26c2a7aa-a6db-4938-d29e-08dc18320914
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6302
Message-ID-Hash: NXSOONDQGF3ZHVAKBFB3FA7O7N22JXJP
X-Message-ID-Hash: NXSOONDQGF3ZHVAKBFB3FA7O7N22JXJP
X-MailFrom: venkataprasad.potturu@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NXSOONDQGF3ZHVAKBFB3FA7O7N22JXJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Set and enable rt5682s codec bclk and lrclk rates when
acp is in slave mode.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-mach-common.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index c90ec3419247..a224043ccd42 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -505,6 +505,13 @@ static int acp_card_rt5682s_hw_params(struct snd_pcm_substream *substream,
 
 	clk_set_rate(drvdata->wclk, srate);
 	clk_set_rate(drvdata->bclk, srate * ch * format);
+	if (!drvdata->soc_mclk) {
+		ret = acp_clk_enable(drvdata, srate, ch * format);
+		if (ret < 0) {
+			dev_err(rtd->card->dev, "Failed to enable HS clk: %d\n", ret);
+			return ret;
+		}
+	}
 
 	return 0;
 }
-- 
2.25.1

