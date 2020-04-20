Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E56001B0AD9
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 14:52:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 791371677;
	Mon, 20 Apr 2020 14:51:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 791371677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587387166;
	bh=35aqzVMMcIlOOYhLALGKxscQPUJo+RlR+stQptgOImc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dt9gr+PApEsHBJ5pZstlceIIQIeUBTfgxaG1h1vnI7Chgt5r7l7Q0mHpIn+oc3vKW
	 U896VcH4KMRZ6YWI9uQjF9NVzdj4PCyC82klSSb8/1YZSLdUKHN7eg14FONggD/mgF
	 ANTwd+lHOGOKjBUVTn7vQ7kTWXd6v+hEU25vKyI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9922CF8020C;
	Mon, 20 Apr 2020 14:51:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 997CDF801D9; Mon, 20 Apr 2020 14:51:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC584F800C8
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 14:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC584F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Xy8tnJGN"
Received: by mail-oi1-x241.google.com with SMTP id s202so8620231oih.3
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 05:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=35aqzVMMcIlOOYhLALGKxscQPUJo+RlR+stQptgOImc=;
 b=Xy8tnJGNE6IPz8WZ/6FO3Q1inVAJSdTpoIxxV8Ux3JOU6jzoZgSo2z7XMgnEPW46N9
 P6QxEiWKXe/FZpYWdIedsYvkjV7dQVVb4YBZX1wagT0BAfcG8106E9ivHOW67/4Y9LTA
 LO5V8Ofjd4lLcW7yirW8B48dF5Mf+o7nZdYWcxYn8triKYf6kU5NJc8DECDek6B/dOBP
 fc0CE8kIyjAbZoyRZNZrVd9CPs1RC5VirmUNeSnxLxzHV/OG+rFCAiXYxHfKJKl/CPIV
 L+TFufhxIn3IQVFRYmHE3GRcMP5TuEJuUDWRIuwAjNdfkhX4sAulJvl7fFVD8R4o6b6m
 cIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=35aqzVMMcIlOOYhLALGKxscQPUJo+RlR+stQptgOImc=;
 b=JUp38oNh0JU6rk5jatTr2beXAQyGTts2M0X/BnDOBTe82aJoRhn8zonr+vXpW6VtPd
 xNcxIUV2J/tLhEp97yHDUT8pbJkt0RqIkgk3Ohk+dCFzlQ2nIKoEUJrN8NxDAAbY57zs
 rL5X+nkAXbEeSlaEr6xoOhI+rbNzKkXEymLvkyg9oJitpVZ1L3UmEM/C2Wi9Kb3yR5ca
 JmCmFPnVZGZqs6IaRo5VDVeNrSr8fmGy1FA+1bNOKHR+VD2WSQbb9efxnRbxG9nYWXcN
 KzuRMylA3hg2c6Mi8VWFlR1ikuqBRC+Gvj85VuJvMcmaG6XVRhUzSGNe+S6stxfp4Bb3
 W6Fw==
X-Gm-Message-State: AGi0PuaJxfINNWJeMBv7Rr6R8r/pWlyaMpqLM40cPig2k//AoGqxha6S
 JX6h2XzRTOhmZEebuoMZekZ6XwRxaBfgOVCCP5E=
X-Google-Smtp-Source: APiQypJQOv9Ww+7hoK/CdulOK2O+mlEVZi3+qaYbfvCToGcp+X800VBJy2czYU/s9k9AzL8Q0DF1MbReNmebyiXuhYg=
X-Received: by 2002:aca:fc0a:: with SMTP id a10mr10490437oii.77.1587387056332; 
 Mon, 20 Apr 2020 05:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200417221341.31428-1-TheSven73@gmail.com>
 <20200420121542.GB6507@sirena.org.uk>
 <CAGngYiWauBTnXDcP9UC1S7U5Ogy0B=bUZSdGs1Z9aKZ2+sB=Qw@mail.gmail.com>
 <20200420122534.GC6507@sirena.org.uk>
In-Reply-To: <20200420122534.GC6507@sirena.org.uk>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Mon, 20 Apr 2020 08:50:45 -0400
Message-ID: <CAGngYiV9MxeLrERkgU2+rucCiJ5StCXN7GXxKLMfaJ-bqSpAAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: add Microsemi ZL38060 binding
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>
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

On Mon, Apr 20, 2020 at 8:25 AM Mark Brown <broonie@kernel.org> wrote:
>
> I'd expect someone with knowledge of the hardware such as yourself.

I claim no expertise - I was just getting tired of dragging the
out-of-tree vendor
driver for this chip from kernel to kernel. AFAIK, most people using this chip
have forked the vendor driver and adapted it to their specific needs.

If my name has to be there, I'd be keen to hand it over once someone more
familiar with this chip comes along.

Hopefully someone from Microsemi will be monitoring this discussion.
