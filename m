Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B2498546
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 22:11:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9881165D;
	Wed, 21 Aug 2019 22:11:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9881165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566418318;
	bh=J/tBQjpki0LNWsetvDWPNCdtGJmM5kORcN2hb1x7zG8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sMsHs4Aj+CwSCSSy42HAMDm3oBxcXgA435O48Rw4Kh8UgJRjZkcyWE7YwrBRYeQKx
	 3a4snpI1SICjfOAnXx63rVZYzbi4BWIBVz8/WchIjAeXtMFehxFcRFWRvNj/POlA+Y
	 KmJmO2JGRWipAsRHftXpe06jgEEf1HzlBdt+38Ww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C07CF80638;
	Wed, 21 Aug 2019 22:06:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 513E6F805F9; Wed, 21 Aug 2019 22:05:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53F24F8036A
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 22:05:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53F24F8036A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 13:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="196069761"
Received: from smasango-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.139.100])
 by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2019 13:05:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 21 Aug 2019 15:05:15 -0500
Message-Id: <20190821200521.17283-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821200521.17283-1-pierre-louis.bossart@linux.intel.com>
References: <20190821200521.17283-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [RFC PATCH 05/11] soundwire: intel: don't filter out
	PDI0/1
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

PDI0/1 are reserved for Bulk and filtered out in the existing code.
That leads to endless confusions on whether the index is the raw or
corrected one. In addition we will need support for Bulk at some point
so it's just simpler to expose those PDIs and not use it for now than
try to be smart unless we have to remove the smarts.

This patch requires a topology change to use PDIs starting at offset 2
explicitly.

Note that there is a known discrepancy between hardware documentation
and what ALH stream works in practice, future fixes are likely.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index fcab2e2f4249..8510d4ee8044 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -183,9 +183,6 @@ MODULE_PARM_DESC(cdns_mcp_int_mask, "Cadence MCP IntMask");
 #define CDNS_DEFAULT_SSP_INTERVAL		0x18
 #define CDNS_TX_TIMEOUT				2000
 
-#define CDNS_PCM_PDI_OFFSET			0x2
-#define CDNS_PDM_PDI_OFFSET			0x6
-
 #define CDNS_SCP_RX_FIFOLEVEL			0x2
 
 /*
@@ -295,11 +292,7 @@ static int cdns_reg_show(struct seq_file *s, void *data)
 	ret += scnprintf(buf + ret, RD_BUF - ret,
 			 "\nDPn B0 Registers\n");
 
-	/*
-	 * in sdw_cdns_pdi_init() we filter out the Bulk PDIs,
-	 * so the indices need to be corrected again
-	 */
-	num_ports = cdns->num_ports + CDNS_PCM_PDI_OFFSET;
+	num_ports = cdns->num_ports;
 
 	for (i = 0; i < num_ports; i++) {
 		ret += scnprintf(buf + ret, RD_BUF - ret,
@@ -912,11 +905,8 @@ int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
 	/* Allocate PDIs for PCMs */
 	stream = &cdns->pcm;
 
-	/* First two PDIs are reserved for bulk transfers */
-	if (stream->num_bd < CDNS_PCM_PDI_OFFSET)
-		return -EINVAL;
-	stream->num_bd -= CDNS_PCM_PDI_OFFSET;
-	offset = CDNS_PCM_PDI_OFFSET;
+	/* we allocate PDI0 and PDI1 which are used for Bulk */
+	offset = 0;
 
 	ret = cdns_allocate_pdi(cdns, &stream->bd,
 				stream->num_bd, offset);
@@ -934,6 +924,9 @@ int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
 
 	ret = cdns_allocate_pdi(cdns, &stream->out,
 				stream->num_out, offset);
+
+	offset += stream->num_out;
+
 	if (ret)
 		return ret;
 
@@ -943,7 +936,6 @@ int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
 
 	/* Allocate PDIs for PDMs */
 	stream = &cdns->pdm;
-	offset = CDNS_PDM_PDI_OFFSET;
 	ret = cdns_allocate_pdi(cdns, &stream->bd,
 				stream->num_bd, offset);
 	if (ret)
@@ -1240,12 +1232,13 @@ EXPORT_SYMBOL(cdns_set_sdw_stream);
  * Find and return a free PDI for a given PDI array
  */
 static struct sdw_cdns_pdi *cdns_find_pdi(struct sdw_cdns *cdns,
+					  unsigned int offset,
 					  unsigned int num,
 					  struct sdw_cdns_pdi *pdi)
 {
 	int i;
 
-	for (i = 0; i < num; i++) {
+	for (i = offset; i < num; i++) {
 		if (pdi[i].assigned)
 			continue;
 		pdi[i].assigned = true;
@@ -1295,13 +1288,13 @@ struct sdw_cdns_pdi *sdw_cdns_alloc_pdi(struct sdw_cdns *cdns,
 	struct sdw_cdns_pdi *pdi = NULL;
 
 	if (dir == SDW_DATA_DIR_RX)
-		pdi = cdns_find_pdi(cdns, stream->num_in, stream->in);
+		pdi = cdns_find_pdi(cdns, 0, stream->num_in, stream->in);
 	else
-		pdi = cdns_find_pdi(cdns, stream->num_out, stream->out);
+		pdi = cdns_find_pdi(cdns, 0, stream->num_out, stream->out);
 
 	/* check if we found a PDI, else find in bi-directional */
 	if (!pdi)
-		pdi = cdns_find_pdi(cdns, stream->num_bd, stream->bd);
+		pdi = cdns_find_pdi(cdns, 2, stream->num_bd, stream->bd);
 
 	if (pdi) {
 		pdi->l_ch_num = 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
