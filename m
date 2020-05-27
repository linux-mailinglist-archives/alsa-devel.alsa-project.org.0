Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 328F61E3570
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 04:18:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7D541797;
	Wed, 27 May 2020 04:18:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7D541797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590545937;
	bh=r7g49y2IJNqKWj74lUbPMV0D/B3u/uBwuWcWv3MXUmk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PiNSXy42CkIu4/ag0nurZD4xP0LEVWOv6fIm0kJRv6/V1O4KIS/t1oX5GucU9TI1c
	 +Nzntwje/ybvWjv1iK5N+k9zocIEsmfgFMpL4CXMW53Di9HgMODRrPHe2O+F7/RDZ8
	 sibS1PFttf6vPnhxOIlhyeatU56Vv0ZR4Iwx+lTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EF2AF8026F;
	Wed, 27 May 2020 04:16:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87E69F80227; Wed, 27 May 2020 04:16:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6674FF8016F
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 04:16:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6674FF8016F
IronPort-SDR: /vd244lRaREL0L11rEysHfqi4JTYfsvoh0NuUNNuy+D3A0ZWgUXhmt98aA/FTPY4tgqLsP/ok8
 vcBqc0WNdhkw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 19:16:30 -0700
IronPort-SDR: NqLCT4eNPHlunss7IwV6Zr8ooY/k+o2Ky17CD75vZ0dc6vn0J1T+lmv9zT7M3n332iSOz/hqAu
 S4UalY7p1q6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,439,1583222400"; d="scan'208";a="468534106"
Received: from keyon-x299.sh.intel.com ([10.239.159.75])
 by fmsmga005.fm.intel.com with ESMTP; 26 May 2020 19:16:28 -0700
From: Keyon Jie <yang.jie@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 1/2] ASoC: topology: refine and log the header in the
 correct pass
Date: Wed, 27 May 2020 10:28:00 +0800
Message-Id: <20200527022801.336264-2-yang.jie@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200527022801.336264-1-yang.jie@linux.intel.com>
References: <20200527022801.336264-1-yang.jie@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, tiwai@suse.de,
 Keyon Jie <yang.jie@linux.intel.com>, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, broonie@kernel.org,
 sathya.prakash.m.r@intel.com, vamshi.krishna.gopal@intel.com
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
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Tested-by: Vamshi Kerishna Gopal <vamshi.krishna.gopal@intel.com>
Tested-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-topology.c | 50 +++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 49875978a1ce..f0a1a47d9808 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2685,12 +2685,6 @@ static int soc_valid_header(struct soc_tplg *tplg,
 		return -EINVAL;
 	}
 
-	if (tplg->pass == le32_to_cpu(hdr->type))
-		dev_dbg(tplg->dev,
-			"ASoC: Got 0x%x bytes of type %d version %d vendor %d at pass %d\n",
-			hdr->payload_size, hdr->type, hdr->version,
-			hdr->vendor_type, tplg->pass);
-
 	return 1;
 }
 
@@ -2698,6 +2692,10 @@ static int soc_valid_header(struct soc_tplg *tplg,
 static int soc_tplg_load_header(struct soc_tplg *tplg,
 	struct snd_soc_tplg_hdr *hdr)
 {
+	int (*elem_load)(struct soc_tplg *tplg,
+			 struct snd_soc_tplg_hdr *hdr);
+	unsigned int hdr_pass;
+
 	tplg->pos = tplg->hdr_pos + sizeof(struct snd_soc_tplg_hdr);
 
 	/* check for matching ID */
@@ -2711,24 +2709,48 @@ static int soc_tplg_load_header(struct soc_tplg *tplg,
 	case SND_SOC_TPLG_TYPE_MIXER:
 	case SND_SOC_TPLG_TYPE_ENUM:
 	case SND_SOC_TPLG_TYPE_BYTES:
-		return soc_tplg_kcontrol_elems_load(tplg, hdr);
+		hdr_pass = SOC_TPLG_PASS_MIXER;
+		elem_load = soc_tplg_kcontrol_elems_load;
+		break;
 	case SND_SOC_TPLG_TYPE_DAPM_GRAPH:
-		return soc_tplg_dapm_graph_elems_load(tplg, hdr);
+		hdr_pass = SOC_TPLG_PASS_GRAPH;
+		elem_load = soc_tplg_dapm_graph_elems_load;
+		break;
 	case SND_SOC_TPLG_TYPE_DAPM_WIDGET:
-		return soc_tplg_dapm_widget_elems_load(tplg, hdr);
+		hdr_pass = SOC_TPLG_PASS_WIDGET;
+		elem_load = soc_tplg_dapm_widget_elems_load;
+		break;
 	case SND_SOC_TPLG_TYPE_PCM:
-		return soc_tplg_pcm_elems_load(tplg, hdr);
+		hdr_pass = SOC_TPLG_PASS_PCM_DAI;
+		elem_load = soc_tplg_pcm_elems_load;
+		break;
 	case SND_SOC_TPLG_TYPE_DAI:
-		return soc_tplg_dai_elems_load(tplg, hdr);
+		hdr_pass = SOC_TPLG_PASS_BE_DAI;
+		elem_load = soc_tplg_dai_elems_load;
+		break;
 	case SND_SOC_TPLG_TYPE_DAI_LINK:
 	case SND_SOC_TPLG_TYPE_BACKEND_LINK:
 		/* physical link configurations */
-		return soc_tplg_link_elems_load(tplg, hdr);
+		hdr_pass = SOC_TPLG_PASS_LINK;
+		elem_load = soc_tplg_link_elems_load;
+		break;
 	case SND_SOC_TPLG_TYPE_MANIFEST:
-		return soc_tplg_manifest_load(tplg, hdr);
+		hdr_pass = SOC_TPLG_PASS_MANIFEST;
+		elem_load = soc_tplg_manifest_load;
+		break;
 	default:
 		/* bespoke vendor data object */
-		return soc_tplg_vendor_load(tplg, hdr);
+		hdr_pass = SOC_TPLG_PASS_VENDOR;
+		elem_load = soc_tplg_vendor_load;
+		break;
+	}
+
+	if (tplg->pass == hdr_pass) {
+		dev_dbg(tplg->dev,
+			"ASoC: Got 0x%x bytes of type %d version %d vendor %d at pass %d\n",
+			hdr->payload_size, hdr->type, hdr->version,
+			hdr->vendor_type, tplg->pass);
+		return elem_load(tplg, hdr);
 	}
 
 	return 0;
-- 
2.25.1

