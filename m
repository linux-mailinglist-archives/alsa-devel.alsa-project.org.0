Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB4B6CA28E
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 13:35:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98AE083E;
	Mon, 27 Mar 2023 13:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98AE083E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679916916;
	bh=ZIEP5CRoaKIa0l7ZntREwWxZ0YyOESYOFVxpwRM7eHM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aJ3xcYp3oF/vT2H6SQrvhSdkda6UBok0VF69dQNcHNWLloxFWe0iRpZv8BQAt7QS7
	 ZXSBqQuLCQgpVCBMeOXi5ihIrvhKMZbAiuZ0JBEOfi9P6ydoAUOmNhUJsx6HtGaI/J
	 aYfDVsVlxTNS/03WrvOuY+uCEjoRsv4nVNtJ2LGE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FCCEF80551;
	Mon, 27 Mar 2023 13:32:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10060F80272; Mon, 27 Mar 2023 13:32:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DAF69F80249
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 13:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAF69F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JJjmOsfF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679916565; x=1711452565;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZIEP5CRoaKIa0l7ZntREwWxZ0YyOESYOFVxpwRM7eHM=;
  b=JJjmOsfF4WgxFcuhxfl0ryEb8sAyiZvHscNkulooP2X+P/GKhbWIv5Fs
   li+FSNGtNP3dOt2fbOtviKck59oZHryP3SS0vx5yVR2dptagYFVWGcpNy
   9y+3KccL3j2wfxepjFC5G10shN2D2/Vd3PMdnNb2dnDQrbWqr397HcdyH
   KQzl46K7wF0FHYG2eSZuknWvqfjL/rAIaKRj2FDSVBpTWNzvoDaLpuskg
   lwlRUTo4Q+NvQNauWpkJSdHqpmxq1FH+FxjhDNG/+3nVDJ4hHb5svcMuV
   Y8TtZqvv+WcHZrIX2n90Zi4cDfB8V5LgLaYAOYwoZrwCEnIA00opGdoYD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="367986956"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="367986956"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="857620433"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="857620433"
Received: from asebenix-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.223.110])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:19 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 07/18] ASoC: SOF: Intel: hda-mlink: special-case HDaudio
 regular links
Date: Mon, 27 Mar 2023 14:29:20 +0300
Message-Id: <20230327112931.23411-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JDZVH3HL6PV77KQXHI27UWB7TVQ6GYYY
X-Message-ID-Hash: JDZVH3HL6PV77KQXHI27UWB7TVQ6GYYY
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDZVH3HL6PV77KQXHI27UWB7TVQ6GYYY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

For backwards compatibility, HDaudio/iDISP links are powered-on when
exiting reset, and the existing driver forces them to be powered-off
when entering S0ix. In addition, the get/put helpers are invoked
directly by the ASoC codec drivers, which a historical layering
violation.

Extended links are powered-on by software only, during the probe and
DAI startup phases. This calls for a different handling of the
'regular' and 'extended' audio links.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-mlink.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index cc944311a671..90b68ae2564c 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -255,8 +255,12 @@ void hda_bus_ml_put_all(struct hdac_bus *bus)
 {
 	struct hdac_ext_link *hlink;
 
-	list_for_each_entry(hlink, &bus->hlink_list, list)
-		snd_hdac_ext_bus_link_put(bus, hlink);
+	list_for_each_entry(hlink, &bus->hlink_list, list) {
+		struct hdac_ext2_link *h2link = hdac_ext_link_to_ext2(hlink);
+
+		if (!h2link->alt)
+			snd_hdac_ext_bus_link_put(bus, hlink);
+	}
 }
 EXPORT_SYMBOL_NS(hda_bus_ml_put_all, SND_SOC_SOF_HDA_MLINK);
 
@@ -277,7 +281,9 @@ int hda_bus_ml_resume(struct hdac_bus *bus)
 
 	/* power up links that were active before suspend */
 	list_for_each_entry(hlink, &bus->hlink_list, list) {
-		if (hlink->ref_count) {
+		struct hdac_ext2_link *h2link = hdac_ext_link_to_ext2(hlink);
+
+		if (!h2link->alt && hlink->ref_count) {
 			ret = snd_hdac_ext_bus_link_power_up(hlink);
 			if (ret < 0)
 				return ret;
@@ -289,7 +295,19 @@ EXPORT_SYMBOL_NS(hda_bus_ml_resume, SND_SOC_SOF_HDA_MLINK);
 
 int hda_bus_ml_suspend(struct hdac_bus *bus)
 {
-	return snd_hdac_ext_bus_link_power_down_all(bus);
+	struct hdac_ext_link *hlink;
+	int ret;
+
+	list_for_each_entry(hlink, &bus->hlink_list, list) {
+		struct hdac_ext2_link *h2link = hdac_ext_link_to_ext2(hlink);
+
+		if (!h2link->alt) {
+			ret = snd_hdac_ext_bus_link_power_down(hlink);
+			if (ret < 0)
+				return ret;
+		}
+	}
+	return 0;
 }
 EXPORT_SYMBOL_NS(hda_bus_ml_suspend, SND_SOC_SOF_HDA_MLINK);
 
-- 
2.40.0

