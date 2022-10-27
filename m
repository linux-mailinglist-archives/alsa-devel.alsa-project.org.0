Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB18E60FCBC
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 18:13:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3863B2DC3;
	Thu, 27 Oct 2022 18:12:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3863B2DC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666887228;
	bh=UqD5Y5Xazvri841YZrUuc+8QylEVhUars/WrM0b6Qzs=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MPWVlpBhsvGydm0Alm6BamHJuo37FGlzzCqBChBTPQVdtGNvFS3N+RSnfN35LYmzg
	 m0x/avkLkBtO2N6WtTuFA6NhkZvRUK0nkwZ4yJrVyX1T6FuCh3VcbscwFcmKBNKae/
	 rZWLpvqWnEYbNfK5Ir8y/vCGUT/o0K96z7qvDcY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96438F80100;
	Thu, 27 Oct 2022 18:12:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C63BDF8016C; Thu, 27 Oct 2022 18:12:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C861F8016C
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 18:12:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C861F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf.com header.i=@semihalf.com
 header.b="Vmho8Xh2"
Received: by mail-pg1-x533.google.com with SMTP id g129so1921853pgc.7
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 09:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semihalf.com; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rELWp2MTzSS6crZC45UAXZWmA3GhBoaTH6GwrSRI6Lk=;
 b=Vmho8Xh2M+l0KiG7RNOQ+8H2fBEUEXHPkZI+/HtNa0xufhvCmX2t9zbKd4sPZpuv6D
 wpc2AsIXpnM5dsWnnMEW8n8RC8fluCInT900RnnjIrjKuDnvi91HnxXIrsMSurQA7ZWE
 qe6Q6OMjTwbv4wb7PIqa9NRHqTLxAxyW7nN8fR246Hidf91kMnWR3h7jcqmb36lUPefB
 z6grUGair9kqvlMy1X9XPIcT/iFERYhDHk6z5CPrHhxblXW/cTTyKsWqJjbhQ0whFhg3
 S68YocCiM74J55Ext/JAj67DGddLwlm6o3SnSPBHGs4P2BJaszCVy/W+EwJYT0AMMuc0
 bwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rELWp2MTzSS6crZC45UAXZWmA3GhBoaTH6GwrSRI6Lk=;
 b=WEMdE0hJ2mH4bYNVhHMX/GOKzNANDRS8JgPRrI9bLYfAgroVmGkm0up6e+S0OD/T1r
 K5RlW5hupoR3ghqv9NoDkHNGAy482FjgOjzQ7444Xj0DN5o1HPb4V1gyvohHltPT1i7N
 UNUo/sWiU5vb4JtWQRnJPzL/yeQQWMgIa+SBvPr0yGtXLjbAX0q6v0ZXiVHXVwScBMI9
 HAjq4hgvc/YisZZcqiMxeMTWJMTdemrk3Kq1KNjQ8J6Uaqwmh/vQknHhSF80pWvY//Fg
 WEvSE4P/3S7BfeYudlIXgdXSCp6tdYqyEKuvPebUvezh6a5jvFAGzeOAG4jhLtn0fRkW
 +evQ==
X-Gm-Message-State: ACrzQf2hecUArF5FgYfXDxEyUP63gGWpWOm0Z6xyt6hHDhOPZ/2Xh2b5
 i5kNeVr+c+4AE4+Wr1NP3NkBVDIpXKO6CBiffT/e7g==
X-Google-Smtp-Source: AMsMyM71veRslanEMZRi/DHVnYwjIgwK0NMLqgNiMFINxQvVTsF5mrv08ERY1HUdvgrUcrPgqRJR5/rI04iQdSc2NyU=
X-Received: by 2002:a63:5559:0:b0:464:a987:8365 with SMTP id
 f25-20020a635559000000b00464a9878365mr8938965pgm.479.1666887158275; Thu, 27
 Oct 2022 09:12:38 -0700 (PDT)
MIME-Version: 1.0
From: Lukasz Majczak <lma@semihalf.com>
Date: Thu, 27 Oct 2022 18:12:27 +0200
Message-ID: <CAFJ_xbqwaOQ+NVbVuT-TqTJ5fcp6fvVfaUxxwLW1FLZDCjrAxQ@mail.gmail.com>
Subject: [BUG][v6.1-rc2] [SOF] max98373 i2c-MX98373:00: Runtime PM usage count
 underflow!
To: Mark Brown <broonie@kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com,
 Curtis Malainey <cujomalainey@google.com>, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>
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

Hi,

I have noticed Runtime PM usage count underflow on my Chromebook (12th
Gen Intel(R) Core(TM) i3-1215U) running vanilla v6.1-rc2:

[    7.558178] max98373 i2c-MX98373:00: Runtime PM usage count underflow!
[    7.558188] max98373 i2c-MX98373:01: Runtime PM usage count underflow!
[    7.558206] snd-soc-dummy snd-soc-dummy: Runtime PM usage count underflow!
[    7.558421] snd-soc-dummy snd-soc-dummy: Runtime PM usage count underflow!

Link to the full dmesg:
https://gist.github.com/semihalf-majczak-lukasz/d6a6d61d5937f762a524ed50fed93f25

Best regards,
Lukasz
