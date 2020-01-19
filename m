Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 728C6145A91
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 18:06:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C43BA16B4;
	Wed, 22 Jan 2020 18:05:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C43BA16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579712782;
	bh=zrjuE50YEL9juF9kzH+fMWq04a35H8w21cwE9M1icY4=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ai45oFrds9O22kiHiIoxInEPyo7yE/NzZhQclotPPvBVrEI4SpDFQfTlk3xTv9Qk9
	 UMkUf4CvUBCG5M8V1k4ZZAcD1xVsPWy7P+3yWpbJK5EifUF1IyjAOZl/NsUtJEqf5k
	 cXBY9Y5y9C6r2ohCo4tNpqhlG4xDOV1KenupB9Vo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C2A4F801D8;
	Wed, 22 Jan 2020 18:04:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D7D4F8013E; Sun, 19 Jan 2020 21:43:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3000CF8013E
 for <alsa-devel@alsa-project.org>; Sun, 19 Jan 2020 21:43:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3000CF8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="K6AewoE1"
Received: by mail-vs1-xe31.google.com with SMTP id s16so17799756vsc.10
 for <alsa-devel@alsa-project.org>; Sun, 19 Jan 2020 12:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Ej6WEfoQ8weohvh3/wvbxn5dRqm9HKYPMOcapUGtArc=;
 b=K6AewoE1DTG68Pnravc01UMS/U+BV7T96o/Ypkbxb2N93KyopYucX8LkNLmBiuHezX
 EvI7u0oAeWvqX48lRG0xmBEKuTgsA4WwvrFxAuRIUMJStHD3wU2VbkTnjb+TUURom8Re
 MbrFUIMXy3L9BQjJrwwaid+Wo3qIlLTjOGGz5cefpYAqyGgigtVoBSCOZD2ekAi9M5az
 oBLYlF2x+Mgznck0aEk5iyGFtlU6mnxyBY9QZFPc7+f4KnSsuGrpRLKl6+a1lxFd390f
 1s8/+HtQ2xe+ycRrLkbIRoro2dRRWCH8m3K3WAAlLAMMQm7JUxjTXMvKpNVVYWt6a0zt
 +AFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Ej6WEfoQ8weohvh3/wvbxn5dRqm9HKYPMOcapUGtArc=;
 b=Z4lWrw+sSpIA+3AxFJIYnVaM2IighfFhGALkYeO4amYcCxGmaFcpBgxS+b3DpFQ4Ml
 InBR2XIPf1HJVxPK9zYrXwxb2/W7tWmJllkwg0TjrkR/KJskprDo0c7BJks2c86aXtZZ
 RJGv5Fpvix+eZYREM78595MuFWzXYRRSJDWAOrrEOgJ53/Ai114WCMJcCIzzvTHB8MTw
 5WEggBMqMmrYpT6DlgZRsyd5GOJHA/HYzXO/Gwo3NdS7ksEEVD19KAan5MpNx9qyK1K8
 3CF411AxQ1WVpkijbK3LveJDjjp/8VpDIHUqM5bhWE60bEJBWLeaHE6sHOjfc5wogesl
 CtSA==
X-Gm-Message-State: APjAAAXA0DVc2PDTLJoF1uV9W1OYsX5CjaVMk00lbHQfk7UHMensGYei
 SJFPobrb/9pTCloebcwkry63mJwS1qSns3u32fE=
X-Google-Smtp-Source: APXvYqxziGUoZ3w2YRWZBDaOct4c8uEnKRTRRb7Z+Vo82M5nFtv6BE4vMh7g1sG99BrmGq8D9KAZUSO4fPoTsmQ4wjI=
X-Received: by 2002:a67:89c4:: with SMTP id l187mr7809982vsd.31.1579466581216; 
 Sun, 19 Jan 2020 12:43:01 -0800 (PST)
MIME-Version: 1.0
From: Mihai Luizescu <m.luizescu@gmail.com>
Date: Sun, 19 Jan 2020 21:42:50 +0100
Message-ID: <CAKRdUfMby42E=5K94E8+m74iBv5UJEZ6JGWUz2NYGPTYYvuVCQ@mail.gmail.com>
To: emilio.moretti@gmail.com
X-Mailman-Approved-At: Wed, 22 Jan 2020 18:04:36 +0100
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 01/01] Add VID to support native DSD
	reproduction on FiiO devices.
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

Tested-by: Mihai Luizescu <m.luizescu@gmail.com>
---

I tested the patch today on Archlinux and I can confirm that it is working.

I am able to play DSD files up to DSD256, the maximum supported by the
sound card.

I only compiled the snd_usb_audio module with the patch and replaced
the stock one.

DSD playback was confirmed by the green LED on the soundcard and by

checking /proc/asound (altset 3 is used during DSD playback).
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
