Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 036251B1A48
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 01:49:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91EC6168B;
	Tue, 21 Apr 2020 01:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91EC6168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587426548;
	bh=+SX1UcAZ1hUlNZ11O9qjSn2qodDwaIg5qOT/O2Ey7/I=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=izNx6MkV6/HN9hAKVGqSak/6WEigu8kpN4IHyxjGIXKruK+GRYe7YVDwQAuRsj0X4
	 Dh9Fxp7qRsqSdNQyo1W5HI2yJ26cG784IXu0HQLM2jdJlkkRqbE0MH/Gd8DAHpkcDO
	 44z3Yu0oALdt/zZwa0v3tnFLQgeq/I9xACI9fbP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B70E0F800E7;
	Tue, 21 Apr 2020 01:47:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D50E0F801D9; Tue, 21 Apr 2020 01:47:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 218CCF800E7
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 01:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 218CCF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="n47eY79P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=2TEEWI9XLn5p0bcJKmRvNR+plNh0vjLKLOHSa3niukE=; b=n47eY79Pd1xGVVSZDl5bHbeR5j
 /Q937N5cTnKp+y8gv1U0mWyywvVpiUozko0l6SWQjYGMLmUsI7oKNWGgfXa9VAA2ErUUGtXNFqyer
 F9fxWsk1EsOcyX3LPRls/SDlbPUolKUXquKqoI2ekX3jS2DIoVpGkzU31w5A4kwGzWMA=;
Received: from [2a00:1370:8125:3f98:890:f100:d37d:7ada] (helo=home)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1jQg83-0006yq-S9; Tue, 21 Apr 2020 02:47:08 +0300
Message-ID: <b866b95dc3f9f92665c7826262b627ecc18ebf74.camel@tsoy.me>
Subject: Re: [PATCH v2] ALSA: usb-audio: Add quirk for Focusrite Scarlett 2i2
From: Alexander Tsoy <alexander@tsoy.me>
To: Gregor Pintar <grpintar@gmail.com>, tiwai@suse.com, perex@perex.cz
Date: Tue, 21 Apr 2020 02:47:05 +0300
In-Reply-To: <20200420214030.2361-1-grpintar@gmail.com>
References: <1c4b8a362761421eba0ded60bb4f0e11b7e42f3b.camel@tsoy.me>
 <20200420214030.2361-1-grpintar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

В Пн, 20/04/2020 в 23:40 +0200, Gregor Pintar пишет:
> Force it to use asynchronous playback.
> 
> Same quirk has already been added for Focusrite Scarlett Solo (2nd
> gen)
> with a commit 46f5710f0b88 ("ALSA: usb-audio: Add quirk for Focusrite
> Scarlett Solo").
> 
> This also seems to prevent regular clicks when playing at 44100Hz
> on Scarlett 2i2 (2nd gen). I did not notice any side effects.
> 
> Moved both quirks to snd_usb_audioformat_attributes_quirk() as
> suggested.
> 
> Signed-off-by: Gregor Pintar <grpintar@gmail.com>

Thank you!

Reviewed-by: Alexander Tsoy <alexander@tsoy.me>

