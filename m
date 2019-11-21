Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 528931054A9
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 15:39:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBEA41772;
	Thu, 21 Nov 2019 15:38:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBEA41772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574347177;
	bh=ELgCA4KYLiuBA2AeXSVx0j+4LRrf8zgDV5x3RFV9jPQ=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rsDRXLBC1P2OutP22ApKM+xXS82OPQKu3zkU/qO0uFb+w4KK4xJwh+8ouBf3C5Jis
	 OQ7GFxcbDvUsMcBKiO7SoFo1XAvw0ZPnX0xTgYX0zuT2bEeIepWu6eXGU7K6993291
	 f39e8WMq8lKnEF37f38jLnU2nCv2MJ+97K2g6UUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34CF0F80146;
	Thu, 21 Nov 2019 15:37:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A17FAF80146; Thu, 21 Nov 2019 15:37:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.lixid.net (lixid.tarent.de [193.107.123.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 197AFF800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 15:37:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 197AFF800C1
Received: from localhost (localhost [127.0.0.1])
 by mail.lixid.net (MTA) with ESMTP id 7409D140B77;
 Thu, 21 Nov 2019 15:37:48 +0100 (CET)
Received: from mail.lixid.net ([127.0.0.1])
 by localhost (mail.lixid.net [127.0.0.1]) (MFA, port 10024) with LMTP
 id 2yf71HB2ip94; Thu, 21 Nov 2019 15:37:48 +0100 (CET)
Received: from tglase-nb.lan.tarent.de (vpn-172-28-0-27.dynamic.tarent.de
 [172.28.0.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.lixid.net (MTA) with ESMTPS id C87F614018F;
 Thu, 21 Nov 2019 15:37:47 +0100 (CET)
Received: by tglase-nb.lan.tarent.de (Postfix, from userid 1000)
 id 5DB9852059C; Thu, 21 Nov 2019 15:37:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by tglase-nb.lan.tarent.de (Postfix) with ESMTP id 5AB09520438;
 Thu, 21 Nov 2019 15:37:46 +0100 (CET)
Date: Thu, 21 Nov 2019 15:37:46 +0100 (CET)
From: Thorsten Glaser <t.glaser@tarent.de>
X-X-Sender: tglase@tglase-nb.lan.tarent.de
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <s5hzhgpsl7b.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.1911211536340.23653@tglase-nb.lan.tarent.de>
References: <alpine.DEB.2.21.1911202147000.2011@tglase.lan.tarent.de>
 <s5hzhgpsl7b.wl-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Content-Language: de-DE-1901
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] fix segfault on x32,
 64-bit time_t-related format strings
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gVGh1LCAyMSBOb3YgMjAxOSwgVGFrYXNoaSBJd2FpIHdyb3RlOgoKPiBDb3VsZCB5b3Ugc3Bs
aXQgdGhlc2UgY2hhbmdlcyB0byBzZXBhcmF0ZSBwYXRjaGVzPyAgVGhleSBhcmUgZm9yCj4gZGlm
ZmVyZW50IHB1cnBvc2VzLgoKSeKAmXZlIHNlbnQgdGhlbSBhcyB0d28gc2VwYXJhdGUgcGF0Y2gg
ZmlsZXMgYXR0YWNobWVudHMuCgo+IEFsc28sIHVzaW5nIHRpbWVfdCB3b3VsZCBiZSBiZXR0ZXIg
aWYgcG9zc2libGUuICBVbmZvcnR1bmF0ZWx5IGEgY2FzdAo+IGlzIG5lZWRlZCBmb3IgcHJpbnRm
IHVzYWdlLCBidXQgb3RoZXIgdGhhbiB0aGF0LCB0aW1lX3Qgd291bGQgbGVhdmUgdXMKPiB0aGUg
cmlnaHQgc2l6ZS4KCkluIHRpbWVkaWZmKCkgeW91IG1lYW4/IEhybSwgaW5kZWVkLiBJIHRyaWVk
IHRvIGJlIG1pbmltYWwtaW52YXNpdmUKYXQgZmlyc3QuCgpieWUsCi8vbWlyYWJpbG9zCi0tIAp0
YXJlbnQgc29sdXRpb25zIEdtYkgKUm9jaHVzc3RyYcOfZSAyLTQsIEQtNTMxMjMgQm9ubiDigKIg
aHR0cDovL3d3dy50YXJlbnQuZGUvClRlbDogKzQ5IDIyOCA1NDg4MS0zOTMg4oCiIEZheDogKzQ5
IDIyOCA1NDg4MS0yMzUKSFJCIDUxNjggKEFHIEJvbm4pIOKAoiBVU3QtSUQgKFZBVCk6IERFMTIy
MjY0OTQxCkdlc2Now6RmdHNmw7xocmVyOiBEci4gU3RlZmFuIEJhcnRoLCBLYWkgRWJlbnJldHQs
IEJvcmlzIEVzc2VyLCBBbGV4YW5kZXIgU3RlZWcKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYWxzYS1kZXZlbAo=
