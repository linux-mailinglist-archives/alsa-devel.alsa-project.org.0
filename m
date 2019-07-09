Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8757863B53
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 20:44:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F12191665;
	Tue,  9 Jul 2019 20:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F12191665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562697875;
	bh=mzQbReO0l6syQ+0PQ7qLz6oQbOAG/TRIXretx28H4wU=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qVgzrcJXwLgaYQAifM4TBJ44/tUDdK9QF4AGtDz7Yzzya+E4BqmE30wCq991W1zo0
	 nLiu1Oc9OfWR89LA0dQ9dkaQVhcdMiPzGulVRSH6ZbrOds1qXfa0dMsEh/NiUfPTmg
	 n5kV2cd1YW3hU0dY9mePYyDBu+qS1tVT8Vz4UZuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2863DF80276;
	Tue,  9 Jul 2019 20:42:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8169BF80274; Tue,  9 Jul 2019 20:42:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77CD2F800E2
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 20:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77CD2F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kkB6qwlK"
Received: by mail-pl1-x641.google.com with SMTP id i2so10551619plt.1
 for <alsa-devel@alsa-project.org>; Tue, 09 Jul 2019 11:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=YK8HnDW92D+ZcMeXZwEcU33SpTDrdHnDF8vDLTjwf5s=;
 b=kkB6qwlK4xX9daXzHcc9L1T4Mj6a6SO0VEC7YbpN2qEwk4FwZzherF440LW3iui/mu
 +kvX9cDmbK1vGjcozntltdcAVEjFRLjTc9XBKFRe1g2OCrklnm7Tvjp8Ncui4OsyOfGM
 +QqRYrmKTK/1esiT4f/+eVsQx5PoOj5zN+LgHQZ46SFk0W8MQRLd7R+HKaSFWYGnQ722
 XqleeeB3+8k5oSkgBONyzr7wRKwcphnvvgA++3vYtbbA20mDhQ9+J4AuGDLUYthlmlbX
 Ts48nyFv+28GaPMs5J9m24qpLGdsGlmwT2f8AYaLpwm4qCL8t8qruG7yQYD2FWJMwFc4
 Rk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=YK8HnDW92D+ZcMeXZwEcU33SpTDrdHnDF8vDLTjwf5s=;
 b=SphyNB62rQ3JMxgFs6jIe4jTHHjlaH/0Si3YbD+O0RnO1JqcFZbK2WCuffpN6I93Q+
 ljibFrCRA4qqbHmg0nm1ybddFeu6GpaI0Coe5m+JPipDJvdFkski+ZcShiX/MI9dHOBO
 goBQTcHMKJNQbCrXhW/gSuxfwIFr+X+JcmPDmh2isNTCsZYwfUeWUzxyCepT/VwvTZj/
 yYVr/nvghHgUjBjnxgjqHPLtt1FAccWmvSvP9qUHu5GFIdHZe2vHGOwV/IOqNfJH2PPv
 CZXv/1nFfne5ZDXJ6OOl2kx01cQ64dvRGbfb78FdhJmEGdm/oy+nZG1ZJJf2l6W1DnsM
 HHPQ==
X-Gm-Message-State: APjAAAV4JoVX4vn1c09dlgFq9dzzz1JDsM5L3IXDFa2kohqGIocXV1/N
 v+YTE+UtJZxPnNxSjs5NGy8=
X-Google-Smtp-Source: APXvYqxpoGHClqBhZvSk6c0AeV7usiTYaC08tEej11WUV8nOUh0tPg53DkAkDAcCGle8Vk2SkZT8JA==
X-Received: by 2002:a17:902:f095:: with SMTP id
 go21mr34549642plb.58.1562697763289; 
 Tue, 09 Jul 2019 11:42:43 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id l44sm3051428pje.29.2019.07.09.11.42.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 11:42:42 -0700 (PDT)
Date: Wed, 10 Jul 2019 00:12:37 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-ID: <20190709184236.GA7873@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: [alsa-devel] [PATCH] sound: soc: bcm: cygnus-pcm: Unneeded
	variable: "ret".
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

This patch fixes below issues reported by coccicheck

sound/soc/bcm/cygnus-pcm.c:642:5-8: Unneeded variable: "ret". Return "0"
on line 650
sound/soc/bcm/cygnus-pcm.c:671:5-8: Unneeded variable: "ret". Return "0"
on line 696

We cannot change return type of these functions as they are callback
functions of snd_pcm_ops

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 sound/soc/bcm/cygnus-pcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/bcm/cygnus-pcm.c b/sound/soc/bcm/cygnus-pcm.c
index 123ecf5..8966b02 100644
--- a/sound/soc/bcm/cygnus-pcm.c
+++ b/sound/soc/bcm/cygnus-pcm.c
@@ -639,7 +639,6 @@ static int cygnus_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct cygnus_aio_port *aio;
-	int ret = 0;
 
 	aio = cygnus_dai_get_dma_data(substream);
 	dev_dbg(rtd->cpu_dai->dev, "%s  port %d\n", __func__, aio->portnum);
@@ -647,7 +646,7 @@ static int cygnus_pcm_hw_params(struct snd_pcm_substream *substream,
 	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
 	runtime->dma_bytes = params_buffer_bytes(params);
 
-	return ret;
+	return 0;
 }
 
 static int cygnus_pcm_hw_free(struct snd_pcm_substream *substream)
@@ -668,7 +667,6 @@ static int cygnus_pcm_prepare(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct cygnus_aio_port *aio;
 	unsigned long bufsize, periodsize;
-	int ret = 0;
 	bool is_play;
 	u32 start;
 	struct ringbuf_regs *p_rbuf = NULL;
@@ -693,7 +691,7 @@ static int cygnus_pcm_prepare(struct snd_pcm_substream *substream)
 	ringbuf_set_initial(aio->cygaud->audio, p_rbuf, is_play, start,
 				periodsize, bufsize);
 
-	return ret;
+	return 0;
 }
 
 static snd_pcm_uframes_t cygnus_pcm_pointer(struct snd_pcm_substream *substream)
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
