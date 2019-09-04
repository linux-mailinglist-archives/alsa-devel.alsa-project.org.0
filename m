Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E015AA8140
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 13:44:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5539316AC;
	Wed,  4 Sep 2019 13:43:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5539316AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567597445;
	bh=OvsFjZ4Hpyq6bsK3Kcy0eQ/FdhwLntju/JRfI1AQ0tA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A8XgDw0+yooxDVqaQWEx6g+ATYIKS9LGRvLqryAtFWPn8szsZNjxOSCaF6Uzm/05S
	 ZEbfb/wyCyF4nsW0eL99jNZaMtN0ND28w66zGHT5wZRzW4HJmKbD2NfXS8xvBvWT4Z
	 iaLljxRj4f3Nh7XBjsqz71GObWr5hLQaP2xsVBC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABD40F803A6;
	Wed,  4 Sep 2019 13:42:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D952F803A6; Wed,  4 Sep 2019 13:42:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78443F80171
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 13:42:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78443F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HpDusYLy"
Received: from localhost (unknown [122.182.201.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EAC4720820;
 Wed,  4 Sep 2019 11:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567597327;
 bh=Iu1vh+UB2UTe/P8T2CkcUAMYlHAR9Uq0TtPWxda2pqc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HpDusYLy+uvhV4rv0L+uXxG5hVwlSOCOoihvmRGmo0YMM1lesw1xfGTKuATz1aHee
 djikE5xbk2y8Bf3BabxlRiGlQiDggItPbT/vIESI9SdfrO75il7LkEghSDKZXeyjAp
 a2shKS1pDwU9wwXgaVpNNI/aogkbvbXt7hP3FipE=
Date: Wed, 4 Sep 2019 17:10:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Message-ID: <20190904114059.GU2672@vkoul-mobl>
References: <20190830185212.25144-1-msuchanek@suse.de>
 <f8c58d45-e641-5071-33bf-2927a61cb419@infradead.org>
 <20190904093052.GQ2672@vkoul-mobl> <20190904124803.1700a65a@naga>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190904124803.1700a65a@naga>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Randy Dunlap <rdunlap@infradead.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] soundwire: slave: Fix unused function
	warning on !ACPI
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

T24gMDQtMDktMTksIDEyOjQ4LCBNaWNoYWwgU3VjaMOhbmVrIHdyb3RlOgo+IE9uIFdlZCwgNCBT
ZXAgMjAxOSAxNTowMDo1MiArMDUzMAo+IFZpbm9kIEtvdWwgPHZrb3VsQGtlcm5lbC5vcmc+IHdy
b3RlOgo+IAo+ID4gT24gMzAtMDgtMTksIDExOjU2LCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4gPiA+
IE9uIDgvMzAvMTkgMTE6NTIgQU0sIE1pY2hhbCBTdWNoYW5layB3cm90ZTogIAo+ID4gPiA+IEZp
eGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZyBvbiAhQUNQSSBzeXN0ZW1zOgo+ID4gPiA+IAo+ID4g
PiA+IGRyaXZlcnMvc291bmR3aXJlL3NsYXZlLmM6MTY6MTI6IHdhcm5pbmc6IOKAmHNkd19zbGF2
ZV9hZGTigJkgZGVmaW5lZCBidXQKPiA+ID4gPiBub3QgdXNlZCBbLVd1bnVzZWQtZnVuY3Rpb25d
Cj4gPiA+ID4gIHN0YXRpYyBpbnQgc2R3X3NsYXZlX2FkZChzdHJ1Y3Qgc2R3X2J1cyAqYnVzLAo+
ID4gPiA+ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBNaWNoYWwgU3VjaGFuZWsgPG1zdWNoYW5la0BzdXNlLmRlPiAgCj4gPiA+IAo+ID4g
PiBBY2tlZC1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4gPiA+IAo+
ID4gPiBJIHdhcyBhYm91dCB0byBzZW5kIHRoZSBzYW1lIHBhdGNoLiAgCj4gPiAKPiA+IFNvIEkg
aGF2ZSBhcHBsaWVkIFNyaW5pJ3MgcGF0Y2hlcyB3aGljaCBhZGQgRFQgc3VwcG9ydCBhbmQgdGhl
eSB1c2UKPiA+IHNkd19zbGF2ZV9hZGQoKS4gU28gbmV4dCB0b21vcnJvdyBzaG91bGQgbm90IHNl
ZSB0aGlzIGVycm9yIGFzIGl0IGlzIG5vdwo+ID4gdXNlZCBieSBEVCBwYXJ0cyBhcyB3ZWxsLgo+
ID4gCj4gPiBTbyBkcm9wcGluZyB0aGlzIHBhdGNoCj4gPiAKPiAKPiBUaGF0IHNob3VsZCBmaXgg
dGhlIGlzc3VlIGZvciBtZS4gSSB3b25kZXIgaWYgIUFDUEkgIURUIHBsYXRmb3JtcyBhcmUKPiBz
dGlsbCBhIHRoaW5nLgoKSGVoIHRoYXQgc2hvdWxkIHRyaWdnZXIgdGhpcyBpZiB3ZSBoYXZlIG9u
ZSA6RCBzbyBzaG91bGQgYSBsb3QgbW9yZQp3aGljaCBkZXBlbmQgb24gc29tZSBmaXJtd2FyZSEK
Ci0tIAp+Vmlub2QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0
dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZl
bAo=
