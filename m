Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C9B292BDD
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Oct 2020 18:50:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DB6616F0;
	Mon, 19 Oct 2020 18:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DB6616F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603126255;
	bh=ys4jbGOKMKnHVoc6aZyFjkzcU2PlaKI287u/jWXFVws=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EzhS1W9AG3ZtO6h63tEBYbAQVrKaR3ZWAGzX8cHuSGf/GuBJ2YgAeTWAuysEzsz11
	 As+ites1nF0j5C80/uFRuhIj0HrK+s0KxHXWVj71xnK65k1Ot/cfUIcZfluDz+GNHL
	 D9aIi7XTTLb8uBt9Z2lfYle9R13j8/I6iuPncXqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC815F8010F;
	Mon, 19 Oct 2020 18:49:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42316F80247; Mon, 19 Oct 2020 18:49:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43B57F80121
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 18:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43B57F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="gC392Ugl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603126147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=sJQCEGKu+7J2g9sl/DD8wOwXP+mAnDlq/0Z9hSiUcos=;
 b=gC392Ugl/On9BT7zvKkCTIKvZvuO8NhFbOSv7OPUMCTosmsSzBvcV46Lo4W9w0/BFQ2GWf
 QmT4z5j3KeWKOkIKlUnzDKQWu32kiWb/ki2KF7Okd3EuTEll8PiwEDgIIZjJ+fULLTT7ZK
 ZiyJH5+R649e/Rv1PdCboDkuqG6B1fg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-kfNA1L76MQyHbGfxEBjyyQ-1; Mon, 19 Oct 2020 12:49:06 -0400
X-MC-Unique: kfNA1L76MQyHbGfxEBjyyQ-1
Received: by mail-qt1-f198.google.com with SMTP id e8so322500qtp.18
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 09:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sJQCEGKu+7J2g9sl/DD8wOwXP+mAnDlq/0Z9hSiUcos=;
 b=QgHvM2jLQnkXf7QzfX2bE80yFTjlm33+WRGRf5WU0Pn9vbgQkp2eNcAND7Qf4yPi9s
 GkPqoALZHkbMiQ/IRqDNvjVTYasN3EFE7sBN4IUUaN4JXWT234+/i4+RBIPrHryYKa2h
 gVerXgEFdpkJRdcql1YI2E2OyoajYtbHeyajdJT/xNod7hY8JEENJXsJbQpFuHRaevDU
 prSICY/lJzxeVc8Ih3ENGiqiymb/JNNsFDpbdyS3NHArwT3WDGQLDPZ10pEaAwwpejJY
 YNFIR04AS1MEfHCFxiC+rSjPEMU5ImMHpGMkS58RZGyJOKfFBihD9bZiHTiMK0bTQUjU
 TykA==
X-Gm-Message-State: AOAM532kcgKL1DaGVv+tb8nVTm6Z7n72h5G5u0hyMLJDlx/WNDapBymt
 kbn8tP2sDaey8RisoZ5ZrhCOw2ZI31HrNmWo/bxhaxvo9ydF2OZ1dtVG/0sIqtCxSM2MyaLfBUe
 EypibKH7C9Ww71PW3tsMdyTk=
X-Received: by 2002:ac8:578f:: with SMTP id v15mr302593qta.81.1603126145530;
 Mon, 19 Oct 2020 09:49:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztOuWU9eE0mRhBQidaHF2cKWIUv8qEqHdvb+DEEKb9KvF6xBY+qI+Yp3ARCp3WCzDS2HZ50w==
X-Received: by 2002:ac8:578f:: with SMTP id v15mr302531qta.81.1603126145032;
 Mon, 19 Oct 2020 09:49:05 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id w40sm181382qtj.48.2020.10.19.09.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 09:49:04 -0700 (PDT)
From: trix@redhat.com
To: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 yang.jie@linux.intel.com, peter.ujfalusi@ti.com, arnd@arndb.de,
 romain.perier@gmail.com, naoki.hayama@lineo.co.jp, allen.lkml@gmail.com,
 kuninori.morimoto.gx@renesas.com, srinivas.kandagatla@linaro.org,
 ranjani.sridharan@linux.intel.com, baolin.wang@linaro.org,
 Julia.Lawall@inria.fr
Subject: [PATCH] sound: remove unneeded break
Date: Mon, 19 Oct 2020 09:48:57 -0700
Message-Id: <20201019164857.27223-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Cc: Tom Rix <trix@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a return, goto
or break

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/pci/rme32.c                 | 1 -
 sound/pci/rme9652/hdspm.c         | 8 --------
 sound/pci/rme9652/rme9652.c       | 7 -------
 sound/soc/codecs/wcd-clsh-v2.c    | 1 -
 sound/soc/codecs/wl1273.c         | 1 -
 sound/soc/intel/skylake/skl-pcm.c | 1 -
 sound/soc/ti/davinci-mcasp.c      | 1 -
 7 files changed, 20 deletions(-)

diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index 869af8a32c98..4eabece4dcba 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -468,7 +468,6 @@ static int snd_rme32_capture_getrate(struct rme32 * rme32, int *is_adat)
 			return 32000;
 		default:
 			return -1;
-			break;
 		} 
 	else
 		switch (n) {	/* supporting the CS8412 */
diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 4a1f576dd9cf..3382c069fd3d 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -2286,7 +2286,6 @@ static int hdspm_get_wc_sample_rate(struct hdspm *hdspm)
 	case AIO:
 		status = hdspm_read(hdspm, HDSPM_RD_STATUS_1);
 		return (status >> 16) & 0xF;
-		break;
 	case AES32:
 		status = hdspm_read(hdspm, HDSPM_statusRegister);
 		return (status >> HDSPM_AES32_wcFreq_bit) & 0xF;
@@ -2312,7 +2311,6 @@ static int hdspm_get_tco_sample_rate(struct hdspm *hdspm)
 		case AIO:
 			status = hdspm_read(hdspm, HDSPM_RD_STATUS_1);
 			return (status >> 20) & 0xF;
-			break;
 		case AES32:
 			status = hdspm_read(hdspm, HDSPM_statusRegister);
 			return (status >> 1) & 0xF;
@@ -2338,7 +2336,6 @@ static int hdspm_get_sync_in_sample_rate(struct hdspm *hdspm)
 		case AIO:
 			status = hdspm_read(hdspm, HDSPM_RD_STATUS_2);
 			return (status >> 12) & 0xF;
-			break;
 		default:
 			break;
 		}
@@ -2358,7 +2355,6 @@ static int hdspm_get_aes_sample_rate(struct hdspm *hdspm, int index)
 	case AES32:
 		timecode = hdspm_read(hdspm, HDSPM_timecodeRegister);
 		return (timecode >> (4*index)) & 0xF;
-		break;
 	default:
 		break;
 	}
@@ -3845,7 +3841,6 @@ static int hdspm_wc_sync_check(struct hdspm *hdspm)
 				return 1;
 		}
 		return 0;
-		break;
 
 	case MADI:
 		status2 = hdspm_read(hdspm, HDSPM_statusRegister2);
@@ -3856,7 +3851,6 @@ static int hdspm_wc_sync_check(struct hdspm *hdspm)
 				return 1;
 		}
 		return 0;
-		break;
 
 	case RayDAT:
 	case AIO:
@@ -3868,8 +3862,6 @@ static int hdspm_wc_sync_check(struct hdspm *hdspm)
 			return 1;
 		return 0;
 
-		break;
-
 	case MADIface:
 		break;
 	}
diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index 7ab10028d9fa..012fbec5e6a7 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -732,34 +732,27 @@ static inline int rme9652_spdif_sample_rate(struct snd_rme9652 *s)
 	switch (rme9652_decode_spdif_rate(rate_bits)) {
 	case 0x7:
 		return 32000;
-		break;
 
 	case 0x6:
 		return 44100;
-		break;
 
 	case 0x5:
 		return 48000;
-		break;
 
 	case 0x4:
 		return 88200;
-		break;
 
 	case 0x3:
 		return 96000;
-		break;
 
 	case 0x0:
 		return 64000;
-		break;
 
 	default:
 		dev_err(s->card->dev,
 			"%s: unknown S/PDIF input rate (bits = 0x%x)\n",
 			   s->card_name, rate_bits);
 		return 0;
-		break;
 	}
 }
 
diff --git a/sound/soc/codecs/wcd-clsh-v2.c b/sound/soc/codecs/wcd-clsh-v2.c
index 1be82113c59a..817d8259758c 100644
--- a/sound/soc/codecs/wcd-clsh-v2.c
+++ b/sound/soc/codecs/wcd-clsh-v2.c
@@ -480,7 +480,6 @@ static int _wcd_clsh_ctrl_set_state(struct wcd_clsh_ctrl *ctrl, int req_state,
 	case WCD_CLSH_STATE_HPHR:
 		wcd_clsh_state_hph_r(ctrl, req_state, is_enable, mode);
 		break;
-		break;
 	case WCD_CLSH_STATE_LO:
 		wcd_clsh_state_lo(ctrl, req_state, is_enable, mode);
 		break;
diff --git a/sound/soc/codecs/wl1273.c b/sound/soc/codecs/wl1273.c
index c56b9329240f..d8ced4559bf2 100644
--- a/sound/soc/codecs/wl1273.c
+++ b/sound/soc/codecs/wl1273.c
@@ -311,7 +311,6 @@ static int wl1273_startup(struct snd_pcm_substream *substream,
 		break;
 	default:
 		return -EINVAL;
-		break;
 	}
 
 	return 0;
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index bbe8d782e0af..b1ca64d2f7ea 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -502,7 +502,6 @@ static int skl_pcm_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (ret < 0)
 			return ret;
 		return skl_run_pipe(skl, mconfig->pipe);
-		break;
 
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index a6b72ad53b43..2d85cc4c67fb 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -2385,7 +2385,6 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "No DMA controller found (%d)\n", ret);
 	case -EPROBE_DEFER:
 		goto err;
-		break;
 	}
 
 	if (ret) {
-- 
2.18.1

