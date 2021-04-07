Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4609D357543
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 21:56:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C80C2166B;
	Wed,  7 Apr 2021 21:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C80C2166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617825375;
	bh=QGlkWCQItyYKrzv4RwKmFSb+ZxjasfXmLSim/ATwRMs=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m2Ws+jJTe+jJtki6/PtA9zn4JZe3PT+V63OitIBWTxnSIscNT1VHCFo3euoxVN9AB
	 AJUvRWanqzvqpohKJXDSzj5sMcS7rlXh8RWDNzhjr+x2+4uLGYIMfhvV82Xqvn9LPt
	 /hPL+rA70JSTSbvvTCHWRHbTjHA3OjG3TJ6h2ieE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22FCBF800BD;
	Wed,  7 Apr 2021 21:54:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C600AF8016A; Wed,  7 Apr 2021 21:54:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AE88F800BD
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 21:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AE88F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="WftuNsPF"
Received: by mail-yb1-xb36.google.com with SMTP id 65so41165ybc.4
 for <alsa-devel@alsa-project.org>; Wed, 07 Apr 2021 12:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=oo7C24JQ9vKKwiG7UvnAzey+tXRVb0+ESIVxI2SlZMY=;
 b=WftuNsPFiEiuloFYVYcnhT5prXkWBE/bgb6ZSOIlPQAFCLPT57WX1ytkCm9gaUCXzV
 N2GHnj002PXlduxy1vR+ylhunDgomPB8ms5FuLP2K84OzQCwcjE9kbvc9XRAWn7WxF6x
 3w42LaEuvWNVsA5Zzx1qX4+eJd+Z5ljmH/cGVfQH7jRtB+ihCxALiJXxrNKSeRJJb7ou
 ybsrSx+RKVRPd2j2mxMcrKDqX6xIG4TR8rOD0j3qdb2Txzqb2b7lHmbOiC5X2Ar0l8QY
 7XrKCQYY3VvyC2ufwCyi6VsDgCnh2nFO1+w8nDgC014l+GS78g0dhhQWDFToozUDfyLW
 0o5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oo7C24JQ9vKKwiG7UvnAzey+tXRVb0+ESIVxI2SlZMY=;
 b=AVAyhR9dReQtUnWm/Yc06NH6w75MGkL2LiIz4gtadQC+7FBfE4NWgzsLAR0dDlCS30
 FHlguBOroBpNTuL5HJE0AN4zTzLhZl6pLeVuXExn+k0ta3OSsh9CpUD+NuBKezUP4ayg
 ySB7iqytuIq2Mva6tM1cT7yRwcuNMewDyQh5tm7tgcRbiuAfqJTgSXjnyInc9TB/4pQD
 lndEcgwVl1TNTe2VDv6ahjF2V9Upfg4A5Kn+i97LBJD38G9N0Z8tIDdWVa6FXWBfSqXt
 Vq+xVmsOQXCbbu2VS2ZoZB1jBf+CAr3z7mbrOXFb1udy/t7mtLf0wgDNKDItY2ziBpil
 qxtg==
X-Gm-Message-State: AOAM533UvalcEtG42yKEslGU5fsGgG9lp1S/GMnDO9vKx+gmNVKyhkzl
 ElnhOX81R7mHYSctpKcf3SPoHw4nFBRYtBa9ETwEk70t1BGNXA==
X-Google-Smtp-Source: ABdhPJwO7WYHnqi2Q/pdSbvSHyKo2wbTWlK7odkoJLiXHw9hjCZjiAO/09ou9ByhgEEupv2NPuGFbUyuIEmDGlLdE8U=
X-Received: by 2002:a25:6d83:: with SMTP id i125mr6496207ybc.417.1617825275648; 
 Wed, 07 Apr 2021 12:54:35 -0700 (PDT)
MIME-Version: 1.0
From: Mike Oliphant <oliphant@nostatic.org>
Date: Wed, 7 Apr 2021 12:54:25 -0700
Message-ID: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
Subject: Implicit feedback on BOSS GT-1, the saga continues...
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

I had thought that the recent implicit feedback changes were fully working
on the BOSS GT-1, but it turns out that I just hadn't tested well enough.

Audio playback and capture works, but with periodic dropouts. I get the
exact same behavior as I did with the quirk to completely disable implicit
feedback. Without the implicit feedback, you get dropouts from clock drift
- how bad probably varies from card to card. On mine it is every second or
so.

If I switch playback feedback for the GT-1 to generic by doing
"IMPLICIT_FB_GENERIC_DEV(0x0582, 0x01d6)", I get the previous old behavior,
which is that playback completely fails to start.

With generic playback feedback, and using my previous patch to endpoint.c
to avoid playback waiting on capture mentioned here:

https://mailman.alsa-project.org/pipermail/alsa-devel/2020-January/161951.html

playback and capture work perfectly for me.
