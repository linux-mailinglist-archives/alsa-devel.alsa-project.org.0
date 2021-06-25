Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAA73B49AD
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Jun 2021 22:09:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5FAD167B;
	Fri, 25 Jun 2021 22:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5FAD167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624651743;
	bh=NlrfNtc194UlEd/q110C08hY9M4sajBezN97jjTWyY0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RoDX9BBAhgoE4/x2PLRopggP+oH99o/xXAzRLp6CYFQOdZuOHDNNtMeMi9CiUqx2a
	 CrwA2RcoP9/koDMNyGCQjifRYTB2DwtIkECfWmSpd+zndkplpHgBVNQgHt+Bvb7VrJ
	 ZdnoG7SsXg6+9z8SxaYaEg7+zaMpaJCiuHqOrOUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4670F80290;
	Fri, 25 Jun 2021 22:08:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E2CAF80245; Fri, 25 Jun 2021 22:08:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F62BF8016D
 for <alsa-devel@alsa-project.org>; Fri, 25 Jun 2021 22:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F62BF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i1Qf5Nyv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A69761960;
 Fri, 25 Jun 2021 20:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624651683;
 bh=NlrfNtc194UlEd/q110C08hY9M4sajBezN97jjTWyY0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i1Qf5Nyvau5r1xhbMEMCySZ+xdDEQAEVe/I9EQYmz1aGUxT9Zs4a9bj3PAa+5h3T7
 XGmgELeyxdj+RJK5ERNBChniycSKC7UIyE7y0VYk+eVuAUE7OMU6M9Ji4Wqnyk0brk
 670xDGSHV+dnjBclobYlkImMCCfGta1JGVKHTCZQrgqhvqJ+hT4vPN6KMCOLUb9mvK
 GKedY5RA90OA41ZNb7KcCGr2+aKFrQNJWIKdqxoF7RS6NAl5Z9orNcDRSweB+xSjrz
 +2K9OkKfM2cfyjEj/ZFeAh9uMmdDnm+SAMgGfQAx5Ve/TF1KawhLzygZ3mLfO4USat
 uLJ2sb6CwkjSg==
Date: Fri, 25 Jun 2021 13:08:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Geoffrey D. Bennett" <g@b4.vu>
Subject: Re: [PATCH v2] ALSA: usb-audio: scarlett2: Fix for loop increment in
 scarlett2_usb_get_config
Message-ID: <YNY3oF3RkbZRk2Ri@Ryzen-9-3900X.localdomain>
References: <s5heecql74j.wl-tiwai@suse.de>
 <20210625175418.2019892-1-nathan@kernel.org>
 <20210625184342.GA23780@m.b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625184342.GA23780@m.b4.vu>
Cc: clang-built-linux@googlegroups.com, alsa-devel@alsa-project.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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

On Sat, Jun 26, 2021 at 04:13:42AM +0930, Geoffrey D. Bennett wrote:
> On Fri, Jun 25, 2021 at 10:54:19AM -0700, Nathan Chancellor wrote:
> > Clang warns:
> > 
> > sound/usb/mixer_scarlett_gen2.c:1189:32: warning: expression result
> > unused [-Wunused-value]
> >                         for (i = 0; i < count; i++, (u16 *)buf++)
> >                                                     ^      ~~~~~
> > 1 warning generated.
> > 
> > It appears the intention was to cast the void pointer to a u16 pointer
> > so that the data could be iterated through like an array of u16 values.
> > However, the cast happens after the increment because a cast is an
> > rvalue, whereas the post-increment operator only works on lvalues, so
> > the loop does not iterate as expected. This is not a bug in practice
> > because count is not greater than one at the moment but this could
> > change in the future so this should be fixed.
> > 
> > Replace the cast with a temporary variable of the proper type, which is
> > less error prone and fixes the iteration. Do the same thing for the
> > 'u8 *' below this if block.
> > 
> > Fixes: ac34df733d2d ("ALSA: usb-audio: scarlett2: Update get_config to do endian conversion")
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1408
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > 
> > v1 -> v2:
> > 
> > * Use temporary variables of proper type rather than casting, as
> >   requested by Takashi. I did not include Geoffrey's ack for this
> >   reason.
> > 
> > * Mention that there is not a bug at the moment per Geoffrey's comment.
> > 
> >  sound/usb/mixer_scarlett_gen2.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
> > index fcba682cd422..b13903bed330 100644
> > --- a/sound/usb/mixer_scarlett_gen2.c
> > +++ b/sound/usb/mixer_scarlett_gen2.c
> > @@ -1177,17 +1177,22 @@ static int scarlett2_usb_get_config(
> >  	const struct scarlett2_config *config_item =
> >  		&scarlett2_config_items[info->has_mixer][config_item_num];
> >  	int size, err, i;
> > +	u8 *buf_8;
> >  	u8 value;
> >  
> >  	/* For byte-sized parameters, retrieve directly into buf */
> >  	if (config_item->size >= 8) {
> > +		u16 *buf_16;
> > +
> 
> I would prefer that the u16 *buf_16 declaration above be removed from
> there...
> 
> >  		size = config_item->size / 8 * count;
> >  		err = scarlett2_usb_get(mixer, config_item->offset, buf, size);
> >  		if (err < 0)
> >  			return err;
> > -		if (size == 2)
> > -			for (i = 0; i < count; i++, (u16 *)buf++)
> > -				*(u16 *)buf = le16_to_cpu(*(__le16 *)buf);
> > +		if (size == 2) {
> > +			buf_16 = buf;
> 
> ...and combined with the assignment here, like: u16 *buf_16 = buf;

Thanks for pointing it out, I was not paying enough attention to realize
that the scope could be reduced. v3 sent with your Ack added, thank you
for taking a look in a quick manner!

Cheers,
Nathan

> Regardless:
> 
> Acked-by: Geoffrey D. Bennett <g@b4.vu>
> 
> And, thanks again!
> 
> > +			for (i = 0; i < count; i++, buf_16++)
> > +				*buf_16 = le16_to_cpu(*(__le16 *)buf_16);
> > +		}
> >  		return 0;
> >  	}
> >  
> > @@ -1197,8 +1202,9 @@ static int scarlett2_usb_get_config(
> >  		return err;
> >  
> >  	/* then unpack from value into buf[] */
> > +	buf_8 = buf;
> >  	for (i = 0; i < 8 && i < count; i++, value >>= 1)
> > -		*(u8 *)buf++ = value & 1;
> > +		*buf_8++ = value & 1;
> >  
> >  	return 0;
> >  }
> > 
> > base-commit: 0cbbeaf370221fc469c95945dd3c1198865c5fe4
> > -- 
> > 2.32.0.93.g670b81a890
> > 
