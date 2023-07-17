Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC3B7562D3
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 14:33:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E071FAEA;
	Mon, 17 Jul 2023 14:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E071FAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689597200;
	bh=EhtKDGLkYdLlMzTZE+T1BryE5vukkd/SRUwBcJXGkYE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F5Z6FiHu/oCbAbMeE4w2dW1swNVHJ0DAiQuvVe6Xa3O2mLSCkzoCNCdiBzAhU97ra
	 S/ggAxtbiC6DV10kInK7K5fh6pmjmE+DlrIuaQgWOvKCOBSovrq390QFCeGk6wcTUl
	 bG4rWEXr9we5tFXrDquCUgTzIZfmYep9rzjgD0GQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C667FF8007E; Mon, 17 Jul 2023 14:32:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24F8AF8032D;
	Mon, 17 Jul 2023 14:32:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9A59F8047D; Mon, 17 Jul 2023 14:32:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38139F8007E
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 14:31:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38139F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=adSle6S4
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-263315da33cso818712a91.0
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jul 2023 05:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689597110; x=1690201910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhtKDGLkYdLlMzTZE+T1BryE5vukkd/SRUwBcJXGkYE=;
        b=adSle6S4qsLISaMws72/D7IY0mwUp/nesW94VNVtbmdc6XDZ7TC6TFQwBCdStwhr3F
         07xlBBvutoTmqDWX/XDMJluLs4bdCB/ow17FqmqN8vaCWz5n7bVCbbsZXfk8EPuCXVwT
         nd1uhYhy2sZin05dMd8A3na86l/KiYqagH6mb/T15SOtsl/FXwRH1E9HSbj31BkFexdX
         WvoQ6LdhwlRT1N3j9KU+98wympgjOrdQ0P0Atno/H2W2OOVjQMKTWy1PF3g5cpOs1pVw
         HUZjoxHjy7yTb5SJf4JvtptbWgVGyLBWKLu0TARWVQ7GwUkoe0YsPdoDm+f1qudH2c3H
         iquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689597110; x=1690201910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhtKDGLkYdLlMzTZE+T1BryE5vukkd/SRUwBcJXGkYE=;
        b=g2SjKX3m7lv2wc6lHtn66+uCJTJJjg9PVUIurzZYKEWE6rnX9soNK+LSyuUCFGSHRd
         R7+NLAsaogKeYolVqIaowuX079YjsRpH4v5IDRceu8//gxixAIm4boyX9kctOIBwxfw6
         2WaLuNuvcH5sfLRuj3PDu2aBow9uJpY1uIjRDjAISFZ5S3QVffLRvFUscHerDxbyrC2z
         JBUwcQnc+FdkfmAXPe6a55qz05AzCV7rp3cHYqhRTMSlLuUrgVTyNlu7khdoUrh28ldR
         Bfu3r0aRcLDfUSPbT0I40uKuryEVvM/kRB2t1IHDhNUr5b5eVp1we6oHw2XxKXTCjKaS
         SgTA==
X-Gm-Message-State: ABy/qLa6gnZvWPTWa+31XlgvD9TwVoZgfRSJ4O9Ba0ERuqIJGNvoVjqQ
	QVB8gdloMnK3TKY+YKDuCM4Pl+PAJy0l0uEdezU=
X-Google-Smtp-Source: 
 APBJJlE88ZKilmPeyPMniQza3GQ3pBQrLfygkPj1jJXbn1/AdXpYoB4MvfL+s0Esgs/EA1CzPEUZ7pYqEn2WGR3dgH4=
X-Received: by 2002:a17:90b:3c43:b0:263:484c:f173 with SMTP id
 pm3-20020a17090b3c4300b00263484cf173mr11550745pjb.2.1689597110032; Mon, 17
 Jul 2023 05:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230712124934.32232-1-matuszpd@gmail.com>
In-Reply-To: <20230712124934.32232-1-matuszpd@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 17 Jul 2023 09:31:38 -0300
Message-ID: 
 <CAOMZO5ATTK7UsTRPTF_7r86WbNmAhtpEphO2u896QqARTk2kpA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Disable bit clock with transmitter
To: Matus Gajdos <matuszpd@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: WGV2YYGODN5AOZI5XCNJIEDSJY4F7H56
X-Message-ID-Hash: WGV2YYGODN5AOZI5XCNJIEDSJY4F7H56
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WGV2YYGODN5AOZI5XCNJIEDSJY4F7H56/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 12, 2023 at 9:53=E2=80=AFAM Matus Gajdos <matuszpd@gmail.com> w=
rote:
>
> Otherwise bit clock remains running writing invalid data to the DAC.
>
> Signed-off-by: Matus Gajdos <matuszpd@gmail.com>

Should this contain a Fixes tag so that it could be backported to
stable kernels?
