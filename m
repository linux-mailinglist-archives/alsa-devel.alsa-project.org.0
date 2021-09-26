Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 930B3418D09
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 01:23:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F422E165E;
	Mon, 27 Sep 2021 01:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F422E165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632698580;
	bh=X6ERYPgTJjMShIXL4jCKmGVIRV02j9gNk3mpKnEKnzw=;
	h=Date:To:From:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=NZn7WNiVFOLrVyCAL8cVub0KcIt06+u7/53d2NbckM16qwJFOgCtOSva9eaGE0LdQ
	 jldpCFM/djRgKOYPLD1cz3y9Eqz6ZLZKhAv1Gny4VjK2A78+iLeOafL5igYnmt/fqk
	 XNyV4hQQ3xuPOODdyCwSO8ufQH8tA0/e2oSIBrj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48254F804AD;
	Mon, 27 Sep 2021 01:21:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27A4FF804AD; Mon, 27 Sep 2021 01:21:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D944F80246
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 01:21:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D944F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="MSxob8mO"
Date: Sun, 26 Sep 2021 23:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1632698490;
 bh=FO4CyyDiDoIqcst24P2c0wJN4wJ5Ym5cJicFYcaxJmU=;
 h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
 b=MSxob8mODlz5Lf8TtMIQeX3HdcpThBrYjoBnZe4Cy58ZXYEzlmK1i2Bgp+ZTLBMJT
 MOjaYH+S/IXwduBJ5cVBk3cYYS5zIhX3QUeCivrajeUSeHGvLGcyyzQv9HMEo9+49n
 ACFQF5wl/PimqXzJroNIULRblhDtkLkMkb/a1EBM=
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Ryan McClue <re.mcclue@protonmail.com>
Subject: Re: Broken Pipe with SNDRV_PCM_IOCTL_WRITEI_FRAMES
Message-ID: <_PhylB5sSzE44xsNHmeiM9rZHJxEiTmQ2UUuR6UgmpgyLolZQDzgQlPWNvRezAViAVXF-qKegbkLhhMVMMGD1mKQSs-FqjrF1uhMQ5SliVE=@protonmail.com>
In-Reply-To: <aMjqrUVYYlPC6M_ZW7GlV0WUwUzJimDuTXi2mWq62PH9GbMUmTMK0ECdR837FlWMPQd8sP57TNh3Coq19l0gm75NBOh7oqPGpl7ARwjF-u0=@protonmail.com>
References: <aMjqrUVYYlPC6M_ZW7GlV0WUwUzJimDuTXi2mWq62PH9GbMUmTMK0ECdR837FlWMPQd8sP57TNh3Coq19l0gm75NBOh7oqPGpl7ARwjF-u0=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

SSd2ZSB1cGRhdGUgbXkgbG9vcCB0bzoKCnN0cnVjdAoKc25kX3hmZXJpCgp0cmFuc2ZlcgoKPQoK
e307CiAgdHJhbnNmZXIuYnVmID0gKHU4ICopYnVmZmVyOwogIHRyYW5zZmVyLmZyYW1lcyA9IG51
bV9iYXNlX3NhbXBsZXM7CgppbnQKCnJlcyA9IGlvY3RsKGZkLCBTTkRSVl9QQ01fSU9DVExfV1JJ
VEVJX0ZSQU1FUywgJnRyYW5zZmVyKTsKCmlmCgoocmVzID09IC1FUElQRSkgewogICAgaW9jdGwo
ZmQsIFNORFJWX1BDTV9JT0NUTF9QUkVQQVJFKTsKClRoaXMgcmVtb3ZlcyB0aGUgQnJva2VuIFBp
cGUsIGhvd2V2ZXIgbm8gc291bmQgaXMgaGVhcmQuCi0tClJ5YW4gTWNDbHVlLCBTeWRuZXkKCuKA
kOKAkOKAkOKAkOKAkOKAkOKAkCBPcmlnaW5hbCBNZXNzYWdlIOKAkOKAkOKAkOKAkOKAkOKAkOKA
kApPbiBTdW5kYXksIFNlcHRlbWJlciAyNnRoLCAyMDIxIGF0IDc6MDEgUE0sIFJ5YW4gTWNDbHVl
IDxyZS5tY2NsdWVAcHJvdG9ubWFpbC5jb20+IHdyb3RlOgoKPiBIZWxsbyBhZ2Fpbi4KPiBJJ20g
dXNpbmcgYWxzYS1rZXJuZWwuCj4gTXkgY29uZmlndXJhdGlvbjoKPiBTTkRSVl9QQ01fSFdfUEFS
QU1fQUNDRVNTID0gU05EUlZfUENNX0FDQ0VTU19SV19JTlRFUkxFQVZFRAo+IFNORFJWX1BDTV9I
V19QQVJBTV9GT1JNQVQgPSBTTkRSVl9QQ01fRk9STUFUX1MxNl9MRQo+IFNORFJWX1BDTV9IV19Q
QVJBTV9TVUJGT1JNQVQgPSBTTkRSVl9QQ01fU1VCRk9STUFUX1NURAo+IFNORFJWX1BDTV9IV19Q
QVJBTV9DSEFOTkVMUyA9IDIKPiBTTkRSVl9QQ01fSFdfUEFSQU1fUkFURSA9IDQ4MDAwCj4KPiBJ
IGhhdmUgYSB2c3luY2VkIGdhbWUgbG9vcCB0aGF0IGlzIHJ1bm5pbmcgYXQgNjBmcHM6Cj4KPj4g
aW50IG51bV9iYXNlX3NhbXBsZXMgPSA0ODAwMCAqICgxIC8gNjApOwo+PiBpbnQgbnVtX3NhbXBs
ZXMgPSAgbnVtX2Jhc2Vfc2FtcGxlcyAqIDI7Cj4+IGludDE2X3QgYnVmZmVyW251bV9zYW1wbGVz
XSA9IHt9Owo+Pgo+PiB3aGlsZSAodHJ1ZSkgewo+PiAgIGludDE2X3QgKnNhbXBsZXMgPSBidWZm
ZXI7Cj4+ICAgZm9yIChpbnQgc2FtcGxlX2kgPSAwOyBzYW1wbGVfaSA8IG51bV9iYXNlX3NhbXBs
ZXM7IHNhbXBsZV9pKyspIHsKPj4gICAgICpzYW1wbGVzKysgPSAweDMzOwo+PiAgICAgKnNhbXBs
ZXMrKyA9IDB4MzM7Cj4+ICAgfQo+Pgo+PiAgIHN0cnVjdCBzbmRfeGZlcmkgdHJhbnNmZXIgPSB7
fTsKPj4gICB0cmFuc2Zlci5idWYgPSBidWZmZXI7Cj4+ICAgdHJhbnNmZXIuZnJhbWVzID0gbnVt
X2Jhc2Vfc2FtcGxlczsKPj4gICBpb2N0bChmZCwgU05EUlZfUENNX0lPQ1RMX1dSSVRFSV9GUkFN
RVMsICZ0cmFuc2Zlcik7Cj4+Cj4+ICAgLy8gaW9jdGwoZmQsIFNORFJWX1BDTV9JT0NUTF9EUkFJ
Tik7ICAtLT4gTkVDRVNTQVJZPz8/Cj4+ICAgLy8gaW9jdGwoZmQsIFNORFJWX1BDTV9JT0NUTF9Q
UkVQQVJFKTsgIC0tPiBORUNFU1NBUlk/Pz8KPj4gfQo+Cj4gT24gdGhlIGZpcnN0IGl0ZXJhdGlv
biBvZiBTTkRSVl9QQ01fSU9DVExfV1JJVEVJX0ZSQU1FUyBJIGdldCBubyBlcnJvci4KPiBBbGwg
c3Vic2VxdWVudCBpdGVyYXRpb25zLCBJIGdldCBCcm9rZW4gUGlwZSBlcnJvci4KPiBTbywgdG8g
Y291bnRlcmFjdCB0aGlzIGF0IHRoZSBlbmQgb2YgZWFjaCBmcmFtZSBJIGNhbGwgU05EUlZfUENN
X0lPQ1RMX0RSQUlOIGFuZCBTTkRSVl9QQ01fSU9DVExfUFJFUEFSRS4KPiBUaGlzIHJlbW92ZXMg
dGhlIEJyb2tlbiBQaXBlIGVycm9yIGhvd2V2ZXIgc2xvd3MgdGhlIHByb2dyYW0gZG93biBieSBo
YWxmIGFuZCBubyBzb3VuZCBpcyBoZWFyZC4KPiBIb3cgYmVzdCB0byBzb2x2ZSB0aGlzIGlzc3Vl
Pwo+Cj4gVGhhbmtzIGFnYWluCj4gLS0KPiBSeWFuIE1jQ2x1ZSwgU3lkbmV5
