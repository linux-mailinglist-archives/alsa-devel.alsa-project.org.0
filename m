Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 606D83D5CA7
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 17:09:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEF3A1719;
	Mon, 26 Jul 2021 17:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEF3A1719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627312183;
	bh=5WXpilY1CBK7qx/u9rK585CTdERihdTVN3lmBvWA7Rs=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GpGzILjm3r17NiWgOGq+KyTSvtw8oXXSLztco9hGHdT720TnMZZipBVXZuYXNLnYD
	 R4gVpd30T/kRK+s+sDEjpmH/cA3ZPSUsCugLb9VebKnCgTQyaYCFifsDX2/iY7JghE
	 j6Co6+Hnv8+47oCfx4jQSNMKtakjSJn3ZJYXduhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44364F8025E;
	Mon, 26 Jul 2021 17:08:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D187F8025A; Mon, 26 Jul 2021 17:08:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDDF7F80130
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 17:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDDF7F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rW4Mllib"
Received: by mail-io1-xd29.google.com with SMTP id r18so12260862iot.4
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 08:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5WXpilY1CBK7qx/u9rK585CTdERihdTVN3lmBvWA7Rs=;
 b=rW4Mllib4C9VKuAc3i9J0gzFkDq/ptbFPdVbn9tciowz/QZN6u/6lOZo947QIHAr9U
 1mAz92X+/nSBF/byMZNuzJRdohDtGyC9yI9PX5xAB3TgZzdnmFmda++KJ93dbKyM84RU
 VN69Ev5U3nFDQ8iVf7P+7vMNV/tYc26ReC2rwlQSkrOoaloqDP8SplAibutMjFZSVJsX
 njKyy3xW1WgKYiQjLUzj1Q6ojuqUO9uaY5RJRK9UW6KzZhhyQSE4lEkUX2ogNnek2r7j
 YF7UJpwoLQaLhmnGXHCbbs9k0FC9BzWGoWN+JL7CcmFVDyn0xmodVNivyhFPA2KvDp4E
 1OZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5WXpilY1CBK7qx/u9rK585CTdERihdTVN3lmBvWA7Rs=;
 b=EhuVAxdIeJIydL/N3Xgn2ESi2sQrvLpqQDpKdAgKpto7tdkwOz8uBcuNj4nmJZ1mTH
 QK97MEMIJ8M5vC0Qk2saNjW8pRdC7FCmyXMZtNxqpBIvpKsOEORe7wo4NzCS3TeihOfH
 gNeZnzEbq5p+1AjRvyCAw9kCxhdB8K3mo+m4U8wW2xmOrLyAf7y+KpKWm1tCNo462iC3
 0rzOCl368FI9PkWcxuAkg5GS+ORi2JvT6DPbFc1QczWGjKrJEkf9UkurJ679QvFXJjAp
 HtD/++Nf85b8XqEXOGvabUKEMKYU6dW/TOU94ZVX6RNInmgbY0CRLJGkS3accU3VZcyW
 UEJg==
X-Gm-Message-State: AOAM530DCaibEcED/Av5zZaiFPNsgCerDfo1HhMmfRSVgIhaIoQKYAsv
 U8cLgAPJO4uLM4+h3UoCLruCKP83wrRqnBpxWEiPEE7IWyk=
X-Google-Smtp-Source: ABdhPJx9+R1ZZXn44poYKkjkCXRU5hvYFym+3XJBXWQYTCmawwPvYtowDud2ZNIrk6x0262KgRVIfgo6wBwQteDsZgE=
X-Received: by 2002:a6b:f40a:: with SMTP id i10mr5830833iog.139.1627312083172; 
 Mon, 26 Jul 2021 08:08:03 -0700 (PDT)
MIME-Version: 1.0
From: Alex Roberts <arob109@gmail.com>
Date: Mon, 26 Jul 2021 10:07:52 -0500
Message-ID: <CAPkENw_qS2fgP02RAJgoQHM1ROoio6Km5=bGPhi2R+h4vJQ79w@mail.gmail.com>
Subject: ASoC/ALSA Out of Memory Issue
To: alsa-devel@alsa-project.org, kernelnewbies@kernelnewbies.org
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

Hello,

I am developing a dummy codec to interface with an 8-channel, 24-bit
ADC. I've got it working on an NXP imx8m through the fsl_sai driver on
kernel 5.4.85. I can capture all 8 channels at varying sample rates
using arecord, and I've verified correct data capture via opening the
resulting .wav file in Audacity. The problem I am having is that
occasionally, upon starting arecord - after a fresh power cycle - I
get an out of memory error. Other times I get an out of memory after a
non-deterministic period of capture. Starting capture again also
reports out of memory, but if I wait several minutes and start capture
it will start recording again. A power cycle usually helps, but as
stated earlier, not 100% of the time.

I'm trying to track down where the oom error is coming from, but
haven't had much luck. My colleague tried running arecord with
valgrind to check for memory leaks and nothing of note was observed.
My suspicion is there's something going on with allocated memory for
DMA, like fragmentation starts to happen and it can't get a contiguous
region for operation. Reserving a larger pool - either via device tree
or kernel cmdline arguments in the bootoader - did not seem to help.

Another thought is that it's a boundary/alignment issue due to the
24-bit data, and the error is the result of trying to allocate a chunk
of memory for DMA that doesn't align.

I'm very new to ALSA dev with some exposure to kernel dev in general,
so please correct me if I'm wrong or completely mis-understanding
something.

Any suggestions on where I should / how I can debug this memory error?

Thanks,
Alex.

PS: Previously sent this to just alsa-devel mailing list on 7/21, but
never saw it show up in the archives. Here is more info since then:

The goal is 8-channel, 96k sampling rate. I've reduced sampling rate
and still have the issue. Reducing down to 4-channels helps, but
haven't tested long term enough to evaluate by how much.

Narrowed it down to device_prep_dma_cyclic(..) returning NULL within
dmaengine_prep_dma_cyclic(..)..... still tracing through source to
learn exactly what is going on.
