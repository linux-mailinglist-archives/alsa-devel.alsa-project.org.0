Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0609C15B9A4
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 07:37:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66A081688;
	Thu, 13 Feb 2020 07:37:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66A081688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581575877;
	bh=I45KEfP+DoxjRLgCovCDSp+XOKQ3I8bi8BYGibIbUH8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KNpwOePzRXxmgldZsJP2OQTkpsOhR+tYAUxBppCdR1lDw9z0pCOOdmHT0YQqsMA1w
	 kTPaBM7+Tkc9HNLcIgKr87OzSrbgeT4UlRJF6VcN0cKZ23T0Ikh4B1nEaAEN0a68wb
	 naYibGUyUzIZGWELi0lcJyqf/MhdwbY8qtVCZkus=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25BE1F80138;
	Thu, 13 Feb 2020 07:36:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B401F8013E; Tue, 11 Feb 2020 17:22:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9A87F800E7
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 17:22:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9A87F800E7
Received: by mail-qt1-f193.google.com with SMTP id d5so8380035qto.0
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 08:22:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8vKDSqnHXMxM6UbZpMgqezFGV7iFRtf6ymNXpe/ujkk=;
 b=GXSbm+/AHxRK7NDKwkAIDxu9zsXOaAamx0kGRrx5N3rHH3hxMXeEFJBEAlRqIId623
 syLd23ySnmAcpO3COumjwF6iG1ckiSLYuj329WCVFW+pAO6DHQDN7jhmGDQUF9d0t2Dx
 kN/3MnhxCZkeQseoYhoswlStObKm8CLMK9z6ShrO3zlsX6etAripzKPhyfW4nG/ICXmY
 xGtcWD+yHw/70DIemkL+SOKl6pCffKAN8OCdslDBGOGacqbIpF1I4bIqhYAaqgnKUJC4
 2caiMlYHsiAbhVCFWfIXWJ4wRF7nuMSCBYJNea1I75gwOeqS47MzYMSsxBpKPJrAtJVc
 ziYQ==
X-Gm-Message-State: APjAAAUf9VFtMHuDGASFsYT/maNiKo1HMBUZdElJHugKNvFXo/uwfS4T
 JQhB43Q4rjo5ztomQ8ST9Bc=
X-Google-Smtp-Source: APXvYqwwPXIFhlNKe/TmTl7Jr5C5T5vcDNDRHUN6KwtQ8wLSYF8MesauojL3eZcGJXM+s29O2pi9lw==
X-Received: by 2002:aed:38c2:: with SMTP id k60mr3178211qte.375.1581438156499; 
 Tue, 11 Feb 2020 08:22:36 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
 by smtp.gmail.com with ESMTPSA id v10sm2312403qtq.58.2020.02.11.08.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 08:22:36 -0800 (PST)
From: Arvind Sankar <nivedita@alum.mit.edu>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Date: Tue, 11 Feb 2020 11:22:35 -0500
Message-Id: <20200211162235.1639889-1-nivedita@alum.mit.edu>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Feb 2020 07:36:42 +0100
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: Apply sample rate quirk for
	Audioengine D1
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

The Audioengine D1 (0x2912:0x30c8) does support reading the sample rate,
but it returns the rate in byte-reversed order.

When setting sampling rate, the driver produces these warning messages:
[168840.944226] usb 3-2.2: current rate 4500480 is different from the runtime rate 44100
[168854.930414] usb 3-2.2: current rate 8436480 is different from the runtime rate 48000
[168905.185825] usb 3-2.1.2: current rate 30465 is different from the runtime rate 96000

As can be seen from the hexadecimal conversion, the current rate read
back is byte-reversed from the rate that was set.

44100 == 0x00ac44, 4500480 == 0x44ac00
48000 == 0x00bb80, 8436480 == 0x80bb00
96000 == 0x017700,   30465 == 0x007701

Rather than implementing a new quirk to reverse the order, just skip
checking the rate to avoid spamming the log.

Signed-off-by: Arvind Sankar <nivedita@alum.mit.edu>
---
 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 3a5242e383b2..7f558f4b4520 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1440,6 +1440,7 @@ bool snd_usb_get_sample_rate_quirk(struct snd_usb_audio *chip)
 	case USB_ID(0x1395, 0x740a): /* Sennheiser DECT */
 	case USB_ID(0x1901, 0x0191): /* GE B850V3 CP2114 audio interface */
 	case USB_ID(0x21b4, 0x0081): /* AudioQuest DragonFly */
+	case USB_ID(0x2912, 0x30c8): /* Audioengine D1 */
 		return true;
 	}
 
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
