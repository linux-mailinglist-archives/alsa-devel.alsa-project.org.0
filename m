Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F7154EA90
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 22:11:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B208B1AFE;
	Thu, 16 Jun 2022 22:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B208B1AFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655410317;
	bh=/AZr+rljy/Pxz5nVFcGALoMnm8WHRmEgg77ANOpUyvA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WCUj6k9qXvoHAD1iG5IW3SqynropgRijEJ3G1Uyfbn12VKkWiX61sPfcosTkYtV3c
	 WuB4DCMkk3PkUfHV6opL27FmlU/nsJ0jowmqJommDPurIw7JYxz2SiuWnWEfR9JzDb
	 JGGS3+C2VbKYt5Va5zU3oROk3PNPTZ9Bsd0Gy7T0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1202DF80310;
	Thu, 16 Jun 2022 22:10:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64A98F801D8; Thu, 16 Jun 2022 22:10:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E0ECF800D3
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 22:10:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E0ECF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="X6aYByuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655410243; x=1686946243;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/AZr+rljy/Pxz5nVFcGALoMnm8WHRmEgg77ANOpUyvA=;
 b=X6aYByuVsOOa0JcYjYW3tWmeB9z2hzOjTDbAonrFYkB2401UK6oIyXEH
 94E2q2zt3syL8bfahFwCz2d6bXR2KWJUiYIdX+MFKPdGG3OiUWEbLTfvK
 CvgD7CM+i2dF0eD/STZ1qIYd/EwvOTBaQXLlya+o+RepJYY7y+3GUGvDf
 JBRoxJMOyFTqV7FIW3CXjneNbzgzCxVSU4BkbNblh+2Fkf5loCn7Xa0lC
 19FIPYgYtZOgQhmK2Iq+OqO80qMtKjYU5HUHg4SyD0cXgcX1YbTR5v5kN
 snEDuoSOl3g1xcRzJlJttMIGf+3Jp6aO6tLc3xjDCkBdl1/ke/By+uVXB g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="276916110"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="276916110"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 13:10:35 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="641710719"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 13:10:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: intel-dspcfg: use SOF for UpExtreme and
 UpExtreme11 boards
Date: Thu, 16 Jun 2022 15:10:29 -0500
Message-Id: <20220616201029.130477-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

The UpExtreme BIOS reports microphones that are not physically
present, so this module ends-up selecting SOF, while the UpExtreme11
BIOS does not report microphones so the snd-hda-intel driver is
selected.

For consistency use SOF unconditionally in autodetection mode. The use
of the snd-hda-intel driver can still be enabled with
'options snd-intel-dspcfg dsp_driver=1'

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/hda/intel-dsp-config.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index a8fe01764b254..ec9cbb219bc14 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -196,6 +196,12 @@ static const struct config_entry config_table[] = {
 					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
 				}
 			},
+			{
+				.ident = "UP-WHL",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "AAEON"),
+				}
+			},
 			{}
 		}
 	},
@@ -358,6 +364,12 @@ static const struct config_entry config_table[] = {
 					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
 				}
 			},
+			{
+				.ident = "UPX-TGL",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "AAEON"),
+				}
+			},
 			{}
 		}
 	},
-- 
2.34.1

