Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE25144AD1
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 05:33:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 379241674;
	Wed, 22 Jan 2020 05:32:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 379241674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579667619;
	bh=eUBH41nRO6MgwRISwxcf6QB19DJfc/C/s6peIYGugfg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p9N3nJr/MY1l23ayRoZQJ7LB2yODQTWbPsJ572iBzNamm1b/hnPQiGVPjvKQsAbbT
	 oyqHOcV/kJM28nZN4qlDq9cvrlGtBr5SFCwffnWQhU3VfeInrm7iMpIE7ZrR53oOBf
	 TFMpIEKSQK44UCS2UaxvPTEBqE980m4bssxoQgdQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 335C5F8022D;
	Wed, 22 Jan 2020 05:32:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3D9AF80229; Wed, 22 Jan 2020 05:32:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 427D0F8007E
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 05:32:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 427D0F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="WGBvzz7K"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e27d0530000>; Tue, 21 Jan 2020 20:32:19 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 21 Jan 2020 20:32:33 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 21 Jan 2020 20:32:33 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Jan
 2020 04:32:28 +0000
To: Dmitry Osipenko <digetx@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-5-git-send-email-spujar@nvidia.com>
 <a440d105-8db9-ecf1-3718-e58804ce14b8@gmail.com>
 <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
 <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <bdc749bc-b62c-a041-c17c-33fd49fe8e2e@nvidia.com>
Date: Wed, 22 Jan 2020 10:02:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579667539; bh=KdmKX9d8S+PQrtUkIVTaIyhy3ejgQLwLEoBvJKFTNnE=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=WGBvzz7KG05TcenZvck/dp97lpcrgOKH51OcIQnur3eIJ4HBue9LyYqC5M6j67Are
 Oa/gGGlwdl75oHpwowTo6ELVDM92lhTQjkeqeSwtnOnuMFuxA/Y8CXKjariz5Poj09
 C1snVF41uhsttluLGDnquh8qu7akwvNPjuEg1Z7nCjKvtEDWz7hs2Z/7/MdEBZCsrR
 LY4gkxw//Q4YwslGwy9XMBzIK274GR63dJQ6QmkLMNBTbZSXr09UAEwWqwlqUkNnCv
 e5y+/SB796VoegRoJIXRcLrVXz/FHwAbkeJAlrgnAMNvw9vmayJ1zd+fBZ+zMjDF38
 wC0lDvnkC19Zg==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, jonathanh@nvidia.com,
 viswanathl@nvidia.com, linux-tegra@vger.kernel.org, broonie@kernel.org,
 atalambedu@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH 4/9] ASoC: tegra: add Tegra210 based I2S
 driver
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CgpPbiAxLzIxLzIwMjAgOTozMyBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IEV4dGVybmFs
IGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4KPgo+IDIx
LjAxLjIwMjAgMTc6MjEsIFNhbWVlciBQdWphciDQv9C40YjQtdGCOgo+Cj4gW3NuaXBdCj4KPj4+
PiArc3RhdGljIGludCB0ZWdyYTIxMF9pMnNfcHV0X2NvbnRyb2woc3RydWN0IHNuZF9rY29udHJv
bCAqa2NvbnRyb2wsCj4+Pj4gKyAgICAgc3RydWN0IHNuZF9jdGxfZWxlbV92YWx1ZSAqdWNvbnRy
b2wpCj4+PiBDaGVja3BhdGNoIHNob3VsZCBjb21wbGFpbiBhYm91dCB0aGUgd3JvbmcgaW5kZW50
YXRpb24gaGVyZS4KPj4gSSBoYWQgcnVuIGNoZWNrcGF0Y2ggYmVmb3JlIHNlbmRpbmcgdGhlIHBh
dGNoLCBiZWxvdyBpcyB0aGUgcmVzdWx0Lgo+PiAtLS0tLQo+PiBXQVJOSU5HOiBhZGRlZCwgbW92
ZWQgb3IgZGVsZXRlZCBmaWxlKHMpLCBkb2VzIE1BSU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/Cj4+
ICM3MDoKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4KPj4gdG90YWw6IDAgZXJyb3JzLCAxIHdh
cm5pbmdzLCAxMTAzIGxpbmVzIGNoZWNrZWQKPj4KPj4gTk9URTogRm9yIHNvbWUgb2YgdGhlIHJl
cG9ydGVkIGRlZmVjdHMsIGNoZWNrcGF0Y2ggbWF5IGJlIGFibGUgdG8KPj4gICAgICAgIG1lY2hh
bmljYWxseSBjb252ZXJ0IHRvIHRoZSB0eXBpY2FsIHN0eWxlIHVzaW5nIC0tZml4IG9yCj4+IC0t
Zml4LWlucGxhY2UuCj4+IC0tLS0tCj4gVXNpbmcgJ2NoZWNrcGF0Y2ggLS1zdHJpY3QnOgo+Cj4g
Q0hFQ0s6IEFsaWdubWVudCBzaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRoZXNpcwo+ICMyNjkzOiBG
SUxFOiBzb3VuZC9zb2MvdGVncmEvdGVncmEyMTBfaTJzLmM6MzYyOgo+ICtzdGF0aWMgaW50IHRl
Z3JhMjEwX2kyc19wdXRfY29udHJvbChzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwKPiAr
ICAgICAgIHN0cnVjdCBzbmRfY3RsX2VsZW1fdmFsdWUgKnVjb250cm9sCj4KPiBbc25pcF0KCndp
bGwgZml4Cj4+Pj4gKwo+Pj4+ICsgICAgIH0gZWxzZSBpZiAoc3Ryc3RyKGtjb250cm9sLT5pZC5u
YW1lLCAiUGxheWJhY2sgQXVkaW8gQml0IEZvcm1hdCIpKQo+Pj4+ICsgICAgICAgICAgICAgaTJz
LT5hdWRpb19mbXRfb3ZlcnJpZGVbSTJTX1JYX1BBVEhdID0gdmFsdWU7Cj4+Pj4gKyAgICAgZWxz
ZSBpZiAoc3Ryc3RyKGtjb250cm9sLT5pZC5uYW1lLCAiQ2FwdHVyZSBBdWRpbyBCaXQgRm9ybWF0
IikpCj4+Pj4gKyAgICAgICAgICAgICBpMnMtPmF1ZGlvX2ZtdF9vdmVycmlkZVtJMlNfVFhfUEFU
SF0gPSB2YWx1ZTsKPj4+PiArICAgICBlbHNlIGlmIChzdHJzdHIoa2NvbnRyb2wtPmlkLm5hbWUs
ICJDbGllbnQgQml0IEZvcm1hdCIpKQo+Pj4+ICsgICAgICAgICAgICAgaTJzLT5jbGllbnRfZm10
X292ZXJyaWRlID0gdmFsdWU7Cj4+Pj4gKyAgICAgZWxzZSBpZiAoc3Ryc3RyKGtjb250cm9sLT5p
ZC5uYW1lLCAiUGxheWJhY2sgQXVkaW8gQ2hhbm5lbHMiKSkKPj4+PiArICAgICAgICAgICAgIGky
cy0+YXVkaW9fY2hfb3ZlcnJpZGVbSTJTX1JYX1BBVEhdID0gdmFsdWU7Cj4+Pj4gKyAgICAgZWxz
ZSBpZiAoc3Ryc3RyKGtjb250cm9sLT5pZC5uYW1lLCAiQ2FwdHVyZSBBdWRpbyBDaGFubmVscyIp
KQo+Pj4+ICsgICAgICAgICAgICAgaTJzLT5hdWRpb19jaF9vdmVycmlkZVtJMlNfVFhfUEFUSF0g
PSB2YWx1ZTsKPj4+PiArICAgICBlbHNlIGlmIChzdHJzdHIoa2NvbnRyb2wtPmlkLm5hbWUsICJD
bGllbnQgQ2hhbm5lbHMiKSkKPj4+PiArICAgICAgICAgICAgIGkycy0+Y2xpZW50X2NoX292ZXJy
aWRlID0gdmFsdWU7Cj4+Pj4gKyAgICAgZWxzZSBpZiAoc3Ryc3RyKGtjb250cm9sLT5pZC5uYW1l
LCAiQ2FwdHVyZSBTdGVyZW8gVG8gTW9ubyIpKQo+Pj4+ICsgICAgICAgICAgICAgaTJzLT5zdGVy
ZW9fdG9fbW9ub1tJMlNfVFhfUEFUSF0gPSB2YWx1ZTsKPj4+PiArICAgICBlbHNlIGlmIChzdHJz
dHIoa2NvbnRyb2wtPmlkLm5hbWUsICJDYXB0dXJlIE1vbm8gVG8gU3RlcmVvIikpCj4+Pj4gKyAg
ICAgICAgICAgICBpMnMtPm1vbm9fdG9fc3RlcmVvW0kyU19UWF9QQVRIXSA9IHZhbHVlOwo+Pj4+
ICsgICAgIGVsc2UgaWYgKHN0cnN0cihrY29udHJvbC0+aWQubmFtZSwgIlBsYXliYWNrIFN0ZXJl
byBUbyBNb25vIikpCj4+Pj4gKyAgICAgICAgICAgICBpMnMtPnN0ZXJlb190b19tb25vW0kyU19S
WF9QQVRIXSA9IHZhbHVlOwo+Pj4+ICsgICAgIGVsc2UgaWYgKHN0cnN0cihrY29udHJvbC0+aWQu
bmFtZSwgIlBsYXliYWNrIE1vbm8gVG8gU3RlcmVvIikpCj4+Pj4gKyAgICAgICAgICAgICBpMnMt
Pm1vbm9fdG9fc3RlcmVvW0kyU19SWF9QQVRIXSA9IHZhbHVlOwo+Pj4+ICsgICAgIGVsc2UgaWYg
KHN0cnN0cihrY29udHJvbC0+aWQubmFtZSwgIlBsYXliYWNrIEZJRk8gVGhyZXNob2xkIikpCj4+
Pj4gKyAgICAgICAgICAgICBpMnMtPnJ4X2ZpZm9fdGggPSB2YWx1ZTsKPj4+PiArICAgICBlbHNl
IGlmIChzdHJzdHIoa2NvbnRyb2wtPmlkLm5hbWUsICJCQ0xLIFJhdGlvIikpCj4+Pj4gKyAgICAg
ICAgICAgICBpMnMtPmJjbGtfcmF0aW8gPSB2YWx1ZTsKPj4+IEknbSBwcmV0dHkgc3VyZSB0aGF0
IGNoZWNrcGF0Y2ggc2hvdWxkIGNvbXBsYWluIGFib3V0IHRoZSBtaXNzaW5nCj4+PiBicmFja2V0
cywgdGhleSBzaG91bGQgbWFrZSBjb2RlJ3MgaW5kZW50YXRpb24gdW5pZm9ybSBhbmQgdGh1cyBl
YXNpZXIgdG8KPj4+IHJlYWQuIFNhbWUgZm9yIGFsbCBvdGhlciBvY2N1cnJlbmNlcyBpbiB0aGUg
Y29kZS4KPj4gc2FtZSBhcyBhYm92ZQo+IENIRUNLOiBicmFjZXMge30gc2hvdWxkIGJlIHVzZWQg
b24gYWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQKPiAjMjY5OTogRklMRTogc291bmQvc29jL3Rl
Z3JhL3RlZ3JhMjEwX2kycy5jOjM2ODoKPiArICAgICAgIGlmIChzdHJzdHIoa2NvbnRyb2wtPmlk
Lm5hbWUsICJMb29wYmFjayIpKSB7Cj4gWy4uLl0KPiArICAgICAgIH0gZWxzZSBpZiAoc3Ryc3Ry
KGtjb250cm9sLT5pZC5uYW1lLCAiU2FtcGxlIFJhdGUiKSkKPiBbLi4uXQo+ICsgICAgICAgZWxz
ZSBpZiAoc3Ryc3RyKGtjb250cm9sLT5pZC5uYW1lLCAiRlNZTkMgV2lkdGgiKSkgewo+IFsuLi5d
Cj4gKyAgICAgICB9IGVsc2UgaWYgKHN0cnN0cihrY29udHJvbC0+aWQubmFtZSwgIlBsYXliYWNr
IEF1ZGlvIEJpdCBGb3JtYXQiKSkKPiBbLi4uXQo+ICsgICAgICAgZWxzZSBpZiAoc3Ryc3RyKGtj
b250cm9sLT5pZC5uYW1lLCAiQ2FwdHVyZSBBdWRpbyBCaXQgRm9ybWF0IikpCj4gWy4uLl0KPiAr
ICAgICAgIGVsc2UgaWYgKHN0cnN0cihrY29udHJvbC0+aWQubmFtZSwgIkNsaWVudCBCaXQgRm9y
bWF0IikpCj4gWy4uLl0KPiArICAgICAgIGVsc2UgaWYgKHN0cnN0cihrY29udHJvbC0+aWQubmFt
ZSwgIlBsYXliYWNrIEF1ZGlvIENoYW5uZWxzIikpCj4gWy4uLl0KPiArICAgICAgIGVsc2UgaWYg
KHN0cnN0cihrY29udHJvbC0+aWQubmFtZSwgIkNhcHR1cmUgQXVkaW8gQ2hhbm5lbHMiKSkKPiBb
Li4uXQo+ICsgICAgICAgZWxzZSBpZiAoc3Ryc3RyKGtjb250cm9sLT5pZC5uYW1lLCAiQ2xpZW50
IENoYW5uZWxzIikpCj4gWy4uLl0KPiArICAgICAgIGVsc2UgaWYgKHN0cnN0cihrY29udHJvbC0+
aWQubmFtZSwgIkNhcHR1cmUgU3RlcmVvIFRvIE1vbm8iKSkKPiBbLi4uXQo+ICsgICAgICAgZWxz
ZSBpZiAoc3Ryc3RyKGtjb250cm9sLT5pZC5uYW1lLCAiQ2FwdHVyZSBNb25vIFRvIFN0ZXJlbyIp
KQo+IFsuLi5dCj4gKyAgICAgICBlbHNlIGlmIChzdHJzdHIoa2NvbnRyb2wtPmlkLm5hbWUsICJQ
bGF5YmFjayBTdGVyZW8gVG8gTW9ubyIpKQo+IFsuLi5dCj4gKyAgICAgICBlbHNlIGlmIChzdHJz
dHIoa2NvbnRyb2wtPmlkLm5hbWUsICJQbGF5YmFjayBNb25vIFRvIFN0ZXJlbyIpKQo+IFsuLi5d
Cj4gKyAgICAgICBlbHNlIGlmIChzdHJzdHIoa2NvbnRyb2wtPmlkLm5hbWUsICJQbGF5YmFjayBG
SUZPIFRocmVzaG9sZCIpKQo+IFsuLi5dCj4gKyAgICAgICBlbHNlIGlmIChzdHJzdHIoa2NvbnRy
b2wtPmlkLm5hbWUsICJCQ0xLIFJhdGlvIikpCj4gWy4uLl0KPgo+IFtzbmlwXQoKd2lsbCBmaXgK
Pj4+PiArICAgICBwbV9ydW50aW1lX2VuYWJsZShkZXYpOwo+Pj4gRXJyb3IgY2hlY2tpbmc/Cj4+
IHJldHVybiB0eXBlIGZvciBhYm92ZSBpcyB2b2lkKCkKPiBPawo+Cj4+Pj4gKyAgICAgcmV0dXJu
IDA7Cj4+Pj4gK30KPj4+PiArCj4+Pj4gK3N0YXRpYyBpbnQgdGVncmEyMTBfaTJzX3JlbW92ZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+Pj4+ICt7Cj4+Pj4gKyAgICAgcG1fcnVudGlt
ZV9kaXNhYmxlKCZwZGV2LT5kZXYpOwo+Pj4+ICsgICAgIGlmICghcG1fcnVudGltZV9zdGF0dXNf
c3VzcGVuZGVkKCZwZGV2LT5kZXYpKQo+Pj4+ICsgICAgICAgICAgICAgdGVncmEyMTBfaTJzX3J1
bnRpbWVfc3VzcGVuZCgmcGRldi0+ZGV2KTsKPj4+IFRoaXMgYnJlYWtzIGRldmljZSdzIFJQTSBy
ZWZjb3VudGluZyBpZiBpdCB3YXMgZGlzYWJsZWQgaW4gdGhlIGFjdGl2ZQo+Pj4gc3RhdGUuIFRo
aXMgY29kZSBzaG91bGQgYmUgcmVtb3ZlZC4gQXQgbW9zdCB5b3UgY291bGQgd2FybiBhYm91dCB0
aGUKPj4+IHVueHBlY3RlZCBSUE0gc3RhdGUgaGVyZSwgYnV0IGl0IHNob3VsZG4ndCBiZSBuZWNl
c3NhcnkuCj4+IEkgZ3Vlc3MgdGhpcyB3YXMgYWRkZWQgZm9yIHNhZmV0eSBhbmQgZXhwbGljaXQg
c3VzcGVuZCBrZWVwcyBjbG9jawo+PiBkaXNhYmxlZC4KPj4gTm90IHN1cmUgaWYgcmVmLWNvdW50
aW5nIG9mIHRoZSBkZXZpY2UgbWF0dGVycyB3aGVuIHJ1bnRpbWUgUE0gaXMKPj4gZGlzYWJsZWQg
YW5kIGRldmljZSBpcyByZW1vdmVkLgo+PiBJIHNlZSBmZXcgZHJpdmVycyB1c2luZyB0aGlzIHdh
eS4KPiBJdCBzaG91bGQgbWF0dGVyIChpZiBJJ20gbm90IG1pc3Npbmcgc29tZXRoaW5nKSBiZWNh
dXNlIFJQTSBzaG91bGQgYmUgaW4KPiBhIHdyZWNrZWQgc3RhdGUgb25jZSB5b3UnbGwgdHJ5IHRv
IHJlLWxvYWQgdGhlIGRyaXZlcidzIG1vZHVsZS4gTGlrZWx5Cj4gdGhhdCB0aG9zZSBmZXcgb3Ro
ZXIgZHJpdmVycyBhcmUgd3JvbmcuCj4KPiBbc25pcF0KCk9uY2UgdGhlIGRyaXZlciBpcyByZS1s
b2FkZWQgYW5kIFJQTSBpcyBlbmFibGVkLCBJIGRvbid0IHRoaW5rIGl0IHdvdWxkIHVzZQp0aGUg
c2FtZSAnZGV2JyBhbmQgdGhlIGNvcnJlc3BvbmRpbmcgcmVmIGNvdW50LiBEb2Vzbid0IGl0IHVz
ZSB0aGUgbmV3IApjb3VudGVycz8KSWYgUlBNIGlzIG5vdCB3b3JraW5nIGZvciBzb21lIHJlYXNv
biwgbW9zdCBsaWtlbHkgaXQgd291bGQgYmUgdGhlIGNhc2UgCmZvciBvdGhlcgpkZXZpY2VzLiBX
aGF0IGJlc3QgZHJpdmVyIGNhbiBkbyBpcyBwcm9iYWJseSBkbyBhIGZvcmNlIHN1c3BlbmQgZHVy
aW5nIApyZW1vdmFsIGlmCmFscmVhZHkgbm90IGRvbmUuIEkgd291bGQgcHJlZmVyIHRvIGtlZXAs
IHNpbmNlIG11bHRpcGxlIGRyaXZlcnMgc3RpbGwgCmhhdmUgaXQsCnVubGVzcyB0aGVyZSBpcyBh
IHJlYWwgaGFybSBpbiBkb2luZyBzby4KPgo+Pj4+ICsgICAgIGludCByeF9maWZvX3RoOwo+Pj4g
Q291bGQgcnhfZmlmb190aCBiZSBuZWdhdGl2ZT8KPj4gcnhfZmlmb190aCBpdHNlbGYgZG9lcyBu
b3QgdGFrZSBuZWdhdGl2ZSB2YWx1ZXMsIGV4cGxpY2l0IHR5cGVjYXN0aW5nPiBpcyBhdm9pZGVk
IGluICJpZiIgY29uZGl0aW9uIGJ5IGRlY2xhcmluZyB0aGlzIGFzICJpbnQiCj4gRXhwbGljaXQg
dHlwZWNhc3RpbmcgaXNuJ3QgbmVlZGVkIGZvciBpbnRlZ2Vycy4KCldoYXQgSSBtZWFudCB3YXMs
IHJ4X2ZpZm9fdGggaXMgY2hlY2tlZCBhZ2FpbnN0IGEgJ2ludCcgdmFyaWFibGUgaW4gYW4gCiJp
ZiIgY29uZGl0aW9uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3Jn
Cmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1k
ZXZlbAo=
