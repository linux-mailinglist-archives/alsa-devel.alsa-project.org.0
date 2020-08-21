Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 690B524CEB2
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:13:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3AF91684;
	Fri, 21 Aug 2020 09:12:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3AF91684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597994014;
	bh=PIQOGothtnLFZt78Xvj62XGMba01CFg78S4FbXoNPTg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ayue5Bh3d1WN7twfeotiSnibD1k40l2GjJ6ht7qWnuzf+j3YD6RsUeofX8+5Kji7C
	 ekbnnyqkL7hV30jZ6ApTKA5N63wgIGL80VQvDuecudommZPq1i4+0ViIeylXfhzVs/
	 MIrx5WCJj2h4ifBl/KXyPgG4ZNT00mjSdg9SY++0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED3F2F80253;
	Fri, 21 Aug 2020 09:11:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25FB8F80218; Fri, 21 Aug 2020 09:11:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DD98F800D3
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:11:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DD98F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pbAIL/rQ"
Received: by mail-wr1-x42e.google.com with SMTP id f7so1017770wrw.1
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 00:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PIQOGothtnLFZt78Xvj62XGMba01CFg78S4FbXoNPTg=;
 b=pbAIL/rQwSZOVREIzWP5AZpMrXceQpap5AfjycHayfdWLmWkkP34smXv2gpM3wCIS2
 ZNJN3eyQ22M32THpzVD/O8w2c6rZQ6/fmKieN3/5OEEwne23SILS5e9JxxeQ4IZ1KUos
 /+KI9Osr0ug2Fm00II2CAOA3FHCMaPhD+KH2q1qIHcCYRLpn/DEOAKuEinhuR52pGJGL
 aH6ukp0MiZjCZqH1nW76rXu4vxRtLi9w5t02qkJANJqs0y61QVG0vNu+la6JWP4vNxZ1
 EPvK6IzvO9DHtS3FgEppJRot2LmqeYGqy7g4H2Um++qXnYTIG0yxIEmZsF4Fy92VitP/
 /2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PIQOGothtnLFZt78Xvj62XGMba01CFg78S4FbXoNPTg=;
 b=TNIctMeVM3ckbBUuBBq96BhR8DOP8xjVbx5WOxN91bWaG9vuCVCSsATLHVD9Zk791N
 fxjWXSCzKD+numdKEVc46Bk3P4iB2au11sj7yYmqz1ehBzyv4U4ppHc8npmEZ23faeXa
 OOCdO/Y0t5FVd+CnTlTONkEJKY17kLSlZRkVLjEH2vOPdEhtNR1dVjRtgrO+S9clHhVb
 jHsHnvxKoJa1UAWAksgJDwfKn3vxko2XHK9VixN+WuoHwTSRNENZLUXlLvWY5MD5q8jV
 YWcs1iT7ea9O273ntdmJmf7Q0QaU/wqItvVDmXZxpuMXo00ICU9jF6H9AMuMBYKKftDx
 yyrA==
X-Gm-Message-State: AOAM531NY4QcENTsdZ5Y3xgaydWCtEvYDvFx0A7HUGGedH1GPI+8Sfhw
 vuCXDoLbFXSRWCZ9qvCju64QaPndpcegu4OJKxQ=
X-Google-Smtp-Source: ABdhPJyhusNPFvsraHcL4n65gslUil1jiSzGmRnLwhTSCpbW1p4KbLCq3fh6DLWciu0ZOjm/2fzKXd9OGNYNTLkWhrA=
X-Received: by 2002:a5d:414d:: with SMTP id c13mr1374700wrq.78.1597993900282; 
 Fri, 21 Aug 2020 00:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 21 Aug 2020 10:11:29 +0300
Message-ID: <CAEnQRZCsy+QiMpCCRPNF-BUcjaT+UVE2B_a6Bd48f8tRqXTpOA@mail.gmail.com>
Subject: Re: More Generic Audio Graph Sound Card idea
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Sameer Pujar <spujar@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
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

On Fri, Aug 21, 2020 at 7:16 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Mark
> Cc Pierre-Louis, Sameer
>
> Current audio-graph-card driver has DPCM support,
> but it is limited (= Mix/Mux/TDM-split/rate-convert/channel-convert).
> It was expanded forcibly expanded.
>
> Because of it, the connection judgement for normal vs DPCM is tricky.
> I know Pierre-Louis want to use it for SOF, but something is missing,
> thus, can't use (?).

Hi Morimoto-san,

Thanks for having a look at this. I also tried to use generic machine
driver (simple-card)
with SOF but I had some trouble creating desired DPCM links.

Main limitation of simple-card is that there is no direct way of
specifying DPCM links.

I had an attempt to introduce a more flexible approach for that here:
https://lkml.org/lkml/2019/10/13/123

but obviously we can do better than that.

For now, I'm using only normal links with simple-audio card and it
works fine for
me with SOF, but in the future I think we might need to expand that.
