Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84439CDD84
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 10:44:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85B431673;
	Mon,  7 Oct 2019 10:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85B431673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570437856;
	bh=YdrN9CtENzzaDhMFGfQeqxLlftYPtntUYnevizBtMkA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fbARz3rGMZ4tTBtPgm7CaoN4I5YS4IewsFiGC3l7hvE4kshJoQKSxuel+WYb1zgZ9
	 L1bdBsblsaV9rB879/Zm/pNncxjJp19hCTitC09Jr7M1Qz6cycNhyQD/EeDF8ELqU4
	 jJSQBsiJsWFMH5gOsPcd79vp76gKIvoZ3ostxHfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAADEF80534;
	Mon,  7 Oct 2019 10:41:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40EBCF802BE; Mon,  7 Oct 2019 10:41:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9034AF80096
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 10:41:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9034AF80096
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Oct 2019 01:41:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,267,1566889200"; d="scan'208";a="222845063"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.41.73])
 by fmsmga002.fm.intel.com with ESMTP; 07 Oct 2019 01:41:35 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  7 Oct 2019 10:41:32 +0200
Message-Id: <20191007084133.7674-2-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007084133.7674-1-guennadi.liakhovetski@linux.intel.com>
References: <20191007084133.7674-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Subject: [alsa-devel] [PATCH 1/2] ASoC: topology: protect against accessing
	beyond loaded topology data
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add checks for sufficient topology data length before accessing data
according to its internal structure. Without these checks malformed
or corrupted topology images can lead to accessing invalid addresses
in the kernel.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/soc-topology.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 0fd0329..d1d3c6f 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2501,9 +2501,18 @@ static int soc_tplg_manifest_load(struct soc_tplg *tplg,
 static int soc_valid_header(struct soc_tplg *tplg,
 	struct snd_soc_tplg_hdr *hdr)
 {
+	size_t remainder = tplg->fw->size - soc_tplg_get_hdr_offset(tplg);
+
 	if (soc_tplg_get_hdr_offset(tplg) >= tplg->fw->size)
 		return 0;
 
+	/* Check that we have enough data before accessing the header */
+	if (remainder < sizeof(*hdr)) {
+		dev_err(tplg->dev, "ASoC: insufficient %zd bytes.\n",
+			remainder);
+		return -EINVAL;
+	}
+
 	if (le32_to_cpu(hdr->size) != sizeof(*hdr)) {
 		dev_err(tplg->dev,
 			"ASoC: invalid header size for type %d at offset 0x%lx size 0x%zx.\n",
@@ -2546,6 +2555,14 @@ static int soc_valid_header(struct soc_tplg *tplg,
 		return -EINVAL;
 	}
 
+	if (le32_to_cpu(hdr->payload_size) + sizeof(*hdr) > remainder) {
+		dev_err(tplg->dev,
+			"ASoC: payload size %zu too large at offset 0x%lx.\n",
+			le32_to_cpu(hdr->payload_size),
+			soc_tplg_get_hdr_offset(tplg));
+		return -EINVAL;
+	}
+
 	if (tplg->pass == le32_to_cpu(hdr->type))
 		dev_dbg(tplg->dev,
 			"ASoC: Got 0x%x bytes of type %d version %d vendor %d at pass %d\n",
-- 
1.9.3

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
