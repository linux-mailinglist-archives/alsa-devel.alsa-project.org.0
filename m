Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ABD63F6A
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 04:41:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8725E1670;
	Wed, 10 Jul 2019 04:40:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8725E1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562726503;
	bh=qBO0DKmTEnlGOjrF6szV7Qo1D/bs2mtC0NS2vgJmVyA=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pfCRBdHmJjJwpALUtq9I7sf2S39SaH+69v0hRbv+/XH3F8RoBa4QGlyXk5hGPWPSL
	 AHOFywjqrlDp1qP+hDjXbh1z9XGsfp85xVZg5LEmlQCDhnf/MUhBmYIRStQsypWTVG
	 UDVo1cc8I8oVs9Av7ip24QGY1fl9HtqoemmWc7OA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ED87F802A1;
	Wed, 10 Jul 2019 04:39:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4F6BF802A1; Wed, 10 Jul 2019 04:39:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F0B2F800E2
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 04:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F0B2F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hUE1adA9"
Received: by mail-pg1-x543.google.com with SMTP id l21so434826pgm.3
 for <alsa-devel@alsa-project.org>; Tue, 09 Jul 2019 19:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=eYXNQQatx5CsTvcWnAhx8hozPNi1nTqqLqSrJNAWy6w=;
 b=hUE1adA9ehAy7iETpmQ8DNp3I53GbtbDOpYXs19uYfbIeOI7Jh7sZe4hHXjymkDZQs
 hZ7qW12GR1twmIEm7NT3T5lAYCepIFPOe6U95PJ+OlUGT2SUkGj3GnbMI7Cbgo5ITSd9
 J0D//1L6lMdg0qoHBdNNCnVl7GJ4obVkGLHFIVI2XXykumF67E0odyhvCX+38mqcfvwT
 mtJkBJQcqD3C+B+RGOfaCary++05pvc1tRN4x21wktTQT+JvgntqaPM+0E/XZC9ib5MR
 HKo0gX0SrwvcuRgRss3BufISgUN28PS40ArtDEVC4WqOk5GlvdO7pwf/Gv1A5Dsam3yh
 c7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=eYXNQQatx5CsTvcWnAhx8hozPNi1nTqqLqSrJNAWy6w=;
 b=HFBVhZDktT/mnmad9hjNBkXkd1bQebfA5x0rp7HtqeYjdvMnRlVo4EEwgeUFD6JbVZ
 5/UVjn2Bz6omZVepUWHmvurUEabfxtcLDb4VuF/0Er64F2ktfHGKhPXBggxemtoZobGe
 svCwJ7WI1n+ygMZclBy7zMf8JzjbMiOZxe91XJVy1boQnYnCF6TvLjsjOp2sZTyt4Twc
 YYFtfQr+SSG+8z5yHbc0aaAnl6C0DLAX4IWbmolbIjk7/WC9DZc2hg3ENSUuLAMTmT8g
 SmI8kx9uGRiKFbAEnAOfT2peRwFvFja+5ckqHM+rqnRBgVQNkz4PBl69LVa4y9QRCh/I
 IVQw==
X-Gm-Message-State: APjAAAUU8Mg3EfnTTAVRnny4LnULquju8PmDgb33Sd50Le2aImy64BS4
 RgOe1EMwRX6BgCNg3DWStSU=
X-Google-Smtp-Source: APXvYqzV4cvph+x4iw9QnWrbLU+PYZ7pHPVu5gaXf5zLuHL5eAGc0SdNKwVpnfRK/oSfv6jyQqrQ8A==
X-Received: by 2002:a17:90a:fa07:: with SMTP id
 cm7mr3831866pjb.115.1562726392001; 
 Tue, 09 Jul 2019 19:39:52 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id x12sm360063pgj.79.2019.07.09.19.39.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 19:39:51 -0700 (PDT)
Date: Wed, 10 Jul 2019 08:09:46 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Geoff Levand <geoff@infradead.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Message-ID: <20190710023946.GA15604@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: [alsa-devel] [PATCH] sound: ppc: snd_ps3: Remove Unneeded variable:
	"ret"
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
sound/ppc/snd_ps3.c:631:5-8: Unneeded variable: "ret". Return "0" on
line 668

We cannot change return type of snd_ps3_pcm_trigger as it is registered
with snd_pcm_ops->trigger

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 sound/ppc/snd_ps3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/ppc/snd_ps3.c b/sound/ppc/snd_ps3.c
index 71b7fd3..c213eb7 100644
--- a/sound/ppc/snd_ps3.c
+++ b/sound/ppc/snd_ps3.c
@@ -628,7 +628,6 @@ static int snd_ps3_pcm_trigger(struct snd_pcm_substream *substream,
 			       int cmd)
 {
 	struct snd_ps3_card_info *card = snd_pcm_substream_chip(substream);
-	int ret = 0;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -665,7 +664,7 @@ static int snd_ps3_pcm_trigger(struct snd_pcm_substream *substream,
 
 	}
 
-	return ret;
+	return 0;
 };
 
 /*
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
