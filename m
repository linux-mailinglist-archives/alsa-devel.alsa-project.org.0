Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E10774A67C
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 00:01:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC6903E7;
	Fri,  7 Jul 2023 00:00:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC6903E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688680903;
	bh=8F/Vz/JYKZUR7Pz5q1oBdNBG9fKmk/mb5bJHRVCY9Kw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CXaUNDt1FOIb7Z/sOfdJCr9cmGzfvnlooCDiGN+xEGdi+WDhSBNnhPgYELRIx2W/r
	 fqQkpOtxaORNQy9mISFdYZwx9cnxcd3lLVpwo3AxtRNpHjjy+QZDcLQlshmS8PF4+E
	 fDpKNB6Fv+6cGO8lZrdl2OjNK3bPhTu9YZiI0vs0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECCCAF8053B; Fri,  7 Jul 2023 00:00:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20907F80124;
	Fri,  7 Jul 2023 00:00:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BFF4F80125; Fri,  7 Jul 2023 00:00:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88BFCF80100
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 00:00:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88BFCF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=htCzr6cI
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-682a5465e9eso199995b3a.1
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 15:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688680828; x=1691272828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8F/Vz/JYKZUR7Pz5q1oBdNBG9fKmk/mb5bJHRVCY9Kw=;
        b=htCzr6cIPX9PDnqhu74yLiUYcdYliDEsN3nu1sZBVzcxA52VvBHGtrlzn3uM5hb5UG
         5FJcswVJm5ZYNNYJjq9yjJgREKDS33htkOsq3JI3QSs23+XL1N8OWd5o1BL7U9mHT5CT
         F3nPs4NO9SocDJviSKIETlxQdjxgMhTPdcn0IYLOzfQTPWmn17kildwyS3oZZhJ6h9AS
         v1K3bWCk7Fu1Se2LcqyPawcFmPyB0zuoAkRI535bUz43LYeo4GYIsAm9ocJNI+M0r0K4
         J4I8N7PoGhWSihFHkUcfs+/U7u2x3ROb468rxy4IOk9g4iors7yy1e/0ePUzofbcQXxd
         4K+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688680828; x=1691272828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8F/Vz/JYKZUR7Pz5q1oBdNBG9fKmk/mb5bJHRVCY9Kw=;
        b=UufNtV8knavmurAKlTx7wRJ02d8nJfbSteEO+gJno67lJHyE0Dr9wmP8tJwYzCGGNn
         23XRxTs+uduljT+0Plbl/zcKFK29ushrsrQLXZenexWceetQ9zxgmBXYrsNiaqfA4cnL
         mClBL67riMeHnqHqd2b3+5hliT2hY7wF7rVwfUejGkvK9xOc4QSqqfZtUTjuh9ZFR+ai
         mLXMueaDdJfUZ+WpQ2UJf5QvIKstJIDqqpiwiE7IOfpTGrrK19NXE7dkm5jkZNfocDGR
         uF2R7EdlvnbVSNJdVahXHY7t4S0bt5Q9VNxq6/y6H2k0YxyBwnEi5V0E6hWoKxqCW7/i
         OkQg==
X-Gm-Message-State: ABy/qLYr9qo4HEstnNFx6B73PFEDTQ5sw8niSecewG5KwyLxdV6jI/v2
	9aVIQuHm31qhKS85+IfC5DJ7hgQl0RYriFJoRSE=
X-Google-Smtp-Source: 
 APBJJlEiE2PjbiYsEKl3M8g1bnilSPcnnFTyA3koOOaWRTk6CKBXAXx6b56t8c9U+73ojunwVjmr/nE0y5iBpAM8Sj8=
X-Received: by 2002:a05:6a00:39a1:b0:67d:308b:97ef with SMTP id
 fi33-20020a056a0039a100b0067d308b97efmr3169625pfb.2.1688680827849; Thu, 06
 Jul 2023 15:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
 <20230706084706.bzwsbi3zisx5m5rl@fatal.se>
 <CAOMZO5CCdaodWQrHUQgMizoES=jfEtw-sNJZG-DJMpRD8tZW9g@mail.gmail.com>
 <CAA+D8ANAg7bs0A35c7Af3_-5sLaqvT1RoKfCbzYi=z=t_q9LUw@mail.gmail.com>
In-Reply-To: 
 <CAA+D8ANAg7bs0A35c7Af3_-5sLaqvT1RoKfCbzYi=z=t_q9LUw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 6 Jul 2023 19:00:14 -0300
Message-ID: 
 <CAOMZO5D_1cjZVpMvRrtcEGupAUn3EVU_G-p0Ju9gC2TaJh8G9A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Andreas Henriksson <andreas@fatal.se>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	=?UTF-8?Q?Hans_S=C3=B6derlund?= <hans.soderlund@realbit.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 7RE75XZBW6XTLGTCYZIRDWDQIZCBIXSM
X-Message-ID-Hash: 7RE75XZBW6XTLGTCYZIRDWDQIZCBIXSM
X-MailFrom: festevam@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7RE75XZBW6XTLGTCYZIRDWDQIZCBIXSM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 6, 2023 at 8:19=E2=80=AFAM Shengjiu Wang <shengjiu.wang@gmail.c=
om> wrote:

> The clean way for fixing is to remove the code in fsl_sai_set_bclk()
> and add "fsl,sai-mclk-direction-output;" property in dts for some
> node.

Yes, after thinking more about it, I agree.

So what you are proposing is basically a revert of the patch in
Subject and I assume that the
reason you did the original patch was that you missed passing
fsl,sai-mclk-direction-output in DT.

I will send the revert.

Thanks
