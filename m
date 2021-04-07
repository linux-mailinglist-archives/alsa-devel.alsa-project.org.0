Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FC93575EB
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 22:25:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA67F1676;
	Wed,  7 Apr 2021 22:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA67F1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617827135;
	bh=yIA098nNjApek05XJLiRPIrS/eItw3edWGbed26pu9g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jnjze9nCcYUncWdrmLt4LP55PAzEZ7eHpxxkQE83YnJD+n634mg7+9nZS9Va6Lmih
	 qtSO6qlr35V6gd/c62sWk3UNpeC6frDN0ljh+R43Lhesl1eb6L+biwlO4dQsE6lwXd
	 534OKDeZN51x119kpnw8Fbl34NlnvRQUV+PrKAE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A586F80124;
	Wed,  7 Apr 2021 22:24:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B172AF8016A; Wed,  7 Apr 2021 22:24:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B01AF80124
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 22:24:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B01AF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lEsL4TAu"
Received: by mail-ej1-x62c.google.com with SMTP id w3so29778740ejc.4
 for <alsa-devel@alsa-project.org>; Wed, 07 Apr 2021 13:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/opKvEc+81HeUbmM8kNGrnYlVpJQyeD4hP9xIJ04g08=;
 b=lEsL4TAu468yjsPkm2UPm3oaaw/Z8nZucDmz5NqPLWXhM+te+x3loO2EcFf1vj0VO4
 u2fw8w/3oS8ZMhgagM0Xx4KOwgVQSve29m0qVq/HabdcoXBtl2x2Z6hPY/OAvcNyini8
 PGASMJpwLGRaiVXM9OFOmIxyg/saHtrk2NaKUTvjl4wIOlj8pketWNOVVfzoazDnOOs0
 pufoGGY1kp8BqwivGDVU1BT8J8OPDDTHPyaDFp8BwLuMVO4Z0tTWaOXOdMMQLhmdczhl
 /chWZL1q0opdcv8ttUPC1rcc3g8VeCPFB2D0hehn1qjglBuJngOhwvr2cOYS+0Rv8D82
 1/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/opKvEc+81HeUbmM8kNGrnYlVpJQyeD4hP9xIJ04g08=;
 b=URFtodad0ZxUQ4b58YT5LE3ZMdv4qQj9bWIj8hV5Zt+CAjhRjaeUuszOsJ+ksKnZyg
 rDf37iyvm7cwD75WHx/DeFQA76KEtCUJfuwr355UUP7WdYbuAdW1tncJm4rjj9KPdJC8
 ZIb2HX7/a2KzmbLynDWSVmQ7QDc7QO3SgfkEpw28zDuuyEFcEIwO2GXvWlPCg8k/mN6r
 DXftUzCM3ekeQzGZYFyLMWipjfSLaUqavZcNfQuuK7NOxQ6cGXKIkTTTDa7wwlIz+R6z
 +WF8hMqFcaG7I+BWzgPp0jql9yIoHKVsohedHp3Ri5Dj+b/6X8x/C11g7iVWN/Up9yPa
 /GcQ==
X-Gm-Message-State: AOAM531SjAWD/rgk6Bf9KsWPS90vW17GGqgXraumqGYAYs/QBTFi/Tj7
 yB6uDuXuBCrIfZVqIqi5SI6EofQnJLKPuSbEzQGAQkymzNw=
X-Google-Smtp-Source: ABdhPJz52d6OAuLpZ0lTlTf4SaHc6kel4GO/sFxgEDBohOZfaPnLcLMa7IQ2r8XWlDx+RjTFD6XLB/q1lHDRn0Z1C1U=
X-Received: by 2002:a17:906:c206:: with SMTP id
 d6mr3212888ejz.531.1617827041602; 
 Wed, 07 Apr 2021 13:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
 <CAOsVg8p5vefJhR=+8XE+3HoSG0DRp_DF_f9W4zKdzGfJwmGr0w@mail.gmail.com>
In-Reply-To: <CAOsVg8p5vefJhR=+8XE+3HoSG0DRp_DF_f9W4zKdzGfJwmGr0w@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Wed, 7 Apr 2021 15:23:50 -0500
Message-ID: <CAOsVg8oeYBYb-MtzpoagvU-6ysPVAfLxN+0RVbzK1CJa4cj-rA@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Mike Oliphant <oliphant@nostatic.org>
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

Of course, I did have some tiny clicks when testing the Roland Boutique
D-05... Could that be the same thing you're experiencing on the BOSS G-1?
I describe it there as "little quiet occasional clicks sounding something
like dust on an LP record's play".
