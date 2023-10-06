Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A43617BB545
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 12:31:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB01383E;
	Fri,  6 Oct 2023 12:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB01383E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696588288;
	bh=BOjkADXMV0Ks4n0D/tAOmQV35gqrkUK3bXDHqJgT/7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=atbS1R9xGDKGMexkuwk/2gFjo69oRj7CDQk17G7DGnrEZtrEpHx+H0x3Co0xIH2EO
	 z0/iWOgoxvq4rfepmq9MJNyDH4+y1ejFk1iWN5C3JmzMz78RruRGgQumUTG5o5a5aO
	 Fggv0mIfUcE7ceOYDy5qxHpBKWaPJkeG843PC720=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F09ACF8057F; Fri,  6 Oct 2023 12:29:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D6D8F80579;
	Fri,  6 Oct 2023 12:29:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C0A3F8047D; Fri,  6 Oct 2023 12:29:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3BB57F80166
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 12:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BB57F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Jbks+XZ/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696588179; x=1728124179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BOjkADXMV0Ks4n0D/tAOmQV35gqrkUK3bXDHqJgT/7E=;
  b=Jbks+XZ/QFvZPMkjkkVWtEOPcHMuqSKJJpF6g6BfA+R+OCzzqGpJwTJS
   TJrHCnam2qvLOfhBs7xEggP/788xPQ+of7YgfAIiYmmARXh/OVUKXAJm6
   omZbkvOCuFt991CpJNc/XeCsizSMEqG4VP9hsaUAOYgdZjI4/S1hIBC7s
   crmGvQGMyYLLINgoupk1uX8+zu5WzxrkZ8e0VCxLwchqPFbC4uzN12tt4
   r03XPZRjmu1nfEboB12uwG3p4dLdKEtqvyXtoWKOXetAFDoPv4TJOEOKB
   4ZFtX9dlnbrA2vCkZ+dKyLKZI1u4HHzLBg2WGet4fDGoSDoWbI9n+exz8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="364002754"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="364002754"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:29:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925928913"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="925928913"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga005.jf.intel.com with ESMTP; 06 Oct 2023 03:29:31 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/3] ALSA: hda: Fix possible null-ptr-deref when assigning a
 stream
Date: Fri,  6 Oct 2023 12:28:55 +0200
Message-Id: <20231006102857.749143-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231006102857.749143-1-cezary.rojewski@intel.com>
References: <20231006102857.749143-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PNJN4OIHTJRMRLOHHCGOAXSFBOGRXLWD
X-Message-ID-Hash: PNJN4OIHTJRMRLOHHCGOAXSFBOGRXLWD
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PNJN4OIHTJRMRLOHHCGOAXSFBOGRXLWD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

While AudioDSP drivers assign streams exclusively of HOST or LINK type,
nothing blocks a user to attempt to assign a COUPLED stream. As
supplied substream instance may be a stub, what is the case when
code-loading, such scenario ends with null-ptr-deref.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/hdac_stream.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 5382894bebab..a132108fba40 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -362,8 +362,10 @@ struct hdac_stream *snd_hdac_stream_assign(struct hdac_bus *bus,
 	struct hdac_stream *res = NULL;
 
 	/* make a non-zero unique key for the substream */
-	int key = (substream->pcm->device << 16) | (substream->number << 2) |
-		(substream->stream + 1);
+	int key = (substream->number << 2) | (substream->stream + 1);
+
+	if (substream->pcm)
+		key |= (substream->pcm->device << 16);
 
 	spin_lock_irq(&bus->reg_lock);
 	list_for_each_entry(azx_dev, &bus->stream_list, list) {
-- 
2.25.1

