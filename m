Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DF82D32D5
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 20:55:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7914E16D5;
	Tue,  8 Dec 2020 20:54:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7914E16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607457301;
	bh=ix30Duv7mwu5Sof1EkCjl83ktbYnUAkFRJOlT+SJWLM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eqcIMC9LyDtUKxI26JVY8i78XVgx3sH5v8bs1kxIk/Z5iL48b5EbQ8KUMzu/uVbIj
	 /G3gOFcyIeDhTQA1uxG3i6uY0VFFDfhgcrX9T8B1W2PiS3eCaGEs33yzTnZ9WxM7ze
	 KdGT8pFcZGm/bRLg0Pc7TdxGZA10+QYfeVHIAdOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC9B1F804BD;
	Tue,  8 Dec 2020 20:52:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0284F8027C; Tue,  8 Dec 2020 20:52:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 087F9F80164
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 20:52:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 087F9F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="H+O+LB9l"
Received: by mail-qk1-x731.google.com with SMTP id 143so2067467qke.10
 for <alsa-devel@alsa-project.org>; Tue, 08 Dec 2020 11:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8EiQ216BCvq5E3ZOT1I0q0n5ZMKUzKstAb5dwxu2d2I=;
 b=H+O+LB9l6tD4mV0hOiWsrlvudGlRYkKHYX1vIuNGbQRlA0M41yWHaSqoynyQ/KSduU
 /nx93xjIgpA2ZqNBfy8sfx/uQM51WYb9zBcCY18tFIfB/vu7K6mJH5uw4wIjcs+Kdc5t
 svK2wCMfMXWVnKSyDaJ8PRAAiXZVu3B8bh4VQli/HnwcVjQI6q45BlM3xA4ja8nTw/KH
 G6Ss0wcAQUP+o7l0MhNP6cjG4V9ytYYXZ9vZlBtZQd7FNpRXJqbX9B9Bn+pmhbEmPOC3
 F1RZWOplj9UOEBemVv24FDfahSFE4FwsYdv0gZ0K9RopqDhBvKLg8RyZa0/iXZekC+A1
 apqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8EiQ216BCvq5E3ZOT1I0q0n5ZMKUzKstAb5dwxu2d2I=;
 b=dTAUmiQdWeDytUeBYIuCebe9eMVlRloJ0BfAAQEqZ7dSovdY5E/dojO2sQNLp3fasB
 3PPwyvDldyjVhyHPUis1ADA6ESLKoxOws21Z9BSVcW+sqD3Zze1LUnxIuKjn0n+QCzdt
 gXvT3sADAAJgPbBLa7j4CAIBgWiLjhFSJX6bLpCfyyQnZHZ8FjJODKYSfupLUHUBj6CJ
 x9z2JtchRFep3g05bKyiaaOkHRleFx5VV9nDE5Olac1j6NOHpNdbC3ei9+nQW72bHfHP
 3MFQuKHgLSzsEiT5HOxfUyzUX+4cQt/4Sw7guJlktSgpAziHXGL+J9eENhM+Dsk3N0OT
 llhg==
X-Gm-Message-State: AOAM530kwwgz8v4ZgmsNT3Bq9K5GVl6qp/zjGbTXhU85L+lW3gqA/Rtk
 AtK0Jcw2seB9pdFHulP+PgQ=
X-Google-Smtp-Source: ABdhPJy2QKOFcGdKPniH3biP/AcV9n4+MreVaxj+4qol5JZ4qA/vdo3UcHnohnWncAYFYRuDZ0TMZQ==
X-Received: by 2002:ae9:df47:: with SMTP id t68mr31594897qkf.438.1607457154512; 
 Tue, 08 Dec 2020 11:52:34 -0800 (PST)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id x24sm14169458qkx.23.2020.12.08.11.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:52:34 -0800 (PST)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 3/3] ALSA: hda/ca0132 - Unmute surround when speaker output
 is selected.
Date: Tue,  8 Dec 2020 14:52:22 -0500
Message-Id: <20201208195223.424753-3-conmanx360@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208195223.424753-1-conmanx360@gmail.com>
References: <20201208195223.424753-1-conmanx360@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, conmanx360@gmail.com, stable@kernel.org
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

Make sure GPIO pin for surround channel mute is set to 0 when speaker
output is selected.

Fixes: def3f0a5c7007 ("ALSA: hda/ca0132 - Add quirk output selection structures.")
Cc: <stable@kernel.org>
Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 793dc5d501a5..6d647d461eab 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -1390,7 +1390,7 @@ static const struct ca0132_alt_out_set_quirk_data quirk_out_set_data[] = {
 		  .has_hda_gpio     = false,
 		  .mmio_gpio_count  = 3,
 		  .mmio_gpio_pin    = { 2, 3, 5 },
-		  .mmio_gpio_set    = { 1, 1, 0 },
+		  .mmio_gpio_set    = { 1, 0, 0 },
 		  .scp_cmds_count   = 0,
 		  .has_chipio_write = false,
 		},
-- 
2.25.1

