Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D319435A9
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 13:47:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27E6B1838;
	Thu, 13 Jun 2019 13:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27E6B1838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560426423;
	bh=4oGUFylfAf4oP+tHY5VEcZHtZqdi6R6zC0ZZvG4neb8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hgxw6RnzuccFwqwoEG9p1S0OaLJffr7jfjYmlxPMj5uk4ikUi4nmBWO04UdjhXfjq
	 4q39RYBYj+VLfsSzmvIM7S/5pwA9R6iHxLJJslMzGo0dkL4RE6fA3q66xC1qlsY36x
	 LA2UiyUzt634gjSkmDDH4Vcw695fqCwTuR3V+idg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF397F8973D;
	Thu, 13 Jun 2019 13:42:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5457EF80791; Thu, 13 Jun 2019 13:42:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77811F80791
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 13:42:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77811F80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ok5DOoG/"
Received: by mail-wm1-x342.google.com with SMTP id a15so9826692wmj.5
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 04:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tw+9nr0k/SQ4+6C+T7NQWdtgxVemIU5O6qgx24DY8vo=;
 b=Ok5DOoG/v42T5p/NULeH/QnUtOj3y3bgwt/tHoF5P/QfLizFjo2FteTJhShh/SJZlr
 Nmlqr3KRJRhMsWo6pVvAXVbul1OayENODZ5gcGgO5C7JDGHK9U+PzWdA/jg93WjfgrBX
 3aPLgeJJNFVLG2B/rgjiiSmhS+VPDiaQJtZu9Yj5qNZsnJJwZOWKrk3hKiDrwVwOJa46
 DJ8yGbCY355E06ytD2Ad5rB+zWuOJWxU5VFLulOd9U0WSoao+makMDcH1cw103nSXVwm
 WvwvNjZS5YfcP6dgfELXmWKxdmNFba7TWuBCTXVwsvhillQ7D9Jrl3egEbQtgmyPgiVH
 5Z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tw+9nr0k/SQ4+6C+T7NQWdtgxVemIU5O6qgx24DY8vo=;
 b=pB1nN+YBiv5HFP0AKtLcFqimIJvLSDWyq8RMIoznbZk084zf0VnBZ1g5qK8dYk6xjO
 atC1vefTfyNcBwHWPACfhKQTwQ7W+nJirQLAaOLQzSeCCpWpv9X0gKlBEDHzE5gkM1oy
 UmyuM2/BqNiQ80kbUukEZo+DMheENt5HDRRKNcE/iKnnNZyvetwTLcod1n5lZZiWiHvR
 GqK3sF95ryYOUogHjr07TbmuSonHgHZKaQClUfYw4GbR6y3WHRJbyU/x5qdgdmQ3fjTy
 5TgHG7kAW6FCGlKYnkh8CB262CE0go93DteorJp1rpkrO/JBbQ+rxDLVimpWVOUoQe9d
 kuAw==
X-Gm-Message-State: APjAAAUxK6ZNQIHb81Q11WrEXobwoE9tnN0KByBgNcRD27Mu7o3Juuej
 NEtOYcvr6kAV7TE44K/Y1ok3Cg==
X-Google-Smtp-Source: APXvYqzEpIcfbKY9VmOQOlh4gHR44pyPiRNjVhiHDFIUMTdcrq2NBX4iOv+SXfr3SjTejuF07/m1hA==
X-Received: by 2002:a1c:9cd1:: with SMTP id f200mr3280189wme.157.1560426163056; 
 Thu, 13 Jun 2019 04:42:43 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b5sm2598490wru.69.2019.06.13.04.42.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 04:42:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Thu, 13 Jun 2019 13:42:33 +0200
Message-Id: <20190613114233.21130-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613114233.21130-1-jbrunet@baylibre.com>
References: <20190613114233.21130-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 4/4] ASoC: meson: axg-tdm: consistently use
	SND_SOC_DAIFMT defines
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There a mix of SND_SOC_DAIFMT_ and SND_SOC_DAI_FORMAT_ in
axg-tdm-interface.c. Even, if this is currently the same thing, lets use
the same group consistently.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 585ce030b79b..d51f3344be7c 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -306,8 +306,8 @@ static int axg_tdm_iface_hw_params(struct snd_pcm_substream *substream,
 		}
 		break;
 
-	case SND_SOC_DAI_FORMAT_DSP_A:
-	case SND_SOC_DAI_FORMAT_DSP_B:
+	case SND_SOC_DAIFMT_DSP_A:
+	case SND_SOC_DAIFMT_DSP_B:
 		break;
 
 	default:
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
