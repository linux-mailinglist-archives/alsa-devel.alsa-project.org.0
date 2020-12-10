Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C0C2D5B57
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 14:11:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B3A21681;
	Thu, 10 Dec 2020 14:10:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B3A21681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607605905;
	bh=SaKWsrwOZWMmHG9eQpzo8WNsBVRjX7dqL+tQ5OQKRrA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rV8jSKAKMNo4n+B3hOuZiaUKvmGkAA/UdwpjU/K9uShDo+siZVX7AkyOhYvpN5pFa
	 CZD8wF1XAspES3Gx5UwnoP/MQoHQgJfHc4bf1agUb38voQNQE7NqT44kQD36A0qeYw
	 pW7X1JHl3QC7NsdQpzw1zcqlh7VPuG7pWI7tT53c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A285F80255;
	Thu, 10 Dec 2020 14:10:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78CB8F800EF; Thu, 10 Dec 2020 14:10:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D97E9F800EF
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 14:09:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D97E9F800EF
IronPort-SDR: 8nZ8HK3FiEI65hm+wk/GCGLRwr/JVzZrFHFmpdRh0eyAga1OHbuDvGdztmrTDDVwfHic2T3/XE
 HGPjdyo1lULg==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="153483406"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="153483406"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 05:09:48 -0800
IronPort-SDR: ndozflFV6veMPtSB+GHthOzgZUdOcnfW0J58+4+Is+zD8pxGuLsFfRJ4Dm7SRRG3Fmg1a9tvQa
 F0pq6X/W1cIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="376956670"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Dec 2020 05:09:46 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 2/2] ASoC: topology: Add missing size check
Date: Thu, 10 Dec 2020 10:25:41 -0500
Message-Id: <20201210152541.191728-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201210152541.191728-1-amadeuszx.slawinski@linux.intel.com>
References: <20201210152541.191728-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

When we parse "values" we perform check if there is correct number of
them. However similar check is missing in case of "texts", add it.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 7fb3a87ab860..950c45008e24 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -856,6 +856,9 @@ static int soc_tplg_denum_create_texts(struct soc_tplg *tplg, struct soc_enum *s
 {
 	int i, ret;
 
+	if (le32_to_cpu(ec->items) > ARRAY_SIZE(ec->texts))
+		return -EINVAL;
+
 	se->dobj.control.dtexts =
 		devm_kcalloc(tplg->dev, le32_to_cpu(ec->items), sizeof(char *), GFP_KERNEL);
 	if (se->dobj.control.dtexts == NULL)
-- 
2.25.1

