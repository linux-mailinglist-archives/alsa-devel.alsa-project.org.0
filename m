Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5868A1C82
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:15:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74F451676;
	Thu, 29 Aug 2019 16:14:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74F451676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567088120;
	bh=vKfcNjRsF/fMxozwHdXOLGxAV0paMUthZsgtZa7CbqQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uERlukhmbXe0WAL+LIij7o2gs4JAApdPhj7X/lv2gzqeewWXYziTxxF0XWKAtxFy7
	 GceWhFaW0mAd3bMXJ4VDwQTYOJinwcUU/SC8CJ9iDmkb6GhCOi+xA+Ej8r2oC/ir2g
	 rNAuscC06e0THyJA18nci2sUEq1PZGaY5VAzYuRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13908F89871;
	Thu, 29 Aug 2019 14:57:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9D33F8986F; Thu, 29 Aug 2019 14:57:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D44DF897A5
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 14:57:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D44DF897A5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dXwoG37I"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x7TCrtnE000665; Thu, 29 Aug 2019 07:57:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=TQ3TMtp/iVN8jVyxMAXRF8eu1q+LaHl+FWh4c6ikS5Y=;
 b=dXwoG37IKhGwQ3l81efh/n//YpQEWe2sG+1XN11QAw7zt8ruCLWFZfKQnYtciO40LBfv
 +i2gghCGPLcABgGKZ+JyTH8AgOmV3tIfj8Z3ONcXPX3Js1QGeowKQDkCMuEPvBmgVnDI
 zKqu0sRk+0foNeYb82899hjKOwEbNdodL5EFyh149HBlGUKYWwTPhXArZtHzb2vPhWhr
 zyvDPQ5+05LcYUxgOLwU/m4gtLUS9Und51fG+8dB36YmKPCfs/nD71PCQREe3lE8Jt7M
 nJejtpnx4gnf6RMQVdSZQeW/RambIGjcHCuaQmBv18hGl2Fs1j6tWI7P2+YDlCAlERag Uw== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 2uk1nk0etc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 29 Aug 2019 07:57:29 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 29 Aug
 2019 13:57:27 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 29 Aug 2019 13:57:27 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9E8772A9;
 Thu, 29 Aug 2019 12:57:27 +0000 (UTC)
Date: Thu, 29 Aug 2019 12:57:27 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Message-ID: <20190829125340.GH10308@ediswmail.ad.cirrus.com>
References: <cover.1566734630.git.mirq-linux@rere.qmqm.pl>
 <1136f2dcc822821afda9f9533f40637647929bdf.1566734630.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1136f2dcc822821afda9f9533f40637647929bdf.1566734630.git.mirq-linux@rere.qmqm.pl>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1906280000
 definitions=main-1908290142
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 2/4] ASoC: wm8904: use common FLL code
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

T24gU3VuLCBBdWcgMjUsIDIwMTkgYXQgMDI6MTc6MzVQTSArMDIwMCwgTWljaGHFgiBNaXJvc8WC
YXcgd3JvdGU6Cj4gUmV3b3JrIEZMTCBoYW5kbGluZyB0byB1c2UgY29tbW9uIGNvZGUgaW50cm9k
dWNlZCBlYXJsaWVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhxYIgTWlyb3PFgmF3IDxtaXJx
LWxpbnV4QHJlcmUucW1xbS5wbD4KPiAtLS0KCkFwb2xvZ2llcyBmb3IgdGhlIHNsaWdodCBkZWxh
eSBpbiBnZXR0aW5nIGFyb3VuZCB0byBsb29raW5nIGF0CnRoaXMgb25lLCBiZWVuIHF1aXRlIGJ1
c3kgYW5kIGl0cyBhIGxvdCB0byBnbyB0aHJvdWdoLgoKPiAgc291bmQvc29jL2F0bWVsL2F0bWVs
X3dtODkwNC5jIHwgIDExICstCj4gIHNvdW5kL3NvYy9jb2RlY3MvS2NvbmZpZyAgICAgICB8ICAg
MSArCj4gIHNvdW5kL3NvYy9jb2RlY3Mvd204OTA0LmMgICAgICB8IDQ3NiArKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgc291bmQvc29jL2NvZGVjcy93bTg5MDQuaCAgICAgIHwg
ICA1IC0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAxNDAgaW5zZXJ0aW9ucygrKSwgMzUzIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvYXRtZWwvYXRtZWxfd204OTA0LmMgYi9z
b3VuZC9zb2MvYXRtZWwvYXRtZWxfd204OTA0LmMKPiBpbmRleCA3NzZiMjdkMzY4NmUuLmI3N2Vh
MjQ5NWVmZSAxMDA2NDQKPiAtLS0gYS9zb3VuZC9zb2MvYXRtZWwvYXRtZWxfd204OTA0LmMKPiAr
KysgYi9zb3VuZC9zb2MvYXRtZWwvYXRtZWxfd204OTA0LmMKPiBAQCAtMzAsMjAgKzMwLDExIEBA
IHN0YXRpYyBpbnQgYXRtZWxfYXNvY193bTg5MDRfaHdfcGFyYW1zKHN0cnVjdCBzbmRfcGNtX3N1
YnN0cmVhbSAqc3Vic3RyZWFtLAo+ICAJc3RydWN0IHNuZF9zb2NfZGFpICpjb2RlY19kYWkgPSBy
dGQtPmNvZGVjX2RhaTsKPiAgCWludCByZXQ7Cj4gIAo+IC0JcmV0ID0gc25kX3NvY19kYWlfc2V0
X3BsbChjb2RlY19kYWksIFdNODkwNF9GTExfTUNMSywgV004OTA0X0ZMTF9NQ0xLLAo+IC0JCTMy
NzY4LCBwYXJhbXNfcmF0ZShwYXJhbXMpICogMjU2KTsKPiAtCWlmIChyZXQgPCAwKSB7Cj4gLQkJ
cHJfZXJyKCIlcyAtIGZhaWxlZCB0byBzZXQgd204OTA0IGNvZGVjIFBMTC4iLCBfX2Z1bmNfXyk7
Cj4gLQkJcmV0dXJuIHJldDsKPiAtCX0KPiAtCgpBcyBwZXIgbXkgbGFzdCBjb21tZW50IGl0IHdv
dWxkIGJlIGJldHRlciB0byBtb3ZlIHRoZSBleGlzdGluZwpmdW5jdGlvbmFsaXR5IG9mIHRoZSBk
cml2ZXIgb3ZlciB0byB0aGUgbmV3IGxpYnJhcnksIHRoZW4gbWFrZQphY3R1YWwgZnVuY3Rpb25h
bCBjaGFuZ2VzIGluIGEgc2VwYXJhdGUgcGF0Y2guIENsZWFybHkgd2UgaGF2ZQpjaGFuZ2VkIGhv
dyB0aGUgZHJpdmVyIHdvcmtzIGhlcmUsIHNpbmNlIHdlIG5vIGxvbmdlciBuZWVkIHRvIHNldAp0
aGUgRkxMLgoKVGhpcyBib3RoIG1ha2VzIHJldmlldyBlYXNpZXIgYW5kIHByb3ZlcyB0aGF0IHRo
ZSBuZXcgbGlicmFyeQphcHByb2FjaCBjYW4gc3VwcG9ydCB0aGUgZXhpc3RpbmcgZnVuY3Rpb25h
bGl0eSBvZiB0aGUgZHJpdmVyLgoKPiArc3RhdGljIGludCB3bTg5MDRfcHJlcGFyZV9zeXNjbGso
c3RydWN0IHdtODkwNF9wcml2ICpwcml2KQo+ICt7Cj4gKwlpbnQgZXJyOwo+ICsKPiArCXN3aXRj
aCAocHJpdi0+c3lzY2xrX3NyYykgewo+ICsJY2FzZSBXTTg5MDRfQ0xLX01DTEs6Cj4gKwkJZXJy
ID0gY2xrX3NldF9yYXRlKHByaXYtPm1jbGssIHByaXYtPm1jbGtfcmF0ZSk7Cj4gKwkJaWYgKCFl
cnIpCj4gKwkJCWVyciA9IGNsa19wcmVwYXJlX2VuYWJsZShwcml2LT5tY2xrKTsKPiArCQlicmVh
azsKPiArCj4gKwljYXNlIFdNODkwNF9DTEtfRkxMOgo+ICsJCWVyciA9IHdtX2ZsbF9lbmFibGUo
JnByaXYtPmZsbCk7Cj4gKwkJYnJlYWs7Cj4gKwoKR2l2ZW4gdGhlIEZMTCBjYW4gYmUgc291cmNl
ZCBmcm9tIHRoZSBNQ0xLIHBpbiB3aHkgaXMgdGhlIG1jbGsKY2xvY2sgbmV2ZXIgZW5hYmxlZCBp
biB0aGUgRkxMIGNhc2U/Cgo+IEBAIC0zNTYsMTEgKzQyOSwxOCBAQCBzdGF0aWMgaW50IHdtODkw
NF9jb25maWd1cmVfY2xvY2tpbmcoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQp
Cj4gIAkJd204OTA0LT5zeXNjbGtfcmF0ZSA9IHJhdGU7Cj4gIAl9Cj4gIAo+IC0Jc25kX3NvY19j
b21wb25lbnRfdXBkYXRlX2JpdHMoY29tcG9uZW50LCBXTTg5MDRfQ0xPQ0tfUkFURVNfMCwgV004
OTA0X01DTEtfRElWLAo+IC0JCQkgICAgY2xvY2swKTsKPiAtCj4gKwlzbmRfc29jX2NvbXBvbmVu
dF91cGRhdGVfYml0cyhjb21wb25lbnQsIFdNODkwNF9DTE9DS19SQVRFU18wLAo+ICsJCQkJICAg
ICAgV004OTA0X01DTEtfRElWLCBjbG9jazApOwoKQXBwcmVjaWF0ZSB0aGlzIGlzIHByb2JhYmx5
IGEgZ29vZCBmb3JtYXR0aW5nIGNoYW5nZSBidXQKd2l0aCBhIGxhcmdlIGhhcmQgdG8gcmV2aWV3
IHBhdGNoIGl0cyBiZXR0ZXIgdG8ga2VlcCB1bnJlbGF0ZWQKY2hhbmdlcyBvdXQgb2YgaXQgdG8g
ZWFzeSByZXZpZXcuCgo+IEBAIC0xMzgyLDggKzE0NDUsOCBAQCBzdGF0aWMgaW50IHdtODkwNF9o
d19wYXJhbXMoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4gIAkJfQo+ICAJ
fQo+ICAJd204OTA0LT5iY2xrID0gKHdtODkwNC0+c3lzY2xrX3JhdGUgKiAxMCkgLyBiY2xrX2Rp
dnNbYmVzdF0uZGl2Owo+IC0JZGV2X2RiZyhjb21wb25lbnQtPmRldiwgIlNlbGVjdGVkIEJDTEtf
RElWIG9mICVkIGZvciAlZEh6IEJDTEtcbiIsCj4gLQkJYmNsa19kaXZzW2Jlc3RdLmRpdiwgd204
OTA0LT5iY2xrKTsKPiArCWRldl9kYmcoY29tcG9uZW50LT5kZXYsICJTZWxlY3RlZCBCQ0xLX0RJ
ViBvZiAlZC4lZCBmb3IgJWRIeiBCQ0xLXG4iLAo+ICsJCWJjbGtfZGl2c1tiZXN0XS5kaXYgLyAx
MCwgYmNsa19kaXZzW2Jlc3RdLmRpdiAlIDEwLCAgd204OTA0LT5iY2xrKTsKClRoaXMgaXMgYSBu
aWNlIHRpZHkgdXAgYXMgd2VsbCBidXQgd291bGQgYWxzbyBiZSBuaWNlIHRvIG5vdCBoYXZlCml0
IGluIHRoaXMgcGF0Y2guCgo+IEBAIC0xOTM3LDcgKzE3MTUsNiBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHNuZF9zb2NfZGFpX29wcyB3bTg5MDRfZGFpX29wcyA9IHsKPiAgCS5zZXRfc3lzY2xrID0g
d204OTA0X3NldF9zeXNjbGssCj4gIAkuc2V0X2ZtdCA9IHdtODkwNF9zZXRfZm10LAo+ICAJLnNl
dF90ZG1fc2xvdCA9IHdtODkwNF9zZXRfdGRtX3Nsb3QsCj4gLQkuc2V0X3BsbCA9IHdtODkwNF9z
ZXRfZmxsLAoKSSBhbSBub3Qga2VlbiBvbiB0aGUgd2F5IHdlIGFyZSByZW1vdmluZyB0aGUgYWJp
bGl0eSB0byBzZXQgdGhlCkZMTCBzb3VyY2UsIHRoZXJlIG1heSBiZSBvdXQgb2YgdHJlZSB1c2Vy
cyB1c2luZyB0aGlzIGFuZCB0byBteQprbm93bGVkZ2UgaXQgaXMgZmVhdHVyZXMgdGhhdCB3b3Jr
IGF0IHRoZSBtb21lbnQgc28gcmVtb3ZpbmcgaXQKc2VlbXMgbGlrZSBhIHN0ZXAgYmFja3dhcmRz
LgoKPiArc3RhdGljIGNvbnN0IHN0cnVjdCB3bV9mbGxfZGVzYyB3bTg5MDRfZmxsX2Rlc2MgPSB7
Cj4gKwkuY3RsX29mZnNldCA9IFdNODkwNF9GTExfQ09OVFJPTF8xLAo+ICsJLmludF9vZmZzZXQg
PSBXTTg5MDRfSU5URVJSVVBUX1NUQVRVUywKPiArCS5pbnRfbWFzayA9IFdNODkwNF9GTExfTE9D
S19FSU5UX01BU0ssCj4gKwkubmNvX3JlZzAgPSBXTTg5MDRfRkxMX05DT19URVNUXzAsCj4gKwku
bmNvX3JlZzEgPSBXTTg5MDRfRkxMX05DT19URVNUXzEsCj4gKwkuY2xrX3JlZl9tYXAgPSB7IEZM
TF9SRUZfTUNMSywgRkxMX1JFRl9CQ0xLLCBGTExfUkVGX0ZTQ0xLLCAvKiByZXNlcnZlZCAqLyAw
IH0sCgpNaW5vciBuaXQsIGJ1dCB3b3VsZCBwcm9iYWJseSBsb29rIG5pY2UgdG8gc3BsaXQgdGhp
cyBhY3Jvc3MgYQpjb3VwbGUgb2YgbGluZXMgYW5kIHdvdWxkIGtlZXAgdXMgdW5kZXIgdGhlIDgw
IGNoYXIgbGluZSBsaW1pdC4KCi5jbGtfcmVmX21hcCA9IHsKLi4uLgp9LAoKPiBAQCAtMjE2NSw2
ICsxOTUxLDE5IEBAIHN0YXRpYyBpbnQgd204OTA0X2kyY19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVu
dCAqaTJjLAo+ICAJLyogQ2FuIGxlYXZlIHRoZSBkZXZpY2UgcG93ZXJlZCBvZmYgdW50aWwgd2Ug
bmVlZCBpdCAqLwo+ICsJd204OTA0X2Rpc2FibGVfc3lzY2xrKHdtODkwNCk7CgpIb3cgY29tZSB0
aGlzIGlzIG5vdyBlbmFibGVkIGR1cmluZyBwcm9iZT8KCkkgdHJpbW1lZCBkb3duIHRoZSBDQyBs
aXN0LCBmb3IgdGhlIG5leHQgdmVyc2lvbiBJIHdvdWxkIHN1Z2dlc3QKdXNpbmcgYSBzaW1pbGFy
IGxpc3QsIHRoaXMgb25lIHdhcyBhIGxpdHRsZSBvdmVyIHNpemVkLgoKVGhhbmtzLApDaGFybGVz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2
ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxt
YW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
