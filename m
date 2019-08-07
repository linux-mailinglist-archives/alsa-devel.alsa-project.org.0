Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3326883EAE
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 03:15:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98A7B857;
	Wed,  7 Aug 2019 03:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98A7B857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565140538;
	bh=qzPevSh5RUC7ih9XTJDs+I3MCFxGm73MCIgl9VO5/5c=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z+jL74GFKnEFbDamcYWuVvMuw5ec6puWjLJPEruHjC+llGynsRTkvSJSOuiWKytR/
	 WzHrrszh5O/JRaIV98t0nrhPE86zlGw8fD77iO3GRDpjRIMUzCZbN0oy5FpXffE2ns
	 RNau3+RVjyjHTZFa4nBtia8bJ1lAJlXi715ikhFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6839F804CB;
	Wed,  7 Aug 2019 03:13:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7F10F80483; Wed,  7 Aug 2019 03:13:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 161F2F800F3
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 03:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 161F2F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SJOajrac"
Received: by mail-pf1-x441.google.com with SMTP id q10so42458253pff.9
 for <alsa-devel@alsa-project.org>; Tue, 06 Aug 2019 18:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=u4CFBN9jcxG6CFNFBBtApHbFd9s1AZ+ekko2NJrvock=;
 b=SJOajracFAt3ijWVg+xaCoFsDiOS0z6dXguBR3ct2tWASXNXm3ND0eBFc5aiQEqlkv
 Rx/XTPj2KqEB9hOzAc93i82xzgazlJevAuiGXOQ2J58m2isIRtl/whLs5CFd96GA7mvS
 YHrurPGFvI3f+Wq0N2QEzro2LC7QfjOWwvuMkQy0Q/OTQvX1oKsxm/p/jZ69o2ZmmGuz
 yJCycoVPICxMZKW5yANTPmkS/TcyZ3Ti1veEQ7TPNp+nT2EUIlJLK4MjQjTGwXDM48Qj
 lgpaPxWI+tV8jJnP73RbFBNWoZ37eYZiY96I+fKpgnBMA3tmyZKKELFCnxTz3fZtlrNW
 Ie3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=u4CFBN9jcxG6CFNFBBtApHbFd9s1AZ+ekko2NJrvock=;
 b=G9fgbmUTah32bZUwlMM/G+CuDTLivG1qN4U7z/1dxgzmBGAAZ4lcHWgBmHwzRBVG8p
 uY46fxR8cPe7vhe1pYvrJp1KuBuqU4FNvajIWykYZJE1RxwMgfrTyOmcBepYw7Z5Q0z9
 42XuwjrGLxzA1ncPWX3yKP/yy4ARC6F5PPlL2ZH7ko7SUVWvBIO4jUaTN5obvXWPwM2k
 V8noFFgy5MOWQgby8Ed78IqxKRdVJS3tqSC0/XOGin/sVvtUPiCo1APmAoxugL1pRizB
 g4BKfnYo/BnyOszE3FHF4hzbNL3js3BYrLCqi7RvEKa3S9iu7aXMXwyk0+Le8fbc7waE
 mp/w==
X-Gm-Message-State: APjAAAVm86zXLuW/f6//zw6eApsy9dwJosd/fUrugElziif+rwXgvm0u
 5GHsmENyk+tEofY1HnrkDC4=
X-Google-Smtp-Source: APXvYqw8kAF7UlF/qKmSi5AAFuHDbAWLLnoX4Lh+1nADuqi9UM9xsAI2PZwM/lrArwNjUY3moTd4iQ==
X-Received: by 2002:a62:174a:: with SMTP id 71mr6866238pfx.140.1565140426593; 
 Tue, 06 Aug 2019 18:13:46 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id r6sm49734116pjb.22.2019.08.06.18.13.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 18:13:46 -0700 (PDT)
Date: Tue, 6 Aug 2019 18:14:41 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Message-ID: <20190807011441.GC8938@Asurada-Nvidia.nvidia.com>
References: <20190728192429.1514-1-daniel.baluta@nxp.com>
 <20190728192429.1514-4-daniel.baluta@nxp.com>
 <20190729202154.GC20594@Asurada-Nvidia.nvidia.com>
 <CAEnQRZBN5Y+75cpgS2h3LwDj5BkF5cesqu6=V3GuPU4=5pgn6A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEnQRZBN5Y+75cpgS2h3LwDj5BkF5cesqu6=V3GuPU4=5pgn6A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Timur Tabi <timur@kernel.org>,
 Rob Herring <robh@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Mihai Serban <mihai.serban@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH v2 3/7] ASoC: fsl_sai: Add support to
 enable multiple data lines
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

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDY6MjM6MjdQTSArMDMwMCwgRGFuaWVsIEJhbHV0YSB3
cm90ZToKPiBPbiBNb24sIEp1bCAyOSwgMjAxOSBhdCAxMToyMiBQTSBOaWNvbGluIENoZW4gPG5p
Y29sZW90c3VrYUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFN1biwgSnVsIDI4LCAyMDE5
IGF0IDEwOjI0OjI1UE0gKzAzMDAsIERhbmllbCBCYWx1dGEgd3JvdGU6Cj4gPiA+IFNBSSBzdXBw
b3J0cyB1cCB0byA4IFJ4L1R4IGRhdGEgbGluZXMgd2hpY2ggY2FuIGJlIGVuYWJsZWQKPiA+ID4g
dXNpbmcgVENFL1JDRSBiaXRzIG9mIFRDUjMvUkNSMyByZWdpc3RlcnMuCj4gPiA+Cj4gPiA+IERh
dGEgbGluZXMgdG8gYmUgZW5hYmxlZCBhcmUgcmVhZCBmcm9tIERUIGZzbCxkbC1tYXNrIHByb3Bl
cnR5Lgo+ID4gPiBCeSBkZWZhdWx0IChpZiBubyBEVCBlbnRyeSBpcyBwcm92aWRlZCkgb25seSBk
YXRhIGxpbmUgMCBpcyBlbmFibGVkLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
QmFsdXRhIDxkYW5pZWwuYmFsdXRhQG54cC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgc291bmQvc29j
L2ZzbC9mc2xfc2FpLmMgfCAxMSArKysrKysrKysrLQo+ID4gPiAgc291bmQvc29jL2ZzbC9mc2xf
c2FpLmggfCAgNCArKystCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvZnNsL2Zz
bF9zYWkuYyBiL3NvdW5kL3NvYy9mc2wvZnNsX3NhaS5jCj4gPiA+IGluZGV4IDYzN2IxZDEyYTU3
NS4uNWU3Y2I3ZmQyOWY1IDEwMDY0NAo+ID4gPiAtLS0gYS9zb3VuZC9zb2MvZnNsL2ZzbF9zYWku
Ywo+ID4gPiArKysgYi9zb3VuZC9zb2MvZnNsL2ZzbF9zYWkuYwo+ID4gPiBAQCAtNjAxLDcgKzYw
MSw3IEBAIHN0YXRpYyBpbnQgZnNsX3NhaV9zdGFydHVwKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVh
bSAqc3Vic3RyZWFtLAo+ID4gPgo+ID4gPiAgICAgICByZWdtYXBfdXBkYXRlX2JpdHMoc2FpLT5y
ZWdtYXAsIEZTTF9TQUlfeENSMyh0eCksCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBG
U0xfU0FJX0NSM19UUkNFX01BU0ssCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICBGU0xf
U0FJX0NSM19UUkNFKTsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIEZTTF9TQUlfQ1Iz
X1RSQ0Uoc2FpLT5zb2NfZGF0YS0+ZGxfbWFza1t0eF0pOwo+ID4gPgo+ID4gPiAgICAgICByZXQg
PSBzbmRfcGNtX2h3X2NvbnN0cmFpbnRfbGlzdChzdWJzdHJlYW0tPnJ1bnRpbWUsIDAsCj4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICBTTkRSVl9QQ01fSFdfUEFSQU1fUkFURSwgJmZzbF9zYWlf
cmF0ZV9jb25zdHJhaW50cyk7Cj4gPiA+IEBAIC04ODgsNiArODg4LDE1IEBAIHN0YXRpYyBpbnQg
ZnNsX3NhaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiAgICAgICAg
ICAgICAgIH0KPiA+ID4gICAgICAgfQo+ID4gPgo+ID4gPiArICAgICAvKgo+ID4gPiArICAgICAg
KiBhY3RpdmUgZGF0YSBsaW5lcyBtYXNrIGZvciBUWC9SWCwgZGVmYXVsdHMgdG8gMSAob25seSB0
aGUgZmlyc3QKPiA+ID4gKyAgICAgICogZGF0YSBsaW5lIGlzIGVuYWJsZWQKPiA+ID4gKyAgICAg
ICovCj4gPiA+ICsgICAgIHNhaS0+ZGxfbWFza1tSWF0gPSAxOwo+ID4gPiArICAgICBzYWktPmRs
X21hc2tbVFhdID0gMTsKPiA+ID4gKyAgICAgb2ZfcHJvcGVydHlfcmVhZF91MzJfaW5kZXgobnAs
ICJmc2wsZGwtbWFzayIsIFJYLCAmc2FpLT5kbF9tYXNrW1JYXSk7Cj4gPiA+ICsgICAgIG9mX3By
b3BlcnR5X3JlYWRfdTMyX2luZGV4KG5wLCAiZnNsLGRsLW1hc2siLCBUWCwgJnNhaS0+ZGxfbWFz
a1tUWF0pOwo+ID4KPiA+IEp1c3QgY3VyaW91cyB3aGF0IGlmIHdlIGVuYWJsZSA4IGRhdGEgbGlu
ZXMgdGhyb3VnaCBEVCBiaW5kaW5ncwo+ID4gd2hpbGUgYW4gYXVkaW8gZmlsZSBvbmx5IGhhcyAx
IG9yIDIgY2hhbm5lbHMuIFdpbGwgVFJDRSBiaXRzIGJlCj4gPiBva2F5IHRvIHN0YXkgd2l0aCA4
IGRhdGEgY2hhbm5lbHMgY29uZmlndXJhdGlvbnM/IEJ0dywgaG93IGRvZXMKPiA+IERNQSB3b3Jr
IGZvciB0aGUgZGF0YSByZWdpc3RlcnM/IEVTQUkgaGFzIG9uZSBlbnRyeSBhdCBhIGZpeGVkCj4g
PiBhZGRyZXNzIGZvciBhbGwgZGF0YSBjaGFubmVscyB3aGlsZSBTQUkgc2VlbXMgdG8gaGF2ZSBk
aWZmZXJlbnQKPiA+IGRhdGEgcmVnaXN0ZXJzLgo+IAo+IEhpIE5pY29saW4sCj4gCj4gSSBoYXZl
IHNlbnQgdjMgYW5kIHJlbW92ZWQgdGhpcyBwYXRjaCBmcm9tIHRoZSBzZXJpZXMgYmVjYXVzZSB3
ZQo+IG5lZWQgdG8gZmluZCBhIGJldHRlciBzb2x1dGlvbi4KCkFjay4gSSB3YXMgaW4gdGhhdCBw
cml2YXRlIG1haWwgdGhyZWFkLiBTbyBpdCdzIHRvdGFsbHkgZmluZS4KCj4gCj4gSSB0aGluayB3
ZSBzaG91bGQgZW5hYmxlIFRDRSBiYXNlZCBvbiB0aGUgbnVtYmVyIG9mIGF2YWlsYWJsZSBkYXRh
bGluZXMKPiBhbmQgdGhlIG51bWJlciBvZiBhY3RpdmUgY2hhbm5lbHMuICBXaWxsIGNvbWUgd2l0
aCBhIFJGQyBwYXRjaCBsYXRlci4KClllYSwgdGhhdCdzIGV4YWN0bHkgd2hhdCBJIHN1c3BlY3Rl
ZCBkdXJpbmcgcGF0Y2ggcmV2aWV3IGFuZAp3aGF0IEkgc3VnZ2VzdGVkIHByZXZpb3VzbHkgdG9v
LiBMb29rIGZvcndhcmQgdG8geW91ciBwYXRjaC4KCj4gUGFzdGluZyBoZXJlIHRoZSByZXBseSBv
ZiBTQUkgQXVkaW8gSVAgb3duZXIgcmVnYXJkaW5nIHRvIHlvdXIgcXVlc3Rpb24gYWJvdmUsCj4g
anVzdCBmb3IgYW55b25lIHRvIGhhdmUgbW9yZSBpbmZvIG9mIG91ciBwcml2YXRlIGRpc2N1c3Np
b246Cj4gCj4gSWYgYWxsIDggZGF0YWxpbmVzIGFyZSBlbmFibGVkIHVzaW5nIFRDRSB0aGVuIHRo
ZSB0cmFuc21pdCBGSUZPIGZvcgo+IGFsbCA4IGRhdGFsaW5lcyBuZWVkIHRvIGJlIHNlcnZpY2Vk
LCBvdGhlcndpc2UgYSBGSUZPIHVuZGVycnVuIHdpbGwgYmUKPiBnZW5lcmF0ZWQuCj4gRWFjaCBk
YXRhbGluZSBoYXMgYSBzZXBhcmF0ZSB0cmFuc21pdCBGSUZPIHdpdGggYSBzZXBhcmF0ZSByZWdp
c3RlciB0bwo+IHNlcnZpY2UgdGhlIEZJRk8sIHNvIGVhY2ggZGF0YWxpbmUgY2FuIGJlIHNlcnZp
Y2VkIHNlcGFyYXRlbHkuIE5vdGUKPiB0aGF0IGNvbmZpZ3VyaW5nIEZDT01CPTIgd291bGQgbWFr
ZSBpdCBsb29rIGxpa2UgRVNBSSB3aXRoIGEgY29tbW9uCj4gYWRkcmVzcyBmb3IgYWxsIEZJRk9z
Lgo+IFdoZW4gcGVyZm9ybWluZyBETUEgdHJhbnNmZXJzIHRvIG11bHRpcGxlIGRhdGFsaW5lcywg
dGhlcmUgYXJlIGEKPiBjb3VwbGUgb2Ygb3B0aW9uczoKPiAgICAgKiBVc2UgMSBETUEgY2hhbm5l
bCB0byBjb3B5IGZpcnN0IHNsb3QgZm9yIGVhY2ggZGF0YWxpbmUgdG8gZWFjaAo+IEZJRk8gYW5k
IHRoZW4gdXBkYXRlIHRoZSBkZXN0aW5hdGlvbiBhZGRyZXNzIGJhY2sgdG8gdGhlIGZpcnN0Cj4g
cmVnaXN0ZXIuCj4gICAgICogQ29uZmlndXJlIHNlcGFyYXRlIERNQSBjaGFubmVsIGZvciBlYWNo
IGRhdGFsaW5lIGFuZCB0cmlnZ2VyIHRoZQo+IGZpcnN0IG9uZSBieSB0aGUgRE1BIHJlcXVlc3Qg
YW5kIHRoZSBzdWJzZXF1ZW50IGNoYW5uZWxzIGJ5IERNQQo+IGxpbmtpbmcgb3Igc2NhdHRlci9n
YXRoZXIuCj4gICAgICogQ29uZmlndXJlIEZDT01CPTIgYW5kIHRyZWF0IGl0IHRoZSBzYW1lIGFz
IHRoZSBFU0FJLiBUaGlzIGlzCj4gYWxtb3N0IHRoZSBzYW1lIGFzIDEsIGJ1dCBkb27igJl0IG5l
ZWQgdG8gdXBkYXRlIHRoZSBkZXN0aW5hdGlvbgo+IGFkZHJlc3MuCj4gCj4gVGhhbmtzLAo+IERh
bmllbC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxz
YS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8v
bWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
