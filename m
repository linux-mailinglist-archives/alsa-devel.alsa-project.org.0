Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1AB6C5F10
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 06:38:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9D67EF1;
	Thu, 23 Mar 2023 06:38:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9D67EF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679549935;
	bh=xKsOmGgpfRTaoYi/C0Rex9lD4JYFMvLzVqkjtEvqo9k=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P4JFryldFZmVcD2LXrScvOfNM8TEeY+l5JIVHJG1u6tmxDAlA3GjprgnkQ/nHV29X
	 XnQj3B7Sp7gdWHiSYYkuuRfiDpQyV5NCgS0erEELjey79rbit4WMV6W9lKmESWSGPG
	 qDpzmtmdDXVAS/IejfD7FB9y0o2FAR2VgxQ1Y22Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB65FF805C2;
	Thu, 23 Mar 2023 06:33:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ED1CF8027B; Thu, 23 Mar 2023 06:33:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 611CCF8051B
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 06:30:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 611CCF8051B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bpAdcGkD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549422; x=1711085422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xKsOmGgpfRTaoYi/C0Rex9lD4JYFMvLzVqkjtEvqo9k=;
  b=bpAdcGkDoPQmwXsfJ3oBlQK4ax3zPyA3zIQSRDTrGEiJDoR+M4gWvGV1
   ftEaFrW2kJ2ld8B0Mnrt8b6LeYUJkNAYrFiW6Jba9bqlouzaqXvbEmbPJ
   8yVqnQATYW0v3VZP1YOlV2Ftpeje9P3Z0w42KhgN4obEmcWhGP5WLMJaM
   6n97jg0f/ykGgp9N3zZm0AVmHf67RATWKqK70dyi16C5xgemg2Pr1UtB+
   YH0QZ1tu6c5tZeEfunwtA20JAAsrDNzRqZr7q14KrLjMfLiaG0R7RYOU/
   /Ky9Z0BIHTcEoJ1+CxxkTcVW+3vCWf6cSHWOEAF7LGfKepu9WlpMNW/xO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327779353"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="327779353"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675567039"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675567039"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:05 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH 07/20] soundwire: intel: add eml_lock in the interface for new
 platforms
Date: Thu, 23 Mar 2023 13:44:39 +0800
Message-Id: <20230323054452.1543233-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C67ENKQLBD5YWU4CEZED7QVL72Z7SUF7
X-Message-ID-Hash: C67ENKQLBD5YWU4CEZED7QVL72Z7SUF7
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com, tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C67ENKQLBD5YWU4CEZED7QVL72Z7SUF7/>
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

