Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D81A3E07
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 20:58:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7C0815F8;
	Fri, 30 Aug 2019 20:57:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7C0815F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567191497;
	bh=yfrPz8V8q79etZ50HBVF4oFc15g5TPFdyufVSVvcrgs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aybjTmUnQXgMmThxSQkEuPhox6PlYZ+3rBz9MYqm0k4iRScKzKvF3GGRd7oDU44q1
	 Bk6t9wvDcQ6/iurq/pSe2pTpJLgGzy51nDUGka6ntPcqcdVu+EukOEFzksb08m4kB/
	 K7AWgCnPxC81Pshmzai/6CCtK3TIcxFaw/CW2zZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FAC7F80362;
	Fri, 30 Aug 2019 20:56:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2CB6F80369; Fri, 30 Aug 2019 20:56:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BF1EF800D1
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 20:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BF1EF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="S+L15B5K"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qB7bQSi53I1npLxvR85xOF8bwwpMOBJ2wphwbJZyjGA=; b=S+L15B5KsQ25awTQMTHSrXwK9
 /RlRLGUliPs9cgBcRwLZBX3Oq1glIaqAd2PBaeBgKNwUpGTgVwzgH9m0vt04PbrkKHLaMpcTeBBT/
 5eUmmbxDx4R1vvawFUfAhlW2pb6tJ08qrOjqdsxGoOd6u7jNBnnlVVnXlm+VDX6vzAD0RCGfYYU+B
 JvotsCSLtfZUkXdhAXqblkk19snm9UXOmSofvPsKc3u/AfBJPmiWD0WgPe3AT+EWozWDeN3UpkEQM
 gSr7V4mznJ9sbFPirjliyxnSl55tXKtBktjB4x6t1PAhOBMHlwfM2bVw5p34Pag7RjXQ6ZKUc4QjE
 /MOVr8Pvw==;
Received: from [2601:1c0:6200:6e8::4f71]
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i3m4M-0002I2-Ou; Fri, 30 Aug 2019 18:56:22 +0000
To: Michal Suchanek <msuchanek@suse.de>, alsa-devel@alsa-project.org
References: <20190830185212.25144-1-msuchanek@suse.de>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f8c58d45-e641-5071-33bf-2927a61cb419@infradead.org>
Date: Fri, 30 Aug 2019 11:56:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830185212.25144-1-msuchanek@suse.de>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
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

T24gOC8zMC8xOSAxMTo1MiBBTSwgTWljaGFsIFN1Y2hhbmVrIHdyb3RlOgo+IEZpeGVzIHRoZSBm
b2xsb3dpbmcgd2FybmluZyBvbiAhQUNQSSBzeXN0ZW1zOgo+IAo+IGRyaXZlcnMvc291bmR3aXJl
L3NsYXZlLmM6MTY6MTI6IHdhcm5pbmc6IOKAmHNkd19zbGF2ZV9hZGTigJkgZGVmaW5lZCBidXQK
PiBub3QgdXNlZCBbLVd1bnVzZWQtZnVuY3Rpb25dCj4gIHN0YXRpYyBpbnQgc2R3X3NsYXZlX2Fk
ZChzdHJ1Y3Qgc2R3X2J1cyAqYnVzLAo+ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBNaWNoYWwgU3VjaGFuZWsgPG1zdWNoYW5la0BzdXNlLmRlPgoKQWNrZWQt
Ynk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgoKSSB3YXMgYWJvdXQgdG8g
c2VuZCB0aGUgc2FtZSBwYXRjaC4KVGhhbmtzLgoKPiAtLS0KPiAgZHJpdmVycy9zb3VuZHdpcmUv
c2xhdmUuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc291bmR3aXJlL3NsYXZlLmMgYi9kcml2
ZXJzL3NvdW5kd2lyZS9zbGF2ZS5jCj4gaW5kZXggZjM5YTU4MTVlMjVkLi4zNGM3ZTY1ODMxZDEg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zb3VuZHdpcmUvc2xhdmUuYwo+ICsrKyBiL2RyaXZlcnMv
c291bmR3aXJlL3NsYXZlLmMKPiBAQCAtNiw2ICs2LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L3Nv
dW5kd2lyZS9zZHdfdHlwZS5oPgo+ICAjaW5jbHVkZSAiYnVzLmgiCj4gIAo+ICsjaWYgSVNfRU5B
QkxFRChDT05GSUdfQUNQSSkKPiAgc3RhdGljIHZvaWQgc2R3X3NsYXZlX3JlbGVhc2Uoc3RydWN0
IGRldmljZSAqZGV2KQo+ICB7Cj4gIAlzdHJ1Y3Qgc2R3X3NsYXZlICpzbGF2ZSA9IGRldl90b19z
ZHdfZGV2KGRldik7Cj4gQEAgLTYwLDcgKzYxLDYgQEAgc3RhdGljIGludCBzZHdfc2xhdmVfYWRk
KHN0cnVjdCBzZHdfYnVzICpidXMsCj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+IC0jaWYgSVNf
RU5BQkxFRChDT05GSUdfQUNQSSkKPiAgLyoKPiAgICogc2R3X2FjcGlfZmluZF9zbGF2ZXMoKSAt
IEZpbmQgU2xhdmUgZGV2aWNlcyBpbiBNYXN0ZXIgQUNQSSBub2RlCj4gICAqIEBidXM6IFNEVyBi
dXMgaW5zdGFuY2UKPiAKCgotLSAKflJhbmR5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxz
YS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2Fsc2EtZGV2ZWwK
