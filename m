Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B26489D4B
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 17:16:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E7C0189F;
	Mon, 10 Jan 2022 17:15:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E7C0189F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641831363;
	bh=gum2lfvyoQmjgqzm5COiYQQfpwaz08dN6szFyTDhuHU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IKPmXr2BKoMqpYG2jc4bozsPzY7DBvkIZ9K9pdHCquNkZr/PNDNc5K8np71+kpNf+
	 X6w7zgL07yGgeKL42dVQqDBu/WuYsgzfy43xilFHZM7ISHlcfqUVhPkoLk7UK+TH1/
	 C8OdkGDVL2DuVWHqdMSOtpPUZrZ45Z+DjaW6T74k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0192EF80134;
	Mon, 10 Jan 2022 17:14:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C29FF8012E; Mon, 10 Jan 2022 17:14:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 015ACF80054
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 17:14:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 015ACF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PPwLgLih"
Received: by mail-yb1-xb31.google.com with SMTP id h14so21959702ybe.12
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 08:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NfameUlI3NFh/eiKlVIDlcLQ1LgxydYWfgkxIKQRh5o=;
 b=PPwLgLihBu75oNCWTPz+GduJZam/VEGHjtYHz+0uIGEqYKAZr4m2zYRtMuieVGkmyn
 /1jdQxVtEoLkrJ+mYPIPKEWeWoHyNQYSScXtzY+TFNBDUFJO59/WC1pO8Oq9YF+4vAFH
 nDhHpfhxfFW+Y/uIsBl5ZM03bAzp7aWVcPx6qUYJYUh9MKBtiFAt5XnZOWqbcj/5NX2H
 NIrnQgBxkUQfCkx/zwSgW23rH9jGxC0Loxr+1SGEjca3aQPa0YTHn/8jsauqZ84kfwsg
 /5qUNfD7awWHxtbiea2tXYqR2ALlhz6K6rvBwNdaI37OZmP9RwzNhtA396ix/qJKZhf+
 YLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NfameUlI3NFh/eiKlVIDlcLQ1LgxydYWfgkxIKQRh5o=;
 b=zSONMfkWQfVJErcs/kTyshYEYH+HImgs80lilmJXgjYABsFR8rABUu/5T08arl72iz
 hdm5gWFI33OkNN0ZxUS+NhsORGTfe19M/S2QWtUXQLBLM3r5gONyC/U/8XJi9xfCguO+
 0H8ON/Y3eU/T6FFwclRLI/2UH4o1LQ88YYbBxrkBBKmAY98htXn+piXDCyxFBe+LHiep
 ZUmWcMnaLMqqh8ge4wDqd+gYU/6ubC0StLVAQueAyiXVKY+n1RkmfjnTF3e0rQG6fjRp
 U6JyED0k83GhIDCxxLCc0+O58XYFeFktoOyVJAEG81Fh3fKg/7y6NiySbM7aurQwfNWe
 nH+A==
X-Gm-Message-State: AOAM5308zYFleGvS9ghOefHStPSzGk18SIM/z3xdcZAt978UgV1lB4HS
 uAwTnjEv4Vp3uI/LkcGDSEDp0U+tgOo1dnaeDcc=
X-Google-Smtp-Source: ABdhPJyKfH/4O1OUHcYGewLnhey7GOxbVTJRPNmaBEICFXi3X1R7yyrGCU9Yb05npdXjQdg7GiCtybY5Ce/CDrz5FD0=
X-Received: by 2002:a25:254d:: with SMTP id l74mr313553ybl.669.1641831284833; 
 Mon, 10 Jan 2022 08:14:44 -0800 (PST)
MIME-Version: 1.0
References: <20220110094711.8574-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220110094711.8574-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YdxMT02wvvWw85Bn@sirena.org.uk>
In-Reply-To: <YdxMT02wvvWw85Bn@sirena.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 10 Jan 2022 16:14:19 +0000
Message-ID: <CA+V-a8svCAMm_zsujMEzyZ2gdWu4y_DumRsQNK6sL9re_rGurw@mail.gmail.com>
Subject: Re: [PATCH 5/5] ASoC: sh: rz-ssi: Add functions to get/set substream
 pointer
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Pavel Machek <pavel@denx.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Takashi Iwai <tiwai@suse.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, LKML <linux-kernel@vger.kernel.org>
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

Hi Mark,

Thank you for the review.

On Mon, Jan 10, 2022 at 3:10 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Jan 10, 2022 at 09:47:11AM +0000, Lad Prabhakar wrote:
>
> > +static struct snd_pcm_substream *rz_ssi_get_substream(struct rz_ssi_stream *strm)
> > +{
> > +     struct rz_ssi_priv *ssi = strm->priv;
> > +     struct snd_pcm_substream *substream;
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&ssi->lock, flags);
> > +     substream = strm->substream;
> > +     spin_unlock_irqrestore(&ssi->lock, flags);
>
> This locking doesn't seem useful, we just take a copy of the lock and
> then immediately return so the lock isn't protecting anything in
> particular - the caller can happily continue using the substream after
> the variable has been updated.
>
Ok will drop the locking from get function.

Cheers,
Prabhakar
