Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9166434106E
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 23:40:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22737168B;
	Thu, 18 Mar 2021 23:39:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22737168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616107249;
	bh=OQbxVGwC1CEk88mYoWdIv9fF50Ct+zm+g+YW44kZ6M4=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cMhqpwWJ8bCe6VcK1isdrULGjL9j5twlmUQfz2Tn1lnRyczfDxkGP35BmmOeIbrD1
	 c/lYVCPMA7UPFjZBAycBqGd4yBxgk5k8eVmNe9VJV/jAwWyrHCHnlGTrPLyS/d1ZDB
	 /YqQK7xZUUXRbR+1RQr6hNPdmMwHFn6ETcW55M9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 875D1F800E0;
	Thu, 18 Mar 2021 23:39:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0E7FF80165; Thu, 18 Mar 2021 23:39:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADF5DF800C8
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 23:39:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADF5DF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="APL0nE+r"
Received: by mail-qv1-xf2b.google.com with SMTP id x16so4096255qvk.3
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 15:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NugPYoL49VU8ermiNjEOtOEXJdwFN8FaZmOyCmUoMow=;
 b=APL0nE+rSsuhW53ck9DMjRzbHF/chfRWHw9RBURP3bBIc5X6qNN8yjfZiXAk7T0ibj
 mp5nGgYScTyRuFF8WHu6diVuj0dVtgxeaIUQYs1bkB9tvxPl1S2oHmi1PM2T8LFne8Qo
 Tfm7+TC53i17A5PjJlEtrDeq6DpLrlec401rmZ46YXikO55I/VakagT/eAtvnRRhNa0g
 jKY7u1y5b51QOuC4qfQzTa0i0QBxlPtKbUcx4Ij0F+/hz7i/smLjWShFfI1/U2mKh5tx
 Y3gry7M90ZzyISdKkAvaCFHBV77PRUDiGqAf2da9oym+P8lw2KXzKdsL3wh5+dUGchE7
 TscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NugPYoL49VU8ermiNjEOtOEXJdwFN8FaZmOyCmUoMow=;
 b=ujSvkiAav47HhoUtWQBIUIUcrExXJj5ur73tnFp7hUaGiX/2fENLg8fU0AzaY5ZuJx
 l7rQRdTzMD/vY5bODdFmSZdq6iI+b7/Mc6XJO4dZhHky3ru1lbgIZyEyMaHGnGlTjY1b
 beDLxbtStyTJ8zVPw4O6LMJP6zpgB6ORRY7PQ3/nNuZaQr321+uXlbcZFWQwLdoulvo/
 /Qo0GDmffE+JzZaIQs1DOSY06JRLqFoiV9o98LFrJCCzdLXp5f0mJ/yz+IKsBp6jumVM
 bLCZnGzG+QNpnSq1nfRECfigdfyeBEWuxwHUiNIT+3aeZzY/eBUx3TIekthqfc+uMy6C
 t0jA==
X-Gm-Message-State: AOAM532BVT53k2M0nbchqhfda7l9kVvimTy2383uewQtPV9smXNLfXvP
 WsiJaoj4Hv8h19nmHdxMdhoKJC641nGO0MQHY5/Vh7/J
X-Google-Smtp-Source: ABdhPJwnOpixLudvLH8aOE72HLonnJj8JtsZ/MWQLpoPGrDU2Aq432twxxTnJk4+KgNPbirvxuCzXFziyIjnB27XyPg=
X-Received: by 2002:a05:6214:242f:: with SMTP id
 gy15mr6623983qvb.17.1616107152048; 
 Thu, 18 Mar 2021 15:39:12 -0700 (PDT)
MIME-Version: 1.0
From: Geraldo <geraldogabriel@gmail.com>
Date: Thu, 18 Mar 2021 19:41:02 -0300
Message-ID: <CAEsQvctXrHLXK-oz6Zb38t1D28krqUCf73jMU-QJw=i66KZe8g@mail.gmail.com>
Subject: Pioneer DJ DDJ-SR2 sound degradation
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

Hi everyone,

I'm running stable kernel 5.11.6 together with my Pioneer DJ DDJ-SR2 and
JACK. Mixxx is running on top of JACK.


After I start JACK I have about 40 minutes of good sound quality from the
inputs. After this period the sound will begin to degrade slowly until it
is almost pure distortion.

The issue is gone if I restart the JACK server, no need to reboot the
hardware. The description I gave above sounds a lot like soundcard clock
drift (which happens to those using more than one soundcard. You know)
which motivates me to believe we missed a bug somewhere around the recent
changes introduced in implicit feedback sync for Pioneer devices

Dyndbg shows nothing useful I guess. No xruns reported.

I've recorded a 1KHz tone and after 50+ minutes the sound degradation kicks
in. Only problem is even after cutting and encoding to mp3 128kbps it's
still a 10 megabytes file. I suppose I could post it to Soundcloud or
Mixcloud if anyone is interested.

Is anyone else experiencing these symptoms with Pioneer hardware? Note that
the sound degradation kicks in after about an hour, more or less, and it's
for the inputs only. Outputs continue to operate fine without the need to
restart the JACK server every hour.

Thanks everybody,
Geraldo
