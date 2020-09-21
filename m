Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AA7272205
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 13:14:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E215216A9;
	Mon, 21 Sep 2020 13:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E215216A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600686858;
	bh=21JbM/1pnOVI3XFz/wTmPl/Ucfktxi4dBJCx7rW1eGM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AP24BhFZd1I4T3yF+N49odY1j4Yps4rkTfSw6bJQ9qyxM17PXos8uF1csHWV31MKS
	 GabKiMFwUSWIZk1gpQVLMSNdh8eOMDHeQP+AXH5O5Mf+/rLkxu0DjAWLFAByseqhA+
	 X8N5loC8ZYMNpM/RTXmd0gxtxZwhgXMwGHx+5Jz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06B6CF802E2;
	Mon, 21 Sep 2020 13:10:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89A7BF802C4; Mon, 21 Sep 2020 13:10:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F09D5F801EC
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 13:10:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F09D5F801EC
IronPort-SDR: 9NWC55sKNpu5Z/XC6WktoARSkHC8bcp7DE0FzbY+pDJRZYCvwg0lubW4gfmjSw8vD6NUnU2m7x
 zfb8QYpq2phg==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="148011249"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="148011249"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 04:10:04 -0700
IronPort-SDR: wQbmQEW5DaCyH4A9cQYw2lxzfIIzqJQ639hOqKQRr++w+CMtGooro+MnHSo7Z0LOnBrv2dbTdr
 Aivf8+uT5CFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="321730270"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 21 Sep 2020 04:10:03 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 5/5] ASoC: SOF: topology: remove const in sizeof()
Date: Mon, 21 Sep 2020 14:08:14 +0300
Message-Id: <20200921110814.2910477-6-kai.vehmanen@linux.intel.com>
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
 sound/soc/sof/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index eaa1122d5a68..1e42eb32f3b7 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1201,7 +1201,7 @@ static int sof_control_load_bytes(struct snd_soc_component *scomp,
 			ret = -EINVAL;
 			goto out_free;
 		}
-		if (cdata->data->size + sizeof(const struct sof_abi_hdr) !=
+		if (cdata->data->size + sizeof(struct sof_abi_hdr) !=
 		    le32_to_cpu(control->priv.size)) {
 			dev_err(scomp->dev,
 				"error: Conflict in bytes vs. priv size.\n");
-- 
2.27.0

