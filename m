Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1F5125B88
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 07:39:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E950E4E;
	Thu, 19 Dec 2019 07:38:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E950E4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576737543;
	bh=46+n7kLIZCyQ0ur7arBCJKMbal/ryHmWUhozwkGhD1o=;
	h=From:In-Reply-To:Date:References:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nlNsjxYFXqixmxvBRoNruYDumBsdXFQwXGmRYMDzgi3i3JZxmqX91Zr5SPWfxu33u
	 0r7OgtO8A18GHKfhsxf+rThRGAkFFUl9/6FK/6tf3/CA4iBipQKVm/WkSVCZC52IlL
	 NxAgP1xAC9ez1URMydnKhJrDlJdA+JWrLfgZwMpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C009F80253;
	Thu, 19 Dec 2019 07:37:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE0E4F80234; Thu, 19 Dec 2019 07:37:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0362F8014F
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 07:37:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0362F8014F
Received: from mail-pf1-f198.google.com ([209.85.210.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1ihpQt-0005EE-Qm
 for alsa-devel@alsa-project.org; Thu, 19 Dec 2019 06:37:12 +0000
Received: by mail-pf1-f198.google.com with SMTP id 6so3067368pfv.3
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 22:37:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=6PtqNAauBHXlI2hErtMai74CJflMbKjFTztGGFqRUnQ=;
 b=QMaAqkr2lf+0fuF3aR2f4nf4fmXkkaoTvuFONPWtkrPYBEbSy5U4NfBeEvGuFRT4cp
 3+08icWjMO/tCz0oemYDjUmnMSfDFYlV5fOYL2zI1Ejd60MUMriPYjGVHF99WxdHuTR4
 jkrqshrZ9lI2RNW/hK2lDWz33IElS5XPAAZ+XZWknKfjIVJ57cgtzxmgrMwTpWMVeY9Q
 h2z6EDggWWT2XbCB9N8QEhw9ocBmwXoP6yIp4hR3X4rj6l4Ko+9NFJkg3/ua4nUJOcPD
 7DWyzZlL1iHvHeTzOR/xk080c7lFzWp0c7j6Pfu2ZuwBa0i7xpeWQH52Oyc/E1LSPjUk
 9VXA==
X-Gm-Message-State: APjAAAXHdVWtCLX5eikzSceu3KiJG7MQWNLJnIwRp+gnEy1PiimbrCSg
 MEtgfA1s2uB2v1J0fLuxKWyOIjcb5UuiILoCcFTxaNTqyKpV2/0VU3OH4ECavXGAcZ+zgfART9X
 b5uuEd6EDdTjAVvi6/d3CSSM7jihSoWyTfOvI135R
X-Received: by 2002:a17:90a:9dc3:: with SMTP id
 x3mr7729034pjv.45.1576737430050; 
 Wed, 18 Dec 2019 22:37:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqy9e6T71WihqGrIK6nQsJhTxudFl1EyWhwDuianw6S7wTR5GRJdT3xyPVIaj6lNn1VZlz+0NA==
X-Received: by 2002:a17:90a:9dc3:: with SMTP id
 x3mr7729008pjv.45.1576737429714; 
 Wed, 18 Dec 2019 22:37:09 -0800 (PST)
Received: from [10.101.46.91] (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id r20sm5606444pgu.89.2019.12.18.22.37.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 22:37:09 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
From: Kai Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <e58306bc-8a2c-dcb5-c875-0dd4a2f3a51c@canonical.com>
Date: Thu, 19 Dec 2019 14:37:07 +0800
Message-Id: <EE459081-2B46-481C-ACE4-940552DEE098@canonical.com>
References: <20191218132650.6303-1-hui.wang@canonical.com>
 <s5hlfr9zc67.wl-tiwai@suse.de>
 <EB061C4E-72BE-491B-ABAE-DFB96BEB7D7C@canonical.com>
 <e58306bc-8a2c-dcb5-c875-0dd4a2f3a51c@canonical.com>
To: Hui Wang <hui.wang@canonical.com>
X-Mailer: Apple Mail (2.3594.4.19)
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: set the interface format
 after resume on Dell WD19
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

Cgo+IE9uIERlYyAxOSwgMjAxOSwgYXQgMjoyMyBQTSwgSHVpIFdhbmcgPGh1aS53YW5nQGNhbm9u
aWNhbC5jb20+IHdyb3RlOgo+IAo+IAo+IE9uIDIwMTkvMTIvMTkg5LiL5Y2IMTI6NTUsIEthaSBI
ZW5nIEZlbmcgd3JvdGU6Cj4+IEhpIEh1aSBhbmQgVGFrYXNoaSwKPj4gCj4+PiBPbiBEZWMgMTks
IDIwMTksIGF0IDM6MDYgQU0sIFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4gd3JvdGU6Cj4+
PiAKPj4+IE9uIFdlZCwgMTggRGVjIDIwMTkgMTQ6MjY6NTAgKzAxMDAsCj4+PiBIdWkgV2FuZyB3
cm90ZToKPj4+PiBSZWNlbnRseSB3ZSBmb3VuZCB0aGUgaGVhZHNldC1taWMgb24gdGhlIERlbGwg
RG9jayBXRDE5IGRvZXNuJ3Qgd29yawo+Pj4+IGFueW1vcmUgYWZ0ZXIgczMgKHMyaSBvciBkZWVw
KSwgdGhpcyBwcm9ibGVtIGNvdWxkIGJlIHdvcmthcm91bmRlZCBieQo+Pj4+IGNsb3NlaW5nIChw
Y21fY2xvc2UpIHRoZSBhcHAgYW5kIHRoZW4gcmVvcGVuaW5nIChwY21fb3BlbikgdGhlIGFwcCwg
c28KPj4+PiB0aGlzIGJ1ZyBpcyBub3QgZWFzeSB0byBiZSBkZXRlY3RlZCBieSB1c2Vycy4KPj4+
PiAKPj4+PiBXaGVuIHByb2JsZW0gaGFwcGVucywgcmV0aXJlX2NhcHR1cmVfdXJiKCkgY291bGQg
c3RpbGwgYmUgY2FsbGVkCj4+Pj4gcGVyaW9kaWNhbGx5LCBidXQgdGhlIHNpemUgb2YgY2FwdHVy
ZWQgZGF0YSBpcyBhbHdheXMgMCwgaXQgY291bGQgYmUKPj4+PiBhIGZpcm13YXJlIGJ1ZyBvbiB0
aGUgZG9jay4gQW55d2F5IEkgZm91bmQgYWZ0ZXIgcmVzdW1pbmcsIHRoZQo+Pj4+IHNuZF91c2Jf
cGNtX3ByZXBhcmUoKSB3aWxsIGJlIGNhbGxlZCwgYW5kIGlmIHdlIGZvcmNpYmx5IHJ1bgo+Pj4+
IHNldF9mb3JtYXQoKSB0byBzZXQgdGhlIGludGVyZmFjZSBhbmQgaXRzIGVuZHBvaW50LCB0aGUg
Y2FwdHVyZQo+Pj4+IHNpemUgd2lsbCBiZSBub3JtYWwgYWdhaW4uIFRoaXMgcHJvYmxlbSBhbmQg
d29ya2FvdW5kIGFsc28gYXBwbHkgdG8KPj4+PiBwbGF5YmFjay4KPj4+PiAKPj4+PiBUbyBmaXgg
aXQgaW4gdGhlIGtlcm5lbCwgYWRkIGEgcXVpcmsgdG8gbGV0IHNldF9mb3JtYXQoKSBydW4KPj4+
PiBmb3JjaWJseSBvbmNlIGFmdGVyIHJlc3VtZS4KPj4+PiAKPj4+PiBTaWduZWQtb2ZmLWJ5OiBI
dWkgV2FuZyA8aHVpLndhbmdAY2Fub25pY2FsLmNvbT4KPj4+IFRoYW5rcywgdGhlIHdvcmthcm91
bmQgbG9va3MgcmVhc29uYWJsZS4KPj4+IEkgYXBwbGllZCBpdCBub3cgd2l0aCBDYyB0byBzdGFi
bGUuCj4+IEkgYW0gbm90IGVudGlyZWx5IHN1cmUgaXTigJlzIGEga2VybmVsIGJ1Zy4gWzFdIFsy
XSBjYW4gYWxzbyBmaXggdGhlIGlzc3VlLgo+PiAKPj4gU2luY2UgVVNCIGF1ZGlvIGRvZXNu4oCZ
dCBoYXZlIFNORFJWX1BDTV9JTkZPX1JFU1VNRSBjYXBhYmlsaXR5LAo+PiB1c2Vyc3BhY2Ugc2hv
dWxkbuKAmXQgdHJ5IHRvIHVzZSBzbmRfcGNtX3Jlc3VtZSgpLiBDb21taXQgWzFdIHVzZXMKPj4g
c25kX3BjbV9kcm9wKCkgdG8gbWFrZSB0aGUgZGV2aWNlIGxlYXZlIHN1c3BlbmRlZCBzdGF0ZSBh
bmQgdGhlIGRldmljZQo+PiBiZWhhdmVzIGNvcnJlY3RseSB3aXRoIHRoZSBmaXguCj4+IAo+PiBb
MV0gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3B1bHNlYXVkaW8vcHVsc2VhdWRpby9j
b21taXQvZjdiMzUzN2JiZjlhNjkxNmVlM2ZkNzJhODIwMjU1MTliNGMzNDZmNQo+PiBbMl0gaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3B1bHNlYXVkaW8vcHVsc2VhdWRpby9jb21taXQv
NzM0YTAwYzg0OTgxNWE0NTY5Nzk3MGQ1OTMwNjhjMzAxYTA0ZWJiYgo+IAo+IFRoYW5rcyBmb3Ig
c2hhcmluZyB0aGUgaW5mbywgWzFdIGNvdWxkIHdvcmthcm91bmQgdGhpcyBidWcgYmVjYXVzZSBp
dCBmaW5hbGx5IGNhbGxlZCBwY21fY2xvc2UoKSBhbmQgcGNtX29wZW4oKSwgWzJdIGRvZXNuJ3Qg
Y2hhbmdlIHRoZSBleGVjdXRpbmcgcGF0aCBpbiB0aCBQQSwgaXQgaXMgYSBjb3NtZXRpYyBpbXBy
b3ZlbWVudCBmb3IgWzFdLgoKSW4gWzJdLCBpZiBQQ00gZG9lc24ndCBzdXBwb3J0IGhhcmR3YXJl
IHJlc3VtZSwgbGlrZSBVU0IgYXVkaW8sIGl0IGZhbGxzIHRocm91Z2ggdG8gZGVmYXVsdCBhbmQg
Y2FsbHMgc25kX3BjbV9kcm9wKCkgdG8gbGV0IGRldmljZSBsZWF2ZSBzdXNwZW5kZWQgc3RhdGUu
IFNvIGl04oCZcyBtb3JlIHRoYW4gYSBjb3NtZXRpYyBjaGFuZ2UuCgo+IAo+IEkgZ3Vlc3MgaXQg
aXMgYSBmaXJtd2FyZSBwcm9ibGVtLCBhbmQgY291bGQgYmUgZml4ZWQgaW4gdGhlIGtlcm5lbC4g
IEJlY2F1c2UgSSB0ZXN0ZWQgbWFueSBvdGhlciB1c2IgYXVkaW8gY2FyZHMsIHRoZXkgZG9uJ3Qg
bmVlZCB3b3JrYXJvdWQgb2YgWzFdLCB0aGV5IGFsbCBjb3VsZCBwbGF5YmFjayBhbmQgY2FwdHVy
ZSBhZnRlciByZXN1bWluZywgc28gdGhpcyBwcm9ibGVtIGlzIHNwZWNpZmljIHRvIHRoaXMgaGFy
ZHdhcmUuIEFuZCBpbiB0aGVvcnkgYSBkZXZpY2Ugc2hvdWxkIHdvcmsgc2FtZSBiZWZvcmUgYW5k
IGFmdGVyIHN1c3BlbmQsICBpdCBzaG91bGQgbm90IGRlcGVuZCBvbiB1c2Vyc3BhY2UgdG8gY2xv
c2UgaXQgYW5kIHJlb3BlbiBpdC4gQWZ0ZXIgYWRkaW5nIHRoaXMgZml4LCB0aGlzIHVzYiBhdWRp
byBjYXJkIGNvdWxkIHdvcmsgYWZ0ZXIgcmVzdW1pbmcgZXZlbiBvbiBhIHN5c3RlbSB3aXRob3V0
IFBBLiBBbmQgdGhpcyBrZXJuZWwgcGF0Y2ggZG9lc24ndCBoYXZlIGFueSBjb25mbGljdCB3aXRo
IFsxXS9bMl0gaW4gdGhlIFBBLCB0aGV5IGNvdWxkIHdvcmsgd2VsbCB0b2dldGhlci4KClllcyB0
aGUgdHdvIGFwcHJvYWNoZXMgYXJlIG9ydGhvZ29uYWwgaW4gc29tZSBzZW5zZS4gSG93ZXZlciBp
ZiB0aGUgaXNzdWUgY2FuIGJlIHNvbHZlZCBieSBmb2xsb3dpbmcgYWxzYS1saWIncyBkb2N1bWVu
dGF0aW9uLCBJIGRvbid0IHRoaW5rIGl0J3MgYSBrZXJuZWwgYnVnLgoKS2FpLUhlbmcKCj4gCj4g
VGhhbmtzLAo+IAo+IEh1aS4KPiAKPiAKPj4gS2FpLUhlbmcKPj4gCj4+PiAKPj4+IFRha2FzaGkK
Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBB
bHNhLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4gQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCj4+
PiBodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2Et
ZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFs
c2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczov
L21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
