Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 824AD4AF4A4
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 16:02:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F79B18CC;
	Wed,  9 Feb 2022 16:02:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F79B18CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644418976;
	bh=75NDQYMX4B066Jeh6HZtTwh0uPauGP9/bE9DyKQ/5mc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZIQJyegU+HKKFp+AU6zBycrg5K/v6cZpbKp5k0OkxzHX0UNJ35l2KzV9awx2K7RqH
	 JDZUECVGf9OppY69Xe3e81EbERBm1ni2lLmwZe8o9g0smvLqlrQ1ARCfiFfgBpBPVK
	 F2IZlPWt1Fur06UpEMTG5AQGRq+IIXFY9RuL2I7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F95BF8016B;
	Wed,  9 Feb 2022 16:01:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 442F6F8016A; Wed,  9 Feb 2022 16:01:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD83AF800A7
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 16:01:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD83AF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="KcC3ydTq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644418902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yOENEFAxeV6WDUDDmj8Y/MC+cvCFTJP4OBxZd3XquaY=;
 b=KcC3ydTq3PUJNVmQl9RsYrwAo5tGuN2XUGi72oz+7xxS3TENBjynt8BcTqLFLHwkVFFJNb
 XK98Vz19xm0IuFhIpqZqLN0J5oV+uPwb+8WDX9nhk20jBwRxIdwFo0AYwqihLA6VwJ3WDh
 ov9XnTKVRyFgTNLF/tYV076D/tdAshM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-k-QuHSRANjOQOp8VJo0X8g-1; Wed, 09 Feb 2022 10:01:41 -0500
X-MC-Unique: k-QuHSRANjOQOp8VJo0X8g-1
Received: by mail-qt1-f197.google.com with SMTP id
 g18-20020ac84b72000000b002cf274754c5so1886113qts.14
 for <alsa-devel@alsa-project.org>; Wed, 09 Feb 2022 07:01:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yOENEFAxeV6WDUDDmj8Y/MC+cvCFTJP4OBxZd3XquaY=;
 b=pDouXr5fC1He27+vWctUBugZFIYEBaV1oVNBi/Q0aOla4C1HfiQvcT7Sio44raTLs2
 JVw6hQsV5XH3zZVvTIHGxtWnB4Lqu2hOd35oOeMGL9D9J/JBMLS3ZcBwUiHitfTx8xwG
 Ylv+gUgQlJwHytjCveZXJtql5e/2+7REN44wxZDmVXYhY1NNN3KdDIIVJcQ6G+MAnkjz
 NluWVoEdCGQgd8kJ7fsn3xkd5FIX5lgv+QNo9ehSuUro+vTqRxWdh+G48onPFF/PPo1c
 9I4EFtH1O/xpVlZ7E1fhE/RbervQXXnwfSL8vcrTNM/D2t2VzssHMU0fLWrbgHE7yp/q
 2ccQ==
X-Gm-Message-State: AOAM533JDfLxQnMXmooP66baYKzSryAlTqm2/J48y2M0hZ91JzV5wkYd
 6BrS7DNPP9oniwUEHiKXmhEc2fkbs6FbKfUiVlCjOtuUAY+GFvU+aWWryyXxl2G3xEWmMWp1UkV
 KdcUpxa4vsu96DnsAHwxww2c=
X-Received: by 2002:a05:622a:14d2:: with SMTP id
 u18mr1562552qtx.615.1644418899279; 
 Wed, 09 Feb 2022 07:01:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcj4EjGhN8CzP3asDDyVKZTAdwOuO5eNnV9Dsmlc5T8QSbtReodIbPMN5JR/u4AgiHxsMgYg==
X-Received: by 2002:a05:622a:14d2:: with SMTP id
 u18mr1562499qtx.615.1644418898824; 
 Wed, 09 Feb 2022 07:01:38 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id g21sm9338111qtb.70.2022.02.09.07.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 07:01:37 -0800 (PST)
From: trix@redhat.com
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: cleanup double word in comment
Date: Wed,  9 Feb 2022 07:01:33 -0800
Message-Id: <20220209150133.2291856-1-trix@redhat.com>
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

Remove the second 'device'.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 include/sound/hda_verbs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/hda_verbs.h b/include/sound/hda_verbs.h
index e36b77531c5c3..006d358acce25 100644
--- a/include/sound/hda_verbs.h
+++ b/include/sound/hda_verbs.h
@@ -461,7 +461,7 @@ enum {
 #define AC_DE_ELDV			(1<<1)
 #define AC_DE_IA			(1<<2)
 
-/* device device types (0x0-0xf) */
+/* device types (0x0-0xf) */
 enum {
 	AC_JACK_LINE_OUT,
 	AC_JACK_SPEAKER,
-- 
2.26.3

