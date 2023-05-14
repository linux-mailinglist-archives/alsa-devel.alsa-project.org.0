Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9EE702006
	for <lists+alsa-devel@lfdr.de>; Sun, 14 May 2023 23:50:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC4431FA;
	Sun, 14 May 2023 23:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC4431FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684101002;
	bh=PWS4TpfZlOhTIxXTsS/8L8tTmkyCNNzadQJxOAHhYC4=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tVu50edv9Hulcxfoy6bC8qKjpnkNpVWx+PRyyLpnjhjd2n4HScbzq+xEOb8Llsj4X
	 YSlOVDDtE4TRL6aOgNS3KFTnmqI4riv+Ur4bv4SjdXZdzTd+Vqzs3JSKcrZo6B3e59
	 eeChEilC14U2ezEF/cnENgt20djm9r2v8UJMOX3s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BE7EF80272; Sun, 14 May 2023 23:49:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B825EF8025A;
	Sun, 14 May 2023 23:49:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DAFDF80272; Sun, 14 May 2023 23:49:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7DE9F80087
	for <alsa-devel@alsa-project.org>; Sun, 14 May 2023 23:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7DE9F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=hYdHKKdX
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1929818d7faso68391965fac.0
        for <alsa-devel@alsa-project.org>;
 Sun, 14 May 2023 14:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684100936; x=1686692936;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+YSwxrTT+iU4nSpQgtLDKahRgqIhzOMeGqncPjkpZTg=;
        b=hYdHKKdX2RYa4x9ty/w4iogkjqezTON6VzTtJjNueIu2cz5mwNKmoeGuaqQZ/9VacL
         C3KZSi0dGjItj6Zj0LQCEj3kzz71476E6w/M+RYsJjJM3WkE3X2c0t2uL6hPCXhAOOwd
         8edFaolNO0OQOpu1wyrCmx629wHHVDlN9nJTCvglMXXzM00ewEuJYLzzZTzqHkkIrgQs
         hQTKF0Lr7qYAqJLZHW/SdEuwAPl2rq4lrw0QkxyI8LH30DPP3FVppXRoDBIoL9Pda+7Q
         qT5zabqxAixQKww1EZYkSCgI7bS55yAdq2+jiQ0f2JCHF1AySnEim0GaCYNuqA+81Qx+
         QcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684100936; x=1686692936;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+YSwxrTT+iU4nSpQgtLDKahRgqIhzOMeGqncPjkpZTg=;
        b=d9sLuUrb4lDf0D31nQ+GrCseyK8wD1yEOHBlWsG2eC8twXgHHEP3/NH47SeYT3OWAT
         yHTi7VeDqE0LhOdrY2Up0sQJe6MeCMCDL2s6cAO0KQ1pjr/Msx9ESHhKc3vAKEJ1V72+
         o60FenPEhttVNULA9F+xxQXXmMwEs2d+xznrpwQ4N8BNnGPOzGdB1jOaD+gbuBcjWO7Y
         XZtkTqFirxw/qShoyCbWCCV7tSI17KQ+FPtN+a2eTIPjktzmSkQkaaQIFsRqL5sBYbmQ
         L14oLKyyM+OP2WQh7KxChUY9do98JEfkKbFmZqulhR/iB73ABX3qgU6n+MJr/RdUlahw
         46jg==
X-Gm-Message-State: AC+VfDzo+g5sb+YWeylc9CIxG6DbWCrIBeAGSKACQs1AB6oDywpcahbQ
	CxSuLhXBQBd0NiTRcDoxsU6CPX5dZsH7WzgAFAg=
X-Google-Smtp-Source: 
 ACHHUZ5Bl/zfWA5BfJII4hmR/DLH/R8Bf5RQV/baYNil5TbACMlFyKXPD/pDIJVfTB4ubaaqoWUA8jRI81+hmtDwfhA=
X-Received: by 2002:a4a:7644:0:b0:552:3a25:1d26 with SMTP id
 w4-20020a4a7644000000b005523a251d26mr5191973ooe.0.1684100936546; Sun, 14 May
 2023 14:48:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:7201:b0:111:8854:cdcf with HTTP; Sun, 14 May 2023
 14:48:55 -0700 (PDT)
In-Reply-To: <87cz338ix4.wl-tiwai@suse.de>
References: <bug-217440-225600@https.bugzilla.kernel.org/>
 <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
 <ZGB0cVVI7OgaJU6t@debian.me>
 <CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
 <87cz338ix4.wl-tiwai@suse.de>
From: "Joseph C. Sible" <josephcsible@gmail.com>
Date: Sun, 14 May 2023 17:48:55 -0400
Message-ID: 
 <CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
To: Takashi Iwai <tiwai@suse.de>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, regressions@lists.linux.dev,
 kailang@realtek.com,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: BOHTJEVAJ7TX7APKQYH4MMMUKOADX6C7
X-Message-ID-Hash: BOHTJEVAJ7TX7APKQYH4MMMUKOADX6C7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOHTJEVAJ7TX7APKQYH4MMMUKOADX6C7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/14/23, Takashi Iwai wrote:
> The patch changes two places (the change in alc_shutup_pins() and
> alc256_shutup()), and I guess the latter is the culprit.  Could you
> verify that only reverting the latter fixes the problem?

Yes, only reverting the latter fixes the problem. I just tried a
kernel consisting of 6.3.2 plus the below change, and it works fine:

--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -3638,8 +3638,7 @@ static void alc256_shutup(struct hda_codec *codec)
        /* If disable 3k pulldown control for alc257, the Mic
detection will not work correctly
         * when booting with headset plugged. So skip setting it for
the codec alc257
         */
-       if (codec->core.vendor_id != 0x10ec0236 &&
-           codec->core.vendor_id != 0x10ec0257)
+       if (codec->core.vendor_id != 0x10ec0257)
                alc_update_coef_idx(codec, 0x46, 0, 3 << 12);

        if (!spec->no_shutup_pins)


Regards,

Joseph C. Sible
