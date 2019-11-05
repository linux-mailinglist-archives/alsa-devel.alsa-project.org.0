Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AEFF01CD
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 16:46:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AAA116CE;
	Tue,  5 Nov 2019 16:45:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AAA116CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572968783;
	bh=0AHq11nbUVdugdTosm/MinZz3buFcXVql1gB5rzjZo8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WfP7cbedpUNQStd/UcmyDii/JqJmYrib7xuH20JxgS+2YeKsba8C4rwrSuegD60Zr
	 +tgNTvoZkdqL33NlWyEihw7gpWft24AZs50spkFZXRZe9ZrKDB5a9mLhXJ4YicNgCK
	 Fwy3JPueoqZxxlsb9GW6TkQXXx3nXi+EZNpA5qDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A9A4F8049B;
	Tue,  5 Nov 2019 16:44:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6181F8049B; Tue,  5 Nov 2019 16:44:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F09ADF80271
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 16:44:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F09ADF80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T5R4IXUP"
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D007B21D71
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572968670;
 bh=aum1YJSu+9PFRnIpqDOrB5ANLIlZ0vhV+It6iVj1aKg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T5R4IXUPXZ8JzFQ1v3//2AfSDVQdRVQhQjYADNiaagM2fMA5QJLwNjCy/0OuYO7Q3
 YFIibxhakVS7paWEhMpi7330Q98iiqUwzM5AwMly876nUdUfz1kVhuBE0eoHcKEEMU
 uQl0zOg+NPdGMDQgJXNR+vfNYGnL13Nr6Q88VQnk=
Received: by mail-qt1-f174.google.com with SMTP id o11so24902703qtr.11
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 07:44:29 -0800 (PST)
X-Gm-Message-State: APjAAAUCamwjXlXoWg9iPpTwBqvnCpQfektWJ7qRIb+rjvFJOVCq6yQg
 7EDtVBkNafJ73z3hf2jhDSJsh130Jj+0bUz9yw==
X-Google-Smtp-Source: APXvYqywnfJgieS/x9mcd6p6x/Ua9dIsPOFDhGy86j+MgH0EE0JhwXgHoFf9LmftkfHRGVlsfYdW8ulq/FJYJHHt/BM=
X-Received: by 2002:ad4:42b4:: with SMTP id e20mr20065711qvr.85.1572968668890; 
 Tue, 05 Nov 2019 07:44:28 -0800 (PST)
MIME-Version: 1.0
References: <20191105105615.21391-1-maxime@cerno.tech>
In-Reply-To: <20191105105615.21391-1-maxime@cerno.tech>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 5 Nov 2019 09:44:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLkQ5Quz1RHe77r0-TsMtoveu6cWUVdosfoXmyWzo0vaw@mail.gmail.com>
Message-ID: <CAL_JsqLkQ5Quz1RHe77r0-TsMtoveu6cWUVdosfoXmyWzo0vaw@mail.gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Mark Brown <broonie@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: Re: [alsa-devel] [PATCH v2] dt-bindings: sound: adau7118: Fix
	example warning
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

T24gVHVlLCBOb3YgNSwgMjAxOSBhdCA1OjA2IEFNIE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJu
by50ZWNoPiB3cm90ZToKPgo+IFRoZSBBREFVNzExOCBoYXMgYW4gZXhhbXBsZSB3aGVyZSB0aGUg
Y29kZWMgaGFzIGFuIGkyYyBhZGRyZXNzIG9mIDE0LCBhbmQKPiB0aGUgdW5pdCBhZGRyZXNzIHNl
dCB0byAxNCBhcyB3ZWxsLgo+Cj4gSG93ZXZlciwgd2hpbGUgdGhlIGFkZHJlc3MgaXMgZXhwcmVz
c2VkIGluIGRlY2ltYWwsIHRoZSB1bml0LWFkZHJlc3MgaXMKPiBzdXBwb3NlZCB0byBiZSBpbiBo
ZXhhZGVjaW1hbCwgd2hpY2ggZW5kcyB1cCB3aXRoIHR3byBkaWZmZXJlbnQgYWRkcmVzc2VzCj4g
dGhhdCB0cmlnZ2VyIGEgRFRDIHdhcm5pbmcuIEZpeCB0aGlzIGJ5IHNldHRpbmcgdGhlIGFkZHJl
c3MgdG8gMHgxNC4KPgo+IENjOiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgo+IENjOiBM
YXJzLVBldGVyIENsYXVzZW4gPGxhcnNAbWV0YWZvby5kZT4KPiBGaXhlczogOTY5ZDQ5YjJjZGM4
ICgiZHQtYmluZGluZ3M6IGFzb2M6IEFkZCBBREFVNzExOCBkb2N1bWVudGF0aW9uIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4KPgo+IC0tLQo+Cj4g
Q2hhbmdlcyBmcm9tIHYxOgo+ICAgLSBGaXggdGhlIGFkZHJlc3MgaW5zdGVhZCBvZiB0aGUgdW5p
dC1hZGRyZXNzLgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291
bmQvYWRpLGFkYXU3MTE4LnlhbWwgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2Et
ZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21h
aWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
