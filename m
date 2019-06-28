Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6E95A7CD
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jun 2019 01:58:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 100101662;
	Sat, 29 Jun 2019 01:57:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 100101662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561766315;
	bh=/jI0SVtZXwEG0RVbDW41zwfjQN587XLT4BgH4jobKN4=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AbcwfICqmEOVhaz4PCr3TLIiR9dQqSkBXZtZVPUDrhQXqvRjYACrDRM84XzkjjjN9
	 mcPpbwLlQ2OUZFKLHgy0CF1JcCEyJBlrDqfmzizXzMnPvqr0j6oieqAgZzL3mBLScm
	 b/vYzOLhrtdrmcKAD7LJsGkgN79ZohB0fUotEfPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F6D4F896CB;
	Sat, 29 Jun 2019 01:56:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48A7BF896B9; Sat, 29 Jun 2019 01:56:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_PAST_06_12, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D88BDF80058
 for <alsa-devel@alsa-project.org>; Sat, 29 Jun 2019 01:56:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D88BDF80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Jp1A+Cfi"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="SvnKLpQc"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 1AE1D21FC1;
 Fri, 28 Jun 2019 19:56:41 -0400 (EDT)
Received: from imap5 ([10.202.2.55])
 by compute1.internal (MEProxy); Fri, 28 Jun 2019 19:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type:content-transfer-encoding; s=fm1; bh=Oa
 DVBcKJfCsMzRWtHv3C09/Abj/G6upXMBKiCQzcAKQ=; b=Jp1A+Cfid2vh2CYlsJ
 OJbYxjYzY9fiLYs3JNd5JMj3xeV1dnl+l25z1aZE+NL3KQ2b5XsBnT0+qcdagjXQ
 G4REtKO1nrRGjT14Iub67JdusVlkcJC4/ApmG718Pr+bkJUK6gPQM/jgMvHxbMlE
 WPaij12UNJf133u0ZROYRupjBr37S1ZP8Y2qosH7xtfThUdaSCCBumgALehighaB
 Nu17jbOTD59o3fY3YBg//6xxj8B7P1FBNyoLFBrc7vrJweERngdstFmilO2IUip3
 3TOHwXrCbnSb9c2BXygB+d//QjAefhhwcbc9z6BeaFQRX/Sgy1EM0cJWFB0egyeq
 X3ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=OaDVBcKJfCsMzRWtHv3C09/Abj/G6upXMBKiCQzcA
 KQ=; b=SvnKLpQcUNxgpfbo+UJZqavhrEzu984NWIvXJi3N7El1PekCxgaKxQ9Gc
 cfmAPqdTeaN1LCZzTw+PmJpueH6eo/gcKR1nkWIL3ci/OALwLKZawXAqHGpslQ47
 164YV7GjOYq6rcNDO0oGAEL768enZZnkdSFeAcycYERfpXACSD4Nx6Fy53uHAdRs
 0Na7FLpzNc+l5V4UnUq9k21uGq4SfNdxr/E0AW9mypWXvsMQOS/d5wfcLnAmFTgX
 eDsfgQzN+hW4GIjWPlzXhEbwVINOoyvnwrN/k0J7ZxX6pfO1k2aiqxAf2IzjdAY3
 199b/ZMrDSOi3+UnQ8JcZoWVjOkGw==
X-ME-Sender: <xms:OKkWXd8VyNi6xZVvoNclCH-0wr5PUXry1QPXyt5HzknYbOk5sssl7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrvddugddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdfvrghk
 rghshhhiucfurghkrghmohhtohdfuceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthh
 hirdhjpheqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfrrghrrghmpehmrghi
 lhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphenucevlhhush
 htvghrufhiiigvpedt
X-ME-Proxy: <xmx:OKkWXeCWFl66T3c9Lqlb6r95v--ANyCDrJdCLivlQzH_EoemXKJ-3Q>
 <xmx:OKkWXdyGqsBItckj0Bwm_LZwdKiFW81WTJW-KyiNiFJFPAxGaLjU2Q>
 <xmx:OKkWXTSzKDG6llV3arB_oHmkBwAJ23dW7WeV2mx7v3x6vRiAtnZXDg>
 <xmx:OakWXVsABz8H975Si-h8ynGysYoTJT70gTTYk73P3-D2dYlMaRc4BQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 15E2D5C0099; Fri, 28 Jun 2019 19:56:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <14b3cbbc-3ea2-4037-9174-24bbf0ecd6e2@www.fastmail.com>
In-Reply-To: <s5h1rzd7m0b.wl-tiwai@suse.de>
References: <20190628052158.27693-1-o-takashi@sakamocchi.jp>
 <s5ho92i6qhi.wl-tiwai@suse.de>
 <bd65234a-9963-4e25-938f-1e79b053c4e1@www.fastmail.com>
 <s5h1rzd7m0b.wl-tiwai@suse.de>
Date: Fri, 28 Jun 2019 23:56:33 +0900
From: "Takashi Sakamoto" <o-takashi@sakamocchi.jp>
To: "Takashi Iwai" <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>,
 stable@vger.kernel.org
Subject: Re: [alsa-devel]
 =?utf-8?q?=5BPATCH=5D_ALSA=3A_firewire-lib/fireworks?=
 =?utf-8?q?=3A_fix_miss_detection_of_received_MIDI_messages?=
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

SGksCgpPbiBTYXQsIEp1biAyOSwgMjAxOSwgYXQgMDA6NDQsIFRha2FzaGkgSXdhaSB3cm90ZToK
PiBPbiBGcmksIDI4IEp1biAyMDE5IDA5OjM0OjAwICswMjAwLAo+IFRha2FzaGkgU2FrYW1vdG8g
d3JvdGU6Cj4gPiAKPiA+IEhpLAo+ID4gCj4gPiBPbiBGcmksIEp1biAyOCwgMjAxOSwgYXQgMTc6
NTMsIFRha2FzaGkgSXdhaSB3cm90ZToKPiA+ID4gT24gRnJpLCAyOCBKdW4gMjAxOSAwNzoyMTo1
OCArMDIwMCwKPiA+ID4gVGFrYXNoaSBTYWthbW90byB3cm90ZToKPiA+ID4gPiAKPiA+ID4gPiBJ
biBJRUMgNjE4ODMtNiwgOCBNSURJIGRhdGEgc3RyZWFtcyBhcmUgbXVsdGlwbGV4ZWQgaW50byBz
aW5nbGUKPiA+ID4gPiBNSURJIGNvbmZvcm1hbnQgZGF0YSBjaGFubmVsLiBUaGUgaW5kZXggb2Yg
c3RyZWFtIGlzIGNhbGN1bGF0ZWQgYnkKPiA+ID4gPiBtb2R1bG8gOCBvZiB0aGUgdmFsdWUgb2Yg
ZGF0YSBibG9jayBjb3VudGVyLgo+ID4gPiA+IAo+ID4gPiA+IEluIGZpcmV3b3JrcywgdGhlIHZh
bHVlIG9mIGRhdGEgYmxvY2sgY291bnRlciBpbiBDSVAgaGVhZGVyIGhhcyBhIHF1aXJrCj4gPiA+
ID4gd2l0aCBmaXJtd2FyZSB2ZXJzaW9uIHY1LjAuMCwgdjUuNy4zIGFuZCB2NS44LjAuIFRoaXMg
YnJpbmdzIEFMU0EKPiA+ID4gPiBJRUMgNjE4ODMtMS82IHBhY2tldCBzdHJlYW1pbmcgZW5naW5l
IHRvIG1pc3MgZGV0ZWN0aW9uIG9mIE1JREkKPiA+ID4gPiBtZXNzYWdlcy4KPiA+ID4gPiAKPiA+
ID4gPiBUaGlzIGNvbW1pdCBmaXhlcyB0aGUgbWlzcyBkZXRlY3Rpb24gdG8gbW9kaWZ5IHRoZSB2
YWx1ZSBvZiBkYXRhIGJsb2NrCj4gPiA+ID4gY291bnRlciBmb3IgdGhlIG1vZHVsbyBjYWxjdWxh
dGlvbi4KPiA+ID4gPiAKPiA+ID4gPiBGb3IgbWFpbnRhaW5lcnMsIHRoaXMgYnVnIGV4aXN0cyBz
aW5jZSBhIGNvbW1pdCAxOGY1ZWQzNjVkM2YgKCJBTFNBOgo+ID4gPiA+IGZpcmV3b3Jrcy9maXJl
d2lyZS1saWI6IGFkZCBzdXBwb3J0IGZvciByZWNlbnQgZmlybXdhcmUgcXVpcmsiKSBpbiBMaW51
eAo+ID4gPiA+IGtlcm5lbCB2NC4yLiBUaGVyZSdyZSBtYW55IGNoYW5nZXMgc2luY2UgdGhlIGNv
bW1pdC4gIFRoaXMgZml4IGNhbiBiZQo+ID4gPiA+IGJhY2twb3J0ZWQgdG8gTGludXgga2VybmVs
IHY0LjQgb3IgbGF0ZXIuIEkgdGFnZ2VkIGEgYmFzZSBjb21taXQgdG8gdGhlCj4gPiA+ID4gYmFj
a3BvcnQgZm9yIHlvdXIgY29udmVuaWVuY2UuCj4gPiA+ID4gCj4gPiA+ID4gRml4ZXM6IGRmMDc1
ZmVlZmJkMyAoIkFMU0E6IGZpcmV3aXJlLWxpYjogY29tcGxldGUgQU04MjQgZGF0YSBibG9jayBw
cm9jZXNzaW5nIGxheWVyIikKPiA+ID4gPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMg
djQuNCsKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBUYWthc2hpIFNha2Ftb3RvIDxvLXRha2FzaGlA
c2FrYW1vY2NoaS5qcD4KPiA+ID4gCj4gPiA+IFRoaXMgZG9lc24ndCBzZWVtIGFwcGxpY2FibGUg
dG8gdGhlIGxhdGVzdCA1LjItcmMgdHJlZSBkdWUgdG8geW91cgo+ID4gPiByZWNlbnQgcmVmYWN0
b3JpbmcuICBDb3VsZCB5b3UgcmVzdWJtaXQgdGhlIGZpeCBmb3IgNS4yPyAgSSdsbCByZXNvbHZl
Cj4gPiA+IHRoZSBtZXJnZSBjb25mbGljdCBpbiBteSBzaWRlLgo+ID4gCj4gPiBNbW0uIERvIHlv
dSBhY3R1YWxseSBlbmNvdW50ZXIgYW55IGNvbmZsaWN0IHdoZW4gYXBwbHlpbmcgdGhpcyBwYXRj
aCB0bwo+ID4geW91ciB2NS4yIHRyZWU/Cj4gPiAKPiA+IFRoaXMgcGF0Y2ggaW5jbHVkZXMgY2hh
bmdlcyBmb3IgYHNvdW5kL2ZpcmV3aXJlL2FtZHRwLWFtODI0LmNgLiBPbiB0aGUgb3RoZXIKPiA+
IGhhbmQsIG15IHJlY2VudCB3b3JrIGlzIG1haW5seSBmb3IgYHNvdW5kL2ZpcmV3aXJlL2FtZHRw
LXN0cmVhbS5jYC4gQWN0dWFsbHksCj4gPiB0aGUgbGFzdCBjaGFuZ2UgZm9yIGBhbWR0cC1hbTgy
NC5jYCB3YXMgZG9uZSAyMDE3LTEwLTI1Lgo+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdGl3YWkvc291bmQuZ2l0L2xvZy9zb3VuZC9maXJld2lyZS9h
bWR0cC1hbTgyNC5jP2g9Zm9yLWxpbnVzCj4gCj4gSXQncyBub3QgYWJvdXQgZmlsZSBjb25mbGlj
dHMgYnV0IHRoZSBjb21waWxhdGlvbiBmYWlscyBhZnRlciB0aGUKPiBwYXRjaC4KPiBzb3VuZC9m
aXJld2lyZS9hbWR0cC1hbTgyNC5jOiBJbiBmdW5jdGlvbiDigJhyZWFkX21pZGlfbWVzc2FnZXPi
gJk6Cj4gc291bmQvZmlyZXdpcmUvYW1kdHAtYW04MjQuYzozMjQ6MTY6IGVycm9yOiDigJhzdHJ1
Y3QgYW1kdHBfc3RyZWFt4oCZIGhhcyAKPiBubyBtZW1iZXIgbmFtZWQg4oCYY3R4X2RhdGHigJkK
PiAgICBwb3J0ID0gKDggLSBzLT5jdHhfZGF0YS50eC5maXJzdF9kYmMgKyBzLT5kYXRhX2Jsb2Nr
X2NvdW50ZXIgKyBmKSAlIAo+IDg7Cj4gICAgICAgICAgICAgICAgIF5+CgpPb3BzLCBub3cgSSBn
b3QgaXQuLi4gSSBqdXN0IGNoZWNrZWQgaXRzIGFwcGxpY2F0aW9uIGJ1dCBzaG91bGQgaGF2ZSBo
YWQKY29tcGlsZSB0ZXN0IHdpdGggb2xkIHRyZWVzLgoKQnV0IEknbSBpbiBzaG9ydCB2YWNhdGlv
bi4gVGhlIHJldmlzZWQgcGF0Y2ggd2lsbCBiZSBwb3N0ZWQgbmV4dCBNb25kYXksCnNvcnJ5LgoK
ClRoYW5rcwoKVGFrYXNoaSBTYWthbW90bwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
