Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97275596993
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 08:31:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 396CB3E;
	Wed, 17 Aug 2022 08:30:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 396CB3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660717867;
	bh=XOhamjozzZxgAmjkTYm7PEQWk2uXfDqloArjHEEv/OI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P4VN9BGJuFvAXYDq0iedu3o+0CB7LlXdiZ5LF9aGANAdkeieJhpfmzqYA9ip48xb4
	 BvoWTb8y9GOSfknIG8biiwoFRfQ3vg4MBBk9J+moWmvxSbJtWA/dlHf314ipQx5CBx
	 qWD8pCFRMEHFuFd6cQ9WLS1uuo8IHW/T9VQq2bLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF50AF802D2;
	Wed, 17 Aug 2022 08:30:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53447F8025C; Wed, 17 Aug 2022 08:30:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21735F80088
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 08:29:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21735F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZmXBDgwk"
Received: by mail-lf1-x12a.google.com with SMTP id e15so17862885lfs.0
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 23:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=4SgT5pbfJV5jtJwVT4KwHHssFjdmNFDrkGYbVTjUcI4=;
 b=ZmXBDgwkrprFGVxsEY4qibZB3VjHuNlq4XjdghCFnOaBZ53JmPzG7BafN4OgI/Gwkx
 CXztmoYQ+53wU6DfDSZNMkNxE9VNQauQ8Ej+yEVdSnBT/KFeRk1tUQAJPT+YXPcGr2bm
 O9qB9UORy2btknxh4MYkRDdSIQUcnuEwy2fxAbL0fIlJ0ZzJUs7U/oN+P4c4fh5X9u2E
 6vz81EROflEzMZcWXTQvSY+gpMfzcy4niST1Xl+ixpGBTFgEgnhw6mabdUZ2oxMEBwku
 KqvqsSykbrfDgCFBB1M6BnO9Ba84mf8myQjq1CRDzNiIPhVk0qMXwOelfbQ2PkAv/DLi
 LbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=4SgT5pbfJV5jtJwVT4KwHHssFjdmNFDrkGYbVTjUcI4=;
 b=GgdZtHf99Wz6+f5ElpshwiG2sj0RtxBxadhhpyQ/fuq3VB1k6ZYEAH7JpYTBpKT/KA
 2L0eCVCPLTZCOk0EA31vxk7ibfZ4qUs3oicrzRAvqiQd3C9mOVJtgNAIk9CLGB/OZk31
 L6SuUJozcT6BqsliEzkjtaWgVUf1KBb7NJWH1plRn9ApXEeyJ4NJE6piK3OOkg1NPqcH
 +W70X5UXzlPKn1zjHgqmWfGdbvugDtUKAHAz6CF7Zppoy8lACozG0LUnrhPjIL+kPpFV
 iGrWY5CA3YMuDBwGHBQ7r4X895zcE4vxNsGI6kZJBKz5lXL+Sk3ITROAea7CJdCEH/c/
 0ZTg==
X-Gm-Message-State: ACgBeo3ewpQmhGnib8oH6FuNcJKrdlPdwkubWHeRy+kADwSHo0qiS0+9
 m0CkU5XpWPVLtIEjYVUTKVr4HqH1TifdQdQZHOc=
X-Google-Smtp-Source: AA6agR5EzgrxNpww9gn0/xR+gDsl8dDNkhTd/sqnxn6Vcy711148ZU+ZAloY5lzTRs4TqxZArtDaiCapmgDOUexQdls=
X-Received: by 2002:a05:6512:3d26:b0:48b:40d4:2ce0 with SMTP id
 d38-20020a0565123d2600b0048b40d42ce0mr9100158lfv.531.1660717793694; Tue, 16
 Aug 2022 23:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <1660713867-26921-1-git-send-email-shengjiu.wang@nxp.com>
 <CAGoOwPT1tP-HP+0J1ddZ0Ea+67zzLzFFTeptTpNwkzxRK45b5g@mail.gmail.com>
In-Reply-To: <CAGoOwPT1tP-HP+0J1ddZ0Ea+67zzLzFFTeptTpNwkzxRK45b5g@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 17 Aug 2022 14:29:42 +0800
Message-ID: <CAA+D8AP2okZdD0YBWrxKGAxvp014S+R-dUSrPqbQN_ja3U5D2Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Remove unnecessary FIFO reset in ISR
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Wed, Aug 17, 2022 at 2:21 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:

> On Tue, Aug 16, 2022 at 10:41 PM Shengjiu Wang <shengjiu.wang@nxp.com>
> wrote:
> >
> > The FIFO reset drops the words in the FIFO, which may cause
> > channel swap when SAI module is running, especially when the
> > DMA speed is low. So it is not good to do FIFO reset in ISR,
> > then remove the operation.
>
> I don't recall the details of adding this many years ago, but
> leaving underrun/overrun errors unhandled does not sound right
> to me either. Would it result in a channel swap also? Perhaps
> there needs to be a reset routine that stops and restarts the
> DMA as well?
>

Remove the reset, the channel swap is gone.

IMO, no need to handle the underrun/overrun in driver, the SAI
hardware can handle the read/write pointer itself when xrun happen,
and we don't need reset routine.

For ESAI, because it can't handle read/write pointer correctly when
xrun happen, so we need reset routine.

Best regards
Wang shengjiu
