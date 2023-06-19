Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0482F7351E9
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 12:21:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D80F8E0F;
	Mon, 19 Jun 2023 12:20:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D80F8E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687170086;
	bh=j49IbEENujKcSQlB/5c14Ju+CtffyBfHhLHQLlWe9B4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IZxgmdfQV+I17GyyPlbTNU+V+zU3XrE9BMjwlPcA3yjfs71qrKj0HOEDZacoMtCzm
	 hG5un7l8Pf27C1seG8jVfsf2a0AzejlRdPDCdGyG8mfY+B4zpK/sw6ef1fqAx95DfQ
	 6KwX8Zv66pkRnRsgQrkrh9ucIRyX/WFkIUo2aMxM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47E32F805FD; Mon, 19 Jun 2023 12:17:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7E75F805F9;
	Mon, 19 Jun 2023 12:17:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20418F80588; Mon, 19 Jun 2023 12:17:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78CB0F80563
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 12:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78CB0F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nRWtKAtY
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-311275efaf8so1929120f8f.3
        for <alsa-devel@alsa-project.org>;
 Mon, 19 Jun 2023 03:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687169829; x=1689761829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7txYCxaVdCIzUmWm+LpJfmUPkElgoh9gHNmxHigBQcU=;
        b=nRWtKAtYtZwQ37U5rmUB4JNSYm73slYhfU2qV3poD/fHYVfbfqiULogkJ5BqgcNKyl
         yXBVtAri2IGb8PQkNptDRAnrAXe/9VD9FoT0zsWCTvzfOA8wc3qujmcHOfgn2SLYmvUE
         KgkJUqkq2+EnNSKjM5ofw35CVs6/n2NL42/2VWHowCJ6dEMGQY8ONpa0D7RNLj6xXFTu
         jP0a5dxRzZJUd2kFRUUkBVQyIr3gfjJif1S3pCgT1UIaFR/DlgSnKEpqnESDergK59S9
         sSZSH2JX2+HBxGpuw6THiYPOn6YYPD/MeLWR2x5Pbkxbiw7Ax8BrYeAoVH5OUK3DKvk9
         JPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687169829; x=1689761829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7txYCxaVdCIzUmWm+LpJfmUPkElgoh9gHNmxHigBQcU=;
        b=DLEtk9WJFgOviidyMT9U2haZQTrgmYngZey5t8T9fZ8RdvMFXmkLjT9Mrf7MVwm52P
         QqaDE61HMcV+hJcDvUujXJS1PcSLe10xNIlnZ99BviOsybSY5Ty/pwyrgBZuG0Qw4yP2
         oHPamZ48xMH6FTS0TX4KpW0qPJ9GtE9MrRKS7QaoZ3ip1mxO/HM5S/+uo8QHgpvt1dtb
         33AObCyddDgY6KOJNCIUt/Kbn0hJkXkfnfDMTeG6FAteamjzOyoPqhTerJD509/0XvrQ
         SiRkpMbznty511U18ckU6JwicqTIiQaEOq+4hF2kG2bf31gHlcq898zA4tMObjJapYOe
         eqxw==
X-Gm-Message-State: AC+VfDxI+9xuWFNyCUtzwtv7d8LyLMVLiwBfAoFNoBCcW1+3p/yB+G35
	bvm6jj2BDwM2ZHxpPqqh1hdabA==
X-Google-Smtp-Source: 
 ACHHUZ62UqNE78KOzcO6WZERXpwNqPBVI+AS7V7RFiGFsoO6+/Yt0jcotfsbe2XHpKTG089aTTCDeg==
X-Received: by 2002:a5d:6e42:0:b0:306:31fb:1c3e with SMTP id
 j2-20020a5d6e42000000b0030631fb1c3emr5220830wrz.26.1687169828987;
        Mon, 19 Jun 2023 03:17:08 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 c2-20020a5d5282000000b002fae7408544sm31146922wrv.108.2023.06.19.03.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 03:17:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v3 11/11] ASoC: q6dsp: q6apm-dai: Add mmap and copy compress
 DAI callbacks
Date: Mon, 19 Jun 2023 11:16:53 +0100
Message-Id: <20230619101653.9750-12-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230619101653.9750-1-srinivas.kandagatla@linaro.org>
References: <20230619101653.9750-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FL2MOFBAWCW4HXY5XTJITFRR6EN36MRA
X-Message-ID-Hash: FL2MOFBAWCW4HXY5XTJITFRR6EN36MRA
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FL2MOFBAWCW4HXY5XTJITFRR6EN36MRA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add q6apm mmap and copy compress DAI callbacks to support compress
offload playback.

Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 81 ++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index c67147e5388b..5eb0b864c740 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -737,6 +737,85 @@ static int q6apm_dai_compr_set_metadata(struct snd_soc_component *component,
 	return ret;
 }
 
+static int q6apm_dai_compr_mmap(struct snd_soc_component *component,
+				struct snd_compr_stream *stream,
+				struct vm_area_struct *vma)
+{
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct q6apm_dai_rtd *prtd = runtime->private_data;
+	struct device *dev = component->dev;
+
+	return dma_mmap_coherent(dev, vma, prtd->dma_buffer.area, prtd->dma_buffer.addr,
+				 prtd->dma_buffer.bytes);
+}
+
+static int q6apm_compr_copy(struct snd_soc_component *component,
+			    struct snd_compr_stream *stream, char __user *buf,
+			    size_t count)
+{
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct q6apm_dai_rtd *prtd = runtime->private_data;
+	void *dstn;
+	unsigned long flags;
+	size_t copy;
+	u32 wflags = 0;
+	u32 app_pointer;
+	u32 bytes_received;
+	uint32_t bytes_to_write;
+	int avail, bytes_in_flight = 0;
+
+	bytes_received = prtd->bytes_received;
+
+	/**
+	 * Make sure that next track data pointer is aligned at 32 bit boundary
+	 * This is a Mandatory requirement from DSP data buffers alignment
+	 */
+	if (prtd->next_track)
+		bytes_received = ALIGN(prtd->bytes_received, prtd->pcm_count);
+
+	app_pointer = bytes_received/prtd->pcm_size;
+	app_pointer = bytes_received -  (app_pointer * prtd->pcm_size);
+	dstn = prtd->dma_buffer.area + app_pointer;
+
+	if (count < prtd->pcm_size - app_pointer) {
+		if (copy_from_user(dstn, buf, count))
+			return -EFAULT;
+	} else {
+		copy = prtd->pcm_size - app_pointer;
+		if (copy_from_user(dstn, buf, copy))
+			return -EFAULT;
+		if (copy_from_user(prtd->dma_buffer.area, buf + copy, count - copy))
+			return -EFAULT;
+	}
+
+	spin_lock_irqsave(&prtd->lock, flags);
+	bytes_in_flight = prtd->bytes_received - prtd->copied_total;
+
+	if (prtd->next_track) {
+		prtd->next_track = false;
+		prtd->copied_total = ALIGN(prtd->copied_total, prtd->pcm_count);
+		prtd->bytes_sent = ALIGN(prtd->bytes_sent, prtd->pcm_count);
+	}
+
+	prtd->bytes_received = bytes_received + count;
+
+	/* Kick off the data to dsp if its starving!! */
+	if (prtd->state == Q6APM_STREAM_RUNNING && (bytes_in_flight == 0)) {
+		bytes_to_write = prtd->pcm_count;
+		avail = prtd->bytes_received - prtd->bytes_sent;
+
+		if (avail < prtd->pcm_count)
+			bytes_to_write = avail;
+
+		q6apm_write_async(prtd->graph, bytes_to_write, 0, 0, wflags);
+		prtd->bytes_sent += bytes_to_write;
+	}
+
+	spin_unlock_irqrestore(&prtd->lock, flags);
+
+	return count;
+}
+
 static const struct snd_compress_ops q6apm_dai_compress_ops = {
 	.open		= q6apm_dai_compr_open,
 	.free		= q6apm_dai_compr_free,
@@ -747,6 +826,8 @@ static const struct snd_compress_ops q6apm_dai_compress_ops = {
 	.ack		= q6apm_dai_compr_ack,
 	.set_params	= q6apm_dai_compr_set_params,
 	.set_metadata	= q6apm_dai_compr_set_metadata,
+	.mmap		= q6apm_dai_compr_mmap,
+	.copy		= q6apm_compr_copy,
 };
 
 static const struct snd_soc_component_driver q6apm_fe_dai_component = {
-- 
2.21.0

