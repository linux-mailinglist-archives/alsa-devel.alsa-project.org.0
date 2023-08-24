Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E35297879E2
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 23:05:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42D2D112;
	Thu, 24 Aug 2023 23:04:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42D2D112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692911146;
	bh=onkOv4SYMoonLfYOr6PDOLYwXWodLwJ0R/9tSFyPRJE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=egDIqBSjFdnABC4KW2LAmTGNASSo9U03tBfYFnqN+nbCiYxj01tuc1XVNPXVqNCog
	 QNJuxjBypza7ftVLa4sz8lRA2pI+58Q7gxPUnFKAE2y0coJlv0euxuBxtpmPyhic2n
	 16FpriMshpu2XbV9BfqcbVHW8nMpDPr3TmW5gHuo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F28A7F80551; Thu, 24 Aug 2023 23:04:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94539F80158;
	Thu, 24 Aug 2023 23:04:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD6D4F804F3; Thu, 24 Aug 2023 23:04:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0DEE1F8022B
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 23:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DEE1F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=We8YpBzH
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1cc61f514baso174446fac.1
        for <alsa-devel@alsa-project.org>;
 Thu, 24 Aug 2023 14:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692911071; x=1693515871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+m1WhdeQslq+QoYeJ3Ohald/jRYYAhuW7OSigqmOZCA=;
        b=We8YpBzHoFEAV4rnjB8vJbq/xinEh8j8sopgEqXMdiiPYqjzVV0PamP7rA0NYV+Gb+
         pmVwJ4iIltr2LSQ2OURTQ2vubKlY0tjqocgBFW5lZNMMxFmBIOweaC89euYYyYUj/CvF
         W9VF/du0cEE90V/DQt2eDhZ/XyueMmGlZawpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692911071; x=1693515871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+m1WhdeQslq+QoYeJ3Ohald/jRYYAhuW7OSigqmOZCA=;
        b=U28cxhHFFuIAPYeycIggi3CJM2hQdQHRxDMRzUS56r2grNrQcDlZxjR/Bc13Mwpf/j
         DRKugfbGmPurmcytvxSw/xO9GXDJS87upmpxobRjJdOK00Hj/U7GKu45IdvuEe0fOaVx
         y/JnTWN8zeo8BouKvTny2Ibl3w8JDC1a31uJqHSZ1oToC8CwtYm4/Wg2uBtsJb0O5UuH
         Vn7YBn8d5KA+bxZtvdUVEshdY4/feK2Zz6menqbkVSA3mTwWFHgnHT/bvIMJRuH5RDId
         4SMU1qcnfo8oFdJNZDYYEsmd2Uh2AoIYZFgvvc2fQNZbFh7J5hZHlYJG5XrUzHEiWxzU
         tiwQ==
X-Gm-Message-State: AOJu0YzessDYo8ln4i3CiVMcP1Jcc5jmxeLtOFHw+EeTrUzxsuxEa3ra
	Z+Ba4iJkAJ2cL4TO5tpEGUdPgCYGw1mZ3JgJqA==
X-Google-Smtp-Source: 
 AGHT+IGVxuVE1ynt+Bbe/IWTl9zD1J3tSXwEdFOmvCiOMJvTlssSBFIoi/hnWjQY/kisANf57nrsQg==
X-Received: by 2002:a05:6870:2185:b0:1bb:9fd0:6b7f with SMTP id
 l5-20020a056870218500b001bb9fd06b7fmr1144257oae.11.1692911071376;
        Thu, 24 Aug 2023 14:04:31 -0700 (PDT)
Received: from localhost ([2620:15c:9d:4:133d:5d74:91c4:bbb1])
        by smtp.gmail.com with UTF8SMTPSA id
 u3-20020a17090a890300b002682392506bsm145412pjn.50.2023.08.24.14.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 14:04:30 -0700 (PDT)
From: cujomalainey@chromium.org
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@chromium.org>
Subject: [PATCH 0/2][RFC] Refactor snd primitives refcounters
Date: Thu, 24 Aug 2023 14:02:51 -0700
Message-ID: <20230824210339.1126993-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JBAS6V5KD3SC55GH26JHUICQFVHLHPAB
X-Message-ID-Hash: JBAS6V5KD3SC55GH26JHUICQFVHLHPAB
X-MailFrom: cujomalainey@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JBAS6V5KD3SC55GH26JHUICQFVHLHPAB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

As previously identified in [1] there are some issues with how kobjs are
handled in sound/core. The solution provided in [2] is a workaround for
the issues to fix the failures.

This series is a first attempt at the larger refactor needed to properly
handle the objects.

[1] https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3B2VMPFATCJCRD76DM36LZAICPDP2R6A/
[2] https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JZIPB4OIC3OK6YAGTPMAEKXMLUWM5PTA/

Curtis Malainey (2):
  ALSA: core: add snd_device_init
  ALSA: core: split control primitives out of snd_card

 include/sound/control.h                  |   1 +
 include/sound/core.h                     |  34 +--
 sound/core/control.c                     | 330 +++++++++++++----------
 sound/core/control_compat.c              |   8 +-
 sound/core/control_led.c                 |  18 +-
 sound/core/init.c                        |  33 +--
 sound/pci/hda/hda_codec.c                |   3 +-
 sound/soc/intel/atom/sst-atom-controls.c |   8 +-
 sound/soc/soc-card.c                     |   2 +-
 sound/usb/media.c                        |   2 +-
 10 files changed, 249 insertions(+), 190 deletions(-)

-- 
2.42.0.rc1.204.g551eb34607-goog

