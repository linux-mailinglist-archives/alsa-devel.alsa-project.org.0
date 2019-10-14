Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C6AD6AB1
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 22:18:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB07E1670;
	Mon, 14 Oct 2019 22:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB07E1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571084323;
	bh=tr6cgkJKUaazTzIYwCQB4X20s0kbFCNl49NceKjoK0Q=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yc95AN2ihuEylj0NnWYslNSZ6sPffkZhhc6tFaXp5rXZc4t8qVIguBwLcaMxbWBMC
	 Z7zDebyF8XmOu9Ise+NoVzMxiZQXsH6MOuGj5gVly9ngD7jr1AzGQC3Z/PDaiOp7pZ
	 Ikn2dnVhecwkSA6qbLx5eaNFYinK0WLBY/LtKof4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C5E0F80362;
	Mon, 14 Oct 2019 22:16:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38470F80362; Mon, 14 Oct 2019 22:16:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69017F8011D
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 22:16:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69017F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="o+ueiEAF"
Received: by mail-qk1-x72e.google.com with SMTP id x134so17082701qkb.0
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 13:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=loZCntSE+vRpQdYI1LiqXtsJKBw98vo8LgqrJ7iAfZg=;
 b=o+ueiEAFOLI9kt6dz0avj9CX2HS33RaDKHPHFZKjGoATldwjlsfnFGTPaIpHIepknl
 9rvjIAOGlwGY0EpX8MHF7YguAgcLPhkvhjReLhThE7gV1s9XgUg0JDr/M5tdHg4LbtCy
 98XAsOxiMR0RqAfwR9SqKlGz2OkYS9WB6ZTL1tOgOOf8J9r5pqb8sykmvKSpDABN8Zrd
 PiTak220CeH54sjOXokzMXBn2OywL3evlAUbYu04iGQEjQOA6ZkSla6sgL2Ec4FsIfM7
 LgQXsZWGfgM4IFuC6bqoVYxY0pCkCBIwJabRm3LsvvsN2kUSRGLWx0/Q9uYcR1J39Tfx
 29Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=loZCntSE+vRpQdYI1LiqXtsJKBw98vo8LgqrJ7iAfZg=;
 b=tIr2lUZ/KVnWa3tpk3zghvrU5vvIQJ6M8Z1CdavGczmU0gEVppnREmhp7StvRJMR4j
 T36kzs1X8m1VGapFSVfGG93Wogmr4tjasRkjB6VHXtA9o5leUSK44foKaqSlbK725KgA
 I1p0glGM6cYEZyTRSBtQ0LlPbcOtIlX9ynIaZvIz43q2npLeWqfeW5B6EZgfVLwelEIr
 7MY+cmMM8LZGSIkmq4FAoTA7mic8GFJitUrV3+bdFw1Zq9rwcj6zZkHe2xECUoC0qKdO
 1tc1MH/XXSZ7JtyVHHTP2GU+l4RJTNZZgpuBOxeQEOc6OuO5v3LP+5LRLP0xGwGYqah/
 vW0g==
X-Gm-Message-State: APjAAAUivtOC6iCZTWDOoZ5Q2UuSKm2aCZjeHaw6yPkJ0LD2wecipF6l
 7W6aRA0o/zogeANXqjcDaf+07jVIv4iv9cjjyth1TA==
X-Google-Smtp-Source: APXvYqySL/kzWNZfIWaeWG7Jz6uP/Zh2ceSUcYqn+Ss8QtiiRbh40o8psY7rB+KodpxN574M9X0vCLCProsO3G/Sm/c=
X-Received: by 2002:a37:9d85:: with SMTP id
 g127mr30603306qke.158.1571084212156; 
 Mon, 14 Oct 2019 13:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191009181356.GO2036@sirena.org.uk>
 <3811afd6d83c491077dd30089bcf836f56f146c3.camel@linux.intel.com>
In-Reply-To: <3811afd6d83c491077dd30089bcf836f56f146c3.camel@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 14 Oct 2019 13:16:40 -0700
Message-ID: <CAOReqxgt6VM_ZVUJLQk=DSKdNgCxSB40sM0bxyQ6xkMLPGJPSQ@mail.gmail.com>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [ANNOUNCE] 2019 Linux Audio miniconference
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

Are we going to get a whatsApp chat going beforehand again like last year?

On Mon, Oct 14, 2019 at 12:47 PM Liam Girdwood <
liam.r.girdwood@linux.intel.com> wrote:

> On Wed, 2019-10-09 at 19:13 +0100, Mark Brown wrote:
> > Hi,
> >
> > As in previous years we're going to have an audio miniconference so
> > we can
> > get together and talk through issues, especially design decisions,
> > face to
> > face.  This year's event will be held on October 31st in Lyon,
> > France,
> > the day after ELC-E.  This will be held at the Lyon Convention Center
> > (the
> > ELC-E venue) and will be free of charge to attend, generously
> > sponsored by Intel.
> >
> > Thus far for the agenda we have:
> >
> >  - Use case management enhancements (Curtis)
> >  - DSP framework integration (Liam?)
> >  - Soundwire status (Pierre?)
> >  - Componentisation status/plans (Me)
>
> Audio Virtualisation. (Me).
>
> Liam
>
>
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
