Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DC5391C5B
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 17:48:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A88616F3;
	Wed, 26 May 2021 17:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A88616F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622044136;
	bh=Bnk19/aXoEr8etWJI/KPqXrvK2N5PSBpG0dHhaaXb2Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iwauV3QFuHUM7pEikUy4UMIV0Q5jO+h2aiChExsJrx5sAQdRfjwry80ofPg3Mk9Yu
	 ceZqvzJk27E5rQJnXoquFM956+Q1S+18DhEDdz3j6cmY5Ogu5PgJKfEplhFKENo8X0
	 FrFpt/a4Fk75OdDh4YhBMudGuoE022BX/3OxVyxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF8D3F80260;
	Wed, 26 May 2021 17:47:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EF46F8025C; Wed, 26 May 2021 17:47:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D1B1F8024D
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 17:47:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D1B1F8024D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="YZVXRZQb"
Received: by mail-pj1-x1034.google.com with SMTP id ot16so1018214pjb.3
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 08:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y5Bgd0Jh4nDL9nxbYQPkXNJczysNVELPbL2b6pe0vik=;
 b=YZVXRZQbI8i/iFl06Wmwupv7VoVvO+LkA88TmHrBpNc5HmcF+NbaKX2TFhOM610pMQ
 pXpgHaJo6u7iq0DmOtJuOAjNRelr9HOVxQhnqZ+SPfkU6JyRr//jVwL1GOProkuEm2vu
 LnRLaWlOMtwbyBSClwdDseICaM6hWrZOwWD68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y5Bgd0Jh4nDL9nxbYQPkXNJczysNVELPbL2b6pe0vik=;
 b=CeIheAWb+1G7u3na88CZ0i3s6z8Eq9onqyKI+AyZuaq//sJVBdW4ALinG9O8BI+xTc
 TjhRP8p4NVHM/1PqjtUTX57aVApZufn/08c6fpoT2RfTIKW9Vwv7wIjrrRbmTHnA8IGo
 DRKD+PWbGfy45LvkdY5Zq6uM+6qVzxli8PPZ6UvYZWHBS3mmRIX7imtSJdEKUb04rinB
 EUF/nOBLOO8FERwKO46owqkewkwWlliBR8kOj8MjE/k8vnl7FlYKx9glgbV3vM7uO/jy
 1Td2xIE+rQcqzYIndKgY8S/HpfR+BivlgkhMqw8qfLk1OTZ5Vbp98hTG8FOf5qBZJlhb
 lwng==
X-Gm-Message-State: AOAM531y1j4AD9lA234aUkA5hsJ9B4QPVbSI269AG2EKkBrBVjB3u4Eq
 yMJQBI8HKTBUT1uSZ4YLHB/4Eg==
X-Google-Smtp-Source: ABdhPJwJ7oSD990XEzL/3FSdH74tC6Kpu2hlE7hlvuRBr87zJMb2XZIAZ4P6rxWAAh7RG/1HmDSbnA==
X-Received: by 2002:a17:902:c213:b029:f0:bbdf:3852 with SMTP id
 19-20020a170902c213b02900f0bbdf3852mr36626293pll.56.1622044034046; 
 Wed, 26 May 2021 08:47:14 -0700 (PDT)
Received: from judyhsiao-p920.tpe.corp.google.com
 ([2401:fa00:1:10:ef05:d69e:64e4:1d96])
 by smtp.gmail.com with ESMTPSA id k21sm16830456pgb.56.2021.05.26.08.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 08:47:13 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: max98357a: set channels_max to 4
Date: Wed, 26 May 2021 23:47:04 +0800
Message-Id: <20210526154704.114957-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 Andy Gross <agross@kernel.org>, dgreid@chromium.org,
 devicetree@vger.kernel.org, tzungbi@chromium.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 cychiang@google.com, Takashi Iwai <tiwai@suse.com>,
 Judy Hsiao <judyhsiao@chromium.org>
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

Sets channels_max to 4 to support QUAD channel.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 sound/soc/codecs/max98357a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index 918812763884..c3cf1743caad 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -117,7 +117,7 @@ static struct snd_soc_dai_driver max98357a_dai_driver = {
 		.rate_min	= 8000,
 		.rate_max	= 96000,
 		.channels_min	= 1,
-		.channels_max	= 2,
+		.channels_max	= 4,
 	},
 	.ops    = &max98357a_dai_ops,
 };
-- 
2.31.0

