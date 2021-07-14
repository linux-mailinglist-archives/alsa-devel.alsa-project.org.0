Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9CE3C87D1
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 17:36:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E834016B1;
	Wed, 14 Jul 2021 17:36:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E834016B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626277016;
	bh=cmcp0BYMT+0jRdXMRfQvN1bV/xGws2EsEtNHoDSFakg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kLK9y5Y+sI0m1C23PQJU4LcuerFVYsJWGwaz96CXKAJMkpIkEF32hPL7eD/SJdY8b
	 GYA3eguBswYHkLSQ5YlHmsEWqbIPISuu5kICQagjWW/tMNhwTZJV740xkGrAYfQRBo
	 +MWeEGHT1skknjjYtc8juQRrtgXB69YmDguK509Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFB5EF80551;
	Wed, 14 Jul 2021 17:31:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59BAAF8053A; Wed, 14 Jul 2021 17:31:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E812F80517
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 17:31:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E812F80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="I9awJWJ0"
Received: by mail-wm1-x334.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so4182479wmi.2
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 08:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/OyLLqXUZS1RpS+YuJ/yD57hTXnorkIuGBmzsYS7+c4=;
 b=I9awJWJ0TeowLx8ez7hQQZ/8uuMucKaiP0yybxoMUtTzmz+q9AuGACZsNk4a1dv1vn
 3zsplkFV6BR0AaOQKcx+YX73pjEwcEboTLS2zlV1drc9hjq15nfUlPo8y60oKguSMZn1
 ffeEPFk0EekBEpfBL0jXzkhgvuXrXN30/ZXkeu1LZry0im3i3gOGtxFC4dcUttgzwq9j
 5cWwAbbiXdgSbwUrZNLpef0zckbyjC77iqz2aLQG62TWbEyPNlqVIEQtzPs/vELhVeDa
 8ebT5xlk91pGSlnmm0z81JflnM7bgGD/Vl9kB8gnaKpmsyw92587tFyKWXyCLVVY+hyp
 rGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/OyLLqXUZS1RpS+YuJ/yD57hTXnorkIuGBmzsYS7+c4=;
 b=eJRcrMXolWwtuumM37Sd0ITPjAUpEeAmceSvkc2F9t+FOqLCUuAeY3j8eanav88xNP
 vaSwPlcM2NkP7nHov5tpDYX6YWZLW7uX+6PjR7nQQjz15DJ/9tlGQFdTVy7LYCCQw3BH
 PYzsoqqAFPdfn6b+loR7vuEV4YdNpz5w2WE6uKM5gSMTO4DAgJB9QTO5BS3VMJPqOW1o
 RhIKaCIjCFy70wk6e/Ib+Ef3CO4goFaSuP7bV3smN8HbYgPC3up/c9oa3Hf5SYCStCq3
 RZaSSXgCrQQzKjDZ2zqKPbZfM2W/J5rqgojnBrjD77ZtoEoFUhzWQRGEHUWJxUptgzxq
 jsmA==
X-Gm-Message-State: AOAM530IcwR0Wa1hg4OzQuBBXwR8WwE6YJu3U620l3c5TnmaEbylWDIW
 LuEFaom4jC39wNgiyMXRxaMwog==
X-Google-Smtp-Source: ABdhPJw2hvqQsZQb1WOpVNbwCMQq/ueOlos522YhpGCyQEfSKmNIq0bd5/Bxni1/zrsfBOuKSxXr+A==
X-Received: by 2002:a1c:9dd6:: with SMTP id g205mr12006785wme.82.1626276677494; 
 Wed, 14 Jul 2021 08:31:17 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id y6sm2465174wma.48.2021.07.14.08.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:31:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v2 15/16] ASoC: qcom: audioreach: topology add dapm pga support
Date: Wed, 14 Jul 2021 16:30:38 +0100
Message-Id: <20210714153039.28373-16-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, linux-kernel@vger.kernel.org
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

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/audioreach/topology.c | 62 +++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/audioreach/topology.c b/sound/soc/qcom/audioreach/topology.c
index 8080243a47ef..14ecb115e63e 100644
--- a/sound/soc/qcom/audioreach/topology.c
+++ b/sound/soc/qcom/audioreach/topology.c
@@ -706,6 +706,25 @@ static int audioreach_widget_load_mixer(struct snd_soc_component *component,
 	return 0;
 }
 
+static int audioreach_widget_load_pga(struct snd_soc_component *component,
+					int index, struct snd_soc_dapm_widget *w,
+					struct snd_soc_tplg_dapm_widget *tplg_w)
+{
+	struct audioreach_module *mod;
+	struct snd_soc_dobj *dobj;
+	int ret;
+
+	ret = audioreach_widget_load_module_common(component, index, w, tplg_w);
+	if (ret)
+		return ret;
+
+	dobj = &w->dobj;
+	mod = dobj->private;
+	mod->gain = VOL_CTRL_DEFAULT_GAIN;
+
+	return 0;
+}
+
 static int audioreach_widget_ready(struct snd_soc_component *component,
 				   int index, struct snd_soc_dapm_widget *w,
 				   struct snd_soc_tplg_dapm_widget *tplg_w)
@@ -725,8 +744,9 @@ static int audioreach_widget_ready(struct snd_soc_component *component,
 		break;
 	case snd_soc_dapm_mixer:
 		return audioreach_widget_load_mixer(component, index, w, tplg_w);
-	case snd_soc_dapm_dai_link:
 	case snd_soc_dapm_pga:
+		return audioreach_widget_load_pga(component, index, w, tplg_w);
+	case snd_soc_dapm_dai_link:
 	case snd_soc_dapm_scheduler:
 	case snd_soc_dapm_out_drv:
 	default:
@@ -898,6 +918,40 @@ static int audioreach_put_audio_mixer(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int audioreach_get_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct audioreach_module *mod = dw->dobj.private;
+
+	/* Check if the graph is active or not */
+	ucontrol->value.integer.value[0] = mod->gain;
+
+	return 0;
+}
+
+static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *c = snd_soc_dapm_to_component(dapm);
+	struct audioreach_module *mod = dw->dobj.private;
+	struct q6apm *apm = dev_get_drvdata(c->dev);
+	int vol = ucontrol->value.integer.value[0];
+
+	/* Check if the graph is active or not */
+	if (dw->power) {
+		audioreach_gain_set_vol_ctrl(apm, mod, vol);
+		mod->gain = vol;
+		return 1;
+	}
+
+	dev_err(apm->dev, "Unable to set volume as graph is not	active\n");
+	return 0;
+
+}
+
 static int audioreach_control_load_mix(struct snd_soc_component *scomp,
 					  struct snd_ar_control *scontrol,
 					  struct snd_kcontrol_new *kc,
@@ -948,6 +1002,10 @@ static int audioreach_control_load(struct snd_soc_component *scomp, int index,
 		dobj = &sm->dobj;
 		ret = audioreach_control_load_mix(scomp, scontrol, kc, hdr);
 		break;
+	case SND_SOC_AR_TPLG_VOL_CTL:
+		sm = (struct soc_mixer_control *)kc->private_value;
+		dobj = &sm->dobj;
+		break;
 	default:
 		dev_warn(scomp->dev, "control type not supported %d:%d:%d\n",
 			 hdr->ops.get, hdr->ops.put, hdr->ops.info);
@@ -972,6 +1030,8 @@ static int audioreach_control_unload(struct snd_soc_component *scomp,
 static const struct snd_soc_tplg_kcontrol_ops audioreach_io_ops[] = {
 	{SND_SOC_AR_TPLG_FE_BE_GRAPH_CTL_MIX, audioreach_get_audio_mixer,
 		audioreach_put_audio_mixer, snd_soc_info_volsw},
+	{SND_SOC_AR_TPLG_VOL_CTL, audioreach_get_vol_ctrl_audio_mixer,
+		audioreach_put_vol_ctrl_audio_mixer, snd_soc_info_volsw},
 };
 
 static struct snd_soc_tplg_ops audioreach_tplg_ops  = {
-- 
2.21.0

