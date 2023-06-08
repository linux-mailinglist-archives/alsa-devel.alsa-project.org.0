Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6658728B0A
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 00:19:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F366020C;
	Fri,  9 Jun 2023 00:18:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F366020C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686262784;
	bh=qrONA1YvHRyjKpWYANRMf4h3hWq7juhzopMG9+uY5es=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=C2amioWQDW6O8k3R9BTT0xweA+nIa8Nmo+d3XUM0r72qEN3INo2Njvp3E1JTRcPrS
	 ukEKlmsSjjmPzYsB3JWZ0k3ChpTTUzmE9R6VYdrWykl6X+YZJnHO+SgjXNwy+gjbxL
	 aD4zKWqTrGv2FZjBuOG53hJhasFhVsZDWCzbklgU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64775F800ED; Fri,  9 Jun 2023 00:18:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03888F8016C;
	Fri,  9 Jun 2023 00:18:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36E30F80199; Fri,  9 Jun 2023 00:18:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23EB2F800C8
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 00:18:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23EB2F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=jOPcpthT
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-65292f79456so863958b3a.2
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Jun 2023 15:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686262711; x=1688854711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ky2eL8st8jozX37OGoV09JoInUi6PYM9R0069A5z+Ls=;
        b=jOPcpthTfIRnHGHXkFhKNnPavqy8zAmuywMkem/Pys0ZzvW5RqOuZcNXs0d8NjKdR9
         4eJKaBJmsZ3ozOLeUmlRYK+KN3qdBUUk7uF7KbhoQeJ+PMsSSu/Sntl0oxtISUDQlaiY
         XZS/hIWYMrERIDsOv55NQg8xoJqvxQ5VCmsa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686262711; x=1688854711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ky2eL8st8jozX37OGoV09JoInUi6PYM9R0069A5z+Ls=;
        b=Qj27XarbgXufp4BwJKG0QWYHrAgocIATjZg8RjPYNs9886BVkoXLMdcDJQtkp/AACY
         dlU1k5PdmYpUk3c+EqMjHFX7nOoKj0Zg7eedf42k2M8OOtAKMlBMRz+mz0zZvogBx0dF
         jmZCRP6u3q6Ch7RfJbDDQcKGyLRGS65LDIYCteZtxjrqB7VoP8XZM4dW3Y6vZDPwvS/D
         qzA5T31CQGwjrK10B/aNFyD2cqkZ5P7aBWX0IZbRG/XyezybBtNJN+JTY3UMYmgDNZys
         uU8o9y7yA0hC1tBytaMTTJLwQid7Be020rhiq1doDhRskw7NDklKq3G4dzgObigBEDoy
         7GLQ==
X-Gm-Message-State: AC+VfDybTzo7o0hulh+uAwXL0qi1j6Qw3k2U2DnNemFbAJ40NLBEkDkk
	iWa+chm9QXK7lx7i5xvmBzEkhOpedanMqdP8/w==
X-Google-Smtp-Source: 
 ACHHUZ4PPs1O96GAHFMhb80HHkCXgki5ykjUZmc30n2Lyn1Chk31gnpvAN/vqTXUB4lITNAgEfcWhQ==
X-Received: by 2002:a05:6a20:2d10:b0:107:1f22:10d5 with SMTP id
 g16-20020a056a202d1000b001071f2210d5mr4998085pzl.52.1686262710475;
        Thu, 08 Jun 2023 15:18:30 -0700 (PDT)
Received: from localhost ([2620:15c:9d:4:4e2b:3200:7e2c:cb0])
        by smtp.gmail.com with UTF8SMTPSA id
 m12-20020a63580c000000b0053b92b26412sm1667435pgb.14.2023.06.08.15.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 15:18:30 -0700 (PDT)
From: cujomalainey@chromium.org
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@chromium.org>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/2] ASoC: SOF: Refactor rx function for fuzzing
Date: Thu,  8 Jun 2023 15:18:15 -0700
Message-ID: <20230608221822.2825786-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RG26TJHUZH2GLNGULEOL4JC2SQZ6UESH
X-Message-ID-Hash: RG26TJHUZH2GLNGULEOL4JC2SQZ6UESH
X-MailFrom: cujomalainey@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RG26TJHUZH2GLNGULEOL4JC2SQZ6UESH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

Refactor the function so reading the data is done outside the work
function so fuzzing can pass data directly into the work callbacks.

Also expose the inner function outside the module so we can call it from
the injector.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc3-priv.h |  2 ++
 sound/soc/sof/ipc3.c      | 63 ++++++++++++++++++++++++---------------
 2 files changed, 41 insertions(+), 24 deletions(-)

diff --git a/sound/soc/sof/ipc3-priv.h b/sound/soc/sof/ipc3-priv.h
index f5044202f3c5a..0bbca418e67e6 100644
--- a/sound/soc/sof/ipc3-priv.h
+++ b/sound/soc/sof/ipc3-priv.h
@@ -28,6 +28,8 @@ int sof_ipc3_validate_fw_version(struct snd_sof_dev *sdev);
 /* dtrace position update */
 int ipc3_dtrace_posn_update(struct snd_sof_dev *sdev,
 			    struct sof_ipc_dma_trace_posn *posn);
+/* RX handler backend */
+void sof_ipc3_do_rx_work(struct snd_sof_dev *sdev, struct sof_ipc_cmd_hdr *hdr, void *msg_buf);
 
 /* dtrace platform callback wrappers */
 static inline int sof_dtrace_host_init(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index c677677420939..ec1ac0fb2d9f8 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -954,31 +954,21 @@ static void ipc3_trace_message(struct snd_sof_dev *sdev, void *msg_buf)
 	}
 }
 
-/* DSP firmware has sent host a message  */
-static void sof_ipc3_rx_msg(struct snd_sof_dev *sdev)
+void sof_ipc3_do_rx_work(struct snd_sof_dev *sdev, struct sof_ipc_cmd_hdr *hdr, void *msg_buf)
 {
 	ipc3_rx_callback rx_callback = NULL;
-	struct sof_ipc_cmd_hdr hdr;
-	void *msg_buf;
 	u32 cmd;
 	int err;
 
-	/* read back header */
-	err = snd_sof_ipc_msg_data(sdev, NULL, &hdr, sizeof(hdr));
-	if (err < 0) {
-		dev_warn(sdev->dev, "failed to read IPC header: %d\n", err);
-		return;
-	}
+	ipc3_log_header(sdev->dev, "ipc rx", hdr->cmd);
 
-	if (hdr.size < sizeof(hdr) || hdr.size > SOF_IPC_MSG_MAX_SIZE) {
+	if (hdr->size < sizeof(hdr) || hdr->size > SOF_IPC_MSG_MAX_SIZE) {
 		dev_err(sdev->dev, "The received message size is invalid: %u\n",
-			hdr.size);
+			hdr->size);
 		return;
 	}
 
-	ipc3_log_header(sdev->dev, "ipc rx", hdr.cmd);
-
-	cmd = hdr.cmd & SOF_GLB_TYPE_MASK;
+	cmd = hdr->cmd & SOF_GLB_TYPE_MASK;
 
 	/* check message type */
 	switch (cmd) {
@@ -1016,6 +1006,36 @@ static void sof_ipc3_rx_msg(struct snd_sof_dev *sdev)
 		break;
 	}
 
+	/* Call local handler for the message */
+	if (rx_callback)
+		rx_callback(sdev, msg_buf);
+
+	/* Notify registered clients */
+	sof_client_ipc_rx_dispatcher(sdev, msg_buf);
+
+	ipc3_log_header(sdev->dev, "ipc rx done", hdr->cmd);
+}
+EXPORT_SYMBOL(sof_ipc3_do_rx_work);
+
+/* DSP firmware has sent host a message  */
+static void sof_ipc3_rx_msg(struct snd_sof_dev *sdev)
+{
+	struct sof_ipc_cmd_hdr hdr;
+	void *msg_buf;
+	int err;
+
+	/* read back header */
+	err = snd_sof_ipc_msg_data(sdev, NULL, &hdr, sizeof(hdr));
+	if (err < 0) {
+		dev_warn(sdev->dev, "failed to read IPC header: %d\n", err);
+		return;
+	}
+
+	if (hdr.size < sizeof(hdr)) {
+		dev_err(sdev->dev, "The received message size is invalid\n");
+		return;
+	}
+
 	/* read the full message */
 	msg_buf = kmalloc(hdr.size, GFP_KERNEL);
 	if (!msg_buf)
@@ -1024,18 +1044,13 @@ static void sof_ipc3_rx_msg(struct snd_sof_dev *sdev)
 	err = snd_sof_ipc_msg_data(sdev, NULL, msg_buf, hdr.size);
 	if (err < 0) {
 		dev_err(sdev->dev, "%s: Failed to read message: %d\n", __func__, err);
-	} else {
-		/* Call local handler for the message */
-		if (rx_callback)
-			rx_callback(sdev, msg_buf);
-
-		/* Notify registered clients */
-		sof_client_ipc_rx_dispatcher(sdev, msg_buf);
+		kfree(msg_buf);
+		return;
 	}
 
-	kfree(msg_buf);
+	sof_ipc3_do_rx_work(sdev, &hdr, msg_buf);
 
-	ipc3_log_header(sdev->dev, "ipc rx done", hdr.cmd);
+	kfree(msg_buf);
 }
 
 static int sof_ipc3_set_core_state(struct snd_sof_dev *sdev, int core_idx, bool on)
-- 
2.41.0.162.gfafddb0af9-goog

