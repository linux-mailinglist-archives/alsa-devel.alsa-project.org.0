Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A8F1246C7
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 13:27:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E14A6886;
	Wed, 18 Dec 2019 13:26:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E14A6886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576672053;
	bh=erSnzyi03FWjwAa164jmddaIgbET/9rd/5cZAcpd5Rk=;
	h=To:From:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SCSs1/txTE8dUyclHQqlhINx9Xxm727jsOAzNuuNysIN08mj3+XSCv2reBfszvFMn
	 H+GDM2bNY0B+JY77O1INZXNHuUpyz36BGdybDGnF0YM6e4QAYhkBQZBuceiON5/g+T
	 1zcXf1/SqZn0lhzeKd5+4TTl0iLD4oDjaBZizA/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DD91F8022C;
	Wed, 18 Dec 2019 13:25:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1BFBF8022C; Wed, 18 Dec 2019 13:25:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73FA4F80059
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 13:25:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73FA4F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="C1lvp6e1"
Received: by mail-pj1-x1030.google.com with SMTP id s7so813190pjc.0
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 04:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:cc:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=5X2o0mtDaERgT2mi7QtDjqxir4Hltz6BheIiDggcalE=;
 b=C1lvp6e1959g84uBTVL9ZEeOP3twcpBoXR1aBegCslQX3dQTehr1X8RgrlPR6fqSI+
 gSJRj+dwhgzYLtJvWQwZxBPxyhoPq4K6yXQ6hxr/i7MgLw2bWv7Lj3K7hZUfh2Ce9xZF
 sHveRKWXluiVMfnQr1pThWf2cssgtcWAMF3eIcTirAOxRmONLiI+xKsGiPXbVQdz4KfB
 9jtzDRdtjiOSzHrMsDvI82k28SgmtfZhAdNgIfnop7jD5BsvhpxUyW70o9qeC6EtGqmQ
 Z/Hkj0twHrFPcwNb37HZtQIEVhvcTx1yFGQgFtSdCLvhzTvbdglPoFUMroEheCr7nM12
 6VAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=5X2o0mtDaERgT2mi7QtDjqxir4Hltz6BheIiDggcalE=;
 b=Uz8yBb0XOM7ZD6yrz13EjSA4FnJoj2fKMSJC5bojz7q/qQ3yDL0heDrjEzAoWA2CDn
 8eDvKz7xlB0B3crkKXS3Iyn6SzdwMU14BkQiE2Zflxy6hL4ll5fVLJpqdyXVqbX0BOWN
 qCopd1EtFaSNNN4Ae0xmscneoFw4KgVveR001pGIIK49IFVaoWQ/w+HLkgEZ1/6Lsd6L
 +7q68OGU1xTXvhUVW2soFy20LutKW1NNdigLe/RObR45ZEqbCCuDSn/lsFCYI478UDQC
 NPVntTZFx9D/xN893oHHSblj5VyoBGZijuBaIg6pnNDMOlqxt4KFNxSAXMfIG8rYGIAc
 t3Iw==
X-Gm-Message-State: APjAAAUud/UGnBz6A76/f71LpMSYUk4aWH4f/Gp4s1ydnB1SfqPe94hM
 yMCJWLIZr3V+k0sStWf23Y8=
X-Google-Smtp-Source: APXvYqwbC1IbmRPDA7MJjUt4vm4EWmMotYWecwAI3UiaYVbgeJ2IHzaMRJUsXUkN30ZyxejyzmfAlg==
X-Received: by 2002:a17:902:aa96:: with SMTP id
 d22mr2499281plr.218.1576671942944; 
 Wed, 18 Dec 2019 04:25:42 -0800 (PST)
Received: from ?IPv6:2402:f000:1:1501:200:5efe:166.111.139.103?
 ([2402:f000:1:1501:200:5efe:a66f:8b67])
 by smtp.gmail.com with ESMTPSA id g18sm3115695pfo.123.2019.12.18.04.25.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:25:42 -0800 (PST)
To: perex@perex.cz, tiwai@suse.com, allison@lohutok.net, rfontana@redhat.com, 
 tglx@linutronix.de
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <5d43135e-73b9-a46a-2155-9e91d0dcdf83@gmail.com>
Date: Wed, 18 Dec 2019 20:25:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [BUG] ALSA: ice1712: a possible
 sleep-in-atomic-context bug in snd_vt1724_set_pro_rate()
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
bmQvcGNpL2ljZTE3MTIvcXVhcnRldC5jLCA0MTQ6CiDCoMKgwqAgbXV0ZXhfbG9jayBpbiByZWdf
d3JpdGUKc291bmQvcGNpL2ljZTE3MTIvcXVhcnRldC5jLCA0ODU6CiDCoMKgwqAgcmVnX3dyaXRl
IGluIHNldF9jcGxkCnNvdW5kL3BjaS9pY2UxNzEyL3F1YXJ0ZXQuYywgODc2OgogwqDCoMKgIHNl
dF9jcGxkIGluIHF0ZXRfc2V0X3JhdGUKc291bmQvcGNpL2ljZTE3MTIvaWNlMTcyNC5jLCA2ODc6
CiDCoMKgwqAgKEZVTkNfUFRSKSBxdGV0X3NldF9yYXRlIGluIHNuZF92dDE3MjRfc2V0X3Byb19y
YXRlCnNvdW5kL3BjaS9pY2UxNzEyL2ljZTE3MjQuYywgNjY4OgogwqDCoMKgIF9yYXdfc3Bpbl9s
b2NrX2lycXNhdmUgaW4gc25kX3Z0MTcyNF9zZXRfcHJvX3JhdGUKCihGVU5DX1BUUikgbWVhbnMg
YSBmdW5jdGlvbiBwb2ludGVyIGlzIGNhbGxlZC4KbXV0ZXhfbG9jaygpIGNhbiBzbGVlcCBhdCBy
dW50aW1lLgoKSSBhbSBub3Qgc3VyZSBob3cgdG8gcHJvcGVybHkgZml4IHRoaXMgcG9zc2libGUg
YnVnLCBzbyBJIG9ubHkgcmVwb3J0IGl0LgoKVGhpcyBidWcgaXMgZm91bmQgYnkgYSBzdGF0aWMg
YW5hbHlzaXMgdG9vbCBTVENoZWNrIHdyaXR0ZW4gYnkgbXlzZWxmLgoKCkJlc3Qgd2lzaGVzLApK
aWEtSnUgQmFpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRw
czovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
