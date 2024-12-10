Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CC49ECB41
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:32:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B1892BEF;
	Wed, 11 Dec 2024 12:32:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B1892BEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916754;
	bh=WRiEYmvCrEDu0efYiS+BnJtjOfOD3CrYjSzhUZqxggA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hh9GW2J/QWkJqJRUpSVzRmswYrVI7DV9v70qHFenErhPF5M3ARkoitYnEMNyBYG/V
	 6g18yFUU8H0f2d8gN3hsuCxvR3lxu4gnZrSrRvtWNzQRavrCglPufEv2EAPDa2qrBn
	 HAnCuuQ1k1qqaaUEVaStQV6VbGW7qZPcJRCKoEQM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39F53F89631; Wed, 11 Dec 2024 12:28:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E2A5F89636;
	Wed, 11 Dec 2024 12:28:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FB67F80518; Tue, 10 Dec 2024 18:11:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73656F80482
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73656F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=Oobleg9X
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5d3e9f60bf4so4671111a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850643; x=1734455443;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNFyzgag91SKUVQoD8nVAEcB8AscK0h2z9GDPU+fWvo=;
        b=Oobleg9XxT3HQakdqa37p2clQXu3VfO7HtpN4nIbRb2mzPlNOncitfBsM3F7TMUYnl
         jDcjHzu45blfm3Y5eYF8T1DMkI0+brVfCZ2hccnWRkOXKP1W8UfNIOCnfNe8iW7cjIqG
         xoheMqPgvSTTGIZWFdinJUGHXOckUJc/FMwIxkn73/we/JHm0GEDSzp/eelVxxDpgFT2
         BW+7ZavG3SiySxhmPm0wCnGabya9yW609twg8o6sTjDzUHRD1DQfGlmtsP7CRGJwxjRm
         hsks4bjgUcm9lygN7xeP5/w6p2MGX75IVFfimsl2OiOwlEW34oNK8yM293j6VRR4eLAB
         cyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850643; x=1734455443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNFyzgag91SKUVQoD8nVAEcB8AscK0h2z9GDPU+fWvo=;
        b=Q15JyBYydD21KjpucWLkR9KFs77sZpWP/gaQkpmMyIWYLYik0hotZZdAnYp3sRGGla
         0qI0nEcaJnZsLbByy2LeE1OwnsV+JL4nxW0M59WfGtbUofHmrDsykBY3M9PsFgFSgP1p
         MKgqUO9MYWuu92djsl5oSb3/CzDwjKImO3Os6i77pyz1/EzeZVZK9muilwCZVEqHLn6c
         4OWcCqYW+gESVnGcEWQVzJIw2kj2AkjRZqOYfK43c8cYxnTTejnznaJPl+hTxsiD0+zO
         VBNqOkC7EMJPMcc9KfiqhhhV0czHfh50VKrppN/Z+VLQtZkigIUNZieQTOKrI6Iynwv9
         1DlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlL3e6V8F8Yj3gmVozt/TceSrWDANdNqB/A7X+flgEgsX8powekYwglqxYyeGn92k8VgSOotZG7Pgc@alsa-project.org
X-Gm-Message-State: AOJu0Yw/a4lmev77LqMYapwSdnAA8TkVANzXYlUPPZOUr5bp+ETTP/S5
	TJa9inthUvn2LJIFtwMslMc4jZocwVzBLNXIcuu2N2TycktQGRVqFatQaDsrRjY=
X-Gm-Gg: ASbGncudDmtOV9uTi8X6x8OTh8YV2R1FTKfoO79EMM2oeAibhjHTb8keAkfYseh+I4W
	CEmJXJ5Rgmjlpu4rI3P8brm+exKaTFLSK7XYysOM8WmBbMZpC9L+sHoUpNSHR9NjWWB/TvfYoiI
	rsxazomkHIk49UNEv2zsQ+kaPwBMuhCwxRg/YxWVY5FxG0U94gnYx5530zr/kRDovh5geGNynVS
	fHTnI2pfLvIxVYRvrTyuMZV8j0mh0Q+Zh6R0qH3nJ6Z6DdU2oVPxTL1H44GHqR0qgKkz9sVviu+
	6dsGQOz7
X-Google-Smtp-Source: 
 AGHT+IGBwrXeGyw9PzNdwLgYXKjgGaPgrny0AlmNGbVXlrqkKBOlqakuZUH3QzbVuduS9Y4Lgz1XGQ==
X-Received: by 2002:aa7:d985:0:b0:5d3:d8b9:674d with SMTP id
 4fb4d7f45d1cf-5d3d8b967femr12400130a12.0.1733850642620;
        Tue, 10 Dec 2024 09:10:42 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:42 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 16/24] ASoC: renesas: rz-ssi: Issue software reset in
 hw_params API
Date: Tue, 10 Dec 2024 19:09:45 +0200
Message-Id: <20241210170953.2936724-17-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: claudiu.beznea@tuxon.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CYSUV5UWI4WSH6YKSUZEMTUYHCR3Z6ZA
X-Message-ID-Hash: CYSUV5UWI4WSH6YKSUZEMTUYHCR3Z6ZA
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYSUV5UWI4WSH6YKSUZEMTUYHCR3Z6ZA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The code initially issued software reset on SNDRV_PCM_TRIGGER_START
action only before starting the first stream. This can be easily moved to
hw_params() as the action is similar to setting the clocks. Moreover,
according to the hardware manual (Table 35.7 Bits Initialized by Software
Reset of the SSIFCR.SSIRST Bit) the software reset action acts also on the
clock dividers bits. Due to this issue the software reset in hw_params()
before configuring the clock dividers. This also simplifies the code in
trigger API.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags
- use rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_SSIRST); in rz_ssi_swreset()
  as suggested in the review process

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 34c2e22b5a67..486822d79458 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -388,6 +388,15 @@ static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	return 0;
 }
 
+static int rz_ssi_swreset(struct rz_ssi_priv *ssi)
+{
+	u32 tmp;
+
+	rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_SSIRST);
+	rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, 0);
+	return readl_poll_timeout_atomic(ssi->base + SSIFCR, tmp, !(tmp & SSIFCR_SSIRST), 1, 5);
+}
+
 static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 {
 	strm->running = 0;
@@ -782,14 +791,6 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		/* Soft Reset */
-		if (!rz_ssi_is_stream_running(&ssi->playback) &&
-		    !rz_ssi_is_stream_running(&ssi->capture)) {
-			rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_SSIRST);
-			rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, 0);
-			udelay(5);
-		}
-
 		rz_ssi_stream_init(strm, substream);
 
 		if (ssi->dma_rt) {
@@ -914,6 +915,7 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 					SNDRV_PCM_HW_PARAM_SAMPLE_BITS)->min;
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
+	int ret;
 
 	if (sample_bits != 16) {
 		dev_err(ssi->dev, "Unsupported sample width: %d\n",
@@ -940,6 +942,10 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 	rz_ssi_cache_hw_params(ssi, rate, channels, strm->sample_width,
 			       sample_bits);
 
+	ret = rz_ssi_swreset(ssi);
+	if (ret)
+		return ret;
+
 	return rz_ssi_clk_setup(ssi, rate, channels);
 }
 
-- 
2.39.2

