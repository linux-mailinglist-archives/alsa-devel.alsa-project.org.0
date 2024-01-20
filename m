Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C5E8332CB
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Jan 2024 06:00:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A758D828;
	Sat, 20 Jan 2024 05:59:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A758D828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705726806;
	bh=VvE3apNTM8l39/MGCJ6qCICyWHNoCX1D6dS//RWeiig=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Nr+Pvlas5vDZV4TPRBydCSfmwJsbKvQz4FtOYumbi5FkrCeDuggM68EWDThl9Q4ev
	 D+3VTedaZDaB2Qeh5BEe/ukpg0B978wMPvjQaycTygmpup83YqWXGFw3nkHvRjPG6j
	 GuTV69KFVX0VYvbHMqIqxUletXauuCjV5bd+ig4g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D952F8058C; Sat, 20 Jan 2024 05:59:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FB11F80567;
	Sat, 20 Jan 2024 05:59:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57C7CF801F5; Sat, 20 Jan 2024 05:57:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C27EFF80074
	for <alsa-devel@alsa-project.org>; Sat, 20 Jan 2024 05:57:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C27EFF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hShPhqaj
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6dbb003be79so1688661b3a.0
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Jan 2024 20:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705726664; x=1706331464;
 darn=alsa-project.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvE3apNTM8l39/MGCJ6qCICyWHNoCX1D6dS//RWeiig=;
        b=hShPhqaj40uSqqHvFiKnp4ovjWehSlpWiRz2iODupsvY4E09nBys4Io/HrDOWfhx/9
         Yn2o4mvc8gSlNn0PlvN1l5uAa77kiZMiKoiHXsQP1CaTBTGLsvvh9Vqb1j3BuGUHw96h
         5bY7FPEcGg1bIcMGK0gyeG6stBF77rhyTGLRMz0PVoWjpGRnscFKpM08iXm0S18U5U0j
         vT7YzApZZY+isScdbuTS4GUYEJLa935n2KvCwyIp9hiLd74scX8Kx4TCDx0EgbO7kBw4
         lfcHjLoq97dAAxXF3WFtMQCQsPD9v72HWUO9YC8MRA9LfSkQ/5yNP89Xnb8ULKebd06Z
         +bsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705726664; x=1706331464;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvE3apNTM8l39/MGCJ6qCICyWHNoCX1D6dS//RWeiig=;
        b=O45rJfUwTMRnsfuVtwXR2L2UJSX0hgoXNhtFAajjIrsTB4Qivp8t6pKFr56aDq/ccx
         UEfoER2C71Q4EJB22Y6QumWXAPyErtKmzijWY0nBzejPjxA4FxTmrNHIwPDhc51IyUGf
         DLL37HMu3g/8zNkfFDOwVT6gLLhIWN+eI4gjwjkKPMHys7TSbfUiuY9vu8eP8+lYCe38
         mQVkUgCZzvVCd+kNk4bPfNgYfJTVfR5EnZqqTfRyWH187n/S/5OWW7IVo54Eg4j5fOEA
         VURvna8DGQ3TSdEVjgkDl5Iapn+g6Sw79grT74fLkGstDCw1oRX/uSDBr74axZRQc2px
         Jlhg==
X-Gm-Message-State: AOJu0YxlU0vHiI42xaEq04/TNuNpV+LVa/Md2Sbb5vEkvMqPSQcy9Wxf
	gIfk8iv9c9RJOYrruuU7Xjve43yaFz4MEmLvSPAm8+KVd9g6N0Z7hksj3igzMTIXaw==
X-Google-Smtp-Source: 
 AGHT+IFvVzlV8fitsvUT3VmaHCBgY5Nkn3P5fiteFiJ87MGyf0Qrc76c4dB9TwDBfFieSSv5LYC/0w==
X-Received: by 2002:a05:6a20:bb27:b0:19b:120a:ded2 with SMTP id
 fc39-20020a056a20bb2700b0019b120aded2mr2241801pzb.42.1705726664267;
        Fri, 19 Jan 2024 20:57:44 -0800 (PST)
Received: from zy-virtual-machine.localdomain ([222.70.13.170])
        by smtp.gmail.com with ESMTPSA id
 u33-20020a631421000000b005cdad153d84sm4283916pgl.90.2024.01.19.20.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 20:57:43 -0800 (PST)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: RE: [PATCH 3/5] ASoC: codecs: ES8326: Adding new volume kcontrols
Date: Sat, 20 Jan 2024 12:57:39 +0800
Message-Id: <20240120045739.10732-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
Message-ID-Hash: L4RVN25YJULRH67A5Q6WBMIC3YX6E6AX
X-Message-ID-Hash: L4RVN25YJULRH67A5Q6WBMIC3YX6E6AX
X-MailFrom: zhuning0077@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L4RVN25YJULRH67A5Q6WBMIC3YX6E6AX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> Volumes should be standard volume controls with TLV information rather
> than enumerations. I see that you can't just use a standard volume
> control here since there's an invalid value that needs to be skipped
> over, and it doesn't help that there's no ordering to the values either.
> I think the best thing would probably be to open code a custom volume
> control - this feels weird enough that it's probably not worrying about
> trying for reuse. Just have put and get functions that map 0..6 into
> the register values for the volumes in ascending order, then you can
> have a control that looks normal to userspace.

I'll try your mentioned method in a new version of the same patch.
