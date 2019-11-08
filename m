Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA656F582E
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 21:38:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BEDF1615;
	Fri,  8 Nov 2019 21:37:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BEDF1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573245485;
	bh=glVmkZ76hIsLyVpXJzOoWRfmgJuxBZ2olqG1/ImfleQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cm6Z+uC2w0UiaGr9HHONi3XfSb6ggDS4gUblgt3I8vXM6sChgyIPk8TNASyytOVo8
	 38iEjTpRGn31E5wWPCrdNzn1017EskAB/25z+clHA23Px7YBYfgSDJyXq3qEzUcCgj
	 3H9StEE+Tm+0JbD+3WDXnD7Bu6zkZz8imXwlJelU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97483F803D0;
	Fri,  8 Nov 2019 21:36:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91F2DF803D0; Fri,  8 Nov 2019 21:36:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E90D3F800D3
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 21:36:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E90D3F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Q/sYnFyh"
Received: by mail-qk1-x743.google.com with SMTP id d13so6490793qko.3
 for <alsa-devel@alsa-project.org>; Fri, 08 Nov 2019 12:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=itkER6pbjCf9jZtjnpvbKJtpqkbz3vVgT8yvbojLFEU=;
 b=Q/sYnFyhfiFFw1DPQZdMZrthS2PGAS9ZYlwXY6bYh7IOh0IW/atRdovpN5k7WtBNgu
 X64fG1CPBPdj5HhimcmQUY201M/J2QfR77THoekMLlRv1p0LHX2MxNGT6GVxs7L0doG1
 K1QitjSlZDvYK20YBgFmCG15nIwm1Q8baBkWf1NScAMXr+K4kQ2OOkHUmlnBQGz34qSu
 pOeGoU6icFOIl5/OWbN95tczjCLt3qw3V5cOdmcsHIOZrz8lF1rtkcgYND+JpAdWOI0N
 56Am6tlEaZ9yxbgd9HawxaXH9BzWDHdlUmW5wG65TcATWTQj/ZNWS09GvigbvoS1UOCU
 y7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=itkER6pbjCf9jZtjnpvbKJtpqkbz3vVgT8yvbojLFEU=;
 b=gYs1QsE2mVDN9tar6oe3KoQq09usv0L/W5kOOwW5awEbcWsSlpFgoP5iasLw/fcEc7
 VubPDchq3sJ2aqgpjoTTKYaoQexRbdLyMSUkefEb0VLcdzUY31GlxbeGqICYVtMyB9id
 1bO8l8PA5VVzrrIlij2n11yDH0Zf+KdeZgzRsUsIdMzUx26ICQcMeKjc+xSXhCkePCAz
 MevurBn3GLuTkYbWxadGCc9+3YxOdxTZNV9o8CWgUDPLg5IJuqIUZDfaJAWlnOQ1SVYZ
 5W0fUeRDV7W4tUMAXkw9ck4KoHLHvGpIVzOGGHbBw6vWnAxPnj0VvjD1El4zsR85V1jd
 s5Yg==
X-Gm-Message-State: APjAAAXo9hZjPk3YNNB2MGRdxjeJ/l0yH1RNYYRhopS+I5QODqXGO+Ut
 91UzZR6zlBQGAcQlywrj02ZdWGoRIQSy+Rml2AxANw==
X-Google-Smtp-Source: APXvYqzWLKDGYjdBd0SGfHPNih6+7WNmNwF5FMAMiafMDp8XlrumdECgelZZzLFCXhVkv0yBhrJEUORuPWKn3yYGI/o=
X-Received: by 2002:a37:8d7:: with SMTP id 206mr10743771qki.238.1573245373453; 
 Fri, 08 Nov 2019 12:36:13 -0800 (PST)
MIME-Version: 1.0
References: <20191108094641.20086-1-tiwai@suse.de>
 <20191108094641.20086-7-tiwai@suse.de>
In-Reply-To: <20191108094641.20086-7-tiwai@suse.de>
From: Curtis Malainey <cujomalainey@google.com>
Date: Fri, 8 Nov 2019 12:36:02 -0800
Message-ID: <CAOReqxik+ni5hD_Rf60AKCKazE_DReN6tXMch15e22kWtYqTwA@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 6/8] ASoC: rt5677-spi: Convert to the
	common vmalloc memalloc
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

On Fri, Nov 8, 2019 at 1:47 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> The recent change (*) in the ALSA memalloc core allows us to drop the
> special vmalloc-specific allocation and page handling.  This patch
> coverts to the common code.
> (*) 1fe7f397cfe2: ALSA: memalloc: Add vmalloc buffer allocation
>                   support
>     7e8edae39fd1: ALSA: pcm: Handle special page mapping in the
>                   default mmap handler
>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
Passes sanity checks on my end
Acked-by: Curtis Malainey <cujomalainey@chromium.org>
> ---
>  sound/soc/codecs/rt5677-spi.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c

>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
