Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F1E2DC0E
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2019 13:41:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5B8516E5;
	Wed, 29 May 2019 13:40:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5B8516E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559130074;
	bh=BFeBXwysYUBfVe7c1vkooE138GAU5xOU0NFo23jihFM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G9kVTAe8kt/Vo62xn8P8a0ekXTSZnmHR8FMNX95QpvlYvYBN0PMgYDwnm/IcTmIkn
	 sjcZ76FmPaT1fps4kTntEboW3qZ90g2nkB922ItwSL1k6FD8FuFjEFTVwSdEcoXs+m
	 oIhReQgrATB67R3obo48z+/FMnF6KioK0BjSiKSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23A0FF896E8;
	Wed, 29 May 2019 13:39:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7AAFF896E4; Wed, 29 May 2019 13:39:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AAD9F8072E
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 13:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AAD9F8072E
Received: by mail-qt1-f196.google.com with SMTP id y57so2079342qtk.4
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 04:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9E0nYfWPs7a74TGtkChwlvLkwZ7IjxPSqPdyj4RozG4=;
 b=tGyT6ecZIk0vZnV90qarBauI4NpxhXMQMFqYRrGtWS4qo+WXCT/YOXN/R2x2tYUV/X
 IjRCFx85zIwaXVy4hvLkN+oF4SHBx0AQ3ONlDeiTP9CJ4dwx0hrxQ8G6uJ8febJ5qs4O
 THiECXfQF2ySsLbprgZAEnHOtHDMIHqUmApDI1Pnoq+aUgyAJqNTSuNXLBexJawFeWGF
 Lz7PbMSuPTRWCdc+orpc6NbIOMz5EJ4p4XyhKfJp00B2DsXH6m52yYcs8gJ3/hyIZWjb
 PpEGSuRxzwPfWeKBuPhxD5tuZVdUMp95ML+f1ZmuBkSfInUpDPRgjmay+vXRKPSmIhjC
 3IiA==
X-Gm-Message-State: APjAAAUOBouqnKnm1yAYZMby194/gPEcj2DCiv0wnj829uLNB7VagO7/
 vJqsotSsjDCEOKlgl6AEhkV/Y0Sor6cwvjQm504=
X-Google-Smtp-Source: APXvYqz0EPhnldcISbzSfPUtTKsPXrltcC2TURmwXZayJpn/3MgULMOLoAS863/SSr+U9BaN4sQZRsVuLkMYuNUzw/c=
X-Received: by 2002:ac8:2433:: with SMTP id c48mr87599176qtc.18.1559129962985; 
 Wed, 29 May 2019 04:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190528142424.19626-1-geert@linux-m68k.org>
 <20190528142424.19626-4-geert@linux-m68k.org>
In-Reply-To: <20190528142424.19626-4-geert@linux-m68k.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 May 2019 13:39:06 +0200
Message-ID: <CAK8P3a3yPBOfw+GhTXGXZzr3wdz1yA3kKZGqqWYnW6+TzXm_PQ@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-block <linux-block@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 linux-afs@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Networking <netdev@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Clemens Ladisch <clemens@ladisch.de>,
 Jamal Hadi Salim <jhs@mojatatu.com>, David Howells <dhowells@redhat.com>,
 Jiri Pirko <jiri@mellanox.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Joe Perches <joe@perches.com>, "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Matias Bjorling <mb@lightnvm.io>, Eran Ben Elisha <eranbe@mellanox.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Igor Konopko <igor.j.konopko@intel.com>
Subject: Re: [alsa-devel] [PATCH 3/5] net: sched: pie: Use ULL suffix for
	64-bit constant
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

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgNDoyNCBQTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPgo+IFdpdGggZ2NjIDQuMSwgd2hlbiBjb21waWxpbmcg
Zm9yIGEgMzItYml0IHBsYXRmb3JtOgo+Cj4gICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6IEluIGZ1
bmN0aW9uIOKAmGRyb3BfZWFybHnigJk6Cj4gICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6MTE2OiB3
YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBl
Cj4gICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6MTM4OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50
IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCj4gICAgIG5ldC9zY2hlZC9zY2hfcGll
LmM6MTQ0OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9u
Z+KAmSB0eXBlCj4gICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6MTQ3OiB3YXJuaW5nOiBpbnRlZ2Vy
IGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCj4gICAgIG5ldC9zY2hl
ZC9zY2hfcGllLmM6IEluIGZ1bmN0aW9uIOKAmHBpZV9xZGlzY19lbnF1ZXVl4oCZOgo+ICAgICBu
ZXQvc2NoZWQvc2NoX3BpZS5jOjE3Mzogd2FybmluZzogaW50ZWdlciBjb25zdGFudCBpcyB0b28g
bGFyZ2UgZm9yIOKAmGxvbmfigJkgdHlwZQo+ICAgICBuZXQvc2NoZWQvc2NoX3BpZS5jOiBJbiBm
dW5jdGlvbiDigJhjYWxjdWxhdGVfcHJvYmFiaWxpdHnigJk6Cj4gICAgIG5ldC9zY2hlZC9zY2hf
cGllLmM6MzcxOiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCY
bG9uZ+KAmSB0eXBlCj4gICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6MzcyOiB3YXJuaW5nOiBpbnRl
Z2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCj4gICAgIG5ldC9z
Y2hlZC9zY2hfcGllLmM6Mzc3OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJn
ZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCj4gICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6MzgyOiB3YXJu
aW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCj4g
ICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6Mzk3OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlz
IHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCj4gICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6
Mzk4OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KA
mSB0eXBlCj4gICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6Mzk5OiB3YXJuaW5nOiBpbnRlZ2VyIGNv
bnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCj4gICAgIG5ldC9zY2hlZC9z
Y2hfcGllLmM6NDA3OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig
4oCYbG9uZ+KAmSB0eXBlCj4gICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6NDE0OiB3YXJuaW5nOiBp
bnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCj4KPiBGaXgg
dGhpcyBieSBhZGRpbmcgdGhlIG1pc3NpbmcgIlVMTCIgc3VmZml4Lgo+Cj4gRml4ZXM6IDNmN2Fl
NWYzZGM1Mjk1YWMgKCJuZXQ6IHNjaGVkOiBwaWU6IGFkZCBtb3JlIGNhc2VzIHRvIGF1dG8tdHVu
ZSBhbHBoYSBhbmQgYmV0YSIpCj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydEBsaW51eC1tNjhrLm9yZz4KCkkgY3JlYXRlZCBwYXRjaGVzIGZvciBhbGwgaW5zdGFuY2Vz
IG9mIHRoaXMgaXNzdWUgYXQgc29tZSBwb2ludCBpbiB0aGUgcGFzdCwKYnV0IGRpZCBub3Qgc2Vu
ZCB0aG9zZSBhcyB3ZSByYWlzZWQgdGhlIG1pbmltdW0gY29tcGlsZXIgdmVyc2lvbiB0byBvbmUK
dGhhdCBoYW5kbGVzIHRoaXMgaW4gdGhlIGV4cGVjdGVkIHdheSB3aXRob3V0IGEgd2FybmluZy4K
Ck1heWJlIHlvdSBjYW4ganVzdCBpZ25vcmUgdGhlc2UgYXMgd2VsbD8KCiAgICAgIEFybmQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBt
YWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5h
bHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
