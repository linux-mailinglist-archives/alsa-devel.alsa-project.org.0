Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DB128CBFE
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Oct 2020 12:51:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 517251687;
	Tue, 13 Oct 2020 12:50:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 517251687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602586289;
	bh=5yIOA7zSjyrX4Zs7s/5Bx6EkRK+TbV8s3nkbgBG6Fvo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YSRIAoQnnmkpfz/hmtxQXPqe8t6kNLqy3+opdNQ9EFwpa1ER5aeUhHIKWvcHrVeRI
	 ev8wgbx76N0K4rhybIXwSgUQk+O6LIRc5W24SBJCqEvMTTNRlcxlUK3EIITnCEh++A
	 qmhO5Z1BO9XojZAeS1yh4l3S3co5Cy0TJqJ9IYGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B291CF8012C;
	Tue, 13 Oct 2020 12:49:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25702F801A3; Tue, 13 Oct 2020 12:49:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AEFBF800CE
 for <alsa-devel@alsa-project.org>; Tue, 13 Oct 2020 12:49:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AEFBF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NC8/NuxJ"
Received: by mail-qk1-x741.google.com with SMTP id b69so20323823qkg.8
 for <alsa-devel@alsa-project.org>; Tue, 13 Oct 2020 03:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5yIOA7zSjyrX4Zs7s/5Bx6EkRK+TbV8s3nkbgBG6Fvo=;
 b=NC8/NuxJy67mC+3rEmmrb8EZ/mvlbwIQkiCNQgPnpZRn3raZq6Vn6xfJ+ckHWgn1M1
 QI8VJzOvs9lTbpT6j5KdNWBEbVGuLFGubJYqjc9a77hu+nchRW9qOFgfTH6GLeGEZQub
 adBGZbZf1HGEhPjW2McyQf6cz338U3/ge27uacoLNG0871VXKO0yFRTxLA4N9wrDFJvI
 4dDThvH6XY+tbKFprSaWxtwBJDLQ9Wf6+x0sP8afGuaF36Y9UK7rYyfUVhYpUXDPPUs9
 KIEbyWRJ3SAOYa+l4d1ct5tDV1+sbI8MzQJ4DSEuZddvV1Sbs1f0DAQGRc+89E3kkpqL
 K1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5yIOA7zSjyrX4Zs7s/5Bx6EkRK+TbV8s3nkbgBG6Fvo=;
 b=Mvaml9N2MSSb7elyhVhUtvFiHiV4J9osRIyykQnMT4nSeFElbYFs0XmjQ71Mf3gSGJ
 gWOorDjmofaqjq9NZPLEmyecEMMbgwvSp8gI61/EI5FP0hm3z1eof6c8qV4aMXLCMWMG
 LiFJ5ZatZpko9oTqOIXvL76lbNN9tfHQkNq/CQvxXr72A+Br/HJoqzZHxkMeSpn+rItU
 DqpzMpOvU1cbOij019RSW0jzRON0ii6OVWRSCm1SAUEZABL5rCJc/ba4qcOeVHp4xs7I
 Z9Q5AECkC6EArjc04zTJSAmoWLxLUD6ebxHvqnPEMuI27QF7i/zjWu8/Az0KWYL4aQvl
 GytA==
X-Gm-Message-State: AOAM533tNJjlLWCyJX1CSz2i2udJePwLqq6gY2F5zsfk+hHm6YR47pg3
 eJPJ74Db1k9gDXPH9/39lI6iZa+2evHpaKVgKPc=
X-Google-Smtp-Source: ABdhPJwPArjX1/GNiWi7DgVkMB7AMSGfJphdxv8GAO9L+oqwA47B1TRWy3HHHsK69qtyzYJr7RiSbchJ1miUu/bHKfg=
X-Received: by 2002:a05:620a:657:: with SMTP id
 a23mr13835127qka.121.1602586176472; 
 Tue, 13 Oct 2020 03:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <1602492582-3558-1-git-send-email-shengjiu.wang@nxp.com>
 <20201012190037.GB17643@Asurada-Nvidia>
 <CAEnQRZBrXNgMDNgQ=dMJfZQpZvdq6sUx2y21_fuk9teRd5UM0Q@mail.gmail.com>
In-Reply-To: <CAEnQRZBrXNgMDNgQ=dMJfZQpZvdq6sUx2y21_fuk9teRd5UM0Q@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 13 Oct 2020 18:49:25 +0800
Message-ID: <CAA+D8AOCR+Hvq9K=LjbaPW0jJB+00nFORahErWyJJJr0LVUq4g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Add support for higher sample rates
To: Daniel Baluta <daniel.baluta@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
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

On Tue, Oct 13, 2020 at 6:42 PM Daniel Baluta <daniel.baluta@gmail.com> wrote:
>
> On Tue, Oct 13, 2020 at 12:29 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > Hi Shengjiu,
> >
> > On Mon, Oct 12, 2020 at 04:49:42PM +0800, Shengjiu Wang wrote:
> > > Add 88200Hz and 176400Hz sample rates support for TX.
> > > Add 88200Hz, 176400Hz, 192000Hz sample rates support for RX.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> >
> > Probably should put your own Signed-off at the bottom?
>
> Hi Shengjiu,
>
> Also please keep the original author of the patch. You can change that
> using git commit --amend --author="Viorel Suman <viorel.suman@nxp.com>".

Actually I combined my commit with viorel suman's commit to one commit,
not only viorel suman's.


>
> With that,
>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
