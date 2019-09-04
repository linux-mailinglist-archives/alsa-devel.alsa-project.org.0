Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FA6A7F78
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 11:33:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD4A416A6;
	Wed,  4 Sep 2019 11:33:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD4A416A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567589633;
	bh=bzSscdZTTPOBrTqMeDqfC8kDwMGL8GocorNr/MrufUE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s3kvaWozvXKCpeoKKMslYc0qS6IQ+XfskHg7//69khVlZkqcliwYia+DS9irap970
	 Q0UFr0tSxqx1zNKfpzap+Mr+XGPkqsBkKesjp/DqXDT4zG6XUgPU9+DQsdGLs4YbG+
	 W6HS154mWPZzy6X3llDwX7CPMzNuaaHrUXtd4mEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0EE5F803D6;
	Wed,  4 Sep 2019 11:32:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE479F803A6; Wed,  4 Sep 2019 11:32:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13194F8011E
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 11:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13194F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GtGomH9v"
Received: from localhost (unknown [122.182.201.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A6FA21670;
 Wed,  4 Sep 2019 09:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567589520;
 bh=WgIUy8LE9J87OsA/15aWqvYEgaNDugjXyzgcT2llIIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GtGomH9v7txv+9qLZ9tZuCxIymaWrnwtZSsPvbYLctwoeAEUuyslKGLcUZ/PKqz7q
 aOsrl7gZPrpoqor59+m+aIqPC1tIM4lZfBHb36sjPuufs3+zaeru6XFkFV+QiG5/ts
 f0KpSkqiYCQL0QnrTdu5DYpv7uaKvXHC1C7MCldM=
Date: Wed, 4 Sep 2019 15:00:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20190904093052.GQ2672@vkoul-mobl>
References: <20190830185212.25144-1-msuchanek@suse.de>
 <f8c58d45-e641-5071-33bf-2927a61cb419@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8c58d45-e641-5071-33bf-2927a61cb419@infradead.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Michal Suchanek <msuchanek@suse.de>, Sanyog Kale <sanyog.r.kale@intel.com>,
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

T24gMzAtMDgtMTksIDExOjU2LCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4gT24gOC8zMC8xOSAxMTo1
MiBBTSwgTWljaGFsIFN1Y2hhbmVrIHdyb3RlOgo+ID4gRml4ZXMgdGhlIGZvbGxvd2luZyB3YXJu
aW5nIG9uICFBQ1BJIHN5c3RlbXM6Cj4gPiAKPiA+IGRyaXZlcnMvc291bmR3aXJlL3NsYXZlLmM6
MTY6MTI6IHdhcm5pbmc6IOKAmHNkd19zbGF2ZV9hZGTigJkgZGVmaW5lZCBidXQKPiA+IG5vdCB1
c2VkIFstV3VudXNlZC1mdW5jdGlvbl0KPiA+ICBzdGF0aWMgaW50IHNkd19zbGF2ZV9hZGQoc3Ry
dWN0IHNkd19idXMgKmJ1cywKPiA+ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn4KPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogTWljaGFsIFN1Y2hhbmVrIDxtc3VjaGFuZWtAc3VzZS5kZT4KPiAKPiBB
Y2tlZC1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4gCj4gSSB3YXMg
YWJvdXQgdG8gc2VuZCB0aGUgc2FtZSBwYXRjaC4KClNvIEkgaGF2ZSBhcHBsaWVkIFNyaW5pJ3Mg
cGF0Y2hlcyB3aGljaCBhZGQgRFQgc3VwcG9ydCBhbmQgdGhleSB1c2UKc2R3X3NsYXZlX2FkZCgp
LiBTbyBuZXh0IHRvbW9ycm93IHNob3VsZCBub3Qgc2VlIHRoaXMgZXJyb3IgYXMgaXQgaXMgbm93
CnVzZWQgYnkgRFQgcGFydHMgYXMgd2VsbC4KClNvIGRyb3BwaW5nIHRoaXMgcGF0Y2gKCi0tIAp+
Vmlub2QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxz
YS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8v
bWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
