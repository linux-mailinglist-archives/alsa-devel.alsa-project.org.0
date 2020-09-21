Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 701F5272162
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:41:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DC1C1706;
	Mon, 21 Sep 2020 12:40:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DC1C1706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600684889;
	bh=UfEzQCMo7mSftdUD88TE0CUt/qeIa5V2ZCz4mtT9UMg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vkL7nzq+6dv/qqjFGpXBIo25w5BZHWlxE3b8gFRdFLtcxwyuNKCCwdl1wF/kpHDLH
	 wPjenOshaXfu9xsmqR5udiHHWjyUZZUbCjJeCwcsTC06Po941COfITnsoPQamOXP8+
	 fP3wyaVYLRGkzYIOGg0pqK53Li5IPWG/sfqzkSkU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7910F80383;
	Mon, 21 Sep 2020 12:28:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 419AAF80323; Mon, 21 Sep 2020 12:28:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF2D6F802FF
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:28:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF2D6F802FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ORtkscd0"
Received: by mail-wm1-x344.google.com with SMTP id l15so11164535wmh.1
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 03:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hFD9C0g02b1YD9AU5pxjflPT96QGvB/rE3rUqbHSeaU=;
 b=ORtkscd0LXX9BBsQWoDti2VIEBdPk1j0BioweaYSvogLI7XyjhrbEa0S8Q3EhImyLd
 autAKldCKjTSgMytfL9yrL380gPjhg12zqWF54dm6ab45cOmiwjDLENRAeAmXGWmlo17
 YtFUrXQtYJlfqDgnNPsbqZkBUhmHFugh3Wue9+gf3iUvfvl5GNC8gT+GCGIcQtDCBuj7
 SI1mH/+659xvSG5kzv8me/PADthp0yyy0thIt/aOJjMs2TewIpfqtYNdpCoM8g+DRkYE
 PKdvPseK/P5uiaBxZBp5vI6AKKMVkMw/gsp9tHiahnQj6WytdbizShPDJa+fRRTIwd1P
 wyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hFD9C0g02b1YD9AU5pxjflPT96QGvB/rE3rUqbHSeaU=;
 b=JgndtdKikcikxyadyuZZ/rzFg+nHMRlqcX9ZLWRbGSr2t/WSCNfzNrczRFS0ydf0v8
 GYuEPGWJQT9PDUWgdozDABFVm/qN1w9gWczOJ8mEbFAAz+ScIWdw0cLR363cHhbQF+TM
 6IqqA4QwZ+ZdBaO8ojwasIvYohkR52ONXE8leusw97f9UB01yB3RFBnVKdwYQhCJR3V7
 g+FE2A43KGDyOr72J4fP0CC2InBLcKLVbgyhZmZY/dHCZLsCpBhWhqkDcno6iJ9oGxaL
 njpG+obzEKIvXjr4sJXJQm8m/W0F/8J7tTsD7FHUUew/KydbvC3U1OSYRyqesavv/v9L
 QM1A==
X-Gm-Message-State: AOAM532NW86PZ/esKbDZ/Jhq03wV/lRgWDiJ/PURgAFEDzRFRiIaofsw
 yYrn3uosESPGKMqkKEP74xM=
X-Google-Smtp-Source: ABdhPJz61ZTvOsGpQ1BNxeZDj/564NynxcaEK8tRDKFFoaU7hqYG+epEVjy4USWxS1HtRGrdnJWDXw==
X-Received: by 2002:a1c:480a:: with SMTP id v10mr28111657wma.141.1600684082340; 
 Mon, 21 Sep 2020 03:28:02 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id h2sm20713774wrp.69.2020.09.21.03.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 03:28:01 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 22/22] ASoC: sun4i-i2s: fix coding-style for callback
 definition
Date: Mon, 21 Sep 2020 12:27:31 +0200
Message-Id: <20200921102731.747736-23-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921102731.747736-1-peron.clem@gmail.com>
References: <20200921102731.747736-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

Checkpatch script produces warning:
WARNING: function definition argument 'const struct sun4i_i2s *'
should also have an identifier name.

Let's fix this by adding identifier name to get_bclk_parent_rate()
and set_fmt() callback definition.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 9cd6cd1cd284..a6fd9bef30d1 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -180,13 +180,13 @@ struct sun4i_i2s_quirks {
 	const struct sun4i_i2s_clk_div	*mclk_dividers;
 	unsigned int			num_mclk_dividers;
 
-	unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *);
+	unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *i2s);
 	int	(*get_sr)(unsigned int width);
 	int	(*get_wss)(unsigned int width);
 	int	(*set_chan_cfg)(const struct sun4i_i2s *i2s,
 				unsigned int channels,	unsigned int slots,
 				unsigned int slot_width);
-	int	(*set_fmt)(const struct sun4i_i2s *, unsigned int);
+	int	(*set_fmt)(const struct sun4i_i2s *i2s, unsigned int fmt);
 };
 
 struct sun4i_i2s {
-- 
2.25.1

