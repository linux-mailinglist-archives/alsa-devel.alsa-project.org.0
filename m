Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A06699682
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 15:00:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACDAEEA1;
	Thu, 16 Feb 2023 14:59:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACDAEEA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676556031;
	bh=0JztOxvWSCiaB+sFFIIzyvw66U2GE3J2wqP5jkNRols=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RaekixPospwfmkL9EbkN3pFY6dvad+RMvAQ9QZo7iPhr1x/3jwQFhTm3EsCkeLZkD
	 dtpXcdZJuZpu6FfL5jVKFKfjqYdRNhdoRYzRQzdGAA8MKWgEJLobqQvymEBTFc9ppF
	 M35F7cke1mFc8xIvELYVd7aXE2JTNkHYX1rgRw5I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F035F800E4;
	Thu, 16 Feb 2023 14:59:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DA7DF801C0; Thu, 16 Feb 2023 14:59:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56FCBF800E3
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 14:59:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56FCBF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Cu5h0JEW
Received: by mail-wm1-x32c.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so4288834wms.0
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Feb 2023 05:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wptKg8ei4rb26lOj2FWnUT5QGC63y861aTdm4Jmh/so=;
        b=Cu5h0JEWFNUZYLCe+OM65B9wh7Gso2ULkOBoxuVk4qlDwa00JTFoc2IaYja6zTwn7k
         z472ONmp4m4Y114GIbXhpGuJFF95ceTzoHDK2gBWUtC1ZWi6d2Y+6MUHFAZORfahZqlu
         mgpkngOE+bF+GOnMslJbv1AMCKBKiQttvCsePeLie4fcuVNQtYtXqNFqVy4p6tSRZLJk
         bYk1w9n1JmQOSQcjTCLkFNcCjLPD9fsw4KfZSAJCtmAXocHF6vaH45E/oxxTfgK/Ccib
         QIY4Z7aQm2YLu+f9ni+4F9xkiOZ+nwupu2Xa/USXMIxmhVpxTG+qfp9OwYdDPEiXN7mQ
         5ZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wptKg8ei4rb26lOj2FWnUT5QGC63y861aTdm4Jmh/so=;
        b=e2g5pJZCptNlnDW6qvfN3cNDZWhxEeiI+Z3uxR4KdBz6NwCofUbyTi4qaEGiocgNHb
         JpWnBk3uU8ogbD2hBA/8rg8rYvn9EuwCi5iXkvwCSA4doZA2OYOXxrkOTNgfz+maLfiU
         QloAxMO+hiSMBtnT51E3hAiNTBzVq4jfdCg392jz2Fw3+/YLtFg+YhBCAyCzPj1IcqZL
         bM1hzfgbc7mXEdfI/QSaz18XpXwevgCDpy3Rybi39QYms5OIkibC6hDfPL2/HDKq4xct
         mt7m8pRUD5nWO/c8D2MbJ6HTBjxQQpWv+xer/wfg6mQ4V1bTb9369HTmKLRcOAFlUxj1
         0bbA==
X-Gm-Message-State: AO0yUKW29T0rBoQeJkUTmV4zdC5xnKKElgbrEXnDYTH5JuGRd7GQ7bOG
	eCNuLvWO5x+fXZ/QW4ez5TRGiQWS55c=
X-Google-Smtp-Source: 
 AK7set9O/bjqrUZfCZ2l+PbFTcf1WFfgVXhqc+t++r+35+bxqP5mugvgmtJAXhlxxHVO6Vl2Qioqqw==
X-Received: by 2002:a05:600c:1c1c:b0:3e0:e77:3056 with SMTP id
 j28-20020a05600c1c1c00b003e00e773056mr5013586wms.30.1676555974582;
        Thu, 16 Feb 2023 05:59:34 -0800 (PST)
Received: from localhost.localdomain (awyoung.plus.com. [81.174.138.22])
        by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c4f8e00b003dc4480df80sm6137498wmq.34.2023.02.16.05.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 05:59:34 -0800 (PST)
From: Alan Young <consult.awy@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: pcm: generate default audio timestamp
Date: Thu, 16 Feb 2023 13:59:28 +0000
Message-Id: <20230216135928.1974403-1-consult.awy@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2PHSFBTLURCDKYWHQHICZEEHX7WAM3U3
X-Message-ID-Hash: 2PHSFBTLURCDKYWHQHICZEEHX7WAM3U3
X-MailFrom: consult.awy@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: pierre-louis.bossart@linux.intel.com, Alan Young <consult.awy@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2PHSFBTLURCDKYWHQHICZEEHX7WAM3U3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If there is no get_time_info() available or the requested audio
timestamp type is AUDIO_TSTAMP_TYPE_DEFAULT then need to set
audio_tstamp_report.actual_type = AUDIO_TSTAMP_TYPE_DEFAULT (in the
else clause near the start of snd_pcm_update_hw_ptr0()) in order for
update_audio_tstamp() to generate the audio timestamp from the number
of frames.

Fixes: 3179f6200188 ("ALSA: core: add .get_time_info")
Signed-off-by: consult.awy@gmail.com
---
 sound/core/pcm_lib.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 8b6aeb8a78f7..943f5396fc60 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -289,8 +289,10 @@ static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
 			/* re-test in case tstamp type is not supported in hardware and was demoted to DEFAULT */
 			if (runtime->audio_tstamp_report.actual_type == SNDRV_PCM_AUDIO_TSTAMP_TYPE_DEFAULT)
 				snd_pcm_gettime(runtime, &curr_tstamp);
-		} else
+		} else {
+			runtime->audio_tstamp_report.actual_type = SNDRV_PCM_AUDIO_TSTAMP_TYPE_DEFAULT;
 			snd_pcm_gettime(runtime, &curr_tstamp);
+		}
 	}
 
 	if (pos == SNDRV_PCM_POS_XRUN) {
-- 
2.31.1

