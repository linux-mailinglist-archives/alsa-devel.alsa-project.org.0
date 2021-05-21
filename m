Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6920338CE5E
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 21:47:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4BE216C7;
	Fri, 21 May 2021 21:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4BE216C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621626471;
	bh=yGY1RMM4TlKYkBgvUUFmT0q7Yf1rM1la4h8D3laPvc4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DFcdwzv0ZMUMePThWc3GhGtNvrPoUzmIDjvHo2j43r26xpElR79Ud6c1dzJCwkfSU
	 rcvxKVWtF8iQ6Uq6cvDGayK4kDujOqcTCiU6O2MbylAiIZm6dl8rirgLsGMJbwgtIg
	 zoFyhdTh1iYEGp5bQLcmPZkQjeRt4AUwb5q+/874=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D2DDF80246;
	Fri, 21 May 2021 21:46:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4578F801DB; Fri, 21 May 2021 21:46:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABE42F80153
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 21:46:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABE42F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="FGHeCXkH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621626370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AXwRBBohTtNMiSH1d9p6GTDN1YY1LoVt6VscAgQqN4A=;
 b=FGHeCXkHcGkgqQk0fkBic/7CsQpURutHsVIWAQ+JNGn5yuaNjNt5LAOoEpNopyUxhgiCib
 uOQoCRuXqeIRnWLpvTWIpFjqUtdgWHPZg5A1GO7Ows+LKvC+y3vxlLrMrafqti5GpHGUAt
 wQP/4X/15x4/pII4NlQseI/D8mJQEHM=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-ymp5RvUXNDK77s5vCewOEQ-1; Fri, 21 May 2021 15:46:08 -0400
X-MC-Unique: ymp5RvUXNDK77s5vCewOEQ-1
Received: by mail-oo1-f71.google.com with SMTP id
 o1-20020a4adb610000b029020660e40b70so13909451ood.22
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 12:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AXwRBBohTtNMiSH1d9p6GTDN1YY1LoVt6VscAgQqN4A=;
 b=WeLlupDysNE08uBe2yt0K7kBUAm5w/r77jyTF8aScZzX82Bhk0BB/T6oq663MOcNFO
 JlFGR8Tpuz+MLsUsqkp+AZFfHY3q2x2HgLsy/1STERN0uPlcqsABaZBotpo5wTQLFj8Q
 HHCfI0mLP8GFRsmESENVxd0HvUGU7KYRjcesLFImdx8uPdY4WaSL1rJg9xq9Ync2qOis
 9QzPwEZvWAvW2f9Ze0KT0KEayORlxtn1SHx3c3vMJar8TlI62x1Xx6HtAiBdwH1hSL5B
 EBaVop+OJ1t1iGFOKkzRitq6an3eGdw1A4cfO8AVxgv4kyh47qPJKDG94GPvQg5hO4On
 jCPQ==
X-Gm-Message-State: AOAM5311NQPeUsYOKaUa5lXHEHCEPqhp7wkjX63dHZ+r+rbYEP2OtPb7
 kiWRG/Qg98burYt6jgyOqqNuH9Mq0i/KdOw81u8vz+xyKyz5TfIrpFzw2d6ZyJlTMI5iViY2QGK
 eO+euiscxOVNDBLMTkRAGqNo=
X-Received: by 2002:a05:6808:488:: with SMTP id
 z8mr3404943oid.135.1621626368091; 
 Fri, 21 May 2021 12:46:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyDk+Y3YN0rSUTLPNqk+rFU9Nris8z2XeAeY7SxWK4J0Q/XmqBVVYpuz7Xq8mEvp6X6hYXxA==
X-Received: by 2002:a05:6808:488:: with SMTP id
 z8mr3404920oid.135.1621626367732; 
 Fri, 21 May 2021 12:46:07 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id s17sm1371250oog.31.2021.05.21.12.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 12:46:07 -0700 (PDT)
From: trix@redhat.com
To: perex@perex.cz,
	tiwai@suse.com,
	gustavoars@kernel.org
Subject: [PATCH] ALSA: usb-audio: initialize the cur variable
Date: Fri, 21 May 2021 12:46:03 -0700
Message-Id: <20210521194603.2077623-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Tom Rix <trix@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

From: Tom Rix <trix@redhat.com>

Static analysis reports this problem
clock.c:338:10: warning: The right operand of '=='
  is a garbage value
    if (i == cur)
          ^  ~~~

In __uac_clock_find_source() the goto find_others skips over
setting of the 'cur' variable.  Since the pin loop variable
starts with 1, it is safe to initialize cur to 0.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/usb/clock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 772478c725c2e..edc458c50bf2c 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -258,9 +258,10 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 	union uac23_clock_source_desc *source;
 	union uac23_clock_selector_desc *selector;
 	union uac23_clock_multiplier_desc *multiplier;
-	int ret, i, cur, err, pins, clock_id;
+	int ret, i, err, pins, clock_id;
 	const u8 *sources;
 	int proto = fmt->protocol;
+	int cur = 0;
 
 	entity_id &= 0xff;
 
-- 
2.26.3

