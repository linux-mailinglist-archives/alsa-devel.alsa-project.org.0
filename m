Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CE41B7BFE
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 18:45:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C98F16C3;
	Fri, 24 Apr 2020 18:45:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C98F16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587746755;
	bh=x8wYLP8hAa5PznsYf/TIOnd/57ue/xTM9UGsqsdRU/U=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j92N5TDMw4ymsoDh60v5K5sZBNDKXp10lzJ/By6L5h+ZOrjLfUxsmVIs3o/BqzA1k
	 Mh3mvdXi4bdlI25pfo0YtTndOendJgXCqNwqcrUvmy0cDIJJNve5HqHlpyH76dsPYD
	 uvz3sLo3yvKzuVj7MQFnhFCBpxawE2hxx6FHF6ac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E752F80121;
	Fri, 24 Apr 2020 18:44:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F498F80142; Fri, 24 Apr 2020 18:44:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5821BF800BE
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 18:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5821BF800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="WIjljSRp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=iy7kKW3KRxN43S6oMkD+6O7aD3qGwVjJqWdNvcqDlXg=; b=WIjljSRpdyt9EaYtUKVL0by5sP
 2m0cLjIvXSSAEz2KvR7LGaFB3IjoCQApoRyhntgj7HRZJqmVWf0lJmobikkUt15cO9rMvcqcEX+QA
 huSXEWcC432GiHiWXhcMqQO5uDCsMgmd7dPgY9Z6msMom/JlutQ3oisVlBEfkb1H8Mx8=;
Received: from [2a00:1370:8125:3f98:890:f100:d37d:7ada] (helo=home)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1jS1Ql-0002RI-Cy; Fri, 24 Apr 2020 19:43:59 +0300
Message-ID: <6eb7b878b82659f7e9b9859186dfe40320402438.camel@tsoy.me>
Subject: Re: [PATCH 1/2] ALSA: usb-audio: Improve frames size computation
From: Alexander Tsoy <alexander@tsoy.me>
To: Gregor Pintar <grpintar@gmail.com>
Date: Fri, 24 Apr 2020 19:43:58 +0300
In-Reply-To: <CAOPXC2kF-k9xH8KhP_s+RmebgTdZW7avn9uedMRAooOB5WhzCA@mail.gmail.com>
References: <20200424022449.14972-1-alexander@tsoy.me>
 <CAOPXC2kF-k9xH8KhP_s+RmebgTdZW7avn9uedMRAooOB5WhzCA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Roope Salmi <rpsalmi@gmail.com>
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

В Пт, 24/04/2020 в 17:02 +0200, Gregor Pintar пишет:
> On Fri, Apr 24, 2020 at 4:24 AM Alexander Tsoy <alexander@tsoy.me>
> wrote:
> > This patch fixes this issue by implementing a different algorithm
> > for
> > frame size computation. It is based on accumulating of the
> > remainders
> > from division fs/fps and it doesn't accumulate errors over time.
> > This
> > new method is enabled for synchronous and adaptive playback
> > endpoints.
> > 
> 
> Hm, I still sometimes get click usually in about first 2 seconds,
> but it is hard to reproduce.

I wonder if it's because the driver doesn't honor wLockDelay. Anyway,
the second patch can be reverted if there are still issues with 2nd gen
Scarletts.

