Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2D260B322
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 18:56:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 611BA51C8;
	Mon, 24 Oct 2022 18:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 611BA51C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666630591;
	bh=w9swYIkXNkBZZfU2ZBWl9Z1WnGYvpxxdRvAvou0740A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dzXo+tBQxeGJmN7Bfypr4lo+AZ1MfnBWZU84wCFgdoBPAxQxAqXgibpDB9+zJ5Is2
	 oJ6aUVMW+sQpti0Ad9auNjGXL/0eAIiVMrkSAGww/EmGQMDYPNFBe0va4ro0nNweN7
	 SXa5+r58aHvS778zNVjaCrZU5nKqov4Pd/BT7FIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8568F8055B;
	Mon, 24 Oct 2022 18:53:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70D90F8057E; Mon, 24 Oct 2022 18:53:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33AD3F80431
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 18:53:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33AD3F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Iw4VrSMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666630408; x=1698166408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w9swYIkXNkBZZfU2ZBWl9Z1WnGYvpxxdRvAvou0740A=;
 b=Iw4VrSMRH76kSCII5mbWKxzJGX1Y3HxHRH1BX+Ry3IvyrJ/golOrf1es
 0Ya2RVylYL8w7UhwEdm+DWd5/Og2xH4Ws5EVzXDQDIn1w3YBsyfpYWB/T
 Mn54pipLEt/1e71pFxwhjrH3Ir2nmqEJHicx7QQlxlYzGwzweWOBaAbot
 nyYLfWzA1uQm9RqiHqQenZFUrFahxwGjGvbCl+SW9gjELeq63sXijmsfO
 O/SD2cnMdJSqu+lo7nXcmrNRGodLHKa642EQL962/qcUnch6HmnCVgEY3
 gBqk/1xb8syFhyznIxAjHEWqoxSDjiVJIp+JBwotnM+GMTjDpnNtAGY32 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287868622"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="287868622"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:24 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609263050"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="609263050"
Received: from tdsilva-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.186.236])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/16] ASoC: SOF: ops: add readb/writeb helpers
Date: Mon, 24 Oct 2022 11:52:57 -0500
Message-Id: <20221024165310.246183-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
References: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

These will be used to add more consistency in the SOF core and
drivers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ops.h      | 18 ++++++++++++++++++
 sound/soc/sof/sof-priv.h |  4 ++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index a72f8043be64d..511c798eb1ebb 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -302,6 +302,15 @@ static inline int snd_sof_debugfs_add_region_item(struct snd_sof_dev *sdev,
 }
 
 /* register IO */
+static inline void snd_sof_dsp_writeb(struct snd_sof_dev *sdev, u32 bar,
+				      u32 offset, u8 value)
+{
+	if (sof_ops(sdev)->writeb)
+		sof_ops(sdev)->writeb(sdev, sdev->bar[bar] + offset, value);
+	else
+		writeb(value,  sdev->bar[bar] + offset);
+}
+
 static inline void snd_sof_dsp_write(struct snd_sof_dev *sdev, u32 bar,
 				     u32 offset, u32 value)
 {
@@ -320,6 +329,15 @@ static inline void snd_sof_dsp_write64(struct snd_sof_dev *sdev, u32 bar,
 		writeq(value, sdev->bar[bar] + offset);
 }
 
+static inline u8 snd_sof_dsp_readb(struct snd_sof_dev *sdev, u32 bar,
+				   u32 offset)
+{
+	if (sof_ops(sdev)->readb)
+		return sof_ops(sdev)->readb(sdev, sdev->bar[bar] + offset);
+	else
+		return readb(sdev->bar[bar] + offset);
+}
+
 static inline u32 snd_sof_dsp_read(struct snd_sof_dev *sdev, u32 bar,
 				   u32 offset)
 {
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 403e81220244a..d3ede97b67590 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -171,6 +171,10 @@ struct snd_sof_dsp_ops {
 	 * TODO: consider removing these operations and calling respective
 	 * implementations directly
 	 */
+	void (*writeb)(struct snd_sof_dev *sof_dev, void __iomem *addr,
+		       u8 value); /* optional */
+	u8 (*readb)(struct snd_sof_dev *sof_dev,
+		    void __iomem *addr); /* optional */
 	void (*write)(struct snd_sof_dev *sof_dev, void __iomem *addr,
 		      u32 value); /* optional */
 	u32 (*read)(struct snd_sof_dev *sof_dev,
-- 
2.34.1

