Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B34346D3D09
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 07:56:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A8631F9;
	Mon,  3 Apr 2023 07:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A8631F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680501366;
	bh=G5a/LmEE7ZepEdmVIdzQQUIN46pqKDRjFslTuAh63/E=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V9ScJ34PhtBKvJuLf2d2c7pjPcizalGLzlMSWVefYlsritYDHwGJSNHQ9ZaKAztIa
	 DgaWAdW3YKr4xiR9I/V/AQqtxx6ZvSwo80khQJuwuGQhGeKo9jtu5G2L4OeGuRbmiN
	 NZggL1auIw43vaRInZmj/EGsUdcxo3M/UagSL41U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D5E6F801C0;
	Mon,  3 Apr 2023 07:55:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6E52F8024C; Mon,  3 Apr 2023 07:55:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65777F801C0
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 07:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65777F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WkkI3fDP
Received: by mail-ed1-x52f.google.com with SMTP id i5so112777319eda.0
        for <alsa-devel@alsa-project.org>;
 Sun, 02 Apr 2023 22:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680501300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZynRNxZFR808PX15G+Xqm7lTMPtN9UEjP/XsOxywMvI=;
        b=WkkI3fDPDuhd/yw9ZssHrYv8HhCpD67qMXTy62n+nyVU+D9wsXvSqBMfQw4Js3Cano
         Qbvdu+y5YGtY5VorZp5pokObXKpwliLBCStmqXOYoc6/sBrOmq3B7nzAMGfTxAOqFLNt
         hnRvBmiVy/0hfwmKa8Bkz0zHfJ+/DlxjdKfKv5KT55739dIVPuHffwxxoo3ONCwBeqdp
         jma6ynY8ow3Ayie58sPAHvM8cLEc3gV4+AP5NNIwH5HILk2xA71NTLkWhfvEGY4gKWSA
         YPhx2lc29NfN7clp3i0/pkneWLa0f0IyFECWHjSaHN3aJP/RD/mu9MOJgkBp9UtRVxD2
         /Byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680501300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZynRNxZFR808PX15G+Xqm7lTMPtN9UEjP/XsOxywMvI=;
        b=p0A8cHfpZfviTgpn/jxJ48QXLjJB4ZKqIdnWkLKNxBAohGtUv2j7/iOFHaM7oBHJ6n
         x8f2w+C+CLcSnLkNtYxNpUejWrxu71hx9UxteOh+N0obFk/9l7RHLl+JiMVw7m4xcDLI
         oiPKYQlcfxfwNJowCv3xpqX5OmZUZt/qgb6j49vWxKRUV6h0xg+rIVufqC8c7+38UNKQ
         nQPcPrj1pKt0Xam/qUDcCQ/h4bFCs3IIOBLyvRanPzKOIwhdDzUXpJqbAzbGZz9B/b9x
         OfifX1NfWCycCL1k03WFzcSk+tZ1Yd1a7o2u5a4GZNKrKFiUTg0rlm3VB5uaIwbftlSN
         06uA==
X-Gm-Message-State: AAQBX9d2gEh+zfPTWvaAvFPHjsg7z8QY+aFnzlbuQcOx3muxAn7TCwNd
	RDBG9ib0JWWK6G8e7x6P4NA=
X-Google-Smtp-Source: 
 AKy350a9yGfDR3htFsDaKBsTk0eRFYslWg0ES+3dBnWPZ33LmTohFLJcNsYXq6aDKFKP3HrZt3Atew==
X-Received: by 2002:a17:906:a04a:b0:91f:5845:4e3c with SMTP id
 bg10-20020a170906a04a00b0091f58454e3cmr34350125ejb.42.1680501300160;
        Sun, 02 Apr 2023 22:55:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 m15-20020a170906258f00b009255b14e91dsm3976847ejb.46.2023.04.02.22.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 22:54:59 -0700 (PDT)
Date: Mon, 3 Apr 2023 08:54:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [bug report] ASoC: SOF: avoid a NULL dereference with
 unsupported widgets
Message-ID: <9ab57cb9-8320-4891-beb9-50c57346d9e5@kili.mountain>
References: <4826f662-42f0-4a82-ba32-8bf5f8a03256@kili.mountain>
 <80f2a9e2-a2fb-4543-b381-251bb07876ef@linux.intel.com>
 <b3671cde-7f77-48aa-a4a2-db25e141ff45@kili.mountain>
 <8f78395b-5cc3-e5da-90f2-2fa7114ddcfb@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f78395b-5cc3-e5da-90f2-2fa7114ddcfb@linux.intel.com>
Message-ID-Hash: 3ZXU7GUEZOG5LVPG6JGZRXK5T7UL2HMC
X-Message-ID-Hash: 3ZXU7GUEZOG5LVPG6JGZRXK5T7UL2HMC
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ZXU7GUEZOG5LVPG6JGZRXK5T7UL2HMC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 03, 2023 at 08:20:38AM +0300, Péter Ujfalusi wrote:
> 
> 
> On 01/04/2023 10:44, Dan Carpenter wrote:
> > On Fri, Mar 31, 2023 at 10:14:11AM +0300, Péter Ujfalusi wrote:
> >> if src_fw_module is NULL then the print will be:
> >> source (efault) or sink sink.module.name widget weren't set up properly
> >>
> >> Guennadi is relying on some black magic in the printk system to handle
> >> the printing instead of open coding.
> > 
> > I've done compiler related work and explored some weird aspect of the
> > C language and I am so fascinated by this.  I would have thought it
> > crashes before the function is called.  I cannot even imagine how black
> > magic like this would work.
> 
> I think it is not a compiler magic, but kernel magic:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/lib/vsprintf.c#n700
> 
> > Is there anyway I can test this?
> 
> You could, If you have a laptop which uses SOF and it is Intel 11th gen
> or newer then you can switch it to IPC4 and install the opt-in v2.5
> (which would need with 6.4 kernel).
> Apply this patch to 6.3-rc (or 6.2) and boot up, but unpatched kernel
> will NULL dereference, so you need to have a backup option.
> 
> https://github.com/thesofproject/sof-bin
> 
> The v2.5 is not there as a release,you need to fetch the repo and follow
> the instructions.
> 
> Read the instruction in v2.5.x/README.md before attempting to use this
> release.
> 
> Now that I look back at the patch, yes it is not obvious, but it is
> doing a valid thing.

Yeah.  Fine.  It doesn't crash but "valid" is kind of debatable.  It's
a super ugly thing.

regards,
dan carpenter

