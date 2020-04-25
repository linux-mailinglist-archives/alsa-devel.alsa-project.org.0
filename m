Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9521B8925
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Apr 2020 21:51:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5B1B1699;
	Sat, 25 Apr 2020 21:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5B1B1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587844315;
	bh=Iah7NzvvP78PEh9xc8EErNqk9po2mM571mhlPZvbSOU=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iHcSA30orNs07ngcGgd1N4/ZPObQ731C1xq/7e6GJsWzpMF0NHvfv9h4N2ZcRfQy1
	 IhT9oAT6h02eA43zdq/1gUIUt+psgvgtRF79h3dG/E1wIY5BThHSQdCPH6zuxbJk9h
	 hZe+SNCpy4B6ZGG/UAFD8Jc4VDNvuG/eIfjwsVFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0FF5F801ED;
	Sat, 25 Apr 2020 21:50:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 892A2F801EC; Sat, 25 Apr 2020 21:50:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D041F800BE
 for <alsa-devel@alsa-project.org>; Sat, 25 Apr 2020 21:50:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D041F800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="ER7sVoBH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=PdHfeMhdI6LefoDwV2wr9bakCsX2dwQfvdJDJFucAPk=; b=ER7sVoBHlXA5vlDjv5CF76N96Y
 iv6doJflQ7nG5Zinm0lN1JLBGmbx1zTo6p4brEuoQo5kCyjqbqEJ8vknZDWtSiHMY/I424RNg7cL9
 pq+ndD87tpkNQuRK7qWhsmVlDJxNiHFji9kZTKYzQShgfJVrW+rYvUIopcOtC8+o5jjc=;
Received: from [2a00:1370:8125:3f98:890:f100:d37d:7ada] (helo=home)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1jSQoO-0009Dl-2o; Sat, 25 Apr 2020 22:50:04 +0300
Message-ID: <253259a4ef8a2bcfa0568982b8fd23d5e2d0937a.camel@tsoy.me>
Subject: Re: High-bandwidth/multiple transactions per microframe in usb audio?
From: Alexander Tsoy <alexander@tsoy.me>
To: Pavel Hofman <pavel.hofman@ivitera.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Date: Sat, 25 Apr 2020 22:50:03 +0300
In-Reply-To: <3a44ca23-f0ed-af54-3e63-8bf77d833c8f@ivitera.com>
References: <ee53ad0d-2d61-545b-7afd-64a5ed37c702@ivitera.com>
 <548c8312bd8ad65993c3169faf30054fdfa83558.camel@tsoy.me>
 <3a44ca23-f0ed-af54-3e63-8bf77d833c8f@ivitera.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

В Сб, 25/04/2020 в 20:06 +0200, Pavel Hofman пишет:
> Dne 25. 04. 20 v 14:06 Alexander Tsoy napsal(a):
> > В Пт, 24/04/2020 в 11:42 +0200, Pavel Hofman пишет:
> > > Hi,
> > > 
> > > Please does the current USB audio driver support multiple
> > > transactions
> > > per microframe (high-bandwidth mode)? I could not find it in
> > > endpoint.c
> > > but it may be there or somewhere else :-)
> > 
> > This should be transparent for the driver. See usb_submit_urb()
> > function from drivers/usb/core/urb.c. It allows packets larger than
> > 1024 for isochronous transfers over High Speed and Super Speed
> > buses.
> 
> Alexander, thanks a lot for the info and hint, indeed at
> https://github.com/torvalds/linux/blob/master/drivers/usb/core/urb.c#L444
> 

And I just noticed that USB-audio driver can't properly parse max
packet size for SuperSpeed and SuperSpeed+ devices yet. See
audio_format_alloc_init().

