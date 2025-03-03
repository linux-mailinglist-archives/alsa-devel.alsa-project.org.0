Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D22A4C96C
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Mar 2025 18:28:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FA70602B1;
	Mon,  3 Mar 2025 18:28:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FA70602B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741022934;
	bh=XsV/x7waDKKUZ+brFQmjnbi4HN+yC3y6wj/gDnIlKOY=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LhlGHqOlr5n/g/xgxSPxZMspj1glKH8RAlvmpyyiFF4ePeHblsdgagKtat4gdLkx5
	 W0QVUps0rfn3paxz2AijTlNjnX0eQOS4tI+DDt91Xxp1byMQ1TUey+Rl285983QYu5
	 X2Aty4CB40MwhMjnH1L019AYHYFmfFm5vm316B4E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAA4FF805C1; Mon,  3 Mar 2025 18:28:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9420AF805BA;
	Mon,  3 Mar 2025 18:28:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08466F80424; Mon,  3 Mar 2025 18:28:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 565B5F801F7
	for <alsa-devel@alsa-project.org>; Mon,  3 Mar 2025 18:27:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 565B5F801F7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dxSz4JAK
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2feb9078888so7343636a91.3
        for <alsa-devel@alsa-project.org>;
 Mon, 03 Mar 2025 09:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741022875; x=1741627675;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XsV/x7waDKKUZ+brFQmjnbi4HN+yC3y6wj/gDnIlKOY=;
        b=dxSz4JAKXYiueX8F8UsNJ3GMSIjjc2rmdAufCQ0CzgafpFozjoEn25sPIdnoUUASsj
         IudKxTIE9NfJ2e1hcUoVLjIqs04SW4A9n4NZ05jr/QhVIBcW8MNTPQsvu5CoBHNDM4Os
         J6E4kI8uJN9H3v5O56wXNY93A0PNc+l3q/pSvYC+ScDRDJbnF2SRYlMZ3h1vOZjV0TTS
         wtMTAInTtx3pBy+1iBJ/L/Ra0lMjT9Bffl0NlslJf8175Iy35ovyqgoBR2QHeVFmOWj5
         JGznVsTIf8O8Q73Bacc+J7KEllR8gqPx2GwawNztk1fFRVL+GfOv5BTDPORXHgWz94S6
         QT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741022875; x=1741627675;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XsV/x7waDKKUZ+brFQmjnbi4HN+yC3y6wj/gDnIlKOY=;
        b=Lq+M60JXNt9G2oZ+b9g0k7vR6vw7ETFOhTDqA+HSKb/tLTD4280flQryvF0X4yDkp5
         +k1lVEqAwHAewBwh+bh+eAX0goii5dkiMwRFq1u/gisSa8NcNMdxoVYiwbHykHYDvCrT
         OBQDLWZrdDMQOJw7xeJXyJOWhMllwPKwOYANL8lN9sgSGRd8+zGjYpKNXEtXPDcYEehX
         2xidYI5FBq3q9w+jjE3TF8gV8L3Gs8F6hkCJCBpJzxw5mbC/LIyvuGzBid0PrD5/Pipj
         1OIhH9C5wW2mlfHdHnrBZaI7lUj7/k5Qh9ZFi6emUw5D/hGBq0MsxigevHt9BZo++RDA
         ZZkQ==
X-Gm-Message-State: AOJu0YwgCSnUnVdX5in+UgQg3EPWoCsRXrZahDDnaoPJYIqAyNzXKTnn
	lrovJm0nvnGBN3X/2c9/sTSA9ig2VkB/oIDLUPRM9Tc/8ffDmLXHqMw4MMS70Z8z+c414aKhMB6
	6RNZGuQdkQVIiA2rEGOAV2Puc+htyoR+bsP4=
X-Gm-Gg: ASbGncsZzaNs9Xp1WOeol40F9uVE4jSythNsdyMkZj0Zw/oxB11yih20IbeVd083j+H
	KdG6SidpIjDiXgou1ddv5uN+UYF8AZ167JmBY50wVSdea6Eo2tGk3ZzkeoMXEtlQcaVITViWEkz
	8HVobz7ATPvC1fknTX/PsWdw==
X-Google-Smtp-Source: 
 AGHT+IFKY7ESzEo+bcc8ZNIJJPqrWawH6PU5Qhdeey3VgG9uCyHyP5xn7Qanl8QfxD6H8Ak36hrDwwkfvhInC/Bnmh4=
X-Received: by 2002:a17:90b:48d1:b0:2f6:f107:fae4 with SMTP id
 98e67ed59e1d1-2febab4031cmr22564996a91.8.1741022874652; Mon, 03 Mar 2025
 09:27:54 -0800 (PST)
MIME-Version: 1.0
From: noman pouigt <variksla@gmail.com>
Date: Mon, 3 Mar 2025 09:27:43 -0800
X-Gm-Features: AQ5f1Jpz6t1jfPVhMps-OIElC2bsg_zKsShufGgY4tIBpFvkaS6VBx63iW-lpXI
Message-ID: 
 <CAES_P+_nK8TPS_=TsJ-_eh+zRDGfCiu-=+73=i9c26KriuXSiw@mail.gmail.com>
Subject: XRUN handling in pcm driver
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: AHEP5UJ4K3H753JR4OOB6B4H42BWKZ7K
X-Message-ID-Hash: AHEP5UJ4K3H753JR4OOB6B4H42BWKZ7K
X-MailFrom: variksla@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AHEP5UJ4K3H753JR4OOB6B4H42BWKZ7K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Maintainers,

I have a question regarding XRUN handling.
After an XRUN is triggered, userspace generally
calls TRIGGER_STOP followed by PREPARE
and TRIGGER_START. In the PREPARE stage,
we are currently not sending the ALSA ring
buffer (physical address, rate, format, etc.) IPC to the
DSP but instead doing that in HW_PARAMS
which is causing bad audio after XRUN is triggered.

I was able to resolve the issue by moving the
IPC to PREPARE, which fixes the XRUN problem
and results in good audio even after an XRUN.
I have also observed a similar approach in
Qualcomm drivers, which I assume is for the same reason.

Is moving the IPC to PREPARE the correct
approach for handling this issue? I would appreciate any
insights or guidance on whether this is the recommended
way to handle XRUN recovery.

Thanks,
