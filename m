Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 757D227A2E2
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Sep 2020 21:42:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 139251712;
	Sun, 27 Sep 2020 21:41:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 139251712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601235727;
	bh=UfEzQCMo7mSftdUD88TE0CUt/qeIa5V2ZCz4mtT9UMg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ka8USb+xJcKSapAPC0lG8aLsqxbFQS314VFCzVI1CdmeuKDQ2bp7xI5KG3zVx/WJ/
	 OL9ouitWtiGei5ZDuG/SlAO8p40fbwmty2173AnpsFC1O/NF5uJWPWdTKeT8jl/YzD
	 yEVWNd/p8iKt77irpy3psVw5XN5FnHTkRk3zgV4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2BC3F80369;
	Sun, 27 Sep 2020 21:30:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63827F80308; Sun, 27 Sep 2020 21:30:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F10F2F802E0
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 21:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F10F2F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NdxKLIks"
Received: by mail-wr1-x441.google.com with SMTP id z1so9552024wrt.3
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 12:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hFD9C0g02b1YD9AU5pxjflPT96QGvB/rE3rUqbHSeaU=;
 b=NdxKLIksYEYWvMIxygmJ/wOgbIokpUYXQ7/7+hNB0bJwQlliFTMJsi+7U8PR+mhGQP
 iy5VoMPACrRlx1sa6Psyr2JTvGxd7ZB47r4LXI17QtvgX315RzmxdiLz8aL2EnCdzTBb
 wFbexHzCi9QbrV6d2Kr3RGTsApudPoWR/eAjRYdvIVqGavIYdFe8jdBctGSUCFdBuXoK
 gMYHF30+idE7QvS/yFF9WogbwiOWCmB8vQVBligf48+Sd0FmFLaXJUa0PfJGnFKh86DW
 kkVut1zRfkW8VNezqQRGOwq1RS7JF6VjlmhXhHxQZbKgZCo/r5rIBQck1cUSeMELkYWZ
 fD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hFD9C0g02b1YD9AU5pxjflPT96QGvB/rE3rUqbHSeaU=;
 b=tifQgHrFelLg6RaovCw8zBJ67fVKAFgEv//Om+dJQ4COnfYFiN4AAAtHRguU73MPPN
 fExwPF9yPC/WZb56hOMtLtSAdApGMhC13+O+o1LPkPVZZB8m9EYdXaTrJp6pIIMexyDG
 kNA0Nbhx3vpeYjKZfZ5Y6SquL+J3CFguM4pssRixIXoxysjTuZn01Vpb/q1OF6ME44/a
 /IKEDuGjFbcDi/Lu1xnUcSsivsJtljCPdGcwNDxqyVBiVvUJ9iFZ/0y1Q42VWyKCalFF
 xD6FnSuw0GUqV/G0OiFtfsYt9vEsM0nPcDqe2/xyUSkhDpw6+XzJ0RFIsr6uPXNqlmGJ
 +iHw==
X-Gm-Message-State: AOAM533TXM3ZxpWNRmpSDqiCV8n7d/GWcXvSCsqfLLvvYZ0z++jZSu5a
 JGcktydrXiDb3+7CxtdkTPUnK9FFr8+Ttw==
X-Google-Smtp-Source: ABdhPJwDIz/p54l7LU0V8+Pe13zDL0f4KhqMgsxnx1wJvc48DpYxuBX17S9t8cH1n0Cmz7B5+bFTmQ==
X-Received: by 2002:a5d:4d49:: with SMTP id a9mr16140367wru.363.1601234980231; 
 Sun, 27 Sep 2020 12:29:40 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id n21sm6149609wmi.21.2020.09.27.12.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 12:29:39 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v5 20/20] ASoC: sun4i-i2s: fix coding-style for callback
 definition
Date: Sun, 27 Sep 2020 21:29:12 +0200
Message-Id: <20200927192912.46323-21-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200927192912.46323-1-peron.clem@gmail.com>
References: <20200927192912.46323-1-peron.clem@gmail.com>
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

