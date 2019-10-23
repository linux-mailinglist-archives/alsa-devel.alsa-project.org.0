Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48429E208F
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 18:27:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD205165E;
	Wed, 23 Oct 2019 18:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD205165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571848029;
	bh=QAJ0iTK5ZWH7kWx+OzWHIkRvlz0a58ZhUz19VOfXVDg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X2tFwN56cAuFvjqBGK2P6gGLNDXoVW8Oq/8Vo1p1JMwgHKhcQyHePilzdd62EPHew
	 +85zjeeG2FRRRaOnlBUCkO1tBGwijjehj1IfKlVjVmsNcoCVjNIeDOFz6NVPLYfnD4
	 2J0jjsh87uCysjnXp4CKzqqS+pJy1Fdy541VLiH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BC5EF8036F;
	Wed, 23 Oct 2019 18:25:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64D9CF80321; Wed, 23 Oct 2019 18:25:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00460F80274
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 18:25:20 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id F0BBCA0040;
 Wed, 23 Oct 2019 18:25:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz F0BBCA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1571847920; bh=t3QPzlyEXT/hjFlexcKbMrVdjHKcAsJqcJ/PsdBjaO0=;
 h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
 b=nnvtCU0i+yEjj4hh8SzicEWpHVEBYDwCMHZh13Dow8iKq5b271AX3m23S+hicD+wU
 SQt4jrKPLtTB2zZeJymDMLkv4/jl9DJcKr4UEigKbHI+DN29qQrKGQAYdTJAHL702w
 JzMw8Vjl29zenHYL6mBUHt3HqGiuuGtBKaRZaGF8=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 23 Oct 2019 18:25:17 +0200 (CEST)
To: alsa-devel@alsa-project.org
References: <CACtB+u0=M5kn6OWXad=1Z=PQaqbjtNStmpxDMpei_V6btwWBEQ@mail.gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <abfa1e3c-b292-f045-fce2-b5df47b1cfa0@perex.cz>
Date: Wed, 23 Oct 2019 18:25:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACtB+u0=M5kn6OWXad=1Z=PQaqbjtNStmpxDMpei_V6btwWBEQ@mail.gmail.com>
Content-Language: en-US
Cc: ed nwave <ed.nwave@gmail.com>
Subject: Re: [alsa-devel] alsaloop change avail_min question
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

Dne 23. 10. 19 v 15:44 ed nwave napsal(a):
> Hi,
> 
> Over time I see the message below and the value slowly creeps up. Is this a
> simple information output or more of a warning? If run alsaloop for a long
> time - many hours of music, will alsaloop be prone to failure because of
> this value increasing?
> 
> playback plughw:Siso: change avail_min=7299

It's difficult to say without knowing the details (the used parameters). The
avail_min increase was added to avoid "no wait" loop (100% CPU usage).

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
