Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9F7732CAB
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 12:03:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41B64843;
	Fri, 16 Jun 2023 12:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41B64843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686909795;
	bh=lIJV9WJVsC1i11gMTvTAxOJ8VEod0bdEOZLVzE3/D6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eqEa9uT65VZdFlHHMIAV2ALcUmlaTmXdhBCgaVgbdGRkKVKtX9mBtxntvjA8r1Qdh
	 YHsj5wiVb6+op5N78H/m+JAt+UnvO2LaQqGwtAAaCnY38xbek19nmB9pex7i/6JZJp
	 wdqyeWOcNKDAadC2vh46mZ4ByPjjzeQNxQKIN73A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6705F8057E; Fri, 16 Jun 2023 12:01:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0533F80578;
	Fri, 16 Jun 2023 12:01:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FA93F80578; Fri, 16 Jun 2023 12:01:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FE15F80130
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 12:01:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FE15F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WzqXp/4O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686909670; x=1718445670;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lIJV9WJVsC1i11gMTvTAxOJ8VEod0bdEOZLVzE3/D6g=;
  b=WzqXp/4ONAMzBgV8JKNfNa0teHPZfhh/3W17Y6l0olrwx7flIonoPe2q
   4LH1FdZbUCc7RcYPprwTkVdIat4FWKf2gXAL1pvipoZGYk3yw9oK7S/go
   uYKjNBlIo8I+d+/3P8fr5udM22GukjI4P9KXqN50ntO8zpCgLcVXF4C+Y
   wH1r6xzU0SYVRmEz7vLWPWmTpWI7vZAZM6DmoV/rlUQR6LKhjBusTzJqZ
   cC6izmlNGVS3N66pDj+XdOkIaF3E6V2ldlstoiJOj+jr1IDG10mCU1MgT
   xF5eZhS6sZieZH3ymM6iNLvejsPaBHbct2Jj0At+ywGI7b/Mq4ivW8NqL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="362591630"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400";
   d="scan'208";a="362591630"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:01:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="825689396"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400";
   d="scan'208";a="825689396"
Received: from kjaffe-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.114.132])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:01:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 4/8] ASoC: SOF: Add new sof_debug flag to request message
 payload dump
Date: Fri, 16 Jun 2023 12:00:35 +0200
Message-Id: <20230616100039.378150-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230616100039.378150-1-pierre-louis.bossart@linux.intel.com>
References: <20230616100039.378150-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B7HDT4ICLGRPOTNHY4HIRJVXHWPEMLNV
X-Message-ID-Hash: B7HDT4ICLGRPOTNHY4HIRJVXHWPEMLNV
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B7HDT4ICLGRPOTNHY4HIRJVXHWPEMLNV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

We only print out the header information of an IPC message in debug level,
either in verbose or non verbose way (Kconfig option).

On top of the header information the message itself can help reproducing
and identifying issues.

BIT(11) can be used to request a message payload dump if it is supported
by the IPC implementation.

Since IPC message payload printing is only implemented for IPC4, the flag
will not have any effect to IPC3 for now.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index cd4f6ac126ec..d4f6702e93dc 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -48,6 +48,9 @@ struct snd_sof_pcm_stream;
 #define SOF_DBG_FORCE_NOCODEC			BIT(10) /* ignore all codec-related
 							 * configurations
 							 */
+#define SOF_DBG_DUMP_IPC_MESSAGE_PAYLOAD	BIT(11) /* On top of the IPC message header
+							 * dump the message payload also
+							 */
 #define SOF_DBG_DSPLESS_MODE			BIT(15) /* Do not initialize and use the DSP */
 
 /* Flag definitions used for controlling the DSP dump behavior */
-- 
2.37.2

