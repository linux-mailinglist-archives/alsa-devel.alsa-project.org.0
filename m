Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 730D2B248C
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2019 19:19:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC9331672;
	Fri, 13 Sep 2019 19:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC9331672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568395175;
	bh=ITpsMKRzg8ugP7W+jvjOeaJEQr0yjkYAPFuNwiiSgJ8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MJqNPYkLikjRaYPY+JUvxRwhnZ+QnRiExCHmqIMZxaqT/mNeXwbbq7EVW1Qo+LoVA
	 DVKvQFEl3mWn3GlklABVr7/SSQeNmwf12W0RwN1Go3vVckOggnnaCacU/XPGF3vVDf
	 aohl1lXSL1wm+7eiwnv76yYieUtEeMx3hLvLwkEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FE8DF8036A;
	Fri, 13 Sep 2019 19:17:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DD52F8036A; Fri, 13 Sep 2019 19:17:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 436FEF802DF
 for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2019 19:17:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 436FEF802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mdSCSH0l"
Received: by mail-pf1-x434.google.com with SMTP id q5so18462999pfg.13
 for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2019 10:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Ujbk0bpVo0CsAPmxtJQbHgRHQHETEl6yO4gNAnNCbQ=;
 b=mdSCSH0lN/jHHHLX4vlbZk67HB5co17Slfk/U+aU7/p00y1aJLvfkHJflsXxw7+wix
 prQrO5N2EEaZe5bBXSmYXArCOwlXU8MzuPfCwudVBehSA+Dk/FTmqPpSM1iFK6I77UT+
 hDaE1BvHG97RiLLQPhQt/V2Q3hAFjjJHRIViaqeA19pEh0ED53hstst941Pv9AMojbGq
 vHa6M4jtsSb8tVncKs6sQvo6Nld7Bd7oJq+WJTOSrUCEbuXMEPBQA31oy4A9zjC1f+q8
 goJb+v1P6Zo5aKoNmFc2x02XG4snen4tsw8HcgpGRcJwx4iGlGSps+rlatxHMlkAVb8l
 +Epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Ujbk0bpVo0CsAPmxtJQbHgRHQHETEl6yO4gNAnNCbQ=;
 b=knM+E8bthq1DEfJ9Jz4qYNpVELUxfaDVMjxx89NtquakEIbRADLgT12VxISs1bNB0H
 N583PNUPrURZGiP1Sq02v0O6eK7df/zlgeZgn5Cpv7SzNUNzEpD3ZC+knrwrEmRS0OCE
 1WOgNK1HARPo3SyMGp8EleroHaahiHVMa56ui1UN+lPE8caRQtcx7D7yPY10pgYVIfHM
 IkNtWpsZr2/kWiP4D88wHOhpj42CQ+oUVy0nzzcoPvlGgRvB6DGvwTBeVtc6b0DR1Rr2
 cCtTFpKnODjUloEPDlKh3pPV/j+kVgvIEKBg1hRS3c1sNz5p4Bs6R7Wt7V40Y9cBXgO9
 KAeA==
X-Gm-Message-State: APjAAAXWj7cV+gqTP2puLk84fqHFCuoweZX9GXC3avAOCWjvcvnlzLAz
 dDFC2ErAxPP5u3fzT+Uns5VDO2GlxnVT1qI/UFw=
X-Google-Smtp-Source: APXvYqzx3P0B6dU8jWFNm6nIWl8b4JWnvFbFJl7k5YptFp6dJS+uL+zf1ocgwFinyLt/f4og0UZ+g4vVj8bhu5XSLUI=
X-Received: by 2002:a63:5c26:: with SMTP id q38mr480616pgb.130.1568395063007; 
 Fri, 13 Sep 2019 10:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <15679391594432724-alsa-devel@perex.cz>
In-Reply-To: <15679391594432724-alsa-devel@perex.cz>
From: Russell Parker <russell.parker7@gmail.com>
Date: Fri, 13 Sep 2019 10:17:06 -0700
Message-ID: <CAP5gaa1Xh0J77uFx2+7FwkgaG-D-coQYgcsu1xFqQ8UD-3UneA@mail.gmail.com>
To: Jaroslav Kysela <jkysela@redhat.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Licence change for your alsa-lib UCM commits
	(Russell Parker: 6 total)
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

Yes, this license change is fine with me. Thanks for checking!

- Russell


On Sun, Sep 8, 2019 at 3:39 AM Jaroslav Kysela <jkysela@redhat.com> wrote:
>
> As discussed, we would like to move the UCM configuration files from the
> alsa-lib repository to new alsa-ucm-conf repository with the licence change
> from LGPL-2.1 to BSD-3-Clause.
>
> I would like to check, if you agree with this licence change. Please, answer
> to this e-mail and write your agreement / disagreement (keep CC to
> the alsa-devel mailing list for the archiving purposes).
>
> Thank you for your time and co-operation.
>
> Reference:  https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/153257.html
>
> List of your commit(s):
>
>   1da297fa5d41527dc8300b1e080662dbe0478fdb
>     conf/ucm: chtrt5650: Add UCM config for chtrt5650
>   f91cc3c7d6b76d11e8e003abc5aed99ee2cc78bd
>     Update chtrt5645 ucm variants to use bytcr/PlatformEnableSeq.conf component
>   e850d8e2e3893ac0622ee645bc86ddce0fd59624
>     Create shared {En,Dis}ableSeq.conf components for rt5645 variants
>   d4aa7346b73d483e3a3cfd8cea6464eb40deec6f
>     Factor out rt5645 variants Speaker+Headphones shared UCM enable sequences
>   d68adb79ef77060049526c4b819bf7cbf5328b48
>     Factor out rt5645 variants Headset+Digital Mic UCM shared {en,dis}able sequences
>   b4c0a51505520edc86edd74bafd3e6397e3325e0
>     Create device component for rt5645 Internal Analog Mic UCM
>
> ---
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
