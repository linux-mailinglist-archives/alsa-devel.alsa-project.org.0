Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8184D272206
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 13:14:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B3EA16FD;
	Mon, 21 Sep 2020 13:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B3EA16FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600686868;
	bh=7rXaJlVwY5vJSmn4SfWcxfIw88e1CI6TqG11yynaAYs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mqIBcUu3cm/o+CzVFt5Ls1lSfU5+VJT/tc9TawMlLSUAZiB9YGFil9vpRPOZCceii
	 BMTINXUknPIt03MUPjAUlqGp4si/df0MIhLERQTx9kW7p5+xmnb9OdbdKuFSVntcO5
	 /O0dqa1oL0M+KZrugsRwOATXzDM6Gqln6JmN8C1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68662F802E9;
	Mon, 21 Sep 2020 13:10:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D980AF80171; Mon, 21 Sep 2020 13:10:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB474F80171
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 13:10:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB474F80171
IronPort-SDR: geNJJZhg6tnNt62r+nugOPxdw/tn3/VlYPNhP1OwD6LlHyR/tVFfGJu3dCbSJ2bpUeJT9vKA3s
 LATNo+SHs4og==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="148011244"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="148011244"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 04:10:02 -0700
IronPort-SDR: 17UVCDEjY22Pfdy6AzyS/7kJjPXP0K7x3CO+/oBaH4cKIpMxMoRqOgSqjB0tMzFdbnsJOrWDWl
 ZlIZQIkUV35w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="321730241"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 21 Sep 2020 04:10:01 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 4/5] ASoC: SOF: control: remove const in sizeof()
Date: Mon, 21 Sep 2020 14:08:13 +0300
Message-Id: <20200921110814.2910477-5-kai.vehmanen@linux.intel.com>
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

We should only use the type, the const attribute makes no sense in
sizeof().

Reported-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/control.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 0352d2b61358..056c86ad5a47 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -309,7 +309,7 @@ int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
 	 * the length (as bytes) is needed to know the correct copy
 	 * length of data from tlvd->tlv.
 	 */
-	if (copy_from_user(&header, tlvd, sizeof(const struct snd_ctl_tlv)))
+	if (copy_from_user(&header, tlvd, sizeof(struct snd_ctl_tlv)))
 		return -EFAULT;
 
 	/* make sure TLV info is consistent */
@@ -351,7 +351,7 @@ int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
 	}
 
 	/* be->max has been verified to be >= sizeof(struct sof_abi_hdr) */
-	if (cdata->data->size > be->max - sizeof(const struct sof_abi_hdr)) {
+	if (cdata->data->size > be->max - sizeof(struct sof_abi_hdr)) {
 		dev_err_ratelimited(scomp->dev, "error: Mismatch in ABI data size (truncated?).\n");
 		return -EINVAL;
 	}
@@ -405,15 +405,15 @@ int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int _
 		goto out;
 
 	/* check data size doesn't exceed max coming from topology */
-	if (cdata->data->size > be->max - sizeof(const struct sof_abi_hdr)) {
+	if (cdata->data->size > be->max - sizeof(struct sof_abi_hdr)) {
 		dev_err_ratelimited(scomp->dev, "error: user data size %d exceeds max size %zu.\n",
 				    cdata->data->size,
-				    be->max - sizeof(const struct sof_abi_hdr));
+				    be->max - sizeof(struct sof_abi_hdr));
 		ret = -EINVAL;
 		goto out;
 	}
 
-	data_size = cdata->data->size + sizeof(const struct sof_abi_hdr);
+	data_size = cdata->data->size + sizeof(struct sof_abi_hdr);
 
 	/* make sure we don't exceed size provided by user space for data */
 	if (data_size > size) {
@@ -423,7 +423,7 @@ int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int _
 
 	header.numid = scontrol->cmd;
 	header.length = data_size;
-	if (copy_to_user(tlvd, &header, sizeof(const struct snd_ctl_tlv))) {
+	if (copy_to_user(tlvd, &header, sizeof(struct snd_ctl_tlv))) {
 		ret = -EFAULT;
 		goto out;
 	}
@@ -466,14 +466,14 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 	cdata->data->abi = SOF_ABI_VERSION;
 
 	/* check data size doesn't exceed max coming from topology */
-	if (cdata->data->size > be->max - sizeof(const struct sof_abi_hdr)) {
+	if (cdata->data->size > be->max - sizeof(struct sof_abi_hdr)) {
 		dev_err_ratelimited(scomp->dev, "error: user data size %d exceeds max size %zu.\n",
 				    cdata->data->size,
-				    be->max - sizeof(const struct sof_abi_hdr));
+				    be->max - sizeof(struct sof_abi_hdr));
 		return -EINVAL;
 	}
 
-	data_size = cdata->data->size + sizeof(const struct sof_abi_hdr);
+	data_size = cdata->data->size + sizeof(struct sof_abi_hdr);
 
 	/* make sure we don't exceed size provided by user space for data */
 	if (data_size > size)
@@ -481,7 +481,7 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 
 	header.numid = scontrol->cmd;
 	header.length = data_size;
-	if (copy_to_user(tlvd, &header, sizeof(const struct snd_ctl_tlv)))
+	if (copy_to_user(tlvd, &header, sizeof(struct snd_ctl_tlv)))
 		return -EFAULT;
 
 	if (copy_to_user(tlvd->tlv, cdata->data, data_size))
-- 
2.27.0

