Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AF745045C
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 13:25:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CA2816B2;
	Mon, 15 Nov 2021 13:24:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CA2816B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636979103;
	bh=PX3Avifj4IoUBOOWyfAtZQ4SBDZpwLER1oCrcOnIQ8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=umLWO3LZ3TA5GSQcFqUbzoxs4G2T4YTMWYyXJQGNKH5SMHsLnkKlLRGORg9j697PH
	 ieK8u0Cddk+2oxQQ6UZcg1ClWOER68p1K/PCLuw0fB9UNsPI154LTsx8PvosH2AdYV
	 IypCXjob5LL3W2TRHCuop3p8c7qEilq6FFM57mzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1CF5F804FA;
	Mon, 15 Nov 2021 13:23:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D20AF804EB; Mon, 15 Nov 2021 13:23:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43D09F8027D
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 13:22:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43D09F8027D
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="220639122"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="220639122"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 04:22:56 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="505899059"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 04:22:54 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [RESEND PATCH 02/10] ASoC: Intel: sof_sdw: fix jack detection on HP
 Spectre x360 convertible
Date: Mon, 15 Nov 2021 20:22:33 +0800
Message-Id: <20211115122241.13242-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211115122241.13242-1-yung-chuan.liao@linux.intel.com>
References: <20211115122241.13242-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
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

Tests on device show the JD2 mode does not work at all, the 'Headphone
Jack' and 'Headset Mic Jack' are shown as 'on' always.

JD1 seems to be the better option, with at least a change between the
two cases.

Jack not plugged-in:
[root@fedora ~]# amixer -Dhw:0 cget numid=12
numid=12,iface=CARD,name='Headphone Jack'
  ; type=BOOLEAN,access=r-------,values=1
  : values=off
[root@fedora ~]# amixer -Dhw:0 cget numid=13
numid=13,iface=CARD,name='Headset Mic Jack'
  ; type=BOOLEAN,access=r-------,values=1
  : values=off

Jack plugged-in:
[root@fedora ~]# amixer -Dhw:0 cget numid=13
numid=13,iface=CARD,name='Headset Mic Jack'
  ; type=BOOLEAN,access=r-------,values=1
  : values=on
[root@fedora ~]# amixer -Dhw:0 cget numid=13
numid=13,iface=CARD,name='Headset Mic Jack'
  ; type=BOOLEAN,access=r-------,values=1
  : values=on

The 'Headset Mic Jack' is updated with a delay which seems normal with
additional calibration needed.

Fixes: d92e279dee56 ('ASoC: Intel: sof_sdw: add quirk for HP Spectre x360 convertible')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 6d59462880fb..c5b1a1621fb5 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -188,7 +188,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
 					SOF_SDW_PCH_DMIC |
-					RT711_JD2),
+					RT711_JD1),
 	},
 	{
 		/* NUC15 'Bishop County' LAPBC510 and LAPBC710 skews */
-- 
2.17.1

