Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01572673CEC
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 16:00:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AD898105;
	Thu, 19 Jan 2023 15:59:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AD898105
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674140404;
	bh=boM4cmue1uj58z66B6DezklFmUMby192uu663OwNXPM=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=RkEuBwZyDcfMczNn7e8nevCblSbsK8zJgdryhOHslpJlFCwFXVrdzDB4WX8wxI1Fk
	 4UD7aH9+eviNYjcBBFLfa8Tub4QKxlnA8hyaUwNu7zUHELuxf9a9zro7vnmwNEPIlt
	 kH6/dfe5MCtckWatpcDDwryqrggkR8VFgHq3LSU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34B92F80083;
	Thu, 19 Jan 2023 15:59:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCC7CF8047B; Thu, 19 Jan 2023 15:59:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83F66F80083;
 Thu, 19 Jan 2023 15:59:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83F66F80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=E4CL3cMJ
Received: by mail-wr1-x42e.google.com with SMTP id r30so2123326wrr.10;
 Thu, 19 Jan 2023 06:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zeSo479aaLA6kL8tn8UanXNmZTCXn/cBCHHp7Ac4Plk=;
 b=E4CL3cMJbTQn/4jCGD2NErULuFbcMqGoU8lOD63wkMHbFNR6PJHfCg5BRodSR/HqAO
 pNwPdMjVqLz6Iq6gwz+jxUqHC2hYmkqkpigWOlkdo2EDFbVM77iDV8VUhByACPKd51yC
 8WHmaSdijIPtA6ScYtqbUCDzglt29f6/D7rai/yXCxqImbymVWnWVaMUcY0veLRXBKEi
 ZARnXKhL/r+zvPasKLYsV9ciywDimmObL45SI7RMFZ26jW1FlP5Id35Qe07LzZ25VM8f
 WGwAhzfRWCCd1o4aS74WTxP+grnzvOb+TElrPqH8nwT5jPdOJeKiVZFGK1YVfmNhWSdy
 GWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zeSo479aaLA6kL8tn8UanXNmZTCXn/cBCHHp7Ac4Plk=;
 b=HSjChgxZ8v0evdg+69wowveDCjcvU2AQVig1nRv734or9dbEhc5CUB0t4VePgW2ibN
 g6BsPaTfXAUSWazUfEGOQ2v1MONn4bGG7KR4BPSY2jvAA733SoWSzvzl9qPgjXOsLqAk
 jP6h4cHa1btivw7jVcOWWaQMrdIn8wpapUzHjTz1M3SJrEEyD1SD7LOMnC6Bvr1nLR5P
 m/qAurTRAeeOmqEheGAP/2wAQlbMTZFte8Bg3JNKzdMHSnrjSDOTidH7TnZrn2o0sb+F
 nTBNLCt92j99zva7N8YBSLtxXhNuX8sErJrEFldhgv4ikwm9CS09CyYrBtHlUeYQzWic
 M4JQ==
X-Gm-Message-State: AFqh2krEyq0eG7DiE54xA4vXXAB0bwcV6Rr4xpxV29137xJ8tvT9TpXq
 YlzKI8vdnilxw8F1nqR/3lc=
X-Google-Smtp-Source: AMrXdXtwuzhrzGcAP0ov6XDynEGu+oSos0PCiHvnjev/qU6pqPnvDrhGA79w15wZzDKDu2lNMJNG1g==
X-Received: by 2002:a5d:4e0d:0:b0:2bd:e03b:1203 with SMTP id
 p13-20020a5d4e0d000000b002bde03b1203mr18890930wrt.57.1674140338771; 
 Thu, 19 Jan 2023 06:58:58 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 t10-20020a5d534a000000b00272c0767b4asm34444067wrv.109.2023.01.19.06.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 06:58:58 -0800 (PST)
Date: Thu, 19 Jan 2023 17:58:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: [PATCH] ASoC: SOF: ipc4-mtrace: prevent underflow in
 sof_ipc4_priority_mask_dfs_write()
Message-ID: <Y8laruWOEwOC/dx9@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, cip-dev <cip-dev@lists.cip-project.org>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The "id" comes from the user.  Change the type to unsigned to prevent
an array underflow.

Fixes: f4ea22f7aa75 ("ASoC: SOF: ipc4: Add support for mtrace log extraction")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 sound/soc/sof/ipc4-mtrace.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-mtrace.c b/sound/soc/sof/ipc4-mtrace.c
index 70dea8ae706e..0ec6ef681012 100644
--- a/sound/soc/sof/ipc4-mtrace.c
+++ b/sound/soc/sof/ipc4-mtrace.c
@@ -344,9 +344,10 @@ static ssize_t sof_ipc4_priority_mask_dfs_write(struct file *file,
 						size_t count, loff_t *ppos)
 {
 	struct sof_mtrace_priv *priv = file->private_data;
-	int id, ret;
+	unsigned int id;
 	char *buf;
 	u32 mask;
+	int ret;
 
 	/*
 	 * To update Nth mask entry, write:
@@ -357,9 +358,9 @@ static ssize_t sof_ipc4_priority_mask_dfs_write(struct file *file,
 	if (IS_ERR(buf))
 		return PTR_ERR(buf);
 
-	ret = sscanf(buf, "%d,0x%x", &id, &mask);
+	ret = sscanf(buf, "%u,0x%x", &id, &mask);
 	if (ret != 2) {
-		ret = sscanf(buf, "%d,%x", &id, &mask);
+		ret = sscanf(buf, "%u,%x", &id, &mask);
 		if (ret != 2) {
 			ret = -EINVAL;
 			goto out;
-- 
2.35.1

