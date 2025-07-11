Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E921B01EAF
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jul 2025 16:07:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 455A460226;
	Fri, 11 Jul 2025 16:07:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 455A460226
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752242866;
	bh=d3VuuLyyyFCxbPwe3G26jzyJnAQAWypz048/oVjpCEA=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=X0PMfbW6v1oor7YQgIUsSweNJQ8c22dp9lyoXIi2yzNtYZADZ+he2VIm66yAboXWV
	 hoTkCK63/aPeqHxkMm13eBC3Ffl5s/+78mOTG+MYDb5UL32TFPvJEHM4NEOi3bfaMe
	 cCip1oEjRVtY0mXyYES2DefxnLX/94CYzbJFGIN0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB523F8025F; Fri, 11 Jul 2025 16:07:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81D52F8057A;
	Fri, 11 Jul 2025 16:07:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04871F8052D; Fri, 11 Jul 2025 13:49:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE2F3F8025A
	for <alsa-devel@alsa-project.org>; Fri, 11 Jul 2025 13:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE2F3F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YwJo4cV9
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-45526dec171so6557855e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 11 Jul 2025 04:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752234490; x=1752839290;
 darn=alsa-project.org;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sKRTWRGRaRXNdY43MREvRUNqAcZEQ7jm5dwyk+F4vEA=;
        b=YwJo4cV9u64ZJijjKsLhLFr+sc1K6DcNlzh56pydDB0mN+eNWy7MidIgNce9kNxeaT
         tOWg6Q5RpOqYtWYg5BjnaAkbmSQ65mWJkz/6ZuJYWMFEPum8CQpwVWlHar3vQ6RFfvkV
         3TPoMwFkuK4QsmqhpdtfTcdtUmkG+yGHil++D+sh/n8MK8F3bb2CLWJo7egQEXaxbCYM
         h3ArsPmZgmGy2yjGMHs+BHGnj0+bDnbOf+XDlVtjyWlk0tpqzVtDiL+kOBPUn1FhE9XC
         2YY3o9sdg02PTctFGtU8ODfX2PPMKjc8jSCT7WQPVl2hinvhW2LYglkrgHVywoAyEw19
         uvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752234490; x=1752839290;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKRTWRGRaRXNdY43MREvRUNqAcZEQ7jm5dwyk+F4vEA=;
        b=QVTEfJj0ZV2c8rHJ+qJ7U39IQqa8EgKC5+vKhSdsJHpVpWL1O8y1kfyzbbDIoWZTkn
         1JCQzRtpwvYplI5Bs4kJ03Ie5JZUMA5QvnrCf1+IW00yJWG97e5eY5HuP3vzy3o1iv8k
         Bdu+12Xy5ZbV8M/Ykk5dbK3iQ//BHh3NOKQZxBsybQoxdEoPG4kPgMU/nCO1ohYUXOIZ
         PjF4+NWoaJAVqLVSRYuiihgZlfCuW0RLhyHMgKNb6ZGshT/uumRexVBtqeIOnBSU43KS
         IEU4pzGxwD7Avo8O2ELqiYcjY5cRPsObJr0+c9JE7SO05T4+Iz2I4ribev/Kap4kN6M1
         CTDg==
X-Gm-Message-State: AOJu0Yz1t3rfAk5hqoStAIpmotXplpeurX34vbSVdie7n+W03JG+DlHu
	dOtB4kQeZX5tUiIT56p/C906NjnI42HsPWo0l7PTWVx/ISypsmNFB+FeSqAcOMU=
X-Gm-Gg: ASbGncslQBXOf1kbVPX9/os0GQUKC71rGloXLM8c0Dq5mRFQDxLkxZOT1QVQvERupJ8
	4A2oHAcl3XDyjldtWM1ZyoPMkyaG2chEfPe0UkQDF3pTbbX7tPYLTvPU/Euoh4zrOJDi7gMSQxh
	PfoHeehnAG0d83m6HkvpDEdknh+H1PUzfwG5v/jIURNskfSuSXvrIUGgUrsD1Y6cz2ErVAEF6WZ
	V/Sw8KxZud6TAXWsdEd/dw/lvNkmLNQLpS8urv45t0MkiS5j5+O3wnuzrT/rr5OBKoBtlMd+R7p
	zw2F/bDMfo6fUtFpbdnSyTaaIAPfi9fQdBXI/VGao4KgJW098P8mutNZ2Pbrd1H5ov9Jzyxf4+j
	gSUXQEjXdip+taA5J3aZJbjM=
X-Google-Smtp-Source: 
 AGHT+IH4u9eDZ1R67V++QJYP0FZofanwtgs9YBXZsSGT96FI7O9/QW4te/5UVR2MwoVduHiuEEawbA==
X-Received: by 2002:a05:600d:7:b0:454:a37a:db67 with SMTP id
 5b1f17b1804b1-455174751acmr19663465e9.17.1752234489701;
        Fri, 11 Jul 2025 04:48:09 -0700 (PDT)
Received: from [172.20.0.183] ([85.195.207.189])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d5062119sm86298455e9.18.2025.07.11.04.48.09
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 04:48:09 -0700 (PDT)
Message-ID: <8692b1e6-70d4-405a-a02f-361d1e8d6bb2@gmail.com>
Date: Fri, 11 Jul 2025 13:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: alsa-devel@alsa-project.org
From: =?UTF-8?Q?Sandro_G=C3=A4hler?= <gaehlers@gmail.com>
Subject: Lenovo Yoga 7 2-in-1 16AKP10 volume control bug
X-MailFrom: gaehlers@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4QUG4I4PWD4X3Y2ID4UZLWCRIDVZ5XAN
X-Message-ID-Hash: 4QUG4I4PWD4X3Y2ID4UZLWCRIDVZ5XAN
X-Mailman-Approved-At: Fri, 11 Jul 2025 14:07:23 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4QUG4I4PWD4X3Y2ID4UZLWCRIDVZ5XAN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGVsbG8NCg0KSSB3b3VsZCBsaWtlIHRvIHJlcG9ydCBhIGJ1ZyBmb3IgdGhlIGJyYW5kIG5ldyBM
ZW5vdm8gWW9nYSA3IDItaW4tMSAxNkFLUDEwLiBJdCBoYXMgdGhlIHNhbWUgc291bmQgY2hpcCBh
bmQgYWxzbyB0aGUgc2FtZSB2b2x1bWUgY29udHJvbCBidWcgYXMgc2V2ZXJhbCBvbGRlciBtb2Rl
bHMuIEkgdGh1cyBhc3N1bWUgdGhhdCB0aGUgc2FtZSB3b3JrYXJvdW5kLCB3cml0dGVuIGJ5IFBo
aWxpcHAgSnVuZ2thbXAgYW5kIGxhdGVyIGJ5IFBhc2NhbCBHcm9zcywgd2lsbCBhbHNvIHdvcmsg
Zm9yIHRoaXMgbW9kZWwuDQoNClRoZXJlIGFyZSBzZXZlcmFsIGxpbmVzIHdpdGggbGFwdG9wcyB0
aGF0IGFwcGx5IHRoaXMgd29ya2Fyb3VuZCwgZm9yIGV4YW1wbGUgdGhpcyBsaW5lIGluIGxpbnV4
L3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jOg0KDQpTTkRfUENJX1FVSVJLKDB4MTdhYSwg
MHgzODAxLCAiTGVub3ZvIFlvZ2E5IDE0SUFQNyIsDQpBTEMyODdfRklYVVBfWU9HQTlfMTRJQVA3
X0JBU1NfU1BLX1BJTikNCg0KQ291bGQgeW91IHBsZWFzZSBhZGQgdGhpcyBsaW5lIGZvciBteSBt
b2RlbD8NCg0KU05EX1BDSV9RVUlSSygweD8/Pz8sIDB4Pz8/PywgIkxlbm92byBZb2dhIDcgMi1p
bi0xIDE2QUtQMTAiLA0KQUxDMjg3X0ZJWFVQX1lPR0E5XzE0SUFQN19CQVNTX1NQS19QSU4pLA0K
DQpQbGVhc2UgYWR2aXNlIG9uIGhvdyB0byBkZXRlcm1pbmUgdGhlIGZpcnN0IHR3byBwYXJhbWV0
ZXJzLg0KDQpUaGFua3MgYSBsb3QgZm9yIHlvdXIgZ3JlYXQgd29yayBhbmQgc3VwcG9ydC4NCg0K
QmVzdCByZWdhcmRzLA0KLS1TYW5kcm8gR8OkaGxlcg0K
