Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 195BE1ADB39
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 12:36:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9182E1660;
	Fri, 17 Apr 2020 12:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9182E1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587119785;
	bh=+uqa7yAtXi/+rIDSBhh5pMKJH3uMCkkO+UveKyfgaHI=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XnRYS6A3pQ+DJ3Vv4hBR+eQvT6e9BKPBia6SED4kGGqixQghHZ5+HfvuqselQ0PkS
	 wPzxtefV5Tue02AFJeocWAkJOMhi9qXkzZ6A8+OeFRm6VmAJhKjrO+7Iqlf8yA9EWb
	 4qEg89p/ovPPZpD4Cm3PdvAfEQT0NfqMossR5Psg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8A5BF800AB;
	Fri, 17 Apr 2020 12:34:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 904D7F80245; Fri, 17 Apr 2020 12:34:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 626DCF8012E
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 12:34:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 626DCF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=flowbird.group header.i=@flowbird.group
 header.b="DQ7mhfaz"
Received: by mail-wr1-x444.google.com with SMTP id b11so2469054wrs.6
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 03:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flowbird.group; s=google;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=wbl0aeufa/22z2eeBbL/aAsKWxbJHUBJwEkTChBqoAQ=;
 b=DQ7mhfazBsBQ+ES59fgYlEVbYgOFJDUz1grN966rtthpXdE37315Z7k5F6y5Qh9Kld
 ca2tKRYtiHLEuJmoG6hGgWNx3zSICRTcWkETdYVHe1HSmdR7BEG++jgClo2rPj+9Idzz
 2TSbG6TTIlIbAQ9Uv5jEf/Izi83bqKe7icAPQnReB8pruqLDyoDDor6sQk+Ut0Ql+TGB
 BPE0skncSZ1itzyIve7av2UyKtlOUEyBq8lkUbgpGbOwZrr+PHyC5noXDKaufMgRteLu
 H2dCNCJWlOM0+zzOjyO4vvjuXIxMYAzYWin7guLEMWpBEkRNGzQl5a32Es+GoCqlIUwl
 WBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=wbl0aeufa/22z2eeBbL/aAsKWxbJHUBJwEkTChBqoAQ=;
 b=idNf9y3BAsfp0TnzH9lWpVkUAazmfsZKuD/j2sK0rIFJttSrhureoddC8p33bRWJLr
 +ekIvVsB8uizm/kv2J2B0lVZUusyxABZZ5BVNlm+B9+rMqFqB4VODAPucu54j04iYStR
 mjRp7kKNO/ykQxxWJIiTkGKUjZkgStQgFBMarLG+Kt12LR1vtriilX3xjh4XBiQXlNPu
 jVTaiSxcUdTYldgv9dWYj/e7aOOreGcRqb63Ralv/XO++iBCZIrc0UTwyEPv5Q0cvy5H
 oOv6jR1j2r2qXMsjfc1epXdc0wFwt5W/xo8FHDASWeDBDZLbtJeCLQXGG2q5w4i2wYf8
 gh2g==
X-Gm-Message-State: AGi0Puan2C1ZJz1Pnb9BIU2mBYqOGAxaiFy6I9ayAdnULq1z2szIIyE3
 mBJqMyMHJbdZ16hhx31m/sV97g==
X-Google-Smtp-Source: APiQypJU4mSnTwvo6lfnqIOp31wU50jv2d7MU895Khl/UloSf9oxo+OQ/S3ELnytF3z8glmdHjAGZA==
X-Received: by 2002:adf:f450:: with SMTP id f16mr3183676wrp.346.1587119676323; 
 Fri, 17 Apr 2020 03:34:36 -0700 (PDT)
Received: from [192.168.0.26] ([88.125.5.131])
 by smtp.gmail.com with ESMTPSA id f8sm8783057wrm.14.2020.04.17.03.34.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Apr 2020 03:34:35 -0700 (PDT)
To: alsa-devel@alsa-project.org, dmaengine@vger.kernel.org
From: Martin Fuzzey <martin.fuzzey@flowbird.group>
Subject: alsa / dma: Sound stops playing after xrun
Message-ID: <49b8b57c-4e69-6e9e-9bb5-a2ef2df2f258@flowbird.group>
Date: Fri, 17 Apr 2020 12:34:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr
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

Hi all,

I am seeing a sound problem leading to no more sound after an XRUN .
I see more or less what is happening and have a work around but am not
entirely sure of the correct solution.

The problem occurs on an i.MX6DL using mainline kernel 5.4 with the
fsl_ssi driver and a SGTL5000 audio codec connected over I2S.
The userspace is Android 8 using tinnyhal + tinyalsa.
This uses ioctl to push samples rather than mmap.

The scenario is:
1) A buffer underrun occurs, causing -EPIPE to be returned to userspace.
2) Userpsapce (the tinyalsa component) does a pcm_prepare() to recover 
(which
completes OK).
3) Userspace starts sending data again and then, when the start threshold
is exceeded this kernel log is generated

     fsl-ssi-dai 2028000.ssi: Timeout waiting TX FIFO filling

4) From this point on no more sound is played, further writes timeout
after 10s and return -EIO.

My analsysis is as follows:

When the underrun occurs snd_dmaengine_pcm_trigger(SNDRV_PCM_TRIGGER_STOP)
is performed which does
     dmaengine_terminate_async()

When the stream is restarted 
snd_dmaengine_pcm_trigger(SNDRV_PCM_TRIGGER_START
does
     dmaengine_submit()
     dma_async_issue_pending()

Because dmaengine_terminate_async() is asynchronus it sometimes completes
after the dmaengine_submit(), causing the new DMA request to be cancelled
before it has started.

This results in the "Timeout waiting TX FIFO filling" message (in 
fsl_ssi_config_enable())
because it enables the SSI and expects data to be transfered to the FIFO by
DMA.

The message is only a warning, (void function with no error return)
So without DMA running the buffer quicky fills up, resulting in all future
writes timeouting waiting for buffer space.

Where I'm not sure is if this is an ALSA bug or a bug in the i.MX6 SDMA
controller driver. IE is it OK to do dmaengine_terminate_async() and later
dmaengine_submit() on the same DMA channel without waiting for the
terminate to complete?

My workaround is to wait for the terminate to complete before returning
-EPIPE (just after releasing the lock which prevents sleeping earlier).

Ie this:

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 2236b5e..b03dac3 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -18,6 +18,9 @@
  #include <sound/pcm_params.h>
  #include <sound/timer.h>

+#include <linux/dmaengine.h>
+#include <sound/dmaengine_pcm.h>
+
  #include "pcm_local.h"

  #ifdef CONFIG_SND_PCM_XRUN_DEBUG
@@ -2239,6 +2242,10 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct 
snd_pcm_substream *substream,
                 }
         }
   _end_unlock:
+    /* MF: Workaround for broken sound after XRUN. */
+    if (err == -EPIPE)
+ dmaengine_synchronize(snd_dmaengine_pcm_get_chan(substream));
+
     runtime->twake = 0;
     if (xfer > 0 && err >= 0)
         snd_pcm_update_state(substream, runtime);


Regards,


Martin


