Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66513349C73
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 23:44:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2F8615E0;
	Thu, 25 Mar 2021 23:43:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2F8615E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616712282;
	bh=9Fg5v3oMFliud0kj1S7E3lMip/KsoT3EqtIxZ+OeQpA=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B580hpIHhY4hwOeVyney8CrM13pk9gc2+8usl1pK8WL3/uKz3+UkziwV/eFKb++n+
	 d2aWQiH3830MBJCycpzoTKxCxnIULAHoscl/wxRtrnTcWM0xefo0AfOUJTjKlVXS1v
	 +m1QWfpXz6E4kVm8czZnVIlCzSB+d2FWQbP9xHt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EDA5F80257;
	Thu, 25 Mar 2021 23:43:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8747DF8025F; Thu, 25 Mar 2021 23:43:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 645F0F80103
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 23:43:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 645F0F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dynGpOIP"
Received: by mail-qt1-x82b.google.com with SMTP id i19so2976331qtv.7
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 15:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Mb/6NlJ2m5C6FdQvHJjn8zPl3lExaDGKoOU3lGplcvI=;
 b=dynGpOIPwHCD0AtQsHzwGh82rBX2xcC9tdfQC4VGgd44eGhsVEsdjAbypgW+bY8xQ8
 hIxdOidD9KXfp+8YL4Ip9wjofL02I4oS/eMmBHYQJliAhReHD2CKPnpomdV0OTFR+eA/
 AwzuHji+nO8Q/XtPr/auMz42YxOUT1jEEYKW5UcoIMt8qXMLThwQ6ud9dTSi8xBErKIL
 XPFXiN/zQt42hL17zdXw7o7XCC2MiCNHzJRN904qng/MaFlDl7AotON3g0nRgnWHw6UB
 fiV2S3SgKEQG3YI3+1NeXon4tFzbWpJQVPNL5IvHeQTNu1pHxYy8wOPLSGA9rUfxFMRF
 iYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Mb/6NlJ2m5C6FdQvHJjn8zPl3lExaDGKoOU3lGplcvI=;
 b=pf4szVFmPEm+HUr0eLUKA5q/1p8fksoxKVHl6dH9rbNw0UG56ZgjOBeQ2kRnGNL8FJ
 IrjvI0eXiGPlc1KS/tkswA03oEMhkzc5dZuAe7OlRqZwHgHkpl5PGX1aG3tLpiYzcbAx
 hNEGGFq9evLu8nDItvBd1flMTbAUYXO5P0pUG5SiWKjOaCPjU0N7k4dkpcjdeI60c+P2
 S24Bi0w7DckWkhSh9eNuaghJdG7EVtm2nndjkkpVhp1OdzgjlA4rrJfx6Re2AKPklAPE
 c5+J0WnUYAMKLqrfplpTFQEskxuBy2X4rQwKPkUUW72U43JIRnPmehCDnnZS4DFqAQYT
 yG+A==
X-Gm-Message-State: AOAM531QSLW1agZOWsVDrKgP/qN/NfeeC9xAjRYvZs5cSv3+pbm105rz
 1mnQ7ZuGO8VlzrQ6IJbGBurwRv5HUinAt2Lafnr72IKGY/Q=
X-Google-Smtp-Source: ABdhPJyIdTG7DYn7A2IIBXJBajMmUdVHj5bSrEkpeZJgUN7qGO/dABR4irzTOhMYNGmT939+aonpUc8x+nRtvDihN3Y=
X-Received: by 2002:aed:2803:: with SMTP id r3mr10205361qtd.142.1616712186501; 
 Thu, 25 Mar 2021 15:43:06 -0700 (PDT)
MIME-Version: 1.0
From: Geraldo <geraldogabriel@gmail.com>
Date: Thu, 25 Mar 2021 19:39:28 -0300
Message-ID: <CAEsQvcsXKRzCfDcid7nBnfvg6Vx1xQiBuK-EQmv4iGkDvZ0b3Q@mail.gmail.com>
Subject: [PATCH] Behringer UFX1604: get rid of pops and clicks while on 96000hz
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hello everyone!

This one has been bugging me for quite a while. I went deep hard in the
guts of ALSA to try to solve it, and it turned out to be a minor thing
apparently. The problem is old, and every UFX1604 Linux user can attest
that it's impossible to use 96000hz in DUPLEX mode without annoying pops
and clicks on the capture stream.

The fix is simple: after we alter the CLOCK_SOURCE to match our sample
rate, let's tell the CLOCK_SELECTOR we want CLOCK_SOURCE 212 (synced to USB
SOF) on pin 1. Solves the problem for me, no more pops and clicks while on
96000hz.

If you own an UFX1604 please give this patch a good testing. Let me know if
it solves the pops and clicks on the input stream for you while on DUPLEX
96000hz.

--- clock.c.git 2021-03-22 04:19:55.543485748 -0300
+++ clock.c     2021-03-25 19:23:38.597197159 -0300
@@ -610,6 +610,13 @@ int snd_usb_set_sample_rate_v2v3(struct
        if (err < 0)
                return err;

+        if (chip->usb_id == USB_ID(0x1397, 0x0001)) { /* Behringer UFX1604
*/
+                printk(KERN_WARNING "Setting clock selector for UFX1604");
+                err = uac_clock_selector_set_val(chip, 211, 1);
+                if (err < 0)
+                    return err;
+       }
+
        return get_sample_rate_v2v3(chip, fmt->iface, fmt->altsetting,
clock);
 }
