Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 429C76B7548
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 12:06:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FA49148A;
	Mon, 13 Mar 2023 12:05:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FA49148A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678705593;
	bh=bkq+lrnPgjsrsvyK8LjDa6V+RVlK8SrqcbfYJgpi7aA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bRmBQi7ihSUe+ulcGiD9C2Ix1GEhU2azYf7t7WIQQZFL5eRWbypT03bX+K/C7wrM4
	 f62z/kFhunMDPx2+0hs1rf9DpT9Z0bXNsgEakKrQNGO0dv6gVfg2U/EBMWAEfWKaRr
	 GnWvVfBTyloP5wvQD7io2KtguXBjXVXc9uy9j+hk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A289F8051B;
	Mon, 13 Mar 2023 12:04:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00CCCF8051B; Mon, 13 Mar 2023 12:04:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B48A4F804B1
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 12:03:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B48A4F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YBKKnBjX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678705419; x=1710241419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bkq+lrnPgjsrsvyK8LjDa6V+RVlK8SrqcbfYJgpi7aA=;
  b=YBKKnBjXLBD284oxlJhepieQ1hrkDHyouM7C2uSj6S/mfQjWgL+pEYu7
   zq0LD+KS2qrmbHU4j7cXmMohW+KUpEl5j+TrlMAFgMl9sV9uBiCyo41M6
   7XCFH8rF5uGDHqi1KPyzNb9k/IFs5naNxceVWnP4EhuyBOPuu3nEk05vE
   1IQH/IXmes7uLCKKE4qsFJA+NnOMJeAO5zD5id2MhgJpbHttA/be4e1/w
   zHMo9nvmSLDI1NYODA3KHv99wHXUndNlIletJPdKnthGLk3W09kUUV4tC
   7aLjXAFHtH/l3abwiVRfF+PA3dEtmP1+wrdzZHd7iIuTyVpP/WTm7tQM8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="423384143"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="423384143"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 04:03:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="655939091"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="655939091"
Received: from tchambon-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.68])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 04:03:34 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 5/7] ASoC: SOF: ipc4-control: set_volume_data only applies to
 VOLSW family
Date: Mon, 13 Mar 2023 13:03:42 +0200
Message-Id: <20230313110344.16644-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313110344.16644-1-peter.ujfalusi@linux.intel.com>
References: <20230313110344.16644-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6KWBHWXXKD3RWC3XK3TJGM4TPRFRMYEC
X-Message-ID-Hash: 6KWBHWXXKD3RWC3XK3TJGM4TPRFRMYEC
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, libin.yang@intel.com,
 jaska.uimonen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6KWBHWXXKD3RWC3XK3TJGM4TPRFRMYEC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Libin Yang <libin.yang@intel.com>

Make sure sof_ipc4_set_volume_data() is only called for the
SND_SOC_TPLG_CTL_VOLSW, SND_SOC_TPLG_CTL_VOLSW_SX and
SND_SOC_TPLG_CTL_VOLSW_XR_SX info_type.

Signed-off-by: Libin Yang <libin.yang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-control.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 9a71af1a613a..56d42f2eb6e2 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -187,15 +187,25 @@ static int sof_ipc4_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_s
 	struct snd_sof_control *scontrol;
 	int ret;
 
-	list_for_each_entry(scontrol, &sdev->kcontrol_list, list)
+	list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
 		if (scontrol->comp_id == swidget->comp_id) {
-			ret = sof_ipc4_set_volume_data(sdev, swidget, scontrol, false);
-			if (ret < 0) {
-				dev_err(sdev->dev, "%s: kcontrol %d set up failed for widget %s\n",
-					__func__, scontrol->comp_id, swidget->widget->name);
-				return ret;
+			switch (scontrol->info_type) {
+			case SND_SOC_TPLG_CTL_VOLSW:
+			case SND_SOC_TPLG_CTL_VOLSW_SX:
+			case SND_SOC_TPLG_CTL_VOLSW_XR_SX:
+				ret = sof_ipc4_set_volume_data(sdev, swidget,
+							       scontrol, false);
+				if (ret < 0) {
+					dev_err(sdev->dev, "kcontrol %d set up failed for widget %s\n",
+						scontrol->comp_id, swidget->widget->name);
+					return ret;
+				}
+				break;
+			default:
+				break;
 			}
 		}
+	}
 
 	return 0;
 }
-- 
2.39.2

