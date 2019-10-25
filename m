Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 582B2E5246
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 19:27:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFA83187F;
	Fri, 25 Oct 2019 19:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFA83187F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572024474;
	bh=29MaVoCg5VkZxSa9g77/+Rv9poUNMmqDCX7h3oCPyPI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K4FT92ZcAQNJpI4Sd2/BbnToa5ZzzaYuFzl1qqTrcH5Iv4E60kaHajxjTqcshqnWH
	 3cWQG/B7VOtpuaJ1+MeTE6ZE7qqnEWLVdXnhwZ9O3OyxzR3WOJfgqallTxJ+ysFrnm
	 ffiJClmgoAGvflo5OHV3C14/4YRwkJnaK48omD1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C376F8036F;
	Fri, 25 Oct 2019 19:26:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 653BAF8036F; Fri, 25 Oct 2019 19:26:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03E72F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 19:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03E72F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="XxUHiXJ9"; 
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="XxUHiXJ9"
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id D6A3E60D77; Fri, 25 Oct 2019 17:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1572024363;
 bh=R+xIBVEgwVBLirOWoLIG2q7/jLszd7llsh4AyxrbbYI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XxUHiXJ9Z7EwkNkB2+WbC92zUNk6ooDBImS5PyeyhyA53GRsNh4k9hI8dkKV8+2hq
 ouJgZ8sWh1Qf8M1JTAvyTnSqOg2ap5F0lx+Zh4Sbs6KIhibP3o8vbQpDXJJA3Zs0wI
 NNbh3W9Klw13ZZfjd1Xg+g+OSJMgdbNU8fVcYkqA=
Received: from [10.73.210.38] (pat_11.qualcomm.com [192.35.156.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: plai@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E000860B19;
 Fri, 25 Oct 2019 17:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1572024363;
 bh=R+xIBVEgwVBLirOWoLIG2q7/jLszd7llsh4AyxrbbYI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XxUHiXJ9Z7EwkNkB2+WbC92zUNk6ooDBImS5PyeyhyA53GRsNh4k9hI8dkKV8+2hq
 ouJgZ8sWh1Qf8M1JTAvyTnSqOg2ap5F0lx+Zh4Sbs6KIhibP3o8vbQpDXJJA3Zs0wI
 NNbh3W9Klw13ZZfjd1Xg+g+OSJMgdbNU8fVcYkqA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E000860B19
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=plai@codeaurora.org
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
References: <20191009181356.GO2036@sirena.org.uk>
 <20191022185906.GZ5554@sirena.co.uk>
 <204150f3-2d0f-e2df-e4d0-7324b4788e99@codeaurora.org>
 <36d84c86-50d0-487b-181a-9238e11d7fce@linux.intel.com>
From: Patrick Lai <plai@codeaurora.org>
Message-ID: <81e94437-a0ad-0ee7-f572-b86b5de39349@codeaurora.org>
Date: Fri, 25 Oct 2019 10:26:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <36d84c86-50d0-487b-181a-9238e11d7fce@linux.intel.com>
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

CgpPbiAxMC8yNC8xOSA3OjMxIEFNLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiBPbiAx
MC8yNC8xOSA5OjIwIEFNLCBQYXRyaWNrIExhaSB3cm90ZToKPj4gT24gMTAvMjIvMTkgMTE6NTkg
QU0sIE1hcmsgQnJvd24gd3JvdGU6Cj4+PiBIaSwKPj4KPj4+Cj4+PiBBcyB3aXRoIHByZXZpb3Vz
IHllYXJzIGxldCdzIHB1bGwgdG9nZXRoZXIgYW4gYWdlbmRhIHRocm91Z2ggYSBtYWlsaW5nCj4+
PiBsaXN0IGRpc2N1c3Npb24gLSBpZiBwZW9wbGUgY291bGQgcmVwbHkgdG8gdGhpcyBtYWlsIHdp
dGggYW55IHRvcGljcwo+Pj4gdGhleSdkIGxpa2UgdG8gZGlzY3VzcyB3ZSBjYW4gdGFrZSBpdCBm
cm9tIHRoZXJlLsKgIE9mIGNvdXJzZSBpZiB3ZSBjYW4KPj4+IHNvcnQgdGhpbmdzIG91dCBtb3Jl
IHF1aWNrbHkgdmlhIHRoZSBtYWlsaW5nIGxpc3QgdGhhdCdzIGV2ZW4gYmV0dGVyIQo+Pgo+PiAx
LiBHYXBsZXNzIHBsYXliYWNrIGhhbmRsaW5nIGJldHdlZW4gdHdvIHBsYXliYWNrcyB3aXRoIGRp
ZmZlcmVudCBmb3JtYXQKPiAKPiBkaWQgeW91IG1lYW4gY29tcHJlc3NlZCBmb3JtYXRzPwoKWWVz
LCBjb21wcmVzcyBmb3JtYXQKClRoYW5rcwpQYXRyaWNrCgotLSAKUXVhbGNvbW0gSW5ub3ZhdGlv
biBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2YgQ29kZSBBdXJvcmEgRm9ydW0sCmEgTGludXgg
Rm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZl
bEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
