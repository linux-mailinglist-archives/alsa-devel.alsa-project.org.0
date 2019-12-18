Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 353A5124A2E
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 15:50:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F574839;
	Wed, 18 Dec 2019 15:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F574839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576680614;
	bh=w788B9C5OZww9JByayeebrXKrNWa5+3/n++rQ7nCk+g=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LLUnSX2Jvl/Ng6Zc1AZGV33IYrLTVbdfAGm92XZeVO3mLkAuItYlPcHuDKxAUa0vI
	 opGZX4hQ9OijDBIMLj9EV+a68fKmjQBFr6VQNZfTCcaRTApxf+oY6Dp1dCgE8xpnna
	 iMixtbSN85/GuU+nTbAC7mAegUtEakLzMm92nAtk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E957F8022C;
	Wed, 18 Dec 2019 15:48:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 678F0F8022C; Wed, 18 Dec 2019 15:48:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCEA9F8014C
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 15:48:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCEA9F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="qSeVYGqN"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20191218144815euoutp028c3180d85f91ca85b7a40cdc6813a0d0~hfo6lgOCx2253922539euoutp02F
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 14:48:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20191218144815euoutp028c3180d85f91ca85b7a40cdc6813a0d0~hfo6lgOCx2253922539euoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576680495;
 bh=1DgburzRei+7iW+6WARc7fUSzu/3gXW0bcDGkH57bSI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=qSeVYGqNpJ1LPdfN/xnasXYde4DNhGOsVrzJXqgyCB0T2sU2YOPCFNMaTKz0BScQ6
 SQkS6LAEpQxmNxku+4nvlSPtLf6de2k4BRYN1HpQodHgtmfaV/iTgtXjc6/eI0a5ss
 zPzo8xXbK5Eo15DfakbM+syB+WjzcgeL2DvCfsTU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191218144815eucas1p114627eac8bccd720497d0f807572031e~hfo6VX5H21269112691eucas1p1Y;
 Wed, 18 Dec 2019 14:48:15 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 38.3A.61286.F2C3AFD5; Wed, 18
 Dec 2019 14:48:15 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20191218144814eucas1p22b7b58c28afb30e87730177c4b9ae101~hfo57dVDI0042100421eucas1p2H;
 Wed, 18 Dec 2019 14:48:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191218144814eusmtrp2a55c5ed864da215e210d5224f869d6bc~hfo564K6t2958629586eusmtrp2W;
 Wed, 18 Dec 2019 14:48:14 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-cd-5dfa3c2f0839
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 1D.FF.08375.E2C3AFD5; Wed, 18
 Dec 2019 14:48:14 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20191218144814eusmtip15579723234624cdbe685887f32977769~hfo5gCEfV2082520825eusmtip1_;
 Wed, 18 Dec 2019 14:48:14 +0000 (GMT)
To: Mark Brown <broonie@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <f6453e48-cd95-6471-8945-4cc0ab3d04d9@samsung.com>
Date: Wed, 18 Dec 2019 15:48:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191218132620.GE3219@sirena.org.uk>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djPc7r6Nr9iDXbOFLe4cvEQk8XUh0/Y
 LE4cbmS2aJ/ZwWhx/vwGdosZ5/cxWRx+085q8XLzGyaLPRdfsTtwemz43MTmsWBTqcemVZ1s
 Hn1bVjF6bD5d7fF5k1wAWxSXTUpqTmZZapG+XQJXxo0T29kLpvJUvLo6hb2B8QZnFyMHh4SA
 icSVKxVdjFwcQgIrGCVWX7rOCOF8YZTYcGk2K4TzmVHi9oIuIIcTrOPx6tMsEInljBIH/p1j
 h3DeMkrMXbaWDaRKWCBP4uCS1WC2iIC7xNF/O8A6mAU2MEk0dH0BS7AJGEp0ve0Cs3kF7CRe
 LbzACnIUi4CqRN9UZRBTVCBWomN5BkSFoMTJmU9YQMKcAkYSb18ng4SZBeQlmrfOZoawxSVu
 PZnPBLJJQuAYu8TWpnZGiKNdJO6v7mWDsIUlXh3fwg5hy0j83wnT0Mwo8fDcWnYIp4dR4nLT
 DKhua4nDxy+C3cYsoCmxfpc+RNhRYva9z8yQcOSTuPFWEOIIPolJ26ZDhXklOtqEIKrVJGYd
 Xwe39uCFS8wTGJVmIflsFpJ3ZiF5ZxbC3gWMLKsYxVNLi3PTU4sN81LL9YoTc4tL89L1kvNz
 NzECU9Ppf8c/7WD8einpEKMAB6MSD68Bw89YIdbEsuLK3EOMEhzMSiK8tzuAQrwpiZVVqUX5
 8UWlOanFhxilOViUxHmNF72MFRJITyxJzU5NLUgtgskycXBKNTAuMt4tyLnH+qGiQ+gyz8da
 ET/FJb1cfDgEXh78qDBHk+1le/qkxmW20xpmh3VIrOHZwnE3sOTnP4e3i6e7LzBq7ptbmXnD
 7H2Z57yUcznb/nPy31ty3/FoqMVBxQuLD3xSOPXk7YlPAY82xB4y3flCzdHpV2JzVlTh2tsl
 tx/duVGz8tC8xgmflFiKMxINtZiLihMBSwOjbkkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsVy+t/xu7p6Nr9iDZ6eMre4cvEQk8XUh0/Y
 LE4cbmS2aJ/ZwWhx/vwGdosZ5/cxWRx+085q8XLzGyaLPRdfsTtwemz43MTmsWBTqcemVZ1s
 Hn1bVjF6bD5d7fF5k1wAW5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
 TUpqTmZZapG+XYJexo0T29kLpvJUvLo6hb2B8QZnFyMnh4SAicTj1adZuhi5OIQEljJKPFt0
 kw0iISNxcloDK4QtLPHnWhcbRNFrRoknq5+zgySEBfIkDi5ZDdYgIuAucfTfDrBJzAIbmCT2
 T5nBDtEB5Gw9f5AZpIpNwFCi620XWAevgJ3Eq4UXgFZwcLAIqEr0TVUGCYsKxEp8X/mJEaJE
 UOLkzCcsICWcAkYSb18ng4SZBcwk5m1+yAxhy0s0b50NZYtL3Hoyn2kCo9AsJN2zkLTMQtIy
 C0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIHxuO3Yz807GC9tDD7EKMDBqMTDa8Dw
 M1aINbGsuDL3EKMEB7OSCO/tDqAQb0piZVVqUX58UWlOavEhRlOg1yYyS4km5wNTRV5JvKGp
 obmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBsZudmnx4ylmu/4cXX3x3yZx
 zrXSa//93VbRVz8r7d9d76AAiy/1C05sWfH4hrW26t6+7O48AzWLlK1v/z34N/3k+fMvbj7i
 /rz19Z67x46FPa6+G3n9ULaur08uO5eSZoCd4f2kmpuN0sK2Be0Pz94yOFTyU2pKVHD9pVft
 HqU65/J3rnNkXXRTiaU4I9FQi7moOBEAuDwPcd0CAAA=
X-CMS-MailID: 20191218144814eucas1p22b7b58c28afb30e87730177c4b9ae101
X-Msg-Generator: CA
X-RootMTR: 20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c
References: <CGME20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c@epcas3p2.samsung.com>
 <20191128151908.180871-1-tzungbi@google.com>
 <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
 <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
 <20191218132620.GE3219@sirena.org.uk>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, Takashi Iwai <tiwai@suse.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Dylan Reid <dgreid@google.com>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
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

SGkgTWFyaywKCk9uIDE4LjEyLjIwMTkgMTQ6MjYsIE1hcmsgQnJvd24gd3JvdGU6Cj4gT24gRnJp
LCBEZWMgMTMsIDIwMTkgYXQgMDI6MDU6MzJBTSArMDgwMCwgVHp1bmctQmkgU2hpaCB3cm90ZToK
Pj4gSSBoYXZlIG5vIGVub3VnaCByZXNvdXJjZXMgdG8gdGVzdCBhbmQgdHJhY2UgdGhlIGNvZGUg
dGVtcG9yYXJpbHkuCj4+IEJ1dCBpcyBpdCBwb3NzaWJsZToKPj4gLSBzbmRfY2FyZF9uZXcoICkg
c3VjY2VlZCBpbiBzbmRfc29jX2JpbmRfY2FyZCggKSwgc28gdGhhdCB1c2Vyc3BhY2UKPj4gY2Fu
IHNlZSB0aGUgY29udHJvbAo+IFRoaXMgZmVlbHMgbGlrZSBzbmRfY2FyZF9uZXcoKSBpcyBiZWlu
ZyBvdmVybHkgZW50aHVzaWFzdGljIGhlcmUsIEknZAo+IGV4cGVjdCB0aGF0IHdlIG1pZ2h0IGhh
dmUgb3RoZXIgcHJvYmxlbXMgZWxzZXdoZXJlIHdpdGggdGhhdC4gIEknZCBub3QKPiBleHBlY3Qg
dXNlcnNwYWNlIHRvIHNlZSB0aGluZ3MgdW50aWwgc25kX2NhcmRfcmVnaXN0ZXIoKSBzaW5jZSBi
ZXR3ZWVuCj4gX25ldygpIGFuZCB0aGF0IHdlJ3JlIGluIHRoZSBwcm9jZXNzIG9mIGJ1aWxkaW5n
IHRoZSBjYXJkIHVwLiAgR2l2ZW4KPiB0aGlzIHdlICp3aWxsKiBuZWVkIHRvIGhhbmRsZSBwYXJ0
aWFsbHkgY29uc3RydWN0ZWQgY2FyZHMgYWZ0ZXIgYWxsLAo+IHVubGVzcyB3ZSBjaGFuZ2UgdGhl
IEFMU0EgY29yZS4gIFRha2FzaGk/CgpJJ20gbm90IHN1cmUgaWYgdGhpcyBpcyBhbiBpc3N1ZSBh
Ym91dCBwYXJ0aWFsbHkgcmVnaXN0ZXJlZCBjYXJkLiBIZXJlIAppcyB0aGUgYm9vdCBsb2c6Cgpo
dHRwczovL3Bhc3RlLmRlYmlhbi5uZXQvMTEyMTU0My8KClRoaXMgb29wcyBoYXBwZW5zIHdoZW4g
dWRldiB0cmllcyB0byBkbyBpdHMgam9iLiBUaGUgY2FyZCBpcyBlYXJsaWVyIApmdWxseSByZWdp
c3RlcmVkIGFuZCBhZHZlcnRpc2VkIGJ5IGFsc2E6CgpbwqDCoMKgIDMuNTAxMTk4XSBBTFNBIGRl
dmljZSBsaXN0OgpbwqDCoMKgIDMuNTAxMzAwXcKgwqAgIzA6IE9kcm9pZC1VMwoKSWYgdGhlcmUg
YXJlIGFueSB1c2VmdWwgbG9ncyBmb3IgdHJhY2tpbmcgdGhpcyBpc3N1ZSwgbGV0IG1lIGtub3cg
aG93IHRvIAplbmFibGUgdGhlbSwgc28gSSB3aWxsIHByb3ZpZGUgbW9yZSBsb2dzLgoKPgo+PiAt
IGNvZGUgaW4gbGF0ZXIgc25kX3NvY19iaW5kX2NhcmQoICkgZGVjaWRlZCB0byBkZWZlciB0aGUg
cHJvYmUKPj4gLSBzb2NfY2xlYW51cF9jYXJkX3Jlc291cmNlcyggKSBtYXkgZm9yZ2V0IHRvIGNs
ZWFuIHRoZSBjb250cm9sPyAgKG5vdAo+PiBzdXJlIGFib3V0IHRoaXMpCj4gVGhlcmUncyBnb2lu
ZyB0byBiZSBhIHJhY2UgY29uZGl0aW9uIHdoZXJlIHVzZXJzcGFjZSBjYW4gc2VlIHRoZSBjb250
cm9sCj4gb24gdGhlIHBhcnRpYWxseSBidWlsdCBjYXJkIHJlZ2FyZGxlc3Mgb2YgaWYgaXQgZ2V0
cyBjbGVhbmVkIHVwIG9yIG5vdC4KCkJlc3QgcmVnYXJkcwotLSAKTWFyZWsgU3p5cHJvd3NraSwg
UGhEClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
