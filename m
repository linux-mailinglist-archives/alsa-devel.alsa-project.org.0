Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D13086756D
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 13:44:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2587BC0;
	Mon, 26 Feb 2024 13:44:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2587BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708951456;
	bh=z8lPSEjbSrtzAuUskaODEdGF5O7WHGh3H8vOdHVof2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qHQwEz6HUbypLjrTRofyE3dfzKNEt5PueQs+JXu6qiETDCaPI1xylwTw7GPqs3V38
	 5dblOonf4hzSS6eiAV7676GuJgIfk6bqHnTpWaBl0ZHoRFhzld7W5qTW3lLhSl9X1e
	 28Pzn+UhEWHethEMjKUZepiLEnTfSZNUWPVAfBRE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D84A2F805F4; Mon, 26 Feb 2024 13:43:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74104F805F6;
	Mon, 26 Feb 2024 13:43:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 547CDF8059F; Mon, 26 Feb 2024 13:43:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2147F8012B
	for <alsa-devel@alsa-project.org>; Mon, 26 Feb 2024 13:43:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2147F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ghbgd/Lr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708951387; x=1740487387;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z8lPSEjbSrtzAuUskaODEdGF5O7WHGh3H8vOdHVof2M=;
  b=Ghbgd/LrNBQr3em9JIFFouNL0azwWWvnNrJmgjxadvWsabOviv49RiKl
   M6+HKqxaAzXt9XTVY/T6XG9u7CtvMQMiUg9C2Q6s0Ru2iTpjycxGMF+Bl
   0r1sPjIaHRp6JFtebkakDBdjDu1fjq6ljYZTjtZYv7uiUKd3M+h0q1u/F
   7OiS96viBoSCQ/T4Vx0HgiIhFprh0kn7NQ1SXDnZUmI1dmXyWo7pFjZLL
   n+VvTqycjSQsep4KNH1syA+41FtMdvTd8ewPAKvJVS1GpqjEpcVUOZzSD
   vJ8pVl0JCtpw7VdjImnr0vcrW2QBqFxHTflY7iU4VpLiU3dcGz/HiqC1M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="28658243"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000";
   d="scan'208";a="28658243"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 04:43:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000";
   d="scan'208";a="6688613"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 26 Feb 2024 04:43:01 -0800
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
Subject: [PATCH v3 2/5] ASoC: codecs: hda: Skip HDMI/DP registration if i915
 is missing
Date: Mon, 26 Feb 2024 13:44:29 +0100
Message-Id: <20240226124432.1203798-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240226124432.1203798-1-cezary.rojewski@intel.com>
References: <20240226124432.1203798-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: K353MPQBAU5T5HEWSCNWT44RBCOSL4LM
X-Message-ID-Hash: K353MPQBAU5T5HEWSCNWT44RBCOSL4LM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K353MPQBAU5T5HEWSCNWT44RBCOSL4LM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If i915 does not support given platform but the hardware i.e.: HDAudio
codec is still there, the codec-probing procedure will succeed for such
device but the follow up initialization will always end up with -ENODEV.

While bus could filter out address '2' which Intel's HDMI/DP codecs
always enumerate on, more robust approach is to check for i915 presence
before registering display codecs.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/hda.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index d2117e36ddd1..7c6bedeceaa2 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -350,6 +350,11 @@ static int hda_hdev_attach(struct hdac_device *hdev)
 	struct hda_codec *codec = dev_to_hda_codec(&hdev->dev);
 	struct snd_soc_component_driver *comp_drv;
 
+	if (hda_codec_is_display(codec) && !hdev->bus->audio_component) {
+		dev_dbg(&hdev->dev, "no i915, skip registration for 0x%08x\n", hdev->vendor_id);
+		return -ENODEV;
+	}
+
 	comp_drv = devm_kzalloc(&hdev->dev, sizeof(*comp_drv), GFP_KERNEL);
 	if (!comp_drv)
 		return -ENOMEM;
-- 
2.25.1

