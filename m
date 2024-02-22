Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C2485FEB3
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 18:07:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D36AE80;
	Thu, 22 Feb 2024 18:07:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D36AE80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708621660;
	bh=cewHMOUP9XE8f1iBRQp0XY/AtymJk2wyw8t26geqAWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y+AuVL+sQ4XlK8B9OMuvTNwcZHTv2Azq3m+L86uYrCS4FX6KRsrXXTdoMkMs1jgQz
	 9VUSR41b58+TBKmrRGMvQAqNYGM4PTotBfyt9WQfnDA9FOb2+WKSUTCL2pqRsHtcdt
	 Ey7/DqirG1bfeQ6Xj/35kzcyLELNfQra1h4BBSdA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE79AF80623; Thu, 22 Feb 2024 18:06:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDAC8F80634;
	Thu, 22 Feb 2024 18:06:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC5C6F805E7; Thu, 22 Feb 2024 18:06:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A895EF80568
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 18:06:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A895EF80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=G3cNQjlp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708621563; x=1740157563;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cewHMOUP9XE8f1iBRQp0XY/AtymJk2wyw8t26geqAWQ=;
  b=G3cNQjlp70Qf9DjjsH+7ivoIhCC+Oh6O6p4NDVR/0OR3jtXqrxsJqZ2k
   Eb2eYsfVKPDNqAVoegEs2OJnzCulAvli1Fgvar3/s/fCwRtX+1/3CC9yM
   x4E23gvZ8oEIRSOplAXp7/Zf11O+5QGIPC09tZbt44YjjohDKezNv37HC
   D27TLTLUQmWHgMHmkbx8JO6q7AXn3ejW598Qbfjy8quKd6sKIlHAaqbEQ
   7K6BDPX4gMZzmLQ2ge16uHTcO+RWi6zp4SuNmYeB9zwy5RaZx8YrKPrP8
   eiT/MUkoRZ4Hdh+biYn/kO77yuvImZj+sgN8ZhkRUW4OdEdCWkMtchi9K
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20299273"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="20299273"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 09:05:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="827575250"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="827575250"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga001.jf.intel.com with ESMTP; 22 Feb 2024 09:05:04 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 4/4] ALSA: hda: Reuse for_each_pcm_streams()
Date: Thu, 22 Feb 2024 18:06:14 +0100
Message-Id: <20240222170614.884413-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240222170614.884413-1-cezary.rojewski@intel.com>
References: <20240222170614.884413-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4277GHX46IWRW24XSC5PL25ZVNY7VVWN
X-Message-ID-Hash: 4277GHX46IWRW24XSC5PL25ZVNY7VVWN
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4277GHX46IWRW24XSC5PL25ZVNY7VVWN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use the macro to improve readability.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/pci/hda/hda_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 12f02cdc9659..2cac337f5263 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -3313,7 +3313,7 @@ int snd_hda_codec_parse_pcms(struct hda_codec *codec)
 	list_for_each_entry(cpcm, &codec->pcm_list_head, list) {
 		int stream;
 
-		for (stream = 0; stream < 2; stream++) {
+		for_each_pcm_streams(stream) {
 			struct hda_pcm_stream *info = &cpcm->stream[stream];
 
 			if (!info->substreams)
-- 
2.25.1

