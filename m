Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3848B9EB89
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 16:52:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B40231667;
	Tue, 27 Aug 2019 16:51:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B40231667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566917524;
	bh=JNPvQlRa4loCDfoyk3EJvlwxlKupK1uV6HI5JHQrHW0=;
	h=From:In-Reply-To:Date:References:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bdo3pb/SUjI4x90Kl0hZrwd1NrxMNCL6RjMhotAmlfoqlxL++EGYNtLORrwc2BWy1
	 ElxYIpwzJ9egln7pD7hKVMm7rwE/Au9z7d176wXaP2azwrE5dobvJVu1tiAycULfYv
	 CmjBH04yrs5JWCsDSrgdYYXz2AODdq45nfty3zeg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1088EF802A1;
	Tue, 27 Aug 2019 16:50:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C0ABF80274; Tue, 27 Aug 2019 16:50:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B006EF800E7
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 16:50:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B006EF800E7
Received: from mail-pf1-f198.google.com ([209.85.210.198])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1i2cnU-00040z-FI
 for alsa-devel@alsa-project.org; Tue, 27 Aug 2019 14:50:12 +0000
Received: by mail-pf1-f198.google.com with SMTP id x1so14809203pfq.2
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 07:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=QPtHqzYE2I3K6mA1W43Ow1hu2cfsdV6r/QSBv6PmVXE=;
 b=NphAoy4kP5YBSVdSEREqxCr0zocvj3P5skaMiIhT+v/QEjzwYqy8b79KZWX4NS1r6v
 o7thOI/O2DeWczOw8UI6EmQrGZ66NIoBMqs86TkeCvnHcwMQHNK9suCOq7QdEQzFb+6G
 tnoftrJYzwwj/xfhiStnaKpEikwRP6UfSFiFnoagE0QAGmJnMgpnsxaBIZaZ7VUkNe9z
 oIuCK+DJoBN9o53o227IWz2PSt03BMl3yN36LJ28uT/pz0QCgY/iru1Llin9JFSb37rY
 UWLb5cuoILbHqkJp78QIpvbpYpThzM/kMgCOeNQPfoRxfy+fyzol8jbKcVPgKrkh1y16
 OJpA==
X-Gm-Message-State: APjAAAW6kBAYlkD7ZpOEa8tyOkSFlgeFqBpKg0Nyd2Rs6QiifidQeZJE
 HUlhmy32kN2O55OjC1/xW2TSRdR0alV0nZT63bJolBP2iAmj1lTpm/5k++syQyYdZeqPUAVqcz5
 pSZBEiunaJzu2ze0RoDAp469FohaCkAuEnjKt4QbS
X-Received: by 2002:a17:90a:3b4f:: with SMTP id
 t15mr26629481pjf.45.1566917411216; 
 Tue, 27 Aug 2019 07:50:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxD/9UP/HN0ldJtPRSnTlHHh4+NxXjhXptKrorWOlvZ1KnXW9fodYpfoV5J9JPcZXw61pCu5A==
X-Received: by 2002:a17:90a:3b4f:: with SMTP id
 t15mr26629428pjf.45.1566917410640; 
 Tue, 27 Aug 2019 07:50:10 -0700 (PDT)
Received: from 2001-b011-380f-3c42-843f-e5eb-ba09-2e70.dynamic-ip6.hinet.net
 (2001-b011-380f-3c42-843f-e5eb-ba09-2e70.dynamic-ip6.hinet.net.
 [2001:b011:380f:3c42:843f:e5eb:ba09:2e70])
 by smtp.gmail.com with ESMTPSA id q8sm2479848pjq.20.2019.08.27.07.50.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 07:50:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20190827134756.10807-2-kai.heng.feng@canonical.com>
Date: Tue, 27 Aug 2019 22:50:03 +0800
Message-Id: <97D68761-4152-4D77-B222-14EA892503DB@canonical.com>
References: <20190827134756.10807-1-kai.heng.feng@canonical.com>
 <20190827134756.10807-2-kai.heng.feng@canonical.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
 tiwai@suse.com
X-Mailer: Apple Mail (2.3445.104.11)
Cc: linux-pci@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/2] ALSA: hda: Allow HDA to be runtime
 suspended when dGPU is not bound
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

YXQgMjE6NDcsIEthaS1IZW5nIEZlbmcgPGthaS5oZW5nLmZlbmdAY2Fub25pY2FsLmNvbT4gd3Jv
dGU6Cgo+IEl0J3MgYSBjb21tb24gcHJhY3RpY2UgdG8gbGV0IGRHUFUgdW5ib3VuZCBhbmQgdXNl
IFBDSSBwb3J0IFBNIHRvCj4gZGlzYWJsZSBpdHMgcG93ZXIgdGhyb3VnaCBfUFIzLiBXaGVuIHRo
ZSBkR1BVIGNvbWVzIHdpdGggYW4gSERBCj4gZnVuY3Rpb24sIHRoZSBIREEgd29uJ3QgYmUgc3Vz
cGVuZGVkIGlmIHRoZSBkR1BVIGlzIHVuYm91bmQsIHNvIHRoZSBkR1BVCj4gcG93ZXIgY2FuJ3Qg
YmUgZGlzYWJsZWQuCj4KPiBDb21taXQgMzdhM2E5OGVmNjAxICgiQUxTQTogaGRhIC0gRW5hYmxl
IHJ1bnRpbWUgUE0gb25seSBmb3IKPiBkaXNjcmV0ZSBHUFUiKSBvbmx5IGFsbG93cyBIREEgdG8g
YmUgcnVudGltZS1zdXNwZW5kZWQgb25jZSBHUFUgaXMKPiBib3VuZCwgdG8ga2VlcCBBUFUncyBI
REEgd29ya2luZy4KPgo+IEhvd2V2ZXIsIEhEQSBvbiBkR1BVIGlzbid0IHRoYXQgdXNlZnVsIGlm
IGRHUFUgaXMgdW5ib3VuZC4gU28gbGV0IHJlbGF4Cj4gdGhlIHJ1bnRpbWUgc3VzcGVuZCByZXF1
aXJlbWVudCBmb3IgZEdQVSdzIEhEQSBmdW5jdGlvbiwgdG8gc2F2ZSBsb3RzIG9mCj4gcG93ZXIu
Cj4KPiBCdWdMaW5rOiBodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9idWdzLzE4NDA4MzUKPiBT
aWduZWQtb2ZmLWJ5OiBLYWktSGVuZyBGZW5nIDxrYWkuaGVuZy5mZW5nQGNhbm9uaWNhbC5jb20+
Cj4g4oCUCgpGb3Jnb3QgdG8gbWVudGlvbiB0aGF0IGZvciBzb21lIHBsYXRmb3JtcyB0aGlzIGlz
c3VlIGhhcHBlbiBhZnRlciBjb21taXQgIApiNTE2ZWE1ODZkNzEgKCJQQ0k6IEVuYWJsZSBOVklE
SUEgSERBIGNvbnRyb2xsZXJz4oCdKSB3aGljaCBzdGFydHMgdG8gdW5oaWRlICAKdGhlIOKAnGhp
ZGRlbuKAnSBIREEuCgpLYWktSGVuZwoKPiAgc291bmQvcGNpL2hkYS9oZGFfaW50ZWwuYyB8IDMg
KystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+
IGRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL2hkYV9pbnRlbC5jIGIvc291bmQvcGNpL2hkYS9o
ZGFfaW50ZWwuYwo+IGluZGV4IDk5ZmMwOTE3MzM5Yi4uZDRlZTA3MGUxYTI5IDEwMDY0NAo+IC0t
LSBhL3NvdW5kL3BjaS9oZGEvaGRhX2ludGVsLmMKPiArKysgYi9zb3VuZC9wY2kvaGRhL2hkYV9p
bnRlbC5jCj4gQEAgLTEyODUsNyArMTI4NSw4IEBAIHN0YXRpYyB2b2lkIGluaXRfdmdhX3N3aXRj
aGVyb28oc3RydWN0IGF6eCAqY2hpcCkKPiAgCQlkZXZfaW5mbyhjaGlwLT5jYXJkLT5kZXYsCj4g
IAkJCSAiSGFuZGxlIHZnYV9zd2l0Y2hlcm9vIGF1ZGlvIGNsaWVudFxuIik7Cj4gIAkJaGRhLT51
c2VfdmdhX3N3aXRjaGVyb28gPSAxOwo+IC0JCWhkYS0+bmVlZF9lbGRfbm90aWZ5X2xpbmsgPSAx
OyAvKiBjbGVhcmVkIGluIGdwdV9ib3VuZCBvcCAqLwo+ICsJCS8qIGNsZWFyZWQgaW4gZ3B1X2Jv
dW5kIG9wICovCj4gKwkJaGRhLT5uZWVkX2VsZF9ub3RpZnlfbGluayA9ICFwY2lfcHIzX3ByZXNl
bnQocCk7Cj4gIAkJY2hpcC0+ZHJpdmVyX2NhcHMgfD0gQVpYX0RDQVBTX1BNX1JVTlRJTUU7Cj4g
IAkJcGNpX2Rldl9wdXQocCk7Cj4gIAl9Cj4gLS0gCj4gMi4xNy4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
