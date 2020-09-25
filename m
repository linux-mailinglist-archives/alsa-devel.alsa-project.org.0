Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1709427833D
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 10:51:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F8B81841;
	Fri, 25 Sep 2020 10:50:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F8B81841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601023901;
	bh=1SMTnsbF5GcW6Yuyphd6Q6kAt6KJNG0yPJ1lMnGJXaI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e1eebULQr/4VyZDW5sYhozOZyH11oK/GA9/Ug/JO9sjD5h0pc9Eb4ZevAxm5m1a4B
	 55A0uLi1JYAujHM6GfmKYHCIG4x2K4nN4ST+1st/rAq8e4zQ6+2VplNcCWy2N/dWqQ
	 jQv8wsm6qfW+idrjru6zSZlmhkYjmq1+MQAPqD0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98F7CF800DA;
	Fri, 25 Sep 2020 10:50:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34F81F8021C; Fri, 25 Sep 2020 10:49:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0313F800F6
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 10:49:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0313F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uJ8JC/kh"
Received: by mail-wr1-x443.google.com with SMTP id c18so2647006wrm.9
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 01:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IlWOGu61caSeoYRT7WyG/oLloBIbjO1N4nhvVBC7mNE=;
 b=uJ8JC/khJYZPpFxv5ckTXKeMcBaXe67num4gM4qocSOZJr1l6lyrJdnN5xPM0E1YVB
 8u0H9mFmMG07ZUX++hiwv5A9N9764MgcQQNEZjegt/nP5rPGsdaXo/jqfmlJOUFO/5hJ
 AWzweshbWZydtJ63TJ/BDinSkgEGEHedDFfa4dHL9pwHmhO+Gnpphsxz3QlAjDL8u6hO
 VkoJHGT7C1YtQHho9yeGBcDxmGr2KomsLO8UvyqqVNwznMWn9ubK8mChkH9E/qKpRc+9
 Cn3GlguZw1iBlI4jYc6e2xcKqRRcR4tevUJfNPxaV3NGaJTdsaB0Jlkjk3+tJHj2QqEK
 eu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IlWOGu61caSeoYRT7WyG/oLloBIbjO1N4nhvVBC7mNE=;
 b=FWdKHZedV+G23l9AXjT1Cn+5xi9899oPZmdgsjH2GhRvdvLUtoT7z2D2Tk3idaRu3N
 HNZtd8DUeRykdGfwg+0gK8PWZ1dQuXRC0gGsNyXV8zTXnhujL6z7xvQSCVYwJBjntHFW
 W9fTIkisIyi0mXilDRyLBXjveScAwRoCqqV+MhM4U9P135zhnp8rZPjjj0tqVegCd4sy
 beffVYTtR4tH/LTYIsciD7T0W2q46+1KZfRwFgctf9x+5HS5pjMoFwN1iqdBsIZblZev
 sFfLO7g+GAU5OpwzOHwrQ8iHQiH2RGknCmy+ERD3Rf/tbehSpvZjWj/P/vjVu9rGGprX
 MRpg==
X-Gm-Message-State: AOAM533HJafiQlYujEN8Q4vmN0vOw+ljycpedZ6XD8/AUEFbLsYPsZeQ
 Bt6154qw0XYXYl3XTZghS+taqg==
X-Google-Smtp-Source: ABdhPJy9cN1jYFXrH8+KJsNFEddslJbdRN4gvdwpyB2/teUN3+XBdSj3ie3i7CfO7egVTT31ol9wrA==
X-Received: by 2002:adf:f2d0:: with SMTP id d16mr3164899wrp.332.1601023774243; 
 Fri, 25 Sep 2020 01:49:34 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id u66sm2048623wme.12.2020.09.25.01.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 01:49:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/2] ASoC: qdsp6: fix some warnings when build without
 CONFIG_OF
Date: Fri, 25 Sep 2020 09:49:23 +0100
Message-Id: <20200925084925.26926-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, tiwai@suse.com
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

Here are fixes for two warnings types discovered while building qdsp6 drivers
without CONFIG_OF and with W=1

One of them was reported by Intel kernel test robot on q6afe-clocks patch, which
equally applies to rest of the qdsp6 drivers.

Srinivas Kandagatla (2):
  ASoC: qdsp6: Drop of_match_ptr to fix -Wunused-const-variable
  ASoC: q6asm: fix kernel doc warnings

 sound/soc/qcom/qdsp6/q6adm.c        | 2 +-
 sound/soc/qcom/qdsp6/q6afe-clocks.c | 2 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c    | 2 +-
 sound/soc/qcom/qdsp6/q6afe.c        | 2 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c    | 2 +-
 sound/soc/qcom/qdsp6/q6asm.c        | 5 ++++-
 sound/soc/qcom/qdsp6/q6core.c       | 2 +-
 sound/soc/qcom/qdsp6/q6routing.c    | 2 +-
 8 files changed, 11 insertions(+), 8 deletions(-)

-- 
2.21.0

