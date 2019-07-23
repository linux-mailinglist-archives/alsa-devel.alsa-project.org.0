Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA48713FF
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 10:29:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCBF71851;
	Tue, 23 Jul 2019 10:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCBF71851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563870588;
	bh=TvcxHyJul37fo/1fPV+6CyMMXqq53PpbjsGZMOLr3p0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jyObqkfgwzWJsih3yI/L7Mx0rsa5sSsoDrCK7JgM/E/ImsdA/sSCAiz1sY0vIrfq7
	 S8DHl/W1828ghbZYE/XC1du2iLSTvOCQB9AIu86UJnsMSqxtFJ7fv6ihH5tG9XneE3
	 Lx3DvmiLEdxvSSzZQJJ8qCTsTngULpW5wqQdewaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 723B4F803D0;
	Tue, 23 Jul 2019 10:28:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1F6FF80447; Tue, 23 Jul 2019 10:27:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 963E9F80227
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 10:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 963E9F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="k4/47Ii+"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6N8OiK9016168; Tue, 23 Jul 2019 03:27:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=TiRzyesd83Co49aJKUoQtOBww70yl53h2myrTsel904=;
 b=k4/47Ii+RnXXLCCxFT/NrKL3lhFfnejojPkjiieS5HVQC6uFqzZkTicdGUYd+hglSrSm
 EuX7xXeFOwkQOHiz4fnmmMsYYTGifCzcHk0BYLDoUUSmvYNPx/s14qaJASCnhu4RGev2
 ZsgHebGtrD2Q9QWQp8z0+G2Tzpvay2mdeMPtZxSSMggyMb7jO3fk79JkbEHRR3ax75Fs
 KoCcdIxhcdK6HF1SFgNBkLcrNelhXBoCIAPNWirNE+sVRAiL+1wTV+mXvLZFkOfCyepg
 Wl2WrAxec3YVoxlZoU4bMALIG2Cpxh8ggfr0Rh9Rvq6Z9gP7p437Zbj3uF1cJPjuIZwW 7g== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2twm3qrrue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Jul 2019 03:27:18 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 23 Jul
 2019 09:27:16 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 23 Jul 2019 09:27:16 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0683C45;
 Tue, 23 Jul 2019 09:27:16 +0100 (BST)
Date: Tue, 23 Jul 2019 09:27:16 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Message-ID: <20190723082716.GM54126@ediswmail.ad.cirrus.com>
References: <cover.1563817201.git.mirq-linux@rere.qmqm.pl>
 <3e104cf18cb4e26096f0fe065a2c0e80373f861c.1563817201.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e104cf18cb4e26096f0fe065a2c0e80373f861c.1563817201.git.mirq-linux@rere.qmqm.pl>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1011 mlxlogscore=999 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1904300001 definitions=main-1907230078
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

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDc6NTc6MjFQTSArMDIwMCwgTWljaGHFgiBNaXJvc8WC
YXcgd3JvdGU6Cj4gRXh0cmFjdCBhbmQgcmV3b3JrIEZMTCBoYW5kbGluZy4gVGhpcyBtYWtlcyBp
dCBwb3NzaWJsZSB0byByZXVzZQo+IHRoZSBjb2RlIGZvciBvdGhlciBXb2xmc29uIGNvZGVjcyBh
bmQgbWFrZXMgY29kZWMgYWRhcHQgU1lTQ0xLIHRvCj4gZXhhY3RseSBtYXRjaCBmcmVxdWVuY3kg
cmVxdWlyZWQgZm9yIHVzZWQgc2FtcGxpbmcgcmF0ZS4KPiAKCkRvIHlvdSBoYXZlIHRob3VnaHRz
IG9uIHdoaWNoIENPREVDcyB5b3Ugd291bGQgYmUgaW5jbHVkaW5nIGluCnRoaXM/IFRoZXNlIG9s
ZGVyIHBhcnRzIG9mdGVuIGhhdmUgc21hbGwgZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGUKY29uZmln
dXJhdGlvbiB0aGF0IG1pZ2h0IG1ha2UgdGhpcyBjaGFsbGVuZ2luZyBzbyBpZiB5b3UgaGF2ZQpw
bGFucyBoZXJlIHdvdWxkIGJlIGdvb2QgdG8gaGF2ZSBhIGxvb2sgZnJvbSB0aGlzIGVuZC4KCj4g
U2lnbmVkLW9mZi1ieTogTWljaGHFgiBNaXJvc8WCYXcgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBs
Pgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC93bTg5MDQudHh0ICAgICAg
fCAgIDQgKwo+ICBzb3VuZC9zb2MvYXRtZWwvYXRtZWxfd204OTA0LmMgICAgICAgICAgICAgICAg
fCAgMTEgKy0KPiAgc291bmQvc29jL2NvZGVjcy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAg
IHwgICA0ICsKPiAgc291bmQvc29jL2NvZGVjcy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAg
IHwgICAyICsKPiAgc291bmQvc29jL2NvZGVjcy93bTg5MDQuYyAgICAgICAgICAgICAgICAgICAg
IHwgNDU0ICsrKysrLS0tLS0tLS0tLS0tLQo+ICBzb3VuZC9zb2MvY29kZWNzL3dtODkwNC5oICAg
ICAgICAgICAgICAgICAgICAgfCAgIDUgLQo+ICBzb3VuZC9zb2MvY29kZWNzL3dtX2ZsbC5jICAg
ICAgICAgICAgICAgICAgICAgfCAzMzkgKysrKysrKysrKysrKwo+ICBzb3VuZC9zb2MvY29kZWNz
L3dtX2ZsbC5oICAgICAgICAgICAgICAgICAgICAgfCAgMjYgKwo+ICA4IGZpbGVzIGNoYW5nZWQs
IDQ5MiBpbnNlcnRpb25zKCspLCAzNTMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC93bTg5MDQudHh0IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3dtODkwNC50eHQKPiBpbmRleCA2NmJm
MjYxNDIzYjkuLjZiNTFkODdmNTk4NyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc291bmQvd204OTA0LnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9zb3VuZC93bTg5MDQudHh0Cj4gQEAgLTksNiArOSwxMCBAQCBSZXF1
aXJlZCBwcm9wZXJ0aWVzOgo+ICAgIC0gY2xvY2tzOiByZWZlcmVuY2UgdG8KPiAgICAgIDxEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svY2xvY2stYmluZGluZ3MudHh0Pgo+
ICAKPiArT3B0aW9uYWwgcHJvcGVydGllczoKPiArICAtIHdsZixmbGwtaW5wdXQ6IEZMTCBpbnB1
dCBzaWduYWw6ICJtY2xrIiwgImJjbGsiLCAibHJjbGsiIG9yICJvc2MiCj4gKwkoIm1jbGsiIGJ5
IGRlZmF1bHQpCj4gKwoKV291bGQgYmUga2VlbiB0byBzZWUgc29tZSBvdGhlciBwZW9wbGVzIHRo
b3VnaHRzIG9uIHRoaXMgb25lLCBidXQKdGhpcyBmZWVscyBhIGxpdHRsZSBvZmYgdG8gbWUuIFNl
bGVjdGluZyB0aGUgRkxMIGlucHV0IGlzCmdlbmVyYWxseSBzb21ldGhpbmcgdGhhdCB3b3VsZCBi
ZSBkb25lIG9uIGEgdXNlLWNhc2UgYnkgdXNlLWNhc2UKYmFzaXMgcmF0aGVyIHRoYW4gYmVpbmcg
YSBwcm9wZXJ0eSBvZiB0aGUgaGFyZHdhcmUgdGhhdCB3b3VsZApiZWxvbmcgaW4gZGV2aWNlIHRy
ZWUuCgpUaGFua3MsCkNoYXJsZXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YWxzYS1kZXZlbAo=
