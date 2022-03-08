Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E6F4D1DA9
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 17:45:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A89D17BF;
	Tue,  8 Mar 2022 17:45:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A89D17BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646757951;
	bh=BloCR7IgHwGqVaKqlil5nTnQMYwWqLtZl3zLrRzF46c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oOPv3gAyj0WJTtIHLBFR+vyGkCxPPRrC5OPZKYMphwrebXC9rr/g7RIOd5C9EhXs5
	 pX/HpqAZrCNKMSn/2DPsxjWuJn/CaUgGch+DYfYex6wNG+/FEjXs7jFewiERz4ZxCY
	 eUyN8AFB7a2+kbrHazTyhl6ZM2nsJpDY27TIOabA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B069FF8051C;
	Tue,  8 Mar 2022 17:44:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51BC1F804F3; Tue,  8 Mar 2022 17:44:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61617F8025E
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 17:44:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61617F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZL70IIEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646757843; x=1678293843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BloCR7IgHwGqVaKqlil5nTnQMYwWqLtZl3zLrRzF46c=;
 b=ZL70IIEht+h4B8xPGKZKjv2lLaf3RjMCK5s5Qnj3gTDBMjVdqE5x56Vn
 4tVj2aOqEup3aKGoD1SZA+N9IGoPImFXkyr5eoevMxQGgPKkhYLyP+KNV
 XTah4FzKzBgDInKwuzL3OEdRDG0hWV9OrbJY81zFbv221vyxij2p2Erpi
 fWIPdZxWUJPZfN4bQmLFbbYNtyr4DsCNQqtJvhOgYSncWjsFL9ZDUp3YI
 /7EzbuTUaiJ2j6DZczViR6zGVF6MHJu9m51YksCL/RN3Y9g90t+fZbjJ0
 Vm0S4JfQjPLZZra/9xj7r3HCgsK1tdd6QAJIVYiYsiMGjh84ba1eZzjTD A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="317964769"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="317964769"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:58 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="537633268"
Received: from bustam3x-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.251.130.225])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:57 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 13/18] ASoC: SOF: Add a tuples array to struct
 snd_sof_widget
Date: Tue,  8 Mar 2022 08:43:39 -0800
Message-Id: <20220308164344.577647-14-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
References: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
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
index 10330d826d40..2a1da9e13279 100644
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
 
 	const guid_t uuid;
 
+	int num_tuples;
+	struct snd_sof_tuple *tuples;
+
 	void *private;		/* core does not touch this */
 };
 
-- 
2.25.1

