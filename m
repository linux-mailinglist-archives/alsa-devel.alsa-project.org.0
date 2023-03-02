Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D336ACAE2
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 18:42:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A8AC113E;
	Mon,  6 Mar 2023 18:41:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A8AC113E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678124551;
	bh=hVSZ7TZV9j07UUEXugjz8Nnuv57Lf1+ydImUlFvnZ08=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WCIlM2Q3P5MEYinXdfXozdrtknwCoKdw6huaB9wWCiL2jC2BwRy4GW3Xhp4rIaDc6
	 lAmpGo4elLQMbmkz3hXidXVIrl7yzcKOXE/jxk3qyaM2jDDXlKgxVQNuIb8WidKXnW
	 Zby9Lr7eTNNXXpKOqTLf5a7un10Btr4JfSFpaVWY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AABC9F8057F;
	Mon,  6 Mar 2023 18:39:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC872F80266; Thu,  2 Mar 2023 17:37:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C800F800C9
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 17:37:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C800F800C9
Received: by mail-ed1-x52e.google.com with SMTP id cw28so20809152edb.5
        for <alsa-devel@alsa-project.org>;
 Thu, 02 Mar 2023 08:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tfY1Ul1QnfuQtui+4Ej95F51iCd9NVPI2d94LXtRwmo=;
        b=bDoI/39/km5XuwmNOoWn9p3W5zwRXDGImrlqwgWO1zuWUu1uLGMwSch+pf0z7lOVEk
         73JivL/5QyrKUaadxgCH/zBN/F+kuk2N5+pmDTVCqty5ou9Lp5ebIvJuY0sM6+2Ye5lX
         Ct4Fw8SaWySke/s2OpZJIlJv6gBiooF1l0PkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfY1Ul1QnfuQtui+4Ej95F51iCd9NVPI2d94LXtRwmo=;
        b=A+EDAi2y8fZ8wS5aSbounWsPjLXBUPN/QGiDSvAQXDus5NmDUniv6tr0E0nE5isf/E
         2eFERajXBoPw04h5tB3Hxz2atG9jjblooD/gqtKCQ3OJpBikYrPDn/SK7J2vMaJlDQCO
         VOOZYE4TY/zn9tjFyEoZRl8jaI+xHFnLuU+nRX5a8fFXr5X9D5HSzX9txZi5cMBDWxv9
         vMeTKcphgWLt10VT2KdeIQkYhuYGHZN/lyQGdkKMQVU0VbqzjKgw9YQFZ9loeLQsf02d
         oaHx37trbNbh9jJI0pmS2geZdM8E3Fq4j36pg+R8d7CMb+Cn8H2WWxxZR1CwxFXtjOb/
         Frlg==
X-Gm-Message-State: AO0yUKXvHHOhIKxgIGvHX8pdcv4xC2cyebwYq1na1k5F9tFOpkSWG84t
	/4Y1AEzyUbbAbZWiTPCqSC/r2A==
X-Google-Smtp-Source: 
 AK7set9auJrOCtINNaTDbetFrZVlHmp0QiBEME8aEHEdjzC6Rn02Ru1UVtQvJaLObY5/foEdxrwdfw==
X-Received: by 2002:a17:906:6543:b0:8a9:e031:c4ae with SMTP id
 u3-20020a170906654300b008a9e031c4aemr10818449ejn.2.1677775047510;
        Thu, 02 Mar 2023 08:37:27 -0800 (PST)
Received: from localhost.localdomain (80.71.142.18.ipv4.parknet.dk.
 [80.71.142.18])
        by smtp.gmail.com with ESMTPSA id
 os6-20020a170906af6600b008f7f6943d1dsm7173547ejb.42.2023.03.02.08.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 08:37:27 -0800 (PST)
From: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yadi Brar <yadi.brar01@gmail.com>,
	Jassi Brar <jaswinder.singh@linaro.org>,
	Felipe Balbi <balbi@ti.com>
Subject: [PATCH] usb: gadget: u_audio: don't let userspace block driver unbind
Date: Thu,  2 Mar 2023 17:36:47 +0100
Message-Id: <20230302163648.3349669-1-alvin@pqrs.dk>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: alvin@pqrs.dk
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: P6EYN2I5KH77K7HT7LE7DQHESKKL7KKB
X-Message-ID-Hash: P6EYN2I5KH77K7HT7LE7DQHESKKL7KKB
X-Mailman-Approved-At: Mon, 06 Mar 2023 17:39:00 +0000
CC: alsa-devel@alsa-project.org,
 =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 stable@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Alvin Šipraga <alsi@bang-olufsen.dk>

In the unbind callback for f_uac1 and f_uac2, a call to snd_card_free()
via g_audio_cleanup() will disconnect the card and then wait for all
resources to be released, which happens when the refcount falls to zero.
Since userspace can keep the refcount incremented by not closing the
relevant file descriptor, the call to unbind may block indefinitely.
This can cause a deadlock during reboot, as evidenced by the following
blocked task observed on my machine:

  task:reboot  state:D stack:0   pid:2827  ppid:569    flags:0x0000000c
  Call trace:
   __switch_to+0xc8/0x140
   __schedule+0x2f0/0x7c0
   schedule+0x60/0xd0
   schedule_timeout+0x180/0x1d4
   wait_for_completion+0x78/0x180
   snd_card_free+0x90/0xa0
   g_audio_cleanup+0x2c/0x64
   afunc_unbind+0x28/0x60
   ...
   kernel_restart+0x4c/0xac
   __do_sys_reboot+0xcc/0x1ec
   __arm64_sys_reboot+0x28/0x30
   invoke_syscall+0x4c/0x110
   ...

The issue can also be observed by opening the card with arecord and
then stopping the process through the shell before unbinding:

  # arecord -D hw:UAC2Gadget -f S32_LE -c 2 -r 48000 /dev/null
  Recording WAVE '/dev/null' : Signed 32 bit Little Endian, Rate 48000 Hz, Stereo
  ^Z[1]+  Stopped                    arecord -D hw:UAC2Gadget -f S32_LE -c 2 -r 48000 /dev/null
  # echo gadget.0 > /sys/bus/gadget/drivers/configfs-gadget/unbind
  (observe that the unbind command never finishes)

Fix the problem by using snd_card_free_when_closed() instead, which will
still disconnect the card as desired, but defer the task of freeing the
resources to the core once userspace closes its file descriptor.

Fixes: 132fcb460839 ("usb: gadget: Add Audio Class 2.0 Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 drivers/usb/gadget/function/u_audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index c1f62e91b012..4a42574b4a7f 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -1422,7 +1422,7 @@ void g_audio_cleanup(struct g_audio *g_audio)
 	uac = g_audio->uac;
 	card = uac->card;
 	if (card)
-		snd_card_free(card);
+		snd_card_free_when_closed(card);
 
 	kfree(uac->p_prm.reqs);
 	kfree(uac->c_prm.reqs);
-- 
2.39.1

