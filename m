Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 110FFA2AD96
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2025 17:22:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD5A160155;
	Thu,  6 Feb 2025 17:22:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD5A160155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738858938;
	bh=3f2AQwf+FirNCD+WQEGezQ/VqOhZOkNyM1peyGNyMq0=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cmRiXnUUKRt845kKut2Ex7dNwTWVDzfbuy+VcZ9o6AdFq+JlJYm4D1bjR/q7Px3Kk
	 rdD3DDEiZaadRH4YLLLQa2NVY9AYZNntpYZx9DNpcht++WIvXrUP5ZafIMsxQER0et
	 tR9yHQKQn7MGLSufJqclwZ7i27+OXSI1dviwA9AE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B151F805B6; Thu,  6 Feb 2025 17:21:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91B80F805BA;
	Thu,  6 Feb 2025 17:21:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAD4FF8028B; Thu,  6 Feb 2025 17:21:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B19EF800ED
	for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2025 17:21:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B19EF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WQnZMTtk
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-2b832eab8cdso192649fac.0
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Feb 2025 08:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738858890; x=1739463690;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lvt7nUdJS3KvOnpvNUn20I75AD5aVlCTcSCOr6Y1gHY=;
        b=WQnZMTtkMfj/WLUiL7bjt/Zn0oiBTLKaXDGiW+BY6kciFhN9azBChvIx/64UDEdnZq
         n6UxzON9e4AkbTpW7M+wxobM7NdA1Ypyy2s4MXiBpIi1zNPGjvWrWjiXULOiTkwcQVzA
         4CUn6r/n/21X0lrcSkQGwdulm+L41aUo7VAwrlugUJqRu0sf8CxhCOvfAiFxIKSWwgw6
         nM3qNBVeKvcfd98VFnSc6YC3T03G0pqo56bj4OhddumaiJqBxcgxRDWPL85BFfLIgSLb
         08Nlilt3rU8dLAUh7vMLu05DM+QlmW1TAB+/L0KkjnSlzKBJY+80WfzI3g0iGSWQ0xld
         PeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738858890; x=1739463690;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lvt7nUdJS3KvOnpvNUn20I75AD5aVlCTcSCOr6Y1gHY=;
        b=IWsGQ14h8B5KxRPMFP/28rqWcQCl/WE239v+829oRAYnCjOhOFFKNLvzzfkx3/EdV0
         AiEPKF+VCNczWdvAl2OQPDw4NYgQVVMWTwvdFX072IhnBHkRe5qY2I51bvB2/g9pbFPp
         Kuzaib5LrDevg03iTtpQMn36Fe3bAFzpWu8hHkEjTUdLrEmwEKwTh7x9+zaO5XTtQXbW
         XyefZmzeQ219+jlK4XgCldBFfjyg9IR7ivYSpGO1BPg5f4A+hy/WoFO5vIUty+iFYaZU
         A7v06H+Q7nsrMeSxOtnV4W7Dp+oBRsOChKV315pV01y0pqIkp4l6lqGbOdr3Nc6vCxeF
         0o0Q==
X-Gm-Message-State: AOJu0YxT0sezba17Cx0LP85k+2tC7+c+Ct3UHxdlWhTIxsVZysj0HO4Q
	Z0JXCCs9AGjSws28XN9b3mdDOkLvBTKqpSU97b6LZQaKvFFBGAoyGcYHBzUtgQo31R0S1efLmgU
	MQ5gq8QHr16TAEcTABDHVZgo6PQrxbtXe
X-Gm-Gg: ASbGncu9mjZZp25+1Hr3O+HzGEwQo+11ebuyPdZXbcFPXowFYTS7YPchmMvQzMY7R3K
	aUhOe7CiuRL0283WIRFfmxSxPr7Mp58fcM5up1LMpY3ZFKE5mI8FsN9WHdiDaKXJA6C7LVyuBq6
	Q=
X-Google-Smtp-Source: 
 AGHT+IFQpEVlEsa0KA37DNjyjds4wwXZWmv8r/1aSRXLSrJ/4ukHTzG5b0pQyDeBJnUivbG7B3mUV2pqdfPjj0vl9Ig=
X-Received: by 2002:a05:6870:6c02:b0:29e:49b3:c527 with SMTP id
 586e51a60fabf-2b8050bb4f6mr4802101fac.24.1738858890554; Thu, 06 Feb 2025
 08:21:30 -0800 (PST)
MIME-Version: 1.0
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Thu, 6 Feb 2025 21:51:19 +0530
X-Gm-Features: AWEUYZn95MRDbrPxrpCfwrbSkaPWY60aq_88Xn-CyVu8ofk3lP3gmXsWmYzUmfY
Message-ID: 
 <CAHhAz+hE60nBn6Fn3k-ABO5T9USS08fYZhCrZ+n0KGzvACamVw@mail.gmail.com>
Subject: soundwire : LnK SoundWire Protocol Analyzer on Linux
To: alsa-devel <alsa-devel@alsa-project.org>,
 LKML <linux-kernel@vger.kernel.org>,
	kernelnewbies <kernelnewbies@kernelnewbies.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: REPVWW4X6CWBRFQIAK4R4QBZHNLDCA5B
X-Message-ID-Hash: REPVWW4X6CWBRFQIAK4R4QBZHNLDCA5B
X-MailFrom: munisekharrms@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/REPVWW4X6CWBRFQIAK4R4QBZHNLDCA5B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi all,

I hope this message finds you well.

I am planning to use the LnK SoundWire Protocol Analyzer on a Linux
platform. However, I am uncertain whether the current Linux kernel
includes the necessary SoundWire drivers to support this . I would
appreciate any guidance on how to use the LnK SoundWire Protocol
Analyzer with the Linux kernel, as well as information on the specific
device drivers required.

Could you please provide details on:

The compatibility of the LnK SoundWire Protocol Analyzer with the Linux kernel.
The steps to set up and use the analyzer on a Linux platform.
The necessary device drivers and any additional configurations needed.

Thank you for your assistance.


-- 
Thanks,
Sekhar
