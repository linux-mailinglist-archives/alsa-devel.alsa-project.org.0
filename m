Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD4B604D48
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 18:24:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E86F6AE7F;
	Wed, 19 Oct 2022 18:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E86F6AE7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666196682;
	bh=RFj5l15qju6dtZdadoRkd50rXifIxJ4DQUDnxmQcciw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EwEjdnIB6FJt2trmd5rApuT6apmzJBxweZPsrboxg4CfWEdW9EHyBrBQdSMZxTF5E
	 g/Fi2Ud+o8AhJ1hZNJ6ZJgxfybdviEKFjG+7W/D7oo7kSCyh6WMzg9Y9k6tUEb56Py
	 WpCVgIaxhO4eQ/DcsNGd7HyXmwZTneRjdoDn3Axo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B888EF80528;
	Wed, 19 Oct 2022 18:23:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19951F804E0; Wed, 19 Oct 2022 18:23:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC7C2F80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 18:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC7C2F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GH2DMyVH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666196627; x=1697732627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RFj5l15qju6dtZdadoRkd50rXifIxJ4DQUDnxmQcciw=;
 b=GH2DMyVHDL/RqgxXelo8NQgthfwbyWGQZ9XQjfpSETOKr2Zu/a/XceHh
 Nj3k/uIZOhU757oTYYgXIggpVZCNoMETImuurFhleBtBEOpg51wXeBx2V
 8SWBjQ68tl8jIRhjeR/PlY6hx3mUwYLZYtAVCd+3XHeeZdExhTOT+r+b6
 Fjvc5Vghi3Ezpe64UsLeOATCsfAjsTYP88yeT1YVC2kF2W0qMPA2xazwa
 f/TsLDeuCwpsY0pNreJLQt6jUB397cZBCO4NCPBMTWqMy8LXJVqMOfbjk
 8Ef8CJ1p/H0v9DdDkWAbEspNjyWyxXa5r5mSOhwK5gENi1RgHrjPLdBy0 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="286856213"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="286856213"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:21:25 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="698153813"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="698153813"
Received: from afsinurr-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.16.185])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:21:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/10] ALSA: hda: ext: hdac_ext_controller: use helpers in loop
Date: Wed, 19 Oct 2022 11:21:06 -0500
Message-Id: <20221019162115.185917-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
References: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

No need to copy/paste code, use helper instead.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/hda/ext/hdac_ext_controller.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/hda/ext/hdac_ext_controller.c b/sound/hda/ext/hdac_ext_controller.c
index 80876b9a87f46..f521d286a3942 100644
--- a/sound/hda/ext/hdac_ext_controller.c
+++ b/sound/hda/ext/hdac_ext_controller.c
@@ -225,9 +225,7 @@ int snd_hdac_ext_bus_link_power_up_all(struct hdac_bus *bus)
 	int ret;
 
 	list_for_each_entry(hlink, &bus->hlink_list, list) {
-		snd_hdac_updatel(hlink->ml_addr, AZX_REG_ML_LCTL,
-				 AZX_ML_LCTL_SPA, AZX_ML_LCTL_SPA);
-		ret = check_hdac_link_power_active(hlink, true);
+		ret = snd_hdac_ext_bus_link_power_up(hlink);
 		if (ret < 0)
 			return ret;
 	}
@@ -246,9 +244,7 @@ int snd_hdac_ext_bus_link_power_down_all(struct hdac_bus *bus)
 	int ret;
 
 	list_for_each_entry(hlink, &bus->hlink_list, list) {
-		snd_hdac_updatel(hlink->ml_addr, AZX_REG_ML_LCTL,
-				 AZX_ML_LCTL_SPA, 0);
-		ret = check_hdac_link_power_active(hlink, false);
+		ret = snd_hdac_ext_bus_link_power_down(hlink);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.34.1

