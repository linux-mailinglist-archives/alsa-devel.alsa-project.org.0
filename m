Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ABE1CFCEA
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 20:13:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DFCD16DF;
	Tue, 12 May 2020 20:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DFCD16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589307215;
	bh=4ESfhpi4cTSUlsAl5Sw5wst5gxPQv5zObovTNFVOyaA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p08skPOBADvSNS8+zK5of3vQ+pU4HRwx2xJA4T0OHMIYFaPDy41jNfYNbnWqevDBC
	 +bPBJtufk5wdD6SMWAj7grqB7ekSdWPw+pm+jYEOjmG1y8vqh18FihMn0NPYNM//eV
	 LlpW7ayc5wePOa0lmbKbHeEOVRhrF4g/mP2Cr8WI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C45E2F8015A;
	Tue, 12 May 2020 20:11:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D327F8014C; Tue, 12 May 2020 20:11:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF96BF800AA
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 20:11:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF96BF800AA
IronPort-SDR: XhQ5nHjJzZNKmTIFnaEx4GRsoWYpb8KdzVJV+qflO0oY6xrEYbuWhazQDKhkE27Nb/9uGDTrdi
 /0+U1nmCulaw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2020 11:11:41 -0700
IronPort-SDR: o3VIiAZVlC+Ht+M/1VTKUNSXDniUiVAsOsE4bLbzl2F1bdUC3y7fkM49yjLGieSGqQzRKqq0ug
 q+ZIojU1aiTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; d="scan'208";a="437192515"
Received: from keyon-x299.sh.intel.com ([10.239.159.75])
 by orsmga005.jf.intel.com with ESMTP; 12 May 2020 11:11:39 -0700
From: Keyon Jie <yang.jie@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: topology: refine and log the header in the correct
 pass
Date: Wed, 13 May 2020 02:23:18 +0800
Message-Id: <20200512182319.118995-1-yang.jie@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com
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

The check (tplg->pass == le32_to_cpu(hdr->type)) makes no sense as it is
comparing two different enums, refine the element loading functions, and
log the information when the header is being parsed in the corresponding
parsing pass.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
---
 sound/soc/soc-topology.c | 53 +++++++++++++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 11 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 49875978a1ce..b3dae319c108 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2636,6 +2636,17 @@ static int soc_tplg_manifest_load(struct soc_tplg *tplg,
 	return ret;
 }
 
+int (*elem_load[])(struct soc_tplg *, struct snd_soc_tplg_hdr *) = {
+	[SOC_TPLG_PASS_MANIFEST]	= soc_tplg_manifest_load,
+	[SOC_TPLG_PASS_VENDOR]		= soc_tplg_vendor_load,
+	[SOC_TPLG_PASS_MIXER]		= soc_tplg_kcontrol_elems_load,
+	[SOC_TPLG_PASS_WIDGET]		= soc_tplg_dapm_widget_elems_load,
+	[SOC_TPLG_PASS_PCM_DAI]		= soc_tplg_pcm_elems_load,
+	[SOC_TPLG_PASS_GRAPH]		= soc_tplg_dapm_graph_elems_load,
+	[SOC_TPLG_PASS_BE_DAI]		= soc_tplg_dai_elems_load,
+	[SOC_TPLG_PASS_LINK]		= soc_tplg_link_elems_load,
+};
+
 /* validate header magic, size and type */
 static int soc_valid_header(struct soc_tplg *tplg,
 	struct snd_soc_tplg_hdr *hdr)
@@ -2685,19 +2696,31 @@ static int soc_valid_header(struct soc_tplg *tplg,
 		return -EINVAL;
 	}
 
-	if (tplg->pass == le32_to_cpu(hdr->type))
+	return 1;
+}
+
+/* check and load the element for the current pass */
+static int soc_pass_load(struct soc_tplg *tplg,
+			 struct snd_soc_tplg_hdr *hdr,
+			 unsigned int hdr_pass)
+{
+	if (tplg->pass == hdr_pass) {
 		dev_dbg(tplg->dev,
 			"ASoC: Got 0x%x bytes of type %d version %d vendor %d at pass %d\n",
 			hdr->payload_size, hdr->type, hdr->version,
 			hdr->vendor_type, tplg->pass);
+		return elem_load[hdr_pass](tplg, hdr);
+	}
 
-	return 1;
+	return 0;
 }
 
 /* check header type and call appropriate handler */
 static int soc_tplg_load_header(struct soc_tplg *tplg,
 	struct snd_soc_tplg_hdr *hdr)
 {
+	unsigned int hdr_pass;
+
 	tplg->pos = tplg->hdr_pos + sizeof(struct snd_soc_tplg_hdr);
 
 	/* check for matching ID */
@@ -2711,27 +2734,35 @@ static int soc_tplg_load_header(struct soc_tplg *tplg,
 	case SND_SOC_TPLG_TYPE_MIXER:
 	case SND_SOC_TPLG_TYPE_ENUM:
 	case SND_SOC_TPLG_TYPE_BYTES:
-		return soc_tplg_kcontrol_elems_load(tplg, hdr);
+		hdr_pass = SOC_TPLG_PASS_MIXER;
+		break;
 	case SND_SOC_TPLG_TYPE_DAPM_GRAPH:
-		return soc_tplg_dapm_graph_elems_load(tplg, hdr);
+		hdr_pass = SOC_TPLG_PASS_GRAPH;
+		break;
 	case SND_SOC_TPLG_TYPE_DAPM_WIDGET:
-		return soc_tplg_dapm_widget_elems_load(tplg, hdr);
+		hdr_pass = SOC_TPLG_PASS_WIDGET;
+		break;
 	case SND_SOC_TPLG_TYPE_PCM:
-		return soc_tplg_pcm_elems_load(tplg, hdr);
+		hdr_pass = SOC_TPLG_PASS_PCM_DAI;
+		break;
 	case SND_SOC_TPLG_TYPE_DAI:
-		return soc_tplg_dai_elems_load(tplg, hdr);
+		hdr_pass = SOC_TPLG_PASS_BE_DAI;
+		break;
 	case SND_SOC_TPLG_TYPE_DAI_LINK:
 	case SND_SOC_TPLG_TYPE_BACKEND_LINK:
 		/* physical link configurations */
-		return soc_tplg_link_elems_load(tplg, hdr);
+		hdr_pass = SOC_TPLG_PASS_LINK;
+		break;
 	case SND_SOC_TPLG_TYPE_MANIFEST:
-		return soc_tplg_manifest_load(tplg, hdr);
+		hdr_pass = SOC_TPLG_PASS_MANIFEST;
+		break;
 	default:
 		/* bespoke vendor data object */
-		return soc_tplg_vendor_load(tplg, hdr);
+		hdr_pass = SOC_TPLG_PASS_VENDOR;
+		break;
 	}
 
-	return 0;
+	return soc_pass_load(tplg, hdr, hdr_pass);
 }
 
 /* process the topology file headers */
-- 
2.25.1

