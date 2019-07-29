Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7350783BF
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 05:55:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 348B21824;
	Mon, 29 Jul 2019 05:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 348B21824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564372557;
	bh=gkik7XHM5tx9rc4g4b356t756wBL/vORbiNkhNIY11o=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EfZF+rPiNwITbB6Ks5BL6/PxohzBtwntNspGZQZFTDPL07CkyCorpVV/jGBfv2AQq
	 WysWN+Fk7Rvub74ZTQjym85fSnyu6NWRYORYdWmi2fQf6JlNNJS8ylkQT4NUPTqbMm
	 sCIKfPRDh5p+RMPri0IaSU3KHux27SU53lt9CM3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 881B8F8048E;
	Mon, 29 Jul 2019 05:54:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE8A6F8048D; Mon, 29 Jul 2019 05:54:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52704F800BF
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 05:54:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52704F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ya4JdOTt"
Received: by mail-pg1-x52e.google.com with SMTP id f5so18684662pgu.5
 for <alsa-devel@alsa-project.org>; Sun, 28 Jul 2019 20:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=8PRy5r0RLK0DMjkOaMUsvRFz+2ENwpqQIfeTXdyxYK0=;
 b=Ya4JdOTtk+x6/WCvUjb2tHR2eBqA9nEE7GaNgrR9Cvp3n4aNQiBKTO/KUreWTbnn+I
 MTw4x1ddRkXHwAKdh8LnjiCPvxOcHgL+YAZPVlKrrtTOjqXGQpGyJmbSiojE4I3VeEsJ
 XFdtruFZadpL1WH+7cgoJoaEDiYNoHjhklqRZ2XXh7sNfA/aD3hmU63YIU76FHfEWGTW
 NRAga2YcRMPVlu8PRBmHMG/aMnb571NUgr/oUgLjVDwinjlx57p8GKlm0NtElrS8G8dd
 GeIDFa6sNLkG5/q22rnueLxVheiqt9kPwgzU1SScz5K3Xg3PCNUz5Ulst/Ob3zmUqgSh
 8/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=8PRy5r0RLK0DMjkOaMUsvRFz+2ENwpqQIfeTXdyxYK0=;
 b=l7XTR0T3iy7IZG1RCALhR2v0FHNK+/4Tz/DY81afbxrsZTzs1D5J9znWbbRcqxMbEn
 dofmOBZt9IZh8YT881DoSK4LnOYoOEb7I1EPbGjlK3b0pHIuF12yp7+2Zaa4e72VRYyq
 W1XS7245Pb/KaewMAvWY3DfeITRBVJ7gHJknWUcV63ahrgERcwLP0J5zaZPI1fWumf+2
 ujqDw4VPtAN1qhPZ4wVn2nnsLPDDDkdkpHVLFAvkE1/jfvCbJ8TJRyeJBJyKRcRyI3Dv
 0/8GyDgftih1UkSpfbgVQDEvw4B2VojxpgzGTE5VYBs76Sz+Ym3hWjWgram2hY/aJDnu
 f0Wg==
X-Gm-Message-State: APjAAAV6SmrsFMvcJvidMDFw8giVgilTG0obeT/zsFzIhOeet4+Adorg
 Pxi4kTVLApNHKPpOz8zxYEE=
X-Google-Smtp-Source: APXvYqzaSZlyNwojCKSRH77jCfkI7OwlkitSUcLjmx4okU8a8s+2C+PeVVqlmMNMzjcULr3fyy8JsQ==
X-Received: by 2002:a65:5183:: with SMTP id h3mr9557074pgq.250.1564372446085; 
 Sun, 28 Jul 2019 20:54:06 -0700 (PDT)
Received: from ?IPv6:2402:f000:4:72:808::177e? ([2402:f000:4:72:808::177e])
 by smtp.gmail.com with ESMTPSA id p26sm5438031pgl.64.2019.07.28.20.54.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2019 20:54:05 -0700 (PDT)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: perex@perex.cz, Takashi Iwai <tiwai@suse.de>, gregkh@linuxfoundation.org, 
 rfontana@redhat.com, allison@lohutok.net, tglx@linutronix.de
Message-ID: <50b3b4c4-fe36-8c65-345b-f0a51193726c@gmail.com>
Date: Mon, 29 Jul 2019 11:54:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [BUG] ALSA: core: seq: a possible double-lock bug in
 snd_seq_midisynth_remove()
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

SW4gc25kX3NlcV9taWRpc3ludGhfcmVtb3ZlKCksIHRoZXJlIGlzIGEgcG9zc2libGUgZG91Ymxl
LWxvY2sgYnVnOgpzbmRfc2VxX21pZGlzeW50aF9yZW1vdmUoKQogwqDCoMKgIG11dGV4X2xvY2so
JnJlZ2lzdGVyX211dGV4KTsgLS0gbGluZSA0MjEKIMKgwqDCoCBzbmRfc2VxX2RlbGV0ZV9rZXJu
ZWxfY2xpZW50KCkgLS0tIGxpbmUgNDM2CiDCoMKgwqDCoMKgwqDCoCBzZXFfZnJlZV9jbGllbnQo
KSAtLSBsaW5lIDIyNDQKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbXV0ZXhfbG9jaygmcmVnaXN0
ZXJfbXV0ZXgpOyAtLSBsaW5lIDI5NAoKVGhpcyBidWcgaXMgZm91bmQgYnkgYSBzdGF0aWMgYW5h
bHlzaXMgdG9vbCBTVENoZWNrIHdyaXR0ZW4gYnkgdXMuCgpJIGRvIG5vdCBrbm93IGhvdyB0byBj
b3JyZWN0bHkgZml4IHRoaXMgYnVnLCBzbyBJIG9ubHkgcmVwb3J0IGl0LgpBIHBvc3NpYmxlIGZp
eCBpcyB0byByZWxlYXNlIHRoZSBtdXRleCBsb2NrIGJlZm9yZSBjYWxsaW5nIApzZXFfZnJlZV9j
bGllbnQoKSBpbiBzbmRfc2VxX2RlbGV0ZV9rZXJuZWxfY2xpZW50KCkgYW5kIHRoZW4gYWNxdWly
aW5nIAp0aGUgbG9jayBhZ2FpbiBhZnRlciBjYWxsaW5nIHNlcV9mcmVlX2NsaWVudCgpLgoKCkJl
c3Qgd2lzaGVzLApKaWEtSnUgQmFpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwK
