Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2FC9ECB33
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:30:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44CC62BA3;
	Wed, 11 Dec 2024 12:30:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44CC62BA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916617;
	bh=TdUpesvK2bqZRA5lCnWS4V50ZEqpa6uiukIdp73czu8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vTd0mHzU1BddsRQwrgdJPP88BW7MucsuYst/w14YBmk9sa0HpQZXi3KXhwaZfhDq4
	 oDUN7BBphIar4OodZMW1NLep9GSNmCSb2SQ/EOmrLN4viBUesMKUf/gWDd440LCHWd
	 LNdADgHNL/F0p0djxrlwH/EIoqYZtPyxuVydmv1c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C85DCF8074D; Wed, 11 Dec 2024 12:27:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 543DEF80735;
	Wed, 11 Dec 2024 12:27:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13D94F80533; Tue, 10 Dec 2024 18:11:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81F47F800E9
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81F47F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=qxeegh/h
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5d3cf094768so6586735a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850624; x=1734455424;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fZD7MbYY4k4sOMCUWO81EIjBCeOEixHEXtaO9JyHpg=;
        b=qxeegh/hHMQZn74kew6vV7G3EBCEqfAbN8recdOQLB8W+9IdW0Fk0TspaDLENMY467
         FLcfp5PyArc8DKeeTA9dJ01s6oYC1mN7Pq2XhA/VYD3CrjwtkMbYBwBzgYOM81dqVhRo
         s3mTqIEwEiTFQx+KyHsdeyHsMK2svvtl62ykR04CQZx8otV/gz+kOyScof/w3MtGHm9J
         fEqcH7CuMjSigb42RQq7WheRZMTSHyaOAJH1sm961Hd5muTYPHaeUTBXFUA1WQHNElOM
         ng+1hyKbq6LHiaXSFOasOlqMcNyEItAQ15JScftvoMYIkUbfJUTUEAbYrNEI7USMLMTP
         At8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850624; x=1734455424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fZD7MbYY4k4sOMCUWO81EIjBCeOEixHEXtaO9JyHpg=;
        b=mfO1LgqKFufYk2TlRLzmB5jPJc60okwKD/Q8UZ0R+yrvvJBnYaQJex0v7z+iSDBCiI
         rRJNSv/aJadsFulpeuBmRHKbmmTMrcZksVogM9+TbJWs0/o+0RxIvgp6qM4l6FX2U5U3
         pRbdWgOrxDwxdBbUpfKnohtRSvrVwqwvR6gT/l6MUCrSvOzl6fnBSnuGnpSHBi65CUom
         gdSaXuL1HqeG3+KRX/NRkyrrxAoqcrxsa99D3ZLom5R+TvPPPbgexKNRs7KDGxX2I/At
         MF5uAF4yiYQYUIoT9aDhx7QSM/fmFFy95gjf4XgWl3ItfucXahTdFSbQKmyKM43CDhz8
         2LBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+R+DcbzqLCxPdJKly9qWKIVn5AuzaLvZPfVGlWHvmw7E+Wk5+gU28KTTonE9WK8gEquP9DUoWfbVL@alsa-project.org
X-Gm-Message-State: AOJu0YyoRr8xcyWN2zhzbKysK+aWpJJC6R4NzSorxGi1dXdkb/xhw4Nn
	3cTWBloMERuo9aIDMgCAbEPB3nr9vD3yIMtlmwsfKVwURKIQi7dFvuDtG++Sdfg=
X-Gm-Gg: ASbGncs8E7oBlT3cho3ROseXIUkgeVp5sVXAgzBUvmYOts/W5XmhhIwEa+Eyl04lO1U
	vvJCKyWhgk5Hsk3tFTnyaURV40CTrIb6TEyiJ+2ZfxrJSQyhdnpGOwmgox6ddDk1+aO5dwI4F9F
	q/gTIFz5QGynE6+ilM4ocEsmAHkVcGSTmsIj0oF9UIhe3+pBUnqMo+FrNTIMVNKh6qWu/kr1tfs
	bCTwzmFuwX+OFtjabR8ISNmjZaJ9E92iAwjGBfjhCddvN2ap06da/ShANNRGEdp33lpImPojTpe
	YC4s7Hvv
X-Google-Smtp-Source: 
 AGHT+IGPNWGY9jEOkszzr7a+HCzsQHx/+czOpLjoEtr5Y51ztb7vYMYNc711VxTTfs7vb+1yWs3GDg==
X-Received: by 2002:a05:6402:26ce:b0:5d3:c4a8:d259 with SMTP id
 4fb4d7f45d1cf-5d41856a452mr6845842a12.19.1733850623996;
        Tue, 10 Dec 2024 09:10:23 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:23 -0800 (PST)
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
Subject: [PATCH v4 08/24] ASoC: renesas: rz-ssi: Remove the rz_ssi_get_dai()
 function
Date: Tue, 10 Dec 2024 19:09:37 +0200
Message-Id: <20241210170953.2936724-9-claudiu.beznea.uj@bp.renesas.com>
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
Message-ID-Hash: S7JEYG73S6R3G4L5WSXKPUM3NRFHCK6C
X-Message-ID-Hash: S7JEYG73S6R3G4L5WSXKPUM3NRFHCK6C
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:09 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S7JEYG73S6R3G4L5WSXKPUM3NRFHCK6C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Remove the rz_ssi_get_dai() function and use directly the
snd_soc_rtd_to_cpu() where needed or the struct device pointer embedded
in the struct rz_ssi_priv objects.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags
- updated patch description

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index b24c323ee05f..e2e172d8e9db 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -162,14 +162,6 @@ static void rz_ssi_reg_mask_setl(struct rz_ssi_priv *priv, uint reg,
 	writel(val, (priv->base + reg));
 }
 
-static inline struct snd_soc_dai *
-rz_ssi_get_dai(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-
-	return snd_soc_rtd_to_cpu(rtd, 0);
-}
-
 static inline bool rz_ssi_stream_is_play(struct rz_ssi_priv *ssi,
 					 struct snd_pcm_substream *substream)
 {
@@ -243,15 +235,15 @@ static void rz_ssi_stream_init(struct rz_ssi_stream *strm,
 static void rz_ssi_stream_quit(struct rz_ssi_priv *ssi,
 			       struct rz_ssi_stream *strm)
 {
-	struct snd_soc_dai *dai = rz_ssi_get_dai(strm->substream);
+	struct device *dev = ssi->dev;
 
 	rz_ssi_set_substream(strm, NULL);
 
 	if (strm->oerr_num > 0)
-		dev_info(dai->dev, "overrun = %d\n", strm->oerr_num);
+		dev_info(dev, "overrun = %d\n", strm->oerr_num);
 
 	if (strm->uerr_num > 0)
-		dev_info(dai->dev, "underrun = %d\n", strm->uerr_num);
+		dev_info(dev, "underrun = %d\n", strm->uerr_num);
 }
 
 static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
@@ -988,7 +980,8 @@ static int rz_ssi_pcm_open(struct snd_soc_component *component,
 static snd_pcm_uframes_t rz_ssi_pcm_pointer(struct snd_soc_component *component,
 					    struct snd_pcm_substream *substream)
 {
-	struct snd_soc_dai *dai = rz_ssi_get_dai(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct rz_ssi_priv *ssi = snd_soc_dai_get_drvdata(dai);
 	struct rz_ssi_stream *strm = rz_ssi_stream_get(ssi, substream);
 
-- 
2.39.2

