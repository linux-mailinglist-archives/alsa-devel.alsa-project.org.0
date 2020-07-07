Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 292F5216A49
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:31:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C36AC1672;
	Tue,  7 Jul 2020 12:30:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C36AC1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594117878;
	bh=0FVxQneLc0kXrGDjM8rqEU0RgT4cRqOVRCGonSO3BA8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LMaancQcCtqUkg19vRld4pVFK9TnzadcqnxLqszGIZwT7NZRbX5ukEE+V91Gd8mnq
	 cScH9Uot/oL8Td17woth1wMHGk6HSXf3MzBQjCVumPJYpxwzoW/CUF3T6Q5myGDYBn
	 yKVS9SCWo0D2KERRo1a/IVnHtkcU9lq0L9MylDrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44323F8038F;
	Tue,  7 Jul 2020 12:17:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 819F4F80345; Tue,  7 Jul 2020 12:17:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5CB9F80315
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5CB9F80315
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QGMjHJlQ"
Received: by mail-wr1-x443.google.com with SMTP id f18so36486153wrs.0
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EXLqTyUKMLj4M51ntYR1QA4V9xA1YrzmuNUETaX0PBA=;
 b=QGMjHJlQ9LWikvX6Na5JwK9UPUmF/DNUlzfwClDFWUzxLNI3vHyW3hm6xlfswr2AV8
 wkFMnZoIWoQ8W/vbLtLairtyr3oUjXlaXBn79y60eIPJCInMUGmqhIwj5oH14AoPyTuW
 PpuseWJtIwwqJ+wYUvHy5dH0KlMSlu3UwlLaMIwhi5Ru3QdAjHI0pt0KyOvCYdK+XJuB
 g5A8bJoPOmMZSw0D/+fiy6siWxtEreitU2khKnrX6y7K+Wbf/i7VhqyVGk1Vfn7qfBdZ
 zdC4l9jK22GpHnEbOHuseblQoFf5gMl+OxkiwHcQ/RKvu1QoDmvGzarx+CMpe8vRPBXe
 tr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EXLqTyUKMLj4M51ntYR1QA4V9xA1YrzmuNUETaX0PBA=;
 b=f7YpBPEaOlfZUv8KmS+bUmy+SBkV4b0IaH8F3yCX9V3axXIkKnWLnRfx5qGU0OXPnA
 zDMj9Ty+n3KJHQSYAtnWtawKZJA5WH6oyOAY9gUiqhRbZkqmSR/UVWHjq9Rtdo4L+2ss
 mDQ1bQd9NlUY0utieK7F3RY7MoD+OxvS+GX1G3M7XiogtunIHYIiryBSxnJsN3D037F7
 /918bCWol3lh9VjvRMW8uRxsrrJAfEpCbLvEwcOI17awfCfl5FDZ9Y6sZGGjpoNsh5DN
 jdT+S1XqG/+Dcm7VJTNm2TOtzc2TRfMo8oLy5xmptqDQnxs7pMme8phjJIVOtkOhVCjA
 pfPg==
X-Gm-Message-State: AOAM531MAFTsWDj/MuGWrsgZmpuLCDYC4PlsQ2vnk7kjNH+9lsr3Nxjq
 eEYyyGQZrrbwCCby2Vl93J1S5g==
X-Google-Smtp-Source: ABdhPJxqAC3BtmcDgPQdVNfB2mynSSt1Kjfhgyv7zPY1kPqaosnB4BBwP2w2zFQNZfEfX5SODLsnZw==
X-Received: by 2002:adf:dfd1:: with SMTP id q17mr50235597wrn.94.1594117036243; 
 Tue, 07 Jul 2020 03:17:16 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:17:15 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 23/28] ASoC: soc-ac97: Demote seemingly unintentional
 kerneldoc header
Date: Tue,  7 Jul 2020 11:16:37 +0100
Message-Id: <20200707101642.1747944-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Richard Purdie <richard@openedhand.com>, alsa-devel@alsa-project.org,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
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

This is the only use of kerneldoc in the sourcefile and no
descriptions are provided.

Fixes the following W=1 kernel build warning(s):

 sound/soc/soc-ac97.c:402: warning: Function parameter or member 'ops' not described in 'snd_soc_set_ac97_ops_of_reset'
 sound/soc/soc-ac97.c:402: warning: Function parameter or member 'pdev' not described in 'snd_soc_set_ac97_ops_of_reset'

Cc: Richard Purdie <richard@openedhand.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/soc-ac97.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-ac97.c b/sound/soc/soc-ac97.c
index 906106ed8ca14..af789552a9d4c 100644
--- a/sound/soc/soc-ac97.c
+++ b/sound/soc/soc-ac97.c
@@ -391,7 +391,7 @@ int snd_soc_set_ac97_ops(struct snd_ac97_bus_ops *ops)
 }
 EXPORT_SYMBOL_GPL(snd_soc_set_ac97_ops);
 
-/**
+/*
  * snd_soc_set_ac97_ops_of_reset - Set ac97 ops with generic ac97 reset functions
  *
  * This function sets the reset and warm_reset properties of ops and parses
-- 
2.25.1

