Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC267B3F1D
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:16:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7C0114FE;
	Sat, 30 Sep 2023 10:15:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7C0114FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061769;
	bh=htUMLXBwGzCmqnn/jhKcICHzfSrtMs/y4VwU6/1oxh4=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NWOrJjyx4lKhwVb6d2S4vtrdDKboflpxlQRTUG0Vhpq7hpnw9SA+6K1JwPTFXrGhM
	 4PuUw9K3PChlvDt3SbcWZw4zEonn0Vi4cfg+iDT7wQotpd2j2ouPBg5EKm4sQtnfJv
	 n5MhYCGL4xu/IWt4c6Vz/R41rTpHxW8DTg+4Qt8A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78156F80619; Sat, 30 Sep 2023 10:12:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B17F9F805ED;
	Sat, 30 Sep 2023 10:12:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64012F801D5; Fri, 29 Sep 2023 14:44:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB7C9F80166
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 14:44:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB7C9F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=nezMrglp
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-53447d0241eso11125578a12.3
        for <alsa-devel@alsa-project.org>;
 Fri, 29 Sep 2023 05:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695991488; x=1696596288;
 darn=alsa-project.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILOYUpT4AgK5q+nU5tn+arMEdwkeAfGQJWwyqox7rq4=;
        b=nezMrglpXT+HZXKV5wiaDhwhzm+0A1J/WDW263ZzkalW3p4s2Nf+o70uh+5HZbKDZX
         2XmbhTmivJ6UX9XLM2rup2En+6U8vAQGiR953b2TJv9X13B4QWAz30N+SN7IKInFNDJE
         KkeH1qLvQF8qPzhDQWrfpGQtDqTPT0IPlOiUh/5TT21LD1bRhz057p+zHq9jWJG4XZBC
         pKNmkXNY0IwYdByn0S4azz46Kd8LA0cnsacIRtQAjA8Ml+ziZVbb2E1bEJCUkxt+hP8u
         LFgjOrL0BDUkIM6kZZTEfCHN6g1NbbsDZ/53hoLhRHR9gkbhNRK2/Ld3ZlkPV3tquB9a
         tKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695991488; x=1696596288;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ILOYUpT4AgK5q+nU5tn+arMEdwkeAfGQJWwyqox7rq4=;
        b=KtcyosIOWyIHJheeN+F2dkVvJARldQx/MiDJQi5JtLOq9LgcNzaRhH32AjuZh0cbD7
         qlCBZYQGVgJ5WEqm7X2hVvHBO87AuLJk3Qm+cqZCD4ME9Qm5PvfeoXRKlbVlsxs36CTU
         ypJNay4stnjeIO0U1jlAaH/umSPWqDrA7lQBGawNrLLueXIFzB2cCoyY6xNIe4XkOxYR
         23tGNVfmwscZwL0W21uGwH87WftrgXjOPlZSRI0lzlJEjiWEmASdPBV5jTmnuf7nnDcD
         nxoqG+TU9hJYoFpSCCDP+k1k788af6DvnuMCg3XYqd/WjPbpqTddeKEK8/InfbCDMeEl
         Aw4A==
X-Gm-Message-State: AOJu0YxW7XyNNK9jSrkWwWcjlHx4rXkH6O0690Baj8CRK8NOOciUy7dG
	OhDxLZfYnHsMaZp2Py/AY9n+Tg==
X-Google-Smtp-Source: 
 AGHT+IH1568r9Fn3T/Uv2fQlT+CxZWy39xXf/j68AARuzWrDFj9gD9phmENKFlb7+fy84sFn1vxa6Q==
X-Received: by 2002:a17:907:2e01:b0:9a5:9038:b1e7 with SMTP id
 ig1-20020a1709072e0100b009a59038b1e7mr3479950ejc.36.1695991487947;
        Fri, 29 Sep 2023 05:44:47 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id
 q6-20020a1709060e4600b0099bd6026f45sm12233886eji.198.2023.09.29.05.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 05:44:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Sep 2023 14:44:47 +0200
Message-Id: <CVVET1A2CO26.3O47662JKAL6@otso>
To: "Mark Brown" <broonie@kernel.org>
Cc: "Weidong Wang" <wangweidong.a@awinic.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC] ASoC: codecs: aw88261: Remove non-existing reset
 gpio
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.15.2
References: <20230929-aw88261-reset-v1-1-fcbce194a823@fairphone.com>
 <ZRbDW3OiAYyAkWgN@finisterre.sirena.org.uk>
In-Reply-To: <ZRbDW3OiAYyAkWgN@finisterre.sirena.org.uk>
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: H6OVBQ2WCJSPXZRC32IQ4WDRSZ7PBSB7
X-Message-ID-Hash: H6OVBQ2WCJSPXZRC32IQ4WDRSZ7PBSB7
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:11:57 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H6OVBQ2WCJSPXZRC32IQ4WDRSZ7PBSB7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri Sep 29, 2023 at 2:30 PM CEST, Mark Brown wrote:
> On Fri, Sep 29, 2023 at 12:28:10PM +0200, Luca Weiss wrote:
> > According to the AW88261 datasheet (V1.1) and device schematics I have
> > access to, there is no reset gpio present on the AW88261. Remove it.
>
> That looks to be the case according to
>
>    https://doc.awinic.com/doc/20230609wm/c815e155-60b7-40fb-889b-676b02e6=
7d0a.pdf

Nice to see the doc is also available there. Seems it only shows up on
the site search but not with Google

  https://www.awinic.com/en/search/all?titleSearch=3DAW88261

>
> (which is v1.5 FWIW), Weidong?
>
> > In case this looks okay, also to the driver author at Awinic, the
> > binding doc also needs to be updated to include this change and not
> > require (or even allow) the reset-gpios anymore.
>
> It would be easier to just send the proper patch to start off with, no
> need to resend if the change is confirmed...

Unfortunately the dt binding is a bit trickier to update since it's made
for both AW88261 and AW88395.

After spending a bit of time using non-Google search machines (Google
seems incapable of finding anything there) I found a datasheet for
AW88395 and that does appear to have a RSTN "Active low hardware reset"
pin so we should not remove that one.

Probably it's easier to separate the two dt bindings then, instead of
trying to keep them together?

Regards
Luca
