Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8C27EF23C
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 13:06:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11AFF83A;
	Fri, 17 Nov 2023 13:05:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11AFF83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700222781;
	bh=COz68ZhPZ9s+oshEHWSClsXhqaoZSHQ6Qkxhh6zidgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YHytV2MDnD3PVFZ/rOF8jZGacgGMXfCBLWS3mS0tA7UA+TN0sZeMOiL2DTUWhNkGj
	 D/023gm0r1B1BH21+L/iRY7iCc7rq8XRUqmw95D1+WoZFinwb8vKtck1Mv4MdCOVfh
	 rEbV7gi+8m0ifab16o2leDzREozAXAuQ+YfnwzWE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D8AFF8056F; Fri, 17 Nov 2023 13:04:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AE38F802E8;
	Fri, 17 Nov 2023 13:04:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A987EF8057E; Fri, 17 Nov 2023 13:04:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D0C1F8022B
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 13:04:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D0C1F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iINnW5bM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222655; x=1731758655;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=COz68ZhPZ9s+oshEHWSClsXhqaoZSHQ6Qkxhh6zidgM=;
  b=iINnW5bMHxVoao6jGRA04eoMpWjkgXODJ3gLhldqL9Ex2jZS5a6XLAPh
   ++Q+f4vdcF4Rlt6ftJwY/mwk1m5GWQXCS+IHpdu7MVqjpoqieXhIPBD6i
   FRzr53nu/vgdp1r+0XVMtDhwp96aQJsFdw7yBhJRPqJDXb6zb/5PsQexZ
   H9FY8bKt9KRY9JHXuuoEQBz4uja/+z3j1QyciFpbbAs5Ti8CUXEyAgK8d
   RLXz34XapgFsQCNXsi82IIzYS5PXymU3Cgv+YyWF5g9vieFrFpwlbAScg
   vvp2miFjZ4lZL8RUKzguweRWzSkcdLkIPNIHb8S4JmAmtcM43mdLehum/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381675186"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="381675186"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 04:04:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="883110162"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="883110162"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2023 04:04:08 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v5 03/16] ASoC: pcm: Honor subformat when configuring runtime
Date: Fri, 17 Nov 2023 13:05:57 +0100
Message-Id: <20231117120610.1755254-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117120610.1755254-1-cezary.rojewski@intel.com>
References: <20231117120610.1755254-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BBTPMZJFRAL64VOP6TQS5ORA73BHBFAN
X-Message-ID-Hash: BBTPMZJFRAL64VOP6TQS5ORA73BHBFAN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BBTPMZJFRAL64VOP6TQS5ORA73BHBFAN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Subformat options are ignored when setting up hardware parameters and
assigning PCM stream capabilities. Account for them to allow for
granular format selection.

As there is only one user currently (format S32_LE), subformat is
represented by a simple u32 and stores flags only for that one user
alone. Such approach allows for alloc/free-less code until there are
more users on the horizon.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc.h |  1 +
 sound/soc/soc-pcm.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 7792c393e238..ccc31bc41e92 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -620,6 +620,7 @@ enum snd_soc_trigger_order {
 struct snd_soc_pcm_stream {
 	const char *stream_name;
 	u64 formats;			/* SNDRV_PCM_FMTBIT_* */
+	u32 subformats;			/* for S32_LE format, SNDRV_PCM_SUBFMTBIT_* */
 	unsigned int rates;		/* SNDRV_PCM_RATE_* */
 	unsigned int rate_min;		/* min rate */
 	unsigned int rate_max;		/* max rate */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 323e4d7b6adf..9d688917cce2 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -554,6 +554,12 @@ static void soc_pcm_hw_update_format(struct snd_pcm_hardware *hw,
 	hw->formats &= p->formats;
 }
 
+static void soc_pcm_hw_update_subformat(struct snd_pcm_hardware *hw,
+					struct snd_soc_pcm_stream *p)
+{
+	hw->subformats &= p->subformats;
+}
+
 /**
  * snd_soc_runtime_calc_hw() - Calculate hw limits for a PCM stream
  * @rtd: ASoC PCM runtime
@@ -592,6 +598,7 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 		soc_pcm_hw_update_chan(hw, cpu_stream);
 		soc_pcm_hw_update_rate(hw, cpu_stream);
 		soc_pcm_hw_update_format(hw, cpu_stream);
+		soc_pcm_hw_update_subformat(hw, cpu_stream);
 	}
 	cpu_chan_min = hw->channels_min;
 	cpu_chan_max = hw->channels_max;
@@ -613,6 +620,7 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 		soc_pcm_hw_update_chan(hw, codec_stream);
 		soc_pcm_hw_update_rate(hw, codec_stream);
 		soc_pcm_hw_update_format(hw, codec_stream);
+		soc_pcm_hw_update_subformat(hw, codec_stream);
 	}
 
 	/* Verify both a valid CPU DAI and a valid CODEC DAI were found */
@@ -1713,6 +1721,7 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 		soc_pcm_hw_update_rate(hw, cpu_stream);
 		soc_pcm_hw_update_chan(hw, cpu_stream);
 		soc_pcm_hw_update_format(hw, cpu_stream);
+		soc_pcm_hw_update_subformat(hw, cpu_stream);
 	}
 
 }
@@ -1750,6 +1759,7 @@ static void dpcm_runtime_setup_be_format(struct snd_pcm_substream *substream)
 			codec_stream = snd_soc_dai_get_pcm_stream(dai, stream);
 
 			soc_pcm_hw_update_format(hw, codec_stream);
+			soc_pcm_hw_update_subformat(hw, codec_stream);
 		}
 	}
 }
-- 
2.25.1

