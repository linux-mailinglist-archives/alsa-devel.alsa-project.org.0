Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C43402AD34A
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 11:16:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A9F216F4;
	Tue, 10 Nov 2020 11:15:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A9F216F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605003391;
	bh=mKSFXTxCnWLFFuOmKbDKYfRViQvEyhKDvj07tMwcF98=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NNQderuJrcz9RHQbhR5Ne+EKAtSqAJaAENk3LMvpXPf9TYSljtzgWukRD2gzmFCJ7
	 5f+lUuXxIzGqE8jOM3XEvPPZY3XvJGa40MZZNNU3CV1Y4CD2N3b4jfhcoCeIorUeDy
	 RHTLoF7K2bLh9+WRgwQ/SR8eOXYVLP/mAWfF8GU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC39AF801EB;
	Tue, 10 Nov 2020 11:14:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D120AF80232; Fri,  6 Nov 2020 15:59:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDF5AF80150
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 15:59:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDF5AF80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jQZsJJ9x"
Received: by mail-qv1-xf44.google.com with SMTP id dj6so556280qvb.3
 for <alsa-devel@alsa-project.org>; Fri, 06 Nov 2020 06:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mRkSU/5vHT/IEZQvr5gZLhftMTatdc/swDYJz0CwbE8=;
 b=jQZsJJ9xSf5mSgSPrA0f8RWdADoPxIUsWhWrYCCtBoek351fk2mZgm1tZyj+d2AyF1
 JW2bvSMlpTjbbsCL/R53eg77FnIBfYQJubAId5NIq1FVtIQfDCmGzpvzcxRhdtwn0lUa
 kWyhFEr8le9Cy3coZMOQpWbBzYn6p9zRejmVpz6+oPSoub4GhONJS5LdEHjpwxFv1vdM
 Ww/1oA+ImlaLkp69LonTbFCwm1FKGshzXQ4v3ARRja36FN/lWO8iryweHiQsXIGrcRmh
 lknPDJYsqRfNx2KqLheKY8Y71w9wJNdQQ7b7I2A/Vi9nc0rNWT4UybKlooi1Z/2mc07k
 dWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mRkSU/5vHT/IEZQvr5gZLhftMTatdc/swDYJz0CwbE8=;
 b=q0AtguMty8e+hZOGIsjo4bS54hkC+xco9NJgPj3aSthLrcQ6vAcl8MWAI+DmG0IR9C
 5TB9nlFoCIqtWbaDOjugarnI3FnuKtiIwlZHkbfSapdcINKqVqlhu38W+3gX19Vvvq5J
 K6jgRwEmdvow9b9Zlhe6BhPA5vFAm9C7J/oOCnNoieprhJYQjdilDHQ9Azuvo91iftP1
 o7n93CzpVzqET0RBWC66JS/EUVb/RfjqR3AA7AhsoMS+2iDyWIdv74elNT3AIUe/CTVs
 z9EH9GVoGMHgNLQUGjxkmxHnxV4NJm/bghCmmFFNm3T7T5CKEzVSmnkRKGj3LP69nEJY
 x1iw==
X-Gm-Message-State: AOAM532h3Y5bjXI7lOrYDWtPXpr1zbGkEaYvmTdpUxLDYSqVsSOmm/8z
 b9Sp7ueo9VlBsTPCe6H+Vuk=
X-Google-Smtp-Source: ABdhPJx3nmPKPdNUBaeU5q/r/ErzLGZ5/SkaV/YV/a/Qh0Ga7Xxlzf+SPCb93T7MX+NuDmzxPs1AYQ==
X-Received: by 2002:a05:6214:841:: with SMTP id
 dg1mr2016186qvb.18.1604674766923; 
 Fri, 06 Nov 2020 06:59:26 -0800 (PST)
Received: from poirot.caas.local ([2605:a000:160c:8556:38d4:503f:b7a:d871])
 by smtp.gmail.com with ESMTPSA id m15sm662872qtc.90.2020.11.06.06.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 06:59:26 -0800 (PST)
From: Kyle Russell <bkylerussell@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: mmp-sspa: clear transmit phase bit for non-stereo
 formats
Date: Fri,  6 Nov 2020 09:59:05 -0500
Message-Id: <20201106145905.365903-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 10 Nov 2020 11:14:56 +0100
Cc: Kyle Russell <bkylerussell@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 lkundrak@v3.sk, linux-arm-kernel@lists.infradead.org,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
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

The transmit phase register value is never cleared during hw params.
So once hw params sets this bit to handle a two channel format, it
remains configured for dual-phase, which is not desirable for mono
playback.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 sound/soc/pxa/mmp-sspa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 4255851c71c1..52d4d8ace1c3 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -239,6 +239,7 @@ static int mmp_sspa_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	sspa_ctrl &= ~SSPA_CTL_XPH;
 	if (dev->of_node || params_channels(params) == 2)
 		sspa_ctrl |= SSPA_CTL_XPH;
 
-- 
2.25.1

