Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 070794C9F8D
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:43:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A75001DE7;
	Wed,  2 Mar 2022 09:42:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A75001DE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210614;
	bh=4FYmPbuF1WCNgDyvMXupZYOEyWGX3bEBh0rpbA2d/n8=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vktgcroOK4Bg9M1q9MMjaSeYw1EIfx/az/JG2UYL0kiKKCpEXV1o1BU+RRVQkZIyT
	 70CpSkycJQy1LPy5CKnAIfOZ34UrIl6iviiecrLbbmYzAgri/ScEG/cqCWZhFqOMG2
	 MH2tjccvQxYwLpi33xdS8Jgbs13TF7a7tdON/yAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19A88F805ED;
	Wed,  2 Mar 2022 09:33:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8842F8013C; Mon, 28 Feb 2022 13:03:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85943F80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 13:03:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85943F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="puET9FaE"
Received: by mail-ej1-x62e.google.com with SMTP id vz16so24371506ejb.0
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 04:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=m/mYa1XqvvHLfnL3BOoOqYDa1ViNV7MB47waZKIycw0=;
 b=puET9FaE+iPLWSLHaH0Jc15P7LML3ILv/CtQc1xDRlDOvchBnePGr3CpZ8iNTFg26S
 MvdmzyKLao5C/5rXrSzR7jzTPZ0Yuj+7M+cqDE4eOMJCgAt9uraXgTEJwynFkzni1Fvy
 Vjo1HNa/jUOUFI/CmrkLVTegwpA5o7Cf0wR8qBn5y2xARegC4rz7JN5F70qSFE936vyK
 a6/WQ787WIaZ7lFx0I/tSaiXwe3z6FIrVBWdIQkzq0oVXXDZs7cCv56cl8qPmZ4RxzRI
 sP+DHiZk3rxPTft7o6PkfUdJMVZiSNaECaj+ljhYu978P5TkgTkfoRd54h/EuhklkuKS
 esTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=m/mYa1XqvvHLfnL3BOoOqYDa1ViNV7MB47waZKIycw0=;
 b=bDY6dTp6l0EcLgEtFwqlq/+GszQlr9Is8rtdjRGYzf+HxKpUZPfSHbP7f9ttua5NfK
 U0w62+jliHjlAtGrCwRzwJWklKpD1+iAn/MjpVBh41mcfQaxecjhnjSHaC0ufJMqaP3Y
 UOX03aXlzZlvRPpmAmQqHRLzUjU59tIzGmDwE9S95OaYM1LwItBPdaIuGMqxxpkJ5Cnl
 Di5f7mXWlHLKRGCf7iYgnElUpEXCd6HBsH3iEPYfgDezl8LQ6k6G7zOhX5MmoLjxvE7j
 WE6uLeJE0Tp3fxKY0wt5z1Jka2FPoWkBAsEK5GNzGOXx/jceh7oeK//effFjQWJwNsUO
 U29Q==
X-Gm-Message-State: AOAM5324uJDnPPyiRxPI2r/sx0iDCE8z6zvG+NM6nBGDVHyiKQ4i1lfc
 xxawuawX8cLmZzRk1Y5Mq1E=
X-Google-Smtp-Source: ABdhPJyPihjoYwx+e9NKg98XvxKCbWi7t13guT1EBLKeJ6QGdK72cKHCeJpX8hRszpc83uJxZ+jQ9w==
X-Received: by 2002:a17:906:d14e:b0:6cd:8d7e:eec9 with SMTP id
 br14-20020a170906d14e00b006cd8d7eeec9mr14944415ejb.28.1646049820086; 
 Mon, 28 Feb 2022 04:03:40 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:957a:1d13:c949:d1f3])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1709060cc900b006ce04bb8668sm4257528ejh.184.2022.02.28.04.03.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Feb 2022 04:03:39 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH 1/6] drivers: usb: remove usage of list iterator past the
 loop body
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <20220228112413.GA2812@kadam>
Date: Mon, 28 Feb 2022 13:03:36 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <E31E215E-C409-40B8-8452-57E70C91484C@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-2-jakobkoschel@gmail.com>
 <20220228112413.GA2812@kadam>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:34 +0100
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 kvm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergman <arnd@arndb.de>, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
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



> On 28. Feb 2022, at 12:24, Dan Carpenter <dan.carpenter@oracle.com> =
wrote:
>=20
> On Mon, Feb 28, 2022 at 12:08:17PM +0100, Jakob Koschel wrote:
>> diff --git a/drivers/usb/gadget/udc/at91_udc.c =
b/drivers/usb/gadget/udc/at91_udc.c
>> index 9040a0561466..0fd0307bc07b 100644
>> --- a/drivers/usb/gadget/udc/at91_udc.c
>> +++ b/drivers/usb/gadget/udc/at91_udc.c
>> @@ -150,13 +150,14 @@ static void proc_ep_show(struct seq_file *s, =
struct at91_ep *ep)
>> 	if (list_empty (&ep->queue))
>> 		seq_printf(s, "\t(queue empty)\n");
>>=20
>> -	else list_for_each_entry (req, &ep->queue, queue) {
>> -		unsigned	length =3D req->req.actual;
>> +	else
>> +		list_for_each_entry(req, &ep->queue, queue) {
>> +			unsigned int	length =3D req->req.actual;
>>=20
>> -		seq_printf(s, "\treq %p len %d/%d buf %p\n",
>> -				&req->req, length,
>> -				req->req.length, req->req.buf);
>> -	}
>> +			seq_printf(s, "\treq %p len %d/%d buf %p\n",
>> +					&req->req, length,
>> +					req->req.length, req->req.buf);
>> +		}
>=20
> Don't make unrelated white space changes.  It just makes the patch
> harder to review.  As you're writing the patch make note of any
> additional changes and do them later in a separate patch.
>=20
> Also a multi-line indent gets curly braces for readability even though
> it's not required by C.  And then both sides would get curly braces.
>=20
>> 	spin_unlock_irqrestore(&udc->lock, flags);
>> }
>>=20
>> @@ -226,7 +227,7 @@ static int proc_udc_show(struct seq_file *s, void =
*unused)
>>=20
>> 	if (udc->enabled && udc->vbus) {
>> 		proc_ep_show(s, &udc->ep[0]);
>> -		list_for_each_entry (ep, &udc->gadget.ep_list, =
ep.ep_list) {
>> +		list_for_each_entry(ep, &udc->gadget.ep_list, =
ep.ep_list) {
>=20
> Another unrelated change.
>=20
>> 			if (ep->ep.desc)
>> 				proc_ep_show(s, ep);
>> 		}
>=20
>=20
> [ snip ]

Thanks for pointing out, I'll remove the changes here and note them down
to send them separately.

>=20
>> diff --git a/drivers/usb/gadget/udc/net2272.c =
b/drivers/usb/gadget/udc/net2272.c
>> index 7c38057dcb4a..bb59200f1596 100644
>> --- a/drivers/usb/gadget/udc/net2272.c
>> +++ b/drivers/usb/gadget/udc/net2272.c
>> @@ -926,7 +926,8 @@ static int
>> net2272_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>> {
>> 	struct net2272_ep *ep;
>> -	struct net2272_request *req;
>> +	struct net2272_request *req =3D NULL;
>> +	struct net2272_request *tmp;
>> 	unsigned long flags;
>> 	int stopped;
>>=20
>> @@ -939,11 +940,13 @@ net2272_dequeue(struct usb_ep *_ep, struct =
usb_request *_req)
>> 	ep->stopped =3D 1;
>>=20
>> 	/* make sure it's still queued on this endpoint */
>> -	list_for_each_entry(req, &ep->queue, queue) {
>> -		if (&req->req =3D=3D _req)
>> +	list_for_each_entry(tmp, &ep->queue, queue) {
>> +		if (&tmp->req =3D=3D _req) {
>> +			req =3D tmp;
>> 			break;
>> +		}
>> 	}
>> -	if (&req->req !=3D _req) {
>> +	if (!req) {
>> 		ep->stopped =3D stopped;
>> 		spin_unlock_irqrestore(&ep->dev->lock, flags);
>> 		return -EINVAL;
>> @@ -954,7 +957,6 @@ net2272_dequeue(struct usb_ep *_ep, struct =
usb_request *_req)
>> 		dev_dbg(ep->dev->dev, "unlink (%s) pio\n", _ep->name);
>> 		net2272_done(ep, req, -ECONNRESET);
>> 	}
>> -	req =3D NULL;
>=20
> Another unrelated change.  These are all good changes but send them as
> separate patches.

You are referring to the req =3D NULL, right?

I've changed the use of 'req' in the same function and assumed that I =
can
just remove the unnecessary statement. But if it's better to do =
separately
I'll do that.

>=20
>> 	ep->stopped =3D stopped;
>>=20
>> 	spin_unlock_irqrestore(&ep->dev->lock, flags);
>=20
> regards,
> dan carpenter

thanks,
Jakob Koschel

