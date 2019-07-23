Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D3E71AE6
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 16:55:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E72018C2;
	Tue, 23 Jul 2019 16:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E72018C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563893751;
	bh=qBttA6nI4SpKPAgk/3CfV62Qh1EVEs/y5xt8lWITTsE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iFTx6t1tMUyvjxg6GY2ECjRLbGaM+sIvG7VBOd2n6SujNHHnqiQyVEvpfjbhhR3xG
	 naxiyPn7CT+gnswDWWi8fQr/1Vusiiei3t+xh8Ksa4VLI0Hh6K2i+rNGNQk8aZQKgv
	 n6N2A9BdKDGqm2ySRBLEl0OIi3bpXbvnIjYYBSwM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55060F80447;
	Tue, 23 Jul 2019 16:54:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9171AF80447; Tue, 23 Jul 2019 16:54:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E6D9F8011C
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 16:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E6D9F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="I0F6vx0b"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6NErvTd018777; Tue, 23 Jul 2019 09:53:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=YaN6SE8Sk2O3gINIpL3wkIMZA+iVIukDEKr7DcitBug=;
 b=I0F6vx0b/Qbe5iUBwl0gVC+1Xt6F66A66sX1NEmyBGkjIZV/ize6TkWu81WRaQ8LY4U/
 hpWkmC5jwFSRNigdovrjyMXKDvsUf7qtsyvbf2y5/VpWqG9nN+3iTaNn/b71tB53zOsG
 oiSK6RpAIJl7eWsB3kIFsdSTc+19NfFIdfu/fsL97JVeLNXXyRWs1PEcS77F/qDytdO1
 VWF25zupW9I9dbwlE42BcNvGFtztKof3jGcuF7iMDVcMlUWnZDy9yZ9t2QZCGH/Y1C6v
 FYknxQ1Y9ymt5BqB+FWilxEXJpMJR4h0MpW4Kg1gxZOlCY4gxOv55RfJNVygLV5qXtTZ qg== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2twm3qs9wq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Jul 2019 09:53:57 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 23 Jul
 2019 15:53:55 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 23 Jul 2019 15:53:55 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6FDCE45;
 Tue, 23 Jul 2019 15:53:55 +0100 (BST)
Date: Tue, 23 Jul 2019 15:53:55 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Message-ID: <20190723145355.GO54126@ediswmail.ad.cirrus.com>
References: <cover.1563817201.git.mirq-linux@rere.qmqm.pl>
 <3e104cf18cb4e26096f0fe065a2c0e80373f861c.1563817201.git.mirq-linux@rere.qmqm.pl>
 <20190723082716.GM54126@ediswmail.ad.cirrus.com>
 <20190723105248.GA5365@sirena.org.uk>
 <20190723115415.GA14036@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723115415.GA14036@qmqm.qmqm.pl>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 mlxlogscore=564 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1904300001 definitions=main-1907230149
Cc: alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 patches@opensource.cirrus.com, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: wm8904: rework FLL handling
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

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDE6NTQ6MTVQTSArMDIwMCwgTWljaGHFgiBNaXJvc8WC
YXcgd3JvdGU6Cj4gT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMTE6NTI6NDhBTSArMDEwMCwgTWFy
ayBCcm93biB3cm90ZToKPiA+IE9uIFR1ZSwgSnVsIDIzLCAyMDE5IGF0IDA5OjI3OjE2QU0gKzAx
MDAsIENoYXJsZXMgS2VlcGF4IHdyb3RlOgo+ID4gPiBPbiBNb24sIEp1bCAyMiwgMjAxOSBhdCAw
Nzo1NzoyMVBNICswMjAwLCBNaWNoYcWCIE1pcm9zxYJhdyB3cm90ZToKPiA+ID4gPiBFeHRyYWN0
IGFuZCByZXdvcmsgRkxMIGhhbmRsaW5nLiBUaGlzIG1ha2VzIGl0IHBvc3NpYmxlIHRvIHJldXNl
Cj4gPiA+ID4gdGhlIGNvZGUgZm9yIG90aGVyIFdvbGZzb24gY29kZWNzIGFuZCBtYWtlcyBjb2Rl
YyBhZGFwdCBTWVNDTEsgdG8KPiA+ID4gPiBleGFjdGx5IG1hdGNoIGZyZXF1ZW5jeSByZXF1aXJl
ZCBmb3IgdXNlZCBzYW1wbGluZyByYXRlLgo+ID4gCj4gPiA+IERvIHlvdSBoYXZlIHRob3VnaHRz
IG9uIHdoaWNoIENPREVDcyB5b3Ugd291bGQgYmUgaW5jbHVkaW5nIGluCj4gPiA+IHRoaXM/IFRo
ZXNlIG9sZGVyIHBhcnRzIG9mdGVuIGhhdmUgc21hbGwgZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGUK
PiA+ID4gY29uZmlndXJhdGlvbiB0aGF0IG1pZ2h0IG1ha2UgdGhpcyBjaGFsbGVuZ2luZyBzbyBp
ZiB5b3UgaGF2ZQo+ID4gPiBwbGFucyBoZXJlIHdvdWxkIGJlIGdvb2QgdG8gaGF2ZSBhIGxvb2sg
ZnJvbSB0aGlzIGVuZC4KPiA+IAo+ID4gUmlnaHQsIGl0J3Mgbm90IGxpa2UgaXQncyB0aGUgc2Ft
ZSBJUCBiZWluZyBkcm9wcGVkIGludG8gbXVsdGlwbGUgY2hpcHMKPiA+IGluIGFuIGlkZW50aWNh
bCBmYXNoaW9uLiAgVGhlcmUncyBhIGxvdCBvZiBoaWdoIGxldmVsIHNpbWlsYXJpdGllcyBpbgo+
ID4gdGhlIHJlZ2lzdGVyIGludGVyZmFjZXMgYnV0IGFsc28gbWFueSBzbWFsbCBwZXIgZGV2aWNl
IHR3ZWFrcywgYW5kIGl0J3MKPiA+IG5vdCBjbGVhciB3aGF0IGJlbmVmaXQgd2UgZ2V0IGZyb20g
cmVmYWN0b3JpbmcgYXQgdGhpcyBwb2ludC4KPiAKPiBUaGlzIHdvdWxkIGJlIG1haW5seSBjb2Rl
IHNlcGFyYXRpb24sIHNvIGl0J3MgZWFzaWVyIHRvIHVuZGVyc3RhbmQgYW5kCj4gaGFzIGEgcG90
ZW50aWFsIGZvciBkaXJlY3QgcmV1c2UuIEkgY2FuIHNlZSB0aGF0IGNsb2NrIHNlbGVjdGlvbiBu
ZWVkcwo+IHRvIGJlIGNoYW5nZWQsIGJ1dCB0aGUgaWRlYSBpcyB0byBoYXZlIGl0IGNvbmZpZ3Vy
YWJsZSB2aWEgZGV2aWNlLXRyZWUuCj4gCj4gSSBwaWNrZWQgYXQgcmFuZG9tIFdNOTA4MS4gSXQn
cyBGTEwgaW1wbGVtZW50YXRpb24gbG9va3MgdmVyeSBzaW1pbGFyIC0KPiBtYWpvciBkaWZmZmVy
ZW5jZXMgYmVpbmcgaW4gRkxMX09VVERJViBzZWxlY3Rpb24gKGRpcmVjdCBkaXZpZGVyIHZzIDJe
TikKPiBhbmQgcmVnaXN0ZXIgYmxvY2sgb2Zmc2V0Lgo+IAo+IEFub3RoZXIgcmFuZG9tIHBpY2sg
LSBXTTg5MDAuIFRoZSBnZW5lcmFsIEZMTCBpZGVhIHNlZW1zIHRoZSBzYW1lLCBidXQKPiB0aGlz
IG9uZSBoYXMgYSBiaXQgbW9yZSBjb21wbGljYXRlZCByZWdpc3RlciBsYXlvdXQsIHNvIEkgd291
bGRuJ3QKPiBjb25zaWRlciBpdCBhdCBmaXJzdC4KPiAKPiBXTTg5OTQgLSBpdCBoYXMgdHdvIEZM
TCdzIGJ1dCBvdGhlcndpc2UgaGFzIGlkZW50aWNhbCByZWdpc3RlciBsYXlvdXQKPiBmb3IgdGhl
bSBhcyBXTTg5MDQuIFRoZSBvbmx5IGRpZmZlcmVuY2UgaXMgaW4gY2xvY2sgc291cmNlIHNlbGVj
dGlvbi4KPiAKClRoZSByZWdpc3RlciBsYXlvdXRzIGRvIGxvb2sgc2ltaWxhciBidXQgdGhlIGNv
ZGUgY29udHJvbGxpbmcgdGhlCkZMTHMgaW4gdGhlc2UgY2FzZXMgaXMgcXVpdGUgZGlmZmVyZW50
LiBJIGFtIHNvbWV3aGF0IG5lcnZvdXMKdGhlcmUgYXJlIHN1YnRsZSBmYWN0b3JzIGF0IHBsYXkg
aGVyZSB3aGljaCBhcmUgZ29pbmcgdG8gY2F1c2UKcHJvYmxlbXMgYW5kIGl0cyB2ZXJ5IGhhcmQg
dG8gc2VwZXJhdGUgZGl2ZXJnZW5jZSBhbmQgYWN0dWFsbHkKcmVxdWlyZWQgc2VxdWVuY2luZyBo
ZXJlLgoKQXQgdGhlIHZlcnkgbGVhc3QgaWYgeW91IGFyZSByZWFsbHkgc3VyZSB5b3Ugd2FudCB0
byBwcm9jZWVkIGluCnRoaXMgZGlyZWN0aW9uIEkgdGhpbmsgd2Ugc2hvdWxkIGxvb2sgYXQgc3Bs
aXR0aW5nIHRoZSBwYXRjaCBpbnRvCnR3byBwYXJ0cyBvbmUgdGhhdCBmYWN0b3JzIG91dCB0aGUg
ZnVuY3Rpb25hbGl0eSBhbmQgYSBzZXBhcmF0ZQpwYXRjaCB0aGF0IGFkZHMgYW55IG5ldyBmdW5j
dGlvbmFsaXR5LiBJdCBtYWtlcyB0aGluZ3MgbXVjaAplYXNpZXIgdG8gcmV2aWV3IHRoYXQgd2F5
LgoKVGhhbmtzLApDaGFybGVzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwK
