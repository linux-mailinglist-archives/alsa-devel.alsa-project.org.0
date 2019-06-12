Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EC64236C
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 13:05:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBF92174E;
	Wed, 12 Jun 2019 13:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBF92174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560337546;
	bh=y8hA/de0zDbQMs+wzgibGQdeQmlWgeV4f/b2uJ77H58=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V09aHZJQ7ygTbsCnvoSlYWBmTtDxkDiz+Kzcm1Yn5980eYFlgDJB8TntKVzaM1EhX
	 B7z7lIFKGcZi+IVfGpRaTaG5LXt4Xlbv3XnYq7b7dfgSgJBl7WMpLqoyg6ZT2kEWJm
	 NKeOlbNlx3e9qhnG9XBG2qcITQtwMTY5TiORU9CM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C695F896EA;
	Wed, 12 Jun 2019 13:04:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDF9EF896E0; Wed, 12 Jun 2019 13:03:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5867BF80794
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 13:03:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5867BF80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KZX4u5D7"
Received: by mail-wm1-x344.google.com with SMTP id u8so6070749wmm.1
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 04:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MRVsNIFezwN+iFmcBdbEviK/+CqAMtf2Qx3jn0k/cq4=;
 b=KZX4u5D7ed6FD65XeikM9bjph1fJHoblo5WeT7sGLQNEZjhJtFnUVUMGOdAcqBs1FH
 MnLgXdWolCNAQ8kgyPppetW/t0GsZ0icP+UnP3hEAOWPOncSEFktdLNIn5vS23Lwi33u
 zCs0Z2VVIYiTx+78GEYCFt4gAWn8LjJKgIohnTcWZwfMC6TKHC115kYybpvyGdImEU32
 XygnPlgNTVKgl1U+SBKuSan8sX3hfxfHaeRx9jeK8giAgR3yIyC//OjUozPyedh9yq5O
 xqRtajj6T6Qs3iC+KbdKo0wH2B3CD4mkPEGbiQU911mpFBQVFt1Ej4ydiGb09BOjTRpO
 vFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MRVsNIFezwN+iFmcBdbEviK/+CqAMtf2Qx3jn0k/cq4=;
 b=BgdXl1phnDKOZ030HFvit19bDa4ghauG/xG0t7JFNcr994aNs7Gv3SAQ31Gfg3Fqs7
 7uFlFnvb0z0Ds+q6TmWNEkpJqGJmSsyzhA/K+XHWuJikpoUcS4/01KMhrkDLz7aILAL0
 Hn9pVX7j2Uxmwe71Yu8jIdhMiI3qk+82apUE3iv6XUSuRoellBC+qg9EbT+HpweXGS0/
 X96c1Aso+prUGSqftsUOqgZBYJHNdzU9s2Bn2FX24i8m7/Jze/HqC8j4eTHqHmKg3t08
 9H/SWpCSGwiTC4Dwpgj8FoDplsiWb126yHcPzkpLhcEe2X5lYYid5aT/p10Olni3rark
 SjUA==
X-Gm-Message-State: APjAAAWsGJzXdm6ZdnzW70jYDlHVlm6RDay817QcGtZnMbuYRmdsr1u2
 iiv78ocJXOuCPzVEFQz1m0lIsg==
X-Google-Smtp-Source: APXvYqwGuZyXGxSIIsvN6tyq2Ob0bFN8ZLKHfbbJBMQQ0juJvA6/N3k51H0lF3LKfaNOn0uwJ8zEmg==
X-Received: by 2002:a1c:c907:: with SMTP id f7mr22192836wmb.142.1560337435377; 
 Wed, 12 Jun 2019 04:03:55 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id h8sm5317940wmf.12.2019.06.12.04.03.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 04:03:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Date: Wed, 12 Jun 2019 12:03:43 +0100
Message-Id: <20190612110343.4463-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] regmap: fix bulk writes on paged registers
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

On buses like SlimBus and SoundWire which does not support
gather_writes yet in regmap, A bulk write on paged register
would be silently ignored after programming page.
This is because local variable 'ret' value in regmap_raw_write_impl()
gets reset to 0 once page register is written successfully and the
code below checks for 'ret' value to be -ENOTSUPP before linearising
the write buffer to send to bus->write().

Fix this by resetting the 'ret' value to -ENOTSUPP in cases where
gather_writes() is not supported or single register write is
not possible.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/base/regmap/regmap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index f1025452bb39..19f57ccfbe1d 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1637,6 +1637,8 @@ static int _regmap_raw_write_impl(struct regmap *map, unsigned int reg,
 					     map->format.reg_bytes +
 					     map->format.pad_bytes,
 					     val, val_len);
+	else
+		ret = -ENOTSUPP;
 
 	/* If that didn't work fall back on linearising by hand. */
 	if (ret == -ENOTSUPP) {
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
