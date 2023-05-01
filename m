Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B34686F5064
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 08:53:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3AF913C7;
	Wed,  3 May 2023 08:52:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3AF913C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683096802;
	bh=Tb3Q47vszZMXikcBQCN5PRtR0dmzZf6eusUFaYz84pE=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JNO3VMlngLdpXDor8d5TU8SwLPVs2/gKPCcdrlujrAyOmQtyXsKU4Es42b843lqRg
	 uOE7CWn5+witEc+A+5fufumo9Njl2cGdR5NpgUFAU43/98xglu4XIHjNpgwxEZuk1I
	 rNRcMpiYEFmGINCgwTpEmyNXpcCH0IZalElQ5j1U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B91C9F80549;
	Wed,  3 May 2023 08:51:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 117C1F8049E; Mon,  1 May 2023 14:25:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD44EF80137
	for <alsa-devel@alsa-project.org>; Mon,  1 May 2023 14:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD44EF80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=bKBAY7S+
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so22259684e87.1
        for <alsa-devel@alsa-project.org>;
 Mon, 01 May 2023 05:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682943910; x=1685535910;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uBgAWRhKxk6UEmdv5jE39t1viFb+AQUZD51sjKWSdNg=;
        b=bKBAY7S+nLpXAksEeOFSTU5JckI+tpvAmFb79i4FpCXb/nfW0RtA6VPxu9wWpr2wav
         QKwPsFDsrU/ErtG6DOvlkkKCz0HxMHav54WV+Da9KcXKu0DEMQQlgZGfW8+IJSVUzeWI
         3bHa21ek2I0VTdpQOQP+Fjew/LaHGj5kqj3p15f/xwkp8+irpHWdONDqdeLEeXbu8ZFn
         0cGUa7LO+q4wsN0Hs5mQQlF43KHAxyidAOthM4yAd55qrXNg6f1Ux0ol7gPFZvnMnHPp
         YGp+Bx2NfcYhZaXqDJloXnvwa8vxjKyi21n8eWFPJdgrcOtTYn+D4c+RBNCxHXLae0f1
         LcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682943910; x=1685535910;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBgAWRhKxk6UEmdv5jE39t1viFb+AQUZD51sjKWSdNg=;
        b=OLF8oROS+WSaEPI0G3UyLTq+A7Og6fHwddEnt2kncDIg9U3mRm0ja8c1oV0usAxjqf
         ToghxAAQMCgS/qHsrQa0tdfW3UgdLhg9El7IE/3EZDWGE4h8uIAV6M/LfEmBBKp7HdG+
         pkBbpo8pdAiWwH2H9ex2DpFAAYnLmHdq4fNMSa3BMTb65vqHntajAUENKOWJ0aPQns5V
         5a9V6+0LzsFBWcLtrWDzCmmomvqFkJHNDPTbCzcKoTovOLDgp/vrZUEcI2vGBZ4IDUD8
         3Lij3hicxorsR0ftCKODOE4qYlGU+0vlbYEgB1Pv81tDwslX5r1aoXVLsGrXfP+6VAaH
         eDIw==
X-Gm-Message-State: AC+VfDwiVhhBrnNJtCdCmqkBclk8gTnm7q7QjuKIsCpF8umuzzDEUzd4
	BdRWrQpcUMyGZUBge3k0sTUpb2dKjf0iGUNu/5kKy0AUK0MC4g==
X-Google-Smtp-Source: 
 ACHHUZ4WXqxiu2jyeRBMkvT2Icw3Ws5/gKr6U7LbrztNpxJEnCldkNKpNTqCTdy0jtpao9hWls3zxwpgMZJYirNkjNM=
X-Received: by 2002:a05:651c:31c:b0:2a9:133e:dadb with SMTP id
 a28-20020a05651c031c00b002a9133edadbmr4983415ljp.1.1682943909555; Mon, 01 May
 2023 05:25:09 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?SXN0dsOhbiBWw6FyYWRp?= <varadiista.1@gmail.com>
Date: Mon, 1 May 2023 14:25:00 +0200
Message-ID: 
 <CACUCvsBNhL96Leo8w5fj3mwNNXJmr_k3Op26ctj5c6dkfTmUUg@mail.gmail.com>
Subject: [PATCH] ACP6x audio: Add board quirk for ASUSTeK COMPUTER INC.
 M3402RA
To: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: varadiista.1@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ALTEUZTJAAULOTF2X4NII3FS3PLI66JU
X-Message-ID-Hash: ALTEUZTJAAULOTF2X4NII3FS3PLI66JU
X-Mailman-Approved-At: Wed, 03 May 2023 06:51:19 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ALTEUZTJAAULOTF2X4NII3FS3PLI66JU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dear Linux Kernel Developers,

I hope this email finds you well. I am writing to submit a patch for
the ACP6x audio driver in the Linux kernel that adds a board quirk for
the ASUSTeK COMPUTER INC. M3402RA.

After experiencing issues with this board on my Linux system, I
researched the issue and found that adding the following code snippet
to the file sound/soc/amd/yc/acp6x-mach.c should resolve the issue:

{
    .driver_data =3D &acp6x_card,
    .matches =3D {
        DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
        DMI_MATCH(DMI_PRODUCT_NAME, "M3402RA")
    }
}

As someone with no experience with the Linux kernel, I am submitting
this patch in the hopes that it will be beneficial to a larger number
of users. I have tested this patch on my own system and can confirm
that it resolves the issue.

Please let me know if you have any questions or require any additional
information.

Thank you for your hard work and dedication to improving the Linux kernel.

Best regards,
Steve V=C3=A1radi
