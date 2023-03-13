Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A686F6B7534
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 12:05:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B7941487;
	Mon, 13 Mar 2023 12:04:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B7941487
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678705530;
	bh=jRyXCGM47ieZ84fwrBjzeBZWSdWUXm1+yV4Gpjor3Xg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tIIA4KUNvM1ZGkIv7z+eTKi8n3CnaW/yL2FdM9TeILDT9WndD+QccIBFN/3phcK63
	 3is5bWQvZRioYDF7RUOxn8O7HaKJt0dTRDuumYULebzvB0fPfj7sdxulbIvx9kWUlR
	 7WeDel+UkE+ZdIeoquu36kuQ+FqpHdmLwW6kMdHA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 320F0F804FE;
	Mon, 13 Mar 2023 12:03:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B27FEF8051B; Mon, 13 Mar 2023 12:03:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB0E1F80423
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 12:03:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB0E1F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jin4NpaF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678705417; x=1710241417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jRyXCGM47ieZ84fwrBjzeBZWSdWUXm1+yV4Gpjor3Xg=;
  b=jin4NpaFy3TqEgCRyZJYA97icbmcr8llzNqwzLWoGPtC7ANwpm1rcPj/
   6fdahdOMumcghAT1vnSXNonC7doxw+STinsAYxy20RHpk8uijv/SkWRbN
   +xr7P0tVQPeEdXMFSuBUyObW+nM1IsCsSBRH6qPmO3QM3EUP++nfNbaEI
   NXQTOdGRhmPhxeohhlrg08zy4yVqiex5VRdqmUKefJoSbomaoBLqAHr0O
   BN9iHKv6TRowAaYuwdSqXP3XpY73A4ttlriSqVubYo93HJ6LZGtsQzMZI
   Xbl6J4aawg6dwUVs8Y1pdQ14LYel2ftEtWVtu2AsYSccy49xLF9kxW4S+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="423384083"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="423384083"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 04:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="655939070"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="655939070"
Received: from tchambon-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.68])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 04:03:26 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/7] ASoC: SOF: ipc3-control: Merge functions to handle
 bytes_ext get variants
Date: Mon, 13 Mar 2023 13:03:39 +0200
Message-Id: <20230313110344.16644-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313110344.16644-1-peter.ujfalusi@linux.intel.com>
References: <20230313110344.16644-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JDNPTETFIQRUBTNKRCZQ2B5YCXOC45IP
X-Message-ID-Hash: JDNPTETFIQRUBTNKRCZQ2B5YCXOC45IP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDNPTETFIQRUBTNKRCZQ2B5YCXOC45IP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The code for bytes_ext_get and bytes_ext_volatile_get is identical with
the only difference is that in case of volatile_get we refresh the data
from the DSP before returning it to user space.

Convert the callbacks to a simple wrapper for the same function.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc3-control.c | 80 +++++++++++-------------------------
 1 file changed, 23 insertions(+), 57 deletions(-)

diff --git a/sound/soc/sof/ipc3-control.c b/sound/soc/sof/ipc3-control.c
index 4e9d04124145..ad040e7bb850 100644
--- a/sound/soc/sof/ipc3-control.c
+++ b/sound/soc/sof/ipc3-control.c
@@ -343,55 +343,6 @@ static int sof_ipc3_bytes_put(struct snd_sof_control *scontrol,
 	return 0;
 }
 
-static int sof_ipc3_bytes_ext_get(struct snd_sof_control *scontrol,
-				  const unsigned int __user *binary_data, unsigned int size)
-{
-	struct snd_ctl_tlv __user *tlvd = (struct snd_ctl_tlv __user *)binary_data;
-	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
-	struct snd_soc_component *scomp = scontrol->scomp;
-	struct snd_ctl_tlv header;
-	size_t data_size;
-
-	sof_ipc3_refresh_control(scontrol);
-
-	/*
-	 * Decrement the limit by ext bytes header size to
-	 * ensure the user space buffer is not exceeded.
-	 */
-	if (size < sizeof(struct snd_ctl_tlv))
-		return -ENOSPC;
-
-	size -= sizeof(struct snd_ctl_tlv);
-
-	/* set the ABI header values */
-	cdata->data->magic = SOF_ABI_MAGIC;
-	cdata->data->abi = SOF_ABI_VERSION;
-
-	/* check data size doesn't exceed max coming from topology */
-	if (cdata->data->size > scontrol->max_size - sizeof(struct sof_abi_hdr)) {
-		dev_err_ratelimited(scomp->dev, "User data size %d exceeds max size %zu\n",
-				    cdata->data->size,
-				    scontrol->max_size - sizeof(struct sof_abi_hdr));
-		return -EINVAL;
-	}
-
-	data_size = cdata->data->size + sizeof(struct sof_abi_hdr);
-
-	/* make sure we don't exceed size provided by user space for data */
-	if (data_size > size)
-		return -ENOSPC;
-
-	header.numid = cdata->cmd;
-	header.length = data_size;
-	if (copy_to_user(tlvd, &header, sizeof(struct snd_ctl_tlv)))
-		return -EFAULT;
-
-	if (copy_to_user(tlvd->tlv, cdata->data, data_size))
-		return -EFAULT;
-
-	return 0;
-}
-
 static int sof_ipc3_bytes_ext_put(struct snd_sof_control *scontrol,
 				  const unsigned int __user *binary_data,
 				  unsigned int size)
@@ -457,16 +408,15 @@ static int sof_ipc3_bytes_ext_put(struct snd_sof_control *scontrol,
 	return 0;
 }
 
-static int sof_ipc3_bytes_ext_volatile_get(struct snd_sof_control *scontrol,
-					   const unsigned int __user *binary_data,
-					   unsigned int size)
+static int _sof_ipc3_bytes_ext_get(struct snd_sof_control *scontrol,
+				   const unsigned int __user *binary_data,
+				   unsigned int size, bool from_dsp)
 {
 	struct snd_ctl_tlv __user *tlvd = (struct snd_ctl_tlv __user *)binary_data;
 	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_ctl_tlv header;
 	size_t data_size;
-	int ret;
 
 	/*
 	 * Decrement the limit by ext bytes header size to
@@ -482,9 +432,12 @@ static int sof_ipc3_bytes_ext_volatile_get(struct snd_sof_control *scontrol,
 	cdata->data->abi = SOF_ABI_VERSION;
 
 	/* get all the component data from DSP */
-	ret = sof_ipc3_set_get_kcontrol_data(scontrol, false, true);
-	if (ret < 0)
-		return ret;
+	if (from_dsp) {
+		int ret = sof_ipc3_set_get_kcontrol_data(scontrol, false, true);
+
+		if (ret < 0)
+			return ret;
+	}
 
 	/* check data size doesn't exceed max coming from topology */
 	if (cdata->data->size > scontrol->max_size - sizeof(struct sof_abi_hdr)) {
@@ -508,7 +461,20 @@ static int sof_ipc3_bytes_ext_volatile_get(struct snd_sof_control *scontrol,
 	if (copy_to_user(tlvd->tlv, cdata->data, data_size))
 		return -EFAULT;
 
-	return ret;
+	return 0;
+}
+
+static int sof_ipc3_bytes_ext_get(struct snd_sof_control *scontrol,
+				  const unsigned int __user *binary_data, unsigned int size)
+{
+	return _sof_ipc3_bytes_ext_get(scontrol, binary_data, size, false);
+}
+
+static int sof_ipc3_bytes_ext_volatile_get(struct snd_sof_control *scontrol,
+					   const unsigned int __user *binary_data,
+					   unsigned int size)
+{
+	return _sof_ipc3_bytes_ext_get(scontrol, binary_data, size, true);
 }
 
 static void snd_sof_update_control(struct snd_sof_control *scontrol,
-- 
2.39.2

