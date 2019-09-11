Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CA6AF5DA
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2019 08:33:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BD4E16F0;
	Wed, 11 Sep 2019 08:32:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BD4E16F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568183604;
	bh=H9lMzQ6mlrLhksZ0WTzmvX56YZqmN6LjqEHAQy2w3lI=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AT0uVpQwCYM/HuUllWaSnxI31oKQcFT/hAt1F6tcbKRbb7faSvgj/fOj475zZPFBD
	 te1zEZlT2cGKyYzHfTrCUtS1PjQ0jYK1det6P6smjg4Y1XW7Mfm+6KEbxq6S0gv85b
	 +ZLVoM4PwB1nmdiZSb/JbRs885LVSqk5zaDt4CW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D034DF80323;
	Wed, 11 Sep 2019 08:31:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 452E6F80323; Wed, 11 Sep 2019 08:31:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E9A2F801ED
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 08:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E9A2F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="b6kl3dFl"
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46SsVq6xQ7z9tyF9;
 Wed, 11 Sep 2019 08:31:31 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=b6kl3dFl; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ng78tZGiNtt0; Wed, 11 Sep 2019 08:31:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46SsVq5VFnz9tyFC;
 Wed, 11 Sep 2019 08:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568183491; bh=nojXPAqUVEePkKOQkLHNj6GWteKz1LC7kcRc84VvO6E=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=b6kl3dFlkJC7mAmm1VNOX5xhi0oVmQyfv6QjvO0eR3a5/E2faZ1Pw3Ol6SQRSQVvg
 lB39Vr2dsELcbTERsAKxKvbgQDflN1XBSJ8Bbw8VZboF+Zscc87mTxVCQPx+TGMWig
 H+w220w1X9LX4e8cSS6+PZv1/5IxM2WGXgwPKhaE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A8D858B74C;
 Wed, 11 Sep 2019 08:31:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id f5_bsOKFZpbA; Wed, 11 Sep 2019 08:31:32 +0200 (CEST)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 746D08B7CA;
 Wed, 11 Sep 2019 08:31:32 +0200 (CEST)
To: Shengjiu Wang <shengjiu.wang@nxp.com>, timur@kernel.org,
 nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org
References: <cff8bff1e8d3334fa308ddfcec266a5284e3c858.1568169346.git.shengjiu.wang@nxp.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <fe34ba28-a961-0bf9-03b2-e9e3931f3888@c-s.fr>
Date: Wed, 11 Sep 2019 08:31:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cff8bff1e8d3334fa308ddfcec266a5284e3c858.1568169346.git.shengjiu.wang@nxp.com>
Content-Language: fr
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: fsl_mqs: add DT binding
	documentation
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

SGkgU2hlbmdqaXUsCgpZb3VyIG1haWwgaXMgZGF0ZWQgaW4gdGhlIGZ1dHVyZSwgaXRzIHRpbWUg
aXMgMTY6NDIgKEdNVCsyKSB3aGVyZWFzIGl0IAppcyBzdGlsbCB0aGUgbW9ybmluZy4KClBsZWFz
ZSBmaXggeW91ciBjbG9jayBvciB0aW1lem9uZSBmb3IgZnV0dXJlIG1haWxzLgoKVGhhbmtzCkNo
cmlzdG9waGUKCkxlIDExLzA5LzIwMTkgw6AgMTY6NDIsIFNoZW5naml1IFdhbmcgYSDDqWNyaXTC
oDoKPiBBZGQgdGhlIERUIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgTlhQIE1RUyBkcml2ZXIK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBTaGVuZ2ppdSBXYW5nIDxzaGVuZ2ppdS53YW5nQG54cC5jb20+
Cj4gLS0tCj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9mc2wsbXFzLnR4dCAgICAg
fCAyMCArKysrKysrKysrKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9u
cygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9zb3VuZC9mc2wsbXFzLnR4dAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc291bmQvZnNsLG1xcy50eHQgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc291bmQvZnNsLG1xcy50eHQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDAwMDAwMDAwMDAwMC4uYTFkYmUxODEyMDRhCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9mc2wsbXFzLnR4dAo+IEBA
IC0wLDAgKzEsMjAgQEAKPiArZnNsLG1xcyBhdWRpbyBDT0RFQwo+ICsKPiArUmVxdWlyZWQgcHJv
cGVydGllczoKPiArCj4gKyAgLSBjb21wYXRpYmxlIDogTXVzdCBjb250YWluIG9uZSBvZiAiZnNs
LGlteDZzeC1tcXMiLCAiZnNsLGNvZGVjLW1xcyIKPiArCQkiZnNsLGlteDhxbS1tcXMiLCAiZnNs
LGlteDhxeHAtbXFzIi4KPiArICAtIGNsb2NrcyA6IEEgbGlzdCBvZiBwaGFuZGxlcyArIGNsb2Nr
LXNwZWNpZmllcnMsIG9uZSBmb3IgZWFjaCBlbnRyeSBpbgo+ICsJICAgICBjbG9jay1uYW1lcwo+
ICsgIC0gY2xvY2stbmFtZXMgOiBNdXN0IGNvbnRhaW4gIm1jbGsiCj4gKyAgLSBncHIgOiBUaGUg
Z3ByIG5vZGUuCj4gKwo+ICtFeGFtcGxlOgo+ICsKPiArbXFzOiBtcXMgewo+ICsJY29tcGF0aWJs
ZSA9ICJmc2wsaW14NnN4LW1xcyI7Cj4gKwlncHIgPSA8Jmdwcj47Cj4gKwljbG9ja3MgPSA8JmNs
a3MgSU1YNlNYX0NMS19TQUkxPjsKPiArCWNsb2NrLW5hbWVzID0gIm1jbGsiOwo+ICsJc3RhdHVz
ID0gImRpc2FibGVkIjsKPiArfTsKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXBy
b2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYWxzYS1kZXZlbAo=
