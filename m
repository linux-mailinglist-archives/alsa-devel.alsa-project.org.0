Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 261EB1B006F
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 06:05:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAB4D167B;
	Mon, 20 Apr 2020 06:05:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAB4D167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587355554;
	bh=+T0/NC+0u6uuNSF94E4rrF4iBJEg5R4K5hVQM+22Uyk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HQRiOKqcEIzd2YEs9NFlIf8pAjswQvLRL6/3LFzVOQjiTAXDtcqE2XIeMLQ45L+r9
	 fc+QiK9TVa42i/A/ro3E4xXjAXfB5pSiTK3KsV9OmBb+kye+FdV+UaAPzi8oTKpuf0
	 CPe18FlP08Kd7cRPfzqvhQg7t+5DG2M79FeWyLDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E4DBF80292;
	Mon, 20 Apr 2020 06:02:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE144F8029B; Mon, 20 Apr 2020 06:02:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BA4AF80292
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 06:02:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BA4AF80292
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 720B091CADBB50EFF986;
 Mon, 20 Apr 2020 12:02:36 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Mon, 20 Apr 2020
 12:02:29 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
 <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: wcd934x: remove unneeded semicolon
Date: Mon, 20 Apr 2020 12:29:11 +0800
Message-ID: <20200420042911.19379-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Cc: Jason Yan <yanaijie@huawei.com>
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

Fix the following coccicheck warning:

sound/soc/codecs/wcd934x.c:3621:2-3: Unneeded semicolon
sound/soc/codecs/wcd934x.c:4270:2-3: Unneeded semicolon
sound/soc/codecs/wcd934x.c:4018:2-3: Unneeded semicolon
sound/soc/codecs/wcd934x.c:4043:2-3: Unneeded semicolon
sound/soc/codecs/wcd934x.c:3804:2-3: Unneeded semicolon
sound/soc/codecs/wcd934x.c:3866:2-3: Unneeded semicolon
sound/soc/codecs/wcd934x.c:3596:2-3: Unneeded semicolon
sound/soc/codecs/wcd934x.c:3542:2-3: Unneeded semicolon
sound/soc/codecs/wcd934x.c:3673:2-3: Unneeded semicolon
sound/soc/codecs/wcd934x.c:3723:2-3: Unneeded semicolon
sound/soc/codecs/wcd934x.c:2492:2-3: Unneeded semicolon
sound/soc/codecs/wcd934x.c:1790:3-4: Unneeded semicolon
sound/soc/codecs/wcd934x.c:1806:3-4: Unneeded semicolon
sound/soc/codecs/wcd934x.c:1812:2-3: Unneeded semicolon

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 sound/soc/codecs/wcd934x.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 5269857e2746..a514eb32e3e6 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1787,7 +1787,7 @@ static int wcd934x_hw_params(struct snd_pcm_substream *substream,
 				params_rate(params));
 			return -EINVAL;
 
-		};
+		}
 
 		ret = wcd934x_set_decimator_rate(dai, tx_fs_rate,
 						 params_rate(params));
@@ -1803,13 +1803,13 @@ static int wcd934x_hw_params(struct snd_pcm_substream *substream,
 			dev_err(wcd->dev, "Invalid format 0x%x\n",
 				params_width(params));
 			return -EINVAL;
-		};
+		}
 		break;
 	default:
 		dev_err(wcd->dev, "Invalid stream type %d\n",
 			substream->stream);
 		return -EINVAL;
-	};
+	}
 
 	wcd->dai[dai->id].sconfig.rate = params_rate(params);
 	wcd934x_slim_set_hw_params(wcd, &wcd->dai[dai->id], substream->stream);
@@ -2489,7 +2489,7 @@ static int wcd934x_compander_set(struct snd_kcontrol *kc,
 		break;
 	default:
 		break;
-	};
+	}
 
 	return 0;
 }
@@ -3539,7 +3539,7 @@ static int wcd934x_codec_enable_mix_path(struct snd_soc_dapm_widget *w,
 		val += offset_val;
 		snd_soc_component_write(comp, gain_reg, val);
 		break;
-	};
+	}
 
 	return 0;
 }
@@ -3593,7 +3593,7 @@ static int wcd934x_codec_enable_main_path(struct snd_soc_dapm_widget *w,
 		snd_soc_component_write(comp, gain_reg,
 				snd_soc_component_read32(comp, gain_reg));
 		break;
-	};
+	}
 
 	return 0;
 }
@@ -3618,7 +3618,7 @@ static int wcd934x_codec_ear_dac_event(struct snd_soc_dapm_widget *w,
 		wcd_clsh_ctrl_set_state(wcd->clsh_ctrl, WCD_CLSH_EVENT_POST_PA,
 					WCD_CLSH_STATE_EAR, CLS_H_NORMAL);
 		break;
-	};
+	}
 
 	return 0;
 }
@@ -3670,7 +3670,7 @@ static int wcd934x_codec_hphl_dac_event(struct snd_soc_dapm_widget *w,
 		break;
 	default:
 		break;
-	};
+	}
 
 	return 0;
 }
@@ -3720,7 +3720,7 @@ static int wcd934x_codec_hphr_dac_event(struct snd_soc_dapm_widget *w,
 		break;
 	default:
 		break;
-	};
+	}
 
 	return 0;
 }
@@ -3801,7 +3801,7 @@ static int wcd934x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
 		 */
 		usleep_range(20000, 20100);
 		break;
-	};
+	}
 
 	return 0;
 }
@@ -3863,7 +3863,7 @@ static int wcd934x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
 		 */
 		usleep_range(20000, 20100);
 		break;
-	};
+	}
 
 	return 0;
 }
@@ -4015,7 +4015,7 @@ static int wcd934x_codec_enable_dmic(struct snd_soc_dapm_widget *w,
 		dev_err(comp->dev, "%s: Invalid DMIC Selection\n",
 			__func__);
 		return -EINVAL;
-	};
+	}
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -4040,7 +4040,7 @@ static int wcd934x_codec_enable_dmic(struct snd_soc_dapm_widget *w,
 			snd_soc_component_update_bits(comp, dmic_clk_reg,
 						      dmic_clk_en, 0);
 		break;
-	};
+	}
 
 	return 0;
 }
@@ -4267,7 +4267,7 @@ static int wcd934x_codec_enable_dec(struct snd_soc_dapm_widget *w,
 					      WCD934X_DEC_PWR_LVL_MASK,
 					      WCD934X_DEC_PWR_LVL_DF);
 		break;
-	};
+	}
 out:
 	kfree(wname);
 	return ret;
-- 
2.21.1

