Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E4A6B7544
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 12:06:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D06C9148F;
	Mon, 13 Mar 2023 12:05:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D06C9148F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678705579;
	bh=PaZrZtWlkzJxawO1dITV7qlvYBknzDgGJ7kHMLhPzT8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XUNZ4EFWYqSsgtySSgZ5TexsoKYEVeyfzLbERDN89t1jSLThk93POkDTzQGTg04v9
	 7smwaVv6g3EdsqlFSyhAxihAXEx4e2xy/08VrD2OhRAa0qU+Cs3JmNcpwj12nNKRiO
	 Ix0cAfnKIlyIxob80etwuUeAO1diXCzC3nyjX5Q0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F42BF80558;
	Mon, 13 Mar 2023 12:03:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B12E4F8053B; Mon, 13 Mar 2023 12:03:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1525F80423
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 12:03:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1525F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HYgmkSVd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678705428; x=1710241428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PaZrZtWlkzJxawO1dITV7qlvYBknzDgGJ7kHMLhPzT8=;
  b=HYgmkSVdT2A7bWy/RZ/Td3vAuIRtgUHz8bawIfKTGcMM0UryCIGVstlR
   yTXhACfUAbUD7Jhf0AYEloMe3+dLVhkBnxYfcvbaA/D0MJSxD1gaSPXBM
   Lh6SbAq9nsYELYNdoShoQOjM5xoCi2wSHc2DqwIiNlcewxdx10UKI72lj
   qiaKI85nvNgKAPaEzWP83Avt1lvG5jlzl4P+KM6p+y8tWhd5bMG8owEj7
   zV/UPIV8j2PSEb2ANzxxFFDVJqv1+KD+4H2s7gu6piCzQl6wmO9sJCLl+
   /FOJoC3ruCGgwxhCEleXi2kuI50FlEx5SFiYoWJCJZ4WMBsxLDOCZkNOt
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="423384169"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="423384169"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 04:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="655939104"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="655939104"
Received: from tchambon-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.68])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 04:03:40 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 7/7] ASoC: SOF: ipc4-control: Add support for bytes control
 get and put
Date: Mon, 13 Mar 2023 13:03:44 +0200
Message-Id: <20230313110344.16644-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313110344.16644-1-peter.ujfalusi@linux.intel.com>
References: <20230313110344.16644-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5P7FXAE4ACEEFJBTDNE2SWAVIXMUHQHH
X-Message-ID-Hash: 5P7FXAE4ACEEFJBTDNE2SWAVIXMUHQHH
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, libin.yang@intel.com,
 jaska.uimonen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5P7FXAE4ACEEFJBTDNE2SWAVIXMUHQHH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for bytes control by implementing bytes_get/put and
bytes_ext_get/put and blobs with either module init instance or
large config type.

For module init instance type the put will only update the stored
configuration blob and it is going to be taken into use next time the
module is (re-)initialized.

Large config type of blobs are sent to the firmware whenever the DSP is
powered up.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-control.c | 248 ++++++++++++++++++++++++++++++++++-
 1 file changed, 241 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 56d42f2eb6e2..d26ed2a6029f 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -181,11 +181,237 @@ static int sof_ipc4_volume_get(struct snd_sof_control *scontrol,
 	return 0;
 }
 
+static int sof_ipc4_set_get_bytes_data(struct snd_sof_dev *sdev,
+				       struct snd_sof_control *scontrol,
+				       bool set, bool lock)
+{
+	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
+	struct sof_abi_hdr *data = cdata->data;
+	struct sof_ipc4_msg *msg = &cdata->msg;
+	int ret = 0;
+
+	/* Send the new data to the firmware only if it is powered up */
+	if (set && !pm_runtime_active(sdev->dev))
+		return 0;
+
+	msg->extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(data->type);
+
+	msg->data_ptr = data->data;
+	msg->data_size = data->size;
+
+	ret = sof_ipc4_set_get_kcontrol_data(scontrol, set, lock);
+	if (ret < 0)
+		dev_err(sdev->dev, "Failed to %s for %s\n",
+			set ? "set bytes update" : "get bytes",
+			scontrol->name);
+
+	msg->data_ptr = NULL;
+	msg->data_size = 0;
+
+	return ret;
+}
+
+static int sof_ipc4_bytes_put(struct snd_sof_control *scontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct sof_abi_hdr *data = cdata->data;
+	size_t size;
+
+	if (scontrol->max_size > sizeof(ucontrol->value.bytes.data)) {
+		dev_err_ratelimited(scomp->dev,
+				    "data max %zu exceeds ucontrol data array size\n",
+				    scontrol->max_size);
+		return -EINVAL;
+	}
+
+	/* scontrol->max_size has been verified to be >= sizeof(struct sof_abi_hdr) */
+	if (data->size > scontrol->max_size - sizeof(*data)) {
+		dev_err_ratelimited(scomp->dev,
+				    "data size too big %u bytes max is %zu\n",
+				    data->size, scontrol->max_size - sizeof(*data));
+		return -EINVAL;
+	}
+
+	size = data->size + sizeof(*data);
+
+	/* copy from kcontrol */
+	memcpy(data, ucontrol->value.bytes.data, size);
+
+	sof_ipc4_set_get_bytes_data(sdev, scontrol, true, true);
+
+	return 0;
+}
+
+static int sof_ipc4_bytes_get(struct snd_sof_control *scontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	struct sof_abi_hdr *data = cdata->data;
+	size_t size;
+
+	if (scontrol->max_size > sizeof(ucontrol->value.bytes.data)) {
+		dev_err_ratelimited(scomp->dev, "data max %zu exceeds ucontrol data array size\n",
+				    scontrol->max_size);
+		return -EINVAL;
+	}
+
+	if (data->size > scontrol->max_size - sizeof(*data)) {
+		dev_err_ratelimited(scomp->dev,
+				    "%u bytes of control data is invalid, max is %zu\n",
+				    data->size, scontrol->max_size - sizeof(*data));
+		return -EINVAL;
+	}
+
+	size = data->size + sizeof(*data);
+
+	/* copy back to kcontrol */
+	memcpy(ucontrol->value.bytes.data, data, size);
+
+	return 0;
+}
+
+static int sof_ipc4_bytes_ext_put(struct snd_sof_control *scontrol,
+				  const unsigned int __user *binary_data,
+				  unsigned int size)
+{
+	struct snd_ctl_tlv __user *tlvd = (struct snd_ctl_tlv __user *)binary_data;
+	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct sof_abi_hdr *data = cdata->data;
+	struct sof_abi_hdr abi_hdr;
+	struct snd_ctl_tlv header;
+
+	/*
+	 * The beginning of bytes data contains a header from where
+	 * the length (as bytes) is needed to know the correct copy
+	 * length of data from tlvd->tlv.
+	 */
+	if (copy_from_user(&header, tlvd, sizeof(struct snd_ctl_tlv)))
+		return -EFAULT;
+
+	/* make sure TLV info is consistent */
+	if (header.length + sizeof(struct snd_ctl_tlv) > size) {
+		dev_err_ratelimited(scomp->dev,
+				    "Inconsistent TLV, data %d + header %zu > %d\n",
+				    header.length, sizeof(struct snd_ctl_tlv), size);
+		return -EINVAL;
+	}
+
+	/* be->max is coming from topology */
+	if (header.length > scontrol->max_size) {
+		dev_err_ratelimited(scomp->dev,
+				    "Bytes data size %d exceeds max %zu\n",
+				    header.length, scontrol->max_size);
+		return -EINVAL;
+	}
+
+	/* Verify the ABI header first */
+	if (copy_from_user(&abi_hdr, tlvd->tlv, sizeof(abi_hdr)))
+		return -EFAULT;
+
+	if (abi_hdr.magic != SOF_IPC4_ABI_MAGIC) {
+		dev_err_ratelimited(scomp->dev, "Wrong ABI magic 0x%08x\n",
+				    abi_hdr.magic);
+		return -EINVAL;
+	}
+
+	if (abi_hdr.size > scontrol->max_size - sizeof(abi_hdr)) {
+		dev_err_ratelimited(scomp->dev,
+				    "%u bytes of control data is invalid, max is %zu\n",
+				    abi_hdr.size, scontrol->max_size - sizeof(abi_hdr));
+		return -EINVAL;
+	}
+
+	/* Copy the whole binary data which includes the ABI header and the payload */
+	if (copy_from_user(data, tlvd->tlv, header.length))
+		return -EFAULT;
+
+	sof_ipc4_set_get_bytes_data(sdev, scontrol, true, true);
+
+	return 0;
+}
+
+static int _sof_ipc4_bytes_ext_get(struct snd_sof_control *scontrol,
+				   const unsigned int __user *binary_data,
+				   unsigned int size, bool from_dsp)
+{
+	struct snd_ctl_tlv __user *tlvd = (struct snd_ctl_tlv __user *)binary_data;
+	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	struct sof_abi_hdr *data = cdata->data;
+	struct snd_ctl_tlv header;
+	size_t data_size;
+
+	/*
+	 * Decrement the limit by ext bytes header size to ensure the user space
+	 * buffer is not exceeded.
+	 */
+	if (size < sizeof(struct snd_ctl_tlv))
+		return -ENOSPC;
+
+	size -= sizeof(struct snd_ctl_tlv);
+
+	/* get all the component data from DSP */
+	if (from_dsp) {
+		struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+		int ret = sof_ipc4_set_get_bytes_data(sdev, scontrol, false, true);
+
+		if (ret < 0)
+			return ret;
+
+		/* Set the ABI magic (if the control is not initialized) */
+		data->magic = SOF_IPC4_ABI_MAGIC;
+	}
+
+	if (data->size > scontrol->max_size - sizeof(*data)) {
+		dev_err_ratelimited(scomp->dev,
+				    "%u bytes of control data is invalid, max is %zu\n",
+				    data->size, scontrol->max_size - sizeof(*data));
+		return -EINVAL;
+	}
+
+	data_size = data->size + sizeof(struct sof_abi_hdr);
+
+	/* make sure we don't exceed size provided by user space for data */
+	if (data_size > size)
+		return -ENOSPC;
+
+	header.numid = scontrol->comp_id;
+	header.length = data_size;
+
+	if (copy_to_user(tlvd, &header, sizeof(struct snd_ctl_tlv)))
+		return -EFAULT;
+
+	if (copy_to_user(tlvd->tlv, data, data_size))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int sof_ipc4_bytes_ext_get(struct snd_sof_control *scontrol,
+				  const unsigned int __user *binary_data,
+				  unsigned int size)
+{
+	return _sof_ipc4_bytes_ext_get(scontrol, binary_data, size, false);
+}
+
+static int sof_ipc4_bytes_ext_volatile_get(struct snd_sof_control *scontrol,
+					   const unsigned int __user *binary_data,
+					   unsigned int size)
+{
+	return _sof_ipc4_bytes_ext_get(scontrol, binary_data, size, true);
+}
+
 /* set up all controls for the widget */
 static int sof_ipc4_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
 	struct snd_sof_control *scontrol;
-	int ret;
+	int ret = 0;
 
 	list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
 		if (scontrol->comp_id == swidget->comp_id) {
@@ -195,11 +421,10 @@ static int sof_ipc4_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_s
 			case SND_SOC_TPLG_CTL_VOLSW_XR_SX:
 				ret = sof_ipc4_set_volume_data(sdev, swidget,
 							       scontrol, false);
-				if (ret < 0) {
-					dev_err(sdev->dev, "kcontrol %d set up failed for widget %s\n",
-						scontrol->comp_id, swidget->widget->name);
-					return ret;
-				}
+				break;
+			case SND_SOC_TPLG_CTL_BYTES:
+				ret = sof_ipc4_set_get_bytes_data(sdev, scontrol,
+								  true, false);
 				break;
 			default:
 				break;
@@ -207,7 +432,11 @@ static int sof_ipc4_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_s
 		}
 	}
 
-	return 0;
+	if (ret < 0)
+		dev_err(sdev->dev, "kcontrol %d set up failed for widget %s\n",
+			scontrol->comp_id, swidget->widget->name);
+
+	return ret;
 }
 
 static int
@@ -235,6 +464,11 @@ sof_ipc4_set_up_volume_table(struct snd_sof_control *scontrol, int tlv[SOF_TLV_I
 const struct sof_ipc_tplg_control_ops tplg_ipc4_control_ops = {
 	.volume_put = sof_ipc4_volume_put,
 	.volume_get = sof_ipc4_volume_get,
+	.bytes_put = sof_ipc4_bytes_put,
+	.bytes_get = sof_ipc4_bytes_get,
+	.bytes_ext_put = sof_ipc4_bytes_ext_put,
+	.bytes_ext_get = sof_ipc4_bytes_ext_get,
+	.bytes_ext_volatile_get = sof_ipc4_bytes_ext_volatile_get,
 	.widget_kcontrol_setup = sof_ipc4_widget_kcontrol_setup,
 	.set_up_volume_table = sof_ipc4_set_up_volume_table,
 };
-- 
2.39.2

