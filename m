Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF821A7537
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 09:52:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 916641695;
	Tue, 14 Apr 2020 09:51:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 916641695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586850760;
	bh=CWlO5mfFhAhQCE1F6jUY6Ob7+OGCUWkQRFIAwJgUa6U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iEWhpdk6nR7jWg8h6U4ryewIS8UIAWWx5KT/u6SzBi/fdFBNQIqQnEoBphuDwcIA4
	 DGo5b2t/BpXCO+RK4/ByR9XPPz7rB9WIuNqwNSPdT3B6NFF9WqhM4FCPl85ZBp8wb9
	 u6cALWRKbFscE+c1zHQSon+S3fWEinClJPM0IX9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E879F80328;
	Tue, 14 Apr 2020 09:42:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26A0FF80245; Mon, 13 Apr 2020 06:30:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 586FBF800B9
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 06:30:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 586FBF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Cn5OcRmn"
Received: by mail-wm1-x343.google.com with SMTP id y24so8810028wma.4
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 21:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EbnZSiEMnHgTN/mDIIGBsmHUVd2FaPr3+pRi3ydpxdc=;
 b=Cn5OcRmnV/FsOvZHrEClH/vFv+XEOER2nAVKrUXl5glM2qw6RE+Qimvigbr0HpL5PE
 qW2u8NBJP2sTfEG0OOEVGdHU1bNJ5XdZ+ebOd2rMYFi+W3O2CpygbEoGuPTx7cVa6pjj
 5TgG1I09ERhcmzIfUj7B4P0aQJK5DJTQmrO2ZHHcbD1mTOFZC9qHG44Kgxbfnh99qeGQ
 A2R7xn7yy1gYCwHwHBpY25uKCIfYUv2deoLcjQkUMmq9s1uI+oysogt0rSqkip72k8Z5
 0XEj2P1EOccs5zvL+u4A7eY/kJ/1flUR3w82q6XDEfriPdBEXPUYBHAglyZT4eyki1MG
 R3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EbnZSiEMnHgTN/mDIIGBsmHUVd2FaPr3+pRi3ydpxdc=;
 b=YhiSv+GMVC2Hbv3LeUe5VHKSq5+Q501r1R7aWvyvqkf4mAsmWGgHoBIwK+p92WNEBe
 X7oo/pOBW0jSKL58b25SOCbizbJrhrEUwJZvB7dRYgNL5c8uIyVqZqyab1Zeu2f/Vt6B
 M9/cRayPEwdu13xabLAftLg0zs03+vStGG8D/1mci8VcRdV5BC8LRjCx3+kovM6riSo9
 yeDQc2H+F5vA8+TecM/NhtfMrbndNrcQxdq+LGln/82kdXwoIb9l4PeZeQOoIhlbhwSp
 OUk++EyIgD5dhnnp+ZVIyVpsMMS2ALLDxWsHYOesYFIx5kX+eCqF/wLPH9VurW11nTiv
 fpnw==
X-Gm-Message-State: AGi0PuboTsItrpfENU4H/ud09pQFC5zjVkNBKUFQ5N1W0QRcPkfLtuWp
 FikiqA37fL1qbK91Wt7+lww=
X-Google-Smtp-Source: APiQypJqzsG5xE7UIV/7jHME578hAykas9gVz9OtdHMsoHKH3Nw7qn3xHFVFEoe++RD96wFYJR3fag==
X-Received: by 2002:a1c:7308:: with SMTP id d8mr17695093wmb.31.1586752217830; 
 Sun, 12 Apr 2020 21:30:17 -0700 (PDT)
Received: from basti.fritz.box
 (p200300D1FF00AD00593005B1452DFD52.dip0.t-ipconnect.de.
 [2003:d1:ff00:ad00:5930:5b1:452d:fd52])
 by smtp.gmail.com with ESMTPSA id b82sm13668229wmh.1.2020.04.12.21.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 21:30:17 -0700 (PDT)
From: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
To: olivier.moysan@st.com
Subject: [PATCH] soc/stm/stm32_sub_sai: Add missing '\n' in log messages
Date: Mon, 13 Apr 2020 06:29:52 +0200
Message-Id: <20200413042952.7675-1-sebastian.fricke.linux@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 14 Apr 2020 09:41:47 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, sebastian.fricke.linux@gmail.com,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.

Fixes: 3e086ed("ASoC: stm32: add SAI drivers")

Signed-off-by: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
---
 sound/soc/stm/stm32_sai_sub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 0d0c9afd8791..34a7c3d6fb91 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -837,7 +837,7 @@ static int stm32_sai_set_config(struct snd_soc_dai *cpu_dai,
 		cr1 = SAI_XCR1_DS_SET(SAI_DATASIZE_32);
 		break;
 	default:
-		dev_err(cpu_dai->dev, "Data format not supported");
+		dev_err(cpu_dai->dev, "Data format not supported\n");
 		return -EINVAL;
 	}
 
-- 
2.20.1

