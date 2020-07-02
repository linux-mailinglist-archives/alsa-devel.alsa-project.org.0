Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E14212D38
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:40:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C49516CC;
	Thu,  2 Jul 2020 21:39:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C49516CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593718835;
	bh=44m2vXYLXy0/6rzvsuyvFzpsgWEdxJbvQoFw8GdiVlw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b1i4vVrQjG3vz5CWds0aoB6RtzFvcGnE/zZajmpdEFjrD962X416I2YVMfUoY/Dgy
	 n8mXZQoDZX6hLgShHsg1upxHukqAuIi/xmQ8Mv7i0cPypQElQoBV3P4X5Et6IzjTLP
	 YZhcvm3e5MuAW4Pcx6SEobsun7UfPs0Lkus46T8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46584F8028F;
	Thu,  2 Jul 2020 21:36:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3623DF802C4; Thu,  2 Jul 2020 21:36:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B218AF80252
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B218AF80252
IronPort-SDR: JCSggRkTDUuLhrtxNzr1H0Id++Akm/lk14MynoaOvGIs1Ij4nNGO3e9PqQRn7jO824jaDO+u9s
 M4yHb83tpjkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="148549343"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="148549343"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:19 -0700
IronPort-SDR: CJ1x1OiSQVuP9HTSw9YU4/fpAjCWuptRhPMUmKsA8BXuVaqLabIxU3FKbDvsomRlZ96nOOBEFf
 o5F4m0Q5NA7A==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="482116360"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 03/23] ALSA: pci/asihpi: remove 'set but not used' warnings
Date: Thu,  2 Jul 2020 14:35:44 -0500
Message-Id: <20200702193604.169059-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
References: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warnings by removing 2 unnecessary initializations and
removing a variable that's not used.

sound/pci/asihpi/asihpi.c: In function ‘snd_asihpi_tuner_band_get’:
sound/pci/asihpi/asihpi.c:1907:6: warning: variable ‘num_bands’ set
but not used [-Wunused-but-set-variable]
 1907 |  u32 num_bands = 0;
      |      ^~~~~~~~~
sound/pci/asihpi/asihpi.c: In function ‘snd_asihpi_tuner_band_put’:
sound/pci/asihpi/asihpi.c:1934:6: warning: variable ‘num_bands’ set
 but not used [-Wunused-but-set-variable]
 1934 |  u32 num_bands = 0;
      |      ^~~~~~~~~
sound/pci/asihpi/asihpi.c: In function ‘snd_asihpi_mux_info’:
sound/pci/asihpi/asihpi.c:2164:6: warning: variable ‘err’ set but not
 used [-Wunused-but-set-variable]
 2164 |  int err;
      |      ^~~

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/asihpi/asihpi.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index a9540c2c4a1a..faa879f175a9 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -1904,7 +1904,7 @@ static int snd_asihpi_tuner_band_get(struct snd_kcontrol *kcontrol,
 	*/
 	u16 band, idx;
 	u16 tuner_bands[HPI_TUNER_BAND_LAST];
-	u32 num_bands = 0;
+	u32 num_bands;
 
 	num_bands = asihpi_tuner_band_query(kcontrol, tuner_bands,
 				HPI_TUNER_BAND_LAST);
@@ -1931,7 +1931,7 @@ static int snd_asihpi_tuner_band_put(struct snd_kcontrol *kcontrol,
 	unsigned int idx;
 	u16 band;
 	u16 tuner_bands[HPI_TUNER_BAND_LAST];
-	u32 num_bands = 0;
+	u32 num_bands;
 
 	num_bands = asihpi_tuner_band_query(kcontrol, tuner_bands,
 			HPI_TUNER_BAND_LAST);
@@ -2161,7 +2161,6 @@ static int snd_card_asihpi_mux_count_sources(struct snd_kcontrol *snd_control)
 static int snd_asihpi_mux_info(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_info *uinfo)
 {
-	int err;
 	u16 src_node_type, src_node_index;
 	u32 h_control = kcontrol->private_value;
 
@@ -2174,10 +2173,9 @@ static int snd_asihpi_mux_info(struct snd_kcontrol *kcontrol,
 		uinfo->value.enumerated.item =
 		    uinfo->value.enumerated.items - 1;
 
-	err =
-	    hpi_multiplexer_query_source(h_control,
-					uinfo->value.enumerated.item,
-					&src_node_type, &src_node_index);
+	hpi_multiplexer_query_source(h_control,
+				     uinfo->value.enumerated.item,
+				     &src_node_type, &src_node_index);
 
 	sprintf(uinfo->value.enumerated.name, "%s %d",
 		asihpi_src_names[src_node_type - HPI_SOURCENODE_NONE],
-- 
2.25.1

