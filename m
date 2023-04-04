Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCD06D5DCE
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 12:44:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35FEB823;
	Tue,  4 Apr 2023 12:43:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35FEB823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680605088;
	bh=SykE5hJkyCtqIic/2CQZpba3reEweIvhM+vOAN0qWvM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z6wUHNidCdiYc2ogERkCH3TfAY/S6nIPFw5m5s35mV6IcKKUg++HZVAleNBtYnl/j
	 //UPW6kz/R/FapM5zVLoG0s+cPP7QnC0/Ey0kWUL04GK3f9NY66QwW8saY+3dyuJtM
	 3eXiM7msiWYe9Rotj3Vamn82Fiprh7LCM17B5uuQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B56FF805AA;
	Tue,  4 Apr 2023 12:41:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A785F80580; Tue,  4 Apr 2023 12:41:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4657F80579
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:41:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4657F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SFZPflAe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680604887; x=1712140887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SykE5hJkyCtqIic/2CQZpba3reEweIvhM+vOAN0qWvM=;
  b=SFZPflAeAA6ox7EZsEzw/1sqPLVgPQ8BK6mjUN3SLmBsbM0c4O8mR5z3
   bRabmixB660N+xdA9d29CPUTeErDgu5zZ2EjSWt1sHTwKG3rRbodUVrbb
   YJLJRzU9EHZBbuxWv+ELBMU4dY6cl9Km220Of+g9jujPqfZ/rW+vX5neK
   E97cGjkjYRdkodVOHOnPpEyQKbMGN0lAQVGGR60ykJbqKb9mNYW9UMm/p
   qXLeZsXhFcoLMZUTPZU2dU6R++wqcJOAiTDdsH4J0MYVy27v2YaPej3Xh
   yFx2XTG4wiCJorCgNT/rLAUz3Pny1H9HARMemgxxZSZhkuu4xJnCeLoKp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340878032"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="340878032"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829930171"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="829930171"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:21 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH v2 10/18] ASoC: SOF: Intel: hda-mlink: add helper to return
 sublink count
Date: Tue,  4 Apr 2023 13:41:19 +0300
Message-Id: <20230404104127.5629-11-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
References: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 65JA336YI73HUNOBVUD2CPQG2SOBV2YK
X-Message-ID-Hash: 65JA336YI73HUNOBVUD2CPQG2SOBV2YK
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, amadeuszx.slawinski@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/65JA336YI73HUNOBVUD2CPQG2SOBV2YK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

This is needed for SoundWire integration.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hda-mlink.h       |  5 +++++
 sound/soc/sof/intel/hda-mlink.c | 12 ++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index c47008a603d0..d7f65cb6e175 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -13,6 +13,8 @@ struct hdac_bus;
 int hda_bus_ml_init(struct hdac_bus *bus);
 void hda_bus_ml_free(struct hdac_bus *bus);
 
+int hdac_bus_eml_get_count(struct hdac_bus *bus, bool alt, int elid);
+
 int hdac_bus_eml_power_up(struct hdac_bus *bus, bool alt, int elid, int sublink);
 int hdac_bus_eml_power_up_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink);
 
@@ -34,6 +36,9 @@ hda_bus_ml_init(struct hdac_bus *bus) { return 0; }
 
 static inline void hda_bus_ml_free(struct hdac_bus *bus) { }
 
+static inline int
+hdac_bus_eml_get_count(struct hdac_bus *bus, bool alt, int elid) { return 0; }
+
 static inline int
 hdac_bus_eml_power_up(struct hdac_bus *bus, bool alt, int elid, int sublink)
 {
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 5045c10bed76..02743c342f28 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -328,6 +328,18 @@ find_ext2_link(struct hdac_bus *bus, bool alt, int elid)
 	return NULL;
 }
 
+int hdac_bus_eml_get_count(struct hdac_bus *bus, bool alt, int elid)
+{
+	struct hdac_ext2_link *h2link;
+
+	h2link = find_ext2_link(bus, alt, elid);
+	if (!h2link)
+		return 0;
+
+	return h2link->slcount;
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_get_count, SND_SOC_SOF_HDA_MLINK);
+
 static int hdac_bus_eml_power_up_base(struct hdac_bus *bus, bool alt, int elid, int sublink,
 				      bool eml_lock)
 {
-- 
2.40.0

