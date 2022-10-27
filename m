Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B03B660F756
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 14:33:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F888308C;
	Thu, 27 Oct 2022 14:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F888308C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666873987;
	bh=cqHkJpkiY2RJ+JPhvFBirYieeMEGz9MTXcB6l/w9TCc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mCYZcPCT6zZxd+kDv+QX4V8pkX7tWv43fzkfLsGMyf6jR+tPwEpsXfDQD3hnq/nu2
	 2A9bsUfqSObRnLjljN7E0yMaGVh/qPUZ3GP4rIL2EWTKAysCOnDPgxD1RdFdIrtKeF
	 +hkI/aiv7gcph0FAMgKNIOFjZ0gwHXuOU5X4o6Ek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02EE3F8057B;
	Thu, 27 Oct 2022 14:30:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7740F8055A; Thu, 27 Oct 2022 14:30:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 179F7F80100
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 14:30:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 179F7F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="G6Gv90Ha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666873826; x=1698409826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cqHkJpkiY2RJ+JPhvFBirYieeMEGz9MTXcB6l/w9TCc=;
 b=G6Gv90HacZmDj8MSXrcTkzvG5/5HdomulSjUxUa0K/WpYSnhG6bCLksH
 Xj+GY4Ogs1JiArxjo365Qdt0PtbMeHn6jdePowP1iRTkUMnzg4i+x15FZ
 ldLXfiMapUJL9YPFAcxH7kb5WnL1opke8dkb3/Cf+bErP9JTvoVIxloKe
 yTO2fOwXm2j5fZlozC1nS44/rLKNLZAdtzKxeqSb5sN441TnlwZIlZfKn
 GEwEyWGyz1BCwJJLhVFdQryXoP+0CboC/Oquq9y6kpJhJoeeGvLvHM8sl
 I90MddyaF5EMn8ubHyz328VwbVwyxvxK/j2BzAE9//xTs9bgEfhJzqInv Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="334839904"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="334839904"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 05:30:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="807435685"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="807435685"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 27 Oct 2022 05:30:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v4 3/9] ALSA: hda: Introduce snd_hdac_stream_wait_drsm()
Date: Thu, 27 Oct 2022 14:46:56 +0200
Message-Id: <20221027124702.1761002-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027124702.1761002-1-cezary.rojewski@intel.com>
References: <20221027124702.1761002-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Allow for waiting for DRSM bit for specified stream to be cleared from
HDAudio library level. Drivers may utilize this optional step during the
stream resume procedure.

Suggested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Changes in v4:
- replaced readb_poll_timeout() with read_poll_timeout() for the DRSM
  polling function as the register is u32 wide, not u8

 include/sound/hdaudio.h |  1 +
 sound/hda/hdac_stream.c | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 78f1809a4ad6..a6872537724d 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -597,6 +597,7 @@ int snd_hdac_stream_get_spbmaxfifo(struct hdac_bus *bus,
 				   struct hdac_stream *azx_dev);
 void snd_hdac_stream_drsm_enable(struct hdac_bus *bus,
 				 bool enable, int index);
+int snd_hdac_stream_wait_drsm(struct hdac_stream *azx_dev);
 int snd_hdac_stream_set_dpibr(struct hdac_bus *bus,
 			      struct hdac_stream *azx_dev, u32 value);
 int snd_hdac_stream_set_lpib(struct hdac_stream *azx_dev, u32 value);
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 35fe2bd582ac..3b250ee7f6a7 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -821,6 +821,28 @@ void snd_hdac_stream_drsm_enable(struct hdac_bus *bus,
 }
 EXPORT_SYMBOL_GPL(snd_hdac_stream_drsm_enable);
 
+/*
+ * snd_hdac_stream_wait_drsm - wait for HW to clear RSM for a stream
+ * @azx_dev: HD-audio core stream to await RSM for
+ *
+ * Returns 0 on success and -ETIMEDOUT upon a timeout.
+ */
+int snd_hdac_stream_wait_drsm(struct hdac_stream *azx_dev)
+{
+	struct hdac_bus *bus = azx_dev->bus;
+	u32 mask, reg;
+	int ret;
+
+	mask = 1 << azx_dev->index;
+
+	ret = read_poll_timeout(snd_hdac_reg_readl, reg, !(reg & mask), 250, 2000, false, bus,
+				bus->drsmcap + AZX_REG_DRSM_CTL);
+	if (ret)
+		dev_dbg(bus->dev, "polling RSM 0x%08x failed: %d\n", mask, ret);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_hdac_stream_wait_drsm);
+
 /**
  * snd_hdac_stream_set_dpibr - sets the dpibr value of a stream
  * @bus: HD-audio core bus
-- 
2.25.1

