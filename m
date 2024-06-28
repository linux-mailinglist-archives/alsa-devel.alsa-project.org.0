Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 494D691DF7B
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:38:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF0BF2C23;
	Mon,  1 Jul 2024 14:38:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF0BF2C23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837503;
	bh=iyKrp7I82f3wYzsbQR/1Jeu1cFgJoa6hSbBVeuarAhw=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=f1a/6Cbts6nF5U9X1oN4cd9YjaKKsJ6zdgFrx7B0NeuwNqaZP6yXiXlpX2GMfg6ex
	 L2QWpjKKDkt8JEiMoIw0b6T+2gyRAEg15nNaGLGW50+5tu4vUs8+siZWUjPzw0y38B
	 L9GJ4fOnKgQTlKd98CiA0MIkaKj/OGSod24ArB0c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BCA5F805DF; Mon,  1 Jul 2024 14:24:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 543B0F89B87;
	Mon,  1 Jul 2024 14:24:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81CE4F80423; Fri, 28 Jun 2024 11:56:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,EMPTY_MESSAGE,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CE56F800E4
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 11:56:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CE56F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=R4J6GX/q
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-4ef5c772f7bso172082e0c.3
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 02:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719568612; x=1720173412;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RNmB+UpedCg532JlCsKBVA8SRpLlVPtu3AOlQEXhEek=;
        b=R4J6GX/qR66Lq/8hy27r8090PJTFAFYQyf43f8hpMZhfPcwuJqHuWLK6zUiZiHojHI
         FS2n0y3H2jHtTThzgZ1tKZWtmNls8LYY8BFyzH7XARUzfF9DytzjY8mvkJdXvMdYonxY
         IkrwSskD5s/pFcqvkR/tMkpohikY3aKsSn7iuNmUVbFCrtwEF+cwHWoFlvsoKUCCTgGm
         nTLFOnGeVQe+Mfd8ejrPvGC6H1iuRtcf7qpVkAUVAA/3rV6OY5jHVBa/1JVX+eb3yMR3
         gAmQIlFIBPt3Y9y/0jzkYZAnbH9DiBFmCMwvar+tSKcO5Qce0HbF+84QOCvaMvw3J+iQ
         9BIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719568612; x=1720173412;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RNmB+UpedCg532JlCsKBVA8SRpLlVPtu3AOlQEXhEek=;
        b=wMcDmkzoKP5Q8XickHkeZeH2E/6qxHjuYx+/isyc9cSbiqBFEx56Dhj9fgLIVyL9y8
         EUtqq0CMApQiFkNN7zrK19cffFVe1qyDcMlkv7OOTkDa2vVeq3JWeWhoyHBiuuXthVZP
         75uaqKVoPozCsHaXslk2ekDvZtyUFB0iEZQm58Qzbt6daqW2GnOG/dwpMIDeNYThLjaq
         0Uu6tSkLoaolQHIgqqkzgdl71h+YMXo+lu87QdhYcgB5mOAwwIFqQIY91lGtnzbF4MYy
         VlWc83gtwrqDSQrH/HaMMtnewShEtEfNlZHDWmPKHNJVIA7LbU/8wfWy7R148BVQWYW8
         sNXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFxvs0XfV/Kc/zSWcD2NnksGgGOrtakaFfbZvk8Mo9uNDVfzu7xUI76r4AxNNE0ToysxaNGy+tmL1x3cJc53CeNI8dz6J9abUBOjw=
X-Gm-Message-State: AOJu0YzMRggHb4DeT9fdXczfL9NPR8wuBckTaG8PvVgqYc6c8Bsrvp0D
	PJAugDGK5ggP7NvJQoEwIOj3/iDg1IINvHGfafMEI6qDCcNmaQ9/+DJ3PRzvgosJhl1Foa3zHbi
	u41aLgazq8e05Fzes7SZ/ItSR7Rc=
X-Google-Smtp-Source: 
 AGHT+IECgGkPzJ7jrqkK1IdnkK2Szz076qmUCbHfh1HXOoUs4I/SNr/5ik7Gqk0SVv1GQSJVxnOPmZAih30ecRDu660=
X-Received: by 2002:a05:6122:d9a:b0:4ef:58d4:70f2 with SMTP id
 71dfb90a1353d-4ef6d7cf660mr15328324e0c.1.1719568611442; Fri, 28 Jun 2024
 02:56:51 -0700 (PDT)
MIME-Version: 1.0
From: Peter Jennings <peterj76108@gmail.com>
Date: Fri, 28 Jun 2024 03:56:40 -0600
Message-ID: 
 <CACTyByJ6rt5CmzwQYG40paGkT7FFedSTaHxY8_mZSgW4Gtvq6Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: Improve suspend/resume flow in
 fsl_xcvr_trigger()
To: chancel.liu@nxp.com
Cc: Xiubo.Lee@gmail.com, alsa-devel@alsa-project.org, broonie@kernel.org,
	festevam@gmail.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	nicoleotsuka@gmail.com, perex@perex.cz, shengjiu.wang@gmail.com,
	tiwai@suse.com
X-MailFrom: peterj76108@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WJE6IBUSJYOIWSYDVNJEHUU2SPEBL3BH
X-Message-ID-Hash: WJE6IBUSJYOIWSYDVNJEHUU2SPEBL3BH
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:23:58 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WJE6IBUSJYOIWSYDVNJEHUU2SPEBL3BH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQo=
