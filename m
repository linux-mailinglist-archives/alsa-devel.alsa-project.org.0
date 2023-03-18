Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BD36BFC82
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Mar 2023 20:50:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BFD5A4B;
	Sat, 18 Mar 2023 20:49:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BFD5A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679169042;
	bh=uX6S0FNdTzjwWKpCBlJoVupaWcGlsnetwBHy2J6OqEQ=;
	h=References:In-Reply-To:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=vC5xvs+bFoRoMLH0dy+GvyVnroW6+OAXt3oia5n9T3hGRoanWohceCNx++rypmDxm
	 PRvFzhtuDoZp1Z1ZER1f7oNq4WSOCPtYuM1wsIRdF8XNcB1VXF9IFMOFs1YH281S2Q
	 FgedH2xGbjL3vfn14sQwxQ4Zq/RdWgC/QZigFpQw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D16A9F8032D;
	Sat, 18 Mar 2023 20:49:51 +0100 (CET)
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-115-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-115-u.kleine-koenig@pengutronix.de>
Date: Sat, 18 Mar 2023 20:49:26 +0100
Subject: Re: [PATCH 114/173] ASoC: meson: aiu: Convert to platform remove
 callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UARYHMDYBRHTFCRP6KBAU3VJRLUEJEJS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167916899047.26.11822562327794584912@mailman-core.alsa-project.org>
From: Martin Blumenstingl via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 kernel@pengutronix.de
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB833F80423; Sat, 18 Mar 2023 20:49:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B62AF80093
	for <alsa-devel@alsa-project.org>; Sat, 18 Mar 2023 20:49:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B62AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=h44zN9mf
Received: by mail-ed1-x52f.google.com with SMTP id eh3so32614177edb.11
        for <alsa-devel@alsa-project.org>;
 Sat, 18 Mar 2023 12:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679168977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfKEdToulTysU+esB/uzX0ZdOPt4WxM4XvZcXLSv8yI=;
        b=h44zN9mfuQCQ1MCRoGXU733OfMvosfWJNB5WeGSImPRPMd2gLaeogSMp/1d89BkGKf
         AiZOf66WFbG6ueLE6YgoQGKVqDUfqrANREbe2FZevWLsvejp/hiIetyUG29SEM3Iq9PE
         8vvVfciVvpmUEL2f8kcIQ6WIAsMCjtOR65p9covW44bODJ2iCT3X/3wL2my+tw8mTQdl
         sS/FY0j9jXrFM4DnRVPVggzbCZrFtyY2ojeeR6AjVscfvbgdB1DxSorY+Nf1iyG95IEZ
         WcNTMkIxRiMyZNFocsZm2kWlrmW8EchnwQuJonSaPYWoyfgEeVr9gRThEm96oaE+CkgA
         BR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679168977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfKEdToulTysU+esB/uzX0ZdOPt4WxM4XvZcXLSv8yI=;
        b=KXCPoS82irrfhyOTjqK6TUqs6E8n30FtXHcHO3b+gnM//+nFgCU0NQLXblzImRH2YT
         Yu5euRyz7cBMilZrNnGxTsL/3mvRk34odbIREw4tzMUL5HmGiGavl3bOypAbbiGQUi6/
         Wvga3nfmwTGFFamfiaIS+Rw6N7Lls8ei7YPBe7RuSOFsy+851cQU5FOdo+DNlXy8Vead
         Lk1m9SGOhQ18eynGL8ni2MeZGwDlOIBR8GlcWvGSrxcUV2IXOBrB9eYQOC32AgRXsrpe
         0sDVnK+G4RKXsFG4noqQdSg2U38Q9/bMk06jfi58+yK2J2oQ8B9Vmcria2wi1HCmi1Do
         f2jA==
X-Gm-Message-State: AO0yUKXp1C4f0UoCWvmS5cMNPxSJE6KqHabyiZp/XGv1K98jhcFGX2Yr
	2Li2InE+4IXB4CzooTItasUBa51dyucmOJ5y/qU=
X-Google-Smtp-Source: 
 AK7set9FqByvnQcoOHVr+gpZ+4mRtJ68Gkcw8mLsonHmM2IOgcrO+SZRKC6k1sPDJiihys/dRZPlZmAma/+Ti3I8xyw=
X-Received: by 2002:a17:906:fca8:b0:92f:cbfe:1635 with SMTP id
 qw8-20020a170906fca800b0092fcbfe1635mr1773569ejb.6.1679168977495; Sat, 18 Mar
 2023 12:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-115-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-115-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 18 Mar 2023 20:49:26 +0100
Message-ID: 
 <CAFBinCA49o8U=7M+AJF+ik=x87QhmJC7a1pcASdf+-A1Qi2=Zw@mail.gmail.com>
Subject: Re: [PATCH 114/173] ASoC: meson: aiu: Convert to platform remove
 callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: UARYHMDYBRHTFCRP6KBAU3VJRLUEJEJS
X-Message-ID-Hash: UARYHMDYBRHTFCRP6KBAU3VJRLUEJEJS
X-MailFrom: martin.blumenstingl@googlemail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UARYHMDYBRHTFCRP6KBAU3VJRLUEJEJS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 15, 2023 at 4:08=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
