Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 015903230C8
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 19:31:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57425167E;
	Tue, 23 Feb 2021 19:30:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57425167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614105081;
	bh=MisQ6m0QiZKlDY1CEPbPRlk+PdXK8tzV5z7Nyptk220=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lRr6vWPuvMDGiAkWrpmdZvmgxwWWeg/a+c4Lbdst25D7SlpwGKkHTZnv5Le5Uhnqp
	 NzEkfgdTooEpR8/cT1acm18Z6lMjvX78O+iJvlPFUdwhRxRcNk3zEhkOVoE/h4P8c0
	 36aT9fKzhzw60sr6TxbTXb+atAL/LnPgwSRprsDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93FA7F8016D;
	Tue, 23 Feb 2021 19:29:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E0DBF8016A; Tue, 23 Feb 2021 19:29:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21508F800B4
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 19:29:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21508F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G+kl534j"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6D0464E77
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 18:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614104969;
 bh=MisQ6m0QiZKlDY1CEPbPRlk+PdXK8tzV5z7Nyptk220=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G+kl534jMYQJj1kVsMqzgKLF6nSsWZq+QnqAS85MTbkThYaizFu2NSeRvOM7gZWXj
 Vk/Go0HwTZ/1SRnkiu0pBjADY0zUOPGkAehC60+zPSCO8UjsV4nAcJxX79MX7F43Wd
 W+6yDmciwGgqOLH50KVItRYj4SYqdFzL7UfXYKrteivYPunDkUvJ1Ff5zK5MwE7R8p
 H3UDQQNjhthcqb3l+B54pc3qJSU0b0lBU8qK6jrzRiLpd9pb7s7oKonVtpqZHNB3b/
 3VVXprtJ6e2A6sRXkecy7/XqdFB3Q098Ab/detUv0uu1/CLrM4P2tXxl3RICMeYn06
 NmSYwkyYT3gvg==
Received: by mail-ed1-f42.google.com with SMTP id c6so27076249ede.0
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 10:29:28 -0800 (PST)
X-Gm-Message-State: AOAM532Ib3k0MU5WVvuGCYVNrKe7RUZPpAHnvs/cjdBSVZW+fJ/UkgvL
 mhXKN+UNou7nDjZejxlJ3mGfHD/oBeKIVKAkqK8=
X-Google-Smtp-Source: ABdhPJwtgnZM1aVtm7bb1O1KJ2QqlfGZ2pzo/Zbt+pTspSWDh91P2/WZEpVLecQMXBUHUJajDlWeMnD12OguZ9TKxO8=
X-Received: by 2002:aa7:d145:: with SMTP id r5mr19897094edo.246.1614104967390; 
 Tue, 23 Feb 2021 10:29:27 -0800 (PST)
MIME-Version: 1.0
References: <20210222213306.22654-1-pierre-louis.bossart@linux.intel.com>
 <CGME20210222213327eucas1p270af686a642a4cd31852635eed870c0c@eucas1p2.samsung.com>
 <20210222213306.22654-7-pierre-louis.bossart@linux.intel.com>
 <2625c1b1-1e05-9d04-e414-252674688eee@samsung.com>
 <31e6f8a8-8346-0cd7-9f35-035f097b9cb5@linux.intel.com>
In-Reply-To: <31e6f8a8-8346-0cd7-9f35-035f097b9cb5@linux.intel.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 23 Feb 2021 19:29:15 +0100
X-Gmail-Original-Message-ID: <CAJKOXPe2xjRd=zdCVkCLtY4cG2675Bh=-tqvnUNB3RocO5OSUw@mail.gmail.com>
Message-ID: <CAJKOXPe2xjRd=zdCVkCLtY4cG2675Bh=-tqvnUNB3RocO5OSUw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: samsung: tm2_wm5510: remove shadowed variable
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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

On Tue, 23 Feb 2021 at 19:20, Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 2/23/21 5:25 AM, Sylwester Nawrocki wrote:
> > On 22.02.2021 22:33, Pierre-Louis Bossart wrote:
> >> Move the top-level variable to the lower scope where it's needed.
> >
> > Actually I like your original patch better as there is really no need
> > for multiple lower scope declarations in that fairly small function.
>
> I have no opinion, just let me know what the consensus is.

I proposed to have both variables local scope, to reduce the size of
function-scope variables. Their number tends to grow in probe() a lot,
so when a variable can be localized more, it makes the code easier to
understand. No need to figure out who/where/when uses the variable.
Local scope makes it much easier.

Best regards,
Krzysztof
