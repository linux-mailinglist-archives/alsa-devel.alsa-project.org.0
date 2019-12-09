Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D82116717
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 07:52:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C70D01657;
	Mon,  9 Dec 2019 07:52:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C70D01657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575874377;
	bh=RRaiLK+i/SXB8CLwiHR8EWXiO6xBslafwQTzhpYMRlA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EjP/bidXUp3JgH7G6bv1gZaLLLU0o1oOPBbBUV8BaZGRkLEwJzEq2ie7ua+xqn4zy
	 33NDMiuYy8vGXSts1y5RAewcbYYcAelOV2k1m/oAF4XJoW6M+obkMn1DGcCuxYKczK
	 kCuZcFRlMpHSk6QcJqIwJBFTVENAtu7YGWxxA//A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56D44F80234;
	Mon,  9 Dec 2019 07:51:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E258F80234; Mon,  9 Dec 2019 07:51:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0B87F800E1
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 07:51:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0B87F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=vvdntech-in.20150623.gappssmtp.com
 header.i=@vvdntech-in.20150623.gappssmtp.com header.b="snUjhRqP"
Received: by mail-oi1-x243.google.com with SMTP id j22so5377131oij.9
 for <alsa-devel@alsa-project.org>; Sun, 08 Dec 2019 22:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vvdntech-in.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xES3L8EVlb99UD3dHjBfWmrIDGZ5ozkU1KWieWTafXw=;
 b=snUjhRqP7+o0d4MRCv61x8s8iISEkNh1/FfPONzOL/T68gRmh1MSjUzKuok9kToV6l
 MqxKeFPr6Uv9qOv9eLyjuutiw6WzZGoxYfit3DJFRWglo7959i6mf9WdTMVICHYNGs+W
 WPIzn9PaixEwmWReTB+I6BgRvJffRZ224t7bjdmAbc7gedRdIvVkIWQ9IBCK99bwqU0S
 8x1yHVEhsb1kW9PfnyWzb+Kzf5RIOYaMF/yM3iB8nMNBxtaSHyYXGqxBZr9oxY51j0Sy
 I7fE7Goir/HGdmIQ+W69payCUn2sTiJQTI7I+n8gpz4OkSVV/Vc9XN7qM5zlTNCZ+1c5
 Gaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xES3L8EVlb99UD3dHjBfWmrIDGZ5ozkU1KWieWTafXw=;
 b=jlgjxUMA6yIAYeuDX3yvMeXlfacH/+HdRH0vp77G4w1q57DCcUbu41Q1k3womOPxuS
 5y4YC3YutU2OpDCaFgTSI7YO4bw09eA2SXI5WUOI2sAidFG/LYcHt8jjCaHafUsa5cnr
 X+vgX+1xy2i3I2VQ2QtYfFNyavJS6UAJXlXbcFOSZSo6/jx8oI1Sm0dpHOuLln30kYXD
 KhEshofoM3Q85EY4unvldWeQHF+Amy7oB5134Ps6LCRllLRkTmOxnLhtzdqJZ0ErBRHn
 /KU+fC0eAiF/mZ36nlqj2jJMTOUbxL/CPqFJz5yXEgHqBTl1TCc7PttmByBvsdLCjTFp
 5W5g==
X-Gm-Message-State: APjAAAUzNFxUYSxpJ8w8nBfcHAmuHwlKJ8mBcjTmfA5VQ5RNd7ujRg9Q
 +nR2CACpk3Q+efydJyQsd/a22LZAbZJmrY394qSmR/v2sBZaUEB2e0XKtxKHNZ1tssrAaEtv7zU
 RPs2HER9unwT9tZX/KRaSwZrer0dwwQC8nq297A==
X-Google-Smtp-Source: APXvYqzLWrJ3dfnf6B9lgJC6ilA+n8ASU6MJdPvDqRpdYXkybtgcQk1QC+RfSsMih0v/RJSrk7pRAJnc64J0QTGj8f4=
X-Received: by 2002:a05:6808:a9c:: with SMTP id
 q28mr23223162oij.176.1575874264623; 
 Sun, 08 Dec 2019 22:51:04 -0800 (PST)
MIME-Version: 1.0
References: <CAMM7-fe=NAH_tEFsE+RV-eA1KLkhaim_3w4YK3wjqDYea_2TtA@mail.gmail.com>
 <d4f21304-d5b0-5acd-2595-4cb7aa684da3@linux.intel.com>
In-Reply-To: <d4f21304-d5b0-5acd-2595-4cb7aa684da3@linux.intel.com>
From: Mohan Prasath Ramamoorthy <mohan.prasath@vvdntech.in>
Date: Mon, 9 Dec 2019 12:20:53 +0530
Message-ID: <CAMM7-ff0m=VZ-neyjt-7xFUmgD-36rULHbLpuf4=L57-HvRo3Q@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Playback issue while recording simultaneously
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

SGkgUGllcnJlLUxvdWlzLAoKVGhhbmsgeW91IGZvciB5b3VyIHF1aWNrIHJlc3BvbnNlLgoKU2hh
bGwgSSBrbm93IHdoYXQgZG9lcyB0aGUgYmVsb3cgZXJyb3IgbWVhbj8KCmFwbGF5OiBwY21fd3Jp
dGU6MTk0MDogd3JpdGUgZXJyb3I6IElucHV0L291dHB1dCBlcnJvcgoKT24gRnJpLCBEZWMgNiwg
MjAxOSBhdCA5OjIxIFBNIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0CjxwaWVycmUtbG91aXMuYm9zc2Fy
dEBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDEyLzUvMTkgMTE6MjIgUE0sIE1v
aGFuIFByYXNhdGggUmFtYW1vb3J0aHkgd3JvdGU6Cj4gPiBEZWFyIEFsbCwKPiA+Cj4gPiBXZSBh
cmUgd29ya2luZyBvbiBleHRlcm5hbCBtb2R1bGVzIG9mIG1pY3JvcGhvbmUgYW5kIHNwZWFrZXIg
YW5kIHdlCj4gPiBhcmUgdXNpbmcgdGhlIGtlcm5lbCB2ZXJzaW9uIDMuMTAuOTYKPgo+IHdvdywg
dGhhdCBpcyBvbmUgYW5jaWVudCBrZXJuZWwgRU9MJ2VkIGluIDIwMTcuLi4KPgo+ID4KPiA+IFdl
IGFyZSByZWNvcmRpbmcgd2l0aCBjb21tYW5kcyBsaWtlIGFyZWNvcmQgYW5kIGFwbGF5IGZvciBy
ZWNvcmRpbmcKPiA+IGFuZCBwbGF5YmFjayByZXNwZWN0aXZlbHkuCj4gPgo+ID4gV2hpbGUgZG9p
bmcgdGhlIGJlbG93IGV4cGVyaW1lbnRzIHdlIGNvdWxkIGFibGUgdG8gb2JzZXJ2ZSBhbiBpc3N1
ZSBhcyBiZWxvdywKPiA+Cj4gPiAxLiBXaXRoIG9ubHkgcmVjb3JkaW5nIGFuZCBub3QgcGxheWJh
Y2sgd2UgaGF2ZW4ndCBmYWNlZCBhbnkgaXNzdWVzLgo+ID4gMi4gV2l0aCBvbmx5IHBsYXliYWNr
IGFuZCBub3QgcmVjb3JkaW5nIHdlIGhhdmVuJ3QgZmFjZWQgYW55IGlzc3Vlcy4KPiA+Cj4gPiAz
LiBCeSBzdGFydGluZyBhbiBpbmZpbml0ZSByZWNvcmRpbmcgaW4gdGhlIGJhY2tncm91bmQgYW5k
IGJ5IGRvaW5nIGEKPiA+IHBsYXliYWNrIG9mIHRoZSBhdWRpbyBmaWxlKDMwc2Vjb25kcywgdGhl
IHNhbXBsaW5nIHJhdGUgb2YgMjIwNTAsIHRoZQo+ID4gY2hhbm5lbCBpcyBzdGVyZW8pLCBhZnRl
ciBzb21lIGl0ZXJhdGlvbnMsIHdlIGFyZSBmYWNpbmcgYSBiZWxvdyBlcnJvcgo+ID4gYW5kIHdl
IGNvdWxkIG5vdCBhYmxlIHRvIGxpc3RlbiB0byB0aGUgYXVkaW8uCj4gPgo+ID4gRXJyb3I6IGFw
bGF5OiBwY21fd3JpdGU6MTk0MDogd3JpdGUgZXJyb3I6IElucHV0L291dHB1dCBlcnJvcgo+ID4K
PiA+IEJlbG93IGFyZSB0aGUgcmVzcGVjdGl2ZSBjb21tYW5kcyBmb3IgcmVjb3JkaW5nIGFuZCBw
bGF5YmFjaywKPiA+Cj4gPiAxLiBhcmVjb3JkIC1EIGh3OjAsMCAtYyAyIC1mIHMxNl9sZSAtciA4
MDAwIC9ob21lL3VidW50dS9taWNfdGVzdGluZy53YXYgJgo+ID4gMi4gYXBsYXkgLUQgaHc6MCwz
IGF1ZGlvXzIya19jMi53YXYKPiA+Cj4gPiBCdXQgd2hlbiB0aGUgaXNzdWVzIGNvbWUsIHdlIGp1
c3Qgc3RvcHBlZCByZWNvcmRpbmcgYW5kIHJlc3RhcnRlZCB0aGUKPiA+IHJlY29yZGluZyBpbiB0
aGUgYmFja2dyb3VuZC4gQWZ0ZXIgdGhpcywgdGhlIHBsYXliYWNrIGlzIHdvcmtpbmcgZmluZS4K
PiA+Cj4gPiBBbHNvLCBkdXJpbmcgdGhlIGlzc3VlIGNhbWUsIHdlIGhhdmUgY2hlY2tlZCBmb3Ig
dGhlIGJlbG93IHByb3BlcnRpZXMsCj4gPgo+ID4gMS4gSTJTIGhhcyBiZWVuIGVuYWJsZWQuIENo
ZWNrZWQgdW5kZXIgdGhlIGZpbGU6Cj4gPiAvc3lzL2tlcm5lbC9kZWJ1Zy9jbG9jay9jbG9ja190
cmVlCj4gPiAyLiBEcml2ZXIgY2FsbGJhY2tzIGhhdmUgYmVlbiBjYWxsZWQuIChDaGVja2VkIHdp
dGggdGhlIGtlcm5lbCBsb2dzW2RtZXNnXSkKPiA+Cj4gPiBXZSB3b3VsZCBsaWtlIHRvIGtub3cg
dGhlIHJlYXNvbiBiZWhpbmQgdGhpcyBlcnJvci4/Cj4KPiBTb3VuZHMgdHlwaWNhbCBvZiBhbiBp
bnRlcmZlcmVuY2UgYmV0d2VlbiB0aGUgcGxheWJhY2sgYW5kIHJlY29yZAo+IHByb2dyYW1taW5n
IGZsb3dzLCBlLmcuIHdoZW4gY2hhbmdpbmcgYSBzaGFyZWQgcmVnaXN0ZXIuIE5vdCBhbGwgSTJT
Cj4gdG9sZXJhdGUgZHluYW1pYyBjaGFuZ2VzIGZyb20gUlggb3IgVFggb25seSB0byBmdWxsLWR1
cGxleC4KCgoKLS0gCgpXaXRoIEJlc3QgUmVnYXJkcywKCk1vaGFuIFByYXNhdGgKClZWRE4gVGVj
aG5vbG9naWVzIFB2dCBMdGQKCkNlbGw6ICs5MSA5NjI5NzY4OTE5CgpXZWI6IHd3dy52dmRudGVj
aC5jb20KCi0tIAoKCl9EaXNjbGFpbWVyOsKgX8KpIDIwMTkgVlZETiBUZWNobm9sb2dpZXMgUHZ0
LiBMdGQuIFRoaXMgZS1tYWlsIGNvbnRhaW5zIApQUklWSUxFR0VEIEFORCBDT05GSURFTlRJQUwg
SU5GT1JNQVRJT04gaW50ZW5kZWQgc29sZWx5IGZvciB0aGUgdXNlIG9mIHRoZSAKYWRkcmVzc2Vl
KHMpLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5
IHRoZSAKc2VuZGVyIGJ5IGUtbWFpbCBhbmQgZGVsZXRlIHRoZSBvcmlnaW5hbCBtZXNzYWdlLiBG
dXJ0aGVyLCB5b3UgYXJlIG5vdCB0byAKY29weSwgZGlzY2xvc2UsIG9yIGRpc3RyaWJ1dGUgdGhp
cyBlLW1haWwgb3IgaXRzIGNvbnRlbnRzIHRvIGFueSBvdGhlciAKcGVyc29uIGFuZCBhbnkgc3Vj
aCBhY3Rpb25zIGFyZSB1bmxhd2Z1bC5fCl8KXwpfCl9fCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
