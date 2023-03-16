Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4490C6BD313
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 16:14:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CB1710EA;
	Thu, 16 Mar 2023 16:13:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CB1710EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678979647;
	bh=+fELAHHCGHtwjSg9PKfN0tR420GUCCvMSdInmuqq9Fg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BPCmQGLAPui8HDKe81MgwOqX8KN2JBweKly+wtv9Gm7c0rVyZYdmFhWK2UD34hY+i
	 AXkPAm/vOg1U82ILOFZYdpw4U6Y3+eSGbgVxkTT6iwn9nHXemUQqVt+DA6SHOveKlV
	 IQe06daD6VPVV7iuHD9wS0rCsSPARX8t8c2CJ1cY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40E98F804B1;
	Thu, 16 Mar 2023 16:12:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C28D4F80558; Thu, 16 Mar 2023 16:11:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A90BAF8032D
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 16:11:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A90BAF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AqRMS1i/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678979498; x=1710515498;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+fELAHHCGHtwjSg9PKfN0tR420GUCCvMSdInmuqq9Fg=;
  b=AqRMS1i/ra+iSpHiiDFHCl/pyDJKBOvhbZrHYiEd4N/i1PWqIODfknm0
   o6L0qjUd/Rx5uG54EPt7MtpkFdup1MO9NtkCKm79+1GNUNVGNATrf9Ecm
   ygipopjAiCaevDTnvz6pKkVhQEuTTNpSdSsTW2J78ZvBlh/OZCivvC5LN
   JY6heH606obY6l7dZyFVANK6IP/xliOVlVwbb+AmCF+b/nOYgEmwrcK3E
   sQMtXQZtzHa/Pzps03sJKcFyV1kmyq0zbZ8HAGW+kkO6lg55MxCrecRFt
   GXeYMPbCD8jW+XtY55+1XY53Ys7TTqr5gevXA63NGe0PefT+amdzi38ZF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="335501626"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="335501626"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 08:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="823286505"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="823286505"
Received: from raberjix-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.62.186])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 08:11:21 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 3/6] ASoC: SOF: ipc4-topology: add base module config
 extension structure
Date: Thu, 16 Mar 2023 17:11:34 +0200
Message-Id: <20230316151137.7598-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316151137.7598-1-peter.ujfalusi@linux.intel.com>
References: <20230316151137.7598-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EK7ARYFYAUFTVLAUEQNFOBFGIL3AAHS7
X-Message-ID-Hash: EK7ARYFYAUFTVLAUEQNFOBFGIL3AAHS7
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 libin.yang@intel.com, yung-chuan.liao@linux.intel.com,
 chao.song@linux.intel.com, jaska.uimonen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EK7ARYFYAUFTVLAUEQNFOBFGIL3AAHS7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chao Song <chao.song@linux.intel.com>

The modules currently supported by the SOF firmware use the base module
config containing the audio format for the input/output pin 0 for
initialization. But some processing modules with multiple input/output
pins require the audio formats to be sent with the init instance IPC
payload. Modules that require the base config extension will need to
indicate this in the module information in the firmware manifest.

Introduce a new struct sof_ipc4_base_module_cfg_ext which contains the
pin formats for the input and output pins. This will be appended to the
init instance IPC payload for modules that require it.

Signed-off-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 9fcb978ebc63..97264454b8a6 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -347,6 +347,23 @@ struct sof_ipc4_src {
 	struct sof_ipc4_msg msg;
 };
 
+/**
+ * struct sof_ipc4_base_module_cfg_ext - base module config extension containing the pin format
+ * information for the module. Both @num_input_pin_fmts and @num_output_pin_fmts cannot be 0 for a
+ * module.
+ * @num_input_pin_fmts: number of input pin formats in the @pin_formats array
+ * @num_output_pin_fmts: number of output pin formats in the @pin_formats array
+ * @reserved: reserved for future use
+ * @pin_formats: flexible array consisting of @num_input_pin_fmts input pin format items followed
+ *		 by @num_output_pin_fmts output pin format items
+ */
+struct sof_ipc4_base_module_cfg_ext {
+	u16 num_input_pin_fmts;
+	u16 num_output_pin_fmts;
+	u8 reserved[12];
+	DECLARE_FLEX_ARRAY(struct sof_ipc4_pin_format, pin_formats);
+} __packed;
+
 /**
  * struct sof_ipc4_process - process config data
  * @base_config: IPC base config data
-- 
2.39.2

