Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDC3809561
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 23:31:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B7E6827;
	Thu,  7 Dec 2023 23:31:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B7E6827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701988296;
	bh=IjYf6gRzkTpmo6Q9g3AJuEWF4uxIJpfQMq4tyk+NPbE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dDRNAhjtNhR0XKw8XriZ9GgVLVgW82+m9k8EhNh8vmk2FI4iYKS2qq8DE/u/6yEPh
	 +kbSQlN83BnIRlG8JTtq9xfahewqEv3FPMvntYUPJ65MoOORwNa3buo1yQVNPNZ2EN
	 8kT6sQjOl1gt+enju5QOf9m/I3MNx98MQPknqWq0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A80C4F8060E; Thu,  7 Dec 2023 23:30:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D7A0F805FA;
	Thu,  7 Dec 2023 23:30:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C311F80568; Thu,  7 Dec 2023 23:30:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70197F80166
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 23:30:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70197F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Z2UxzNDL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988215; x=1733524215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IjYf6gRzkTpmo6Q9g3AJuEWF4uxIJpfQMq4tyk+NPbE=;
  b=Z2UxzNDLlgTF1fNDBFqv7oiShJLK1Yav5D0u36aw7dGNx0ugaLWiSpq/
   IrVo+oKXaiIy9COhBpzbrqqTZznl1v7AyZ6dlC00yuoAKTnMd3qTCkreY
   WUaTRH/EMqOrxV7PJ39fa8EEyBefN0OV5zH3zEki6YmlxXj0WpGlYkwF2
   6yoe6KmRz8OaJ9gVE56s8aval2ULaVabko1TEcS/7cj6n97GXm49eNiuA
   e8WK1FXKW+ciGp3NLswIvR1Z4ywPZATtXE6b84yMwyhMhimEMCGHzedXt
   0DFHaL4pEJqzNS4TjyJCau/zgnc6fAhCNVQ38DrnYzLoEwZaAesCm8lpO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516595"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="480516595"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307470"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="895307470"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:09 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 03/16] soundwire: stream: extend sdw_alloc_stream() to
 take 'type' parameter
Date: Thu,  7 Dec 2023 16:29:31 -0600
Message-Id: <20231207222944.663893-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QFUX34QHXH5ECI2YZI5DTC5WPXHIHQEY
X-Message-ID-Hash: QFUX34QHXH5ECI2YZI5DTC5WPXHIHQEY
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QFUX34QHXH5ECI2YZI5DTC5WPXHIHQEY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In the existing definition of sdw_stream_runtime, the 'type' member is
never set and defaults to PCM. To prepare for the BPT/BRA support, we
need to special-case streams and make use of the 'type'.

No functional change for now, the implicit PCM type is now explicit.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 Documentation/driver-api/soundwire/stream.rst | 2 +-
 drivers/soundwire/stream.c                    | 7 +++++--
 include/linux/soundwire/sdw.h                 | 3 ++-
 sound/soc/qcom/sdw.c                          | 2 +-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/driver-api/soundwire/stream.rst b/Documentation/driver-api/soundwire/stream.rst
index b432a2de45d3..65b9bb742689 100644
--- a/Documentation/driver-api/soundwire/stream.rst
+++ b/Documentation/driver-api/soundwire/stream.rst
@@ -291,7 +291,7 @@ per stream. From ASoC DPCM framework, this stream state maybe linked to
 
 .. code-block:: c
 
-  int sdw_alloc_stream(char * stream_name);
+  int sdw_alloc_stream(char * stream_name, enum sdw_stream_type type);
 
 The SoundWire core provides a sdw_startup_stream() helper function,
 typically called during a dailink .startup() callback, which performs
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index c4ab360e727f..c1e3bb897fb9 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1743,12 +1743,14 @@ static int set_stream(struct snd_pcm_substream *substream,
  * sdw_alloc_stream() - Allocate and return stream runtime
  *
  * @stream_name: SoundWire stream name
+ * @type: stream type (could be PCM, PDM or BPT)
  *
  * Allocates a SoundWire stream runtime instance.
  * sdw_alloc_stream should be called only once per stream. Typically
  * invoked from ALSA/ASoC machine/platform driver.
  */
-struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name)
+struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name,
+					    enum sdw_stream_type type)
 {
 	struct sdw_stream_runtime *stream;
 
@@ -1760,6 +1762,7 @@ struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name)
 	INIT_LIST_HEAD(&stream->master_list);
 	stream->state = SDW_STREAM_ALLOCATED;
 	stream->m_rt_count = 0;
+	stream->type = type;
 
 	return stream;
 }
@@ -1788,7 +1791,7 @@ int sdw_startup_stream(void *sdw_substream)
 	if (!name)
 		return -ENOMEM;
 
-	sdw_stream = sdw_alloc_stream(name);
+	sdw_stream = sdw_alloc_stream(name, SDW_STREAM_PCM);
 	if (!sdw_stream) {
 		dev_err(rtd->dev, "alloc stream failed for substream DAI %s\n", substream->name);
 		ret = -ENOMEM;
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 71a7031f7b3a..5cc7fed1bf19 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1024,7 +1024,8 @@ struct sdw_stream_runtime {
 	int m_rt_count;
 };
 
-struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name);
+struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name,
+					    enum sdw_stream_type type);
 void sdw_release_stream(struct sdw_stream_runtime *stream);
 
 int sdw_compute_params(struct sdw_bus *bus);
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 77dbe0c28b29..d91a1bd0c66c 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -27,7 +27,7 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_dai *codec_dai;
 	int ret, i;
 
-	sruntime = sdw_alloc_stream(cpu_dai->name);
+	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
 	if (!sruntime)
 		return -ENOMEM;
 
-- 
2.39.2

