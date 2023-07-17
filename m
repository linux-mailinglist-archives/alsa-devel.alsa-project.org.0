Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEB07563A4
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 14:59:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 241D7DEC;
	Mon, 17 Jul 2023 14:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 241D7DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689598763;
	bh=yxuqeyRLaGsgNS7cAk/VqAg+8wOCZMSgEI8rvm938k4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y52TMjHCOc1U3bIfn0GkexwmodlMtzctuBdq1T4Wb45l9whnkTiYBuWYpmsmLp4yX
	 CUrflqDNn1lfw3qlSzUeqaYBOJn8Jq4KLCzgnPxyQcectTLzXTCQyrs/60P3ZEzH2X
	 umiOzCIAmp6DZbfQrPX21fc3+ff1zqcoCTzelLeU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FD6FF80535; Mon, 17 Jul 2023 14:58:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89293F8032D;
	Mon, 17 Jul 2023 14:58:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 958FFF8047D; Mon, 17 Jul 2023 14:58:07 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 547DAF800D2
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 14:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 547DAF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=C4sMqbtn
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-682b1768a0bso1184385b3a.0
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jul 2023 05:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689598682; x=1692190682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxuqeyRLaGsgNS7cAk/VqAg+8wOCZMSgEI8rvm938k4=;
        b=C4sMqbtnpXDlshts60r/+0Ez4QLa3NwxAmYEzemv8uCYxfBgYZkk3It9ABO4G4/HZL
         ZqJTnfu5Tj/VntYxD43FFdUgweGRwV82HJwLKJGCN7oHVvWpDYNF3CSkp3OJ3iO4MxoM
         9u9kod6Pc2YAEZmirmWjjP5Pe3WupvJHsRS6/JUYtA1c4RBlgF/GTGq2YSIW4VQObMF/
         iaKu7cO7YGhaU2Jf2YNViewo/iR+0/RKxGj6BrHrAYyFKS+qoX9oluTXCVY1hNq4aw/h
         JH2OjUjktf3FTNrICRRUQhscQvDRfnf9S0ro9mh8daFPCLJ5ODEGnTgd8Wxg3cRjxOGj
         kJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689598682; x=1692190682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxuqeyRLaGsgNS7cAk/VqAg+8wOCZMSgEI8rvm938k4=;
        b=C33CqeQMbWhALnJjRFHlYr2diKqzchD7yG1+Dd+SW6CqDBDFGrY/Hl5jHOZ04i1Iqc
         6trcc0Qre7FOUlMk52fG8CahtOVLZKXgGSR+IJpx9T7MGSCiJyr0zpe3XocvpuTi1smx
         1v6FYYyMg3Twt1ywqltSBUxDA8dTYS8FRFbztlsYB1/BYC0W+XiFf0TtZiyEPArBdqVw
         7DeAkuW0yDGQ/I4GR/1YmDC3cTuY/vEEmqSk4DOWg7TNJOuGtZQL9tj5xti1+pe+kR6f
         cHJSqdd4+oI5ykvi2NmlHRHXSsCnYauU5AgvJyaN4FzxCM6lY7xrSbwdxtfZ0iDLryxU
         499A==
X-Gm-Message-State: ABy/qLZjRhY30CwlY85dBSC11q/08qEtP7zpLFDiKFLTwtLIz0dl5d7g
	1XltPl9DVO4lcRC57GVGG+nIAfK1uAUjmyaDxkU=
X-Google-Smtp-Source: 
 APBJJlE+HoutIK0nYRGucBoutTN8r7cbUC50Qgs0XXpYoXMdjkD2MMidht1fWvrtSMB3N9kLad/8McQYvSeOZVpSZLI=
X-Received: by 2002:a05:6a21:998b:b0:133:6e3d:68cd with SMTP id
 ve11-20020a056a21998b00b001336e3d68cdmr9189787pzb.3.1689598681751; Mon, 17
 Jul 2023 05:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230712124934.32232-1-matuszpd@gmail.com>
 <CAOMZO5ATTK7UsTRPTF_7r86WbNmAhtpEphO2u896QqARTk2kpA@mail.gmail.com>
 <d2cbf249-32e1-4e19-8362-7087d6b7d3d8@sirena.org.uk>
In-Reply-To: <d2cbf249-32e1-4e19-8362-7087d6b7d3d8@sirena.org.uk>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 17 Jul 2023 09:57:50 -0300
Message-ID: 
 <CAOMZO5A6YrUX58VwZtbzOV6UBsvE+AF3U5i8_Vr2E_VOb49zKw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Disable bit clock with transmitter
To: Mark Brown <broonie@kernel.org>
Cc: Matus Gajdos <matuszpd@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: A5XQSJTBABLJU4XGHILPUWHV3ZSTH7EJ
X-Message-ID-Hash: A5XQSJTBABLJU4XGHILPUWHV3ZSTH7EJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A5XQSJTBABLJU4XGHILPUWHV3ZSTH7EJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 17, 2023 at 9:55=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:

> I'll just put a non-specific Cc stable tag on it, that should be enough
> to get it backported.

Sounds good. Thanks, Mark.
