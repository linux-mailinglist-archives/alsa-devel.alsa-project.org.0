Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F068AF751
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 21:29:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 112F61908;
	Tue, 23 Apr 2024 21:29:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 112F61908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713900554;
	bh=Duv7O4z06Vx5Q8kd4nborgUoOAJBGoq1jXhmOYLYh5k=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mpI1G041BZgRqtg7Mpzxm4/UFBNpNT6OrvuV8fnTT99d/XSvVt5JONYw3xx/HcyA+
	 QTqh22olf71kSfblCz77LRQCLx392ClEbBhnfu9rN5MWR0uB42vq4+DggGJZ9fQMpV
	 G8UWebB4J2Bf9V5SRBvxOWv8b399qbEw/6rB1L4g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C872AF805F1; Tue, 23 Apr 2024 21:28:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8861CF805CA;
	Tue, 23 Apr 2024 21:28:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E928F8025A; Fri, 19 Apr 2024 09:45:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DB55F80124
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 09:45:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DB55F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=soderlund-org.20230601.gappssmtp.com
 header.i=@soderlund-org.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=USzzo5Gz
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-7eba3b8b88dso118271241.2
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Apr 2024 00:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soderlund-org.20230601.gappssmtp.com; s=20230601; t=1713512740;
 x=1714117540; darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rDKMCKmW7HTUyeB3P7ygznKTMBAgf6d2+/DKzAqCMDo=;
        b=USzzo5GzmnOiw3rhLEvURbtoLmYIwV0JobqZeoLKTIr7LDRn+XX8hmdKkz1gro+IAE
         n8JxoEdMuB11vyTaz5HFk7IgVecud0rs05s0IejTaavKdd2/3vuYm1q3aWRYCTvQvdZc
         CZIQ1Itn8oskwZ5u7i6SydOmZrdASpU2IwlcS6AYHJzmvJUo5e3F7bw7KUnOS6SMsAzr
         xTg6zyvsVyeP9oqn9d8Egk3u8lfqedcUe3MJ1B6PxuKyTaTAQs9zqpY7GYuk1NGb41yp
         aRD9oTtCkoPHiUEvjI5qBj6Rwl3yYl1OW1uRdY49qA1z0ffkPnNg0SF6H/oPBwWlcYmz
         VRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713512740; x=1714117540;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rDKMCKmW7HTUyeB3P7ygznKTMBAgf6d2+/DKzAqCMDo=;
        b=goEa0MQ+o5+5s/bV9fyB9Px6syhioew6oW7B3sQeB2oigYo35l8rpG38dHIWgBlRPF
         hPqM595rEIEfAx+ahtsxAtWv8GR64Dft9wLipKW1JjP82PyzKHDyGcUBS4Q/gW8xjoQn
         pGqDiT61Afl5rQvhNvI42funCVeO1QvWIrJmov9koqL3E8HJjERBA3hSbuGv32IqKdr4
         IMYSukj5TA/KkznAhL+SmPYa+tMpEfkwxGZE4JgRMvdPWwXVxr3Pogu6d58mDxbXkqch
         87TtJnzV0qJ0QT/50JuxsEUjLrzOYs0fmqrEmhO5rc5VHh9Fu/taHfA3hvhxSV2LWI+T
         AW5g==
X-Gm-Message-State: AOJu0YxEXjvLLIeswKxDmKp4edj5NZWPRvZoOtNvj5F22B5NqPMg+LrN
	GSt/mMomAlYVbByL6laUHGJzZaQI+fiISwXGuVQMw99kLD4OoVVhvc9doga/D00dYXaATnlEPc/
	5gV+HAy0JG2o8TDS6u1RgIXXmJWf8mfQCketM
X-Google-Smtp-Source: 
 AGHT+IHXIOK1IqrCRXZF817aaNaBRv6RZTpN3PvyjzIo/E0XvWB5ljRbpqhPzbPALOOgSvxHEklcEbagnCcfVn8m2ic=
X-Received: by 2002:a1f:e644:0:b0:4d5:f345:8b49 with SMTP id
 d65-20020a1fe644000000b004d5f3458b49mr1111361vkh.1.1713512740350; Fri, 19 Apr
 2024 00:45:40 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Niclas_S=C3=B6derlund?= <niclas@soderlund.org>
Date: Fri, 19 Apr 2024 09:45:29 +0200
Message-ID: 
 <CAOALB-ZrtXYvp5urv8xk+Lk+zcoK92mVANdY_kT7yR5QhT4=jg@mail.gmail.com>
Subject: RE: [PATCH v1 0/7] Add support for various laptops using CS35L41 HDA
 without _DSD
To: sbinding@opensource.cirrus.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>
X-MailFrom: niclas@soderlund.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NWM5P6UNRPI67ZQYLW5GVYL4M5UP2QYE
X-Message-ID-Hash: NWM5P6UNRPI67ZQYLW5GVYL4M5UP2QYE
X-Mailman-Approved-At: Tue, 23 Apr 2024 19:28:13 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWM5P6UNRPI67ZQYLW5GVYL4M5UP2QYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGksDQoNCmFtYXppbmdseSBoaWdoIGxldmVsIG9mIGxheW1hbnNoaXAgaGVyZSBhbmQgZXF1YWxs
eSBoaWdoIGxldmVsIG9mIGRpc3BlYXIuDQpCdXQgbW9kZWwgYWZ0ZXIgbW9kZWwgaXMgYWRkZWQg
dG8gZml4IHRoZSBwcm9ibGVtIHdpdGggc3BlYWtlcnMgbm90DQp3b3JraW5nLCBidXQgbm93aGVy
ZSBpcyBteSBtb2RlbCBzZWVuLiBJIGhhdmUgdGhlIExlbm92byAxM1ggRzIgbW9kZWwgYW5kDQpl
dmVuIGF0IGtlcm5lbCA2LjguNyBteSBzcGVha2VycyBzdGlsbCBkb2VzbnQgd29yay4NCg0KV2hl
cmUgY2FuIEkgYWRkIGEgcmVxdWVzdCB0byBhbHNvIGluY2x1ZGUgdGhpcyBtb2RlbCBpbiB0aGUg
cGF0Y2hlcywgc28gSQ0KaGF2ZSBhIGhvcGUgb2YgaGF2aW5nIHRoZSBzcGVha2VycyBzdGFydCB3
b3JraW5nPw0KDQpJIGRvIGFwb2xvZ2lzZSBpbiBhZHZhbmNlLA0KDQpNdmgsIE5pY2xhcw0K
