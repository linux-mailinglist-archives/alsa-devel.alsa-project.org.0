Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3729E3D1A7F
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 01:43:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B09C216A6;
	Thu, 22 Jul 2021 01:42:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B09C216A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626910993;
	bh=3X8kk4yAsTW/ZbceRrZpSLdKxDyN0e8h3EdaxpoqQKc=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ITLQYPiVVslFmLAb5mQiSY2u6/W7YTm0lZbYBBrMyPh/7hLgsXYnHoHQXVBRr/DXy
	 bm4YdALozfhCf73C+F17EqfORwGnrJr/yveCDhl/NyT1AZIt/IsVO37DcgavVjE9j4
	 xAiB0GW4OL6EQecykUjQ2lU+/GcdGX9RE4lC9zeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32555F804AD;
	Thu, 22 Jul 2021 01:41:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE8FFF804AC; Thu, 22 Jul 2021 01:41:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CEFBF80143
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 01:41:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CEFBF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="nHhfQ/U5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=EkbZ37M1zbAFLUeh4qRhcCU60o/TER6flB3lXLbSYvM=; b=nHhfQ/U5o8gL8SNfLShnFX4IB8
 TseWPzfBGXpCOufu5sOQLD/sH4brYkgm4/shZ7QHqQ0BmDPo1arwCSLRFHwUNZUR7x0HqBsTWvsq8
 71u4+rLmC30rbq72grG3mRK0CbgIt/TEBxn2Vqr/ECYtb+M5S55/x6AQHoiifHQ0NOw0=;
Received: from [10.8.10.223]
 by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <puleglot@puleglot.ru>)
 id 1m6LqP-0005mY-6i; Thu, 22 Jul 2021 02:41:39 +0300
Message-ID: <93d894d40114308660f5800b30c29071d33afb61.camel@tsoy.me>
Subject: Re: mic not working on JBL Quantum series USB headsets
From: Alexander Tsoy <alexander@tsoy.me>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Jul 2021 02:41:38 +0300
In-Reply-To: <e52e42ccfd48c51132c925b3d4f34d54@ufiseru.cz>
References: <c95dd9ae3e38b8a9965785b6f2b94bcca8df21ea.camel@tsoy.me>
 <53ec08048f961a8a2564556e0daa78f0@ufiseru.cz>
 <e52e42ccfd48c51132c925b3d4f34d54@ufiseru.cz>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jakub =?UTF-8?Q?Fi=C5=A1er?= <jakub@ufiseru.cz>
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

В Ср, 21/07/2021 в 22:53 +0000, Jakub Fišer пишет:
> ....
> 
> > + REG_QUIRK_ENTRY(0x0ecb, 0x203e, 2), /* JBL Quantum 800 */
> 
> I think this is needed for the whole JBL Quantum headset product
> line with USB connection according to what people have been
> reporting so far.
> 
> I'm not familiar with the brand but from what I can tell, this 
> only includes models 300, 400, 600, 800 and "One" where 600 and
> 800 are wireless via USB dongle and the others are wired USB.
> 
> As far as I can tell all of the above except 300 have two outputs.
> Might be relevant according to what you said:

I can confirm that Quantum 400 (0ecb:2039) and Quantum 600 (0ecb:1f46)
also need this quirk. Quantum 300 should work just fine without any
quirks (all according to publicly available lsusb outputs).

