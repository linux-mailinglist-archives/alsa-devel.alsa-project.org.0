Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEE34191CB
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 11:50:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1243215E2;
	Mon, 27 Sep 2021 11:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1243215E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632736212;
	bh=5/O8CYJlN4uZxjMCvcyAL78CK7D5cqxbQxRfwCHwRxM=;
	h=Date:To:From:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=PURqO7GhuUDZh98BTvrZi3SCOwzyftTtGEamG6L8KgAgCXoyU1UWpSmTF0WNm399P
	 Qj108n3dRK4ShfaQfAA2DHeNolR2ulxIHQS5eHLYHqrRO+tJ1K3s8S+dZRKXX6ngvL
	 pW7SLn/SWKC+DQMooviG7RTuGrrcEjCesP4qbHV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46D60F8026D;
	Mon, 27 Sep 2021 11:48:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8807F80227; Mon, 27 Sep 2021 11:48:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-4324.protonmail.ch (mail-4324.protonmail.ch [185.70.43.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E86AF801EC
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 11:48:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E86AF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="c15vI2N/"
Date: Mon, 27 Sep 2021 09:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1632736121;
 bh=Zbz7B+czJeIGKueoA8021pfxY8WPkNndP2nEo4KIJGY=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=c15vI2N/d813CEIdQUmTtxb5CwoZXP83SyvhMIKQxyn5X7Cuzy4Tbl46AEWgzqsdO
 JZoVPPOwly1AiAVgDVyn6BCJUnr8CLWg6X72/IeTHKZHVMx5bPXqaCdwfnROTngntn
 dbi83WJXf3yAw2cxycLt/ongNzIvusvJWcKQtR6Y=
To: Philippe Bekaert <linux@panokkel.be>
From: Ryan McClue <re.mcclue@protonmail.com>
Subject: Re: Broken Pipe with SNDRV_PCM_IOCTL_WRITEI_FRAMES
Message-ID: <LbE6DXUg6fRyfL7omd8Zhvp41ri631aIE8HNZD4U0r7ahNR0oPk3sr6VWbXhYV0gi1FObEGQIN3dMshThnGBNxat4yLXhfyms0BZtIP5nAA=@protonmail.com>
In-Reply-To: <11502B6C-870C-4BC1-BE44-78971E548ABD@panokkel.be>
References: <aMjqrUVYYlPC6M_ZW7GlV0WUwUzJimDuTXi2mWq62PH9GbMUmTMK0ECdR837FlWMPQd8sP57TNh3Coq19l0gm75NBOh7oqPGpl7ARwjF-u0=@protonmail.com>
 <_PhylB5sSzE44xsNHmeiM9rZHJxEiTmQ2UUuR6UgmpgyLolZQDzgQlPWNvRezAViAVXF-qKegbkLhhMVMMGD1mKQSs-FqjrF1uhMQ5SliVE=@protonmail.com>
 <11502B6C-870C-4BC1-BE44-78971E548ABD@panokkel.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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
Reply-To: Ryan McClue <re.mcclue@protonmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGkgUGhpbGlwcGUsCk15IHJlYXNvbiBmb3IgdXNpbmcgaW9jdGwoKSdzIGlzIHRvIGJldHRlciB1
bmRlcnN0YW5kIGhvdyBBTFNBIHdvcmtzLiBJJ20gdmVyeSBjbG9zZSB0byBhY2hpZXZpbmcgbXkg
Z29hbCBvZiBwbGF5aW5nIHBjbSB3aXRoIGlvY3RsKCkncy4gSSB3YW50IHRvIG1ha2UgdGhlIGNv
ZGUgcHVibGljIHNvIGV2ZXJ5b25lIGNhbiBnYWluIGJldHRlciBrbm93bGVkZ2Ugb2YgbGludXgg
c291bmQuCkluIHJlZ2FyZHMgdG8gdXNpbmcgYWxzYS1saWIsIEkgY2FuIGVxdWF0ZSBteSBleGFt
cGxlIHRvIHNuZF9wY21fd3JpdGVpKCkgYW5kIHNuZF9wY21fcHJlcGFyZSgpCkFzIEkgdW5kZXJz
dGFuZCBpdCwgdGhlIEVQSVBFIGluZGljYXRlcyBhIGJ1ZmZlciB1bmRlcnJ1bi4gSG93ZXZlciwg
SSdtIHJlY292ZXJpbmcgd2l0aCBwcmVwYXJlLgpXaHkgd291bGQgdGhlcmUgYmUgdG90YWwgc2ls
ZW5jZT8KLS0KUnlhbiBNY0NsdWUsIFN5ZG5leQoK4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ4oCQIE9yaWdp
bmFsIE1lc3NhZ2Ug4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ4oCQCk9uIE1vbmRheSwgU2VwdGVtYmVyIDI3
dGgsIDIwMjEgYXQgNzoyMSBQTSwgUGhpbGlwcGUgQmVrYWVydCA8bGludXhAcGFub2trZWwuYmU+
IHdyb3RlOgoKPiBIaSBSeWFuLAo+Cj4gSSByZWFsaXplIHRoaXMgaXMgcHJvYmFibHkgbm90IHRo
ZSBhbnN3ZXIgeW91IGFyZSB3YWl0aW5nIGFuZCBob3BpbmcgZm9yLCBidXQgd2h5IGRvIHlvdSB1
c2UgdGhlIGlvY3RsIGludGVyZmFjZSBkaXJlY3RseSBpbiB0aGUgZmlyc3QgcGxhY2U/Cj4gUGVv
cGxlIG9uIHRoaXMgbGlzdCB3aWxsIGxpa2VseSBiZSBtb3JlIGFsYXJtZWQgaWYgeW91IGhhZCBw
cm9ibGVtcyB3aXRoIGF1ZGlvIEkvTywgd2hlbiBkb25lIGFzIGV4cGxhaW5lZCBvbgo+IGh0dHBz
Oi8vd3d3LmFsc2EtcHJvamVjdC5vcmcvYWxzYS1kb2MvYWxzYS1saWIvcGNtLmh0bWwKPiBhbmQg
aWxsdXN0cmF0ZWQgaW4gdGhlIGV4YW1wbGVzLgo+Cj4gQmVzdCwKPgo+IFBoaWxpcHBlLgo+Cj4+
IE9uIDI3IFNlcCAyMDIxLCBhdCAwMToyMSwgUnlhbiBNY0NsdWUgPHJlLm1jY2x1ZUBwcm90b25t
YWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IEkndmUgdXBkYXRlIG15IGxvb3AgdG86Cj4+Cj4+IHN0cnVj
dAo+Pgo+PiBzbmRfeGZlcmkKPj4KPj4gdHJhbnNmZXIKPj4KPj4gPQo+Pgo+PiB7fTsKPj4gdHJh
bnNmZXIuYnVmID0gKHU4ICopYnVmZmVyOwo+PiB0cmFuc2Zlci5mcmFtZXMgPSBudW1fYmFzZV9z
YW1wbGVzOwo+Pgo+PiBpbnQKPj4KPj4gcmVzID0gaW9jdGwoZmQsIFNORFJWX1BDTV9JT0NUTF9X
UklURUlfRlJBTUVTLCAmdHJhbnNmZXIpOwo+Pgo+PiBpZgo+Pgo+PiAocmVzID09IC1FUElQRSkg
ewo+PiBpb2N0bChmZCwgU05EUlZfUENNX0lPQ1RMX1BSRVBBUkUpOwo+Pgo+PiBUaGlzIHJlbW92
ZXMgdGhlIEJyb2tlbiBQaXBlLCBob3dldmVyIG5vIHNvdW5kIGlzIGhlYXJkLgo+PiAtLQo+PiBS
eWFuIE1jQ2x1ZSwgU3lkbmV5Cj4+Cj4+IOKAkOKAkOKAkOKAkOKAkOKAkOKAkCBPcmlnaW5hbCBN
ZXNzYWdlIOKAkOKAkOKAkOKAkOKAkOKAkOKAkAo+PiBPbiBTdW5kYXksIFNlcHRlbWJlciAyNnRo
LCAyMDIxIGF0IDc6MDEgUE0sIFJ5YW4gTWNDbHVlIDxyZS5tY2NsdWVAcHJvdG9ubWFpbC5jb20+
IHdyb3RlOgo+Pgo+Pj4gSGVsbG8gYWdhaW4uCj4+PiBJJ20gdXNpbmcgYWxzYS1rZXJuZWwuCj4+
PiBNeSBjb25maWd1cmF0aW9uOgo+Pj4gU05EUlZfUENNX0hXX1BBUkFNX0FDQ0VTUyA9IFNORFJW
X1BDTV9BQ0NFU1NfUldfSU5URVJMRUFWRUQKPj4+IFNORFJWX1BDTV9IV19QQVJBTV9GT1JNQVQg
PSBTTkRSVl9QQ01fRk9STUFUX1MxNl9MRQo+Pj4gU05EUlZfUENNX0hXX1BBUkFNX1NVQkZPUk1B
VCA9IFNORFJWX1BDTV9TVUJGT1JNQVRfU1RECj4+PiBTTkRSVl9QQ01fSFdfUEFSQU1fQ0hBTk5F
TFMgPSAyCj4+PiBTTkRSVl9QQ01fSFdfUEFSQU1fUkFURSA9IDQ4MDAwCj4+Pgo+Pj4gSSBoYXZl
IGEgdnN5bmNlZCBnYW1lIGxvb3AgdGhhdCBpcyBydW5uaW5nIGF0IDYwZnBzOgo+Pj4KPj4+PiBp
bnQgbnVtX2Jhc2Vfc2FtcGxlcyA9IDQ4MDAwICogKDEgLyA2MCk7Cj4+Pj4gaW50IG51bV9zYW1w
bGVzID0gbnVtX2Jhc2Vfc2FtcGxlcyAqIDI7Cj4+Pj4gaW50MTZfdCBidWZmZXJbbnVtX3NhbXBs
ZXNdID0ge307Cj4+Pj4KPj4+PiB3aGlsZSAodHJ1ZSkgewo+Pj4+IGludDE2X3QgKnNhbXBsZXMg
PSBidWZmZXI7Cj4+Pj4gZm9yIChpbnQgc2FtcGxlX2kgPSAwOyBzYW1wbGVfaSA8IG51bV9iYXNl
X3NhbXBsZXM7IHNhbXBsZV9pKyspIHsKPj4+PiAqc2FtcGxlcysrID0gMHgzMzsKPj4+PiAqc2Ft
cGxlcysrID0gMHgzMzsKPj4+PiB9Cj4+Pj4KPj4+PiBzdHJ1Y3Qgc25kX3hmZXJpIHRyYW5zZmVy
ID0ge307Cj4+Pj4gdHJhbnNmZXIuYnVmID0gYnVmZmVyOwo+Pj4+IHRyYW5zZmVyLmZyYW1lcyA9
IG51bV9iYXNlX3NhbXBsZXM7Cj4+Pj4gaW9jdGwoZmQsIFNORFJWX1BDTV9JT0NUTF9XUklURUlf
RlJBTUVTLCAmdHJhbnNmZXIpOwo+Pj4+Cj4+Pj4gLy8gaW9jdGwoZmQsIFNORFJWX1BDTV9JT0NU
TF9EUkFJTik7IC0tPiBORUNFU1NBUlk/Pz8KPj4+PiAvLyBpb2N0bChmZCwgU05EUlZfUENNX0lP
Q1RMX1BSRVBBUkUpOyAtLT4gTkVDRVNTQVJZPz8/Cj4+Pj4gfQo+Pj4KPj4+IE9uIHRoZSBmaXJz
dCBpdGVyYXRpb24gb2YgU05EUlZfUENNX0lPQ1RMX1dSSVRFSV9GUkFNRVMgSSBnZXQgbm8gZXJy
b3IuCj4+PiBBbGwgc3Vic2VxdWVudCBpdGVyYXRpb25zLCBJIGdldCBCcm9rZW4gUGlwZSBlcnJv
ci4KPj4+IFNvLCB0byBjb3VudGVyYWN0IHRoaXMgYXQgdGhlIGVuZCBvZiBlYWNoIGZyYW1lIEkg
Y2FsbCBTTkRSVl9QQ01fSU9DVExfRFJBSU4gYW5kIFNORFJWX1BDTV9JT0NUTF9QUkVQQVJFLgo+
Pj4gVGhpcyByZW1vdmVzIHRoZSBCcm9rZW4gUGlwZSBlcnJvciBob3dldmVyIHNsb3dzIHRoZSBw
cm9ncmFtIGRvd24gYnkgaGFsZiBhbmQgbm8gc291bmQgaXMgaGVhcmQuCj4+PiBIb3cgYmVzdCB0
byBzb2x2ZSB0aGlzIGlzc3VlPwo+Pj4KPj4+IFRoYW5rcyBhZ2Fpbgo+Pj4gLS0KPj4+IFJ5YW4g
TWNDbHVlLCBTeWRuZXk=
