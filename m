Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F15702586
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:57:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03CC3A4C;
	Mon, 15 May 2023 08:56:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03CC3A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133832;
	bh=gTWQz2QeQjn75D2vv5OELRJszUtDKAo2vigeJ7CoI54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y0lISadfMs4EqamTAioTbMH/CvX79Czc0IMWe5lPlSekcPwQymrLkknoTlekD/e5d
	 /UMNsisTa8ud0LUdJtpofsfCxC1ucOoy/MMLDW+alm8/ZW/wWSkXzFEyHNGki5u9+r
	 rTkt8eejNmmfuQWFrRI1LzRF8P0XI6ePbRPsztiA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74080F80640; Mon, 15 May 2023 08:51:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B0F9F80659;
	Mon, 15 May 2023 08:51:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 570C9F80620; Mon, 15 May 2023 08:51:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9574CF8061D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:51:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9574CF8061D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MTY3pHY6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684133480; x=1715669480;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gTWQz2QeQjn75D2vv5OELRJszUtDKAo2vigeJ7CoI54=;
  b=MTY3pHY6alqd9I9nn3j+cTPxQfnrF+gzwc4jSU+cuvFqTsBYdIEaymYX
   PN0IKXn1/497Wq92uybsLAjk2UoVuIJzrUYgkFf+sgpzDGOBcbqRonJji
   1M0J1Kz4BY+pnuv2rm5g2ubxaZA7YTHn4Ki2rskePcTD+e5YEBcBgBr6w
   sdgNdacaafOQ+rKefG/Fdlq+SAUQW/WSHEumf2jC1d6LpbzbiytTf844a
   gWM9kfHpU7khkS8Z4hKfBkFIHNea/Xo6//mUC2skQUDKdOUiqUaNMgt0t
   VwsJaQVLJrYWt3rToNGlS9A8DxfCEjoZnuTmODtDyszMA0WDE2qDb5lRo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349966567"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="349966567"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:51:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694908797"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="694908797"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:51:15 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	vinod.koul@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 24/26] soundwire: intel: use substream for .trigger
 callback
Date: Mon, 15 May 2023 15:10:40 +0800
Message-Id: <20230515071042.2038-25-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OXJV4OSAK3INWMGUG5EGBWPSLHGZQITC
X-Message-ID-Hash: OXJV4OSAK3INWMGUG5EGBWPSLHGZQITC
X-MailFrom: yung-chuan.liao@linux.intel.com
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OXJV4OSAK3INWMGUG5EGBWPSLHGZQITC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The interface is not needed for IPC3 but will be needed for
ACE2.x+IPC4 combinations, with the substream information passed as a
parameter.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/soundwire/sdw_intel.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index ccb228eebc65..9bd6885ee34d 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -209,7 +209,7 @@ struct sdw_intel_ops {
 			     struct sdw_intel_stream_params_data *params_data);
 	int (*free_stream)(struct device *dev,
 			   struct sdw_intel_stream_free_data *free_data);
-	int (*trigger)(struct snd_soc_dai *dai, int cmd, int stream);
+	int (*trigger)(struct snd_pcm_substream *substream, int cmd, struct snd_soc_dai *dai);
 };
 
 /**
-- 
2.25.1

