Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF59916A1C
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 16:18:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ABB9AE8;
	Tue, 25 Jun 2024 16:18:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ABB9AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719325128;
	bh=dNv7RNmIhoI1Vd5UKHN/136wv1r6HCioWcj5Hz4gunM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ek0xm06LqJQZv/npvu+8FDTmXg4oIwMZCxc11ILsituHRBB5/5XFKkI0+oMieL+8n
	 f4V9EoIGEislbXvzB/iKlPgfOnG/RJNFfArAJS5zAulfu3pnj0KCpl8Coo0r3yWEFd
	 968x6414SypG5s5VBUL+pMDCvVqcnPNEva+PJ0MM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2EBCF805AF; Tue, 25 Jun 2024 16:18:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACC40F805B1;
	Tue, 25 Jun 2024 16:18:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FA27F80495; Tue, 25 Jun 2024 16:18:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 977C6F8049C
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 16:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 977C6F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XqobDRqS
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-7163489149eso3378976a12.1
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jun 2024 07:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719325053; x=1719929853;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dNv7RNmIhoI1Vd5UKHN/136wv1r6HCioWcj5Hz4gunM=;
        b=XqobDRqSbhxRJm8bxJPqUHoSR8LPojR5Z1I0DoaFn2oqys8rEz1+ZNCs6PbLszabxf
         U4hq7DZhQ4lGU2y4sabG/0iTDW4sZNdEG6DIliGjO6nuFNNxkVyXwE7eSIKXF7KjsNJQ
         I1CW6qNfr1WQVxowCarr2sPA6wi3pWTFE6+XdhzUj/l1ygpazIPR3d9NSAj8dc2ilXK4
         o0kdAf8XYuclLpfF1l4jk7rWsEJ0kg8hDaAZhuB4o0viYAkhd5Pu9JlR+gVz7MpVQb8S
         afNJ0ZUeq6u9VF13f6LV5i6bLyZe2jYpe7hM5Q9wo72tq4m0Qu68LZaccNdWxtW/HWVI
         iIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719325053; x=1719929853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNv7RNmIhoI1Vd5UKHN/136wv1r6HCioWcj5Hz4gunM=;
        b=mJoCDWEiJd+c104l+2nsmlSKBK7E1EoWNa9jvUiv2ID7WsF/n8t0a5QeVdjAllWn/l
         3HfNEEWeSCxq5xgzW8Pqv8f7sPoBdvxrmPhopRj4utavHBmewxqq7fIJ5w9fAc4Nb8ED
         iV4a5KhjvuIhWJ3dy3+zve3WYa88yrA1CMyNwaC1vtAJm3EeswpHU4WmOngW4MHRqUzi
         aHSXvclq26Bc+Hj5fVk4QOiwlso80GxJINdqPKGTpOoMz75J/Jt6gKJiMhH4YKZu6Gkz
         QdQXF3qKt8y51Wc50gUIgEuWuhYYJWbetQfEF4c0wX4hejaW4pikfjcCHGD+UpEZ9TXE
         kHqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjP/7Jb1xPvalBEfJqJQkSdgT1LVQcLAu2OnV2hx3ogvegD85VxywK+wPQH9bK2phco1tkXkdKCF8YsxybSXshFV+9MhqhEbXrAeY=
X-Gm-Message-State: AOJu0Yyu+Dl2k4J1YSCT2rfxji7rkcXjLyfUT+D16zU+CWdahJdpkPPs
	m/xrqWXPED041uOOMqsoGGJFp7AiowSilbX4D3e96WavgWEz4cLDsAmRn5T4GillKojaVfM4vSc
	B5fMKYd0/MLbZBULI+K90fX2UIgq6qf/ngGE=
X-Google-Smtp-Source: 
 AGHT+IHY7Moi01QIYMw8+dg60IWdW1gG2DDDcZwhJsFqksbTDefj52yE4EiZx3Z6hOL2VBFqe9ICXoFxbyCzGwhsxSE=
X-Received: by 2002:a17:90a:b014:b0:2c2:c61f:e09 with SMTP id
 98e67ed59e1d1-2c8613d204dmr6953843a91.20.1719325053001; Tue, 25 Jun 2024
 07:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240615125457.167844-1-rauty@altlinux.org>
 <2c9ba341bc95d4b9010bf5f8794c0d14b1c57dc9.camel@irl.hu>
 <CAGpJQTHoBAixmxta2WuZfjHjiK9GXF=hkfPyV7PBD5rt9Z_0WA@mail.gmail.com>
 <CAGpJQTGqxEkfp003QLsp-syUgzDFCmHSmNaoOaem0ZMVf7_=bg@mail.gmail.com>
 <c0a9e15e7926e098bdea97a7d31c32427e0910c9.camel@irl.hu>
 <871q4lm9dp.wl-tiwai@suse.de>
 <CAGpJQTFF=gKN2h105dGhBOEhN0Q1Tpj5hJWpSdQ_-nCoUTzj5A@mail.gmail.com>
 <87tthhktdz.wl-tiwai@suse.de> <87sex1kt6t.wl-tiwai@suse.de>
In-Reply-To: <87sex1kt6t.wl-tiwai@suse.de>
From: Rauty <rautyrauty@gmail.com>
Date: Tue, 25 Jun 2024 17:16:56 +0300
Message-ID: 
 <CAGpJQTGR5WKuHUFGFUC286TUkOXYgcqigZRDb4K5deyE9uuz8w@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Enable headset mic on IdeaPad
 330-17IKB 81DM
To: Takashi Iwai <tiwai@suse.de>
Cc: wzhd@ustc.edu, Gergo Koteles <soyer@irl.hu>, alsa-devel@alsa-project.org,
	tiwai@suse.com, perex@perex.cz, kailang@realtek.com,
	sbinding@opensource.cirrus.com, luke@ljones.dev, shenghao-ding@ti.com,
	simont@opensource.cirrus.com, foss@athaariq.my.id, rf@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: XAVK4FVR5DRMB3N4RB4DXAH7J22YWB26
X-Message-ID-Hash: XAVK4FVR5DRMB3N4RB4DXAH7J22YWB26
X-MailFrom: rautyrauty@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XAVK4FVR5DRMB3N4RB4DXAH7J22YWB26/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 25 Jun 2024 at 17:11, Takashi Iwai <tiwai@suse.de> wrote:
> Zihao, do you still have the access to this machine?
> If yes, could you give alsa-info.sh output, or a proc file output?

He sent it to me:
https://alsa-project.org/db/?f=268601dbdb76f9a4c18d71e210091ffed4bf2818
