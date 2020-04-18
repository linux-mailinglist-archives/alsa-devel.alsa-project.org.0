Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0401AF2ED
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 19:45:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35C971665;
	Sat, 18 Apr 2020 19:45:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35C971665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587231958;
	bh=b3A/B+t9baaohPMwQzbqJ1/wNsDJmvMOkUgXkwFDPfY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tPb1G/evf154r3UasrZ5p3elBTrItC5gHRiJRGIVTQmsSBOqCNsb4W0z525L/3pkk
	 S/dEjm+UHcEmuV4HY7T1umxh+A3bxGYSiIvmhaHS3zZGYT9xqQKTVCz3ShmBLHNwa5
	 PADEBmNenNz380v+ff+nUpi3MWLpjCD9ZiWQjFRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46CB0F8014E;
	Sat, 18 Apr 2020 19:44:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDFC3F8014E; Sat, 18 Apr 2020 19:44:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C208F800E7
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 19:44:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C208F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="RF0hdtox"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=WcZvIDUuPOwW9J2fzH+Nm1o0OA9gPHH8vtmmOaMJgeM=; b=RF0hdtoxGr1t/aEnkFF7JIoXhZ
 bdls7XYFSuQ9/Oa9bBotP+bSV3pmBQKRGl6Hwqmfu3dmGYSvETi4UedwPEf5xjsQNUsIJLaljhrNY
 vnHQhNOFbi2Ym3iUztg3yb6rxoGDwTrgctc6VwpZ8I0Jth2vqn7dEh9c+NkNmhtINdRs=;
Received: from [2a00:1370:8125:3f98:890:f100:d37d:7ada] (helo=home)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1jPrVh-00012B-Se; Sat, 18 Apr 2020 20:44:09 +0300
Message-ID: <5d8d351d528862f34a1cd50af3f0a7a681f45947.camel@tsoy.me>
Subject: Re: [PATCH] ALSA: usb-audio: Filter out unsupported sample rates on
 Focusrite devices
From: Alexander Tsoy <alexander@tsoy.me>
To: alsa-devel@alsa-project.org
Date: Sat, 18 Apr 2020 20:44:08 +0300
In-Reply-To: <20200418171908.10402-1-alexander@tsoy.me>
References: <20200418171908.10402-1-alexander@tsoy.me>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Alexey Skobkin <skobkin-ru@ya.ru>
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

В Сб, 18/04/2020 в 20:19 +0300, Alexander Tsoy пишет:
> Many Focusrite devices supports a limited set of sample rates per
> altsetting. This includes interfaces with ADAT ports and interfaces
> with
> dedicated feedback channels:
>  - Scarlett 18i6, 18i8 1st gen, 18i20 1st gen;
>  - Scarlett 18i8 2nd gen, 18i20 2nd gen;
>  - all Scarlett 3rd gen devices (feedback channels works only up to
> 96
>    kHz);

I might be wrong here. It seems that 3rd gen Scarletts other than 18i8
and 18i20 doesn't expose any additional altsettings to limit number of
channels. I'll resend this patch with updated description.

