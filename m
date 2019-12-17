Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76861122CD0
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 14:26:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F7EE850;
	Tue, 17 Dec 2019 14:25:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F7EE850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576589174;
	bh=PEYO1Ei7Sq5Z4TwwS7mzRctkQuJmEmSuK7TKO9V1by4=;
	h=To:From:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lW25M8ERP1a/nsjm13Mq60QOm53Z2Bfp/j0Et3Uoih/YTbnTmN3NN1725BNDLeAxj
	 /ijS7oKhKqeBuk2eQPv/lKgyIEl9pNr8XiFnWmnKWCDs8Wyzye/EOWM3DVD4lY3v3S
	 cl9JoeCJr9I5B+MACcFlDXWNo2Xw3oe8BNmFMsU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E6ECF80256;
	Tue, 17 Dec 2019 14:24:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 037FEF80234; Tue, 17 Dec 2019 14:24:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68A99F8020B
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 14:24:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68A99F8020B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XxoE+Uh0"
Received: by mail-pg1-x52f.google.com with SMTP id b137so5685481pga.6
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 05:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=HBXv6Gs3P+0i/KNOn2YdFsnpMYPur7Aw9mvLprhquV8=;
 b=XxoE+Uh0AjAd3pbtS2StGPWsJjFRNkJyeJ3RKselW4QJcaMXb+ZnEX5PgtPp9XiHh9
 V+W6jo5aG4hM83VlY3jF53/wNvthAaWgazKeh0W/kZEH8IdsyFiRL67Sol9tLYoZ51un
 sPeAYJL132w/FndU1jZGuzHIBtuNDPwM96HLW8qBmTUf15/PUW5H1iRoEebB2e40scgz
 hqIFRk+QygJkgiFxitLuPEE6WG6j/ZN7LM5L8/tdusjglE0nBNt16Spzqx3JQWJf/X8s
 k0g4geysjOFlV7jre0UG3wPgtK/Fcr+aUh89B/CFU/krk+5JGLlbP4up0zgNDWJUYRtA
 VBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=HBXv6Gs3P+0i/KNOn2YdFsnpMYPur7Aw9mvLprhquV8=;
 b=ED3AvmN3gmk+dxdmAl7X3Nhs0HmTBtUHnCf9+cnq0OryPB51ic5UrhaNdTm4Vu3d0q
 7Vgo06ANL8W9OoteGUl8GI/b+9GhwD8YHqd63GXjBCD49qOohTKiTKHqlkKjaShTIwSI
 duEgW82Wk6NB0i09Dsl+TUO4nP/tqeJjASQalSN6W2r/hBvoe263AZqQ/cgdAvMAZd26
 OHkEssaZeTvyleA+hFyJaNgnye86klDefzvBhdWts8J4x4uSGtqJP6AJEUqhLtAVMlBy
 ahJ4TLBUWA5uNsyBZAF6/eLL+9J2h4psdsuvYy14BDWGXfyX+QZ9Ol+bx3GR7e/3YpJg
 97+g==
X-Gm-Message-State: APjAAAWHj9+UJtFExS9bi0tob4vIa3H+lVFIxtT8u2HCRanzQVXhWwUT
 UmkLi+dsPQSKIHI8sq0hfSzybhFvB/k=
X-Google-Smtp-Source: APXvYqxi95Sr2LOuuq1q/0lIrPuElPZFBUt8fhDipjA17PKllLPGZZ+tq45wt9LtNo65tcEYS2NbYg==
X-Received: by 2002:a63:4f5c:: with SMTP id p28mr24594475pgl.409.1576589063189; 
 Tue, 17 Dec 2019 05:24:23 -0800 (PST)
Received: from ?IPv6:2402:f000:1:1501:200:5efe:166.111.139.134?
 ([2402:f000:1:1501:200:5efe:a66f:8b86])
 by smtp.gmail.com with ESMTPSA id p4sm27783708pfb.157.2019.12.17.05.24.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Dec 2019 05:24:22 -0800 (PST)
To: perex@perex.cz, tiwai@suse.com, rfontana@redhat.com,
 gregkh@linuxfoundation.org, allison@lohutok.net, tglx@linutronix.de
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <db47108d-3967-6760-3de2-17bf60741bc2@gmail.com>
Date: Tue, 17 Dec 2019 21:24:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [BUG] ALSA: seq: a possible sleep-in-atomic-context
 bug in snd_virmidi_dev_receive_event()
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

VGhlIGRyaXZlciBtYXkgc2xlZXAgd2hpbGUgaG9sZGluZyBhIHJlYWQgbG9jay4KVGhlIGZ1bmN0
aW9uIGNhbGwgcGF0aCAoZnJvbSBib3R0b20gdG8gdG9wKSBpbiBMaW51eCA0LjE5IGlzOgoKc291
bmQvY29yZS9zZXEvc2VxX21lbW9yeS5jLCA5NjoKIMKgwqDCoCBjb3B5X2Zyb21fdXNlciBpbiBz
bmRfc2VxX2R1bXBfdmFyX2V2ZW50CnNvdW5kL2NvcmUvc2VxL3NlcV92aXJtaWRpLmMsIDk3Ogog
wqDCoMKgIHNuZF9zZXFfZHVtcF92YXJfZXZlbnQgaW4gc25kX3Zpcm1pZGlfZGV2X3JlY2VpdmVf
ZXZlbnQKc291bmQvY29yZS9zZXEvc2VxX3Zpcm1pZGkuYywgODg6CiDCoMKgwqAgX3Jhd19yZWFk
X2xvY2sgaW4gc25kX3Zpcm1pZGlfZGV2X3JlY2VpdmVfZXZlbnQKCmNvcHlfZnJvbV91c2VyKCkg
Y2FuIHNsZWVwIGF0IHJ1bnRpbWUuCgpJIGFtIG5vdCBzdXJlIGhvdyB0byBwcm9wZXJseSBmaXgg
dGhpcyBwb3NzaWJsZSBidWcsIHNvIEkgb25seSByZXBvcnQgaXQuCgpUaGlzIGJ1ZyBpcyBmb3Vu
ZCBieSBhIHN0YXRpYyBhbmFseXNpcyB0b29sIFNUQ2hlY2sgd3JpdHRlbiBieSBteXNlbGYuCgoK
QmVzdCB3aXNoZXMsCkppYS1KdSBCYWkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXBy
b2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYWxzYS1kZXZlbAo=
