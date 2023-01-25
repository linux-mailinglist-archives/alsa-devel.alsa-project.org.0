Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC8E67B113
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 12:23:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5870082A;
	Wed, 25 Jan 2023 12:22:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5870082A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674645794;
	bh=M4rgoJKzM7Z2LuxxXbIu5em8Kln56dbDqhxm61K4mB0=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vZC8iTe5KUM+3LqBYeEFIlzejj+EYpWiFIek6OrG9BBPQfH6l3AT1diOeKTqqp1ET
	 k/16JBD+9MCGIHNZ9s833ckvPDKKjKkgNXDcjoFBwKHUmm0DCqm74SOYJ6vquLDswC
	 4zt7cCl9EIFNLgPaIJxQuT9EqtrxQMsHZBp35Q30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57F4AF800FB;
	Wed, 25 Jan 2023 12:22:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFF1BF80424; Wed, 25 Jan 2023 12:22:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32E67F800FB
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 12:22:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32E67F800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=iAOorhUl
Received: by mail-yb1-xb35.google.com with SMTP id x4so20803272ybp.1
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 03:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4N1tknjR+6+Fvb5FdmpQFoWpPBKGXE1kIT0qNHjSdYY=;
 b=iAOorhUlgVLuSqn4h7YW1i9G6eFcrA/lyJfTYP0pVQh8Wr4TLEnJog6OwF7KoA6kg3
 JRAwQlfBBjmApn8GVfCx4ISzkDnUM70zVzwhwqejTHyGfYEBlsRr7ZzaRZCjWb8ve+H9
 Jj06XnjYAJNdzdbhWDeu0CsQBtzEnx0KJVI0Bn8C4bzxDC5/abhPdtrQcbN+CVzaByMp
 otLJYSi6+WYBapfXRxSVXm+4Pxrhkv50wDPjlevItgh9jFqWICvbk4tpu1mCSHHiEXfB
 moSzFZxSGK39SmT8KfGOdtKX8cmHHDPJOR94TaM7rVPJUIfyjv/9C+Acxj2DhTSi0I25
 owXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4N1tknjR+6+Fvb5FdmpQFoWpPBKGXE1kIT0qNHjSdYY=;
 b=bRDwk3N3TtExQJ5tzlcQZ4NHPq3SpUu31M/vwhr00luQ8nEy90H5gSDuENhwMcqWbu
 ZwV5eL2Rlke63P3seh15/9XgPSrOp0IIipDvjnvDLIqfQu6/w8YgFcBGFEhmiqwLmujs
 at0l7AoY4ekzu/HtJFGCJ/1vaTto6iOC1ock9qkcwidD4Wt3NKAXvQsHBwT7bBLpPCp1
 zBmKW/HvCUoXyRwaxELYAOiJKsbhEtKb3YP4j8h0bPeycBeG8hRIbkgRk4J99YuQjvi0
 HetHrH52hVrAE8Xor0zOCrR/Oy6DqIhknJv8DPHxD07Ig9MABWutglp2OFZfRyqM296V
 BB8Q==
X-Gm-Message-State: AFqh2kqmlcTkHVkiKXbK1gNnfVhK20CI+K0+F8tmmPzYVgehZxr6gm2+
 Em7PjAffODs++LFMz/V0vHiCgLEmw2A+fpP/WWrhCYnAar4=
X-Google-Smtp-Source: AMrXdXvs4sSW0azhzwm5tSLNEdYEAZi1+A9qQEg/bGiu+m7GP9TQ5qcBosvFzpstOg5iHZ0WPr15DxrzGJG4A+Eu3JQ=
X-Received: by 2002:a25:c645:0:b0:802:2e2c:2b8 with SMTP id
 k66-20020a25c645000000b008022e2c02b8mr1747845ybf.200.1674645728063; Wed, 25
 Jan 2023 03:22:08 -0800 (PST)
MIME-Version: 1.0
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Wed, 25 Jan 2023 16:51:57 +0530
Message-ID: <CAHhAz+gxrjB04c-GHa1YzahyKDQcW3+xoDt9iUnkj9THKvG_TA@mail.gmail.com>
Subject: struct snd_pcm_ops callbacks
To: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

struct snd_pcm_ops callbacks can be used for sending\receiving PDM
audio data to and from a sound card? Or is it only designed for PCM
audio data?


-- 
Thanks,
Sekhar
