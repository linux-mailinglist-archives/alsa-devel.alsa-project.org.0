Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FFA5FAC1C
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 08:05:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F195136BE;
	Tue, 11 Oct 2022 08:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F195136BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665468350;
	bh=AS/Fc++BernZRPv2MU5PFD+QfxQDwYCVSkRIovU5cSs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uu9AzDQVnWZ8/QqvsPGKzu4lwa6cgIGdPlryDVfi34Ivzl0u/C5a/X6kyL9dTVTP3
	 V4n7r80rue7zBiyaWNZ6dhh6TVAyhWzJVUeU0FJDLK6GD5Ax8GqaJmnvLuWVB4BWhR
	 7VPc4YoijPf55KqixstRn9bnbxDxwCcrcOXXXmIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2DB9F8057C;
	Tue, 11 Oct 2022 08:02:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84CC7F801D5; Mon, 10 Oct 2022 20:54:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BE7CF80107
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 20:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BE7CF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DjPiYRx1"
Received: by mail-wm1-x32b.google.com with SMTP id
 84-20020a1c0257000000b003c6c154d528so203158wmc.4
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 11:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c4lAtcWLfky+loGkaKS25dVBzZnDMU5TT8sW9dTlDsw=;
 b=DjPiYRx1jqF9zOBa71/gdoTtdLEdU7glIyyTjeakCGpkWNkuc4wy94WyWUGh/q8FoD
 ui9Hg6+XbKtxxDIsh5NBQBup/GzI1kW+UXe+ADWJamL4odQbQa6Igp5uZv5QclzqQpt1
 oxCywDlpFuU49l9HcYomPOIqn/HFNPPMNYJpnwdUcnjlMrl4iA9RIo58NVpuYsSFiMtv
 dR9Fl1Rl+6JqWmVamRWyJ+TeSaRygYLeEOTDGK25z+4SdO8SzNWi1MwNfthDCNGNiGFK
 29lh63UZeEMCoiJ8czejuo6sfz5H7DczHdudVhpNGuw+8LC9c+vfJvPQZe+D7Gcr/cKQ
 l+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c4lAtcWLfky+loGkaKS25dVBzZnDMU5TT8sW9dTlDsw=;
 b=BSeMnenjP7r20vXMncZ3S60Ntt+1NKIHCT+a8yzU70GZPpcp5cpfIwoYjT381IZyXV
 rIr9b4lYOj5M1/43Xev6fWfVmF3mpuGk0A45ozOOPsMLxR9qkDeaa/QWmLQs672HiRmd
 XQgQxbR0eRz2dJDhty96Wi9nkv+8B3CVWpAAODoF017fkWQpe6Ax+p/+KUrvi0wTZkhY
 KS9T3PCp0KV8z/aNDbDXU37cUnXAdj7mm88gU3yOZUx930goH4gxZhzJgC93bpYXomol
 7YFr0O7hf3wdF1h5VTs7pBayybMAjbzp+yWUrSl6Re9QJmes9hRd1XvObY43XN4Q/aLN
 8mjA==
X-Gm-Message-State: ACrzQf0xeTJYIop4g98xs9DYXSYbb3eCnYtXPjnCdSBUCs9Ok//vOjEY
 Odk321uLwZrSviHtd+yFTLzuq/ABzszuQA==
X-Google-Smtp-Source: AMsMyM7l142bKzQq12LOkJeEgnf2eLCqUiQks1Hj80BdQCSYahgVajaEYVsJK2OXu8L+YWEetQQpsQ==
X-Received: by 2002:a05:600c:1c22:b0:3b4:b2bc:15e4 with SMTP id
 j34-20020a05600c1c2200b003b4b2bc15e4mr14092275wms.69.1665428090962; 
 Mon, 10 Oct 2022 11:54:50 -0700 (PDT)
Received: from hp-power-15.localdomain
 (mm-126-34-212-37.vitebsk.dynamic.pppoe.byfly.by. [37.212.34.126])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a5d6142000000b00230c9d427f9sm2082272wrt.53.2022.10.10.11.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 11:54:50 -0700 (PDT)
From: Siarhei Volkau <lis8215@gmail.com>
To: 
Subject: [PATCH v2 1/6] ASoC: codecs: jz4725b: add missed Line In power
 control bit
Date: Mon, 10 Oct 2022 21:54:18 +0300
Message-Id: <20221010185423.3167208-2-lis8215@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221010185423.3167208-1-lis8215@gmail.com>
References: <Y0P/u4pJT8rup8Za@sirena.org.uk>
 <20221010185423.3167208-1-lis8215@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 11 Oct 2022 08:02:21 +0200
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Siarhei Volkau <lis8215@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

Line In path stayed powered off during capturing or
bypass to mixer.

Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
---
 sound/soc/codecs/jz4725b.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index 5201a8f6d..cc7a48c96 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -236,7 +236,8 @@ static const struct snd_soc_dapm_widget jz4725b_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_MIXER("DAC to Mixer", JZ4725B_CODEC_REG_CR1,
 			   REG_CR1_DACSEL_OFFSET, 0, NULL, 0),
 
-	SND_SOC_DAPM_MIXER("Line In", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("Line In", JZ4725B_CODEC_REG_PMR1,
+			   REG_PMR1_SB_LIN_OFFSET, 1, NULL, 0),
 	SND_SOC_DAPM_MIXER("HP Out", JZ4725B_CODEC_REG_CR1,
 			   REG_CR1_HP_DIS_OFFSET, 1, NULL, 0),
 
-- 
2.36.1

