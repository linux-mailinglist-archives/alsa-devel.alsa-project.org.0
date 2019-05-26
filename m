Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9D32ABBB
	for <lists+alsa-devel@lfdr.de>; Sun, 26 May 2019 21:02:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 507581770;
	Sun, 26 May 2019 21:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 507581770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558897356;
	bh=25KWt54UWaQcbPpfj8Yi2L8tZDNQDlD790YZoLkLkJ0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pvjRNf+SnQ1nzB6l/VodE1pz3UmrpcwQmw53RgPLan0hGY78Hgke9aXlGeGMJIjEz
	 iBJ4Jq9S+g4S2yjZqHhOpQjb0xzhl/s0nowZ2+3FvnVkBGU9eIK/sBsun+9LTvsrKS
	 sX+Nta/2lFLLXskG4QznO99OoSfXjpcgWvZ3CiuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4FA6F896EB;
	Sun, 26 May 2019 21:00:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 435B9F896EB; Sun, 26 May 2019 21:00:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_EXCESS_BASE64,PRX_BODY_26,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 050BFF8072E
 for <alsa-devel@alsa-project.org>; Sun, 26 May 2019 21:00:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 050BFF8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Xkg3tPCA"
Received: by mail-yw1-xc41.google.com with SMTP id k128so5816270ywf.2
 for <alsa-devel@alsa-project.org>; Sun, 26 May 2019 12:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ozbpBHH7tRCrsdtMEQjsQDlxSXHNruEgExveiJhJ0fo=;
 b=Xkg3tPCAZXTRWbYvkia1rPlSLig1Y7GQZ4mFLN0JUZWf8a7xttjpv80JLmoXWsOBbI
 0z5tsEfJ5nw5U0tJswI6KRnYhiqLRxuwKaeoE6H4UWUH/smXoDXabl5oLPh2ynvTLh8c
 wnqxAo2TCmsdS+P71y14Di7yBEB7eOjOMPlaJWe9hUW39slwAWULG8sF7qwmdNQWv/sj
 HzjypXp6N0DZ270bB+5GuMoPT4yQI8gq860sBzESkWOj82dBBSZ2n+2pp8Heap0BI9u7
 dzm4duCz3dWwXIQ5z/MCEiOFu/09RivNT5GdjFnr2W5UnUxoBL2neIt5NZ8/hy8oXPRy
 i2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ozbpBHH7tRCrsdtMEQjsQDlxSXHNruEgExveiJhJ0fo=;
 b=iY5BzneQtjYjlgiAAXlEYEoyCOyr0hF4KbbIdRsTSc+nNfcQcxfFYZHVHnU4EY4N6f
 tajWp/uFPzl6XETQIFCWaGtTsBL1TVXbqyxeqobyy3qwrnZ5k8Kw7Wmdxo0kgOG5PW5y
 65BJZgEjSO/PzOq9kTZGMBwy5aSesJq9RNHyNZwWRlYfobKLF3uL1eZO+u+iTiBw3mTS
 PEUSAXXHZ/tXrESWOszGYQt8F3++WR7qCe25Ky9aDwRC6Qt4SGQWTD1zX9NgpIMO48Ea
 JO+8tN8xBR/1GydDc1w9v2ZpGkHTfSfnMJcz7E3adKz3Jp5fWqHqPcKTJYwNg2wuuyxW
 IHBw==
X-Gm-Message-State: APjAAAWsV3NqClGLrbWEXFnfGHIK6TQ/iiNSrjVlxVfEm8fuq3BzL7VL
 TXNbyaFeoDrWvz7IAHzuhwIkbtOmpk8vEozVI98=
X-Google-Smtp-Source: APXvYqwkYlyYZ5uwbz25lwZOwmW3dEb1r4wBA/RfRkCDhUCYp59oYMFH5GkzlWv0BwlS71J2R9iK0ZxtOpmwQ6F8a0g=
X-Received: by 2002:a81:997:: with SMTP id 145mr7897486ywj.457.1558897241180; 
 Sun, 26 May 2019 12:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190525162323.20216-1-peron.clem@gmail.com>
 <20190525162323.20216-4-peron.clem@gmail.com>
 <20190526182410.soqb6bne6w66d5j6@flea>
In-Reply-To: <20190526182410.soqb6bne6w66d5j6@flea>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 26 May 2019 21:00:30 +0200
Message-ID: <CAJiuCce8UNbA+Ljkbw92ZJu3Ni6N9ciFKGsLtBYJ0_J8E1Gi2g@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v3 3/7] ASoC: sun4i-spdif: Add TX fifo bit
	flush quirks
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

SGkgTWF4aW1lLAoKT24gU3VuLCAyNiBNYXkgMjAxOSBhdCAyMDoyNCwgTWF4aW1lIFJpcGFyZCA8
bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIE1heSAyNSwgMjAx
OSBhdCAwNjoyMzoxOVBNICswMjAwLCBDbMOpbWVudCBQw6lyb24gd3JvdGU6Cj4gPiBBbGx3aW5u
ZXIgSDYgaGFzIGEgZGlmZmVyZW50IGJpdCB0byBmbHVzaCB0aGUgVFggRklGTy4KPiA+Cj4gPiBB
ZGQgYSBxdWlya3MgdG8gcHJlcGFyZSBpbnRyb2R1Y3Rpb24gb2YgSDYgU29DLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+Cj4gPiAt
LS0KPiA+ICBzb3VuZC9zb2Mvc3VueGkvc3VuNGktc3BkaWYuYyB8IDExICsrKysrKysrKystCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3N1bnhpL3N1bjRpLXNwZGlmLmMgYi9zb3VuZC9zb2Mv
c3VueGkvc3VuNGktc3BkaWYuYwo+ID4gaW5kZXggYjZjNjZhNjJlOTE1Li44MzE3YmJlZTA3MTIg
MTAwNjQ0Cj4gPiAtLS0gYS9zb3VuZC9zb2Mvc3VueGkvc3VuNGktc3BkaWYuYwo+ID4gKysrIGIv
c291bmQvc29jL3N1bnhpL3N1bjRpLXNwZGlmLmMKPiA+IEBAIC0xNjYsMTAgKzE2NiwxMiBAQAo+
ID4gICAqCj4gPiAgICogQHJlZ19kYWNfdHhfZGF0YTogVFggRklGTyBvZmZzZXQgZm9yIERNQSBj
b25maWcuCj4gPiAgICogQGhhc19yZXNldDogU29DIG5lZWRzIHJlc2V0IGRlYXNzZXJ0ZWQuCj4g
PiArICogQHJlZ19mY3RsX2Z0eDogVFggRklGTyBmbHVzaCBiaXRtYXNrLgo+Cj4gSXQncyBhIGJp
dCB3ZWlyZCB0byB1c2UgdGhlIHNhbWUgcHJlZml4IGZvciBhIHJlZ2lzdGVyIG9mZnNldAo+IChy
ZWdfZGFjX3R4X2RhdGEpIGFuZCBhIHZhbHVlIChyZWdfZmN0bF9mdHgpLgoKSSBqdXN0IGxvb2sg
YXQgc3VuNGktY29kZWMgYW5kIHRoZXkgdXNlIGEgcmVnbWFwLCBCdXQgSSB0aGluayBpdCdzIGEK
Yml0IG92ZXJraWxsIG5vPwoKV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdmFsX2ZjdGxfZnR4ID8K
ClRoYW5rcyBmb3IgeW91ciByZXZpZXcsCkNsw6ltZW50Cgo+Cj4gTWF4aW1lCj4KPiAtLQo+IE1h
eGltZSBSaXBhcmQsIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
