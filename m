Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB8E17BE77
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 14:30:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A35A9F6;
	Fri,  6 Mar 2020 14:29:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A35A9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583501401;
	bh=SkBAmBf4nzPpqS3vaP9isMmGP5/RyT+Pgq4fpi/drGo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UWoKnJtOR6Le+5WKLsKqfiL+iZzKtcXY49Ua4wy9w9cnPf05JuMdGBsldKCfQ7JmY
	 AOevg/9yZC8EqJhqOXubYbKluVoaN7tjlzT3iuXSsLcAQPPD/q52FD4vIIb5PHY+8y
	 4ehGGyP8mcQDAsx5q0WwXugqpVbv538SsB3RC1Kw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97FC2F801F5;
	Fri,  6 Mar 2020 14:28:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89929F801F9; Fri,  6 Mar 2020 14:28:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36AB8F80125
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 14:28:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36AB8F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JVZkiafE"
Received: by mail-wr1-x444.google.com with SMTP id s17so1457804wrs.3
 for <alsa-devel@alsa-project.org>; Fri, 06 Mar 2020 05:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ATcltqBAZ3vv6t5DCoZL9cPihQSXfcTDNZgQ8YyGQjM=;
 b=JVZkiafELVxPRF/LtVsLcPTtVn/TzBrli4Bdkqp3fL88X9wXB9ixRaBhcT1HWOmwpK
 nVDu7VbhSFYHXNLTQXPqkKXTQ5jGDxhCeBcv/+YRJESQaCcrHQcES6xIOK9AuYntANPz
 p/S671OFGg8decPT5mi6wMubUWBdM6AvdZxwZ3ECAZKHoRyeqZBK2Ik17sQU1VkCiE7R
 hsf3Gpt3UIB+HPlKpyFyIIQl4E/cFjNEi2ksf9cSCj4uxEzvxO0E1tg0Md6XGeQiyMuB
 1BvUgy8dLvMW6quhYUK6k48JylBh1JIYpNW5mJt3YCYsagUIvNBHlnoR/AIs3nHqkJUy
 Pjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ATcltqBAZ3vv6t5DCoZL9cPihQSXfcTDNZgQ8YyGQjM=;
 b=uEPkZVXdKBKJVaambn+7mfaHL988Gkja0qP7G3oGSTjreNAw8QiPmZteQBzMme3pC+
 3q1iaiO+dh7r7tTQn4TrzkSXpPUbXekQk9GjZhlbrA+V2DSW4zSXZsPo5vE8X3N8nAD6
 dUBF2LcHLToyaCpMPaQ0z4YIRQP0w7hvClAqC3DRe4eBzUEtHP/STSBFDWGjUZR3v6Jz
 ouup3/cV7bicn03MCu5JYBF3M0Hz86u8Ivab00K4w1Gz3wzEa3gUlefBDtEgvViIkXcc
 eRKI9uuu0Aet7R9ndUVbNKUblH0pQVQFzQDdeU0R2zXaTuHE0wry0ipW/LBv251+u/j0
 YpuA==
X-Gm-Message-State: ANhLgQ2TZljokr0TmDhWIN5DYzUljdQtZMVR8rsxAIZQzWFabe6fDJOQ
 y4c0ZZa+xzfYCey2GusasTVJxg==
X-Google-Smtp-Source: ADFU+vtdpTEb+R9fc08Xg3nFUFodU7hiSp7Kau/HAd/4WuD15ZkHU0XD1dXctPsLd1AW9FG3ZIIgdA==
X-Received: by 2002:adf:c449:: with SMTP id a9mr4023051wrg.366.1583501291148; 
 Fri, 06 Mar 2020 05:28:11 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id t1sm53349237wrs.41.2020.03.06.05.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 05:28:10 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/2] ASoC: wcd934x: minor fixes
Date: Fri,  6 Mar 2020 13:28:04 +0000
Message-Id: <20200306132806.19684-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, lgirdwood@gmail.com
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

This patchset has 1 fix and a header cleanup found during
recent testing.

Srinivas Kandagatla (2):
  ASoC: wcd934x: fix High Accuracy Buck enable
  ASoC: wcd934x: remove unused headers

 sound/soc/codecs/wcd934x.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

-- 
2.21.0

