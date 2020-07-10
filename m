Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E2621B4DC
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 14:17:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E52031616;
	Fri, 10 Jul 2020 14:16:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E52031616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594383423;
	bh=nd4IPg08C9BPVxbLhoGM0RYE6qNWp8XTCe52jV6+gA4=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XDqhgreGPIrQ/tGTZxIMQgftWAyNq2XEn9BBHUcJmh7Nnw8qlVZAjNOmq7IWAOq17
	 6tQYg7THdIoBMdnZsfNaGhGjj8Xn8OUJUkzlfxVDnydR9pIkV2OAm7jyrZgrMV/wLW
	 1hNdhtR8tEkeS+dnf0BVa/Q0trVcS4gxD6L7hu0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E77BDF8015C;
	Fri, 10 Jul 2020 14:15:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 915B2F8015A; Fri, 10 Jul 2020 14:15:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BD3CF80112
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 14:15:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BD3CF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="NOhO54DI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=OhiI8yraeH7GEOlj0APWEU84wEkFnnBv6aI7P/byAxY=; b=NOhO54DIuLsEzeueneXvLLgTCv
 09iAWKjCpZyCO8HsPQ5525LXfDNkQ/60YWuMdf/5+oBMB+wvQuk0hPjSSdHaGLGJFo+08Gg8b2Y/p
 2fOiGxX4RSpD61H81VYi6KF4mZslEWJuTRxnfbfComn80MMmzkIG07/F+TQJVOrdSyhQ=;
Received: from [10.8.11.2] (helo=work)
 by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93.0.4) (envelope-from <puleglot@puleglot.ru>)
 id 1jtrvm-00085e-1A; Fri, 10 Jul 2020 15:15:06 +0300
Message-ID: <98b1ba96fca2c6e1a90ce4120b3f3201a3cefd43.camel@tsoy.me>
Subject: Re: Beginning 5.8rc1 kernel USB headsets (ASUS ROG Delta and HyperX
 Cloud Orbit S) play sound as if in slow-motion.
From: Alexander Tsoy <alexander@tsoy.me>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, Linux List Kernel
 Mailing <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org
Date: Fri, 10 Jul 2020 15:15:04 +0300
In-Reply-To: <CABXGCsN2-TTemU8JOnh3YErxe2GH7xtG+EZrF9gn_JWLmMxRag@mail.gmail.com>
References: <CABXGCsN2-TTemU8JOnh3YErxe2GH7xtG+EZrF9gn_JWLmMxRag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 
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

В Пт, 10/07/2020 в 10:46 +0500, Mikhail Gavrilov пишет:
> Beginning 5.8rc1 (git 69119673bd50) kernel USB headsets (ASUS ROG
> Delta and HyperX Cloud Orbit S) play sound as if in slow-motion.
> 
> And in 5.8rc4 (git dcde237b9b0e) this still not fixed yet.
> The bisecting is problematic because rc1 also has another issue
> https://lkml.org/lkml/2020/6/22/21 which completely breaks the sound
> subsystem.
> If anyone said how to fix https://lkml.org/lkml/2020/6/22/21 I can
> bisect this issue.

You've probably hit this bug:
https://bugzilla.kernel.org/show_bug.cgi?id=208353

