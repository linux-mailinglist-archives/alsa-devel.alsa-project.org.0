Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A05487D95D8
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 12:59:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA062E0E;
	Fri, 27 Oct 2023 12:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA062E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698404397;
	bh=Lu2PJetzLbuTwsyEbZUs5w16F02PpIxjpeR63OofwJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B6I44rjrZ/D84TBUUuR7T3pgu3DWyEVOJVYL+5CLtj2fi0Yu5bdY6Do/RPd1i8dWZ
	 rcxV1d++AC5iKRHblO+To/4Avna8/ns18eD1Fsk07WO7JtqUPEMZJ6rYn5qVj3ubb6
	 STtBtabqLZPYjz7mAaJEhsIWNvr3ZjFKMKSkEVRA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19BF9F8010B; Fri, 27 Oct 2023 12:58:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE8BAF80570;
	Fri, 27 Oct 2023 12:58:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B864F8019B; Fri, 27 Oct 2023 12:58:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 772FDF8010B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 12:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 772FDF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=U9PrFfpb
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40839652b97so14064935e9.3
        for <alsa-devel@alsa-project.org>;
 Fri, 27 Oct 2023 03:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698404286; x=1699009086;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XkBdStWyOQZPgBS6S/Ka3+9ogTtzOlDV9P3Ay7BAQI=;
        b=U9PrFfpbtvD8DRQ/fuMmcy7xTQlzAtsCFmH7zlALAidEdDzy5i543YYGzm73Vknwv1
         9DZuMmC70gZaDesoL1rcAH6tw142J5kmObbimxgCtL24U1W3EFa2S/zdFsMgpWIiTxNw
         EKQgwx3fBvaE5uf4S9LLtU8SoayaaLeDJkIGSXhNhq1ZzTj46CLYdKKRbOlnxpZC1Qh1
         v/nLDkftIlfENJjkQ9VGg6R0ZZbuCX/0+kTx8dwOubqhgPSvXinsVvUY+7/TqpPtmS9L
         Uff10U0+x1Ep0CD5RFEUWFWp6Avjjm2JjsPvjs1NpsqDD+Xk5f6detL/jaqyqnxHX0zX
         /1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698404286; x=1699009086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XkBdStWyOQZPgBS6S/Ka3+9ogTtzOlDV9P3Ay7BAQI=;
        b=qygm0p8P5Uspauk3B21USgOiNuXKMIKUfqBsUDlnbF1gXnr3otO1/9K4ucLT967cqU
         w2w9fEDPrK/9duUUYjw7doGGjAq1VBOMF5YeiET1v69tEH1BuLy8sR3K8qGC+sN3Oego
         uq++ic+pl6LBH3eGO858336lG82SBvo0f+ck5CZzXK/2mO4AufKlQp60Os8pKvOfGN5Y
         Ne7o2lc9ukvevU+9bQNo0Nlees6eF0Y55H/4Sld3JX5/a5zgVD9DL/SicS4sPBLRaaKo
         zXD35xw+qfzP0WzlMei9jYEaP7KnXVNIr5NAtWcCSYLyqqZkD4PLNAdWetiT7hhBtK2w
         xLiw==
X-Gm-Message-State: AOJu0YyJVUUOKTzWBRW3ezT9cWb2VLshQC3c6kEcYd4b5tnNxBZEWxPe
	0SH4TULNhQk4QWNTHpj+uKqx0Q==
X-Google-Smtp-Source: 
 AGHT+IE3n/7ZTwMVhcJx5Pj0MGRIdZXTm5/giEYVamfl4WpRmVJi152Yyfa8zz62tvthZTBvwdHjVA==
X-Received: by 2002:a05:600c:3d9a:b0:408:5ba9:d707 with SMTP id
 bi26-20020a05600c3d9a00b004085ba9d707mr2017805wmb.16.1698404286317;
        Fri, 27 Oct 2023 03:58:06 -0700 (PDT)
Received: from srini-hackbox.lan ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ay32-20020a05600c1e2000b004065daba6casm4819626wmb.46.2023.10.27.03.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 03:58:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Cc: johan@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RFC PATCH 1/2] ASoC: soc-dai: add flag to mute and unmute stream
 during trigger
Date: Fri, 27 Oct 2023 11:57:46 +0100
Message-Id: <20231027105747.32450-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231027105747.32450-1-srinivas.kandagatla@linaro.org>
References: <20231027105747.32450-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: T4UPHSHY6EMPTPDU2VRIZ4ODNR2IGLQJ
X-Message-ID-Hash: T4UPHSHY6EMPTPDU2VRIZ4ODNR2IGLQJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T4UPHSHY6EMPTPDU2VRIZ4ODNR2IGLQJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In some setups like Speaker amps which are very sensitive, ex: keeping them
unmute without actual data stream for very short duration results in a
static charge and results in pop and clicks. To minimize this, provide a way
to mute and unmute such codecs during trigger callbacks.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/sound/soc-dai.h |  1 +
 sound/soc/soc-dai.c     |  7 +++++++
 sound/soc/soc-pcm.c     | 12 ++++++++----
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index e3906ecda740..5827b4d882fc 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -355,6 +355,7 @@ struct snd_soc_dai_ops {
 
 	/* bit field */
 	unsigned int no_capture_mute:1;
+	unsigned int mute_unmute_on_trigger:1;
 };
 
 struct snd_soc_cdai_ops {
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 02dd64dea179..28d8c6c3d3b2 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -641,6 +641,10 @@ int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream,
 			ret = soc_dai_trigger(dai, substream, cmd);
 			if (ret < 0)
 				break;
+
+			if (dai->driver->ops && dai->driver->ops->mute_unmute_on_trigger)
+				snd_soc_dai_digital_mute(dai, 0, substream->stream);
+
 			soc_dai_mark_push(dai, substream, trigger);
 		}
 		break;
@@ -651,6 +655,9 @@ int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream,
 			if (rollback && !soc_dai_mark_match(dai, substream, trigger))
 				continue;
 
+			if (dai->driver->ops && dai->driver->ops->mute_unmute_on_trigger)
+				snd_soc_dai_digital_mute(dai, 1, substream->stream);
+
 			r = soc_dai_trigger(dai, substream, cmd);
 			if (r < 0)
 				ret = r; /* use last ret */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 3aa6b988cb4b..0f9f4da25158 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -703,8 +703,10 @@ static int soc_pcm_clean(struct snd_soc_pcm_runtime *rtd,
 			if (snd_soc_dai_active(dai) == 0)
 				soc_pcm_set_dai_params(dai, NULL);
 
-			if (snd_soc_dai_stream_active(dai, substream->stream) == 0)
-				snd_soc_dai_digital_mute(dai, 1, substream->stream);
+			if (snd_soc_dai_stream_active(dai, substream->stream) ==  0) {
+				if (dai->driver->ops && !dai->driver->ops->mute_unmute_on_trigger)
+					snd_soc_dai_digital_mute(dai, 1, substream->stream);
+			}
 		}
 	}
 
@@ -898,8 +900,10 @@ static int __soc_pcm_prepare(struct snd_soc_pcm_runtime *rtd,
 	snd_soc_dapm_stream_event(rtd, substream->stream,
 			SND_SOC_DAPM_STREAM_START);
 
-	for_each_rtd_dais(rtd, i, dai)
-		snd_soc_dai_digital_mute(dai, 0, substream->stream);
+	for_each_rtd_dais(rtd, i, dai) {
+		if (dai->driver->ops && !dai->driver->ops->mute_unmute_on_trigger)
+			snd_soc_dai_digital_mute(dai, 0, substream->stream);
+	}
 
 out:
 	return soc_pcm_ret(rtd, ret);
-- 
2.21.0

