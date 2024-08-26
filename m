Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7606C960988
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2024 14:04:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D08D7847;
	Tue, 27 Aug 2024 14:04:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D08D7847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724760297;
	bh=D56uU97DHLTAV46MruOMwh3ENgVDe/CheFULj4BVelg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nqrikwgUme5UNccIe8I6K2JS/FbKTTq8RaLSlnwhFUhBmlPul3iUKuZutvrYA4agg
	 qZgWbw32CPMrek8QrtsU5u8QVndpho8V7jF9YarcVRPWgk0wcwZPZHck6cev0atqcv
	 d5BQBS650xxJSDgBZswCBjyGnaSCaba699JDXPWw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64FE8F805AE; Tue, 27 Aug 2024 14:03:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D54FF805BE;
	Tue, 27 Aug 2024 14:03:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA0ECF80494; Mon, 26 Aug 2024 13:39:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	shortcircuit=no autolearn=unavailable version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15853F8025E
	for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2024 12:33:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15853F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=G7ZEIdgs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724668296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0caQWYctkzPWXc3lfa4QY9g9vHYDKQdJAJoab25gorQ=;
	b=G7ZEIdgsscWwhJLVDqpaf9Bd6jHJZJ7+ZA1+CgjTPTFU7yCPM7EkX18eRMvxVbUejLbamz
	WdcD3b6mhGv7FCLuLAtIl51e7TmO5L7OkDpTBx4Wz8Wg8yhI98wStq2W5MOd3YeANQzthl
	nbzx6oe+ujXUkrDUskX9EZEQm3bAq44=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-vWlB54opOciIQ0xqd0AdOg-1; Mon, 26 Aug 2024 06:31:35 -0400
X-MC-Unique: vWlB54opOciIQ0xqd0AdOg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-37197b9e1ceso2577063f8f.1
        for <alsa-devel@alsa-project.org>;
 Mon, 26 Aug 2024 03:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724668294; x=1725273094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0caQWYctkzPWXc3lfa4QY9g9vHYDKQdJAJoab25gorQ=;
        b=k1hcnd82TJk+mKgvmWLlY6qnmkrVx1/6vySfX2l5DRo4Cyfzs9w5oIpLUCikVDU3Ob
         qDNPBayzUe/1HYsCI3YhIsFtPjJrIINDiefAC2s6eW8Q3Dk7y2CbARBfYvbIQfQQ7dBE
         7YUxPBhp/9SKGeFVIDI8a2vaYGB/M9NZqs53RLyOe6Vs1Vx3+hm0H3NLJFBvstiQErfF
         Q0CyHCfbDNfR1gHu+RwXuv6HgOSK/Ou6taRtjiZc29AATyLIoRbRtHiZEzHMRpkiCV9t
         tApR7YzcIrdyZTcPG/rjJ/YH6yJ1MgZVs6mvLkJsChKygkAGw3qsMwRFrw/k7nJx11gU
         4HuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6arzo5VDs9ouu5yGgTcfGLo0V5Y9jTKuI3fTwwrXqXtOVf/uBQ4R9398AvZBf1BCoeqYuzit/vj4j@alsa-project.org
X-Gm-Message-State: AOJu0Yzp5qk0WzIPC6Zo06VWP0FeVEQrqOeoblAlW0i8ARsI0tkhylFi
	0pe5qdp37K7Ro7aFn2NvzAWFkueJSo2ex8SOMZxeSaCODyxV9q72nF1kb01Ap76yk8IeCMbgkeC
	4XKLcraF0a3TfMUzE/eFa1lNWJftyXfy7rtfi7Wr0Zdx9G8h9Tom6gtiQW27e
X-Received: by 2002:a5d:6702:0:b0:371:8db9:939e with SMTP id
 ffacd0b85a97d-373118e356cmr5559982f8f.51.1724668293902;
        Mon, 26 Aug 2024 03:31:33 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IHUeeP55UuNdWAbZbdqz9KsjtE0dvBbjRTHSYopNttrDKLMjjvyaUEJgoMgra3xM9ZAZ8FKfQ==
X-Received: by 2002:a5d:6702:0:b0:371:8db9:939e with SMTP id
 ffacd0b85a97d-373118e356cmr5559965f8f.51.1724668293420;
        Mon, 26 Aug 2024 03:31:33 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb
 ([2a02:810d:7e40:14b0:833c:88f3:25a9:d641])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac518043csm148327225e9.46.2024.08.26.03.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:31:32 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entries in TEXAS INSTRUMENTS AUDIO
 DRIVERS
Date: Mon, 26 Aug 2024 12:31:29 +0200
Message-ID: <20240826103129.18882-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-MailFrom: lbulwahn@redhat.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XQTD3GR5AJU2Q3NB6O2MABQGJIX2SP7E
X-Message-ID-Hash: XQTD3GR5AJU2Q3NB6O2MABQGJIX2SP7E
X-Mailman-Approved-At: Tue, 27 Aug 2024 12:02:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQTD3GR5AJU2Q3NB6O2MABQGJIX2SP7E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit e486feb7b8ec ("ASoC: dt-bindings: convert tlv320aic31xx.txt to
yaml") converts tlv320aic31xx.txt to ti,tlv320dac3100.yaml, but misses to
adjust the file entry in TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

The pattern ti,tlv320*.yaml in the section already covers
ti,tlv320dac3100.yaml and ti,tlv320adcx140.yaml. So, further file entries
in this section are redundant. Adjust the file entries in TEXAS INSTRUMENTS
AUDIO (ASoC/HDA) DRIVERS accordingly.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5dd88c28c0f7..6aa85a43d8c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22753,8 +22753,6 @@ F:	Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320*.yaml
-F:	Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
-F:	Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
 F:	include/sound/tas2*.h
 F:	include/sound/tlv320*.h
 F:	include/sound/tpa6130a2-plat.h
-- 
2.45.2

