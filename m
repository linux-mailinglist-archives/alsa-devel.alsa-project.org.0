Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CA0502B44
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Apr 2022 15:50:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FAA7172A;
	Fri, 15 Apr 2022 15:49:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FAA7172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650030604;
	bh=haeQnxG6ByfTgXlxgXctieH/gzxoPywCtmpsvlzed/8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vivR8gDlKBGQZuAa+zim+tjWPu2b6IHNXi2UjL0oTZ9epkI8yxY7husIP0qtzoDam
	 DbfuueP8ZJS2R79WjtahfqeVb4ukBN3Hfq+o7/wCOTxaHf7sZ8TUsWcb6BzN643OXk
	 w7wFT/QEjhtz9RTM6e47inHm1UoIYMExp08a0z9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95389F8016B;
	Fri, 15 Apr 2022 15:49:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B828F8016A; Fri, 15 Apr 2022 15:49:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EABBF8012E
 for <alsa-devel@alsa-project.org>; Fri, 15 Apr 2022 15:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EABBF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="asQjyftN"
Received: by mail-ot1-x332.google.com with SMTP id
 k29-20020a056830243d00b006040caa0988so1002998ots.6
 for <alsa-devel@alsa-project.org>; Fri, 15 Apr 2022 06:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oYla5eM88g11+YBO1ayh9P0EEyH36hXdUpHH4l9SgYA=;
 b=asQjyftN589QcStRfQhEPw+854ItHOO585YkA3DIxf0OK+iVar4H+wRMM6l4GLhmvH
 CXQLAoQPv/WkOvuVRGmIf4vEtTqxnE3cbzAu6C7/J9AeleLHGEJQYwCAoAu6rhYQdPKN
 lAhxg9tpM1L10Zc3+vnRC9YEI6iK0kw9OH137oCc/i5K5EwMSAI2Z6cS+uh5cdJu8NYj
 IGXkp1ArbmqUVeZAc6A9zfrOAQzSfPabV2MDgYL9n++4UchnMW2nyq5XdrL/qAIkS7jL
 Jju8JpcDvugNaXcT9gNaVhzpLOnQPhw12LcThx1cFYWWf6Hr+Jo3vGyldcjhm4BmFMOg
 SfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=oYla5eM88g11+YBO1ayh9P0EEyH36hXdUpHH4l9SgYA=;
 b=5TO+YgtWDAVOPHxuPITNrSKEcwys/ZzJ2Ap+xsT4eR9yBBNM+76fmKhMzzBLY9tvdC
 cMriqEHAhOg+gZk1b/NJOhf6hH19KP3HvIdxgMt1ymT/HvMlc1CiRZR42f5y5bpTv9Aq
 u4+xuRkqY/bO0OvsBcaTRj+WVC0M4SXsTSPPKEnilhRoRcDP/jGckrtYKSZ2MGWAQXD2
 vXzHkXT2Jq8SkVcvwLhhEP/FrDB64a5npbPND9ddSOmQ+lWvxBEftXozEqjSXO1MJq6R
 IIMLH9YOUQqOK4tTmmpdcp61/TwvIfS2bKshM8n6qr40b5vGeNoXEO5VBeZ7H0YSjLV/
 RJRw==
X-Gm-Message-State: AOAM532eDczj3hfOTgMHj8deJ2bv9Y660eI5oHL/eaJlScvj5j30G/eX
 tIHFlpAFweox0t77TUzc3nE=
X-Google-Smtp-Source: ABdhPJx8AxCJTD4XzuFxmkFFDvWgT4sujeRGIWg5QVXw/n38UYO2+ps+V061yTQA+GLcVyXNAFk3OA==
X-Received: by 2002:a05:6830:1af8:b0:5b2:4e36:ad5f with SMTP id
 c24-20020a0568301af800b005b24e36ad5fmr2580407otd.257.1650030535811; 
 Fri, 15 Apr 2022 06:48:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a056808138300b002f76b9a9ef6sm1170986oiw.10.2022.04.15.06.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:48:54 -0700 (PDT)
Date: Fri, 15 Apr 2022 06:48:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3] sound/oss/dmasound: fix build when drivers are mixed
 =y/=m
Message-ID: <20220415134852.GA2271702@roeck-us.net>
References: <20220405234118.24830-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405234118.24830-1-rdunlap@infradead.org>
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
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

On Tue, Apr 05, 2022 at 04:41:18PM -0700, Randy Dunlap wrote:
> When CONFIG_DMASOUND_ATARI=m and CONFIG_DMASOUND_Q40=y (or vice versa),
> dmasound_core.o can be built without dmasound_deinit() being defined,
> causing a build error:
> 
> ERROR: modpost: "dmasound_deinit" [sound/oss/dmasound/dmasound_atari.ko] undefined!
> 
> Modify dmasound_core.c and dmasound.h so that dmasound_deinit() is
> always available.
> 
> The mixed modes (=y/=m) also mean that several variables and structs
> have to be declared in all cases.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: lore.kernel.org/r/202204032138.EFT9qGEd-lkp@intel.com
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: alsa-devel@alsa-project.org
> ---

m68k:allmodconfig fails to build with this patch in the tree.

Error log:
sound/oss/dmasound/dmasound_core.c:1431:12: error: 'dmasound_setup' defined but not used

... because __setup() is empty if MODULE is defined.

Guenter
