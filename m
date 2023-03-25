Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E586CEECF
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:08:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9746E82B;
	Wed, 29 Mar 2023 18:08:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9746E82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106132;
	bh=BmukuPyGrELSIfOYBSOISTs0JPdz+ugxI8JreU0NXSA=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=szqrs1LH1AWN3IrQGDuZcdeCLGpvf2GKkKRNa7rH8KAmiqtS7NKLs0lTP8f2x6xE2
	 QHW7q1Tqfr3Fr3+O2O0Sr/x46Br3sO5KSGyer9iGe2p/JxYsXzU6OTWQg6UQJIAn4f
	 yvAbuNyQ8FSmHGdBz56DCkT7VJcClL0OCCJPCn38=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C52A9F805A0;
	Wed, 29 Mar 2023 18:06:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECE9FF80482; Sat, 25 Mar 2023 09:37:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50CCFF80093
	for <alsa-devel@alsa-project.org>; Sat, 25 Mar 2023 09:36:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50CCFF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nSdPmhPF
Received: by mail-wr1-x434.google.com with SMTP id l12so3858861wrm.10
        for <alsa-devel@alsa-project.org>;
 Sat, 25 Mar 2023 01:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679733414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FmwKZTyx9Z9VsH3coz8KtKIUIkVFs5TGDymBrUlW+VY=;
        b=nSdPmhPFeqM8PxiyL9536x3V5AVdqBfQuWHjSiTAfYcThUoM66QHsxP0n0Z56fLjpz
         7LKB3DZyL7KCtPqeznklYToKAdNWtn8kIRW0ytcBeBDKvswcE/WnipOzp7Xhhc7hQX32
         1Y0BqEq002MtCvNmT8ELPVjrxy4PaGYmnsLZXkui50XNGjYJmUpPNsndH7V1TD2K/peB
         4NhxcHoTPzYZ4gMIcfiT+kQwD8LFnlQ//TA4nVL4ZUQ8/ZKNZsaM31ZAEEXvCiufj8Qx
         BskHuet930W06whR4/RdM2imXw1r8C2Dl6v3YOYVXsSHpK+DfEQ/PSrnLyBargQdEg7D
         EswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679733414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmwKZTyx9Z9VsH3coz8KtKIUIkVFs5TGDymBrUlW+VY=;
        b=uVyM1TRfRxXZnR+x3MH9OQ/hddI9nQZrD/Q3SJYoaFKlk2tWYbbz51LH56zePFvVc1
         W9/3gUWu2h5CUITN8T5i+FhfLsPU7vUKiMNXfbdqxaP/jv3XjORl3QSNEXWiRW1cnPH2
         KJ0Bwx9Cr/RCIg4Fwu8ZWD8PG79tZhBklJEJSl/AfNDG9az2gtqwJTduTWMwL3ZQfk5g
         rnVvxn2ySVlRl4WSwt/n4z/dWryfJ4tT8JPG8GmHWMr9krCidyFNZlhMVxZ9HH9S1TEa
         NtGszVTET+EIetxxhD958y+HtaO3v1jdt12nnqa8oW/3TcYbed7RkYtQ2/SrO9s4Q4TO
         3i9A==
X-Gm-Message-State: AAQBX9coB26KIM6fJzm9WvTsR7LINij5FUs/peE8ybWsasdSyfQ9mvUY
	oiI1bScI6Plst2AmywduDyQ=
X-Google-Smtp-Source: 
 AKy350b9CWWzsdEZarwhYE+Q+QjWZTkaNpSjlJgYXcm32An/25brR65A1UXP3A0fnebplApa6Ayizg==
X-Received: by 2002:adf:ee51:0:b0:2ce:98fc:f289 with SMTP id
 w17-20020adfee51000000b002ce98fcf289mr3790656wro.49.1679733414260;
        Sat, 25 Mar 2023 01:36:54 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id
 a18-20020a5d4d52000000b002d1e49cff35sm20108204wru.40.2023.03.25.01.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 01:36:54 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/1] Implement DMIC support in WM8903
Date: Sat, 25 Mar 2023 10:36:42 +0200
Message-Id: <20230325083643.7575-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2B66O276CAC6CEBE4WJMIITANDUWOFOP
X-Message-ID-Hash: 2B66O276CAC6CEBE4WJMIITANDUWOFOP
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:05:52 +0000
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2B66O276CAC6CEBE4WJMIITANDUWOFOP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

According to comments in wm8903, driver lacks DMIC support.
My wm8903 based devices (ASUS TF300T and TF101) require DMIC
support for correct internal mic work. I have used downstream
sources to implement DMIC input support for this driver and
I can confirm that internal mic now works as intended.

Svyatoslav Ryhel (1):
  ASoC: wm8903: implement DMIC support

 sound/soc/codecs/wm8903.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.37.2

