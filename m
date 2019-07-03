Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA605E400
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 14:31:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFA8A16A3;
	Wed,  3 Jul 2019 14:31:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFA8A16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562157116;
	bh=JYqj0KnXcHjoQqKpz6L1KWb4pILNHrnnxMRSiCWJvJ0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bJkaJibjvIPuIfCHV0VbCocqhKUIHQoC8DVPT5clQKBH3+gkJT5qeSY/q+8FGKASD
	 HojiFJ0GFm6gOhxQR+j55YkcK4io2NgUhDZ5G0psLbDMZzPlHUQKf7ClrTedi6Nu92
	 dOzcHz4I+phkbJExs59NSzLt292zhGZu9TmjhdBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6B0CF800EA;
	Wed,  3 Jul 2019 14:30:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85F77F800EA; Wed,  3 Jul 2019 14:30:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E1AAF800C5
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 14:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E1AAF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qrBq4LLq"
Received: by mail-wm1-x344.google.com with SMTP id s15so2191849wmj.3
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 05:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xFj9DUPFtxLHQsIlCm4S48hzRAgOZwgZjwnXnxnef0w=;
 b=qrBq4LLq6bjgsA372xk28tKa0vVPuRV+W5i0nVjrGxbon2jh47x2/QtXyzmQ8NPyAl
 hMrYJKv904ke+SenGzitZNWsEAF9W7OBH9RVNC0aN9AbvVXLnz/OFVSDg5Ns7miNQe19
 89VhUUNAgl2Fh26eHJ54S9/G9hDCkZ6P/5aQvpRTcFM5qCK0mpGVrE1Tg6oGsZMsgNqs
 SJrunPCREc8vJk7UmZVu35EUgJ8kfIeUCHoWIyyxD2X/Z3Wog8Jw1c04gxB2NBMlmRNn
 zTPRYn01q/1dKA+OxlcYnOOct/bnDFTGc7vhjsGqmLKE8HTcuTqjm1kgpDD32wXWRPdS
 EFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xFj9DUPFtxLHQsIlCm4S48hzRAgOZwgZjwnXnxnef0w=;
 b=i8PnczuMDTIny8fMKmgKVYHq6Srrz78Ja047eDd/4tYyVqUwNk+9+xSzhBC9mMGqD0
 vZlzHjvFEGNI7Hkv8DWSUlAw+vKYGaqi7FrIopVeSvGAy6YX6EAwjA5llq5zZxYji918
 6fAZi0daHuFasJHqskl50Umt4eHK28oxCMHheBYoUanUDX5x+5sS9/oLmPwxdQjopE1a
 t5KTmIg3SxHSVcEsIybOm1k4ZlpIJCaXlazFL35wgMCBszs25rRQLtEj9658V6waQ2sQ
 P2me3sd5va5GVpdcXsF+UnXTjy6OGtQVPOq/J/hNwP8aX5a2Ufk4uN0B1JlxYhwaj2yV
 oH4w==
X-Gm-Message-State: APjAAAW2PrhFr+K99AJFeDo5XMLczDEVfn8FOjYKr8HZVPb/4W9YoJ8Z
 B0HbqDRyyj8GNxfqhVTVxUSFeQ==
X-Google-Smtp-Source: APXvYqz5HaIcFTcpWTfdNDo5iXuvHWjuJr/ACZV7lRkp5N9tTSKgATVsTPsLZJrjBZTKGgfRZXEnQw==
X-Received: by 2002:a7b:cb08:: with SMTP id u8mr7746029wmj.167.1562157006165; 
 Wed, 03 Jul 2019 05:30:06 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id w14sm1323950wrk.44.2019.07.03.05.30.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 05:30:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Date: Wed,  3 Jul 2019 13:30:02 +0100
Message-Id: <20190703123002.12427-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, lgirdwood@gmail.com
Subject: [alsa-devel] [PATCH] ASoC: core: Return -ENOTSUPP from
	set_channel_map() if no operation provided
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

It makes it easier for common code to work with snd_soc_dai_set_channel_map()
by distinguishing between operation not being supported and an error.
This is done inline with others snd_soc_dai.* apis.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/soc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f08bef7328d7..62aae5a5c14b 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2688,7 +2688,7 @@ int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
 		return dai->driver->ops->set_channel_map(dai, tx_num, tx_slot,
 			rx_num, rx_slot);
 	else
-		return -EINVAL;
+		return -ENOTSUPP;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_channel_map);
 
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
