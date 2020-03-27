Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E70195DC6
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 19:40:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D46B165D;
	Fri, 27 Mar 2020 19:39:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D46B165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585334444;
	bh=kdCfXv5yniihX3jhvbKSqBZWTtiYttXYGUK/ahR4BKo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RB7ctearQWru75WCw7NKMcJA0YWk8cDEgbSj5PbAx2Gv4wOiD75KctjXIZO2Zbiii
	 ZyE1f1pr467sBLNFukztTrzXq8mTEf8lA34FrRuV67UMKEtO3LQLrv+v6XLzxpRUX0
	 KoDTFvLY1xKEOhFqDJC8bF+DyuEouFkIOPAPIIaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9AE1F8028E;
	Fri, 27 Mar 2020 19:38:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE44EF8015A; Fri, 27 Mar 2020 19:37:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA24EF80158
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 19:37:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA24EF80158
IronPort-SDR: 3EC+gXpufFs0EsKC9TLppMKeFqcHDki743CkDJOUfR5uLRp2JJBP7auu16UvE9t/k+iwfObbJd
 a5AUXY4btHEw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 11:37:53 -0700
IronPort-SDR: cGravoHVQtncbBnXnIpHq7lTGyyDwntT9+A0ZZ88Mn6DVrh3HhWTq/hnEPKUuPfdCyldICznh7
 YKX3+RGsvYdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,313,1580803200"; d="scan'208";a="421192569"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by orsmga005.jf.intel.com with ESMTP; 27 Mar 2020 11:37:51 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 2/6] ASoC: topology: Check return value of
 soc_tplg_create_tlv
Date: Fri, 27 Mar 2020 16:47:25 -0400
Message-Id: <20200327204729.397-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327204729.397-1-amadeuszx.slawinski@linux.intel.com>
References: <20200327204729.397-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

Function soc_tplg_create_tlv can fail, so we should check if it succeded
or not and proceed appropriately.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---

 v2:
  Added this patch

 sound/soc/soc-topology.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 434e152ac8ee..c3811dd66b68 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -894,7 +894,13 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, unsigned int count,
 		}
 
 		/* create any TLV data */
-		soc_tplg_create_tlv(tplg, &kc, &mc->hdr);
+		err = soc_tplg_create_tlv(tplg, &kc, &mc->hdr);
+		if (err < 0) {
+			dev_err(tplg->dev, "ASoC: failed to create TLV %s\n",
+				mc->hdr.name);
+			kfree(sm);
+			continue;
+		}
 
 		/* pass control to driver for optional further init */
 		err = soc_tplg_init_kcontrol(tplg, &kc,
@@ -1355,7 +1361,13 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dmixer_create(
 		}
 
 		/* create any TLV data */
-		soc_tplg_create_tlv(tplg, &kc[i], &mc->hdr);
+		err = soc_tplg_create_tlv(tplg, &kc[i], &mc->hdr);
+		if (err < 0) {
+			dev_err(tplg->dev, "ASoC: failed to create TLV %s\n",
+				mc->hdr.name);
+			kfree(sm);
+			continue;
+		}
 
 		/* pass control to driver for optional further init */
 		err = soc_tplg_init_kcontrol(tplg, &kc[i],
-- 
2.17.1

