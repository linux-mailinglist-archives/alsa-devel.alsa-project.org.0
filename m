Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE825463D0D
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 18:42:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DA7322FA;
	Tue, 30 Nov 2021 18:41:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DA7322FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638294163;
	bh=sgi8hVAxJ2TC6lAQZcV7YIf3cslbDjz/FU37PQWsli0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tbbj73vw8Sh+Oi6LKKPgWkGuyR3dUcDelPBX7HizrtoDcLTocjz5s+1ZTGfkNS5pc
	 +f31vuAD0OvStirLnqmGdB045Uwdj3RsCNS7hx2tvvuv0Vcus5mcsaS+J24wgi5kll
	 pMiFIB5pyXSiyQtCHHFxl8+GtLRlvJjqBNox/nSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92D22F802A0;
	Tue, 30 Nov 2021 18:41:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E00FEF80290; Tue, 30 Nov 2021 18:41:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 095D9F800EE
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 18:41:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 095D9F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qWcEKjhS"
Received: by mail-wm1-x330.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso20153036wml.1
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 09:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sgi8hVAxJ2TC6lAQZcV7YIf3cslbDjz/FU37PQWsli0=;
 b=qWcEKjhS9fZxpthQ0sYoRA1mHDvYqBvtUfeqHNrQ0BDIg+02mH3WwN77xCgRzB6MaD
 5o8FaxMnn5F/sb1kB6F27fIvo46TINJc2gOF5b24aWGcHLnsGw/giiveZYRv/HAgGhYz
 onXo6RokHNdVlOmefDIehZFEaoll2Qzl5BhdnnPhvXqHWjaPB5ApiusiCxRvx1050UVh
 TSuSRVxM9G5SHMwr99VECJtZ1h8dMO5i2qOZbNgI69Zvo6AFPLjZd3GjE4ENeJ5kSOZK
 9s+q5LMrCpmEnXbYzHy2UdE+loIRJCza0Kkp5xFK6fT9bBIgat6CWGHmPJ6eFzqYmWuP
 PMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sgi8hVAxJ2TC6lAQZcV7YIf3cslbDjz/FU37PQWsli0=;
 b=PZ4hFbJONJhiJkhKzEvjyndvZr7UmuWviQll7HlQXbNToblQVj2QglxRoJNu8mlTE5
 1V26b9+a7jpDALhCMW/OD/mMhNIxf0OhIlu6ggjH2dPH/biec/BSiw2kzY6kR+1BGTlK
 FDFMX7Hvv1g/VjvnkVpyvJV8slmDxls81IuJ9a/rWw2TyJTghap2IZ078C44UkzqLspO
 u0j7AMsNqD2fBx7q029iISA+sQmiZymfFFlxjzG8/kAQPcKx2JwXrZ7CGOZr+OyBE139
 AbMqlfKLNqwUYv7AUPDZ2U1NoFb1LLuGN1b8/85JO+DrnsflziONvEp4yKNvn750m75B
 nIIw==
X-Gm-Message-State: AOAM533J/swLMihk2g0Yau7FARl8sWPBXWpfIZS8vRWfha8ig+HIyrd2
 2d5J7AyICBrYfIajCbSY4qIerCGYM/Y+bhXw9PU=
X-Google-Smtp-Source: ABdhPJwhnV01V8gG6iYtFPGsQ5YkF+4GQRLPbqDPYOVqcxI9xtzW4TnJhFihxZBeGpP0rt5m8BM4SaONGY5cZSsG3WM=
X-Received: by 2002:a1c:4c19:: with SMTP id z25mr54768wmf.177.1638294077177;
 Tue, 30 Nov 2021 09:41:17 -0800 (PST)
MIME-Version: 1.0
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
 <20211117093734.17407-8-daniel.baluta@oss.nxp.com>
 <CAMuHMdVV6Os8Gzc9JVjD2CAtN38=7KFn9GqosnWvByQc-7uA=Q@mail.gmail.com>
 <bdbea252-09e4-eb60-acf8-4ea8a1d924c4@linux.intel.com>
 <YaZZzSPQDz0vHRQY@sirena.org.uk>
In-Reply-To: <YaZZzSPQDz0vHRQY@sirena.org.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 30 Nov 2021 19:41:05 +0200
Message-ID: <CAEnQRZA7Nr+MMP7v+4T8G2y4L4HvSPVdoy4zekBFgynXJ16tCg@mail.gmail.com>
Subject: Re: [PATCH 07/21] ASoC: amd: Add module to determine ACP configuration
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 AjitKumar.Pandey@amd.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Bard Liao <bard.liao@intel.com>,
 Balakishore.pati@amd.com,
 =?UTF-8?B?WUMgSHVuZyAo5rSq5aCv5L+KKQ==?= <yc.hung@mediatek.com>,
 vishnuvardhanrao.ravulapati@amd.com, linux-mediatek@lists.infradead.org,
 Julian.Schroeder@amd.com, Daniel Baluta <daniel.baluta@nxp.com>,
 vsreddy@amd.com
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

On Tue, Nov 30, 2021 at 7:05 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Nov 30, 2021 at 10:49:30AM -0600, Pierre-Louis Bossart wrote:
>
> > To Geert's point, there may be an additional need to add a
>
> > depends on SND_SOC_AMD_ACP
>
> > There are also a set of
>
> > SND_SOC_AMD_ACPyx options, not sure if any applies as a dependency here?
>
> Or put them in an if block (IIRC I thought they were which was why the
> dependency wasn't needed but I don't know what I was looking at if I did
> check that).

There will be some delays in handling this as I'm in vacation until next Monday.
