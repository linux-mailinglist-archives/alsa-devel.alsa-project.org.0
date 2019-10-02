Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8512CB86F
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 12:37:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F1261695;
	Fri,  4 Oct 2019 12:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F1261695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570185439;
	bh=S1BBvqAYq00CS2iSwi2mxnSNr6dzI/MSiINs5b/9Fz4=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OMhexAe3o6ylOuypYI8s8bHPmzcK9A6ou4fjgDTLdiVWtprQkzXQ5FelBpPdIVsBV
	 2bg1hxUd4G9mme/okKW/5W21cYurozZL7d8Y+f1WxH7Sq/S3tuXuoUPTqfU8sd/ro8
	 V+76f1zC5Xq2+9YGoBRvhHQvGgYnOClY7To7sIwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 466D5F805FF;
	Fri,  4 Oct 2019 12:34:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F37C8F80391; Wed,  2 Oct 2019 15:24:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CF09F800DE
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 15:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CF09F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ij5hkxaW"
Received: by mail-wr1-x430.google.com with SMTP id b9so19678975wrs.0
 for <alsa-devel@alsa-project.org>; Wed, 02 Oct 2019 06:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5DSs7+EH2kSCRkXO7ucwsxgGbTKyfARZx/sJZquknNY=;
 b=ij5hkxaWe6z4lTalWKJddJirkFx45jdPbkHfgAl2Qt5SSxBg4zkf9X5TJLjoX4mw0l
 kwTQsZCtLiu+U8eXCwJ7a3cFkxl3y//OwuKPMEz2lRRnDd4i8Z97ZKxmRx9eqa/iDIxm
 Yd4F7gIvwwsJ+C3+121VTJsb9yRPgstzwURgkv70GDqJ7JhfZuFz8iPCQWVca4IG7OBU
 0sE97JsNUeH+ZB/IThA8iZ4e7uP8+GLfYVdZP3rU2GakcXgyv59MuwdMUqi2+xn1QSVA
 MmasGUg+U113DmnM4l9X4eUlkiRd7ALSOKIEI4aN+8W4oucCLu/hFbGMFg4WxvTN5yKa
 7HYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5DSs7+EH2kSCRkXO7ucwsxgGbTKyfARZx/sJZquknNY=;
 b=MKtU4fVOxmacC65gL3VAxp5EB9vLgBuAeXccR4FeSVx9oLes1aPs9PorvPApFAzk/L
 cNhHU2jPWIkkZg2RjGVZbf3EfQxIoDoKKrtyUCplEhjxTcQ0k4ZPeIyyLK2sleloHJxO
 hzU9yrR3kOM8LfSje3xIJ8hmlVbJHGVdflx7raq6c4as9icsETl6oAoxZxe6VrgEHxRC
 /eslvN+gPd+QG1p79EEH0j1I4tbq4+KPl73LcTHZ/llkb76mb0/NYylFwI4szjluQ3Hb
 9rmsaiDCLbExqeBm163efxXpQVCx9fqOQwXAEzeZLvQBcHo3Jq7JTK35Mckua/mUtXjx
 xNjQ==
X-Gm-Message-State: APjAAAX7SIKApUOHCr95niRWgPJwYV/A2sFt3pDIESp3Yj2iwhgOZl7s
 lLViDYLRYAL1s7QINkllyvokSsrGvCP+It4Q1jMoNSwP
X-Google-Smtp-Source: APXvYqxDLXVvK8LKs4NObdmmsac/u1eJZ5RKhmzrtwQZ28t902f/5Va9Plr9eJvRw9rXeDH3TpRwGF1aAlYgLd6YV6A=
X-Received: by 2002:adf:f1d1:: with SMTP id z17mr2638341wro.330.1570022695436; 
 Wed, 02 Oct 2019 06:24:55 -0700 (PDT)
MIME-Version: 1.0
From: ed nwave <ed.nwave@gmail.com>
Date: Wed, 2 Oct 2019 14:24:44 +0100
Message-ID: <CACtB+u13jj1_Q1EgyP13i0VCyN9vEjJpsSt8vbhwvbY4q4a7vA@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Fri, 04 Oct 2019 12:34:35 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Custom Kernel driver to open and use another ALSA PCM
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

Hello,

A little bit of an unorthodox request but I need my custom PCM driver to
connect directly to another PCM driver if possible. I have an application
that already sees my custom PCM driver as the connected sound card, but I
also need to pipe the PCM data within my driver after altering it out to
another PCM of my choice ( my actual sound card ).

As an example, my PCM driver acts as a sound card connected to a microphone
capture application, within the my custom PCM I've added various "dalek"
and other voice changing alterations and now I need to output this stream
into my actual sound card.
The sound card I need my driver to import or connect to is a DAC over USB
and I believe the loaded kernel module is snd_sub_audio which I can see via
lsmod. It's PCM hw:1,0.

So is this possible? An if so, how? Even the most basic information would
be appreciated.

Thanks.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
