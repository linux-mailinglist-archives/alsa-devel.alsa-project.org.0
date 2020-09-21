Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D614D2721FA
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 13:12:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C29216DB;
	Mon, 21 Sep 2020 13:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C29216DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600686757;
	bh=Zm3DhQJkgHjhvrKc9kBrFWeRZ4JPOahs526urQOH4f0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sFqzq6TP2GkVxEpM4miHa1V0gtv6DDozLEkCrx3BKgZ7lt4k9t5OvJzz4D6M/coFI
	 nbhMHeQ2pBd00Uw008LjJT4vVS53/Ua0TD62wbM5fbrVDk0wFhY8NLT8uoAuRmG+Zu
	 kwvQjR7H35uR5a3ymhJQJFVJZGQ9TSDMur7H8Q5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9722F8020B;
	Mon, 21 Sep 2020 13:10:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1847F802C3; Mon, 21 Sep 2020 13:10:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09DA2F800B2
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 13:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09DA2F800B2
IronPort-SDR: LLdV/sd8Uyoabc/TTBtxvhPfXtm/7qPS2pLMiG71clMAFD/AvH1MHyHaOEnn7+4XMbziZJVXqZ
 pAVDwvl27p8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="148011236"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="148011236"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 04:10:00 -0700
IronPort-SDR: SRgBb0HDzT9yBsQcC55FazfzPQZNyDKQsb9EY4gX6XloeFWAEx1pFn8y5wON7hPVs7zJmfbFgY
 59oX2FniUskA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="321730229"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 21 Sep 2020 04:09:59 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/5] ASoC: SOF: control: add size checks for ext_bytes control
 .put()
Date: Mon, 21 Sep 2020 14:08:12 +0300
Message-Id: <20200921110814.2910477-4-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200921110814.2910477-1-kai.vehmanen@linux.intel.com>
References: <20200921110814.2910477-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Make sure the TLV header and size are consistent before copying from
userspace.

Fixes: c3078f5397046 ('ASoC: SOF: Add Sound Open Firmware KControl support')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/control.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 9465611156d5..0352d2b61358 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -300,6 +300,10 @@ int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
 	const struct snd_ctl_tlv __user *tlvd =
 		(const struct snd_ctl_tlv __user *)binary_data;
 
+	/* make sure we have at least a header */
+	if (size < sizeof(struct snd_ctl_tlv))
+		return -EINVAL;
+
 	/*
 	 * The beginning of bytes data contains a header from where
 	 * the length (as bytes) is needed to know the correct copy
@@ -308,6 +312,13 @@ int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
 	if (copy_from_user(&header, tlvd, sizeof(const struct snd_ctl_tlv)))
 		return -EFAULT;
 
+	/* make sure TLV info is consistent */
+	if (header.length + sizeof(struct snd_ctl_tlv) > size) {
+		dev_err_ratelimited(scomp->dev, "error: inconsistent TLV, data %d + header %zu > %d\n",
+				    header.length, sizeof(struct snd_ctl_tlv), size);
+		return -EINVAL;
+	}
+
 	/* be->max is coming from topology */
 	if (header.length > be->max) {
 		dev_err_ratelimited(scomp->dev, "error: Bytes data size %d exceeds max %d.\n",
-- 
2.27.0

