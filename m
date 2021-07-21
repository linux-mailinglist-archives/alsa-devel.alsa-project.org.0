Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B20B63D17DC
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 22:18:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44EB816A5;
	Wed, 21 Jul 2021 22:17:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44EB816A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626898710;
	bh=pwICeVEDseZyf81YMabOfLtj9z6wS+3SB2jPLgBb3KI=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NeYhVynuJ2aIMw0sekqdfxut5U3LJQTHxyxZaPs+BuUZzVKLflT8t4Zr8eNlVOVJ9
	 pxOe1toWQWoyM9upvAxVC/j2f7EMG3YeiQFRenBfgVs0jyI5dMaR3nGJEKOM8+I3a0
	 Bra3H5nPWjiU74yU5fJ9O3FZ7CaEXX7qUEn8/KRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92F92F804AD;
	Wed, 21 Jul 2021 22:17:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19589F804AC; Wed, 21 Jul 2021 22:17:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B300F80143
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 22:16:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B300F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="Bpo79JOB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=VBQGKs10jIpkJb2GxXlNLxJwDzedYjfKoTL5TAXMzDs=; b=Bpo79JOBz9VKPdFFBWED1qqEFp
 EgXm5qa+aaWGECPBa39NPx3WU8t1rg/MG4osh734LrQX5bXGk1P4TWEvw1TGSxK8IgsssuDy31RZP
 i85zrhnkb336t4Nr+9P9yxv/ZEWgG1GCcr6+hCmBQaBWpD5xcPNxUwgeQ4S/zD0cS2LQ=;
Received: from [10.8.10.223]
 by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <puleglot@puleglot.ru>)
 id 1m6IeC-0005Ux-Lv; Wed, 21 Jul 2021 23:16:51 +0300
Message-ID: <c95dd9ae3e38b8a9965785b6f2b94bcca8df21ea.camel@tsoy.me>
Subject: Re: mic not working on JBL Quantum series USB headsets
From: Alexander Tsoy <alexander@tsoy.me>
To: Jakub =?UTF-8?Q?Fi=C5=A1er?= <jakub@ufiseru.cz>, 
 alsa-devel@alsa-project.org
Date: Wed, 21 Jul 2021 23:16:43 +0300
In-Reply-To: <53ec08048f961a8a2564556e0daa78f0@ufiseru.cz>
References: <53ec08048f961a8a2564556e0daa78f0@ufiseru.cz>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.2 
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

В Вт, 20/07/2021 в 18:00 +0000, Jakub Fišer пишет:
> Hello Alsa people,
> 
> hope this is the right place to post.
> 
> My Quantum 800's microphone doesn't work and I found other reports
> suggesting
> this issue affects the whole Quantum product line.

This device consists of two interfaces. The first interface contains a
single playback endpoint and the second interface contains playback and
capture endpoints. So JBL Quantum probably needs a registration quirk
similar to Kingston HyperX devices. Please try the patch below:

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 8b8bee3c3dd6..f54331892d7a 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1897,6 +1897,7 @@ static const struct registration_quirk registration_quirks[] = {
 	REG_QUIRK_ENTRY(0x0951, 0x16d8, 2),	/* Kingston HyperX AMP */
 	REG_QUIRK_ENTRY(0x0951, 0x16ed, 2),	/* Kingston HyperX Cloud Alpha S */
 	REG_QUIRK_ENTRY(0x0951, 0x16ea, 2),	/* Kingston HyperX Cloud Flight S */
+	REG_QUIRK_ENTRY(0x0ecb, 0x203e, 2),	/* JBL Quantum 800 */
 	{ 0 }					/* terminator */
 };
 


