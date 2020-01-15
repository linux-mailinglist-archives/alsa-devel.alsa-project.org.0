Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA8E141CCD
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jan 2020 08:18:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E95551687;
	Sun, 19 Jan 2020 08:17:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E95551687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579418290;
	bh=T2t6PhpUZri/rkYgmxLWtl5GRR4n6FvAqzl5gRJcMT4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dmhahys53ftvIrdsWvYm/ylw9ioPCzp0pGYbQdTrVYMTNU6puvetSm/O2QJ5fVHTq
	 XkU1o0KOVvvCJwcPsnRPHBger7f7BVjszkx4CH+qmGqqKMyLU6iAvRl3j0+8sQC+VV
	 xroqdxsE9/j1bNaCYin2fxSNAs3uUKjdPnmhl1cY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AED7DF80277;
	Sun, 19 Jan 2020 08:14:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80327F801EB; Wed, 15 Jan 2020 12:59:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BA14F800B9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 12:59:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BA14F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ojab.ru header.i=@ojab.ru
 header.b="PwY/Bc8f"
Received: by mail-ua1-x936.google.com with SMTP id 1so6125928uao.1
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 03:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ojab.ru; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DArzIhU8m++zFNPlrYirPu8TNs6GQFpeoPQC5biLcH4=;
 b=PwY/Bc8fOxbtrgp+zqerYyr604/IQ/43F8vt5buM4ztFIotMMe5Oq+mxtkwv5qSkqX
 Cbi/81Vs94bWdAfF73Y7RqeGaI7SZ7SNK7rKI9jnfVD0ZMNJfPfJxpACBNNmorGUP/zo
 MDWSPBzEyS4DhCq/C4R7kDq/pJ0qjEJPZKRaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DArzIhU8m++zFNPlrYirPu8TNs6GQFpeoPQC5biLcH4=;
 b=L8iNKeWYgGkAhGu3VxR3YzUvjqlp50e3yZu4cqKMFRmH6Dg9RLgnSDlFTjq+nl/t1Q
 YiMxf7f2bosKVzeKupWc5SZOfEwyzlj/jzM74b85Qzj+LmEH+Wz5C0mZd4Zq1yLi/EX9
 U8gpDKBEWAg820HGy8Gp58IC+kLF3hihwf1QZx6qldkMyw2n3LpSeojcpzP2mWp6nRDH
 mJjTtSvk4VDZI6GqArNSLerHBpjYj0Xz3My8NOWuQBbMqH5nP7QCmjtk5+6JFYPbJFTy
 uqMBBrhHGmPOOPA9mzIVuFXqbHHMT3CLeltzeTiL24kvg5e4Cb+Y+ul4PM4sLftFfw6V
 fbRQ==
X-Gm-Message-State: APjAAAXSa3jx34RuP3YOP3iwavSviodHZUZiLqct2McfkK9Dj0+4Z5kv
 8qlMTGFAef1gxMqCoA74S0YHmBrdSMwGqn5eDxV8pg==
X-Google-Smtp-Source: APXvYqw/iuqg/JpW5XEbRwPt5czCnp9gYR6mrfnW1rhue5EO6l6w/SvzYLdrLMRaZ1eQT0C9rTKHoaW5MgUcG6Pn5J0=
X-Received: by 2002:ab0:60ba:: with SMTP id f26mr14307601uam.51.1579089563194; 
 Wed, 15 Jan 2020 03:59:23 -0800 (PST)
MIME-Version: 1.0
References: <CAKzrAgTD2oeyajKGOaPea98vZ-uKJOn6uOqABA+CKtpvYpWYvQ@mail.gmail.com>
 <CAKzrAgTCE4btXr04pkvLUG6PPbtn9dm5h_9rjqDYG0HrTZ0zbg@mail.gmail.com>
 <87h80x8t41.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h80x8t41.wl-kuninori.morimoto.gx@renesas.com>
From: "ojab //" <ojab@ojab.ru>
Date: Wed, 15 Jan 2020 14:59:12 +0300
Message-ID: <CAKzrAgSwD54-8J7G5DtRqQpP2ZVO1WLGvd9NvVbFR5D_yGvOOQ@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
X-Mailman-Approved-At: Sun, 19 Jan 2020 08:13:54 +0100
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] No sound since 5.4 on skl_n88l25_s4567
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

On Wed, Jan 15, 2020 at 3:23 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> I guess your kernel is telling some message like this ?
>
>         ASoC: no dapm match for %s --> %s --> %s

No such entries on both 5.3 & 5.4 kernels, but I hope needed dmesg
excerpts can be found in alsa-info.sh output.

//wbr ojab
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
