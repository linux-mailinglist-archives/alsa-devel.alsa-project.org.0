Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E85CDD8F
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 10:45:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 048A086E;
	Mon,  7 Oct 2019 10:44:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 048A086E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570437907;
	bh=tHcQ3IdU/RcNidVX6WJlcsee624Q+Bt+U+Krd6NJ2Vs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pRa93agjnmcSpQ3cBquF7dHtxhUeU3RJ6p2GJkPeAdSjeF8S0rkB5hJSdYcmZQjHa
	 Jk/px1qaSr5yAYmUooJwjosd1wwdokbiKBZUkAXgWBpEMIXox5Mw4ZI6Nix9izGUfs
	 mTo1HY3GLV2uaCxbkoDhBLCXXfmm5N5U3EB+UJSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B709EF80096;
	Mon,  7 Oct 2019 10:41:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A126AF80534; Mon,  7 Oct 2019 10:41:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BF8AF80137
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 10:41:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BF8AF80137
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Oct 2019 01:41:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,267,1566889200"; d="scan'208";a="222845065"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.41.73])
 by fmsmga002.fm.intel.com with ESMTP; 07 Oct 2019 01:41:36 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  7 Oct 2019 10:41:33 +0200
Message-Id: <20191007084133.7674-3-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007084133.7674-1-guennadi.liakhovetski@linux.intel.com>
References: <20191007084133.7674-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Subject: [alsa-devel] [PATCH 2/2] ASoC: topology: don't access beyond
	topology data
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

When loading kcontrol elements make sure to first check the size of
available data before accessing it.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/soc-topology.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index d1d3c6f..f933ad4 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1115,11 +1115,11 @@ static int soc_tplg_kcontrol_elems_load(struct soc_tplg *tplg,
 	struct snd_soc_tplg_hdr *hdr)
 {
 	struct snd_soc_tplg_ctl_hdr *control_hdr;
+	ssize_t remainder = le32_to_cpu(hdr->payload_size);
 	int i;
 
 	if (tplg->pass != SOC_TPLG_PASS_MIXER) {
-		tplg->pos += le32_to_cpu(hdr->size) +
-			le32_to_cpu(hdr->payload_size);
+		tplg->pos += le32_to_cpu(hdr->size) + remainder;
 		return 0;
 	}
 
@@ -1130,6 +1130,11 @@ static int soc_tplg_kcontrol_elems_load(struct soc_tplg *tplg,
 
 		control_hdr = (struct snd_soc_tplg_ctl_hdr *)tplg->pos;
 
+		if (remainder < sizeof(*control_hdr)) {
+			dev_err(tplg->dev, "ASoC: invalid payload size\n");
+			return -EINVAL;
+		}
+
 		if (le32_to_cpu(control_hdr->size) != sizeof(*control_hdr)) {
 			dev_err(tplg->dev, "ASoC: invalid control size\n");
 			return -EINVAL;
@@ -1143,25 +1148,24 @@ static int soc_tplg_kcontrol_elems_load(struct soc_tplg *tplg,
 		case SND_SOC_TPLG_CTL_RANGE:
 		case SND_SOC_TPLG_DAPM_CTL_VOLSW:
 		case SND_SOC_TPLG_DAPM_CTL_PIN:
-			soc_tplg_dmixer_create(tplg, 1,
-					       le32_to_cpu(hdr->payload_size));
+			soc_tplg_dmixer_create(tplg, 1, remainder);
 			break;
 		case SND_SOC_TPLG_CTL_ENUM:
 		case SND_SOC_TPLG_CTL_ENUM_VALUE:
 		case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
 		case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
 		case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
-			soc_tplg_denum_create(tplg, 1,
-					      le32_to_cpu(hdr->payload_size));
+			soc_tplg_denum_create(tplg, 1, remainder);
 			break;
 		case SND_SOC_TPLG_CTL_BYTES:
-			soc_tplg_dbytes_create(tplg, 1,
-					       le32_to_cpu(hdr->payload_size));
+			soc_tplg_dbytes_create(tplg, 1, remainder);
 			break;
 		default:
 			soc_bind_err(tplg, control_hdr, i);
 			return -EINVAL;
 		}
+
+		remainder -= tplg->pos - (u8 *)control_hdr;
 	}
 
 	return 0;
-- 
1.9.3

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
