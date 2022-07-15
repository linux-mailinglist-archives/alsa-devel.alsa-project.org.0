Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FCA577CDF
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jul 2022 09:52:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B281A1777;
	Mon, 18 Jul 2022 09:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B281A1777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658130764;
	bh=DhyjzbnBVLrdbsmXIFCwpYZwZTDQM0iq5c1dy84twG8=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EtQAyAm+spElnftlkUgePC/Vmj+cRQi/foeBTB1Wxad2azJvKFGweCwWY8bk8VzZv
	 dcAf2ATiykq3p+hW12fY1LrSfmPJZdQ50SjefaBwA7gYC3qoEn7rbERsggP7CTqWP4
	 +OGiSCo15UQ3G6NMAbPakGEujTNJg+U09Oyi82qA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70106F80543;
	Mon, 18 Jul 2022 09:51:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34CEDF8015B; Fri, 15 Jul 2022 16:47:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA118F800AA
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 16:47:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA118F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RPHtc3/f"
Received: by mail-lf1-x131.google.com with SMTP id bu42so8240387lfb.0
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 07:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=hnZ+MvwB+u/7GXN4apfe2vynpMNEghiaOYcAH7Yw9gU=;
 b=RPHtc3/fDfzZZRiqEqT6Z9/JLfaI3IeROHCIiQXkCIz7BZXrtgp3Af3NZW3vnyLTDM
 Dud+V/VAyIvlwOmeWmZdmLcgVOdSO6HwtvfiZtLd2cHRCb/Lch9izIzAF0aue4gw1g+S
 YZ/8gTK9HQ9VPXjYhcGvnt/NjBHbp2fPqY0ejomMNrTGlyehCbFH6Uh3cwzuyaOIB4Z6
 klbc7X/hd5VaLoUPE3XHdtyI3tBXczwXOXjGugBsTXzvu6bYUkuRXGNO3JXOwxrCh/ZS
 Ugtu+9p/FNSB6wP4mfTPjo6AFDM0MWruGNbgysNzNrmSIV8tCp2UatKRBBj024p1aEtV
 JjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=hnZ+MvwB+u/7GXN4apfe2vynpMNEghiaOYcAH7Yw9gU=;
 b=YkRFhSDlPvt0gmzUS0a+9AO6+Xymtcci+HJOzTi6YqhZipbst1kwR/sIHehJ8Y/WXB
 s6Zy+/0hDMxAi8rH5vwgYnrKzUrdhIOGD+SbjfSgnmbacnGk/YmtcRLHBUuZCjYZ077S
 sR4L3uWV1YAokhDs2klL2mt9x19KmXd5Qe82oQ2UFqVwoqICGfXr4sAAHvL0Wv6mHSOv
 KAyTUPeYYnu2lRO+ii2Etsngye4Xx18SFG3F4OgsP2ZCSMrmFCCD0lVVo9mlwXhMqF/W
 FWAXA3/rrSzWZgBhjzD/2PTYk2bsc1PNzrisNx6nEx8IyuQ09f+srpD1m/3J8V8E15S5
 3D3A==
X-Gm-Message-State: AJIora/bimEKUMetYxKSR/Kftbu9SXpJSJ44Ye0lbpGBeX4hMmss3bFI
 G46KVn7yrPznp0A91MuDnTucodHOPMUob7b5pOk=
X-Google-Smtp-Source: AGRyM1uxKUrj3JEQrUuOsgOpjAKK7BEkm738gDEHs7uQSTGnFv1i0xpHLmkWiELlPxYZy47VUoFKVsVrNXQgzqdz88c=
X-Received: by 2002:a05:6512:3053:b0:489:c4d4:ba12 with SMTP id
 b19-20020a056512305300b00489c4d4ba12mr8316770lfb.476.1657896446922; Fri, 15
 Jul 2022 07:47:26 -0700 (PDT)
MIME-Version: 1.0
From: "li_jessen2016@gmail.com li" <lijessen2016@gmail.com>
Date: Fri, 15 Jul 2022 22:47:16 +0800
Message-ID: <CAK0WjkiJb9_mTmTMWUb2dX-B6_52Fr4stxXrgaW=07RjfMzvZw@mail.gmail.com>
Subject: FAIL: alsa/Makefile dependency check
To: broonie@kernel.org
X-Mailman-Approved-At: Mon, 18 Jul 2022 09:51:01 +0200
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dear Mark Brown,

Sorry to bother you. I posted this issue on stackoverflow but didn't get
any correct answer yet. So I try to reach you.

I'm using Ubuntu 20.04 and the kernel is *5.19.0-rc3+*.  When I run
*./kselftest_deps.sh
gcc* in .*/tools/testing/selftests*, it shows the following:

FAIL: alsa/Makefile dependency check: $(shell
FAIL: alsa/Makefile dependency check: pkg-config
FAIL: alsa/Makefile dependency check: --libs
FAIL: alsa/Makefile dependency check: alsa)
FAIL: alsa/Makefile dependency check: $(shell
FAIL: alsa/Makefile dependency check: pkg-config
FAIL: alsa/Makefile dependency check: --libs
FAIL: alsa/Makefile dependency check: alsa)

In alsa/Makefile, it is:

LDLIBS += $(shell pkg-config --libs alsa)

ifeq ($(LDLIBS),)
LDLIBS += -lasound
endif

But in ./alsa directory, when I run *$pkg-config --libs alsa, *it
returns *-lasound**.*

And when I change  *$(shell pkg-config --libs alsa)* to *-lasound* in
alsa/Makefile, there is no FAIL info for it.

So I wonder why the FAIL info appears in the presence of *$(shell
pkg-config --libs alsa) *in alsa/Makefile. Is it some sort of bug or
did I miss something?

Looking forward to your answer.

Best Regards.

Jessen
