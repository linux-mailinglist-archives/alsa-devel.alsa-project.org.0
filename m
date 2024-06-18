Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4898F90D499
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 16:23:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94F84B65;
	Tue, 18 Jun 2024 16:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94F84B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718720603;
	bh=5a6B7OS5y/6qcp1oPN+ywcFiRxZ6JJXCwOzY6VEkxZg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OiXodX+d8HnW3iLhuT1L/t0CeOaUxp5BExdtmHWqwdMddKoBrlqg+hVMguL2bRRhm
	 9buZUVroUo7WWRM25ECqUZEtr/yBedWlq4SITLNotZs2Ee02No9pfel6jwyHTaAGRS
	 St1bs0UyP4BPZHC9e1+2cwJd0hq5sjJb4EG9LLhI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5519CF805F9; Tue, 18 Jun 2024 16:22:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3888F805E9;
	Tue, 18 Jun 2024 16:22:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BF8AF8023A; Tue, 18 Jun 2024 14:44:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68891F800FA
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 14:41:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68891F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VV3Hwg34
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2c2d25b5432so4190940a91.2
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Jun 2024 05:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718714436; x=1719319236;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5a6B7OS5y/6qcp1oPN+ywcFiRxZ6JJXCwOzY6VEkxZg=;
        b=VV3Hwg349w8NlyLXvc51cE39NByOHq4A0NaRrpAJpZ0YXQjMaqqahMeplXF0QRs0TM
         viDKSeVTo8cjyT1rIM/xIpLkU+MaOrXzRrLj0SctHiIR2UkRF44kbRuBADWYsNGZ/83L
         KC5R0wT7woPh3qgIaIxYj+JzFxjeJNHQtufNjy02L8D4K5lEwmp9Rg6MBMtBwfhTlpzA
         GdyAGh6WYAiQMRqo5rDaQk4LYGmP7mYJ1VkwGbaNH1GAsVrxtG5X5gqJHDPRSpkzx0i7
         nwNdVQOAkju48Le6w1wsVUlqCnhbfNNTksvHkWEakPhtn+vHHjD7VPNQCyPopWxVQgV1
         7pwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718714436; x=1719319236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5a6B7OS5y/6qcp1oPN+ywcFiRxZ6JJXCwOzY6VEkxZg=;
        b=bZMV06znWsNfANNSDKTJiUqoWVbPxEr/UBC8z1Oga4HCdCNqlLRbRj3Td10Us562Az
         FwMBIfpWPD8Jkn/s6XLzSDnltUXP9oaS4HUHqkaYgfMRrAyFyi6PmHtvGhUUdXSorCCB
         RMt7+Qg09ild8whEvXx9sjPd8i5FgXtuBA7EXFtLIJ3uzA6KO23P0sBHDqWHP69RJnOV
         zYErgx4D7UkzXyY21u79hTI77tWhCH+CPq1meyyBaQS86Fd8aXC8GuyGLvCsoGyV7ZKQ
         jcES0T4BQja/2Wp1wJaO8ayLdNzhXxqZU6ThGsB8+Gl2SuDG0EJz9f0TRbIU8Yy9fJcf
         vHXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVubMgYXJTJDh9BoY007ouAQg+gcqKrbfECEh7d7QRGkPANpwlBivP6KqZTIXCUkdqj3ShVg5715veDEErd4B520MSChVlkyGy+2Lo=
X-Gm-Message-State: AOJu0Yy+0X+PESvvt0amu6qd6/6nJ04lLJK6paVfO9+vViesQYGS6MR/
	tk8958L/ti8BloW8Bu32/S+CHc5oVbAkez5/F2N7yr0cdz2hOkJmIIZwrTbNJ2vtkv00oS5KLz7
	ERlnpgF8b9pR88zXV6ALdwK0XvbY=
X-Google-Smtp-Source: 
 AGHT+IHzJ+FQXBDprzDLivYXPnBaHoSRGyFKlPdv4yqmqIcli49NimXBrXz6EdcJ6mVtfetMmC1KIax8TCU52XOcrsY=
X-Received: by 2002:a17:90b:253:b0:2c7:6305:9905 with SMTP id
 98e67ed59e1d1-2c76305b4aemr956131a91.10.1718714435549; Tue, 18 Jun 2024
 05:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240615125457.167844-1-rauty@altlinux.org>
 <2c9ba341bc95d4b9010bf5f8794c0d14b1c57dc9.camel@irl.hu>
In-Reply-To: <2c9ba341bc95d4b9010bf5f8794c0d14b1c57dc9.camel@irl.hu>
From: Rauty <rautyrauty@gmail.com>
Date: Tue, 18 Jun 2024 15:39:58 +0300
Message-ID: 
 <CAGpJQTHoBAixmxta2WuZfjHjiK9GXF=hkfPyV7PBD5rt9Z_0WA@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Enable headset mic on IdeaPad
 330-17IKB 81DM
To: Gergo Koteles <soyer@irl.hu>, alsa-devel@alsa-project.org, tiwai@suse.com
Cc: perex@perex.cz, kailang@realtek.com, sbinding@opensource.cirrus.com,
	luke@ljones.dev, shenghao-ding@ti.com, simont@opensource.cirrus.com,
	foss@athaariq.my.id, rf@opensource.cirrus.com, wzhd@ustc.edu,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: ZJTBYE62TCKLRJVJR2UU3L4AUBFPZSZK
X-Message-ID-Hash: ZJTBYE62TCKLRJVJR2UU3L4AUBFPZSZK
X-MailFrom: rautyrauty@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZJTBYE62TCKLRJVJR2UU3L4AUBFPZSZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 16 Jun 2024 at 10:38, Takashi Iwai <tiwai@suse.de> wrote:
> Your From address and Signed-off-by address are different.
> Could you try to align them?

Ok.

On Sun, 16 Jun 2024 at 21:08, Gergo Koteles <soyer@irl.hu> wrote:
> There are some similar collisions with Lenovo laptops.
> Please see commit 0ac32a396e4f41e88df76ce2282423188a2d2ed0 for an
> example how to handle one.

Yes, you're right. I'll do the same and send v3.
