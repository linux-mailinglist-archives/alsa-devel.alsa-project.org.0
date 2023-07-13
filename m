Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AE275220A
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 14:58:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 185D6852;
	Thu, 13 Jul 2023 14:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 185D6852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689253136;
	bh=vvdCliww3UdA13zxJUngMVLhVXhGIcaM8d7VjqiZsH8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pUKl6cSr5llCZB+dhK3EQhFyAtVDluYGE3FDf5b1jevPu5OqbW/vPdsCniff9wA+0
	 G+/xKHAzFEzrY6X/Oc7jmA34mYxL0uh6On5h0BxESJSKWG2vCaxv/MUEQKZuiX+Wbm
	 hXlbAyyPiSxdLhK55CEMxG0QEPa06reoFxNH1HNU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5F6DF8056F; Thu, 13 Jul 2023 14:57:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11A5FF8055A;
	Thu, 13 Jul 2023 14:57:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9854BF80290; Thu, 13 Jul 2023 14:57:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E1B5F80548;
	Thu, 13 Jul 2023 14:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E1B5F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com
 header.b=Zx8dDSPh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIXdkGjD0Bj7KAx4Orai35oMWYRg79S7jQlfOT9MFB/1WVgdP36tXLBrwQYyRjs5RX9G5bDRSucimNmKwOQDbJoPenxbuZ/Fh2fxUih6/KV6tBslALN3HmP3LHK31eWWEaS0+Lp1EBUwb+BOTRj9nYYOM8YMu9g+hoFtWq4bu0JRx0+MRt5khWZjKqZsZNQlWawH/p9zqOVjukLZ3fMALKEhMqvp3IMUoW2s1ANIPqt+13xkY8Hfesh8ffRgtMtbdcaNqiGsCmJWLO8TM1+/D8CfW7gf1GckGcxwUkvPj1YwmM0wUVm76eALEbCpTgfABP+yOZG3411f/RWkyoF+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7LkuYri5ww2xhE0+6f1XPec/qDhzB3VhM6hn5+dNOI=;
 b=OmzFLZWOylZL7wfrmsZcD+/IS2gHZ+z2M6SYZEBBW42xgxtAXQ9XkefkPp8x2RbI5Bt67FvBc5HFsQbgGfi1+JJyw18h7nLb8ztPZBSARuh7v+3cucaihrLu0NxxAkYxeUN6J2tc41lQMY9JOoTZ/jxmuD2rjSWpsBJMnGVuqzzTrXwF9eHzHseAoDraK+Q6Agtvpe2s6zMPlpiRCFNrHUrcVBul3yDS2qIOK3QajZGCEBWkkWbmxpTACFHS3GDLa5GQbg2nJgP+z9bATY44Bt8knd8nyRXFpcdxQPOyzjDXT8PORQXz3rxBbOH5PD1X3fsl5smMvme0ak0f63XMDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=amd.corp-partner.google.com; dmarc=fail (p=reject sp=reject
 pct=100) action=oreject header.from=amd.corp-partner.google.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7LkuYri5ww2xhE0+6f1XPec/qDhzB3VhM6hn5+dNOI=;
 b=Zx8dDSPhntUaFF3PqZ0P06mIOZU9h+5UrVGqxvxPUoMZk3qL6ldk9882Uibe1jOj7VxsvOo/oSQwqlCXKNJO+vUflUch6iQjG6ObuQ9ajgT2rvCu8ihdl6XojrMoGhw8M1yltfnVXthWX6Ai7WYBky9JoTFNz5GEFnki3m+bwpDe9sX9o89oNjTJq4hbzMRoqgTknoUy9gpbgLPql9PSjfw+sQD7XgGD39vPgJ9kX0whA8c0/TfQPoEO17eFs+ACkF21/JFnURl8VkXe7r7M6LLJbQ+IU6SvJtqi3d8exCm8qNmHw1j0ldqv2z8K3soEGg1qFCui/Sx6N6yFd4vpQA==
Received: from BN6PR17CA0045.namprd17.prod.outlook.com (2603:10b6:405:75::34)
 by PH7PR12MB8179.namprd12.prod.outlook.com (2603:10b6:510:2b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Thu, 13 Jul
 2023 12:57:31 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::ec) by BN6PR17CA0045.outlook.office365.com
 (2603:10b6:405:75::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24 via Frontend
 Transport; Thu, 13 Jul 2023 12:57:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.corp-partner.google.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=amd.corp-partner.google.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.corp-partner.google.com discourages use of 165.204.84.17 as permitted
 sender)
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.24 via Frontend Transport; Thu, 13 Jul 2023 12:57:30 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 13 Jul
 2023 07:57:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 13 Jul
 2023 07:57:30 -0500
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23
 via Frontend Transport; Thu, 13 Jul 2023 07:57:24 -0500
From: V sujith kumar Reddy <vsujithkumar.reddy@amd.corp-partner.google.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<ssabakar@amd.com>, <akondave@amd.com>, <mastan.katragadda@amd.com>, "V
 sujith kumar Reddy" <Vsujithkumar.Reddy@amd.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "moderated list:SOUND -
 SOUND OPEN FIRMWARE (SOF) DRIVERS" <sound-open-firmware@alsa-project.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] ASoC: SOF: Add acp-probe id to sof probe client driver
 for registration.
Date: Thu, 13 Jul 2023 18:27:08 +0530
Message-ID: 
 <20230713125709.418851-3-vsujithkumar.reddy@amd.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: 
 <20230713125709.418851-1-vsujithkumar.reddy@amd.corp-partner.google.com>
References: 
 <20230713125709.418851-1-vsujithkumar.reddy@amd.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT023:EE_|PH7PR12MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: 88551f71-f4e6-41c6-0185-08db83a0b81f
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SQZvcnCYQ/VQP+gBLPMrIHSEPZ0+y/f85ap+9wYvL4YlckhgpEROPoCp7yGHujJb/u6BGcT0oTI4L7KIXpoLQX5cQ8y4nstqfygwX8sTr2+RxAeCpygQ+ZrWTmYAIhLFcHNtbScLJ/hDAzVkRfMt8b2xKbYiEMm0CGMbYhY3zOFoXqdRG0528R6iKP6Cdj55d8IpldPMzta5ytNdMUCFce7XRAv3emLyBXR3s+epFagbfXrpHLoiTHNbf5evQQ36wP3iKp7f+9rt1esIZOSlI4DKyY8xS8I9golK/bLpPkRXeB0XHs7Bl5/Bq6VAPy7nppVZOKPd3+V9r84/Gd5vi8H/HKIyxAHoTArfB+eJ5nLrUZLHH7MpCZAq+bQzty82sAkpe3aqYC2I/vAnAtKSao3S9OJmvC6WtenvO11cUbWklfpQKQpTqRZ+NWhyw6EBerrEn/hNqSgKrPLLR89ngwZhtBHq0ECetOLEWempo/dEnHL9SzJlPUpCMCLavvJyRKWT8P56CZC1KZrx1IO0FXOOkpeXqQdT/IvtSWvU4Z0C64VedomOD9lGp5PhnguWD8ydtu7kgkzIb0RYSCaqoo0tFkIkXirEEd1PG/Ju2ignhBzDj1UyQTjj/yMNTsS9LVONsjMH9ioylOINV76gnZ5fD1V5O0oAYbdtLo7Lq/+Ni1N6ZTIla68Bw0+zxSyLBSyU2qO5fSMZiwr9YLFZ4c4I9jD7QCNRLGYcBMWMx7SIEcozbO8HO2LBBW24l+Xl
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199021)(40470700004)(46966006)(40460700003)(1076003)(26005)(2616005)(35950700001)(47076005)(41300700001)(498600001)(316002)(4744005)(7416002)(5660300002)(4326008)(8676002)(2906002)(8936002)(70586007)(70206006)(54906003)(110136005)(6666004)(76482006)(40480700001)(336012)(356005)(81166007)(82740400003)(82310400005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 12:57:30.9634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 88551f71-f4e6-41c6-0185-08db83a0b81f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8179
Message-ID-Hash: AA75VTVTSU74HZXVGWH2737ZL3ZG6NWQ
X-Message-ID-Hash: AA75VTVTSU74HZXVGWH2737ZL3ZG6NWQ
X-MailFrom: bounces+SRS=HnE87=C7@amdcloud.onmicrosoft.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AA75VTVTSU74HZXVGWH2737ZL3ZG6NWQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>

This patch adds acp-probe id as a match id to support probe functionality
for amd platforms.

Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
---
 sound/soc/sof/sof-client-probes.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 8d9e9d5f40e4..5530b5d793d0 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -523,6 +523,7 @@ static void sof_probes_client_remove(struct auxiliary_device *auxdev)
 
 static const struct auxiliary_device_id sof_probes_client_id_table[] = {
 	{ .name = "snd_sof.hda-probes", },
+	{ .name = "snd_sof.acp-probes", },
 	{},
 };
 MODULE_DEVICE_TABLE(auxiliary, sof_probes_client_id_table);
-- 
2.25.1

