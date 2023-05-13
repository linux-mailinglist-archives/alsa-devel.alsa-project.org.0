Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1636B70198F
	for <lists+alsa-devel@lfdr.de>; Sat, 13 May 2023 21:54:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A30C8EA5;
	Sat, 13 May 2023 21:53:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A30C8EA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684007656;
	bh=2wpOn8iStusNBwbYMOoPT40VREIAG2TtoQV1LYQMqyU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oUopJDlHN6XdINnJ68P1AWvlj6zleO3HewnsA3dRCfjiX315arS+2DsqXGJXeFXf2
	 ZO5erAK/BcIB/G0lzwKiCsZxpSBgFY3bdwr19kKyOG76FE5joKpipE3kEy0ohyhtc0
	 o/LZR7vi9DXCSr5ZtNdzC+wHzNxxeRSCMWXUmBJs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27CE6F8014C; Sat, 13 May 2023 21:53:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7D53F8032D;
	Sat, 13 May 2023 21:53:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BDA5F8052E; Sat, 13 May 2023 21:53:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4040AF80310
	for <alsa-devel@alsa-project.org>; Sat, 13 May 2023 21:53:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4040AF80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=HbCngJG4
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-199ba5154b3so666562fac.1
        for <alsa-devel@alsa-project.org>;
 Sat, 13 May 2023 12:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684007589; x=1686599589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKnUGuMyQddL8Uvsex1Z0TjgGFq0tLnmJqvcma+3L5k=;
        b=HbCngJG4uTOze1qPsdYCZbxWziGcPon0eIHT9dn1jiZW9KyEHitJhdfDVv4cBMyZo3
         9oab0ViVhQy8qojtbWL2jp5718+c22qXvSUr7mdgD3ym0VRp3iwklZQDWtX0hQxYfFVh
         aOdaskmHKknzy433KAJwh6vXJKW6yHsPSkgMl4xj+5fQkw1ANq33/A4Og66QeKOyCqCt
         jdeDHYMIdVYcRyeMhZHDge66puDZbZ8A21wNPWTqF3e2RPKwz+pOCjVx9R46mQwdnqxz
         sVWXNZ1cq2L2hZu8pULvV+PWiyNty9BAEtmBMWzMpwmOdlZfx9W0/2MbEzv6I1Mus/nT
         1IrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684007589; x=1686599589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKnUGuMyQddL8Uvsex1Z0TjgGFq0tLnmJqvcma+3L5k=;
        b=GZqnMI93JllB8YsgT2zpMh4Dot3N+A2yLhV17hIgHThv1cU98TFWdsTK9Ntt3OezMz
         b8Gzcz59FhwMdMFWtb7S4x4on3zJQYAfxmpKs0kbKwGUXJ4blrkN8sJ4jSW9aLqz2fub
         u+XuI99JFgu/aDLxzCFEyMU0orGaZU5hoMA8qADdXHxG29VXTN6zFtyESM8Y2JGuUq+f
         YSXHR04x73Glz9SBKL+ILgxFH5vFSrl5pfXSwZ5u4bWW5ggfGrzLwpx+UKQ1Yxj2VJA1
         kctjrROHjTbUwgh/YSfLGxXvG2gZB7dpqDDEhB/qh/cLC3KuXxBqwzz+1r+IJDID5V05
         58SQ==
X-Gm-Message-State: AC+VfDxyY1OutnphXWfdSpsKXORcQry5VbtVMNELmOJ9VSkqQrLsuvNR
	9ZFcapi71zo/zYe8kAUMYBzFKKP0wv1XRNAnHyU=
X-Google-Smtp-Source: 
 ACHHUZ4+9ESMyjKgM1moUKdJXq8n11MQ+BwtANHeBZ62+Ic4FnhLljw4ilR0v04fepPxlhQ3q2S+C+VJ7ZWQWHwC9r8=
X-Received: by 2002:a05:6870:738d:b0:187:f238:3db with SMTP id
 z13-20020a056870738d00b00187f23803dbmr15431411oam.19.1684007589147; Sat, 13
 May 2023 12:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <bug-217440-225600@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217440-225600@https.bugzilla.kernel.org/>
From: "Joseph C. Sible" <josephcsible@gmail.com>
Date: Sat, 13 May 2023 15:52:53 -0400
Message-ID: 
 <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
Subject: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000 on
 warm boot
To: regressions@lists.linux.dev
Cc: kailang@realtek.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: IGKBIK7CURG6A5PDKV5JEC32B2X6YGHI
X-Message-ID-Hash: IGKBIK7CURG6A5PDKV5JEC32B2X6YGHI
X-MailFrom: josephcsible@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IGKBIK7CURG6A5PDKV5JEC32B2X6YGHI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

Forwarding my regression bug report submission per the instructions in
"Reporting regressions".

#regzbot introduced: 5aec989130
https://bugzilla.kernel.org/show_bug.cgi?id=3D217440

Regards,

Joseph C. Sible


---------- Forwarded message ---------
From: <bugzilla-daemon@kernel.org>
Date: Sat, May 13, 2023 at 3:46=E2=80=AFPM
Subject: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
on warm boot
To: <josephcsible@gmail.com>


https://bugzilla.kernel.org/show_bug.cgi?id=3D217440

            Bug ID: 217440
           Summary: ALC236 audio disappears from HP 15z-fc000 on warm boot
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.3.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Sound(ALSA)
          Assignee: perex@perex.cz
          Reporter: josephcsible@gmail.com
        Regression: Yes
           Bisected 5aec98913095ed3b4424ed6c5fdeb6964e9734da
         commit-id:

On an HP 15z-fc000 laptop that uses Realtek ALC236 for sound, once the syst=
em
is warm booted ("reboot" from within Linux), sound stops working completely=
 and
the device doesn't even show up anymore. Once this happens, the only way to=
 get
it to come back is to cold boot ("poweroff" from within Linux, wait for it =
to
turn completely off, and turn it back on with the physical power button). I=
n
particular, once you boot from a "bad" kernel, no number of warm boots with
"good" kernels will ever bring sound back.

I bisected this to commit 5aec989, which first appeared in 5.15-rc6. In
addition, I confirmed by doing a custom build of 6.3.2 with reverts of both
f30741c (just to avoid a conflict) and 5aec989, which works correctly for m=
e.

--
You may reply to this email to add a comment.

You are receiving this mail because:
You reported the bug.
