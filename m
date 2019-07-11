Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F63665E6C
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2019 19:23:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BB59167F;
	Thu, 11 Jul 2019 19:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BB59167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562865788;
	bh=4GiEqxh8/DDfj1yshxzvuNWqOPctsXewySqH2mAa8fM=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aR56HHXl/wE2Gx1IldGZgb7AdgP3LvsComn58eg9q9P0znyYD3lT2kgL2nGjv5ifb
	 USphZCbuEWJko0hOBWuGrLcy+kAxX27dFvdGGitbqXODmoFyz8y1Q4Fr8Ju/UgiZtn
	 W7KPcxrP+7H1fSvl7PAZMTp043PN3zCct7zLBShw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B0F9F800D8;
	Thu, 11 Jul 2019 19:21:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69B3AF802FB; Thu, 11 Jul 2019 19:21:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 968E7F800D8
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 19:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 968E7F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Lh8bol5u"
Received: by mail-pg1-x542.google.com with SMTP id o13so3243250pgp.12
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 10:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=gqIivKQ4VDY/9EJ1sbwK6dLkOFlogSrMQDe9qqiMbzY=;
 b=Lh8bol5uLGKKTqXXXFbj8SySQvu9msm/TdCvjInq2ukTZqn6RGBCUjha/KUKBRGYls
 i6SPZzkfh3QlXjGM0stTHbhpmRbzZER0lgqUd2/c16m4cGpkJDH8aZls4CblfcQNcXzG
 LoAiNF1DZghDcr/hRzM1aXcAOXsDbHLwJ0H2MlDszfsXcsSXuBtuiGmjo+ACIZWElKGK
 uskBrAlSsozclJqt6ZBMxoTN6wj6b5i0KlZdmNhijH4wNwZ2f4M4AgYvXPm04CpnFx4n
 N65rrYxLXmfYOuHKxqWNXdOZDLT7sirf+iqxG8GfYZPC5lnvawYThxUaZxagNvqFOAjb
 ya0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=gqIivKQ4VDY/9EJ1sbwK6dLkOFlogSrMQDe9qqiMbzY=;
 b=mGeV7Y514iUuf1cgkrkLyp8uuMChe4mXLGK7FRXuVouY+/iPMPXSbsIscYLdykCMAG
 uWj7mSWnRTYUToen+EXIt7/UpHbcCSvgeA4BFAEDQF3LlHFm5l+ZM8NWXqK38NI+GBIp
 ogHGnJlqYRPs3ATnliTuhKeabU2SozuVl1XKAT2lk5F1EuaLRDFA/MiE6PnO4kKdJ6Mq
 mZwFS6yWZy/4oEOz7RJQoTEw3DBVxDQdz9mI+MGrOgHTwtV/7zUTLhTZUDLuDZ3FKU7G
 h3v72PwSpK0xPSZbXUUfbLXlmqMOySvRy3bTnwUKDUH0Av0KfRVu/7MJsABvwToHgTfU
 xE6Q==
X-Gm-Message-State: APjAAAXsYpwmnTD2KQgPbNVq9pxRgYxQ7wJJyANtHOH+DIXzYJUfFtY8
 8htw5oMJ1D1tkSmcu9IoD+0=
X-Google-Smtp-Source: APXvYqzPcdiAOvWKSNm+hzapTSSmXf8/fGwVdxN3iKtzUnxAXQ7T2pQR9v94JJeawAjbMGky8hIJ4A==
X-Received: by 2002:a17:90a:db08:: with SMTP id
 g8mr5893223pjv.39.1562865673539; 
 Thu, 11 Jul 2019 10:21:13 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id t7sm5111414pjq.15.2019.07.11.10.21.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 10:21:13 -0700 (PDT)
Date: Thu, 11 Jul 2019 22:51:07 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Richard Fontana <rfontana@redhat.com>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Message-ID: <20190711172107.GA5008@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: [alsa-devel] [PATCH] sound: pci: rme9652: Unneeded variable:
	"result".
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

This patch fixes below issue reported by coccicheck

sound/pci/rme9652/rme9652.c:2161:5-11: Unneeded variable: "result".
Return "0" on line 2167

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 sound/pci/rme9652/rme9652.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index cb9818a..4c851f8 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -2158,13 +2158,12 @@ static int snd_rme9652_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_rme9652 *rme9652 = snd_pcm_substream_chip(substream);
 	unsigned long flags;
-	int result = 0;
 
 	spin_lock_irqsave(&rme9652->lock, flags);
 	if (!rme9652->running)
 		rme9652_reset_hw_pointer(rme9652);
 	spin_unlock_irqrestore(&rme9652->lock, flags);
-	return result;
+	return 0;
 }
 
 static const struct snd_pcm_hardware snd_rme9652_playback_subinfo =
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
