Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CEB43BF84
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 04:20:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ED9216D6;
	Wed, 27 Oct 2021 04:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ED9216D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635301212;
	bh=/csl+dGX+BaU8goQFBljMLQTm8tdq91B4gdyIuAsGhE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n0g5ROM6bbP9+C16xcQaD17xVj5sKIrCpCAV05T0ImOEiBfXMPFMkgAG53eX3oj6H
	 DWpNTyWP+nZ8l86CeDCnfmeVL1Du4d/fY5CfhfCrk4ZmE5WkGeRstC6rPu2jE91UNO
	 cxkxKoEg0kiGZXemBbJEbQJe5KGVGSrBqgCfL66g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFAFCF8010A;
	Wed, 27 Oct 2021 04:18:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D529F804D0; Wed, 27 Oct 2021 04:18:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EE40F8025A
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 04:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EE40F8025A
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="217229390"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="217229390"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 19:18:41 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="486446269"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 19:18:39 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 02/10] ASoC: Intel: sof_sdw: fix jack detection on HP Spectre
 x360 convertible
Date: Wed, 27 Oct 2021 10:18:16 +0800
Message-Id: <20211027021824.24776-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211027021824.24776-1-yung-chuan.liao@linux.intel.com>
References: <20211027021824.24776-1-yung-chuan.liao@linux.intel.com>
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
index a1fb41136cf0..523de5bfef60 100644
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

