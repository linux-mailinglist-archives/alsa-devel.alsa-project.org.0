Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 114057F94A3
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Nov 2023 18:39:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84260844;
	Sun, 26 Nov 2023 18:38:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84260844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701020348;
	bh=9+o0/xoDfV6h/LjYJYSzg2LoLBT1F7N2G9X5nJ0csOk=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=I3NEd4JSJkb5TobQPkXhgTTqZY5gWmaAOcdQt/7FdjVi8l0qgaygA5HSVOSV8izG3
	 K2XcbzLcW1hHJ4txLdKsego9pAVUO/BRMju91Z86zKrw8lEObYnD7qF62158n9OpwM
	 bkAS2O3kVHfanJxVAe1QHVJy0ldcOJR/7ITTNxxQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86ACBF805BF; Sun, 26 Nov 2023 18:38:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC174F805BE;
	Sun, 26 Nov 2023 18:38:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 322BEF802E8; Fri, 24 Nov 2023 17:18:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53B52F80246
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 17:18:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53B52F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IQUsIo99
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c88b7e69dfso25745901fa.0
        for <alsa-devel@alsa-project.org>;
 Fri, 24 Nov 2023 08:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700842723; x=1701447523;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9+o0/xoDfV6h/LjYJYSzg2LoLBT1F7N2G9X5nJ0csOk=;
        b=IQUsIo99+aAXW7sjEBVUMA1VLRuZP3WLDWbJ6h4lbef+kKDgIMP+DalBfxhQJqYVzS
         aqVtqzevgBDvwS35G7hPYODOxMe0oScCDqajLDyFCG02jEcPwWgpn58PxcfFibwRc+ha
         6UhqGngAgZ0OVT9YRvKQmp3pKD/AIOx0SqFkQRCbCQd1YbNtEiyAwdK/lm39SO5UBy/C
         bRzI2CdGwZPt+E0TfNEmLkTtxE8hekJUhNdag5PinxOu2TKIKitJ+bnohLA7IeQsDIJU
         +2hstK55k2zrrDualYR36PNFNuovwrlEweApKfSWPmkVoaJX3Th18AIrx9iaf4unlWm9
         kBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700842723; x=1701447523;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9+o0/xoDfV6h/LjYJYSzg2LoLBT1F7N2G9X5nJ0csOk=;
        b=HJXIi/pBEThAFPEF8LoCaTpXC18hGDfKrgZ7dDjUQ1Ii4T9F9SjxxNmGiLbGBuYhm4
         lWmv5HB17bl+ULW4tI2VLoYtlnztMzAc3MejTxWw/Lzt9Y+RK/u7+dYk9oIIkNxHmtIV
         UcRMPzOobo3rgkevMb1nMTzqriUkK4D3yZjYaoaEqYgMDVJjt7CeHi8a0X+lwHO/zz7h
         czvh2i0t7xDU8sQ+ZNDDGs4UGpr4pQ/rDj9rTOs9S/EcxUo97p7EcX+XkWdXmyHZTO6+
         97MzvlrOhqcOLyYU5BdZOQk8KKVU4hXRGYly/vuqsH6bczsKrOqW0dpACzfShhhE2U8x
         HrYw==
X-Gm-Message-State: AOJu0Yyrjc3jT19cH/5X3RI8ULKE2ei3bPgQzS82jBQzObff+U8f4h6t
	LoVgOO2d7MlJ1Amuti93Y1KUzeyeiW1QdFlk5n6V9VbePv1MlA==
X-Google-Smtp-Source: 
 AGHT+IG20Aot1/rtWXbDlpweKP0XuMMpqBgQ8ty/3/j+VDtm4Un/JvEA4Yxsxth333okxYAUiTbql3hl1njOQfgSPkI=
X-Received: by 2002:a2e:9793:0:b0:2c5:ee7:b322 with SMTP id
 y19-20020a2e9793000000b002c50ee7b322mr2712089lji.18.1700842723319; Fri, 24
 Nov 2023 08:18:43 -0800 (PST)
MIME-Version: 1.0
From: Yevhen Hrubiian <grubian.euhen@gmail.com>
Date: Fri, 24 Nov 2023 18:18:31 +0200
Message-ID: 
 <CAGGk=CRRQ1L9p771HsXTN_ebZP41Qj+3gw35Gezurn+nokRewg@mail.gmail.com>
Subject: Bass speaker fixup for Lenovo Yoga Pro 7 14APH8
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: grubian.euhen@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DITROTQ63NVZGNGRVARXNMPK6COPILLH
X-Message-ID-Hash: DITROTQ63NVZGNGRVARXNMPK6COPILLH
X-Mailman-Approved-At: Sun, 26 Nov 2023 17:36:54 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DITROTQ63NVZGNGRVARXNMPK6COPILLH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello !

I've seen a few patches fixing bass speaker problem for new Lenovo
(written by Philipp Jungkamp and later by Pascal Gross), for example
this line in linux/sound/pci/hda/patch_realtek.c:

SND_PCI_QUIRK(0x17aa, 0x3801, "Lenovo Yoga9 14IAP7",
ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN)

Could you please add this line for a similar model with the same Problem?

SND_PCI_QUIRK(0x17aa, 0x3882, "Lenovo Yoga Pro 7 14APH8",
ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),

I do not have experience in writing kernel patches so I hope I will
not irritate you with this letter.

Thanks!

Yevhen Hrubiian
