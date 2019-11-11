Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FE7F77CD
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 16:35:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87B561686;
	Mon, 11 Nov 2019 16:34:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87B561686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573486541;
	bh=RPF9Ui10TNtdrDt9626mrrAWQuzc18MOxCN0lCb1l/Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vr2nk7yBKc21TuVtOcAPpRmm6tGTiAye6NL+E86nHZPLjorWsspGQC0v47a8vrGRx
	 uq3fTnx7rTnZQH4ZbRPBTbZaZtLOkewX4EVy67ubQuv+OkiAf11QvnS+kcSaZZqaZt
	 paS1Za79YDQujzvbXg181by8/rcdrCxc6evSSDyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5203BF805A0;
	Mon, 11 Nov 2019 16:34:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45ECAF80506; Mon, 11 Nov 2019 16:34:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF675F802E0
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 16:34:21 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 69E0BA0040;
 Mon, 11 Nov 2019 16:34:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 69E0BA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1573486461; bh=ypQdUuPmokLktKo87nomyJAHtB6MDoxdiJJ190/McmM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=HIyTTilggylMti7fb6oJ4dWC0i/JnPEI0gf9L+H/AcQ5A1Yy4QuBsDR9xZaCMtvtk
 NzpVMwC39gimEBwptyR286s3feqiq7tPYCvGsKh6PPZ0FR8eIhUkCJ2LKb3GqspIV1
 EkZkf8HcS1SLf2+jsBVpp+3x81vhsEFcP7uCqmG0=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 11 Nov 2019 16:34:18 +0100 (CET)
To: Curtis Malainey <cujomalainey@chromium.org>, alsa-devel@alsa-project.org
References: <20191107015808.26844-1-cujomalainey@chromium.org>
 <20191107015808.26844-11-cujomalainey@chromium.org>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <d13e70bd-4965-5dfd-2745-64b3f6130396@perex.cz>
Date: Mon, 11 Nov 2019 16:34:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191107015808.26844-11-cujomalainey@chromium.org>
Content-Language: en-US
Cc: broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH 11/11] ucm: docs: Add DefaultNodeGain
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

RG5lIDA3LiAxMS4gMTkgdiAyOjU4IEN1cnRpcyBNYWxhaW5leSBuYXBzYWwoYSk6Cj4gQWxsb3cg
dWNtIHRvIHNwZWNpZnkgYSBkZWZhdWx0IGhhcmR3YXJlIGdhaW4gdG8gb3ZlcmlkZSBvbiB0aGUg
cmVzcGVjdGl2ZSBub2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEN1cnRpcyBNYWxhaW5leSA8Y3Vq
b21hbGFpbmV5QGNocm9taXVtLm9yZz4KPiAtLS0KPiAgIGluY2x1ZGUvdXNlLWNhc2UuaCB8IDIg
KysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS91c2UtY2FzZS5oIGIvaW5jbHVkZS91c2UtY2FzZS5oCj4gaW5kZXggZWU2ZWU1ZTAu
LmQwZTgyMWQ1IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvdXNlLWNhc2UuaAo+ICsrKyBiL2luY2x1
ZGUvdXNlLWNhc2UuaAo+IEBAIC0zNDcsNiArMzQ3LDggQEAgaW50IHNuZF91c2VfY2FzZV9nZXRf
bGlzdChzbmRfdXNlX2Nhc2VfbWdyX3QgKnVjX21nciwKPiAgICAqICAgLSBTb2Z0d2FyZUdhaW4K
PiAgICAqICAgICAgLSBTcGVjaWZ5IHRoZSBzb2Z0d2FyZSBnYWluIGluIDAuMDFkQi4gRS5nLiAi
MjAiIG1lYW5zIHRoZXJlIHdpbGwgYmUKPiAgICAqICAgICAgICAwLjIgZEIgc29mdHdhcmUgZ2Fp
biBvbiB0aGlzIG5vZGUuCj4gKyAqICAgLSBEZWZhdWx0Tm9kZUdhaW4KPiArICogICAgICAtIENo
YW5nZSB0aGUgZGVmYXVsdCBub2RlIGdhaW4uIEUuZzog4oCcLTcwMOKAnSB0byBzZXQgLTcgZEIg
b24gdGhpcyBub2RlCj4gICAgKiAgIC0gRGlzYWJsZVNvZnR3YXJlVm9sdW1lCj4gICAgKiAgICAg
IC0gU2V0IHRvICIxIiB0byBmb3JjZSB1c2Vyc3BhY2UgdG8gdXNlIGhhcmR3YXJlIHZvbHVtZSBj
b250cm9scwo+ICAgICovCj4gCgpJIGRvbid0IHNlZSB0aGUgdXNhZ2UuIENvdWxkIHlvdSBlbGFi
b3JhdGUgYSBiaXQgd2hpY2ggcHVycG9zZSBpcyBmb3IgdGhpcyB2YWx1ZT8KCgkJCQkJSmFyb3Ns
YXYKCi0tIApKYXJvc2xhdiBLeXNlbGEgPHBlcmV4QHBlcmV4LmN6PgpMaW51eCBTb3VuZCBNYWlu
dGFpbmVyOyBBTFNBIFByb2plY3Q7IFJlZCBIYXQsIEluYy4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1k
ZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
