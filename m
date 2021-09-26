Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE314187A2
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Sep 2021 11:02:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EEFA165E;
	Sun, 26 Sep 2021 11:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EEFA165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632646972;
	bh=RSpSK6nEhWHKB1o9ULb18cQ3dFX9NlSG7I0wRFukbo0=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=DyXoKfkrsqL3mU26OGuzReIGgQN1/qEffvSnl1AXnpc3oeLu9ENtKGdYLbU3NGX4B
	 0E5DxtW005EpqpQNoky6RKtCn4g5IDJLYa2kQsF0w8jItWzC5GNMCegHVsD5uBeqEo
	 Ox3U6WcZFo3Iz4QDKLkPEDSkQPH3OFX9hsGGs5XI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96D90F804BC;
	Sun, 26 Sep 2021 11:01:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F872F804AD; Sun, 26 Sep 2021 11:01:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-40141.protonmail.ch (mail-40141.protonmail.ch
 [185.70.40.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3944EF80246
 for <alsa-devel@alsa-project.org>; Sun, 26 Sep 2021 11:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3944EF80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="VwR+FwwO"
Date: Sun, 26 Sep 2021 09:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1632646886;
 bh=48SXfbuSxIxB5ZiopItMqlr7LupBf78oe1Wraa13QyI=;
 h=Date:To:From:Reply-To:Subject:From;
 b=VwR+FwwOJW1xOzPjJVKcGrjgYXU1Efarj4b7G/IPUQ1zGVzZPpxDyPlSPHkH134fS
 C9tlChWe2qKC8iRC+1l3AA+ta9CkgTXRv2hUM0NpR1KNQumg7AejMHZYvHhYT//NIz
 NmfyQ7ZcOBO0NYzELOCBVyqMUkuYOW/S2M+SpTno=
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Ryan McClue <re.mcclue@protonmail.com>
Subject: Broken Pipe with SNDRV_PCM_IOCTL_WRITEI_FRAMES
Message-ID: <aMjqrUVYYlPC6M_ZW7GlV0WUwUzJimDuTXi2mWq62PH9GbMUmTMK0ECdR837FlWMPQd8sP57TNh3Coq19l0gm75NBOh7oqPGpl7ARwjF-u0=@protonmail.com>
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

SGVsbG8gYWdhaW4uCkknbSB1c2luZyBhbHNhLWtlcm5lbC4KTXkgY29uZmlndXJhdGlvbjoKU05E
UlZfUENNX0hXX1BBUkFNX0FDQ0VTUyA9IFNORFJWX1BDTV9BQ0NFU1NfUldfSU5URVJMRUFWRUQK
U05EUlZfUENNX0hXX1BBUkFNX0ZPUk1BVCA9IFNORFJWX1BDTV9GT1JNQVRfUzE2X0xFClNORFJW
X1BDTV9IV19QQVJBTV9TVUJGT1JNQVQgPSBTTkRSVl9QQ01fU1VCRk9STUFUX1NURApTTkRSVl9Q
Q01fSFdfUEFSQU1fQ0hBTk5FTFMgPSAyClNORFJWX1BDTV9IV19QQVJBTV9SQVRFID0gNDgwMDAK
CkkgaGF2ZSBhIHZzeW5jZWQgZ2FtZSBsb29wIHRoYXQgaXMgcnVubmluZyBhdCA2MGZwczoKCj4g
aW50IG51bV9iYXNlX3NhbXBsZXMgPSA0ODAwMCAqICgxIC8gNjApOwo+IGludCBudW1fc2FtcGxl
cyA9ICBudW1fYmFzZV9zYW1wbGVzICogMjsKPiBpbnQxNl90IGJ1ZmZlcltudW1fc2FtcGxlc10g
PSB7fTsKPgo+IHdoaWxlICh0cnVlKSB7Cj4gICBpbnQxNl90ICpzYW1wbGVzID0gYnVmZmVyOwo+
ICAgZm9yIChpbnQgc2FtcGxlX2kgPSAwOyBzYW1wbGVfaSA8IG51bV9iYXNlX3NhbXBsZXM7IHNh
bXBsZV9pKyspIHsKPiAgICAgKnNhbXBsZXMrKyA9IDB4MzM7Cj4gICAgICpzYW1wbGVzKysgPSAw
eDMzOwo+ICAgfQo+Cj4gICBzdHJ1Y3Qgc25kX3hmZXJpIHRyYW5zZmVyID0ge307Cj4gICB0cmFu
c2Zlci5idWYgPSBidWZmZXI7Cj4gICB0cmFuc2Zlci5mcmFtZXMgPSBudW1fYmFzZV9zYW1wbGVz
Owo+ICAgaW9jdGwoZmQsIFNORFJWX1BDTV9JT0NUTF9XUklURUlfRlJBTUVTLCAmdHJhbnNmZXIp
Owo+Cj4gICAvLyBpb2N0bChmZCwgU05EUlZfUENNX0lPQ1RMX0RSQUlOKTsgIC0tPiBORUNFU1NB
Ulk/Pz8KPiAgIC8vIGlvY3RsKGZkLCBTTkRSVl9QQ01fSU9DVExfUFJFUEFSRSk7ICAtLT4gTkVD
RVNTQVJZPz8/Cj4gfQoKT24gdGhlIGZpcnN0IGl0ZXJhdGlvbiBvZiBTTkRSVl9QQ01fSU9DVExf
V1JJVEVJX0ZSQU1FUyBJIGdldCBubyBlcnJvci4KQWxsIHN1YnNlcXVlbnQgaXRlcmF0aW9ucywg
SSBnZXQgQnJva2VuIFBpcGUgZXJyb3IuClNvLCB0byBjb3VudGVyYWN0IHRoaXMgYXQgdGhlIGVu
ZCBvZiBlYWNoIGZyYW1lIEkgY2FsbCBTTkRSVl9QQ01fSU9DVExfRFJBSU4gYW5kIFNORFJWX1BD
TV9JT0NUTF9QUkVQQVJFLgpUaGlzIHJlbW92ZXMgdGhlIEJyb2tlbiBQaXBlIGVycm9yIGhvd2V2
ZXIgc2xvd3MgdGhlIHByb2dyYW0gZG93biBieSBoYWxmIGFuZCBubyBzb3VuZCBpcyBoZWFyZC4K
SG93IGJlc3QgdG8gc29sdmUgdGhpcyBpc3N1ZT8KClRoYW5rcyBhZ2FpbgotLQpSeWFuIE1jQ2x1
ZSwgU3lkbmV5
