Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC34E359E
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 16:33:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C43516F2;
	Thu, 24 Oct 2019 16:32:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C43516F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571927605;
	bh=Mpz42PmIYE+Cv9NtjGBMjIooXguX/6ZpgcdUbsswTTU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QdSUPe60Oo7U8eXt7Pt1AjRBVNqddjOSAKULIMDaRxcgG4Vhj8ItVPF9tNumikUXT
	 ElKRtRZR8XlMTpwbE/8JGy14VTQOaJ8muxToySeS3epnh5Ohy3ebwqG8K0XcdYdgbx
	 paWZdd0K7LUrN7+rqerVs/WTey7iEUnc0ps4XxdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FA46F80377;
	Thu, 24 Oct 2019 16:31:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C249F8036B; Thu, 24 Oct 2019 16:31:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C34E5F80137
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 16:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C34E5F80137
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 07:31:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; d="scan'208";a="349727898"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 24 Oct 2019 07:31:31 -0700
Received: from atirumal-mobl1.amr.corp.intel.com (unknown [10.251.26.228])
 by linux.intel.com (Postfix) with ESMTP id 280EE580107;
 Thu, 24 Oct 2019 07:31:31 -0700 (PDT)
To: Patrick Lai <plai@codeaurora.org>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
References: <20191009181356.GO2036@sirena.org.uk>
 <20191022185906.GZ5554@sirena.co.uk>
 <204150f3-2d0f-e2df-e4d0-7324b4788e99@codeaurora.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <36d84c86-50d0-487b-181a-9238e11d7fce@linux.intel.com>
Date: Thu, 24 Oct 2019 09:31:50 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <204150f3-2d0f-e2df-e4d0-7324b4788e99@codeaurora.org>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Daniel Baluta <daniel.baluta@gmail.com>,
 Curtis Malainey <cujomalainey@google.com>
Subject: Re: [alsa-devel] [ANNOUNCE] 2019 Linux Audio miniconference
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

T24gMTAvMjQvMTkgOToyMCBBTSwgUGF0cmljayBMYWkgd3JvdGU6Cj4gT24gMTAvMjIvMTkgMTE6
NTkgQU0sIE1hcmsgQnJvd24gd3JvdGU6Cj4+IEhpLAo+IAo+Pgo+PiBBcyB3aXRoIHByZXZpb3Vz
IHllYXJzIGxldCdzIHB1bGwgdG9nZXRoZXIgYW4gYWdlbmRhIHRocm91Z2ggYSBtYWlsaW5nCj4+
IGxpc3QgZGlzY3Vzc2lvbiAtIGlmIHBlb3BsZSBjb3VsZCByZXBseSB0byB0aGlzIG1haWwgd2l0
aCBhbnkgdG9waWNzCj4+IHRoZXknZCBsaWtlIHRvIGRpc2N1c3Mgd2UgY2FuIHRha2UgaXQgZnJv
bSB0aGVyZS7CoCBPZiBjb3Vyc2UgaWYgd2UgY2FuCj4+IHNvcnQgdGhpbmdzIG91dCBtb3JlIHF1
aWNrbHkgdmlhIHRoZSBtYWlsaW5nIGxpc3QgdGhhdCdzIGV2ZW4gYmV0dGVyIQo+IAo+IDEuIEdh
cGxlc3MgcGxheWJhY2sgaGFuZGxpbmcgYmV0d2VlbiB0d28gcGxheWJhY2tzIHdpdGggZGlmZmVy
ZW50IGZvcm1hdAoKZGlkIHlvdSBtZWFuIGNvbXByZXNzZWQgZm9ybWF0cz8KCj4gMi4gUGFzc2lu
ZyB0aW1lc3RhbXAgYWxvbmcgd2l0aCBidWZmZXIgZm9yIGJvdGggcGxheWJhY2sgYW5kIGNhcHR1
cmUKPiAzLiBQQ00gZGV2aWNlIHZvbHVtZSBjb250cm9sCj4gNC4gVW5pZmllZCBhdWRpbyBncmFw
aCBidWlsZGluZyBhY3Jvc3MgbXVsdGlwbGUgc3Vic3lzdGVtcwo+IAo+IFRoYW5rcwo+IFBhdHJp
Y2sKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFs
c2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczov
L21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
