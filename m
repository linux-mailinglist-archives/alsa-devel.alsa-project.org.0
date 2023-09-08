Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6DA798018
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 03:23:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1679384C;
	Fri,  8 Sep 2023 03:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1679384C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694136227;
	bh=yWp8DuhTcD7BrvPI6im6GEF748jlGewHJeVQ3gRhD4k=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=quWrHJuld9c68FsPPzbDEmHebDpZ6DKkgZIdaoSJScu4U+Gykcm4tqSj1p6SSSmZa
	 LBlj7JVMS5Xuumw23dZg+KfqvbUK9CO8Ei2l86dDs7pyhFuAPOIglu59eJ9Cu8Nlgj
	 kJxFIvA7kpONWnz+DJcfckksNJd12qHW3scNUy0I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B98E2F80527; Fri,  8 Sep 2023 03:22:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B6DBF8047D;
	Fri,  8 Sep 2023 03:22:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2C34F80494; Fri,  8 Sep 2023 03:21:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19241F80431
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 03:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19241F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=A5+RbUxU
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1d53ab187e8so1253676fac.1
        for <alsa-devel@alsa-project.org>;
 Thu, 07 Sep 2023 18:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694136110; x=1694740910;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wn2s0ol2GfeqvnptChvAqCHHfMFKUIzMBlycBVjIV3I=;
        b=A5+RbUxUHQ48TTW/BTzhqszlLQedKWzdJPQgizHa6UGw24Y9HFn9rq5feR58+Swerl
         +TiNuBp8gVbzrci/MkNaJW2pj2MCkTtzPx6MRAzPg56QCZa5vvSiVwBp6YpN03OTXuH0
         eITw6G4pLq+5f127+GV9m8GJJOzm8WM5Pw9cHWLde1IFNSuIGc7C5tkxOI7xJ/WNXEmH
         s+cocWIXyc8P5XKLA4TP5Rm9QXhQ/sxOwZ2f62j5UPnNJDTZjKTV2U6So6nCOl78XHd+
         vd8067NSQwdjbliOFDsmrUucawK2TR5a4QdZXrHAx018azsXjVAUzfEQEbiSNY9LINbV
         N2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694136110; x=1694740910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wn2s0ol2GfeqvnptChvAqCHHfMFKUIzMBlycBVjIV3I=;
        b=r7/zomGuFplURjhegpT2cYS74hHLGv3in+F5BrpwuFHpccsUpQ7rs7uMRKUhRjcygr
         3b3HHRjvcZKNJkzcs/tlYKd0y09RBYXpU0ySSbMQXEbCupnyvkzWBWxw6vmtjEAIfiC6
         ZzcGV6h5mpihivVG4JXPC4/QY6FQIiBRWsMIeAMqG8SSL58CikN71ONqpqfO3SDveSPh
         Od+JH6YA6yLePtW1Vpz3+LAcVPTAKz2AZv2W1XRg8m7LD9vR5bGrqnASGGjwRihvF5gM
         By6OsLZ4eAijgrMWLks+y0QVNXbjsYIKwyNp7LfQ7dJYgATLwI+D9gOcCLx+oc4SMvCU
         6/lA==
X-Gm-Message-State: AOJu0YyZr066C/TszTrzmlkN45U6Sh18RvuGm30H7sjLNRzwOswdmkxq
	kTQ1mqKjq8AuIanwKuDG8bnFTgX37D8dEg==
X-Google-Smtp-Source: 
 AGHT+IHlN5XDXIVGsQXr9doDMF0mHPMiZZIEKGI9ZvWYhzjg3ZQ43aaSoNHp+fnSczompFV/N7d/gg==
X-Received: by 2002:a05:6870:4711:b0:1bb:8483:a807 with SMTP id
 b17-20020a056870471100b001bb8483a807mr1441976oaq.44.1694136110309;
        Thu, 07 Sep 2023 18:21:50 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id
 la7-20020a05687c328700b001d5068b11b4sm387382oac.30.2023.09.07.18.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 18:21:49 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: alsa-devel@alsa-project.org
Cc: perex@perex.cz,
	danct12@disroot.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH] ucm2: Rockchip: rk817: Fix Master Playback Volume
Date: Thu,  7 Sep 2023 20:21:37 -0500
Message-Id: <20230908012137.4123094-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CYSU74XYC7AIMB6M4YIITILEJ5W52B2I
X-Message-ID-Hash: CYSU74XYC7AIMB6M4YIITILEJ5W52B2I
X-MailFrom: macroalpha82@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYSU74XYC7AIMB6M4YIITILEJ5W52B2I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chris Morgan <macromorgan@hotmail.com>

Correct the "Master Playback Volume" from a PlaybackMixerElem to a
PlaybackVolume. A user reported that without this change the hardware
volume would not change correctly. I've confirmed that when using
Pipewire the Pipewire volume and Master Playback Volume would change
independently, in some circumstances resulting in very low volume
that would be difficult to troubleshoot. By changing the Master
Playback Volume to PlaybackVolume this problem would no longer occur.

Fixes: b0497ca4b508 ("ucm2: Rockchip: rk817: Add ALSA UCM support")
Reported-by: Dang Huynh <danct12@disroot.org>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 ucm2/Rockchip/rk817-sound/HiFi.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ucm2/Rockchip/rk817-sound/HiFi.conf b/ucm2/Rockchip/rk817-sound/HiFi.conf
index 8d90567..a714759 100644
--- a/ucm2/Rockchip/rk817-sound/HiFi.conf
+++ b/ucm2/Rockchip/rk817-sound/HiFi.conf
@@ -26,7 +26,7 @@ SectionDevice."Speaker" {
 	]
 
 	Value {
-		PlaybackMixerElem "Master Playback Volume"
+		PlaybackVolume "Master Playback Volume"
 		PlaybackPriority 100
 		PlaybackPCM "hw:${CardId}"
 	}
@@ -55,7 +55,7 @@ SectionDevice."Headphones" {
 	]
 
 	Value {
-		PlaybackMixerElem "Master Playback Volume"
+		PlaybackVolume "Master Playback Volume"
 		PlaybackPriority 200
 		PlaybackPCM "hw:${CardId}"
 		JackControl "Headphones Jack"
-- 
2.34.1

