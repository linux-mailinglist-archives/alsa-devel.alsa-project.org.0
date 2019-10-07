Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EACACDCE1
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 10:10:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0CB91615;
	Mon,  7 Oct 2019 10:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0CB91615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570435828;
	bh=K/IljR3EmVGn2ddbQHlKt4vFd7QG3GTdm2hJ9PM2nys=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a3RPQQOf6TyNYi6azBfyXQmNky4CLRkJHM6L52W0s9kuvsj2ovQnJOFUilX8XMB18
	 N3WjyceMAokGeJu/uPvrCEput4aLjp/AODGqZO5zLazz2q0lV7FGB9pcG65CsyRDCP
	 qcGKuxDu3bz2A97+QSGKp7WnVV9erkYYtprMf40M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B5A9F802BE;
	Mon,  7 Oct 2019 10:08:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B9F7F802BE; Mon,  7 Oct 2019 10:08:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CB28F80096
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 10:08:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CB28F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="W3iSPRQC"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d9af2870000>; Mon, 07 Oct 2019 01:08:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 07 Oct 2019 01:08:35 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 07 Oct 2019 01:08:35 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Oct
 2019 08:08:35 +0000
Received: from [10.21.133.51] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Oct 2019
 08:08:33 +0000
To: Ben Dooks <ben.dooks@codethink.co.uk>, <linux-tegra@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20190930165130.10642-1-ben.dooks@codethink.co.uk>
 <20190930165130.10642-7-ben.dooks@codethink.co.uk>
 <3a65d828-8430-9739-7973-10e0df360767@nvidia.com>
 <faed4e1f-0e67-88b1-e276-80a8a5cd4b3e@codethink.co.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <f98024eb-2a85-9d80-d88a-486078807740@nvidia.com>
Date: Mon, 7 Oct 2019 09:08:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <faed4e1f-0e67-88b1-e276-80a8a5cd4b3e@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1570435719; bh=MN0U0cLhLQSdagBcaQ9XHhJhZnF+eNMQsmHaFn0JKZw=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=W3iSPRQC/AQI2L0lsLaj8GBNcWmxzjh6t1M2oEzahOzwO50QC3yYEi0m0rWTpOaFj
 tSqzadoUuz/voYFUXQU0Olt/a5Ep4RiOmIrh+nSEcnX24ejgN/5C/uX/iiaBIqQs1b
 3t6/M9N1oZXYyp+MZKeuZsy++1vwIUgRuMEQRCaK3ezJFmLvpEMUrXW8EtYcseyYH7
 xo08ZR8N/IkLYYUtlSJrrIdR734Bv2mpfi2TgCJXYCgqiZMlzwLxlKj5QZBq1IvFGi
 jxp7YYPVkim0oGn72Qrpv/9E0oJjfCBDjzt8msZGqaM9lK0+vclGFz0138bn3Mjagl
 JZ2X3pveunMNg==
Cc: linux-kernel@lists.codethink.co.uk
Subject: Re: [alsa-devel] [PATCH v3 6/7] ASoC: tegra: config fifos on
	hw_param changes
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

Ck9uIDA0LzEwLzIwMTkgMTg6MDMsIEJlbiBEb29rcyB3cm90ZToKPiBPbiAzMC8wOS8yMDE5IDIy
OjA4LCBKb24gSHVudGVyIHdyb3RlOgo+Pgo+PiBPbiAzMC8wOS8yMDE5IDE3OjUxLCBCZW4gRG9v
a3Mgd3JvdGU6Cj4+PiBJZiB0aGUgaHdfcGFyYW1zIHVzZXMgYSBkaWZmZXJlbnQgYml0IG9yIGNo
YW5uZWwgY291bnQsIHRoZW4gd2UKPj4+IG5lZWQgdG8gY2hhbmdlIGJvdGggdGhlIEkyUyB1bml0
J3MgQ0lGIGNvbmZpZ3VyYXRpb24gYXMgd2VsbCBhcwo+Pj4gdGhlIEFQQklGIG9uZS4KPj4+Cj4+
PiBUbyBhbGxvdyBjaGFuZ2luZyB0aGUgQVBCSUYsIGFkZCBhIGNhbGwgdG8gcmVjb25maWd1cmUg
dGhlIFJYIG9yCj4+PiBUWCBGSUZPIHdpdGhvdXQgY2hhbmdpbmcgdGhlIERNQSBvciBhbGxvY2F0
aW9uLCBhbmQgZ2V0IHRoZSBJMlMKPj4+IGRyaXZlciB0byBjYWxsIGl0IG9uY2UgdGhlIGh3IHBh
cmFtcyBoYXZlIGJlZW4gY2FsY3VsYXRlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEJlbiBEb29r
cyA8YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4KPj4+IC0tLQo+Pj4gwqAgc291bmQvc29jL3Rl
Z3JhL3RlZ3JhMzBfYWh1Yi5jIHwgMTE0ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LQo+Pj4gwqAgc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfYWh1Yi5oIHzCoMKgIDUgKysKPj4+IMKg
IHNvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jwqAgfMKgwqAgMiArCj4+PiDCoCAzIGZpbGVz
IGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKyksIDUyIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYg
LS1naXQgYS9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9haHViLmMKPj4+IGIvc291bmQvc29jL3Rl
Z3JhL3RlZ3JhMzBfYWh1Yi5jCj4+PiBpbmRleCA5NTIzODEyNjBkYzMuLjU4ZTA1Y2ViODZkYSAx
MDA2NDQKPj4+IC0tLSBhL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2FodWIuYwo+Pj4gKysrIGIv
c291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfYWh1Yi5jCj4+PiBAQCAtODQsMTIgKzg0LDQwIEBAIHN0
YXRpYyBpbnQgdGVncmEzMF9haHViX3J1bnRpbWVfcmVzdW1lKHN0cnVjdAo+Pj4gZGV2aWNlICpk
ZXYpCj4+PiDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4gwqAgfQo+Pj4gwqAgK2ludCB0ZWdyYTMw
X2FodWJfc2V0dXBfcnhfZmlmbyhlbnVtIHRlZ3JhMzBfYWh1Yl9yeGNpZiByeGNpZiwKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHRlZ3JhMzBfYWh1Yl9j
aWZfY29uZiAqY2lmX2NvbmYpCj4+PiArewo+Pj4gK8KgwqDCoCBpbnQgY2hhbm5lbCA9IHJ4Y2lm
IC0gVEVHUkEzMF9BSFVCX1JYQ0lGX0FQQklGX1JYMDsKPj4+ICvCoMKgwqAgdTMyIHJlZywgdmFs
Owo+Pj4gKwo+Pj4gK8KgwqDCoCBwbV9ydW50aW1lX2dldF9zeW5jKGFodWItPmRldik7Cj4+PiAr
Cj4+PiArwqDCoMKgIHJlZyA9IFRFR1JBMzBfQUhVQl9DSEFOTkVMX0NUUkwgKwo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoCAoY2hhbm5lbCAqIFRFR1JBMzBfQUhVQl9DSEFOTkVMX0NUUkxfU1RSSURF
KTsKPj4+ICvCoMKgwqAgdmFsID0gdGVncmEzMF9hcGJpZl9yZWFkKHJlZyk7Cj4+PiArwqDCoMKg
IHZhbCAmPSB+KFRFR1JBMzBfQUhVQl9DSEFOTkVMX0NUUkxfUlhfVEhSRVNIT0xEX01BU0sgfAo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqAgVEVHUkEzMF9BSFVCX0NIQU5ORUxfQ1RSTF9SWF9QQUNLX01B
U0spOwo+Pj4gK8KgwqDCoCB2YWwgfD0gKDcgPDwgVEVHUkEzMF9BSFVCX0NIQU5ORUxfQ1RSTF9S
WF9USFJFU0hPTERfU0hJRlQpIHwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBURUdSQTMwX0FI
VUJfQ0hBTk5FTF9DVFJMX1JYX1BBQ0tfRU4gfAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIFRF
R1JBMzBfQUhVQl9DSEFOTkVMX0NUUkxfUlhfUEFDS18xNjsKPj4+ICvCoMKgwqAgdGVncmEzMF9h
cGJpZl93cml0ZShyZWcsIHZhbCk7Cj4+PiArCj4+PiArwqDCoMKgIGNpZl9jb25mLT5kaXJlY3Rp
b24gPSBURUdSQTMwX0FVRElPQ0lGX0RJUkVDVElPTl9SWDsKPj4+ICsKPj4+ICvCoMKgwqAgcmVn
ID0gVEVHUkEzMF9BSFVCX0NJRl9SWF9DVFJMICsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgKGNo
YW5uZWwgKiBURUdSQTMwX0FIVUJfQ0lGX1JYX0NUUkxfU1RSSURFKTsKPj4+ICvCoMKgwqAgYWh1
Yi0+c29jX2RhdGEtPnNldF9hdWRpb19jaWYoYWh1Yi0+cmVnbWFwX2FwYmlmLCByZWcsIGNpZl9j
b25mKTsKPj4+ICsKPj4+ICvCoMKgwqAgcG1fcnVudGltZV9wdXQoYWh1Yi0+ZGV2KTsKPj4+ICvC
oMKgwqAgcmV0dXJuIDA7Cj4+PiArfQo+Pj4gK0VYUE9SVF9TWU1CT0xfR1BMKHRlZ3JhMzBfYWh1
Yl9zZXR1cF9yeF9maWZvKTsKPj4+ICsKPj4+IMKgIGludCB0ZWdyYTMwX2FodWJfYWxsb2NhdGVf
cnhfZmlmbyhlbnVtIHRlZ3JhMzBfYWh1Yl9yeGNpZiAqcnhjaWYsCj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjaGFyICpkbWFjaGFuLCBpbnQgZG1hY2hhbl9sZW4s
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfYWRkcl90ICpm
aWZvcmVnKQo+Pj4gwqAgewo+Pj4gwqDCoMKgwqDCoCBpbnQgY2hhbm5lbDsKPj4+IC3CoMKgwqAg
dTMyIHJlZywgdmFsOwo+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgdGVncmEzMF9haHViX2NpZl9jb25m
IGNpZl9jb25mOwo+Pj4gwqAgwqDCoMKgwqDCoCBjaGFubmVsID0gZmluZF9maXJzdF96ZXJvX2Jp
dChhaHViLT5yeF91c2FnZSwKPj4+IEBAIC0xMDQsMzcgKzEzMiwxNCBAQCBpbnQgdGVncmEzMF9h
aHViX2FsbG9jYXRlX3J4X2ZpZm8oZW51bQo+Pj4gdGVncmEzMF9haHViX3J4Y2lmICpyeGNpZiwK
Pj4+IMKgwqDCoMKgwqAgKmZpZm9yZWcgPSBhaHViLT5hcGJpZl9hZGRyICsgVEVHUkEzMF9BSFVC
X0NIQU5ORUxfUlhGSUZPICsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoY2hhbm5lbCAq
IFRFR1JBMzBfQUhVQl9DSEFOTkVMX1JYRklGT19TVFJJREUpOwo+Pj4gwqAgLcKgwqDCoCBwbV9y
dW50aW1lX2dldF9zeW5jKGFodWItPmRldik7Cj4+PiArwqDCoMKgIG1lbXNldCgmY2lmX2NvbmYs
IDAsIHNpemVvZihjaWZfY29uZikpOwo+Pj4gwqAgLcKgwqDCoCByZWcgPSBURUdSQTMwX0FIVUJf
Q0hBTk5FTF9DVFJMICsKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqAgKGNoYW5uZWwgKiBURUdSQTMw
X0FIVUJfQ0hBTk5FTF9DVFJMX1NUUklERSk7Cj4+PiAtwqDCoMKgIHZhbCA9IHRlZ3JhMzBfYXBi
aWZfcmVhZChyZWcpOwo+Pj4gLcKgwqDCoCB2YWwgJj0gfihURUdSQTMwX0FIVUJfQ0hBTk5FTF9D
VFJMX1JYX1RIUkVTSE9MRF9NQVNLIHwKPj4+IC3CoMKgwqDCoMKgwqDCoMKgIFRFR1JBMzBfQUhV
Ql9DSEFOTkVMX0NUUkxfUlhfUEFDS19NQVNLKTsKPj4+IC3CoMKgwqAgdmFsIHw9ICg3IDw8IFRF
R1JBMzBfQUhVQl9DSEFOTkVMX0NUUkxfUlhfVEhSRVNIT0xEX1NISUZUKSB8Cj4+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqAgVEVHUkEzMF9BSFVCX0NIQU5ORUxfQ1RSTF9SWF9QQUNLX0VOIHwKPj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoCBURUdSQTMwX0FIVUJfQ0hBTk5FTF9DVFJMX1JYX1BBQ0tf
MTY7Cj4+PiAtwqDCoMKgIHRlZ3JhMzBfYXBiaWZfd3JpdGUocmVnLCB2YWwpOwo+Pj4gLQo+Pj4g
LcKgwqDCoCBjaWZfY29uZi50aHJlc2hvbGQgPSAwOwo+Pj4gwqDCoMKgwqDCoCBjaWZfY29uZi5h
dWRpb19jaGFubmVscyA9IDI7Cj4+PiDCoMKgwqDCoMKgIGNpZl9jb25mLmNsaWVudF9jaGFubmVs
cyA9IDI7Cj4+PiDCoMKgwqDCoMKgIGNpZl9jb25mLmF1ZGlvX2JpdHMgPSBURUdSQTMwX0FVRElP
Q0lGX0JJVFNfMTY7Cj4+PiDCoMKgwqDCoMKgIGNpZl9jb25mLmNsaWVudF9iaXRzID0gVEVHUkEz
MF9BVURJT0NJRl9CSVRTXzE2Owo+Pj4gLcKgwqDCoCBjaWZfY29uZi5leHBhbmQgPSAwOwo+Pj4g
LcKgwqDCoCBjaWZfY29uZi5zdGVyZW9fY29udiA9IDA7Cj4+PiAtwqDCoMKgIGNpZl9jb25mLnJl
cGxpY2F0ZSA9IDA7Cj4+PiAtwqDCoMKgIGNpZl9jb25mLmRpcmVjdGlvbiA9IFRFR1JBMzBfQVVE
SU9DSUZfRElSRUNUSU9OX1JYOwo+Pj4gLcKgwqDCoCBjaWZfY29uZi50cnVuY2F0ZSA9IDA7Cj4+
PiAtwqDCoMKgIGNpZl9jb25mLm1vbm9fY29udiA9IDA7Cj4+PiAtCj4+PiAtwqDCoMKgIHJlZyA9
IFRFR1JBMzBfQUhVQl9DSUZfUlhfQ1RSTCArCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgIChjaGFu
bmVsICogVEVHUkEzMF9BSFVCX0NJRl9SWF9DVFJMX1NUUklERSk7Cj4+PiAtwqDCoMKgIGFodWIt
PnNvY19kYXRhLT5zZXRfYXVkaW9fY2lmKGFodWItPnJlZ21hcF9hcGJpZiwgcmVnLCAmY2lmX2Nv
bmYpOwo+Pj4gLQo+Pj4gLcKgwqDCoCBwbV9ydW50aW1lX3B1dChhaHViLT5kZXYpOwo+Pj4gwqAg
LcKgwqDCoCByZXR1cm4gMDsKPj4+ICvCoMKgwqAgcmV0dXJuIHRlZ3JhMzBfYWh1Yl9zZXR1cF9y
eF9maWZvKCpyeGNpZiwgJmNpZl9jb25mKTsKPj4KPj4gSXQgc2VlbXMgYSBiaXQgb2RkLCB0aGF0
IHlvdSBzdGlsbCBjb25maWd1cmUgc29tZSBvZiB0aGUgY2lmX2NvbmYKPj4gbWVtYmVycyBhbmQg
dGhlbiBjYWxsIHRlZ3JhMzBfYWh1Yl9zZXR1cF9yeF9maWZvKCkgaGVyZS4gV2h5IG5vdCBqdXN0
Cj4+IGFsbG9jYXRlIGl0IGFuZCB0aGVuIG1vdmUgYWxsIHRoZSBwcm9ncmFtbWluZyB0bwo+PiB0
ZWdyYTMwX2FodWJfc2V0dXBfcnhfZmlmbygpPwo+IAo+IEkgd2FzIHRyeWluZyB0byBrZWVwIHRo
ZSBiZWhhdmlvdXIgdGhlIHNhbWUsIElJUkMgdGhlIG9yaWdpbmFsIGlzIGZpcnN0Cj4gY2FsbGVk
IGJlZm9yZSB0aGUgZm9ybWF0IGluZm9ybWF0aW9uIGlzIGtub3duLgoKTG9va3MgbGlrZSB0aGUg
STJTIGRyaXZlciBpcyB0aGUgb25seSBjdXJyZW50IHVzZXIgb2YgdGhpcywgc28gc3BsaXR0aW5n
CnRoZSBmdW5jdGlvbiBpbnRvIHR3byBjb3VsZCBtYWtlIHNlbnNlLgoKQ2hlZXJzCkpvbgoKLS0g
Cm52cHVibGljCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRw
czovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
