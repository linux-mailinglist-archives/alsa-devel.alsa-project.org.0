Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 837E8577CE0
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jul 2022 09:53:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AFAF1798;
	Mon, 18 Jul 2022 09:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AFAF1798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658130781;
	bh=YPUXpd8WLjiHW0pkH7wQ39x9P8bCv6X0eebWoqsfmvw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g1EYLFoOnEajwJTQb5gYj4NVgeeyish0JdnP8pB/utSBkN41HX34crhybw0+pOWE9
	 LRL5gji4/ghCZljE69q5SeGge3pnEr8m1d9+eX6Hf21fEjXATeGBGKt8I/IxI/fc6x
	 cq/oLZA4Z51Q+g/DZGfY2VomvfLSPXOx10Ml4XZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1003CF80544;
	Mon, 18 Jul 2022 09:51:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD6BFF800F8; Sat, 16 Jul 2022 03:14:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLY,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37731F800F8
 for <alsa-devel@alsa-project.org>; Sat, 16 Jul 2022 03:14:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37731F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FtZUXdpj"
Received: by mail-lj1-x230.google.com with SMTP id 19so7419777ljz.4
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 18:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iP74LHMnjNBu5SGAvdRdogez+xbYJ3DosuwDVvcAy5Y=;
 b=FtZUXdpj0PReEx3OG1Hh53d9z/HqqRGuqgrKbJbTtEAIUKp0f+izNW9KhSSgIhtKRZ
 O5Nt6ZTbzysOymZtZfsJOBjEzB97gmDMJQe2px190nn/Lw4Lce14NEwDShIkpWNzNzWj
 XnIoyAEMT0UwMNLpw5ct0lq9f2qSeYy80nhBp0y9k1It9bX+jd6vh/jquOxrnRmvbhkR
 hVYI/k4VvXr4br/jhqkZmsVszE5iEbj8gqREKus1lwOpV0w6Hl00UZk9h0UZDMPUapPq
 FA0x6CejdQdEkqKRpKjr/BcJHi97DO/dD+d7UKRtxrO8YXhaj3ei7e73GKKvieQC3Wad
 Av8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iP74LHMnjNBu5SGAvdRdogez+xbYJ3DosuwDVvcAy5Y=;
 b=xOFwuCJvyAfxhSPYTqoEBA2Jdf328t9FgSKiv8BPjDOOeg5TRd0iPS4gpCvnqBSscr
 cXnN343VZNVOnLjiAtUT3kkO25ki1Hd64L4PAD8NRdXNfNcIWdUpX+VftQPsZynQiqI8
 aPp/NGZsVUeUtVNkenZDyLgAIiUJ8Nce9qmCz/FUVmu+HMqibxXbK5Jcuq3aaYKfGRqG
 dnIb25W0kBMhk/v2nZIiRR0AndjVGpThTiLYrFlTeJRoul8rd+0r+W6wsdivsfED7PPv
 tdwyATc6rUzyhHZLIEWAwoNy9VeVX1ixxmyxBUvSzhtd9K2L7BietG6yNuUI/gjK12LD
 UBcA==
X-Gm-Message-State: AJIora+1zOq/stUtJJ6S8Z6A9aYCwvzt7pkJx1jDvEAHQIl6xZHmWcFB
 jpIkr7Yyai5JgEjUn0XKqNqmLAetSYnt5/48Tmk=
X-Google-Smtp-Source: AGRyM1sY2ZQAFC5ziUKg7HmMBfvcwFCypkhGGwQDHwp3n/9Wel6uwHkwJ2K4NCH3iB9j+R1Lb1tWPjCCrTy/QQ7InyU=
X-Received: by 2002:a2e:9ac3:0:b0:25d:6f3f:1049 with SMTP id
 p3-20020a2e9ac3000000b0025d6f3f1049mr8227913ljj.452.1657934058199; Fri, 15
 Jul 2022 18:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAK0WjkiJb9_mTmTMWUb2dX-B6_52Fr4stxXrgaW=07RjfMzvZw@mail.gmail.com>
 <YtGIrl/RIuI2TBps@sirena.org.uk>
In-Reply-To: <YtGIrl/RIuI2TBps@sirena.org.uk>
From: "li_jessen2016@gmail.com li" <lijessen2016@gmail.com>
Date: Sat, 16 Jul 2022 09:14:08 +0800
Message-ID: <CAK0WjkjCbCvOJ66bX5t_LansAAd0foT1gYS1Gkz5QWcAYPQ6bQ@mail.gmail.com>
Subject: Re: FAIL: alsa/Makefile dependency check
To: Mark Brown <broonie@kernel.org>
X-Mailman-Approved-At: Mon, 18 Jul 2022 09:51:01 +0200
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org
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

Thanks for your kind reply. Then what should I do? To officially raise a
bug to all the relevant persons in the kernel community?

Jessen

On Fri, Jul 15, 2022 at 11:33 PM Mark Brown <broonie@kernel.org> wrote:

> On Fri, Jul 15, 2022 at 10:47:16PM +0800, li_jessen2016@gmail.com li
> wrote:
>
> > FAIL: alsa/Makefile dependency check: $(shell
> > FAIL: alsa/Makefile dependency check: pkg-config
>
> ..
>
> > So I wonder why the FAIL info appears in the presence of *$(shell
> > pkg-config --libs alsa) *in alsa/Makefile. Is it some sort of bug or
> > did I miss something?
>
> I think that's a bug in this tool you're running - it's not
> understanding the $(shell ...) and generating false positives, not 100%
> sure what it's trying to do but it's fairly clearly parsing every
> element in the statement as a dependency of some kind.
>
