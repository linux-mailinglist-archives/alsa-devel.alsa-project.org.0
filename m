Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E8F7BE79B
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 19:18:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9EDBEBF;
	Mon,  9 Oct 2023 19:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9EDBEBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696871919;
	bh=VJGRIZdTcV3YO8ttLbvP8h2/OvQgrSMIIkupk5gPXHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a13z0KT2XRoLLSJM+imRvw2JTpn6vh7F1XJp8rMXjaOOByc18YpAD/RM5+yT95S2J
	 3dZAhxYRDAU0UXqkdAJ08OFev7KetoM8mJ+9mFQ7RDmCoMqomHoxxgrW47lLR+X4C0
	 pwiB49jdKAayQLrJfBO0v2e5CBXMcXIJZAsLPnIo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 415C7F80558; Mon,  9 Oct 2023 19:17:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E442BF80166;
	Mon,  9 Oct 2023 19:17:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71FC9F802BE; Mon,  9 Oct 2023 19:17:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 574D9F80130
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 19:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 574D9F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=QdPlSqfq
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-690fe10b6a4so3878430b3a.3
        for <alsa-devel@alsa-project.org>;
 Mon, 09 Oct 2023 10:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696871855; x=1697476655;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mZPfX7x2eMdylhkZSQUYpUIV1Igau6X98CqTtg2kK00=;
        b=QdPlSqfqnud7zeD+8gFN1NmVEW+r3ii3eA3CVd2KU6TRGc2qliiMIQV4tnjxabOW42
         nqIj/9GEvDk6inXhdL+rldBbsIIf1VSAFioIOfT1esSZvtA/vPYVi7WsZAlfQkc5R/cc
         CNUpAbkuSQ/yd2cKWFE3Dbm6P/U3LhQ3F0aiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696871855; x=1697476655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZPfX7x2eMdylhkZSQUYpUIV1Igau6X98CqTtg2kK00=;
        b=BBmU+7Zji4pd60uqljrXitX1jGvKKIUnW+xsE7aN0bdHKWccigtFuK0at99tgM1fEl
         a9lSyLJA8574tfsVDtIyONFVzp+SkTyCos8yQTYNBEnAYgHRcFKkr/TBsYalVq9l98EP
         tVR5at9Rfh9AY3qA/pTedUfNpd/eZwxIHfRUK9Pw7tJzCiWotujdcjyQXLd3iDIMeTiv
         RRH+M9Zp8MQtsbIuakZrNHutJyi4kGCx3oCXaDpXGXf98KGgOWctxtKc6vxwoboKCIyS
         SWpY6mcBneUCwLWc2fMlZWUaVm3PKxsmpKVn+NyUyav9IEH2zN92Rip6CJfdEmj4iHB/
         AOQQ==
X-Gm-Message-State: AOJu0Yzxbofg6pAqyhR3+1ppdnaHw/smID3qjMlarJ0CCkyBzX0TVOmc
	26kQZVsQ3iAYFkXxt/OB7R4rXUiTMtxq7HMdge4=
X-Google-Smtp-Source: 
 AGHT+IGRPJvr9B4cmDpSNaL74Y75aNcd/QuRBG3CZfS7u+cf/Tw4eJrKuwrF6Urcb3UVPtwC8meVvg==
X-Received: by 2002:a05:6a20:d42a:b0:15c:cb69:8e64 with SMTP id
 il42-20020a056a20d42a00b0015ccb698e64mr14418431pzb.25.1696871855620;
        Mon, 09 Oct 2023 10:17:35 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 h19-20020aa786d3000000b0068ff267f092sm6572557pfo.216.2023.10.09.10.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:17:34 -0700 (PDT)
Date: Mon, 9 Oct 2023 10:17:33 -0700
From: Kees Cook <keescook@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev, alsa-devel@alsa-project.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ASoC: apple: mca: Annotate struct mca_data with
 __counted_by
Message-ID: <202310090958.27F5025BDB@keescook>
References: <20230922175050.work.819-kees@kernel.org>
 <202310061321.E7247C52B@keescook>
 <6c7db067-78f2-4637-8064-3dc7c0489b90@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c7db067-78f2-4637-8064-3dc7c0489b90@sirena.org.uk>
Message-ID-Hash: EMHYTTCD555CWSYBHSVANVEVBBOGF6AK
X-Message-ID-Hash: EMHYTTCD555CWSYBHSVANVEVBBOGF6AK
X-MailFrom: keescook@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EMHYTTCD555CWSYBHSVANVEVBBOGF6AK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Oct 06, 2023 at 09:53:49PM +0100, Mark Brown wrote:
> On Fri, Oct 06, 2023 at 01:22:55PM -0700, Kees Cook wrote:
> > On Fri, Sep 22, 2023 at 10:50:50AM -0700, Kees Cook wrote:
> 
> > > Prepare for the coming implementation by GCC and Clang of the __counted_by
> > > attribute. Flexible array members annotated with __counted_by can have
> > > their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> > > (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> > > functions).
> > > 
> > > As found with Coccinelle[1], add __counted_by for struct mca_data.
> > 
> > Friendly ping. Mark, can you pick this up please?
> 
> Please don't send content free pings and please allow a reasonable time
> for review.  People get busy, go on holiday, attend conferences and so 
> on so unless there is some reason for urgency (like critical bug fixes)
> please allow at least a couple of weeks for review.  If there have been
> review comments then people may be waiting for those to be addressed.
> 
> Sending content free pings adds to the mail volume (if they are seen at
> all) which is often the problem and since they can't be reviewed
> directly if something has gone wrong you'll have to resend the patches
> anyway, so sending again is generally a better approach though there are
> some other maintainers who like them - if in doubt look at how patches
> for the subsystem are normally handled.

I'm happy to do whatever you'd like for this kind of thing, but I'm
annoyed by this likely automated response seems to ask for the things
that have already happened or generally don't make sense. :P

- It _has_ been 2 weeks.
- Review comments have _not_ required changes.
- Sending a no-change patch is just as much email as sending a ping.
- It's not content-free: I'm asking if you're going to take it;
  patches have gotten lost in the past, so it's a valid question.
- I'm not interested in other subsystems, I'm interested in yours. :P

You've made it clear you don't want me to pick up these kinds of trivial
patches that would normally go through your tree, so I'm left waiting
with no indication if you've seen the patch.

My normal routine with treewide changes is to pick up trivial stuff that
has gotten review but the traditional maintainer hasn't responded to
in 2 weeks.

Do you want these kinds of patches to be re-sent every 2 weeks if they
haven't been replied to by you?

-Kees

-- 
Kees Cook
