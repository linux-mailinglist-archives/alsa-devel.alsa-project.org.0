Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D5F70256E
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:53:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1562186F;
	Mon, 15 May 2023 08:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1562186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133597;
	bh=xKsOmGgpfRTaoYi/C0Rex9lD4JYFMvLzVqkjtEvqo9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y3yCWR98D+QdblICUPfjUYfccePE2yyD1aFA+ybqNcjW5VigwSU2zw2rMqaZITkQn
	 RDaprWm/Yz55+CCzjDssyxFM/sJm9UWTqO/o3x7ENwo4j27ydxnEwV6ICCX2rNjmB3
	 v4ZIvbMJ0wIQ7v+NhuLF3Pvi6p8xmo2pigsgyE0U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10B6CF805A1; Mon, 15 May 2023 08:50:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03B01F805AF;
	Mon, 15 May 2023 08:50:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64133F8057F; Mon, 15 May 2023 08:50:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA0E9F8055A
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:50:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA0E9F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WnGorUAQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684133441; x=1715669441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xKsOmGgpfRTaoYi/C0Rex9lD4JYFMvLzVqkjtEvqo9k=;
  b=WnGorUAQOVju36hgGrEz99QAHXpIZyFFjnmBQ9XyPuqEc5Sj6c9Z/7Xd
   n0Mghzi6UoWoQ3phv/sKrJAIdJlaBa7igqYXGOuOo+K5oM1h5NLVAXLMO
   5RTtnwCuefVWQyXLKVB0CYiKgtjmx1GeHJ9XsrSV0JUNY/NvIbNQXPZX9
   co6NEHP6jwYNfv1HQ27IgxEuVTm8Ve+ZIWn734301kJMlbcHQD9kDNx63
   CGAOI0R+0oQ4XjmfuK6VMwX5uvss5dHQIUGZmO0C3avR4nJ5VIkDmZGr8
   6uWEmgJOPVnq6lDV8BIwF71Wb8EZwIBZsBneIR/azNQfE75qSZK9e8thv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349966333"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="349966333"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694908641"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="694908641"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:35 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	vinod.koul@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 07/26] soundwire: intel: add eml_lock in the interface for
 new platforms
Date: Mon, 15 May 2023 15:10:23 +0800
Message-Id: <20230515071042.2038-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CXJWIZ6HTJZRM7CO7HYQRMEQ3S7TRV32
X-Message-ID-Hash: CXJWIZ6HTJZRM7CO7HYQRMEQ3S7TRV32
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CXJWIZ6HTJZRM7CO7HYQRMEQ3S7TRV32/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

In existing Intel/SoundWire systems, all the SoundWire configuration
is 'self-contained', with the 'shim_lock' mutex used to protect access
to shared registers in multi-link configurations.

With the move of part of the SoundWire registers to the HDaudio
multi-link structure, we need a unified lock. The hda-mlink
implementation provides an 'eml_lock' that is used to protect shared
registers such as LCTL and LSYNC, we can pass it to the SoundWire
side. There is no issue with possible dangling pointers since the
SoundWire auxiliary devices are children of the PCI device, so the
'eml_lock' cannot be removed while the SoundWire side is in use.

This patch only adds the interface for now.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/soundwire/sdw_intel.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index c4281aa06e2e..bafc6f2554b0 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -327,6 +327,8 @@ struct sdw_intel_ctx {
  * @alh_base: sdw alh base.
  * @ext: extended HDaudio link support
  * @hbus: hdac_bus pointer, needed for power management
+ * @eml_lock: mutex protecting shared registers in the HDaudio multi-link
+ * space
  */
 struct sdw_intel_res {
 	const struct sdw_intel_hw_ops *hw_ops;
@@ -343,6 +345,7 @@ struct sdw_intel_res {
 	u32 alh_base;
 	bool ext;
 	struct hdac_bus *hbus;
+	struct mutex *eml_lock;
 };
 
 /*
-- 
2.25.1

