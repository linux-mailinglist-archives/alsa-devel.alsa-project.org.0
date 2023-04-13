Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4396E0615
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 06:42:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96780F32;
	Thu, 13 Apr 2023 06:41:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96780F32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681360939;
	bh=up/K2O9wIxczn+++nISmhJDwRBQTqqGzT6HVxyJP7kI=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JaYcvypYNQPlw04HLrZBUzmHLhAZRzLzgpFK/oba7pn1SuALJz+Sjo+4XWY6bB06J
	 ExBbbaCni0QZiLUjHFaP9b0Dp/3glK612zLynxwy/+MGUniGzGxCAF8AdB43WlJYxw
	 EP9f8fJQp3CA/DnXV2LxuCP4aYlpRILzKpgk1TZQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D01D4F8025E;
	Thu, 13 Apr 2023 06:41:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 429A6F8032B; Thu, 13 Apr 2023 06:41:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32D4BF8023A
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 06:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32D4BF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=r+1THSEm
Received: by mail-wr1-x431.google.com with SMTP id i3so3586579wrc.4
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Apr 2023 21:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681360872; x=1683952872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RQIV09nyBZ3j1Y/rYZ+tNewZrKOlIxs9IdKeQvC2A+A=;
        b=r+1THSEmJwTxvDvrOXXHICXqilJ8NWbmtVnn27NHqw5Aq6sZYvuhmlGIxxl9Bq9caD
         I6qICgVhPiOboClGdcWeSdC0dwYu3q8pj3ShhEQ+vERl1vyKeADuay6bhAfPmaKVBKiI
         4h9xMjamq3fHufzk7WGacG4ZrJ3LIUWguUTocgBK1ZSExqHHRpOEViwl1K4fWErOvDTs
         Fcpon95VHFZUOdRH6iuFrldwYiAcSFlwa6a3G/dB58fgZVJT7mnMjD9+XRLwPKU2fydd
         Txe132Vqmol9dYbPocmEI50KifyErZSQwHhKgsU8u+1XTIopH081lgmDGHlS5tkdjTjd
         OJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681360872; x=1683952872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQIV09nyBZ3j1Y/rYZ+tNewZrKOlIxs9IdKeQvC2A+A=;
        b=exhOE848mX6KJc3B/33Kz3aLhUKeu+0OTibcAfDoYsCmsI10z3WG+ZUkr6bN46tTfr
         RjKFFDnCd+Gon129H/elzadFmzqKdYh8/SDfw2MdLc5OFg2OeGOZdUsaXWMiJeTg3G/S
         QpEnD6/tf6fGeA0sV58RVrAqZ+1GBhwpBr6LBWgsTDjF1VTYS9s1PfEgr4+Sag7b42b/
         knzfNt/bRJ3Ii3yAbGldSzD7bC3F0nid+HRLBiATQgPiEYiBSOfPVMgFy6ug7ebAk4QO
         xxuSUdii9oAU9YGbrUKA2CJi7PCAUtJIbNBfmeAOe3K9sgIDB+NlwIAM2jap4A3qj+fr
         ZXlw==
X-Gm-Message-State: AAQBX9fNtgPVoWiBbSpX0ofuVce1yClMXEG0NX1KW3sMTgickg7FGBrf
	p6AUYStwv71COBCDZ1FbOeg=
X-Google-Smtp-Source: 
 AKy350YYxZNB3ysOef14Ae9uY32UU60wME6vOyK6/9/FSvf7ANJ8vTR6tcvMsuzeldVFaZS9YMTx6w==
X-Received: by 2002:adf:f80b:0:b0:2cf:eeae:88c3 with SMTP id
 s11-20020adff80b000000b002cfeeae88c3mr354154wrp.32.1681360871697;
        Wed, 12 Apr 2023 21:41:11 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 y18-20020adff6d2000000b002daf0b52598sm389750wrp.18.2023.04.12.21.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 21:41:11 -0700 (PDT)
Date: Thu, 13 Apr 2023 07:41:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [bug report] ASoC: SOF: avoid a NULL dereference with
 unsupported widgets
Message-ID: <62d6b3a8-9b41-4fd2-a7a9-1fdc92c12486@kili.mountain>
References: <4826f662-42f0-4a82-ba32-8bf5f8a03256@kili.mountain>
 <80f2a9e2-a2fb-4543-b381-251bb07876ef@linux.intel.com>
 <b3671cde-7f77-48aa-a4a2-db25e141ff45@kili.mountain>
 <8f78395b-5cc3-e5da-90f2-2fa7114ddcfb@linux.intel.com>
 <9ab57cb9-8320-4891-beb9-50c57346d9e5@kili.mountain>
 <471b8f95-1c13-48bd-0491-cae0fe2ce824@linux.intel.com>
 <d9dbf94-154f-f571-e4ef-43adef43881@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9dbf94-154f-f571-e4ef-43adef43881@intel.com>
Message-ID-Hash: KTW5DCTGAW3OJ2MHTNGUI6OWM3ZJYFX3
X-Message-ID-Hash: KTW5DCTGAW3OJ2MHTNGUI6OWM3ZJYFX3
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KTW5DCTGAW3OJ2MHTNGUI6OWM3ZJYFX3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 11, 2023 at 06:22:20PM +0200, Guennadi Liakhovetski wrote:
> Hi,
> 
> Actually there's no black magic there because there's no dereference but
> only pointer arithmetic. The compiler just adds the calculated offset to
> NULL and passes that small pointer to printk().
> 

The code in check_pointer_msg() is supposed to detect bugs but we're
taking advantage of it and introducing bugs...  It's might not be magic
but it's pretty astonishing.

regards,
dan carpenter

