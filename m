Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 616D84EB130
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Mar 2022 18:01:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E29C51728;
	Tue, 29 Mar 2022 18:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E29C51728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648569668;
	bh=Rn169QXH7Si+57iaSVTsEhP3dhWXZOLVPe9KtJJ0Bsw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IeFb8dd4gnvNnm0labd7iXzaMUZ8bJowa5u7PtMG9oMjhrspEZBSrdHdez0lpvRbB
	 S7CKj4WAKFRjcC0la1UM9UyFcDHZl99KPa9+sl9myTEw+w9n0c1kSSHOgU8vy7MVDG
	 eVUodVajEWl0ArROdt8oZU9Q7W+FZ1A+waf+6F4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52463F80121;
	Tue, 29 Mar 2022 18:00:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D081F80311; Tue, 29 Mar 2022 18:00:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::618])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF895F80121
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 17:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF895F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="l+M09axe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DONb/hpCilBFXXMk/8HGN0bod6JkOj0rERDx1Ef8GH3EsiKRMJZoUA/Y0w+PdrC+cMBMaFd3imdGqsLRND1uypAPMLNa96tI4ikp3e6DZvz3pEKuFsSOmJQeoeuFCl+eqV85fTfHO+BpnPdd48NTGbnUIbyBmfn60ngBdivPTBys1s7YF9ZX2p5E/a6uMRVYidD7lPCrdWyeFnQPtQHejB1pugMBii1L6IqHI8ttkxhAPMTA+B7UGCMc7/XlTCa2DNgD1iQ6pGuD1/tc0aujZ0S18Z5A5NzKZmo9smZN+Cq5UUHoRmShIyWQPBXweAOPEPXuDJ9CAB4DwuN9r/D1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfyNHvyiXYIlNo0Bul5yEXwtvqGR5eGBhUOWRTdDK6g=;
 b=dbicLCRu1gvEQuYPsRJDwPbZxRp2m5t5Z8+MpkofCFcsSDXb+F+A8NmD+ml5vaHppNja3ZQk2W75hq0wTcxwwC6MdZH0qeGzjVyBp2OMDeXMeiT9vPNHh23gmnjOmcI2PnaHWj5h7NkgKoJ3ly4igD4fD+KHE12RpBsP06ciSwFsBnvmBsIJEBYf9Yi8bt8CLLLxmHgBaj0htAotXVfCauEiGGdGGXufq4mVXpT+N3oHKzscQiAWRGXBM7/Xj7r5tROQJMpWwam1V8vMzqYeynR0GW4KmvBGtak3pUNnE0bNAITXbQUZuljT5UuzanN74Ukk/EvKimmAIM4x3ydarA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfyNHvyiXYIlNo0Bul5yEXwtvqGR5eGBhUOWRTdDK6g=;
 b=l+M09axev/5xOanWQnALsFnsEdw4P5jQN7mLr5i1fbKCWjGjZDmp/Et8/nvNOX4MfdSx3VZ90FRjQYBjZ4eGzbvqBs5PCJ2CjThiUIEM/ryeYx6ppOUZLB+DUO73zJVmAsHJByRJlGADG2WSLI567xVPdbgPrL2aZF63fLaZPI6/8y8iCqyR8ZeQM27ufQqXrOZiPaGnBtSweRTm9gTHRfm2LI+2Xy+E0RCqNhVXe+7+4lnAgCENj20vWoBl2RJ32A3dgECQeeSEqPvhW+VFgN+dtZhjhm7G7bIr0shVfK+ImfP1TKOqfRh9zYC4b1J0r+BWBUzfrEAzxM8mO+vLwQ==
Received: from BN9PR03CA0988.namprd03.prod.outlook.com (2603:10b6:408:109::33)
 by CH2PR12MB4101.namprd12.prod.outlook.com (2603:10b6:610:a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Tue, 29 Mar
 2022 15:59:48 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::23) by BN9PR03CA0988.outlook.office365.com
 (2603:10b6:408:109::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18 via Frontend
 Transport; Tue, 29 Mar 2022 15:59:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5102.17 via Frontend Transport; Tue, 29 Mar 2022 15:59:47 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Tue, 29 Mar 2022 15:59:46 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 29 Mar
 2022 08:59:45 -0700
Received: from mkumard.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Tue, 29 Mar 2022 08:59:43 -0700
From: Mohan Kumar <mkumard@nvidia.com>
To: <tiwai@suse.com>, <kai.vehmanen@linux.intel.com>, <perex@perex.cz>,
 <ville.syrjala@linux.intel.com>
Subject: [PATCH] ALSA: hda: Avoid unsol event during RPM suspending
Date: Tue, 29 Mar 2022 21:29:40 +0530
Message-ID: <20220329155940.26331-1-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e0558db-401e-4b8d-2a96-08da119d261c
X-MS-TrafficTypeDiagnostic: CH2PR12MB4101:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB41013F1DC5795B7E11E703E6C11E9@CH2PR12MB4101.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M1j8TMz7QkEod5ULtcFyLLDfsVM0haeV0gdI7HPFJQDp5GNDV5mz71afCHRQGO7FhI2/Re7Yrc7VX2qoX0fYXECX2bvZE2YWu8adYxBoipnwaF32bSwHPJmzmdbcTKVqYhE2Lo36DuJsz2GhDYr0R6NfU3UmTP1M5q1+fY8cuAAEJ+QZo0RwQ87aoYspdpy0gGnWjnC61ZugBQrWirIwTSiduF32uE4mb59lZhKGDkmMjT132gisZCur9quO646Jbl49EqJ7zs04YceI6aXztG4947S33zpqhwgFFDoUm8NN+9GAEvryVN99ZYbXAh24QC5A9Un1MJ8WnBp7hAvj7hZ48st/lhSPdSMKkm+oCfT+c3QjDbATh3sNVACTwWt1vmDEdhDHWg3gYCFeRFLEzMWz9dUnP6qMjZjlULwoX5snr4yF9HiHTIIszn3z9iIphvkQtMqQ3HIjiUrwD6bdhbHohb3dkJUfEb9jEysFMEL6g4lPRRbjw+U2H1l+A/WCAb0Xe0dudkImL7SoFjqvK6x+54IgRcWawm4iNVLfGbFwV+FZvokQLpW271TC2EElQ6kQdM1ssL6rNRN5gWGuhd1uSMGXqzjN9mFJyvV8ZFr1EwG+rDJEJf8arM2k1uaduCpnoYixGctM7ovWD/wo56GcmYberQrfBpuhj41yvCQ3tSbZZvuCfGppbTQbIWEewz4P8pxXoACtAlO/J+dpsw==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(70586007)(86362001)(316002)(8676002)(47076005)(82310400004)(356005)(40460700003)(54906003)(70206006)(110136005)(81166007)(4326008)(5660300002)(36860700001)(15650500001)(2906002)(26005)(8936002)(186003)(83380400001)(508600001)(336012)(426003)(2616005)(1076003)(107886003)(7696005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 15:59:47.1389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0558db-401e-4b8d-2a96-08da119d261c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4101
Cc: alsa-devel@alsa-project.org, thierry.reding@gmail.com,
 linux-kernel@vger.kernel.org, Mohan Kumar <mkumard@nvidia.com>,
 jonathanh@nvidia.com
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

There is a corner case with unsol event handling during codec runtime
suspending state. When the codec runtime suspend call initiated, the
codec->in_pm atomic variable would be 0, currently the codec runtime
suspend function calls snd_hdac_enter_pm() which will just increments
the codec->in_pm atomic variable. Consider unsol event happened just
after this step and before snd_hdac_leave_pm() in the codec runtime
suspend function. The snd_hdac_power_up_pm() in the unsol event
flow in hdmi_present_sense_via_verbs() function would just increment
the codec->in_pm atomic variable without calling pm_runtime_get_sync
function.

As codec runtime suspend flow is already in progress and in parallel
unsol event is also accessing the codec verbs, as soon as codec
suspend flow completes and clocks are  switched off before completing
the unsol event handling as both functions doesn't wait for each other.
This will result in below errors

[  589.428020] tegra-hda 3510000.hda: azx_get_response timeout, switching
to polling mode: last cmd=0x505f2f57
[  589.428344] tegra-hda 3510000.hda: spurious response 0x80000074:0x5,
last cmd=0x505f2f57
[  589.428547] tegra-hda 3510000.hda: spurious response 0x80000065:0x5,
last cmd=0x505f2f57

To avoid this, the unsol event flow should not perform any codec verb
related operations during RPM_SUSPENDING state.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
---
 sound/pci/hda/patch_hdmi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index c85ed7bc121e..3e086eebf88d 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1625,6 +1625,7 @@ static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	struct hda_codec *codec = per_pin->codec;
 	struct hdmi_spec *spec = codec->spec;
 	struct hdmi_eld *eld = &spec->temp_eld;
+	struct device *dev = hda_codec_dev(codec);
 	hda_nid_t pin_nid = per_pin->pin_nid;
 	int dev_id = per_pin->dev_id;
 	/*
@@ -1638,8 +1639,13 @@ static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	int present;
 	int ret;
 
+#ifdef	CONFIG_PM
+	if (dev->power.runtime_status == RPM_SUSPENDING)
+		return;
+#endif
+
 	ret = snd_hda_power_up_pm(codec);
-	if (ret < 0 && pm_runtime_suspended(hda_codec_dev(codec)))
+	if (ret < 0 && pm_runtime_suspended(dev))
 		goto out;
 
 	present = snd_hda_jack_pin_sense(codec, pin_nid, dev_id);
-- 
2.17.1

