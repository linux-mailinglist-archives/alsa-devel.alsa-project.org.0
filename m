Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D79C048F769
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jan 2022 16:17:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 594A5191F;
	Sat, 15 Jan 2022 16:16:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 594A5191F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642259868;
	bh=ZDkA13n+HZ37YdZsT5o4Jb6MnO4NRMvslXfX0+6wMFU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WBe7stMe8TA5PQAVYiwkMKeNmXvuykX4ju7yUmvkAialbACgfU3mq0VSVAhskd7sA
	 nTwu6Es0ixTbAV/4FHIeK8Ady1BYWIZB7zA9tsHYGyRd1w07drXw8qxiGV7/eGZhi0
	 6D52/aNA/J7vhN8dZVM83tz39AFg1haGUVfYw7k4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCA18F80167;
	Sat, 15 Jan 2022 16:16:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87DD3F801D8; Sat, 15 Jan 2022 16:16:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D672F80141
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 16:16:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D672F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="R2zEYBVO"
Received: by mail-lf1-x129.google.com with SMTP id b14so21992321lff.3
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 07:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=Aw0wDC5RObM03gYq5UCQkUBkn1tAzlt+aPibmT+t4NQ=;
 b=R2zEYBVOKAKMJBxJZoPMqB1tWVWQGQ1DydqYumbS27TCDpxe/e8iAimPcKALSp9xLB
 XISiGgZzpO3bDzYvqXrcx1Jnj2i4jprX6wtnKzIO2ZpNxst/h1XCIBQJgEzc6bO2KDpR
 u6Pvc6l26Eg7WAF7sGCSbzo34/egDUFrHXw1+NmI8zFlwK9ElfNtbQNwx9UEQyEvDX/3
 dRQK7DQ9HgW/XKFlBF1boJqkGSWbvbSXEXErybZuoEoehgzBApKZ9rsujb7AgF+AK1rj
 uvwyUtSZ2u7H+wxqo0j3ngcIKaIx1YDvzQnoDJCoYwfvzFr1s6AN9n/87KLuEAfGBPb0
 i3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=Aw0wDC5RObM03gYq5UCQkUBkn1tAzlt+aPibmT+t4NQ=;
 b=dE/G2apm4p/ZFwgMGEguI/VEF+std4uLohx0v5y2Xb4mFs718rKlfUSrShFqDJhLev
 SJAgIXYYH7LFxKgoHJmU3sbu7yqGwVdK7toWayKqIxizdVDDOR22B4id1EEfG+EXz4on
 7UkR1h6BCPRyG1MaYZdprb1qHSkZaFyifOX8NiuslTI//WyLjyONfrmi9XlQEcFsAiwh
 CBAPuTuKKFe4Ca1QrfKzcbYNTj6huwqOcij0ngybxJPsbIPPLQR+csPmh08OHnRXonw1
 nVZdIV+vzrhQ2gfgOJDKTz4szfbswFcB8JIOTYX9/ONeq7iEQfSRgWqvjWrkxO8G2jml
 fPDA==
X-Gm-Message-State: AOAM533Vh8+juFAOiXkRZQX7KKEsfwCAScG9ybfaopAHCvZRVLFBrmeo
 dnyjdhncf0wnOFTWxvtggr4=
X-Google-Smtp-Source: ABdhPJz5GbSUsaaqOY3bcMZYLsgUqGx0Dfr1w8xyUU8t8Iu2mCLGqpJCeui6A9iUR9IDR+KB+M4qEA==
X-Received: by 2002:a2e:86c8:: with SMTP id n8mr3885610ljj.386.1642259794158; 
 Sat, 15 Jan 2022 07:16:34 -0800 (PST)
Received: from localhost.localdomain (ntd06459.static.corbina.ru.
 [95.31.14.149])
 by smtp.gmail.com with ESMTPSA id j1sm845483ljg.45.2022.01.15.07.16.33
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Sat, 15 Jan 2022 07:16:33 -0800 (PST)
Date: Sat, 15 Jan 2022 18:22:15 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/4] ALSA: hda/realtek: fix mute/micmute LEDs for HP 855 G8
Message-ID: <20220115152215.kprws5nja2i43qax@localhost.localdomain>
User-Agent: mtt
References: <s5ho84h9tit.wl-tiwai@suse.de>
 <20220112101249.ya73jvpmqmeh4ggg@localhost.localdomain>
 <s5hilup9s87.wl-tiwai@suse.de>
 <20220112104827.4aymoth7ua65nwge@localhost.localdomain>
 <20220112201824.qmphnz2hx4frda6e@localhost.localdomain>
 <s5h8rvk85uy.wl-tiwai@suse.de>
 <20220113183141.kla37mbqmo4x6wxp@localhost.localdomain>
 <s5ha6fy46jt.wl-tiwai@suse.de>
 <20220114183720.n46wealclg6spxkp@localhost.localdomain>
 <s5hsftp3027.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hsftp3027.wl-tiwai@suse.de>
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, Jeremy Szu <jeremy.szu@canonical.com>,
 Huacai Chen <chenhuacai@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 tiwai@suse.com, Hui Wang <hui.wang@canonical.com>,
 PeiSen Hou <pshou@realtek.com>, Jian-Hong Pan <jhp@endlessos.org>
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

On Sat, Jan 15, 2022 at 08:55:28AM +0100, Takashi Iwai wrote:
> > This patch solved the BUG problem. But after unbind/bind micmute LED
> > stopped working. Speakers and mute LED are fine though.
> Does the corresponding sysfs entry exist in /sys/class/leds/*?

Yes.

> And can you control LED over there?

After "out of range cmd" messages the sysfs entry remains present, but writing 
ones to the brightness file stops to produce any effect.

Actually, the timing issues are present here as well. Sometimes unbind & bind 
works fine. But fails on the second round.

> This seems to be a bogus COEF.  But I have no idea from where this
> comes.  The values look completely wrong.
> I guess you'd need to put some debug prints to trace down how those
> are triggered...

Okay, I'll try. It's going to take some time though.
