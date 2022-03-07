Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 039834D0621
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 19:15:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AEED17A8;
	Mon,  7 Mar 2022 19:14:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AEED17A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646676947;
	bh=/Dyha+Vfapt4I1Cyt3/2zZ8RIsPAyXnpIwQb5SG3LuI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sb1KZct3v67fkrH4D+FVNnMzIkWDXAqL8XgWp00WQ8THFpZmxrY7MN7+Cs2kamWQ8
	 LADZoULWkQlfRtu9dVFRYc3j2xQOhSyRYYad5d2axZY+WcuQ4qpjWO4bfr16UyzNmD
	 5KzVoEFD3ONhwdRavGO619rlSU2Kuzyqkldo8IvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 957A2F8055C;
	Mon,  7 Mar 2022 19:11:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D496FF80539; Mon,  7 Mar 2022 19:11:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65BD9F80529
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 19:11:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65BD9F80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SZXVlViD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646676700; x=1678212700;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Dyha+Vfapt4I1Cyt3/2zZ8RIsPAyXnpIwQb5SG3LuI=;
 b=SZXVlViD4uYqBe6BS271xvrLAjH8xHqHj3AedDnhfcC9oC5tySUsQXyU
 fNruwDax216onyRDuJM7scSlyBUZTdYKX7ZbAeNg0TSIFNC/G+BjyHNSy
 0gPb/SGkUn1/eXD4yoGwJbHaOOunqMOu/3aksY1VBoL1F/GclHYqG/z/c
 S1swLS7XQhrsFOLvxyWlRosxWvFsDYAiEjHWRqoPBFL7FIO4fUWPBsC4X
 HG3O0tjxC7N48VXXsozeUEsybpxFj+Mjntrd5XWQ7TDVRKafWpmhAfikr
 7j0uQIFXiRxL2LrOid6Q9VRAzpGUN9tO7SUVKDNHcfOuUfW2PovtMtKUG g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254401339"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254401339"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:28 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="495146683"
Received: from echun1-mobl.amr.corp.intel.com (HELO rsridh2-mobl1.localdomain)
 ([10.251.130.219])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:28 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 13/18] ASoC: SOF: Add a tuples array to struct snd_sof_widget
Date: Mon,  7 Mar 2022 10:11:06 -0800
Message-Id: <20220307181111.49392-14-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
References: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

Add 2 new fields to snd_sof_widget to store an array of tuples
defined by struct snd_sof_tuple and the number of tuples. When the
topology gets parsed, the tuples associated with a widget will be stored
in this array and will be used to construct the IPC structure
depending on the IPC version.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-audio.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 5c10df500ffb..a6a11f0048b4 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -30,6 +30,18 @@
 
 #define WIDGET_IS_DAI(id) ((id) == snd_soc_dapm_dai_in || (id) == snd_soc_dapm_dai_out)
 
+/** struct snd_sof_tuple - Tuple info
+ * @token:	Token ID
+ * @value:	union of a string or a u32 values
+ */
+struct snd_sof_tuple {
+	u32 token;
+	union {
+		u32 v;
+		const char *s;
+	} value;
+};
+
 /* PCM stream, mapped to FW component  */
 struct snd_sof_pcm_stream {
 	u32 comp_id;
@@ -112,6 +124,9 @@ struct snd_sof_widget {
 
 	u8 uuid[SOF_UUID_SIZE];
 
+	int num_tuples;
+	struct snd_sof_tuple *tuples;
+
 	void *private;		/* core does not touch this */
 };
 
-- 
2.25.1

