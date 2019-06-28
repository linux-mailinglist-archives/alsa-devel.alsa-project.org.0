Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86557596B2
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 11:01:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F15E41665;
	Fri, 28 Jun 2019 11:00:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F15E41665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561712503;
	bh=w9dF9IjU4nhTSdR+go5X0i/sWRKUdkOatyvCvlc5kJo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C2btwKSsGURlI5PZUkeHYhcNJWU9x4E+G8ZOUSj/XiIXZFR2xKq8fOf7JbATaBvrI
	 Ya7TF/46tXwoTy9J6+ihUHHpjwZ1MJQZfpEaESvy/hLXkbnOaJBK4m/6Uw54TyHNHy
	 p2B3YgFyNDrV0di3Tnbt0RMLYG54Iu3aubdy2mcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 677CBF896CB;
	Fri, 28 Jun 2019 10:59:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 848D1F896B7; Fri, 28 Jun 2019 10:59:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5747AF80768
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 10:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5747AF80768
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="hCseVWrz"
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45ZrLb32q7z9v1dq;
 Fri, 28 Jun 2019 10:59:51 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=hCseVWrz; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id wg0kRk6LpBEP; Fri, 28 Jun 2019 10:59:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45ZrLb0JB7z9v1dW;
 Fri, 28 Jun 2019 10:59:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1561712391; bh=3PExFE1N6IiyQSDeWR2v89tJ9QeiWcAN1N4Hjay3PlI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hCseVWrzRRQQXlskmPHp+o3zZeA9GBRK4q98IdoDLwuXYMJZ0gqNOJzJu4lD6Mxqb
 cA/OiFk6yj7OXXXZDbS9ktAYJzXSFIfIfzeuxOXNEijxaOSJN+wsUKbnOH/ZnZ0Lmi
 Pgc6B8sCSvQ3DAwq+DJQJ9XYrlUTJvBjOpWEWRUQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 256308B966;
 Fri, 28 Jun 2019 10:59:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mul6Zychpueb; Fri, 28 Jun 2019 10:59:52 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E11848B961;
 Fri, 28 Jun 2019 10:59:51 +0200 (CEST)
To: Fuqian Huang <huangfq.daxian@gmail.com>
References: <20190628025055.16242-1-huangfq.daxian@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Followup-To: Takashi Iwai <tiwai@suse.com>
Message-ID: <83108dee-72f7-e56f-95f6-26162c9a0ccc@c-s.fr>
Date: Fri, 28 Jun 2019 10:59:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190628025055.16242-1-huangfq.daxian@gmail.com>
Content-Language: fr
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Allison Randal <allison@lohutok.net>
Subject: Re: [alsa-devel] [PATCH v2 27/27] sound: ppc: remove unneeded
 memset after dma_alloc_coherent
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

CgpMZSAyOC8wNi8yMDE5IMOgIDA0OjUwLCBGdXFpYW4gSHVhbmcgYSDDqWNyaXTCoDoKPiBJbiBj
b21taXQgYWY3ZGRkOGE2MjdjCj4gKCJNZXJnZSB0YWcgJ2RtYS1tYXBwaW5nLTQuMjEnIG9mIGdp
dDovL2dpdC5pbmZyYWRlYWQub3JnL3VzZXJzL2hjaC9kbWEtbWFwcGluZyIpLAo+IGRtYV9hbGxv
Y19jb2hlcmVudCBoYXMgYWxyZWFkeSB6ZXJvZWQgdGhlIG1lbW9yeS4KPiBTbyBtZW1zZXQgaXMg
bm90IG5lZWRlZC4KCllvdSBhcmUgcmVmZXJpbmcgdG8gYSBtZXJnZSBjb21taXQsIGlzIHRoYXQg
Y29ycmVjdCA/CgpJIGNhbid0IHNlZSBhbnl0aGluZyByZWxhdGVkIGluIHRoYXQgY29tbWl0LCBj
YW4geW91IHBsZWFzZSBwaW5wb2ludCBpdCA/CgpBcyBmYXIgYXMgSSBjYW4gc2VlLCBvbiBwb3dl
cnBjIHRoZSBtZW1vcnkgaGFzIGFsd2F5cyBiZWVuIHplcm9pemVkIAooc2luY2UgMjAwNSBhdCBs
ZWFzdCkuCgpDaHJpc3RvcGhlCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZ1cWlhbiBIdWFuZyA8aHVh
bmdmcS5kYXhpYW5AZ21haWwuY29tPgo+IC0tLQo+ICAgc291bmQvcHBjL3BtYWMuYyB8IDEgLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc291bmQv
cHBjL3BtYWMuYyBiL3NvdW5kL3BwYy9wbWFjLmMKPiBpbmRleCAxYjExZTUzZjZhNjIuLjFhYjEy
ZjRmODYzMSAxMDA2NDQKPiAtLS0gYS9zb3VuZC9wcGMvcG1hYy5jCj4gKysrIGIvc291bmQvcHBj
L3BtYWMuYwo+IEBAIC01Niw3ICs1Niw2IEBAIHN0YXRpYyBpbnQgc25kX3BtYWNfZGJkbWFfYWxs
b2Moc3RydWN0IHNuZF9wbWFjICpjaGlwLCBzdHJ1Y3QgcG1hY19kYmRtYSAqcmVjLCBpCj4gICAJ
aWYgKHJlYy0+c3BhY2UgPT0gTlVMTCkKPiAgIAkJcmV0dXJuIC1FTk9NRU07Cj4gICAJcmVjLT5z
aXplID0gc2l6ZTsKPiAtCW1lbXNldChyZWMtPnNwYWNlLCAwLCByc2l6ZSk7Cj4gICAJcmVjLT5j
bWRzID0gKHZvaWQgX19pb21lbSAqKURCRE1BX0FMSUdOKHJlYy0+c3BhY2UpOwo+ICAgCXJlYy0+
YWRkciA9IHJlYy0+ZG1hX2Jhc2UgKyAodW5zaWduZWQgbG9uZykoKGNoYXIgKilyZWMtPmNtZHMg
LSAoY2hhciAqKXJlYy0+c3BhY2UpOwo+ICAgCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
