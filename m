Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9CA70258C
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:57:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 637E5E88;
	Mon, 15 May 2023 08:57:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 637E5E88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133872;
	bh=QYZAt1KxA3N+7/ATQML8jtFQmvmyxEPDPbTILteD9jY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U5VMuWs6QEmbFNRSutcvNCZMa18akz00lTdfXfFHn6AdSGEMNRI5Mn3hp1ACouuZ8
	 Jbn0z81OgwYdQfALAEAKRyLt8orq2vddZrefNfRGHkR/xKpfwBP50itJWehMFdlvrI
	 J1Ie2kt1br736cEXgBTo3LDvNDK35/p0p99ic/Js=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7625EF80683; Mon, 15 May 2023 08:51:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38E51F8067F;
	Mon, 15 May 2023 08:51:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFF5BF8061E; Mon, 15 May 2023 08:51:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 463E3F80614
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:51:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 463E3F80614
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VvceZB4y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684133484; x=1715669484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QYZAt1KxA3N+7/ATQML8jtFQmvmyxEPDPbTILteD9jY=;
  b=VvceZB4y+SrmMXuIZYD8FGWGdm947sB8QCK4Kqag7MS3zXYbCml40UGq
   8RylNqzIqIGNeTz5ttc1G6gD8S0gfvrOGx4Fd5CyWL8DFxtH6B6JSqYzG
   fcl4by4MWW2A1ikz95tamx1pnWdIqnzVd3VS93ByUubJ2Tm9qJzCoZUx8
   LqRaaShwUj8FuzlqgYcljWd6YtZkevuMhU4Be/eZMNI9evw56Gg++culB
   nzRFffma9jL02xVTJFFXxeNj0AObNJpnKQ/21ZAa7x6xgvQGI5IH5lCHp
   DPobh+NGrwpQE0ChQY5lC+MrBHfUrqv/1Vj0mAYbeiAy69SM1ZI7r4Sxr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349966588"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="349966588"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:51:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694908807"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="694908807"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:51:20 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	vinod.koul@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 26/26] soundwire: intel: use substream for .free callback
Date: Mon, 15 May 2023 15:10:42 +0800
Message-Id: <20230515071042.2038-27-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NHFCEJQKMCFGXLUGCLGCA3NW5GZIANBQ
X-Message-ID-Hash: NHFCEJQKMCFGXLUGCLGCA3NW5GZIANBQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NHFCEJQKMCFGXLUGCLGCA3NW5GZIANBQ/>
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
index 9bd6885ee34d..11fc88fb0d78 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -195,7 +195,7 @@ struct sdw_intel_stream_params_data {
  * firmware.
  */
 struct sdw_intel_stream_free_data {
-	int stream;
+	struct snd_pcm_substream *substream;
 	struct snd_soc_dai *dai;
 	int link_id;
 };
-- 
2.25.1

