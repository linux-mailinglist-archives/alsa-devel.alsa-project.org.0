Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 653CC1B5D2E
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 16:03:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 059161699;
	Thu, 23 Apr 2020 16:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 059161699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587650596;
	bh=H/xNkZnlKTiyhTmXuNItU7Ts21uaGJEFHwnQzxf4T8A=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YfX1s5+InsRr33eDAQoA0NasHmcFAdUPWYzudYJ7ge88ffsMdtSDkfv7OL1p01Pmb
	 5ZbgRbfUxjolDA03sJtIGzR3c3/eS/cUBIwmSLdgwxaZR4tkmM2pSFjl7+86iMouOk
	 AmkguyklgpIRYNI2hFRpduL/IojXrMXy9YvkBZ5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E365F800FF;
	Thu, 23 Apr 2020 16:01:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23F7CF801EC; Thu, 23 Apr 2020 16:01:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EB79F800FF
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 16:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EB79F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="W7XzUxgb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=5myVIBjZuCy7gYPpvVrJvklgvSDlFod0tcdAhJpLR5E=; b=W7XzUxgbotytZYsAchRYzMzisL
 2n7NDnyqPchHX+9vNTsaBKqVqDq6A/L2Pfn7mCXqgsMXtNN1Tss+dr88eSuI47RaxXA8NmQJkYcVS
 UmdQrARIPBzFrRKBmrrkomMlBlKpp/hXt7nqgt/qheUpAbnMbrkk4M9Db1LGUu/24WJU=;
Received: from [2a00:1370:8125:3f98:890:f100:d37d:7ada] (helo=home)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1jRcPu-0001mu-KH; Thu, 23 Apr 2020 17:01:26 +0300
Message-ID: <b041b57be02dabb4c434ea46bcc398c132d129dc.camel@tsoy.me>
Subject: Re: [PATCH] ALSA: usb-audio: Apply async workaround for Scarlett
 2i4 2nd gen
From: Alexander Tsoy <alexander@tsoy.me>
To: Gregor Pintar <grpintar@gmail.com>
Date: Thu, 23 Apr 2020 17:01:25 +0300
In-Reply-To: <20200423114656.2803-1-grpintar@gmail.com>
References: <c0cb78664e3acd94f07e59f3a4216c16ab9f497d.camel@tsoy.me>
 <20200423114656.2803-1-grpintar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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

В Чт, 23/04/2020 в 13:46 +0200, Gregor Pintar пишет:
> On Thu, 23 Apr 2020 Alexander Tsoy wrote:
> > OK, here is a quick hacky patch, that seems to work for me:
> 
> Great, it seems to work for me too (no click recorded in one hour).
> Sennheiser CS60 (adaptive) also still works.

Thanks for testing!

