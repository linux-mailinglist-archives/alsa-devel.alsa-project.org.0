Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C24048FE99
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2019 10:57:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41D171661;
	Fri, 16 Aug 2019 10:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41D171661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565945860;
	bh=2yLEVlyOu2jp0BhB9hS4/60GCBXeSHgQmz3JW2cH2/s=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hncuq4tA04pmIbc/QpfH2lNxzU21TCd3hfKYTtqWsUEn7glOFT2XUmSeJEeh5FFFP
	 KHX/fw8nFK6JDNfMKGs7sr+oQugTsDenNACRk0HuPnQThoG6nPNTIkC4i0EIf0NQZS
	 xZmBgzQKqe0qwLf6oeyuCf0NWOthiSI3VgJnwcns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3294F80214;
	Fri, 16 Aug 2019 10:55:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1704F80214; Fri, 16 Aug 2019 10:55:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 592ECF801DB
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 10:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 592ECF801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uvKLVLzD"
Received: by mail-wr1-x444.google.com with SMTP id y8so805492wrn.10
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 01:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lsKEtwV9cUqhIfyszvdT0ohPpsXpCYqQnUcZhNTjTyw=;
 b=uvKLVLzDCxJ1PkwWUwT3OTs/EIKOnv9/8aKTIR9zLn86Jqnis+o7NbwwA/+DYYjCsD
 fs6Fuy9zbBuXqqY0cGMecdyEAa23g+a2MSoqn6aWLkoxnIrVgr92nTfvdmPKn8YWP1ia
 Fd0fYMqsp6pMG6aFes2NfPMPRLSF2gdM/MDL7B1Wdre4afdSGw226bPpZbsWYnAfrnsJ
 ATkilL4RVXxhHh2Hmu6JnXCWnnoDRRPxvJnG15umf8bj3RzeNzg4N+lKPSzl2bcmLNqj
 2AEGcFeBY44Meq68TABFRwVf/JqndRpFm50lm5FdQEPJjMrVIe4duL92U3w6YlB2h8Y9
 SWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lsKEtwV9cUqhIfyszvdT0ohPpsXpCYqQnUcZhNTjTyw=;
 b=mSAWF+x5pL+eKDdDbOYqwgjxjhqDvmPK1lLi8+2e+I9bDe17IIk72hgdo3QBpZiFvb
 HjuiYLU4U2z6rako7JHNaxilLkiO3HXmW7SrcMHLoWZf/f9t0N0aUaA9J3zgRgPARQwN
 9hCGQyl91VYb0S+nu0IiUv3hBoSRlJ3clWGl7MqMQQFPJazeZK7MXf7MvsleqIMPgMUY
 OQxgIl0dETjFU4bEJULQcga9ExmmoIWfxZ0v01Skm2m0+uN6S5MXxPvApBuKDR5VFzmo
 FXyecJRxJa8DpjdkC4d1W1wI3f29Dk85YGiwXlNeLLKOhepR5OPfnQizeepu2Eg7fHfn
 VaaQ==
X-Gm-Message-State: APjAAAXyz+jqoi6eZYPyUMDvhL+bhtTjGzL5mR0VeY4SxDol+Qv11qUn
 CFaWM5IOpSnKDahprvVe/MQuFw==
X-Google-Smtp-Source: APXvYqyhoghogoAOuZYiUPIxdW9odhnSaGP/Bl2GcuzfEg2gT8QyTm3tcUm6AXnuq95zZdmfw/xI2A==
X-Received: by 2002:a5d:5041:: with SMTP id h1mr10151128wrt.30.1565945751087; 
 Fri, 16 Aug 2019 01:55:51 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id u129sm6073283wmb.12.2019.08.16.01.55.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 01:55:50 -0700 (PDT)
To: syzbot <syzbot+6593c6b8c8b66a07cd98@syzkaller.appspotmail.com>,
 alsa-devel@alsa-project.org, bp@alien8.de, gregkh@linuxfoundation.org,
 hpa@zytor.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
 nstange@suse.de, pierre-louis.bossart@linux.intel.com,
 sanyog.r.kale@intel.com, syzkaller-bugs@googlegroups.com,
 tglx@linutronix.de, vkoul@kernel.org, x86@kernel.org, yakui.zhao@intel.com
References: <000000000000b4126c059030cfb6@google.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <63c0dc1e-323d-d46e-2d4a-b5b6d6916042@linaro.org>
Date: Fri, 16 Aug 2019 09:55:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <000000000000b4126c059030cfb6@google.com>
Content-Language: en-US
Subject: Re: [alsa-devel] INFO: rcu detected stall in __do_softirq
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

CgpPbiAxNi8wOC8yMDE5IDAxOjEwLCBzeXpib3Qgd3JvdGU6Cj4gc3l6Ym90IGhhcyBiaXNlY3Rl
ZCB0aGlzIGJ1ZyB0bzoKPiAKPiBjb21taXQgMmFlYWM5NWQxYTRjYzg1YWFlNTdhYjg0MmQ1YzMz
NDBkZjBmODE3Zgo+IEF1dGhvcjogU3Jpbml2YXMgS2FuZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFn
YXRsYUBsaW5hcm8ub3JnPgo+IERhdGU6wqDCoCBUdWUgSnVuIDExIDEwOjQwOjQxIDIwMTkgKzAw
MDAKPiAKPiAgwqDCoMKgIHNvdW5kd2lyZTogYWRkIG1vZHVsZV9zZHdfZHJpdmVyIGhlbHBlciBt
YWNybwoKTm90IHN1cmUgaG93IGFkZGluZyBhIG1hY3JvIHdpdGggbm8gdXNlcnMgdHJpZ2dlcnMg
dGhpcyByY3Ugc3RhbGwuCgpCVFcgdGhpcyB3YXMgaW4gbWFpbmxpbmUgc2luY2UgcmMxLgoKLS1z
cmluaQoKPiAKPiBiaXNlY3Rpb24gbG9nOsKgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29t
L3gvYmlzZWN0LnR4dD94PTExNGI0NWVlNjAwMDAwCj4gc3RhcnQgY29tbWl0OsKgwqAgODgyZTg2
OTEgQWRkIGxpbnV4LW5leHQgc3BlY2lmaWMgZmlsZXMgZm9yIDIwMTkwODAxCj4gZ2l0IHRyZWU6
wqDCoMKgwqDCoMKgIGxpbnV4LW5leHQKPiBmaW5hbCBjcmFzaDrCoMKgwqAgaHR0cHM6Ly9zeXpr
YWxsZXIuYXBwc3BvdC5jb20veC9yZXBvcnQudHh0P3g9MTM0YjQ1ZWU2MDAwMDAKPiBjb25zb2xl
IG91dHB1dDogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9sb2cudHh0P3g9MTU0YjQ1
ZWU2MDAwMDAKPiBrZXJuZWwgY29uZmlnOsKgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29t
L3gvLmNvbmZpZz94PTQ2NmIzMzFhZjNmMzRlOTQKPiBkYXNoYm9hcmQgbGluazogCj4gaHR0cHM6
Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPTY1OTNjNmI4YzhiNjZhMDdjZDk4Cj4g
c3l6IHJlcHJvOsKgwqDCoMKgwqAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXBy
by5zeXo/eD0xNmIyMTZiMjYwMDAwMAo+IAo+IFJlcG9ydGVkLWJ5OiBzeXpib3QrNjU5M2M2Yjhj
OGI2NmEwN2NkOThAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+IEZpeGVzOiAyYWVhYzk1ZDFh
NGMgKCJzb3VuZHdpcmU6IGFkZCBtb2R1bGVfc2R3X2RyaXZlciBoZWxwZXIgbWFjcm8iKQo+IAo+
IEZvciBpbmZvcm1hdGlvbiBhYm91dCBiaXNlY3Rpb24gcHJvY2VzcyBzZWU6IAo+IGh0dHBzOi8v
Z29vLmdsL3Rwc21FSiNiaXNlY3Rpb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXBy
b2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYWxzYS1kZXZlbAo=
