Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6059244ED45
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Nov 2021 20:28:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4970166E;
	Fri, 12 Nov 2021 20:27:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4970166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636745318;
	bh=Jo/Z11EWZPKvRLedOKsQToZMFXuL7ARMD/5XbJ+fiCA=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pe9vkbuQHigCofJz6flWEylSnRgR1bZLXf3hXvukghwqTehQ2QhJfmKnOP8NFbt2S
	 F3K1sg0ginN3XOs237WkXwt5WiI6v0W7zkVdTWm2v2MDHS3JP6DIspiulJVJ2O1dZt
	 Z5fvAE9S1sNrFnWrKSq9Pg0Rgpk/5DNFwJk7CeQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59633F800C1;
	Fri, 12 Nov 2021 20:27:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82261F8049E; Fri, 12 Nov 2021 20:27:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C0F8F800C1
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 20:27:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C0F8F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ptmhGFhl"
Received: by mail-oi1-x234.google.com with SMTP id o4so19706633oia.10
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 11:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=Jo/Z11EWZPKvRLedOKsQToZMFXuL7ARMD/5XbJ+fiCA=;
 b=ptmhGFhl8m47uktjDc8N6GPEvvLV4DATBxwa1QCxcfI3sHhwhm+W/uK67qw+hb/Xrz
 QB9is6awtXzdRHSKyK4qqc81zWw0poGfrfeR7CCRIKckfZuxmEw/p3FyTh3bt13rUHej
 SpgT26B6uS4CSX+HVlX9pDlsmpbQrYmBXCL+DqnFBF+Km4IabwhjDcRtIQBP6yJ8Av+N
 KuxJ2nE8O0AXiOyoNnLxLA2ktOMpNUEmD7ieqtAXsfgRzFyuD2PK9VoWvqINzrI0hNwy
 G66QxE9ABwVTSGSLrV1BE33dl3J7d9zZXzo03eiZXMuaOz6wWHRXpSbMBaJIBhxHFw64
 ZBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Jo/Z11EWZPKvRLedOKsQToZMFXuL7ARMD/5XbJ+fiCA=;
 b=Y/syx1qzcXUYoYBKz5i3/p4fDs4w9kVDNFzxV0LxA4RDam7xtwLRkDnMPhMvMTNNFZ
 nlZaYSuSYC9m1S4up90SeOW/fL8niUbZAv0m0dnhMiPNpUnEJbctrBJvKF2WdRCo+MTv
 OqofwzyoDtYu2XTU+EUKvf59D9jPieCwEqUBR32CTwgLmXRB5TKHKY4J2dy/HABANWcG
 deyKZbAvc1J4t+eOigowdvwCBUfUqEVtp3WXbQ3nhhN5TwPkWmufjKnq1K4mFUjejmcH
 4vlOXuZC/nnprsR3SEfH/UwdaO7QzIflH4MyYeXiTBTcTCVUafBRP5KkeffBfHwOBpRa
 s9fQ==
X-Gm-Message-State: AOAM532M5kVa3omh35FvNwJRxknXIokL8ICQNF+J2DbQ5OEnAixZi7sz
 DjHmkVGGppY5OWeW/QIca2IVWdnewvdQXuRm2y5RPL/grMpa8g==
X-Google-Smtp-Source: ABdhPJyeOqB/sfCclk63IBIVaaCxg5izK3gQHRqDOdhd4bO/bVwFLrZGEI6fVRwpQccRpcPcGoffv0cUsdgtfbeunTY=
X-Received: by 2002:a05:6808:1885:: with SMTP id
 bi5mr30328072oib.54.1636745228715; 
 Fri, 12 Nov 2021 11:27:08 -0800 (PST)
MIME-Version: 1.0
From: Ramon Fried <rfried.dev@gmail.com>
Date: Fri, 12 Nov 2021 21:26:58 +0200
Message-ID: <CAGi-RUJxadzSjuZoVPFKoW_jg+9=k8Onm9eo8W0R160Sjz-C6Q@mail.gmail.com>
Subject: Possible issue with Intel 200 PCH HD on X299 AORUS Gaming 7
To: alsa-devel@alsa-project.org
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

Hi all.
Apparently on Linux Headphones and Line are switched.
Dual booting Windows on the same machine proves that it's indeed
connected correctly.
I initially thought it was related to Pulseaudio, but together with
Pulseaudio guys help we figured it's probably in ALSA.

http://alsa-project.org/db/?f=535021978814678ea328b0d3a053ba3cbd39b709

Where should I open a bug ? Is it kernel related, if user-space, to
which ALSA component should I open a bug to ?
Thanks,
Ramon
