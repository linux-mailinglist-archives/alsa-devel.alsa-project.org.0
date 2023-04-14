Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CBF6E289C
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 18:45:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B5F7E11;
	Fri, 14 Apr 2023 18:44:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B5F7E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681490732;
	bh=vHUKR7DhIAvrFhltVxCj8MOLOyxuJZYw+4+P51lCZD8=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UZKtjgD2wS5niQQDkXFKCXKeE18xINkIYLfSPabkV6QJrdZIYq95y7odlJu0nKVGq
	 Ivnb6nE4JHWRh3iiTZA71Ugwi5T4rDbBI+/2CK8eB6malH4XOrGN1QLh9Rz6xnA1Q/
	 lcyBdX0+YuxiDhBsukiSsRu+7JUQMewxwQBiO6rc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79F29F8025E;
	Fri, 14 Apr 2023 18:44:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72801F8032B; Fri, 14 Apr 2023 18:44:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25570F80149
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 18:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25570F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=jgw1Egh6
Received: by mail-yb1-xb2f.google.com with SMTP id by8so3283645ybb.9
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Apr 2023 09:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681490672; x=1684082672;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wAR/IhYKHH1BsY9u5IUy+to3NaysIuJyB5TWYLo5Z2o=;
        b=jgw1Egh6P42XBDZUFH+yg9daQykHh6AKCpRtaq6i5d4z0SWxmXJyC9Ok71sjyVJicP
         RH0LiE+vojnEARQ3en7nskrXoVorpuhZsO6RVEjD6Hd7cGPy1Mso0rRHFXbReMsQg0FN
         yeJNpcibVJauTioPVRICssqgXafWOHvPSioGpa2B9C2StgTlVITvv3v3zq8YTkD4GeB0
         vHroOVsE1GKuENDRzg5oW4ZQ6Vv6YsOTXyREFE0yUj62ejLMAM+wv+x1HnzCat6TIMLD
         llKOWTBiF8xXdHmCjzxT/VlB+3XMij+gEX/usmx7hOr15yqX+RcOwuELD8kZAc2odWZ7
         csSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681490672; x=1684082672;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wAR/IhYKHH1BsY9u5IUy+to3NaysIuJyB5TWYLo5Z2o=;
        b=cKnJeUeO8L/d5sKMSD2ZoqU+o6q620ypzNWQD/qWgWonVp2lMXnPTdN0/nglgEndqj
         Vk99UMdiapzMdPRbza6DdjqlYVl9oURZxuPS68sSZTykn6rdgmoHm7A4X8OA14/sxAnd
         DXYmbxjeY9m3+vuL3dKb9sayti8wSQYinUHN7LMtia2jKqewKQfSnWJCxe/W7six2ZPj
         AMX3qQ3njoRjdrAT6vbHOJh9leaxo++yH2IN+hPtRFS5oew9LDgqV671nG1BiOSZwW7g
         Sp0X+hzdrhi5bvPsr2dt6LKyMtWbhzxahab8+g5Wo4xzA39Y9QIzfP+YUJpyIrpbANqS
         ElnQ==
X-Gm-Message-State: AAQBX9cgIXkl5J0e7tjTw9SNayGXpHts/u4ftCAL7OWHEDt5+2hg6CUQ
	NIr+vT8XtSd/tQLBlWDGf5u6aBKrAUaumlwAbop3d5aXj50=
X-Google-Smtp-Source: 
 AKy350b6HKZpFDxiN5KzVpVKgpmCmXy2oMcSdfGc7Ag0RnI02naKR3BtgrOX0ebmblQon+UaUXKyGFl0WOr0lQxaQKw=
X-Received: by 2002:a25:74d4:0:b0:b8e:cb88:1b8a with SMTP id
 p203-20020a2574d4000000b00b8ecb881b8amr4185958ybc.8.1681490671882; Fri, 14
 Apr 2023 09:44:31 -0700 (PDT)
MIME-Version: 1.0
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Fri, 14 Apr 2023 22:14:20 +0530
Message-ID: 
 <CAHhAz+gCGi3i9c4KLt9V+RhQypn7RXrfMnH9LJCTty3K_QTGFQ@mail.gmail.com>
Subject: ALSA: struct snd_pcm_hardware.formats
To: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 35C7CSOQ2T7QQCAHKC45NNXIBCZ63MPE
X-Message-ID-Hash: 35C7CSOQ2T7QQCAHKC45NNXIBCZ63MPE
X-MailFrom: munisekharrms@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/35C7CSOQ2T7QQCAHKC45NNXIBCZ63MPE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi all,

struct snd_pcm_hardware.formats (SNDRV_PCM_FMTBIT_S8,
SNDRV_PCM_FMTBIT_S16_LE, SNDRV_PCM_FMTBIT_U16_LE,
SNDRV_PCM_FMTBIT_S16_BE, etc.), are these sound card hardware
capabilities or something that needs to be taken care of on the
software (driver or userspace) side?

-- 
Thanks,
Sekhar
