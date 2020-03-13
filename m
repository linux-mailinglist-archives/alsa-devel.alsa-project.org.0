Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DADB184769
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 14:05:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1060E17FD;
	Fri, 13 Mar 2020 14:04:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1060E17FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584104749;
	bh=mZxrX7U2wtQSqw03yd5cZIVg3aRCNvFYwF9FEReQkTE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i9ZL2vNaVOhorQr2OB1zCfktkaVdt61Cd1IaE0S7qsTE3+FT+uJWBNDAsBPqiL9zR
	 HhaAcLKIs1F3rzm0YUq5hmzDxx5/muhvn4boBg2YCcDxUvEaWoBN9t8I1/lnyrTR1n
	 z/1AbCalK8KBbJ8OgZq7IIZicbow1O/MgE+/C3qc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67B88F80090;
	Fri, 13 Mar 2020 14:03:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13048F8028B; Fri, 13 Mar 2020 14:03:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 996B7F8023E
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 14:03:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 996B7F8023E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 23F50B001;
 Fri, 13 Mar 2020 13:03:36 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: wm_adsp: Use scnprintf() for the limited buffer output
Date: Fri, 13 Mar 2020 14:03:34 +0100
Message-Id: <20200313130334.9028-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>
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

snprintf() is a hard-to-use function, it's especially difficult to use
it for concatenating substrings in a buffer with a limited size.
Since snprintf() returns the would-be-output size, not the actual
size, the subsequent use of snprintf() may point to the incorrect
position.

Use scnprintf() instead for fixing such potential errors.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wm_adsp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index d3d32b501aca..ffb9836e0538 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1436,12 +1436,12 @@ static int wm_adsp_create_control(struct wm_adsp *dsp,
 		subname = NULL; /* don't append subname */
 		break;
 	case 2:
-		ret = snprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
+		ret = scnprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
 				"%s%c %.12s %x", dsp->name, *region_name,
 				wm_adsp_fw_text[dsp->fw], alg_region->alg);
 		break;
 	default:
-		ret = snprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
+		ret = scnprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
 				"%s %.12s %x", dsp->name,
 				wm_adsp_fw_text[dsp->fw], alg_region->alg);
 		break;
-- 
2.16.4

