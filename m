Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B54DBACB27
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Sep 2019 08:08:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 408C7165E;
	Sun,  8 Sep 2019 08:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 408C7165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567922933;
	bh=WBnlqE5i4qs6gGLd1RCdGBifL4Mn91pAFpOV+QGhFmc=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n3Cu3X/BN+UYuT+dhCmEuPf9dQV51akJuHcrCReUpbWwtTp30gVo4jDMc4QWYy5xM
	 FrJNWvR2PlZGPUJgTmlDm5Xnrwt95JkBw+yaRd9nRRZjTWHwj3iwdNutUTAaQyQPm2
	 mKqT1JQcyuPQm2tPe/07jy1ue3w8yG0+qJJYGi2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FD10F805FC;
	Sun,  8 Sep 2019 08:05:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A21A3F80448; Sat,  7 Sep 2019 13:02:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88E0EF80171
 for <alsa-devel@alsa-project.org>; Sat,  7 Sep 2019 13:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88E0EF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZZpU4Qvt"
Received: by mail-wr1-x434.google.com with SMTP id h7so9043670wrt.13
 for <alsa-devel@alsa-project.org>; Sat, 07 Sep 2019 04:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=r+s9AJNdPcdeTyA+tqW1RaiaCt2h23Cf1dSd3sdoS/U=;
 b=ZZpU4Qvt8i0PBpiEtkjLMA12kPDk+RkdG5Rnztl6ipemHOgVND89hQOPwJ9odAobIw
 fWDoxXJIxIkshBf+PS2OuZgpZW1sithwnZdhQJhBtP8Jbf1MLVVvkZpNUhqx40ppB+eZ
 HnhDtNi/MM2MKPjg0ueMSly28f7204tK0MjFYhF6Nq5jxOckeZVBjgSSWKxgA0eJ2b2N
 9sf7awJo6aRwgOhb0hBrPCdbJ4N99zBvZKKHWDxCTJoTZ/VK0RI8BrgHFU12WUT+kS+2
 Jy4lyDtMYDnGu2LinKo8l7/mtud4f2QvEA+Fws5Jy6jdS4L6RNz8Dzki4VJ41UUAQ0nO
 Ix9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=r+s9AJNdPcdeTyA+tqW1RaiaCt2h23Cf1dSd3sdoS/U=;
 b=UcN0H3Bl4AlvajOI2K1Af228IMoG50lH1vEInUilrOFwVqeVr1BPgwushhftuKiJPD
 lXxFTPG7cHkqvneA74N0BCLsEzOA4IlLtSj0jOUBbnGhvRWmr7sx+V+h53Ap1XOwEFEF
 fO6yW3uG6GKqQADSjfA5aUACYQkZUfdgKliGX9T1tfxW3XjgzIIbqGybNBbky37Lyr3q
 EGiQpFKxr9MSFCsWQB2+Uqv5puzp6CHMnJXyXEEnH+NHYMm9KVjPFn9XTcBLrHygM0GO
 TIqAAvOdFW28spxl2suoqPKqxvJidBXOjEPowtPgRBUTcY4a9cbcfSTeW5ZYHCoDVU9u
 PI6Q==
X-Gm-Message-State: APjAAAU66A7Qyqo5k2H0Gj8B8VC8wpuct4H+drYFq4mJJ8anD7WQyTrx
 9cPjWb16IIDJ7H9DZJs9My3f+GA1
X-Google-Smtp-Source: APXvYqw4IYnU6pC92OLwjz5evnq+eiIjEM8UxyzLDiENe49Azha/rs9Ztu7mkuDFN10GnWDE5wg+8Q==
X-Received: by 2002:adf:fd41:: with SMTP id h1mr10416790wrs.315.1567854167207; 
 Sat, 07 Sep 2019 04:02:47 -0700 (PDT)
Received: from [192.168.1.41] (214.pool85-61-29.dynamic.orange.es.
 [85.61.29.214])
 by smtp.gmail.com with ESMTPSA id q10sm10223687wrd.39.2019.09.07.04.02.45
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Sep 2019 04:02:46 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: =?UTF-8?Q?Jos=c3=a9_Mesa_Orihuela?= <mesasec@gmail.com>
Message-ID: <65c4fa63-8e4b-f728-f22f-021fe7cd218d@gmail.com>
Date: Sat, 7 Sep 2019 13:01:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Sun, 08 Sep 2019 08:05:28 +0200
Subject: [alsa-devel] Low sound and no mic in Lenovo Yoga / Ideapad S940
	(Realtek ALC298)
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

SSBoYXZlIHRlc3RlZCAzIGRpZmZlcmVudHMgbGludXggZGlzdHJvcyAobWFuamFybywgdWJ1bnR1
LCBwb3Bvcykgd2l0aCAKdGhlIHNhbWUgcmVzdWx0czoKCiAgKiBMb3cgc291bmQgdm9sdW1lIC8g
b3VwdXQKICAqIE5vIG1pYyAoc2VlbXMgZGV0ZWN0ZWQgYnV0IGRvZXNuJ3Qgd29yaykKClRoaXMg
cHJvYmxlbSBsb29rcyBzaW1pbGFyIHRvIEM5MzAuIEkgaGF2ZSB0cmllZCBhbGwgdGhlIHNvbHV0
aW9ucyAocGluIApyZW1hcHBpbmcsIGNoYW5naW5nIG1vZGVsLi4uKcKgIHdpdGhvdXQgc3VjY2Vz
cy4KCmh0dHBzOi8vZ2l0aHViLmNvbS9kcm9zZXJhc3Byb3V0L2xlbm92by15b2dhLWM5MzAtbGlu
dXgjc3BlYWtlcgoKQWxzYS1pbmZvLnNoIGxvZzoKCmh0dHA6Ly9hbHNhLXByb2plY3Qub3JnL2Ri
Lz9mPTcwMTAxNTc1MWJlNzU3OTg5YmI5M2Q3MGE5YTA2ZjdlODlkNjRlMjQKCkxpbnV4IGxueCA0
LjE5LjY2LTEtTUFOSkFSTyMxU01QIFBSRUVNUFQgRnJpIEF1ZyA5IDE4OjAxOjUzIFVUQyAyMDE5
IAp4ODZfNjQgR05VL0xpbgoKTW9yZSBsb2dzOgoKfDAwOjFmLjMgTXVsdGltZWRpYSBhdWRpbyBj
b250cm9sbGVyIFswNDAxXTogSW50ZWwgQ29ycG9yYXRpb24gQ2Fubm9uIApQb2ludC1MUCBIaWdo
IERlZmluaXRpb24gQXVkaW8gQ29udHJvbGxlciBbODA4Njo5ZGM4XSAocmV2IDMwKSB8Cgp8Y2Fy
ZCAwOiBQQ0ggW0hEQSBJbnRlbCBQQ0hdLCBkZXZpY2UgMDogQUxDMjk4IEFuYWxvZyBbQUxDMjk4
IEFuYWxvZ10gfAoKfHNuZF9oZGFfY29kZWNfaGRtaSA2OTYzMiAxIHNuZF9zb2ZfaW50ZWxfaGRh
X2NvbW1vbiA3MzcyOCAxIHNvZl9wY2lfZGV2IApzbmRfc29mX2ludGVsX2hkYSAyMDQ4MCAxIHNu
ZF9zb2ZfaW50ZWxfaGRhX2NvbW1vbiBzbmRfc29mIDExODc4NCA0IApzbmRfc29mX2ludGVsX2hk
YV9jb21tb24sc25kX3NvZl9pbnRlbF9ieXQsc25kX3NvZl9pbnRlbF9pcGMsc29mX3BjaV9kZXYg
CnNuZF9oZGFfY29kZWNfcmVhbHRlayAxMjY5NzYgMSBzbmRfaGRhX2NvZGVjX2dlbmVyaWMgOTQy
MDggMSAKc25kX2hkYV9jb2RlY19yZWFsdGVrIHNuZF9zb2NfaGRhY19oZGEgMjQ1NzYgMiAKc25k
X3NvZl9pbnRlbF9oZGFfY29tbW9uLHNuZF9zb2Nfc2tsIGxlZHRyaWdfYXVkaW8gMTYzODQgMiAK
c25kX2hkYV9jb2RlY19nZW5lcmljLHNuZF9oZGFfY29kZWNfcmVhbHRlayBzbmRfaGRhX2V4dF9j
b3JlIDM2ODY0IDQgCnNuZF9zb2ZfaW50ZWxfaGRhX2NvbW1vbixzbmRfc29jX2hkYWNfaGRhLHNu
ZF9zb2Nfc2tsLHNuZF9zb2ZfaW50ZWxfaGRhIApzbmRfc29jX2FjcGlfaW50ZWxfbWF0Y2ggMjg2
NzIgMyAKc25kX3NvZl9pbnRlbF9oZGFfY29tbW9uLHNvZl9wY2lfZGV2LHNuZF9zb2Nfc2tsIHNu
ZF9zb2NfY29yZSAyOTA4MTYgNCAKc25kX3NvZixzbmRfc29mX2ludGVsX2hkYV9jb21tb24sc25k
X3NvY19oZGFjX2hkYSxzbmRfc29jX3NrbCAKc25kX2hkYV9pbnRlbCA0OTE1MiA4IHNuZF9oZGFf
Y29kZWMgMTU5NzQ0IDUgCnNuZF9oZGFfY29kZWNfZ2VuZXJpYyxzbmRfaGRhX2NvZGVjX2hkbWks
c25kX2hkYV9pbnRlbCxzbmRfaGRhX2NvZGVjX3JlYWx0ZWssc25kX3NvY19oZGFjX2hkYSAKc25k
X2hkYV9jb3JlIDEwMjQwMCAxMCAKc25kX2hkYV9jb2RlY19nZW5lcmljLHNuZF9oZGFfY29kZWNf
aGRtaSxzbmRfaGRhX2ludGVsLHNuZF9oZGFfZXh0X2NvcmUsc25kX2hkYV9jb2RlYyxzbmRfaGRh
X2NvZGVjX3JlYWx0ZWssc25kX3NvZl9pbnRlbF9oZGFfY29tbW9uLHNuZF9zb2NfaGRhY19oZGEs
c25kX3NvY19za2wsc25kX3NvZl9pbnRlbF9oZGEgCnNuZF9od2RlcCAyMDQ4MCAxIHNuZF9oZGFf
Y29kZWMgc25kX3BjbSAxMzkyNjQgMTEgCnNuZF9oZGFfY29kZWNfaGRtaSxzbmRfaGRhX2ludGVs
LHNuZF9oZGFfZXh0X2NvcmUsc25kX2hkYV9jb2RlYyxzbmRfc29mLHNuZF9zb2ZfaW50ZWxfaGRh
X2NvbW1vbixzbmRfc29jX2NvcmUsc25kX3NvY19za2wsc25kX2hkYV9jb3JlLHNuZF9wY21fZG1h
ZW5naW5lIApzbmQgMTEwNTkyIDI1IApzbmRfaGRhX2NvZGVjX2dlbmVyaWMsc25kX2hkYV9jb2Rl
Y19oZG1pLHNuZF9od2RlcCxzbmRfaGRhX2ludGVsLHNuZF9oZGFfY29kZWMsc25kX2hkYV9jb2Rl
Y19yZWFsdGVrLHNuZF90aW1lcixzbmRfY29tcHJlc3Msc25kX3NvY19jb3JlLHNuZF9wY20gCnwK
CkFueSBpZGVhcyB0byBzb2x2ZSB0aGlzIHByb2JsZW0/ClJlZ2FyZHMKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlz
dApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
