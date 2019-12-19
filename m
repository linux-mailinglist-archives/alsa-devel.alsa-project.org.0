Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64800125CF1
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 09:48:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DB861670;
	Thu, 19 Dec 2019 09:47:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DB861670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576745293;
	bh=j9YV0xc+qzs4bKpi7KDjwWn+1sCwsdVQCyfREcRP5V8=;
	h=From:In-Reply-To:Date:References:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YK1UoeJkXY4+FGqMI0VU3mQT81567Ti30gwHwrz8Jf8mpaQUVpEMZ60uChFaRK3Mi
	 SsdYbW6sVAlnBcB+UhoQR6UxYGN/S9x2v6yzLGX/YbCknHeJgmP/4tHKYVkuGeclt1
	 blbICWU0XzyVXPk8fVnGMnIILxZRSpen0yMPJewA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FB80F80259;
	Thu, 19 Dec 2019 09:47:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6623AF80253; Thu, 19 Dec 2019 09:46:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0AC5F80059
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 09:46:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0AC5F80059
Received: from mail-pl1-f197.google.com ([209.85.214.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1ihrSR-0003Us-B0
 for alsa-devel@alsa-project.org; Thu, 19 Dec 2019 08:46:55 +0000
Received: by mail-pl1-f197.google.com with SMTP id x9so2735106plv.2
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 00:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Vp2GV8i9xcAytJon3XVj0XX7Dx8h1UzobuLJUs+dYoY=;
 b=p9aoLI1PdfqkaFja6qq2R9uBIAAE1JtfrltGFB2s76j+mQV3sc3o+NuVsrdfsR4LLs
 EGY0t6OHUQb3bwmIu9LDhbJotfzjrjrk55L+80u51s+BG5rzKa+Qe0ort4sj6kyBKABh
 pE6hQt4AFoU7+8nY+7Ku7YhKXqpnU09hNxmxEfXy3XKbEkz3D8mNCwzEKEHE1kZ/PIpT
 At4BpyALh49wW8b2dppycWYgPEIqMaCFx1nadgqMvaL6jD8o2ZIVb0NnwI5tQoe0DzV9
 6Y4whfF5m4JTvgmxWcvhy9ChP3JvOoGqA9tqJc8EZ9vxbToWBDMPh9YIWO/IyfYAB7hb
 3a3g==
X-Gm-Message-State: APjAAAWT/011Khf7FRpz3JKsZ+Ljtq/IXdHMHS/5uiWnAkwIBMQzx+CT
 GWislimeGSdpexfo5rUK1lQARWFckHFNMMHdi/Vndc2d+zP3V0vEF0rGpg5d9OU0w7YOzLrTADR
 eL3B3iIx1nSc2orxCNJ/jA5/BMj1NSAEHeiFyuklj
X-Received: by 2002:a63:ce4b:: with SMTP id r11mr8076524pgi.419.1576745213590; 
 Thu, 19 Dec 2019 00:46:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqx89zwG9BTZkXLeSj8nj6YQd/AV9RglJs7Ztbh7sVvaX7dBxxK43D/yaYG8K3ENbV91bXwkSg==
X-Received: by 2002:a63:ce4b:: with SMTP id r11mr8076500pgi.419.1576745213145; 
 Thu, 19 Dec 2019 00:46:53 -0800 (PST)
Received: from [10.101.46.91] (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id x197sm7186268pfc.1.2019.12.19.00.46.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Dec 2019 00:46:52 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
From: Kai Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5hzhfoyapv.wl-tiwai@suse.de>
Date: Thu, 19 Dec 2019 16:46:51 +0800
Message-Id: <B6186E38-B355-4465-9814-FDD66DA3C7ED@canonical.com>
References: <20191218132650.6303-1-hui.wang@canonical.com>
 <s5hlfr9zc67.wl-tiwai@suse.de>
 <EB061C4E-72BE-491B-ABAE-DFB96BEB7D7C@canonical.com>
 <e58306bc-8a2c-dcb5-c875-0dd4a2f3a51c@canonical.com>
 <EE459081-2B46-481C-ACE4-940552DEE098@canonical.com>
 <s5hzhfoyapv.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3594.4.19)
Cc: Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org
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

Cgo+IE9uIERlYyAxOSwgMjAxOSwgYXQgNDozNSBQTSwgVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNl
LmRlPiB3cm90ZToKPiAKPiBPbiBUaHUsIDE5IERlYyAyMDE5IDA3OjM3OjA3ICswMTAwLAo+IEth
aSBIZW5nIEZlbmcgd3JvdGU6Cj4+IAo+PiAKPj4gCj4+PiBPbiBEZWMgMTksIDIwMTksIGF0IDI6
MjMgUE0sIEh1aSBXYW5nIDxodWkud2FuZ0BjYW5vbmljYWwuY29tPiB3cm90ZToKPj4+IAo+Pj4g
Cj4+PiBPbiAyMDE5LzEyLzE5IOS4i+WNiDEyOjU1LCBLYWkgSGVuZyBGZW5nIHdyb3RlOgo+Pj4+
IEhpIEh1aSBhbmQgVGFrYXNoaSwKPj4+PiAKPj4+Pj4gT24gRGVjIDE5LCAyMDE5LCBhdCAzOjA2
IEFNLCBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+IHdyb3RlOgo+Pj4+PiAKPj4+Pj4gT24g
V2VkLCAxOCBEZWMgMjAxOSAxNDoyNjo1MCArMDEwMCwKPj4+Pj4gSHVpIFdhbmcgd3JvdGU6Cj4+
Pj4+PiBSZWNlbnRseSB3ZSBmb3VuZCB0aGUgaGVhZHNldC1taWMgb24gdGhlIERlbGwgRG9jayBX
RDE5IGRvZXNuJ3Qgd29yawo+Pj4+Pj4gYW55bW9yZSBhZnRlciBzMyAoczJpIG9yIGRlZXApLCB0
aGlzIHByb2JsZW0gY291bGQgYmUgd29ya2Fyb3VuZGVkIGJ5Cj4+Pj4+PiBjbG9zZWluZyAocGNt
X2Nsb3NlKSB0aGUgYXBwIGFuZCB0aGVuIHJlb3BlbmluZyAocGNtX29wZW4pIHRoZSBhcHAsIHNv
Cj4+Pj4+PiB0aGlzIGJ1ZyBpcyBub3QgZWFzeSB0byBiZSBkZXRlY3RlZCBieSB1c2Vycy4KPj4+
Pj4+IAo+Pj4+Pj4gV2hlbiBwcm9ibGVtIGhhcHBlbnMsIHJldGlyZV9jYXB0dXJlX3VyYigpIGNv
dWxkIHN0aWxsIGJlIGNhbGxlZAo+Pj4+Pj4gcGVyaW9kaWNhbGx5LCBidXQgdGhlIHNpemUgb2Yg
Y2FwdHVyZWQgZGF0YSBpcyBhbHdheXMgMCwgaXQgY291bGQgYmUKPj4+Pj4+IGEgZmlybXdhcmUg
YnVnIG9uIHRoZSBkb2NrLiBBbnl3YXkgSSBmb3VuZCBhZnRlciByZXN1bWluZywgdGhlCj4+Pj4+
PiBzbmRfdXNiX3BjbV9wcmVwYXJlKCkgd2lsbCBiZSBjYWxsZWQsIGFuZCBpZiB3ZSBmb3JjaWJs
eSBydW4KPj4+Pj4+IHNldF9mb3JtYXQoKSB0byBzZXQgdGhlIGludGVyZmFjZSBhbmQgaXRzIGVu
ZHBvaW50LCB0aGUgY2FwdHVyZQo+Pj4+Pj4gc2l6ZSB3aWxsIGJlIG5vcm1hbCBhZ2Fpbi4gVGhp
cyBwcm9ibGVtIGFuZCB3b3JrYW91bmQgYWxzbyBhcHBseSB0bwo+Pj4+Pj4gcGxheWJhY2suCj4+
Pj4+PiAKPj4+Pj4+IFRvIGZpeCBpdCBpbiB0aGUga2VybmVsLCBhZGQgYSBxdWlyayB0byBsZXQg
c2V0X2Zvcm1hdCgpIHJ1bgo+Pj4+Pj4gZm9yY2libHkgb25jZSBhZnRlciByZXN1bWUuCj4+Pj4+
PiAKPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEh1aSBXYW5nIDxodWkud2FuZ0BjYW5vbmljYWwuY29t
Pgo+Pj4+PiBUaGFua3MsIHRoZSB3b3JrYXJvdW5kIGxvb2tzIHJlYXNvbmFibGUuCj4+Pj4+IEkg
YXBwbGllZCBpdCBub3cgd2l0aCBDYyB0byBzdGFibGUuCj4+Pj4gSSBhbSBub3QgZW50aXJlbHkg
c3VyZSBpdOKAmXMgYSBrZXJuZWwgYnVnLiBbMV0gWzJdIGNhbiBhbHNvIGZpeCB0aGUgaXNzdWUu
Cj4+Pj4gCj4+Pj4gU2luY2UgVVNCIGF1ZGlvIGRvZXNu4oCZdCBoYXZlIFNORFJWX1BDTV9JTkZP
X1JFU1VNRSBjYXBhYmlsaXR5LAo+Pj4+IHVzZXJzcGFjZSBzaG91bGRu4oCZdCB0cnkgdG8gdXNl
IHNuZF9wY21fcmVzdW1lKCkuIENvbW1pdCBbMV0gdXNlcwo+Pj4+IHNuZF9wY21fZHJvcCgpIHRv
IG1ha2UgdGhlIGRldmljZSBsZWF2ZSBzdXNwZW5kZWQgc3RhdGUgYW5kIHRoZSBkZXZpY2UKPj4+
PiBiZWhhdmVzIGNvcnJlY3RseSB3aXRoIHRoZSBmaXguCj4+Pj4gCj4+Pj4gWzFdIGh0dHBzOi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9wdWxzZWF1ZGlvL3B1bHNlYXVkaW8vY29tbWl0L2Y3YjM1
MzdiYmY5YTY5MTZlZTNmZDcyYTgyMDI1NTE5YjRjMzQ2ZjUKPj4+PiBbMl0gaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL3B1bHNlYXVkaW8vcHVsc2VhdWRpby9jb21taXQvNzM0YTAwYzg0
OTgxNWE0NTY5Nzk3MGQ1OTMwNjhjMzAxYTA0ZWJiYgo+Pj4gCj4+PiBUaGFua3MgZm9yIHNoYXJp
bmcgdGhlIGluZm8sIFsxXSBjb3VsZCB3b3JrYXJvdW5kIHRoaXMgYnVnIGJlY2F1c2UgaXQgZmlu
YWxseSBjYWxsZWQgcGNtX2Nsb3NlKCkgYW5kIHBjbV9vcGVuKCksIFsyXSBkb2Vzbid0IGNoYW5n
ZSB0aGUgZXhlY3V0aW5nIHBhdGggaW4gdGggUEEsIGl0IGlzIGEgY29zbWV0aWMgaW1wcm92ZW1l
bnQgZm9yIFsxXS4KPj4gCj4+IEluIFsyXSwgaWYgUENNIGRvZXNuJ3Qgc3VwcG9ydCBoYXJkd2Fy
ZSByZXN1bWUsIGxpa2UgVVNCIGF1ZGlvLCBpdCBmYWxscyB0aHJvdWdoIHRvIGRlZmF1bHQgYW5k
IGNhbGxzIHNuZF9wY21fZHJvcCgpIHRvIGxldCBkZXZpY2UgbGVhdmUgc3VzcGVuZGVkIHN0YXRl
LiBTbyBpdOKAmXMgbW9yZSB0aGFuIGEgY29zbWV0aWMgY2hhbmdlLgo+IAo+IE5vdCByZWFsbHks
IHRoZSB3b3JsZCBpcyBub3Qgb25seSB3aXRoIFBBLgo+IAo+IFRoZSBzdGFuZGFyZCBhbHNhLWxp
YiBmdW5jdGlvbiBzbmRfcGNtX3JlY292ZXIoKSBqdXN0IGNhbGxzCj4gc25kX3BjbV9wcmVwYXJl
KCkgd2hlbiBzbmRfcGNtX3Jlc3VtZSgpIGZhaWxzLiAgVGhhdCBpcywgdGhlIHN0cmVhbSBpcwo+
IHJlLXByZXBhcmVkIGFuZCByZS10cmlnZ2VyZWQgd2l0aG91dCBjbG9zaW5nIGZvciB0aGUgZGV2
aWNlIHRoYXQgaGFzCj4gbm8gU05EUlZfUENNX0lORk9fUkVTVU1FIGZsYWcuCgpVbmRlcnN0b29k
LCBzbyB0aGF0J3MgaW5kZWVkIGEga2VybmVsIGJ1Zy4KCkthaS1IZW5nCgo+IAo+IAo+IFRha2Fz
aGkKPiAKPj4+IAo+Pj4gSSBndWVzcyBpdCBpcyBhIGZpcm13YXJlIHByb2JsZW0sIGFuZCBjb3Vs
ZCBiZSBmaXhlZCBpbiB0aGUga2VybmVsLiAgQmVjYXVzZSBJIHRlc3RlZCBtYW55IG90aGVyIHVz
YiBhdWRpbyBjYXJkcywgdGhleSBkb24ndCBuZWVkIHdvcmthcm91ZCBvZiBbMV0sIHRoZXkgYWxs
IGNvdWxkIHBsYXliYWNrIGFuZCBjYXB0dXJlIGFmdGVyIHJlc3VtaW5nLCBzbyB0aGlzIHByb2Js
ZW0gaXMgc3BlY2lmaWMgdG8gdGhpcyBoYXJkd2FyZS4gQW5kIGluIHRoZW9yeSBhIGRldmljZSBz
aG91bGQgd29yayBzYW1lIGJlZm9yZSBhbmQgYWZ0ZXIgc3VzcGVuZCwgIGl0IHNob3VsZCBub3Qg
ZGVwZW5kIG9uIHVzZXJzcGFjZSB0byBjbG9zZSBpdCBhbmQgcmVvcGVuIGl0LiBBZnRlciBhZGRp
bmcgdGhpcyBmaXgsIHRoaXMgdXNiIGF1ZGlvIGNhcmQgY291bGQgd29yayBhZnRlciByZXN1bWlu
ZyBldmVuIG9uIGEgc3lzdGVtIHdpdGhvdXQgUEEuIEFuZCB0aGlzIGtlcm5lbCBwYXRjaCBkb2Vz
bid0IGhhdmUgYW55IGNvbmZsaWN0IHdpdGggWzFdL1syXSBpbiB0aGUgUEEsIHRoZXkgY291bGQg
d29yayB3ZWxsIHRvZ2V0aGVyLgo+PiAKPj4gWWVzIHRoZSB0d28gYXBwcm9hY2hlcyBhcmUgb3J0
aG9nb25hbCBpbiBzb21lIHNlbnNlLiBIb3dldmVyIGlmIHRoZSBpc3N1ZSBjYW4gYmUgc29sdmVk
IGJ5IGZvbGxvd2luZyBhbHNhLWxpYidzIGRvY3VtZW50YXRpb24sIEkgZG9uJ3QgdGhpbmsgaXQn
cyBhIGtlcm5lbCBidWcuCj4+IAo+PiBLYWktSGVuZwo+PiAKPj4+IAo+Pj4gVGhhbmtzLAo+Pj4g
Cj4+PiBIdWkuCj4+PiAKPj4+IAo+Pj4+IEthaS1IZW5nCj4+Pj4gCj4+Pj4+IAo+Pj4+PiBUYWth
c2hpCj4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4+Pj4+IEFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+Pj4+IEFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwo+Pj4+PiBodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2Fsc2EtZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwK
