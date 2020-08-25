Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56449252494
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 02:02:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 017F8170D;
	Wed, 26 Aug 2020 02:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 017F8170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598400156;
	bh=RHveC5E5Ro187AuwzJnnNxAmWnDNfZ2k1smkOEHgVis=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sNeFr7rPQhQpMKkizsryoVhd/dLUXDuSQUtLKPg6UT9ZYyKtaEBuEizsNc+deL2WF
	 +mL7Omj9vjb/a2wZlopIpi5ikUsaJjBuz9lrW6XDnpuWGnc6ruPgHyJOkBqMe7S7J4
	 aMuJFI8r8UJNhFvvQnM/bAaf+SRaQysXRFLcH05g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D82CFF802D2;
	Wed, 26 Aug 2020 01:59:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEC00F802C3; Wed, 26 Aug 2020 01:59:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3A09F80260
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 01:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3A09F80260
IronPort-SDR: 8FkNFVQeRQUlc1LX89/tTXKF3uu+6JEVFVGSkCTcSBJel8E8gxKiC6RqK3gpHtJkYexSwNq6xP
 5hnKiLZUi8Dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="135764555"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="135764555"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:59:05 -0700
IronPort-SDR: 9L2tnrEXUzyu09r2FmQ+xE9e1J8A1jo3Z+FZzlG65Wx6IRqLRSKIojc2EhFQTPQlPp3j5RXk4t
 KG0IPdH4CXcA==
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="474558915"
Received: from cdurvasu-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.42.42])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:59:05 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: SOF: loader: Add debug box region
Date: Tue, 25 Aug 2020 16:58:54 -0700
Message-Id: <20200825235854.1588034-5-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825235854.1588034-1-ranjani.sridharan@linux.intel.com>
References: <20200825235854.1588034-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Daniel Baluta <daniel.baluta@gmail.com>, broonie@kernel.org,
 Iulian Olaru <iulianolaru249@yahoo.com>,
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

From: Iulian Olaru <iulianolaru249@yahoo.com>

This patch adds an IPC initiated debug box region in the snd_sof_dev
structure, defined in soc/sof/sof-priv.h. It is initialized at loading,
in the sof_get_windows function from soc/sof/loader.c, in a similar manner
with the stream box and host box.

This region is useful because the firmware will put an error message
here so the kernel can read it in case of a dsp oops.

Signed-off-by: Iulian Olaru <iulianolaru249@yahoo.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/loader.c   | 9 +++++++++
 sound/soc/sof/sof-priv.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index b8e72084dfeb..68ed454f7ddf 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -310,6 +310,8 @@ static void sof_get_windows(struct snd_sof_dev *sdev)
 	u32 outbox_size = 0;
 	u32 stream_size = 0;
 	u32 inbox_size = 0;
+	u32 debug_size = 0;
+	u32 debug_offset = 0;
 	int window_offset;
 	int bar;
 	int i;
@@ -363,6 +365,8 @@ static void sof_get_windows(struct snd_sof_dev *sdev)
 						SOF_DEBUGFS_ACCESS_D0_ONLY);
 			break;
 		case SOF_IPC_REGION_DEBUG:
+			debug_offset = window_offset + elem->offset;
+			debug_size = elem->size;
 			snd_sof_debugfs_io_item(sdev,
 						sdev->bar[bar] +
 						window_offset +
@@ -412,12 +416,17 @@ static void sof_get_windows(struct snd_sof_dev *sdev)
 	sdev->stream_box.offset = stream_offset;
 	sdev->stream_box.size = stream_size;
 
+	sdev->debug_box.offset = debug_offset;
+	sdev->debug_box.size = debug_size;
+
 	dev_dbg(sdev->dev, " mailbox upstream 0x%x - size 0x%x\n",
 		inbox_offset, inbox_size);
 	dev_dbg(sdev->dev, " mailbox downstream 0x%x - size 0x%x\n",
 		outbox_offset, outbox_size);
 	dev_dbg(sdev->dev, " stream region 0x%x - size 0x%x\n",
 		stream_offset, stream_size);
+	dev_dbg(sdev->dev, " debug region 0x%x - size 0x%x\n",
+		debug_offset, debug_size);
 }
 
 /* check for ABI compatibility and create memory windows on first boot */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index e2070072791c..53d26be88f64 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -383,6 +383,7 @@ struct snd_sof_dev {
 	struct snd_sof_mailbox dsp_box;		/* DSP initiated IPC */
 	struct snd_sof_mailbox host_box;	/* Host initiated IPC */
 	struct snd_sof_mailbox stream_box;	/* Stream position update */
+	struct snd_sof_mailbox debug_box;	/* Debug info updates */
 	struct snd_sof_ipc_msg *msg;
 	int ipc_irq;
 	u32 next_comp_id; /* monotonic - reset during S3 */
-- 
2.25.1

