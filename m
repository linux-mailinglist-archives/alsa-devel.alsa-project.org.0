Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AE4E7287
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 14:19:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 880601F3B;
	Mon, 28 Oct 2019 14:18:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 880601F3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572268789;
	bh=rrO/8vix1u+fANJxhpZ/yQReoWNoi8wxwMLIcRwtoME=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u9KmzyxZJMCnwLhBd2N3RAwg5DmsDgbOSO7QpKpxkKZa6Pxrp/I/d/UO79y+7l1iH
	 zSe34Ki3WUoO0dNBKH71ERlpJXSPA9cDnza6oZqDCVuNFCSZAk+zoZcxyuvmwojR1R
	 B6vH0aICPiETMtlMN8Q0nigtGvbgWCPfZBE0XbMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09D17F80361;
	Mon, 28 Oct 2019 14:18:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 120D3F80361; Mon, 28 Oct 2019 14:18:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8840BF8011D
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:18:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8840BF8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Xm5uuVr/"
Received: by mail-wm1-x342.google.com with SMTP id r141so9090485wme.4
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 06:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Yw1UTNtycGA9FN9cisYCGkekiRR1izJVSuYv8MiVRlk=;
 b=Xm5uuVr/oWMODLgeT1dFlpvpSzfeEpSK6+zNmxsP7iPyv/NherpEdQIi3misQ/QSRe
 sTH+YftONMDkVMNsVQEYdKR1sA4Pw7nxRhyE7+bN8a5yZ8fPFbGA/aLswiy0vrwXoomf
 7JLCmpEgc5x/ZE7qABWh5nyKMVoiNu7YRo0BqmlYYvxAFgAtAcDjrLqlSN43NwyTdk/l
 wRoAXEeY2J9MKWLMe/imam9NpmEFaFyx4xwG7he/Qet3tdVbMDIxdi1ReCo+hLN7atPC
 rovpIBU1j5fFZBcDokPOb0T5JiB7N9l840VTu2McYvr9d+mo8bRZB3jfv/rxvYPpL3OL
 vmCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Yw1UTNtycGA9FN9cisYCGkekiRR1izJVSuYv8MiVRlk=;
 b=G9P6nIsYzrrwW/4H+LByR1zzAfyX3ztLGu4FBRL4MF9OOhP5O9SuntHiYkrj7fowL4
 CbT4280nbKNTjmcSUQNp7mly/OlhAg83W2Zmec8GEK4A1GNcRQ6SUg5SrHJ1EM6zw7lz
 cAnvOk3tjsabGLVcSoQnNDASx+HV/5bkLqaU2lt0ScGFQ/7N1KLMZwlYmJfu8gA0k9wx
 au/nYjUANtLSXNC8pNRNjtJ/2kN4uoSXQpqAuHFLWmQO06yKwFoB/Rhdl4u62R+SWDIP
 YMsRfoCZdJCSdIIYfpKUN2kUEZe5AwE5vaJfGozTEQyjn5QOqXDwY4yi1gn1pBHq2Z3V
 AS+Q==
X-Gm-Message-State: APjAAAXp08rUvArd2JsW/NOsJwlzC8LJNanaB+WNvXnF4zWZUeMMWo+/
 GTjdTJyQ1wHjLlLrGZQTEKdMlprWYW4uJ41ANXJYaw==
X-Google-Smtp-Source: APXvYqxy6b4KTX9IE+ET5/6aH6sCNx/NgcZ39CN3S5h6U1S2p657qFhC6jJhL6C0HI0dYZPzNs0ydcZ4eAXll6X7gfg=
X-Received: by 2002:a05:600c:2212:: with SMTP id
 z18mr16924236wml.154.1572268680300; 
 Mon, 28 Oct 2019 06:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000f838060595f602a7@google.com>
 <s5hr22xau8f.wl-tiwai@suse.de>
In-Reply-To: <s5hr22xau8f.wl-tiwai@suse.de>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 28 Oct 2019 14:17:48 +0100
Message-ID: <CAG_fn=VLxj9xKd_Wxm0cA1Lo7E6YG4SBsZ9EFnFj94TbE-6aPg@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, wang6495@umn.edu, yuehaibing@huawei.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, allison@lohutok.net,
 syzbot <syzbot+8f2612936028bfd28f28@syzkaller.appspotmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, benquike@gmail.com,
 dan.carpenter@oracle.com
Subject: Re: [alsa-devel] KMSAN: uninit-value in get_term_name
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

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMjoxMyBQTSBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2Uu
ZGU+IHdyb3RlOgo+Cj4gT24gTW9uLCAyOCBPY3QgMjAxOSAxMTozMjowNyArMDEwMCwKPiBzeXpi
b3Qgd3JvdGU6Cj4gPgo+ID4gVW5pbml0IHdhcyBzdG9yZWQgdG8gbWVtb3J5IGF0Ogo+ID4gIGtt
c2FuX3NhdmVfc3RhY2tfd2l0aF9mbGFncyBtbS9rbXNhbi9rbXNhbi5jOjE1MSBbaW5saW5lXQo+
ID4gIGttc2FuX2ludGVybmFsX2NoYWluX29yaWdpbisweGJkLzB4MTgwIG1tL2ttc2FuL2ttc2Fu
LmM6MzE5Cj4gPiAgX19tc2FuX2NoYWluX29yaWdpbisweDZiLzB4ZDAgbW0va21zYW4va21zYW5f
aW5zdHIuYzoxNzkKPiA+ICBwYXJzZV90ZXJtX3Byb2NfdW5pdCsweDczZC8weDdlMCBzb3VuZC91
c2IvbWl4ZXIuYzo4OTYKPiA+ICBfX2NoZWNrX2lucHV0X3Rlcm0rMHgxM2VmLzB4MjM2MCBzb3Vu
ZC91c2IvbWl4ZXIuYzo5ODkKPgo+IFNvIHRoaXMgY29tZXMgZnJvbSB0aGUgaW52YWxpZCBkZXNj
cmlwdG9yIGZvciBhIHByb2Nlc3NpbmcgdW5pdCwgYW5kCj4gaXQncyB2ZXJ5IGxpa2VseSB0aGUg
c2FtZSBpc3N1ZSBhcyBhbHJlYWR5IHNwb3R0ZWQgLS0gdGhlIHZhbGlkYXRvciB1cAo+IHRvIDUu
My1yYzQgaGFkIGEgYnVnIHRoYXQgcGFzc2VkIHRoZSBpbnZhbGlkIGRlc2NyaXB0b3IgZmFsc2Vs
eS4KPiBUaGlzIHNob3VsZCBoYXZlIGJlZW4gY292ZXJlZCBieSA1LjMtcmM1LCBjb21taXQgYmE4
YmYwOTY3YTE1ICgiQUxTQToKPiB1c2ItYXVkaW86IEZpeCBjb3B5JnBhc3RlIGVycm9yIGluIHRo
ZSB2YWxpZGF0b3IiKS4KQWgsIHRoYW5rcy4gTG9va3MgbGlrZSBJIG5lZWQgdG8gcmViYXNlIHRo
ZSBLTVNBTiB0cmVlLgo+Cj4gdGhhbmtzLAo+Cj4gVGFrYXNoaQoKCgotLSAKQWxleGFuZGVyIFBv
dGFwZW5rbwpTb2Z0d2FyZSBFbmdpbmVlcgoKR29vZ2xlIEdlcm1hbnkgR21iSApFcmlrYS1NYW5u
LVN0cmHDn2UsIDMzCjgwNjM2IE3DvG5jaGVuCgpHZXNjaMOkZnRzZsO8aHJlcjogUGF1bCBNYW5p
Y2xlLCBIYWxpbWFoIERlTGFpbmUgUHJhZG8KUmVnaXN0ZXJnZXJpY2h0IHVuZCAtbnVtbWVyOiBI
YW1idXJnLCBIUkIgODY4OTEKU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBIYW1idXJnCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
