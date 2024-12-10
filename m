Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B589ECB2B
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:29:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5FE5240C;
	Wed, 11 Dec 2024 12:28:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5FE5240C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916546;
	bh=o6bb+5TT8a4+4885SQUIo5IIlBm8LtwjyGEaLw06x18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jRj6sQRj26Z84HvN11ah3RsSoEjquYpxbEfyQw8W3eZDi8JnhpOEWqp1pSAO3uAs7
	 G14nKt67h3EEBKBGithOm4TjYhRWtwjZXDSoxhznG//vPp32ltswZVtORcoMTNjKaQ
	 KtLICpqz72AOjkgP08AZEtK1Ahif3PdV9jY+LBbo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADA82F80694; Wed, 11 Dec 2024 12:27:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F679F80695;
	Wed, 11 Dec 2024 12:27:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44645F805AB; Tue, 10 Dec 2024 18:11:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 932CDF80482
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 932CDF80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=e5oVwzSz
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5d3e8f64d5dso5211052a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850615; x=1734455415;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qo27pKYlk9UKLBg0czdTh7Uwm7olEalHUIHQAM8AonU=;
        b=e5oVwzSz5ZsoADQhlaPPtGwTHI3x9LK1aRiFaChrvf7K8o9QzYzPDzGlUD5pALYNOT
         a7awQsBqLWd+thelvNZ5SfgRQkLSZP8hoMrm5vy6FUSx/TUZc+2dH78TxribsTpwUX2S
         GuYAW6rPguy2NltVR8+Lh7DE5ycGTzx4RE/MwvAVRAvnXc/fc6lJKG1qtftkp5BmN3Pc
         fUVueVLDE3kh95b6Za9RwLQYc+tB8L6ax7hS9w90kz4JL+gfFO4ckoIwxgL3+ZxgcnNY
         byPiiFNWcS75El3dCB+oCbUHt0LHLa9bjWIK4yeowQFNBzXbLFnGTJ6MVez31LP/c7Ge
         mfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850615; x=1734455415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qo27pKYlk9UKLBg0czdTh7Uwm7olEalHUIHQAM8AonU=;
        b=MZNMsDryNmbVXzm6WsMgWRrkUUEIWIesu8qSIpAup6ikCPpZOqqXhn1DDJmRENG/AC
         6qGAbUWTH8uJSW43trXMWKEeE/MqUfUyBJCoQvR+/65DdoDxNR61HFZYgpOnffoCqZRm
         eVxQ/CjfsrbVJxOo4NQpROfQ3TJEOE4NDhiVsFFIgT+U3777SbspZx2HAcYXP9Dm266u
         NC39NwwqGRscI2ogvRQrSfBQkflLRIUZPOxOOmUB5R0GlJv1uCvfXZwy6eQyW5U7fAKT
         gyWMutP8zWMjwCMmnh++gQEIGTlmJ9IdGmTEs0bCb5pYguWjj93dXypM8MAsWEA52qQ8
         gjWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYC8e9iozKAXBmPtEwCCjV48RNOIcHHDPzzThKW3eicijtV2OYEJs1ELwDj8aAm3YrtuO7S+jWNs4A@alsa-project.org
X-Gm-Message-State: AOJu0YwF+zyxttT6362K7wxmEeiNB2lrJ8mwJRMP+/ND9C1yjnBwPRIK
	RYzMwUzBlVesrlZg/DBtsHmXObu9KiObfVRavym8nAS2dE11LswfG6GGbnODUwQ=
X-Gm-Gg: ASbGnct41sNG+zfJdrJ6/OPM6Op4LiHj2OuPQIsXEwetzyPiXT6tQ7uYoVgJ75IU/G9
	DGIkAe8jmRlGm5WDEuTLrXdOLQVCS3gEBlyD8MsVBszHziNF3wT+PnWzlLniyn+IB6+FeaA63qS
	94AE+2tvVOb4g3WNUG2HFlGjQD0m131Dquo4fJZ/k8nkFRUJWINdY7QVk5ejbrCep1YO6FiZ7bZ
	m8BG/9ryZXaV7kjajy7uoGD/TVlyQ1fLKtV/0bEGR44+xf0+RR0MRbaQitUx3T5WcNX/O2tOZon
	gVFP7Osi
X-Google-Smtp-Source: 
 AGHT+IGWUjWO6EYZ1uAazblGzPDgU2K3A7r87jOiz1TUWyFTmpyxPZFuPXfCgEn67jBfzXe1r6LxEw==
X-Received: by 2002:a05:6402:11d1:b0:5d1:f009:9266 with SMTP id
 4fb4d7f45d1cf-5d3be65f80bmr15150003a12.2.1733850614698;
        Tue, 10 Dec 2024 09:10:14 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:14 -0800 (PST)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 04/24] ASoC: renesas: rz-ssi: Terminate all the DMA
 transactions
Date: Tue, 10 Dec 2024 19:09:33 +0200
Message-Id: <20241210170953.2936724-5-claudiu.beznea.uj@bp.renesas.com>
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
Message-ID-Hash: SMWRMKHH7ZCOS7Q7D33ZYF2CCMSDKK5B
X-Message-ID-Hash: SMWRMKHH7ZCOS7Q7D33ZYF2CCMSDKK5B
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:08 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SMWRMKHH7ZCOS7Q7D33ZYF2CCMSDKK5B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The stop trigger invokes rz_ssi_stop() and rz_ssi_stream_quit().
- The purpose of rz_ssi_stop() is to disable TX/RX, terminate DMA
  transactions, and set the controller to idle.
- The purpose of rz_ssi_stream_quit() is to reset the substream-specific
  software data by setting strm->running and strm->substream appropriately.

The function rz_ssi_is_stream_running() checks if both strm->substream and
strm->running are valid and returns true if so. Its implementation is as
follows:

static inline bool rz_ssi_is_stream_running(struct rz_ssi_stream *strm)
{
    return strm->substream && strm->running;
}

When the controller is configured in full-duplex mode (with both playback
and capture active), the rz_ssi_stop() function does not modify the
controller settings when called for the first substream in the full-duplex
setup. Instead, it simply sets strm->running = 0 and returns if the
companion substream is still running. The following code illustrates this:

static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
{
    strm->running = 0;

    if (rz_ssi_is_stream_running(&ssi->playback) ||
        rz_ssi_is_stream_running(&ssi->capture))
        return 0;

    // ...
}

The controller settings, along with the DMA termination (for the last
stopped substream), are only applied when the last substream in the
full-duplex setup is stopped.

While applying the controller settings only when the last substream stops
is not problematic, terminating the DMA operations for only one substream
causes failures when starting and stopping full-duplex operations multiple
times in a loop.

To address this issue, call dmaengine_terminate_async() for both substreams
involved in the full-duplex setup when the last substream in the setup is
stopped.

Fixes: 4f8cd05a4305 ("ASoC: sh: rz-ssi: Add full duplex support")
Cc: stable@vger.kernel.org
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- updated patch description

Changes in v3:
- collected tags
- use proper fixes commit SHA1 and description
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 6efd017aaa7f..2d8721156099 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -415,8 +415,12 @@ static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TEN | SSICR_REN, 0);
 
 	/* Cancel all remaining DMA transactions */
-	if (rz_ssi_is_dma_enabled(ssi))
-		dmaengine_terminate_async(strm->dma_ch);
+	if (rz_ssi_is_dma_enabled(ssi)) {
+		if (ssi->playback.dma_ch)
+			dmaengine_terminate_async(ssi->playback.dma_ch);
+		if (ssi->capture.dma_ch)
+			dmaengine_terminate_async(ssi->capture.dma_ch);
+	}
 
 	rz_ssi_set_idle(ssi);
 
-- 
2.39.2

