Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 387F24F3CCD
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 19:29:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D998B1849;
	Tue,  5 Apr 2022 19:28:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D998B1849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649179747;
	bh=IgMjHmbX6jfBmcN9SDjGhBEPdXA+FIK+IVVeKAEBUQU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PiPfrblNj1GXb/GcCWonvfIlUeIcCPDpbL9l8XvtrdbIfq8CR6TQ8J2P5+1B6zzYa
	 epQHz+O6xVOLrqr5FBoZkwkWj61Jrv99fivklDSG/wDQHNyaCEKDdLQNpYe82mZnxM
	 AI1grLG8BcyMjGZOCs3nMWY6SroMJ6ATEe1TymxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E2E8F8051D;
	Tue,  5 Apr 2022 19:27:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A21AF80519; Tue,  5 Apr 2022 19:27:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A80DF8012C
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 19:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A80DF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="J9pyYq7H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649179651; x=1680715651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IgMjHmbX6jfBmcN9SDjGhBEPdXA+FIK+IVVeKAEBUQU=;
 b=J9pyYq7HS46WH++q1SKP/NBFSro/3L2Icm3p/aKYU8qrNSdQAD2zV42f
 Ojp52JU9rijoQHp7xzG4MfcC9THTyMaFzYffcdjZTAnyVKIW2Hvl7Nj8X
 asrWvqrvmW916PGMpLV8bhsgSlaeMOLxr2/xk5KCy7jpm8Dr/OLJ8hcLj
 fOcomegKD/RNBntQFVogCMVNpEa263V/8PlWb/OgAi/FrvY7aKEgDal2W
 XTOD7f+zXoTZzu1gaZe37vMPsjNzeZep+51PSWfhBaUj81gVhrLeOnYkO
 v51Njuo53R9gaPvkGjhMNJ5IECxwgYKae2sA9FZREOf+pH7dMwW+gnbEf Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="323986722"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="323986722"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="722140952"
Received: from reginari-mobl7.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.131])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:22 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/15] ASoC: SOF: Add high level IPC IO callback definitions
 to ipc_ops
Date: Tue,  5 Apr 2022 10:26:55 -0700
Message-Id: <20220405172708.122168-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405172708.122168-1-ranjani.sridharan@linux.intel.com>
References: <20220405172708.122168-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Daniel Baluta <daniel.baluta@nxp.com>, broonie@kernel.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Add tx_msg(), rx_msg(), set_get_data() and get_reply() ops, which can
be used as a generic API for sending, receiving single messages and
to write and read large data.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index f6ae28a21482..2bf7844f01d7 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -377,11 +377,32 @@ struct sof_ipc_pcm_ops;
  * @tplg:	Pointer to IPC-specific topology ops
  * @pm:		Pointer to PM ops
  * @pcm:	Pointer to PCM ops
+ *
+ * @tx_msg:	Function pointer for sending a 'short' IPC message
+ * @set_get_data: Function pointer for set/get data ('large' IPC message). This
+ *		function may split up the 'large' message and use the @tx_msg
+ *		path to transfer individual chunks, or use other means to transfer
+ *		the message.
+ * @get_reply:	Function pointer for fetching the reply to
+ *		sdev->ipc->msg.reply_data
+ * @rx_msg:	Function pointer for handling a received message
+ *
+ * Note: both @tx_msg and @set_get_data considered as TX functions and they are
+ * serialized for the duration of the instructed transfer. A large message sent
+ * via @set_get_data is a single transfer even if at the hardware level it is
+ * handled with multiple chunks.
  */
 struct sof_ipc_ops {
 	const struct sof_ipc_tplg_ops *tplg;
 	const struct sof_ipc_pm_ops *pm;
 	const struct sof_ipc_pcm_ops *pcm;
+
+	int (*tx_msg)(struct snd_sof_dev *sdev, void *msg_data, size_t msg_bytes,
+		      void *reply_data, size_t reply_bytes, bool no_pm);
+	int (*set_get_data)(struct snd_sof_dev *sdev, void *data, size_t data_bytes,
+			    bool set);
+	int (*get_reply)(struct snd_sof_dev *sdev);
+	void (*rx_msg)(struct snd_sof_dev *sdev);
 };
 
 /* SOF generic IPC data */
-- 
2.25.1

