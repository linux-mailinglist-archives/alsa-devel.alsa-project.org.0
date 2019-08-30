Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B92A355E
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 13:06:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6032315F8;
	Fri, 30 Aug 2019 13:05:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6032315F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567163163;
	bh=ivoDMLN8/PAwfQGgsYIGePJKCDGKVU7BkIXlmW4QKnE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rU3pjJFSmq3G1QEeuXKTcWZ8eD7DfXZu8/o9J5F7je1l4StHGUdj8smwFCJcD2sDQ
	 svAVCkCWUoUJ/SqvjUUVEZa+blprQGvdTdxW3XnsDRm0EJXqNqr95l7/VTqWN5nmN5
	 +7UjrhesdB0k1PzAMOWgPgTSvlRWrPCaqTUhzizw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD943F80362;
	Fri, 30 Aug 2019 13:04:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79819F80369; Fri, 30 Aug 2019 13:04:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02D08F80096
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 13:04:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02D08F80096
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 2B6F13C04C0;
 Fri, 30 Aug 2019 13:04:08 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id soJ4QoZ0korb; Fri, 30 Aug 2019 13:04:02 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 1ABAA3C057C;
 Fri, 30 Aug 2019 13:04:01 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Fri, 30 Aug 2019 13:04:00 +0200
Date: Fri, 30 Aug 2019 13:03:57 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190830110357.GA20127@vmlxhi-102.adit-jv.com>
References: <877ebi1v1e.wl-kuninori.morimoto.gx@renesas.com>
 <20190826093032.GA24143@vmlxhi-102.adit-jv.com>
 <87lfvf5to9.wl-kuninori.morimoto.gx@renesas.com>
 <20190827074817.GA27667@vmlxhi-102.adit-jv.com>
 <87h863583y.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h863583y.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Cc: Timo Wischer <twischer@de.adit-jv.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Jiada Wang <jiada_wang@mentor.com>,
 Mark Brown <broonie@kernel.org>, Eugeniu Rosca <erosca@de.adit-jv.com>,
 Joshua Frkuska <joshua_frkuska@mentor.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rsnd: fixup 6ch settings to 8ch
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

SGVsbG8gTW9yaW1vdG8tc2FuLAoKT24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDU6Mjg6MzdQTSAr
MDkwMCwgS3VuaW5vcmkgTW9yaW1vdG8gd3JvdGU6Cj4gRm9yICJURE0gRXh0ZW5kIG1vZGUiLCB3
ZSBuZWVkIHRvIHVzZSA4Y2ggY2xvY2sgZm9yIDZjaCBzb3VuZC4KPiBTZWUgRmlndXJlIDQxLjEy
IAo+IAkiVERNIEV4dGVuZCBNb2RlIE9wZXJhdGlvbiB3aXRoIDgtY2hhbm5lbCBEYXRhIGluIFNl
cmlhbCBCdXMKPiAJIGFuZCA2LWNoYW5uZWwgRGF0YSBJbnNpZGUgdGhlIFNvQyAoU1NJMCkiCj4g
Cj4gRm9yICJURE0gU3BsaXQgbW9kZSIsIGl0IGlzIDRjaCBvciA4Y2ggKDRjaCBpcyBub3Qgc3Vw
cG9ydGVkIG9uIHRoaXMgZHJpdmVyKS4KPiBTZWUgRmlndXJlIDQxLjE3Cj4gCSJURE0gU3BsaXQg
TW9kZSAoU3RlcmVvIMOXIDQpIgoKTWFueSB0aGFua3MgZm9yIHRoZSBoZWxwZnVsIGNvbW1lbnRz
LgoKLS0gCkJlc3QgUmVnYXJkcywKRXVnZW5pdS4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYWxzYS1kZXZlbAo=
