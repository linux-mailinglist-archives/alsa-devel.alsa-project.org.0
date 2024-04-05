Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F5889991C
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 11:13:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C36F2D31;
	Fri,  5 Apr 2024 11:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C36F2D31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712308424;
	bh=dxCLzaInWEDf5H8sovQbT5x3OpdikXTGyLfkyz6cQ0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KIVXbPtkqqaJWyJIPUpDmZhI6s7vKpBDC2pTF9j4vF1jPKnfC4snv3KIDZdD932f0
	 gQMzld4gNuyoA2vVy/nGTH6/67iXYHTOLJHZ5i2EHQCSFyIzkX2XEXkW1KTttawhSP
	 zrXsOzP9ooRluLpobllhdB3hHAVGf776b3aSeMcU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9154F80730; Fri,  5 Apr 2024 11:10:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 243BCF80727;
	Fri,  5 Apr 2024 11:10:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C30D7F806D7; Fri,  5 Apr 2024 11:10:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68502F80007
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 11:08:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68502F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PZf4pUti
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308092; x=1743844092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dxCLzaInWEDf5H8sovQbT5x3OpdikXTGyLfkyz6cQ0s=;
  b=PZf4pUti0q69ZBEffyp6Pk7WfGINdGSgkfFrWXtfZCN/N3QB+36WbWrM
   L+BS9mV/xWxTj+PqZPvgkJu6qqcNE+NTgAdqc0mi5jWUiUATzNOpHjfpY
   3kKPANHYvE24y+4cv1sfLVWDsLVdbCZU9AmGLsL3weRZA0QM90B06xN5N
   zNixjPQyVCcnvhsOTtCoteTj8Vtp8rDHX/AIjT0tTW4+Ew9VCA0K/1sRG
   mtjWkVcOfJSitszyPXFVc4y3+uaHskw4kxkzR+thgrlXfSohoRRIEf7Rp
   JK7URDFYtXyY8JAaF6ybIuY2l+siwkswKjyJ/SjUlOZq8Ndo9QI/Ujnj0
   w==;
X-CSE-ConnectionGUID: D2sLRQgAQdCAPYwsZa+NEw==
X-CSE-MsgGUID: N17C1ElySmu2I9PuMUxWJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787407"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="7787407"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:08:08 -0700
X-CSE-ConnectionGUID: 2UhNxsTeSLyumSvGXGHIVg==
X-CSE-MsgGUID: RZThk3YiQX2P0wyvKq62Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="19042412"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 01/13] ASoC: Intel: avs: Restore stream decoupling on prepare
Date: Fri,  5 Apr 2024 11:09:17 +0200
Message-Id: <20240405090929.1184068-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4FNPSYLW4MH2RJQVDJZFGDIFRNHIMPX4
X-Message-ID-Hash: 4FNPSYLW4MH2RJQVDJZFGDIFRNHIMPX4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4FNPSYLW4MH2RJQVDJZFGDIFRNHIMPX4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Revert changes from commit b87b8f43afd5 ("ASoC: Intel: avs: Drop
superfluous stream decoupling") to restore working streaming during S3.

Fixes: b87b8f43afd5 ("ASoC: Intel: avs: Drop superfluous stream decoupling")
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 2cafbc392cdb..72f1bc3b7b1f 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -356,6 +356,7 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 					   stream_info->sig_bits);
 	format_val = snd_hdac_stream_format(runtime->channels, bits, runtime->rate);
 
+	snd_hdac_ext_stream_decouple(bus, link_stream, true);
 	snd_hdac_ext_stream_reset(link_stream);
 	snd_hdac_ext_stream_setup(link_stream, format_val);
 
@@ -611,6 +612,7 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct hdac_ext_stream *host_stream;
 	unsigned int format_val;
+	struct hdac_bus *bus;
 	unsigned int bits;
 	int ret;
 
@@ -620,6 +622,8 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	if (hdac_stream(host_stream)->prepared)
 		return 0;
 
+	bus = hdac_stream(host_stream)->bus;
+	snd_hdac_ext_stream_decouple(bus, data->host_stream, true);
 	snd_hdac_stream_reset(hdac_stream(host_stream));
 
 	stream_info = snd_soc_dai_get_pcm_stream(dai, substream->stream);
-- 
2.25.1

