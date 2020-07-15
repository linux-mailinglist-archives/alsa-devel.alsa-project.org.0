Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4022213BA
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 19:49:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E26401660;
	Wed, 15 Jul 2020 19:48:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E26401660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594835375;
	bh=ntdnQ6vtgXf5zTZbCtZYs7BRsuysn0HsOLiBgDHxygQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BfXnAInpB4T4wK+sq8F9oq9+Kvdk5+IQPrcQcFATZEc2ibvDYdN2pvMHPrDccaoe6
	 M/UyUPg5YZvZp+uXxDmHxhcavGgka3ABQmCQquCiNSlLXZXIqbU+XPrDh2nIMHwBtv
	 ItmPq2c1l0qeEJ4z+NtmbLxdBUapoeU2VUC5Nnsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD474F802BC;
	Wed, 15 Jul 2020 19:46:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8903FF80240; Wed, 15 Jul 2020 19:46:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70779F800E8
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 19:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70779F800E8
IronPort-SDR: cUK6yE83Un/voa3fUG+ZuDVnkFIo+OkH6s6ndibBU/aLV6RXX1MGGuxKZ4X2EQ/qmNU7RCingt
 SVb2YmnIigKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="146739491"
X-IronPort-AV: E=Sophos;i="5.75,356,1589266800"; d="scan'208";a="146739491"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 10:46:30 -0700
IronPort-SDR: z8BlVl+6AGGnVYl3rJ5JOq7IlnSFPdr3wDSTtrFvP7bfzjBOkkt75wG5cNh+BS/vdvDyexkz8z
 1pZQMloEkNow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,356,1589266800"; d="scan'208";a="326259065"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga007.jf.intel.com with ESMTP; 15 Jul 2020 10:46:29 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH 1/2] ALSA: hda: export snd_hda_codec_cleanup_for_unbind()
Date: Wed, 15 Jul 2020 20:45:50 +0300
Message-Id: <20200715174551.3730165-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715174551.3730165-1-kai.vehmanen@linux.intel.com>
References: <20200715174551.3730165-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

To avoid duplicated code for cleanup, and match the already exported
snd_hda_codec_pcm_new(), also export snd_hda_codec_cleanup_for_unbind().

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/sound/hda_codec.h | 2 ++
 sound/pci/hda/hda_codec.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index d16a4229209b..e378ed7f4824 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -415,6 +415,8 @@ __printf(2, 3)
 struct hda_pcm *snd_hda_codec_pcm_new(struct hda_codec *codec,
 				      const char *fmt, ...);
 
+void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec);
+
 static inline void snd_hda_codec_pcm_get(struct hda_pcm *pcm)
 {
 	kref_get(&pcm->kref);
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 7e3ae4534df9..b4331355602c 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -792,6 +792,7 @@ void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec)
 	remove_conn_list(codec);
 	snd_hdac_regmap_exit(&codec->core);
 }
+EXPORT_SYMBOL_GPL(snd_hda_codec_cleanup_for_unbind);
 
 static unsigned int hda_set_power_state(struct hda_codec *codec,
 				unsigned int power_state);
-- 
2.27.0

