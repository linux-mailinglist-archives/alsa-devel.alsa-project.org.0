Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC2559690
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 10:55:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5D2D166B;
	Fri, 28 Jun 2019 10:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5D2D166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561712129;
	bh=Ajp9A5KGvhVIKVTn+AYerjttOl6z+UUQ5wIGG9sZt5s=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EGSlpeTKocW9I8cp7vYBH0ZaMZnCRTi3uNbjb/mBZ/nW21zeuV1Ep43A553whYbvF
	 h9G4xZuk99E/JMYk9Bn08CUbH5dm2EXRrUZ86Acm16h5uH+sqN3Tj1TlqF15F9/XJE
	 eoAKFaCpQdKgq+wxzpfkLhiZCZJSNQwG/wT9YC3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01B17F89701;
	Fri, 28 Jun 2019 10:53:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05944F89701; Fri, 28 Jun 2019 10:53:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A793DF80768
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 10:53:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A793DF80768
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="iZJV4WTx"
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45ZrBx4KdTz9v1dc;
 Fri, 28 Jun 2019 10:53:13 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=iZJV4WTx; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hpEMNWuvYw_w; Fri, 28 Jun 2019 10:53:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45ZrBx3HBlz9v1dW;
 Fri, 28 Jun 2019 10:53:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1561711993; bh=QNUEzs2e6ZJPJ8ysIU+hR3hVhhJUmwBw6ciMTdldx7A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iZJV4WTxJKKUSiKol7dhPzbHdXh3ec9EIn5pAU5cZ0JJKx73Odp0IwloU69qraA7r
 6Zo4TMx5/pg6etpO2hsuq1/xSK17qLVslIfBbTtCtJCzaD2XNn9p0YS/2cehaW+aTE
 uyhro8CTUATQmvLZSsNKhWp6axzRPO3dqo66674w=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7148C8B965;
 Fri, 28 Jun 2019 10:53:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id h0xoail7aHWy; Fri, 28 Jun 2019 10:53:14 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 436C08B961;
 Fri, 28 Jun 2019 10:53:14 +0200 (CEST)
To: Takashi Iwai <tiwai@suse.de>, Fuqian Huang <huangfq.daxian@gmail.com>
References: <20190627174018.4015-1-huangfq.daxian@gmail.com>
 <s5htvca6qp1.wl-tiwai@suse.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b5f24a12-7fcf-63d3-4ca0-578aabbcbb8f@c-s.fr>
Date: Fri, 28 Jun 2019 10:53:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <s5htvca6qp1.wl-tiwai@suse.de>
Content-Language: fr
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [alsa-devel] [PATCH 41/87] sound: ppc: remove memset after
	dma_alloc_coherent
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CgpMZSAyOC8wNi8yMDE5IMOgIDEwOjQ4LCBUYWthc2hpIEl3YWkgYSDDqWNyaXTCoDoKPiBPbiBU
aHUsIDI3IEp1biAyMDE5IDE5OjQwOjE3ICswMjAwLAo+IEZ1cWlhbiBIdWFuZyB3cm90ZToKPj4K
Pj4gSW4gY29tbWl0IGFmN2RkZDhhNjI3Ywo+PiAoIk1lcmdlIHRhZyAnZG1hLW1hcHBpbmctNC4y
MScgb2YgZ2l0Oi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvaGNoL2RtYS1tYXBwaW5nIiksCj4+
IGRtYV9hbGxvY19jb2hlcmVudCBoYXMgYWxyZWFkeSB6ZXJvZWQgdGhlIG1lbW9yeS4KPj4gU28g
bWVtc2V0IGlzIG5vdCBuZWVkZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEZ1cWlhbiBIdWFuZyA8
aHVhbmdmcS5kYXhpYW5AZ21haWwuY29tPgo+IAo+IEFwcGxpZWQsIHRoYW5rcy4KPiAKCkV1aCAu
Li4gbG9va3MgbGlrZSBhIHYyIG9mIHRoaXMgc2VyaWVzIHdhcyBzZW50IG91dC4KCkNocmlzdG9w
aGUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1k
ZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFp
bG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
