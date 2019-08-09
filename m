Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7BF87403
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 10:27:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04BE484F;
	Fri,  9 Aug 2019 10:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04BE484F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565339257;
	bh=glkRyTD3m8TbUyjVAVorp6/YrcNS/jjLlub17/LnrL0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D9aNyEmhQeQSCaxEWqWF0qvnuKBHVsfNd/HG6aC2MY5CNaDcJdpU/euFsE7qLlZGd
	 RTFEetfmvqCJbK5nsnPeJl4rzcP6kozjDt4yBOWKZpc/fRtbSnFbML2hp3OhEnJpiw
	 YCxxCHOZTu8zNX9vZ+i4CHVkrkVW6vbSK4N13dRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 527D5F805F9;
	Fri,  9 Aug 2019 10:25:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F2ECF805FA; Fri,  9 Aug 2019 10:25:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 540D4F805F5
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 10:25:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 540D4F805F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="k31HPisK"
Received: by mail-wm1-x341.google.com with SMTP id f72so4801978wmf.5
 for <alsa-devel@alsa-project.org>; Fri, 09 Aug 2019 01:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yi51TwivV5MGEpDQ4mr9gOZ4jMyu3GWtUO7Aw8f23Cg=;
 b=k31HPisK11a8kdaMYCVnBq9a23l36+ZiSRXZYFd8rhpmKaN19iKyV2V8FpC9WyOo49
 xbCvbeXm0iZSwkXRFsChD+2SKvpOANVY+0EnL7YMQ/1zPwATASIZNlI78Itx3+HNQKeF
 N56Te+9xFz538p5Z0MJv619MbNDjsPZxz2mFWyG0scevzGLJML2+97SGQIZhNk9woLiC
 GSjwMfx7Ep8kkdiCSl9HYok3FchGsWGhHenE0HuIfuK4xrBgkbXMGn7AQ5HfTi019+rg
 2e52LOMCjYjO6GVQxYmp3PSsGLAeCeIyn690a2wRLZRdh2b1/lny+ISvnNsLEyZ4dzxJ
 vPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yi51TwivV5MGEpDQ4mr9gOZ4jMyu3GWtUO7Aw8f23Cg=;
 b=FnfWbM2Fxfsa3618Vz4AICKki1n2m6uT8gc91iwrsiP/jLWBsLp8aLxGODleNE99eI
 tzaDBfR00ZNra/+Gpu+V4CF+rd7G/i4n5W7RvCLI5TbHMudDuH3DMOGNffs2qpnIkNJQ
 uXAfKzUKIwBgug9/c+GXgImgjRwzHxoAyMlPtNBJ6Y52ocBUNBuMTVY2aI/C5Tt0OqQN
 HDLaPiHnhnRPIHJSV2eLRPSAPL7Qto60x1H2bkf195RVbrasNtPQ9F/oF6jhepVGXRlQ
 IsYJd0D4mZu52YvCai4AAD8Ci02dEL6hqq/x515+ISHmb4STlz1pErm/eEsIK99WaG8S
 JZnA==
X-Gm-Message-State: APjAAAV+1la5mJso20S0xG8neClWsPEn6tUElk1X/771auyX/Pt1B7LR
 PjRxJUcgJ35ICtX0gVlznl0Qow==
X-Google-Smtp-Source: APXvYqxmshOw7dTQDg6nbnPuSCdUFhK3cdBxHTZCHyDyesCDw8lBQVlcoBBFYsEYjAjRewuVrK0BJg==
X-Received: by 2002:a1c:d10c:: with SMTP id i12mr9410070wmg.152.1565339102184; 
 Fri, 09 Aug 2019 01:25:02 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id m7sm81060799wrx.65.2019.08.09.01.25.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 01:25:01 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
 <20190808144504.24823-2-srinivas.kandagatla@linaro.org>
 <d346b2af-f285-4c53-b706-46a129ab7951@linux.intel.com>
 <cdd2bded-551c-65f5-ca29-d2bb825bdaba@linaro.org>
 <20190808195216.GM3795@sirena.co.uk>
 <20190809045459.GG12733@vkoul-mobl.Dlink>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <144f1ed7-c654-eaeb-066e-bf29d6e12d65@linaro.org>
Date: Fri, 9 Aug 2019 09:25:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190809045459.GG12733@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com, robh+dt@kernel.org
Subject: Re: [alsa-devel] [PATCH v2 1/4] dt-bindings: soundwire: add slave
	bindings
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

CgpPbiAwOS8wOC8yMDE5IDA1OjU0LCBWaW5vZCBLb3VsIHdyb3RlOgo+IE9uIDA4LTA4LTE5LCAy
MDo1MiwgTWFyayBCcm93biB3cm90ZToKPj4gT24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDU6NDg6
NTZQTSArMDEwMCwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3cm90ZToKPj4+IE9uIDA4LzA4LzIwMTkg
MTY6NTgsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+Pgo+Pj4+PiArLSBzZHctaW5zdGFu
Y2UtaWQ6IFNob3VsZCBiZSAoJ0luc3RhbmNlIElEJykgZnJvbSBTb3VuZFdpcmUKPj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoCBFbnVtZXJhdGlvbiBBZGRyZXNzLiBJbnN0YW5jZSBJRCBpcyBmb3Ig
dGhlIGNhc2VzCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgd2hlcmUgbXVsdGlwbGUgRGV2aWNl
cyBvZiB0aGUgc2FtZSB0eXBlIG9yIENsYXNzCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgYXJl
IGF0dGFjaGVkIHRvIHRoZSBidXMuCj4+Cj4+Pj4gc28gaXQgaXMgYWN0dWFsbHkgcmVxdWlyZWQg
aWYgeW91IGhhdmUgYSBzaW5nbGUgU2xhdmUgZGV2aWNlPyBPciBpcyBpdAo+Pj4+IG9ubHkgcmVx
dWlyZWQgd2hlbiB5b3UgaGF2ZSBtb3JlIHRoYW4gMSBkZXZpY2Ugb2YgdGhlIHNhbWUgdHlwZT8K
Pj4KPj4+IFRoaXMgaXMgbWFuZGF0b3J5IGZvciBhbnkgc2xhdmUgZGV2aWNlIQo+Pgo+PiBJZiBp
dCdzIG1hbmRhdG9yeSB0aGUgd29yZGluZyBpcyBhIGJpdCB1bmNsZWFyLiAgSG93IGFib3V0IHNv
bWV0aGluZwo+PiBsaWtlOgo+Pgo+PiAJU2hvdWxkIGJlICgnSW5zdGFuY2UgSUQnKSBmcm9tIHRo
ZSBTb3VuZFdpcmUgRW51bWVyYXRpb24KPj4gCUFkZHJlc3MuICBUaGlzIG11c3QgYWx3YXlzIGJl
IHByb3ZpZGVkLCBpZiBtdWx0aXBsZSBkZXZpY2VzCj4+IAl3aXRoIHRoZSBzYW1lIHR5cGUgb3Ig
Y2xhc3Mgb3IgYXR0YWNoZWQgdG8gdGhlIGJ1cyBlYWNoCj4+IAlpbnN0YW5jZSBtdXN0IGhhdmUg
YSBkaXN0aW5jdCB2YWx1ZS4KPiAKPiBUaGF0IGhlbHBzIHRvIG1ha2UgaXQgY2xlYXIuCj4gCj4g
QWxzbyB0aGUgc2VjdGlvbiBvZiBwcm9wZXJ0aWVzIHN0YXJ0cyB3aXRoIE1hbmRhdG9yeSBwcm9w
ZXJ0eSwgaXQgc2hvdWxkCj4gYmUgbWFkZSBNYW5kYXRvcnkgUHJvcGVydGllcyBpbnN0ZWFkLCBs
aWtlIGluIG90aGVyIGJpbmRpbmcgZG9jcyB0byBtYWtlCj4gaXQgY2xlYXIgdGhhdCBwcm9wZXJ0
aWVzIG1lbnRpb25lZCBpbiB0aGUgc2VjdGlvbiBhcmUgbWFuZGF0b3J5CgpXaWxsIHVwZGF0ZSBh
cyBzdWdnZXN0ZWQhCgp0aGFua3MsCnNyaW5pCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
