Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C38F605FF8
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 14:17:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31FBE5159;
	Thu, 20 Oct 2022 14:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31FBE5159
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666268225;
	bh=QNH8a8r4SxVmmgOUid9I85Z3mjsjzL6jFmY/dvEdhvY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OwbrtjgrNSaFQKTvWOlR2X+cYsDpfQ9e6QOi7Hbd83m/KzwoWgXNMRYxZ/nZHuJ8L
	 c1LgOUgcLkdbQWgGBKvKD2sU2kSt89rCUkgVdIGOcfudbbNyRzKb3dcI2N8mp/WchC
	 50Hoc1emU/RgUsTCV1Cyf94ATRJYj2orQFtIQSu0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2D52F805C2;
	Thu, 20 Oct 2022 14:13:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4935F805C6; Thu, 20 Oct 2022 14:13:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51123F805BA
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 14:12:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51123F805BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hcl0h5J2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666267975; x=1697803975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QNH8a8r4SxVmmgOUid9I85Z3mjsjzL6jFmY/dvEdhvY=;
 b=hcl0h5J2+2d+BeHWB9pAdDNLjuM1pbsRRhRMhv2W67FBxhGLUdEWdS38
 +V4+FZzeJWfjsmJbTgwTZQ7fs2ARdtB5s2HIZyQenwdBAVQs5B9VHD7Ke
 s2y8oaFzJo/dHwBLJiU/ki7uLiYc4K/yjWx5qm/+TK8W7a8Hf0YBaiqwQ
 S2GcacP0qGhW83T1icNOwRko9vB9GnKHyRqjHYR1XTemYiP0UlQ3kUnZV
 pfDE6MUCME4RiL/92lH4lGg05SP3F5captvj0sMcvaGWxLWYP/IQXm6bA
 wgc5B6732mRlyTP4myiRTTSijJgcU7aK29CvtkojW7knKkAvsrDN8rJ+D A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333256395"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="333256395"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:53 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="663010092"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="663010092"
Received: from awrynn-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.12.86])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:50 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 13/19] ASoC: SOF: ipc4: Define platform dependent library
 loading callback
Date: Thu, 20 Oct 2022 15:12:32 +0300
Message-Id: <20221020121238.18339-14-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
References: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 chao.song@intel.com
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

Platforms where external libraries can be supported should set the
load_library callback to implement this functionality.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc4-priv.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index ecfa9f701ef1..7e7115ada2a2 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -66,6 +66,8 @@ struct sof_ipc4_fw_library {
  * @mtrace_log_bytes: log bytes as reported by the firmware via fw_config reply
  * @max_libs_count: Maximum number of libraries support by the FW including the
  *		    base firmware
+ *
+ * @load_library: Callback function for platform dependent library loading
  */
 struct sof_ipc4_fw_data {
 	u32 manifest_fw_hdr_offset;
@@ -74,6 +76,9 @@ struct sof_ipc4_fw_data {
 	enum sof_ipc4_mtrace_type mtrace_type;
 	u32 mtrace_log_bytes;
 	u32 max_libs_count;
+
+	int (*load_library)(struct snd_sof_dev *sdev,
+			    struct sof_ipc4_fw_library *fw_lib, bool reload);
 };
 
 extern const struct sof_ipc_fw_loader_ops ipc4_loader_ops;
-- 
2.38.1

