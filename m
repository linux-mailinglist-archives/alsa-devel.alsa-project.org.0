Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C289896A49
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 11:16:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87B652C70;
	Wed,  3 Apr 2024 11:16:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87B652C70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712135776;
	bh=R42RWlWUefH9vHZVCaBl8MfoWeK8wmzlj0AXLYQx0F0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dTRsYGeIVLpjQekoNkXOgntzpIbumgb6YX95/3ugUxnsI4IC3/z3XT1V+u+FhxqGH
	 KXudNGEZAYOj7zzzcSLUymB7u9QQ/Pa8ccUmNW3gvWf4z7mTw4B9LrSwsALkWK5BYc
	 rFZTNrxZDKAJpDx1df6kcqiBbkCP83BG9mCChHWw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59F89F805EC; Wed,  3 Apr 2024 11:15:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5415DF805EF;
	Wed,  3 Apr 2024 11:15:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B259F805A0; Wed,  3 Apr 2024 11:15:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F08BF80130
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 11:15:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F08BF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UjCJ3fdO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712135706; x=1743671706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R42RWlWUefH9vHZVCaBl8MfoWeK8wmzlj0AXLYQx0F0=;
  b=UjCJ3fdOTw7GplgjyYlB5XVDJxORrOfDS+a/9O9JlG3x/oDMbv1IyZ1M
   lPGHsGumau/BNryoVFPgg32unSJ0ueZktoBn0xTeWvqL0io/c4bHXYAdI
   wLZydWW9RHDMDevxtiLqNUtk+Zjf1TpAB0mb5blVBvHkBHY9kfbvP14dO
   gzjYTwcOPl8dhw73S6BtuSCMgkKwD1TQjqo//CHgyGwiOYW9lU1Y+vZUZ
   KXqtxFMm0fuVG9cTNPXqyN57a4/FH5xIeh51y/Lre8CPovkOtLx5kfIrZ
   biIUreVVkcDSXT9GDaWDjwsr1mESy62uLcaWWPlFw08TFYO2epqOqCo4I
   Q==;
X-CSE-ConnectionGUID: Jfb3JWh3QxWjk0GfsP7r+A==
X-CSE-MsgGUID: q5eMNoDbRa6wEtpwcAM46Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="10322576"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="10322576"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:15:03 -0700
X-CSE-ConnectionGUID: 1OE4lx6oSeCzJPo6fSYBAg==
X-CSE-MsgGUID: QMv4+h7xQCaxbQcEN5nmxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="18410539"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2024 02:15:01 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	cujomalainey@chromium.org,
	lmajczak@google.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 4/4] ASoC: topology: Remove obsolete ABI v4 structs
Date: Wed,  3 Apr 2024 11:16:29 +0200
Message-Id: <20240403091629.647267-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240403091629.647267-1-cezary.rojewski@intel.com>
References: <20240403091629.647267-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IPK45GTM4FC2IZIT25X2PB3H52HM7NEN
X-Message-ID-Hash: IPK45GTM4FC2IZIT25X2PB3H52HM7NEN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IPK45GTM4FC2IZIT25X2PB3H52HM7NEN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are no users of soc-topology ABI v4 since kernel v5.4 and no
kernel code makes use of them.

Cc: Curtis Malainey <cujomalainey@chromium.org>
Cc: Łukasz Majczak <lmajczak@google.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/uapi/sound/asoc.h | 56 ---------------------------------------
 1 file changed, 56 deletions(-)

diff --git a/include/uapi/sound/asoc.h b/include/uapi/sound/asoc.h
index 10851bca7174..99333cbd3114 100644
--- a/include/uapi/sound/asoc.h
+++ b/include/uapi/sound/asoc.h
@@ -576,60 +576,4 @@ struct snd_soc_tplg_dai {
 	struct snd_soc_tplg_private priv;
 } __attribute__((packed));
 
-/*
- * Old version of ABI structs, supported for backward compatibility.
- */
-
-/* Manifest v4 */
-struct snd_soc_tplg_manifest_v4 {
-	__le32 size;		/* in bytes of this structure */
-	__le32 control_elems;	/* number of control elements */
-	__le32 widget_elems;	/* number of widget elements */
-	__le32 graph_elems;	/* number of graph elements */
-	__le32 pcm_elems;	/* number of PCM elements */
-	__le32 dai_link_elems;	/* number of DAI link elements */
-	struct snd_soc_tplg_private priv;
-} __packed;
-
-/* Stream Capabilities v4 */
-struct snd_soc_tplg_stream_caps_v4 {
-	__le32 size;		/* in bytes of this structure */
-	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
-	__le64 formats;	/* supported formats SNDRV_PCM_FMTBIT_* */
-	__le32 rates;		/* supported rates SNDRV_PCM_RATE_* */
-	__le32 rate_min;	/* min rate */
-	__le32 rate_max;	/* max rate */
-	__le32 channels_min;	/* min channels */
-	__le32 channels_max;	/* max channels */
-	__le32 periods_min;	/* min number of periods */
-	__le32 periods_max;	/* max number of periods */
-	__le32 period_size_min;	/* min period size bytes */
-	__le32 period_size_max;	/* max period size bytes */
-	__le32 buffer_size_min;	/* min buffer size bytes */
-	__le32 buffer_size_max;	/* max buffer size bytes */
-} __packed;
-
-/* PCM v4 */
-struct snd_soc_tplg_pcm_v4 {
-	__le32 size;		/* in bytes of this structure */
-	char pcm_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
-	char dai_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
-	__le32 pcm_id;		/* unique ID - used to match with DAI link */
-	__le32 dai_id;		/* unique ID - used to match */
-	__le32 playback;	/* supports playback mode */
-	__le32 capture;		/* supports capture mode */
-	__le32 compress;	/* 1 = compressed; 0 = PCM */
-	struct snd_soc_tplg_stream stream[SND_SOC_TPLG_STREAM_CONFIG_MAX]; /* for DAI link */
-	__le32 num_streams;	/* number of streams */
-	struct snd_soc_tplg_stream_caps_v4 caps[2]; /* playback and capture for DAI */
-} __packed;
-
-/* Physical link config v4 */
-struct snd_soc_tplg_link_config_v4 {
-	__le32 size;            /* in bytes of this structure */
-	__le32 id;              /* unique ID - used to match */
-	struct snd_soc_tplg_stream stream[SND_SOC_TPLG_STREAM_CONFIG_MAX]; /* supported configs playback and captrure */
-	__le32 num_streams;     /* number of streams */
-} __packed;
-
 #endif
-- 
2.25.1

