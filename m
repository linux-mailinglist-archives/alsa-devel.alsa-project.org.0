Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5750260EAE
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 11:31:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 333FB1769;
	Tue,  8 Sep 2020 11:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 333FB1769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599557502;
	bh=rUMpF/UrCU6yHq4jeqQRlYrDkp7apuqtNv6I1vftYL4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PAELEW2iSLtU2/DmHGmqIs08aPlrl0Yh9c28c+GKeRvMV4sUiz75/wJAGD4fsH7Fm
	 hX6s/YwBh5rQrdRkhUyMf539DAnJtRd5FhfxUpUG0rvSJeZIdnXXy6qNvBY+ohI9sL
	 iTQGW+qIuOH/lguMyfRjXLm3lFuuZUYQlP8dufT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48625F8026F;
	Tue,  8 Sep 2020 11:30:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90D59F80264; Tue,  8 Sep 2020 11:29:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3493BF8010B
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 11:29:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3493BF8010B
IronPort-SDR: epM330XpgkBRjwvmxlo7yTOOePx4LCrhEqmqd7Q0AuVBjrcHeww+MgF8xTLkXJsSTlsaRzEsPh
 vDN4alM6A6Xw==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="219659860"
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; d="scan'208";a="219659860"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 02:29:51 -0700
IronPort-SDR: J4QqKj9DvL3KzutUnSUwOZoHjZ2HRP/i71biTwTLR6hIpeH31KaMqhJbNZ54SrSx1QvxO3frNp
 Jvduf4KtPLQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; d="scan'208";a="317130449"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 08 Sep 2020 02:29:49 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/2] ASoC: SOF: Implement snd_sof_bytes_ext_volatile_get
 kcontrol IO
Date: Tue,  8 Sep 2020 12:28:25 +0300
Message-Id: <20200908092825.1813847-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908092825.1813847-1-kai.vehmanen@linux.intel.com>
References: <20200908092825.1813847-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Dharageswari R <dharageswari.r@intel.com>, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

From: Dharageswari R <dharageswari.r@intel.com>

This patch implements the snd_sof_bytes_ext_volatile_get() to read the
actual parameters from DSP by sending the SOF_IPC_COMP_GET_DATA IPC
for the kcontrol of type SOF_TPLG_KCTL_BYTES_VOLATILE_RO.

Signed-off-by: Dharageswari R <dharageswari.r@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h |  3 ++
 sound/soc/sof/control.c         | 58 +++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-audio.h       |  2 ++
 sound/soc/sof/topology.c        |  1 +
 4 files changed, 64 insertions(+)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index d3aae4ad8959..a642bf30c027 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -24,6 +24,9 @@
 #define SOF_TPLG_KCTL_ENUM_ID	257
 #define SOF_TPLG_KCTL_BYTES_ID	258
 #define SOF_TPLG_KCTL_SWITCH_ID	259
+#define SOF_TPLG_KCTL_BYTES_VOLATILE_RO 260
+#define SOF_TPLG_KCTL_BYTES_VOLATILE_RW 261
+#define SOF_TPLG_KCTL_BYTES_WO_ID 262
 
 /*
  * Tokens - must match values in topology configurations
diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 186eea105bb1..d5e2966cafac 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -353,6 +353,64 @@ int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int __user *binary_data,
+				   unsigned int size)
+{
+	struct soc_bytes_ext *be = (struct soc_bytes_ext *)kcontrol->private_value;
+	struct snd_sof_control *scontrol = be->dobj.private;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
+	struct snd_ctl_tlv header;
+	struct snd_ctl_tlv __user *tlvd = (struct snd_ctl_tlv __user *)binary_data;
+	size_t data_size;
+	int ret;
+	int err;
+
+	ret = pm_runtime_get_sync(scomp->dev);
+	if (ret < 0) {
+		dev_err_ratelimited(scomp->dev, "error: bytes_ext get failed to resume %d\n", ret);
+		pm_runtime_put_noidle(scomp->dev);
+		return ret;
+	}
+
+	/* set the ABI header values */
+	cdata->data->magic = SOF_ABI_MAGIC;
+	cdata->data->abi = SOF_ABI_VERSION;
+	/* get all the component data from DSP */
+	ret = snd_sof_ipc_set_get_comp_data(scontrol, SOF_IPC_COMP_GET_DATA, SOF_CTRL_TYPE_DATA_GET,
+					    scontrol->cmd, false);
+	if (ret < 0)
+		goto out;
+
+	/* check data size doesn't exceed max coming from topology */
+	if (cdata->data->size > be->max - sizeof(const struct sof_abi_hdr)) {
+		dev_err_ratelimited(scomp->dev, "error: user data size %d exceeds max size %zu.\n",
+				    cdata->data->size,
+				    be->max - sizeof(const struct sof_abi_hdr));
+		ret = -EINVAL;
+		goto out;
+	}
+
+	data_size = cdata->data->size + sizeof(const struct sof_abi_hdr);
+
+	header.numid = scontrol->cmd;
+	header.length = data_size;
+	if (copy_to_user(tlvd, &header, sizeof(const struct snd_ctl_tlv))) {
+		ret = -EFAULT;
+		goto out;
+	}
+
+	if (copy_to_user(tlvd->tlv, cdata->data, data_size))
+		ret = -EFAULT;
+out:
+	pm_runtime_mark_last_busy(scomp->dev);
+	err = pm_runtime_put_autosuspend(scomp->dev);
+	if (err < 0)
+		dev_err_ratelimited(scomp->dev, "error: bytes_ext get failed to idle %d\n", err);
+
+	return ret;
+}
+
 int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 			  unsigned int __user *binary_data,
 			  unsigned int size)
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 196cbd322893..9f645a2e5a6c 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -142,6 +142,8 @@ int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
 int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 			  unsigned int __user *binary_data,
 			  unsigned int size);
+int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int __user *binary_data,
+				   unsigned int size);
 
 /*
  * Topology.
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 49fae48961a9..d5efac3af5c2 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3688,6 +3688,7 @@ static const struct snd_soc_tplg_kcontrol_ops sof_io_ops[] = {
 /* vendor specific bytes ext handlers available for binding */
 static const struct snd_soc_tplg_bytes_ext_ops sof_bytes_ext_ops[] = {
 	{SOF_TPLG_KCTL_BYTES_ID, snd_sof_bytes_ext_get, snd_sof_bytes_ext_put},
+	{SOF_TPLG_KCTL_BYTES_VOLATILE_RO, snd_sof_bytes_ext_volatile_get},
 };
 
 static struct snd_soc_tplg_ops sof_tplg_ops = {
-- 
2.27.0

