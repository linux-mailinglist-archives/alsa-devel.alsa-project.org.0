Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B6747603D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 19:08:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DE171947;
	Wed, 15 Dec 2021 19:07:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DE171947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639591682;
	bh=qJREh0NSSUxHfI5+Ndul/GFoZR2ecW73FdQySh5OER4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nuUINaEeMxaGoybObezht0qJvzpYu0r0b8GwrCIsaaxXvhLkQsFChfXFXUl+Wwmvp
	 ic2HkZjnblmcWn/TR/R+2vZ2BM86gsuJksEepwmcZDZtxwsdDudlzWVU5ZYNK8QCDb
	 be3+45baN9qpLgsavzgx6OBssiufnVs8CjBmMFFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D2F1F8014C;
	Wed, 15 Dec 2021 19:06:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3A28F80236; Wed, 15 Dec 2021 19:06:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B53C2F800B0
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 19:06:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B53C2F800B0
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239519999"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="239519999"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 10:04:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="662015057"
Received: from manamie-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.37.3])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 10:04:13 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/8] ASoC: SOF: sof-audio: Drop the `cmd` member from struct
 snd_sof_control
Date: Wed, 15 Dec 2021 10:04:01 -0800
Message-Id: <20211215180404.53254-6-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215180404.53254-1-ranjani.sridharan@linux.intel.com>
References: <20211215180404.53254-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

There is no need to use two variables to store and check the same
information, the scontrol->cmd is the same as scontrol->control_data->cmd.

Drop the former one and when it is needed, access the cmd from the
control_data.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/control.c   |  6 +++---
 sound/soc/sof/sof-audio.c |  2 +-
 sound/soc/sof/sof-audio.h |  1 -
 sound/soc/sof/topology.c  | 14 +++++---------
 4 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 23a916ea93f8..9297b29d65cd 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -372,7 +372,7 @@ int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
 	}
 
 	/* Check that header id matches the command */
-	if (header.numid != scontrol->cmd) {
+	if (header.numid != cdata->cmd) {
 		dev_err_ratelimited(scomp->dev,
 				    "error: incorrect numid %d\n",
 				    header.numid);
@@ -462,7 +462,7 @@ int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int _
 		goto out;
 	}
 
-	header.numid = scontrol->cmd;
+	header.numid = cdata->cmd;
 	header.length = data_size;
 	if (copy_to_user(tlvd, &header, sizeof(struct snd_ctl_tlv))) {
 		ret = -EFAULT;
@@ -522,7 +522,7 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 	if (data_size > size)
 		return -ENOSPC;
 
-	header.numid = scontrol->cmd;
+	header.numid = cdata->cmd;
 	header.length = data_size;
 	if (copy_to_user(tlvd, &header, sizeof(struct snd_ctl_tlv)))
 		return -EFAULT;
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 269eca26eab9..4530c6ed34e0 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -21,7 +21,7 @@ static int sof_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_control *
 	scontrol->readback_offset = 0;
 
 	/* notify DSP of kcontrol values */
-	switch (scontrol->cmd) {
+	switch (scontrol->control_data->cmd) {
 	case SOF_CTRL_CMD_VOLUME:
 	case SOF_CTRL_CMD_ENUM:
 	case SOF_CTRL_CMD_SWITCH:
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 5bcc842e4792..84a8ebe3b1c3 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -74,7 +74,6 @@ struct snd_sof_control {
 	u32 readback_offset; /* offset to mmapped data if used */
 	struct sof_ipc_ctrl_data *control_data;
 	u32 size;	/* cdata size */
-	enum sof_ipc_ctrl_cmd cmd;
 	u32 *volume_table; /* volume table computed from tlv data*/
 
 	struct list_head list;	/* list in sdev control list */
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index c440e1c53ca5..ec59baf32699 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1090,13 +1090,11 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 
 	/* set cmd for mixer control */
 	if (le32_to_cpu(mc->max) == 1) {
-		scontrol->cmd = SOF_CTRL_CMD_SWITCH;
-		scontrol->control_data->cmd = scontrol->cmd;
+		scontrol->control_data->cmd = SOF_CTRL_CMD_SWITCH;
 		goto skip;
 	}
 
-	scontrol->cmd = SOF_CTRL_CMD_VOLUME;
-	scontrol->control_data->cmd = scontrol->cmd;
+	scontrol->control_data->cmd = SOF_CTRL_CMD_VOLUME;
 
 	/* extract tlv data */
 	if (!kc->tlv.p || get_tlv_data(kc->tlv.p, tlv) < 0) {
@@ -1167,8 +1165,7 @@ static int sof_control_load_enum(struct snd_soc_component *scomp,
 	scontrol->comp_id = sdev->next_comp_id;
 	scontrol->num_channels = le32_to_cpu(ec->num_channels);
 	scontrol->control_data->index = kc->index;
-	scontrol->cmd = SOF_CTRL_CMD_ENUM;
-	scontrol->control_data->cmd = scontrol->cmd;
+	scontrol->control_data->cmd = SOF_CTRL_CMD_ENUM;
 
 	dev_dbg(scomp->dev, "tplg: load kcontrol index %d chans %d comp_id %d\n",
 		scontrol->comp_id, scontrol->num_channels, scontrol->comp_id);
@@ -1214,8 +1211,7 @@ static int sof_control_load_bytes(struct snd_soc_component *scomp,
 	}
 
 	scontrol->comp_id = sdev->next_comp_id;
-	scontrol->cmd = SOF_CTRL_CMD_BINARY;
-	scontrol->control_data->cmd = scontrol->cmd;
+	scontrol->control_data->cmd = SOF_CTRL_CMD_BINARY;
 	scontrol->control_data->index = kc->index;
 
 	dev_dbg(scomp->dev, "tplg: load kcontrol index %d chans %d\n",
@@ -2080,7 +2076,7 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
 		*size += wdata[i].pdata->size;
 
 		/* get data type */
-		switch (wdata[i].control->cmd) {
+		switch (wdata[i].control->control_data->cmd) {
 		case SOF_CTRL_CMD_VOLUME:
 		case SOF_CTRL_CMD_ENUM:
 		case SOF_CTRL_CMD_SWITCH:
-- 
2.25.1

