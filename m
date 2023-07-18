Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1538757913
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 12:14:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02B76AE9;
	Tue, 18 Jul 2023 12:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02B76AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689675292;
	bh=oaLaMRqImgt+4SPIQJOxgYCSSD/Qgv6EvuRYBuBZ0vA=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EMugo4yeuqnufq90VCyGB1nHfJdHM27OnUMufnBhIFn9H97VSELWtq+L5zIawEP5p
	 TQRQU2/NjKF2WEKjdXUWZPUUGwahwL9dKlHh/kTChpxEEVK2m5cmIYdbYCz91azKz7
	 Cw0IhA35L3PoN4Z6N2r4w4eCcm+rqXFzSUIcaCJI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A043CF804DA; Tue, 18 Jul 2023 12:13:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE950F8027B;
	Tue, 18 Jul 2023 12:13:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 780F5F8032D; Tue, 18 Jul 2023 09:04:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89A6CF80153
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 09:04:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89A6CF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DWWqQQJ7
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b741cf99f8so80964871fa.0
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Jul 2023 00:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689663863; x=1692255863;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W8TB27ZmvdRSRiDtaXR1gH8ehYqkCg1wepT/QIsq0qo=;
        b=DWWqQQJ7EoVLljoW2XhZIz37uamQ7qO7E2TapcyR8xzWy0955J6zb3G+64fcy1td7t
         H7mSGk+Ppi395eqGfkGJ+dd1bjF7sJ3cRF0AwpDFg8raFXuqtyroDI/Edt3H/sNcRj/Z
         Q+zISIBAxKVilClC9eORF5bfCU02OEf9Do6VdinXqzadI+bLjC11g1Jdr2Uj1C1REaAo
         jyKY/98nen6nmJMUPbJKY5CvfGV+XMizFWJB30XjOe7QNw10KHJYaZg2kgNOGk56ay3G
         Oy3a4G//9b3zI4QxafIxmsw7OJTsll4rxhwA+cYdr0G0vLeAuQU19xeKTcWyOVUSDG+u
         dS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689663863; x=1692255863;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W8TB27ZmvdRSRiDtaXR1gH8ehYqkCg1wepT/QIsq0qo=;
        b=Z2qCuj84FTwBkKsFOw3K81w8LOehZqX9KzJN0kxfh6YOSIche+vRziczF7RB2qemHZ
         hoj6wSHfy/s0yWX+vR3pMdIi0kVn3eQgG9i/iInkjscdKBwghJqo1s+VnmACCRYGVX6G
         G432wOLERcwqXOrV/0h1w7WZHdqkHt6O2ZYUOawMtstpE3ubec+lPAPfAoki79m9DaG4
         xpxj+PzKgMtdhjUDo7QiLMEV/cYIHAj1aWCtKeFX51DNhhbqdNvQ3jSvzBfl4fDQyxzL
         3DhkPrDPC6wmnD+nQvdPw+Y23Xk+XRfzpCIqgmzQ2j3gXSkXJrBPQKSbsgOZ9Lo/G9s3
         swNw==
X-Gm-Message-State: ABy/qLYi+oUQIVyseVCqF4axlk1+opnn69lPJNyz8IqYg4n8M6NMmfXq
	/GWPKlzNjyKFcLqjak7j1deh6A==
X-Google-Smtp-Source: 
 APBJJlHslYGVSSyNVJNDxI5bYBfnub9XVSwa1X5s1acoNR8jSAVh7ahaAw9VVrUzXgplaGVGmAX06A==
X-Received: by 2002:a05:651c:120e:b0:2b6:fa60:85a1 with SMTP id
 i14-20020a05651c120e00b002b6fa6085a1mr9941521lja.21.1689663863227;
        Tue, 18 Jul 2023 00:04:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 i10-20020a5d522a000000b003143aa0ca8asm1485018wra.13.2023.07.18.00.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 00:04:21 -0700 (PDT)
Date: Tue, 18 Jul 2023 10:04:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Yang Li <yang.lee@linux.alibaba.com>, alsa-devel@alsa-project.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: amd: acp: delete unnecessary NULL check
Message-ID: <b0c5b0ca-68da-47e6-a8b0-e0714f0de119@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MFFB333KNNHHYNCJXEWGYQTDJFT5UTQT
X-Message-ID-Hash: MFFB333KNNHHYNCJXEWGYQTDJFT5UTQT
X-Mailman-Approved-At: Tue, 18 Jul 2023 10:13:54 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MFFB333KNNHHYNCJXEWGYQTDJFT5UTQT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The list iterator can't be NULL.  Delete the check and pull the code
in one tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/amd/acp/acp-rembrandt.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index 21e67ed956d1..cc8284f417c0 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -266,18 +266,16 @@ static int __maybe_unused rmb_pcm_resume(struct device *dev)
 	acp6x_master_clock_generate(dev);
 	spin_lock(&adata->acp_lock);
 	list_for_each_entry(stream, &adata->stream_list, list) {
-		if (stream) {
-			substream = stream->substream;
-			if (substream && substream->runtime) {
-				buf_in_frames = (substream->runtime->buffer_size);
-				buf_size = frames_to_bytes(substream->runtime, buf_in_frames);
-				config_pte_for_stream(adata, stream);
-				config_acp_dma(adata, stream, buf_size);
-				if (stream->dai_id)
-					restore_acp_i2s_params(substream, adata, stream);
-				else
-					restore_acp_pdm_params(substream, adata);
-			}
+		substream = stream->substream;
+		if (substream && substream->runtime) {
+			buf_in_frames = (substream->runtime->buffer_size);
+			buf_size = frames_to_bytes(substream->runtime, buf_in_frames);
+			config_pte_for_stream(adata, stream);
+			config_acp_dma(adata, stream, buf_size);
+			if (stream->dai_id)
+				restore_acp_i2s_params(substream, adata, stream);
+			else
+				restore_acp_pdm_params(substream, adata);
 		}
 	}
 	spin_unlock(&adata->acp_lock);
-- 
2.39.2

