Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5CE76A318
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:40:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C480847;
	Mon, 31 Jul 2023 23:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C480847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690839636;
	bh=bx1kbEvqfdBzjp5ne8h2vYYEwMySusNwUEtHoqCIXbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D7Go7FnPPvlh8GGlJ68nDMkHMvJCu5Hqiwuje388XV2dSuwm4Oj5U+C/qPjasJ4VS
	 yA6FwbrFRgU6+h7JWMvYScenN/xQ0Fo9XhaIG+/YN2A3fCK//tAyIh+VpU1S5zDPZ0
	 bbKWV4azWVj8Z9f98AsTrXwyCaavEEoxeyf4l9ko=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AF82F805BE; Mon, 31 Jul 2023 23:38:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF606F805BB;
	Mon, 31 Jul 2023 23:38:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDFF9F8057B; Mon, 31 Jul 2023 23:38:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5908F80544
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:38:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5908F80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Bw1qGuCn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839492; x=1722375492;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bx1kbEvqfdBzjp5ne8h2vYYEwMySusNwUEtHoqCIXbg=;
  b=Bw1qGuCnJVZO9oYYwziOOiejrI4HaNtoJmAWIzJq57eirS+s/Yy1PToi
   /xPzM6tEok+e4Tnu3YBzj6ot2bUYy/OZH5qiqEOQfQw2pc0mu2XV9ziAm
   KGyT3Tiet1jGqtsik7xWGi8vzLHMvYfX6s/586wbUfwcDc1etUZRI5nz+
   hK/Ci/xBeToLfORIOVhnsEnILarUqa/0LbXZ6jCUvdCMUbhiDJHUUR+Y9
   Khy3syUAOCIygqS+mSHWuzinXA+d2S5s2TTR3LoFm/P06lmkckRE4Wjv6
   c7IIKJ3OetaSDmWEr6e8B+swcMCorTa2ybFjEBzRdBKD8go+bbDS6JOrf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="366604112"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="366604112"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:38:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="793880050"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="793880050"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:38:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Yaochun Hung <yc.hung@mediatek.com>
Subject: [PATCH 4/8] ASoC: SOF: imx: remove error checks on NULL ipc
Date: Mon, 31 Jul 2023 16:37:44 -0500
Message-Id: <20230731213748.440285-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731213748.440285-1-pierre-louis.bossart@linux.intel.com>
References: <20230731213748.440285-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AL4KUUL5YRQOAV5YUZISYY57W5GX2V6D
X-Message-ID-Hash: AL4KUUL5YRQOAV5YUZISYY57W5GX2V6D
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

imx_dsp_get_data() can return NULL, but the value is not checked
before being usd, leading to static analysis warnings.

sound/soc/sof/imx/imx8.c:85:32: error: dereference of NULL ‘0’
[CWE-476] [-Werror=analyzer-null-dereference]

   85 |         spin_lock_irqsave(&priv->sdev->ipc_lock, flags);
      |                            ~~~~^~~~~~

It appears this is not really a possible problem, so remove those checks.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
---
 include/linux/firmware/imx/dsp.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/firmware/imx/dsp.h b/include/linux/firmware/imx/dsp.h
index 4f7895a3b73c..1f176a2683fe 100644
--- a/include/linux/firmware/imx/dsp.h
+++ b/include/linux/firmware/imx/dsp.h
@@ -37,17 +37,11 @@ struct imx_dsp_ipc {
 
 static inline void imx_dsp_set_data(struct imx_dsp_ipc *ipc, void *data)
 {
-	if (!ipc)
-		return;
-
 	ipc->private_data = data;
 }
 
 static inline void *imx_dsp_get_data(struct imx_dsp_ipc *ipc)
 {
-	if (!ipc)
-		return NULL;
-
 	return ipc->private_data;
 }
 
-- 
2.39.2

