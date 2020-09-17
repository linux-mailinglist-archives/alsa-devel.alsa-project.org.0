Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DB326D9CA
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 13:04:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 703B91658;
	Thu, 17 Sep 2020 13:03:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 703B91658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600340645;
	bh=LnSlwJ4/PVuAwgycsfTe0sGs5HHPy8fg3SoOapHTVQU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=InNsN1GgDt2S8B6OVNmvrdpa/C7p+NhkxwlfkqUnYPHELbbRbzB0gV6I7T7qPtyds
	 6hotkiRN7cIzFYC25CLH4Jc92lBGJHJCp7hr/I2i0SdWtX25+hbVYMJul7PEUNKp92
	 pigSW6K6weIpQBoSoNe+TUECNiO58zbgNvDxnmZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9DDCF80306;
	Thu, 17 Sep 2020 12:58:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0656FF802FB; Thu, 17 Sep 2020 12:58:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 763D6F802D2
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 12:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 763D6F802D2
IronPort-SDR: dIoxEo9AGgW39FpZPoyhZIXuVA8BgcGT8VV1SU2CkJ9WLlxBymYzCN/LjlcB3K4XJMdG6+ApWD
 f/Xs1MuOsPvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="157075366"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="157075366"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 03:58:18 -0700
IronPort-SDR: o/YKCAJ9ylE9zO2YyEvLh6x4y2Xa3cis7akpj2I7ReL6EjYHUq7ZybAlhyiTPl/A44K5AVxFxa
 Lmop1DzVymKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="320177360"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 17 Sep 2020 03:58:15 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 7/8] ASoC: SOF: fix range checks
Date: Thu, 17 Sep 2020 13:56:32 +0300
Message-Id: <20200917105633.2579047-8-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200917105633.2579047-1-kai.vehmanen@linux.intel.com>
References: <20200917105633.2579047-1-kai.vehmanen@linux.intel.com>
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

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

On multiple locations checks are performed of untrusted values after adding
a constant to them. This is wrong, because the addition might overflow and
the result can then pass the check, although the original value is invalid.
Fix multiple such issues by checking the actual value and not a sum of it
and a constant.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/control.c  | 38 ++++++++++++++++++++++----------------
 sound/soc/sof/topology.c | 20 +++++++++++++-------
 2 files changed, 35 insertions(+), 23 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 63ead9ebc4c6..58f8c998e6af 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -229,14 +229,16 @@ int snd_sof_bytes_get(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	size = data->size + sizeof(*data);
-	if (size > be->max) {
+	/* be->max has been verified to be >= sizeof(struct sof_abi_hdr) */
+	if (data->size > be->max - sizeof(*data)) {
 		dev_err_ratelimited(scomp->dev,
-				    "error: DSP sent %zu bytes max is %d\n",
-				    size, be->max);
+				    "error: %u bytes of control data is invalid, max is %zu\n",
+				    data->size, be->max - sizeof(*data));
 		return -EINVAL;
 	}
 
+	size = data->size + sizeof(*data);
+
 	/* copy back to kcontrol */
 	memcpy(ucontrol->value.bytes.data, data, size);
 
@@ -252,7 +254,7 @@ int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	struct sof_abi_hdr *data = cdata->data;
-	size_t size = data->size + sizeof(*data);
+	size_t size;
 
 	if (be->max > sizeof(ucontrol->value.bytes.data)) {
 		dev_err_ratelimited(scomp->dev,
@@ -261,13 +263,16 @@ int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	if (size > be->max) {
+	/* be->max has been verified to be >= sizeof(struct sof_abi_hdr) */
+	if (data->size > be->max - sizeof(*data)) {
 		dev_err_ratelimited(scomp->dev,
-				    "error: size too big %zu bytes max is %d\n",
-				    size, be->max);
+				    "error: data size too big %u bytes max is %zu\n",
+				    data->size, be->max - sizeof(*data));
 		return -EINVAL;
 	}
 
+	size = data->size + sizeof(*data);
+
 	/* copy from kcontrol */
 	memcpy(data, ucontrol->value.bytes.data, size);
 
@@ -334,7 +339,8 @@ int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	if (cdata->data->size + sizeof(const struct sof_abi_hdr) > be->max) {
+	/* be->max has been verified to be >= sizeof(struct sof_abi_hdr) */
+	if (cdata->data->size > be->max - sizeof(const struct sof_abi_hdr)) {
 		dev_err_ratelimited(scomp->dev, "error: Mismatch in ABI data size (truncated?).\n");
 		return -EINVAL;
 	}
@@ -420,7 +426,7 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_tlv header;
 	struct snd_ctl_tlv __user *tlvd =
 		(struct snd_ctl_tlv __user *)binary_data;
-	int data_size;
+	size_t data_size;
 
 	/*
 	 * Decrement the limit by ext bytes header size to
@@ -432,16 +438,16 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 	cdata->data->magic = SOF_ABI_MAGIC;
 	cdata->data->abi = SOF_ABI_VERSION;
 
-	/* Prevent read of other kernel data or possibly corrupt response */
-	data_size = cdata->data->size + sizeof(const struct sof_abi_hdr);
-
 	/* check data size doesn't exceed max coming from topology */
-	if (data_size > be->max) {
-		dev_err_ratelimited(scomp->dev, "error: user data size %d exceeds max size %d.\n",
-				    data_size, be->max);
+	if (cdata->data->size > be->max - sizeof(const struct sof_abi_hdr)) {
+		dev_err_ratelimited(scomp->dev, "error: user data size %d exceeds max size %zu.\n",
+				    cdata->data->size,
+				    be->max - sizeof(const struct sof_abi_hdr));
 		return -EINVAL;
 	}
 
+	data_size = cdata->data->size + sizeof(const struct sof_abi_hdr);
+
 	header.numid = scontrol->cmd;
 	header.length = data_size;
 	if (copy_to_user(tlvd, &header, sizeof(const struct snd_ctl_tlv)))
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index fa85a22b5880..eaa1122d5a68 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1150,20 +1150,26 @@ static int sof_control_load_bytes(struct snd_soc_component *scomp,
 	struct snd_soc_tplg_bytes_control *control =
 		container_of(hdr, struct snd_soc_tplg_bytes_control, hdr);
 	struct soc_bytes_ext *sbe = (struct soc_bytes_ext *)kc->private_value;
-	int max_size = sbe->max;
+	size_t max_size = sbe->max;
+	size_t priv_size = le32_to_cpu(control->priv.size);
 	int ret;
 
-	/* init the get/put bytes data */
-	scontrol->size = sizeof(struct sof_ipc_ctrl_data) +
-		le32_to_cpu(control->priv.size);
+	if (max_size < sizeof(struct sof_ipc_ctrl_data) ||
+	    max_size < sizeof(struct sof_abi_hdr)) {
+		ret = -EINVAL;
+		goto out;
+	}
 
-	if (scontrol->size > max_size) {
-		dev_err(scomp->dev, "err: bytes data size %d exceeds max %d.\n",
-			scontrol->size, max_size);
+	/* init the get/put bytes data */
+	if (priv_size > max_size - sizeof(struct sof_ipc_ctrl_data)) {
+		dev_err(scomp->dev, "err: bytes data size %zu exceeds max %zu.\n",
+			priv_size, max_size - sizeof(struct sof_ipc_ctrl_data));
 		ret = -EINVAL;
 		goto out;
 	}
 
+	scontrol->size = sizeof(struct sof_ipc_ctrl_data) + priv_size;
+
 	scontrol->control_data = kzalloc(max_size, GFP_KERNEL);
 	cdata = scontrol->control_data;
 	if (!scontrol->control_data) {
-- 
2.27.0

