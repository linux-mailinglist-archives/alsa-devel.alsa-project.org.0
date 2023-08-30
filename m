Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2066578D58F
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Aug 2023 13:34:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C11D1FC;
	Wed, 30 Aug 2023 13:34:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C11D1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693395294;
	bh=ugeDZ62DKDnHGscDdVbEDHqNxXCEo5JqDthRctKWnIE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ufy6g96ieSBGJ9QbTk9ACSImP6Eewi9oGirhPZKS2ApwYa1RSNpdLTPAsHwdb2OVS
	 RlMVzViqjYx6JH+iB8I/I/ahLYnGAt3rGdjYxlhdieu+aHUb5sDNoEgnajabS+rFXu
	 Dt5t/Z424Tc3hU1Gnxtaqt/Hb+TyMaPBczfOp6Kg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E74E8F80236; Wed, 30 Aug 2023 13:34:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 969CDF800F5;
	Wed, 30 Aug 2023 13:33:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5369F80155; Wed, 30 Aug 2023 13:30:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F15D2F80094
	for <alsa-devel@alsa-project.org>; Wed, 30 Aug 2023 13:30:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F15D2F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=WaIqb5s4
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-401ceda85cdso25959855e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 30 Aug 2023 04:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693394999; x=1693999799;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HeVnp6+dMLCahTFEnv2mqRZRz0x2Xyv/+Cdn1caRov8=;
        b=WaIqb5s4T8JjuZL7W+46QPNRc4c6khFzVSgWLQaxfkJoa3POb4904QmtkAjUCSA54D
         FvkwjmOh3/EU2GGlC3iAIpiA2lgVAN8/me4WsH+LLKTtVLYr3wsPVSJxnL+q8YIQGQv2
         Y50/oOCCROF5gYWWLsSotAgrTwwXdasZb8EIPX7Fkrd9nGQ7SNZh/wdLZFDa+Ysrk98c
         rx6LUnBNLwBbRC8+shkRWvh3M6A9x1Ps1a4e+M8GYRTKEBsB00OWxRgRz590wKyLOch7
         sm8lFT6mtbdW3Dj+zdzo4LPyqyLAQ4GfkH1PzKR4hRbxxx73kueiIebaUvx603LmnDUD
         WI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693394999; x=1693999799;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HeVnp6+dMLCahTFEnv2mqRZRz0x2Xyv/+Cdn1caRov8=;
        b=F4uXgCbcIs/Ey1kjJPNzsiDOLMpw3IfIYrzQ5Qaz56CEXIE1zo49mc6v4VeRrQ/urI
         dqB+16TgxKnmcf0PKVP2tqFQrYrAdJP20U4zF/nZ3eDNdfSFOc0ICX3hJ48YAjflQOcM
         GcqHHFDfrkl8jMrnkSDRYB/ausF/RZEnZHlmnL4adXK9da76OVKTveUSwlLzGtFlG48Q
         ElxK2/Uw50eLIh55kA4y7GiGg/DuUYClVaItI4J0h9StvUZTzwFfzSzJqzzgzsxiCos2
         GzWj4NWn1/FsILtpRWuodGitEOphMu9D2yxGDLIUkzd+MCxaSp89GW0BMtl027q7bUxa
         ZAdA==
X-Gm-Message-State: AOJu0YzwQ7b9SGioCjMssSXdT7OWoukIEqcuBok65PpBoka1pnv8n7oG
	dnmClhgIa2idj3i22HG0i2I=
X-Google-Smtp-Source: 
 AGHT+IGyoO44Uu/f7TuIuGzv0Vb43TqZU+jGwsOABGqlgchMxzq3Xguj5jA+dX0NyTf8Pn0T7/S9hw==
X-Received: by 2002:adf:fd0f:0:b0:31a:dcfa:c6bc with SMTP id
 e15-20020adffd0f000000b0031adcfac6bcmr1501071wrr.32.1693394999377;
        Wed, 30 Aug 2023 04:29:59 -0700 (PDT)
Received: from debian ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id
 f17-20020a1c6a11000000b003fed8e12d62sm2017759wmc.27.2023.08.30.04.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 04:29:58 -0700 (PDT)
Date: Wed, 30 Aug 2023 12:29:57 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Lee Jones <lee@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	regressions@lists.linux.dev
Subject: mainline build failure due to ace6d1448138 ("mfd: cs42l43: Add
 support for cs42l43 core driver")
Message-ID: <ZO8oNb2hpegB6BbE@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: PHWLDGLFRHFNQZ7R7JW7UUOBFTBIHZNH
X-Message-ID-Hash: PHWLDGLFRHFNQZ7R7JW7UUOBFTBIHZNH
X-MailFrom: sudipm.mukherjee@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PHWLDGLFRHFNQZ7R7JW7UUOBFTBIHZNH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi All,

The latest mainline kernel branch fails to build alpha, csky and s390
allmodconfig with the error:

drivers/mfd/cs42l43.c:1138:12: error: 'cs42l43_runtime_resume' defined but not used [-Werror=unused-function]
 1138 | static int cs42l43_runtime_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~
drivers/mfd/cs42l43.c:1124:12: error: 'cs42l43_runtime_suspend' defined but not used [-Werror=unused-function]
 1124 | static int cs42l43_runtime_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~
drivers/mfd/cs42l43.c:1106:12: error: 'cs42l43_resume' defined but not used [-Werror=unused-function]
 1106 | static int cs42l43_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~
drivers/mfd/cs42l43.c:1076:12: error: 'cs42l43_suspend' defined but not used [-Werror=unused-function]
 1076 | static int cs42l43_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~

git bisect pointed to ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")

I will be happy to test any patch or provide any extra log if needed.


-- 
Regards
Sudip
