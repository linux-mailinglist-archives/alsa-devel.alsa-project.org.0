Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2533317A6A7
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 14:48:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C388D1678;
	Thu,  5 Mar 2020 14:47:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C388D1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583416080;
	bh=GyQGXTcEnVt8OJkNit7VGUoNcZXl2tfU6IZ2owiidbY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=octQH0T1SBFWdsMr5G0gqklIx9FqhcySlnc3b4xnCndVuZhlqJET5VS8ZMsJnWaUY
	 +lDjrQi9zaNFPMOYd02HFFgJtq+mmntIhsX2D5MNpInQPUGDbNAo8HHhD83hIzZwTx
	 IEIjimq0xhmh/2af8BWvgDUoqcFcB290CVcjWfgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C36E9F8028E;
	Thu,  5 Mar 2020 14:44:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F752F80126; Thu,  5 Mar 2020 14:44:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21D2DF80245
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 14:44:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21D2DF80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="T5F5b3Hi"
Received: by mail-wm1-x32b.google.com with SMTP id p9so6383943wmc.2
 for <alsa-devel@alsa-project.org>; Thu, 05 Mar 2020 05:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dygBM3IDQ/peiC6pjioj9RigGEuEYQO9/0owHDjAWPs=;
 b=T5F5b3HiKx+y9ClklvqYnZ2nFWcudDtoe5xksEQEima6tkgVl2m20wVzv34hs4q5Px
 5GHr4/P8wbuqx59tG2zvMcXjQW3JKgXj/iSmHnqmTbDTFE2tPRrotAKTtPL8ZLxcrtBv
 B9T5SLa5c+c4lDw6+FEzPmvgDJ6q9x5NSrhlcPscyQGgLzZeY3IFdhuOkguAEpn2wMf8
 CrAb+cyv4g/caXiHmtRxFwt8VwHTZoQT4YsvHjKbZJps1IemSRICb7t37J1wTYF99BoN
 svpCxtQaNd9UqpBGyC2Og7FT2bKQEqd5xSNE/WsfWfpCd0oHg2e8hd4IoHLnXne01WXo
 9aZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dygBM3IDQ/peiC6pjioj9RigGEuEYQO9/0owHDjAWPs=;
 b=Ey2gSMl6svA11vwGE7M3Z8r36fQMMSB/TX/R5Yp+shk1R9N/H9TdRlL6JiOxuJE3DX
 pVasUJhmTfMcDNG7cvquVUdniJ3eyp+2w9J1cTW7LrzJQDVsa5A3QOmd+Efm/a0Q/pL5
 TT0UPuw8imcXq77ll55GV/VuGog5uj9sNvpGeWMendFJY/2fMXKwurJZy3cjk5dKUGlB
 vS+sWABQIck+37wmSL90J2Zvjgbyp1SkNWlPZ+x0ZoFosoD/+wztD2JWL8jjVlw6y3sI
 /M7nD++TZlmPc3THu7fhbazb5E9Bgl/IoSzBdQKxSlNyGudA64Mu5QOiNCMCxUcdBUvl
 qc6w==
X-Gm-Message-State: ANhLgQ3sI/TqawsUEpMMQjR67wkzOQ1KzlZsaHXWsqUvQlY763CL1pxC
 3e3yEXOamlAZbNYd8ttt1t9dSQ==
X-Google-Smtp-Source: ADFU+vsAIXP78B86ryXOiySfTqSQsvyoXwKCwd3i3WQxdWaNvuzCA0WLXme6LHpYN2Hc4/GmLt8OnA==
X-Received: by 2002:a1c:9d85:: with SMTP id g127mr9612269wme.75.1583415874742; 
 Thu, 05 Mar 2020 05:44:34 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id o9sm46425385wrw.20.2020.03.05.05.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 05:44:34 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: perex@perex.cz
Subject: [PATCH 2/4] ucm2: codecs: wsa881x: add codec sequences
Date: Thu,  5 Mar 2020 13:44:02 +0000
Message-Id: <20200305134404.7690-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200305134404.7690-1-srinivas.kandagatla@linaro.org>
References: <20200305134404.7690-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Add default, enable/disable codec sequence for wsa881x codec

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 ucm2/codecs/wsa881x/DefaultEnableSeq.conf  | 8 ++++++++
 ucm2/codecs/wsa881x/SpeakerDisableSeq.conf | 8 ++++++++
 ucm2/codecs/wsa881x/SpeakerEnableSeq.conf  | 8 ++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 ucm2/codecs/wsa881x/DefaultEnableSeq.conf
 create mode 100644 ucm2/codecs/wsa881x/SpeakerDisableSeq.conf
 create mode 100644 ucm2/codecs/wsa881x/SpeakerEnableSeq.conf

diff --git a/ucm2/codecs/wsa881x/DefaultEnableSeq.conf b/ucm2/codecs/wsa881x/DefaultEnableSeq.conf
new file mode 100644
index 0000000..499342b
--- /dev/null
+++ b/ucm2/codecs/wsa881x/DefaultEnableSeq.conf
@@ -0,0 +1,8 @@
+cset "name='SpkrLeft COMP Switch' 1"
+cset "name='SpkrLeft BOOST Switch' 1"
+cset "name='SpkrLeft DAC Switch' 1"
+cset "name='SpkrLeft VISENSE Switch' 0"
+cset "name='SpkrRight COMP Switch' 1"
+cset "name='SpkrRight BOOST Switch' 1"
+cset "name='SpkrRight DAC Switch' 1"
+cset "name='SpkrRight VISENSE Switch' 0"
diff --git a/ucm2/codecs/wsa881x/SpeakerDisableSeq.conf b/ucm2/codecs/wsa881x/SpeakerDisableSeq.conf
new file mode 100644
index 0000000..9614422
--- /dev/null
+++ b/ucm2/codecs/wsa881x/SpeakerDisableSeq.conf
@@ -0,0 +1,8 @@
+cset "name='SpkrLeft COMP Switch' 0"
+cset "name='SpkrLeft BOOST Switch' 0"
+cset "name='SpkrLeft DAC Switch' 0"
+cset "name='SpkrLeft VISENSE Switch' 0"
+cset "name='SpkrRight COMP Switch' 0"
+cset "name='SpkrRight BOOST Switch' 0"
+cset "name='SpkrRight DAC Switch' 0"
+cset "name='SpkrRight VISENSE Switch' 0"
diff --git a/ucm2/codecs/wsa881x/SpeakerEnableSeq.conf b/ucm2/codecs/wsa881x/SpeakerEnableSeq.conf
new file mode 100644
index 0000000..499342b
--- /dev/null
+++ b/ucm2/codecs/wsa881x/SpeakerEnableSeq.conf
@@ -0,0 +1,8 @@
+cset "name='SpkrLeft COMP Switch' 1"
+cset "name='SpkrLeft BOOST Switch' 1"
+cset "name='SpkrLeft DAC Switch' 1"
+cset "name='SpkrLeft VISENSE Switch' 0"
+cset "name='SpkrRight COMP Switch' 1"
+cset "name='SpkrRight BOOST Switch' 1"
+cset "name='SpkrRight DAC Switch' 1"
+cset "name='SpkrRight VISENSE Switch' 0"
-- 
2.21.0

