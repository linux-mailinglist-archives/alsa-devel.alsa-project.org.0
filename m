Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E55D71A5
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 10:58:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77802167F;
	Tue, 15 Oct 2019 10:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77802167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571129926;
	bh=xZNMDxHj4hOMJs2dD5hwL8SPwGOXBixn+BApFj7FKLo=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LWU5Q00uQ9IMoBWp8wmWGTWKpVt6C0QUD6dSjNmE4GxLCNf7LGZvJd9VCIvyiZaxk
	 37mZe/enHDC6uz9Wp0FeYLzwzwzXp6jmQCcgRAw7wyQZ4/lTWkbTbCvYUzr1gi6+95
	 cJmrlsaN52LvQD8ZTU5uZPpd+Hw2N3EdiNStvzrI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E59BDF804AB;
	Tue, 15 Oct 2019 10:57:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 497B8F8011D; Tue, 15 Oct 2019 10:57:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2253F8011D
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 10:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2253F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UIFzixNP"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9F8vM04027590;
 Tue, 15 Oct 2019 03:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1571129842;
 bh=SLhMPsiThAaOZUsGPA+s41fzywD76Asq2pHDM368iIM=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=UIFzixNP77ZGti2D+7kpbP4YVwyX9FH/lFeiBsmgBxDolWjWov5Xcn/wZXWOIH25E
 o1hMtzTVXzY4NwiNiXRcYvH7Adb+smRQKkTkm0jjqRMCErjsnWKCCo7ceHLohJ8aSR
 C6QM+903n1qFqGRtw60HZeZ2ygLLil78VvAl61Ws=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9F8vMt0004964;
 Tue, 15 Oct 2019 03:57:22 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 15
 Oct 2019 03:57:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 15 Oct 2019 03:57:21 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9F8vJ2K001323;
 Tue, 15 Oct 2019 03:57:20 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
References: <20191015085240.21887-1-peter.ujfalusi@ti.com>
Message-ID: <24d6e2c0-093a-8fda-f6e3-29c864b82e9c@ti.com>
Date: Tue, 15 Oct 2019 11:58:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015085240.21887-1-peter.ujfalusi@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com
Subject: Re: [alsa-devel] [PATCH] ASoC: pcm3168a: Fix serial mode dependent
	format support
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

CgpPbiAxNS8xMC8yMDE5IDExLjUyLCBQZXRlciBVamZhbHVzaSB3cm90ZToKPiBmbXQgMCBpcyBw
ZXJmZWN0bHkgdmFsaWQgKFBDTTMxNjhBX0ZNVF9JMlMpLiBSZW1vdmUgdGhlIHJldHVybiBpbiBj
YXNlCj4gZm10ID09IDAuCj4gCj4gRml4ZXM6ICgiQVNvQzogcGNtMzE2OGE6IFVzZSBmaXh1cCBp
bnN0ZWFkIG9mIGNvbnN0cmFpbnQgZm9yIGNoYW5uZWxzIGFuZCBmb3JtYXRzIikKPiBSZXBvcnRl
ZC1ieTogS3VuaW5vcmkgTW9yaW1vdG8gPGt1bmlub3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIFVqZmFsdXNpIDxwZXRlci51amZhbHVzaUB0aS5jb20+
Cj4gLS0tCj4gIHNvdW5kL3NvYy9jb2RlY3MvcGNtMzE2OGEuYyB8IDIgLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3Mv
cGNtMzE2OGEuYyBiL3NvdW5kL3NvYy9jb2RlY3MvcGNtMzE2OGEuYwo+IGluZGV4IDcwOGRhYzI3
ZmVmZi4uZGY4Mzk1YjM2MWQ0IDEwMDY0NAo+IC0tLSBhL3NvdW5kL3NvYy9jb2RlY3MvcGNtMzE2
OGEuYwo+ICsrKyBiL3NvdW5kL3NvYy9jb2RlY3MvcGNtMzE2OGEuYwo+IEBAIC0zMjIsOCArMzIy
LDYgQEAgc3RhdGljIHZvaWQgcGNtMzE2OGFfdXBkYXRlX2ZpeHVwX3BjbV9zdHJlYW0oc3RydWN0
IHNuZF9zb2NfZGFpICpkYWkpCj4gIAl1NjQgZm9ybWF0cyA9IFNORFJWX1BDTV9GTVRCSVRfUzI0
XzNMRSB8IFNORFJWX1BDTV9GTVRCSVRfUzI0X0xFOwo+ICAJdW5zaWduZWQgaW50IGNoYW5uZWxf
bWF4ID0gZGFpLT5pZCA9PSBQQ00zMTY4QV9EQUlfREFDID8gOCA6IDY7Cj4gIAo+IC0JaWYgKCFw
Y20zMTY4YS0+aW9fcGFyYW1zW2RhaS0+aWRdLmZtdCkKPiAtCQlyZXR1cm47Cj4gIAoKSSBzaG91
bGQgYmUgcmVtb3Zpbmcgb25lIGJsYW5rIGxpbmUgYXMgd2VsbC4gSnVzdCBhIHNlYywgSSdsbCBz
ZW5kIHYyLgoKPiAgCWlmIChwY20zMTY4YS0+aW9fcGFyYW1zW2RhaS0+aWRdLmZtdCA9PSBQQ00z
MTY4QV9GTVRfUklHSFRfSikgewo+ICAJCS8qIFMxNl9MRSBpcyBvbmx5IHN1cHBvcnRlZCBpbiBS
SUdIVF9KIG1vZGUgKi8KPiAKCi0gUMOpdGVyCgpUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95
LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6
IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
