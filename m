Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9639335A9FB
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 03:42:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 285361658;
	Sat, 10 Apr 2021 03:41:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 285361658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618018930;
	bh=WiXcezfHCR7omAbspri/sOpQyjoXiVu9cN3mrVap358=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EEHV8UHUu58GNfNvX3yYi4nzowhVTZpUDK5s730UEVFwZxsrVVHH2dC5xHUeyRinr
	 WPp47O6vsRFhyRk9qb/hAIB+DmdEZoYp542AwVhpJdcX9ZDWqFponkMtOR2e1PPGvF
	 XiHLjkzv1eoWJKXh16ohImShEEkbFJpsIo2ws1Zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F1F0F80113;
	Sat, 10 Apr 2021 03:40:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9457BF8020B; Sat, 10 Apr 2021 03:40:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1188F800BC
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 03:40:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1188F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="l+Z5HMw3"
Received: by mail-qt1-x82e.google.com with SMTP id g24so5707874qts.6
 for <alsa-devel@alsa-project.org>; Fri, 09 Apr 2021 18:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=zcGMAvRw4WH/Cre5jygYUNvb4AB3/qIKN4yL38tZsDY=;
 b=l+Z5HMw3iZmshTh4GkLpdn+VUXd2FS2lxyihcZDhVX4qCT7+AO94hkyipWQbiD4yv2
 1CG4Gf4ltfmWNOTZc5Jd4FlYAAsKPuhCKRA0mvZJ2qPTb6hD1Den3dw64h+Fdhs196uI
 Spi4oEoypE4kjRQryHCVvUMxTtcfkMqB/gYgAZDr1M/OozxPf8ZYOt+spwkrRaIn/b/v
 2nejMqnygt1z8PxPuNY2+7gfCVBsmzON26q3RbjUALO7BbYX/N0yT2G2cWdnVOGdEPWF
 bh1YgQQMQ0o94s3Lgoo8ho4UC/5GJHPPOlzyKhHHVURjxkswdOfxW7K6D+Q9vXCJ2raV
 hquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zcGMAvRw4WH/Cre5jygYUNvb4AB3/qIKN4yL38tZsDY=;
 b=AofND10dv585f06tH4661g3QXWhsG0/bgdLXs7IaLmDdUWxiUgIbihxNDmlR9mUT0k
 /RWXIBnxleA6W5wIx9dS41Ruxn5Lh9P9Y/Whe9WS2cbPIl9JvX1eiBzGO4CQD1SgK1aO
 nPQ7VLyU0dPfnnIU19nyOvqVCqtPQpGL8CmvTuviKccJxKgHub7Aoz3JapJcmPQYeNji
 9pHalw5yn+MPa1zgREr7pLtBJoR1ma2olnoFwFOpXOUDg2vj4fH5tM3gVDqA5ND2gRqZ
 kjRD/dlqGUGYDjqQ1psnkc2pM0GpP4NWwEuB41OJMQBlyE7wH2hFcA5A16mfX57TyjU3
 cPZA==
X-Gm-Message-State: AOAM530kBBUZVzeRz6jQmn6L935XDBT1ZGID0iAdHM975VyPDSyWzcvX
 JiiCYf9okjRIqdnS4zMmafyOZFGSEJamvgMUwA5i2kdKJys=
X-Google-Smtp-Source: ABdhPJz0qGZ3Azwjt0o8iWhsLey/2ym5GE94/sCol1yO7SJpnRc5jNn6QdAq7hHy9bE+JApUXFj5Jb+ArAUPPQw76TU=
X-Received: by 2002:a05:622a:1041:: with SMTP id
 f1mr9588030qte.210.1618018828224; 
 Fri, 09 Apr 2021 18:40:28 -0700 (PDT)
MIME-Version: 1.0
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Fri, 9 Apr 2021 22:36:14 -0300
Message-ID: <CAEsQvcvF7LnO8PxyyCxuRCx=7jNeSCvFAd-+dE0g_rd1rOxxdw@mail.gmail.com>
Subject: [PATCH v2] Behringer UFX1604 / UFX1204: get rid of unneeded implicit
 feedback and pops and clicks while on 96000hz
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
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

More complete patch disabling unneeded implicit feedback and setting
clock selector to default clock on rate change for UFX1604

After re-reading https://bugzilla.kernel.org/show_bug.cgi?id=199327 it
is even more clear to me that implicit feedback for the
UFX1604/UFX1204 needs to be disabled.

This is a more complete patch that disables that and for the UFX1604
only sets the clock selector to its pin 1 default clock synced to the
USB SOF upon rate change. This is needed because apparently the
endpoints are hardwired to the clock selector and after we change the
rate on the main USB SOF synced clock the clock selector is left in a
halfway state in regards to the sampling rate.

That's why the pops and clicks aren't evident at stock 48000Hz, become
slightly audible at 44100Hz and detestable at 96000Hz. Seems the clock
selector needs a nudge or it will screw up the sync.

Unfortunately I don't have access to the lsusb -v of the UFX1204 soI'm
waiting for someone to share it here in the list or in the bugzilla
thread. This patch needs some more love from the community.

---

This one has been bugging me for quite a while. I went deep hard in
the guts of ALSA to try to solve it, and it turned out to be a minor
thing apparently. The problem is old, and every UFX1604 Linux user can
attest that it's impossible to use 96000hz in DUPLEX mode without
annoying pops and clicks on the capture stream.

The fix is simple: after we alter the CLOCK_SOURCE to match our sample
rate, let's tell the CLOCK_SELECTOR we want CLOCK_SOURCE 212 (synced
to USB SOF) on pin 1. Solves the problem for me, no more pops and
clicks while on 96000hz.

---

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>

--- implicit.c  2021-04-04 20:51:57.226754632 -0300
+++ implicit.c  2021-04-09 21:55:19.593994214 -0300
@@ -50,8 +50,6 @@ static const struct snd_usb_implicit_fb_

        /* Fixed EP */
        /* FIXME: check the availability of generic matching */
-       IMPLICIT_FB_FIXED_DEV(0x1397, 0x0001, 0x81, 1), /* Behringer UFX1604 */
-       IMPLICIT_FB_FIXED_DEV(0x1397, 0x0002, 0x81, 1), /* Behringer UFX1204 */
        IMPLICIT_FB_FIXED_DEV(0x2466, 0x8010, 0x81, 2), /* Fractal
Audio Axe-Fx III */
        IMPLICIT_FB_FIXED_DEV(0x31e9, 0x0001, 0x81, 2), /* Solid State
Logic SSL2 */
        IMPLICIT_FB_FIXED_DEV(0x31e9, 0x0002, 0x81, 2), /* Solid State
Logic SSL2+ */
--- clock.c     2021-04-09 22:01:08.234001611 -0300
+++ clock.c     2021-04-09 22:01:53.640669243 -0300
@@ -610,6 +610,14 @@ int snd_usb_set_sample_rate_v2v3(struct
        if (err < 0)
                return err;

+        if (chip->usb_id == USB_ID(0x1397, 0x0001)) { /* Behringer UFX1604 */
+                printk(KERN_WARNING "Setting clock selector for UFX1604");
+                err = uac_clock_selector_set_val(chip, 211, 1);
+                if (err < 0)
+                    return err;
+       }
+
+
        return get_sample_rate_v2v3(chip, fmt->iface, fmt->altsetting, clock);
 }
