Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAF362EB4B
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 02:49:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D966716D0;
	Fri, 18 Nov 2022 02:48:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D966716D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668736187;
	bh=JCT8yde2wSJTHmz8AayLwmEbTBzTqm1QKCw6ulNdVDI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UdAcuhCA3VHniitYc4QLIF3pycxlQ0EM8xTOdSQlmNaksTFiW+nGR8u8r5Ev0XPkE
	 JXQk+2vpgfa7DxJnpbRCBqkB/lAG31UKK0mi8Nm9IrQa5GGHNqagrabQAl1E0hUxKl
	 QpTws7jz+a/ONDUlWofxkbWVI2+uY6yVbApNJ/zA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A33EF800B8;
	Fri, 18 Nov 2022 02:48:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47999F8025A; Fri, 18 Nov 2022 02:48:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA7E1F800B5
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 02:48:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA7E1F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Vyl4Oi4H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668736126; x=1700272126;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JCT8yde2wSJTHmz8AayLwmEbTBzTqm1QKCw6ulNdVDI=;
 b=Vyl4Oi4HzxiRVMRoW3lMCAgstgNwYeG54aLVD8ICquRI0KIi/v/dqwL/
 M/Y0Uug5qo+DD2zx0IHZmlLSdSxlSJ/LVgrfabH6TJnZqMbIOflwnhaeF
 TzkhobR+N14iEWnIGV1BLNlgUUCgcTsnxPMzSv+ofvF8jOgzSzxpP1or3
 sn8J0BjH0n2KqYvq/U1JwvY1f2RK58/sojvBgw3fze2O8qO0uQoR+o7dA
 AbnJ7jkYznxY4Fdx6cIRsXQK30tOKJ9tJu2lzQ40xO/Mciw99CO7dBQP5
 qfS03AX0vRQSlNQJZ0hzE3xHLliR2uTzGHVQCTvu/GlQKaU/A+NhXA4/l A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="292729279"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="292729279"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 17:48:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="590842399"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="590842399"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 17:48:37 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH] ASoC: Intel: sof_sdw_amp: mark coeff tables with
 __maybe_unused
Date: Fri, 18 Nov 2022 09:51:06 +0800
Message-Id: <20221118015106.532302-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com,
 ranjani.sridharan@linux.intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The same file provides two tables used in separate drivers, make them
as __maybe_unused to avoid errors:

sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h:163:17: error:
‘dell_0b00_bq_params’ defined but not used
[-Werror=unused-const-variable=]
  163 | static const u8 dell_0b00_bq_params[] = {

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h b/sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h
index 82230fbb5b05..4a3e6fdbd623 100644
--- a/sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h
+++ b/sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h
@@ -11,7 +11,7 @@
 #define RT1308_MAX_BQ_REG 480
 #define RT1316_MAX_BQ_REG 580
 
-static const u8 dell_0a5d_bq_params[] = {
+static const u8 __maybe_unused dell_0a5d_bq_params[] = {
 	0xb0, 0xc5, 0x00,  /* address: 0xc5b0; data: 0x00 */
 	0xb1, 0xc5, 0x32,
 	0xb2, 0xc5, 0x44,
@@ -160,7 +160,7 @@ static const u8 dell_0a5d_bq_params[] = {
 	0x50, 0xc5, 0x01,
 };
 
-static const u8 dell_0b00_bq_params[] = {
+static const u8 __maybe_unused dell_0b00_bq_params[] = {
 	0x03, 0xc2, 0x00,
 	0x04, 0xc2, 0xb2,
 	0x05, 0xc2, 0xe0,
-- 
2.25.1

