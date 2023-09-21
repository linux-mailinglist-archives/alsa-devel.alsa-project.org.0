Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA31E7A9503
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 16:01:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8613DF0;
	Thu, 21 Sep 2023 16:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8613DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695304892;
	bh=Tc23TH0KdG9d7oJL/fNpMbI3CeGhcYjMRjPeLFllkb4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pAKtTlGM1Qh15glMg2XVQAVpclRMrY4D5tmXIW/ubEAxNBPQkJuoMzN5Z3XnK5A6N
	 hJxAPbOCkXC9js3b+bjrFWHU4XF0ZOsjpNMg+WsMXLAdaVlI5AQ47wCsfcp/adH447
	 XmrR7RV9iA5uU8VxhPDxjoUY+zULTT9z74UoBc/I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 689E3F80494; Thu, 21 Sep 2023 16:00:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC703F8025A;
	Thu, 21 Sep 2023 16:00:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A8AEF8025A; Thu, 21 Sep 2023 16:00:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E604F80125
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 16:00:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E604F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j4W6k51I
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-55b5a37acb6so99906a12.0
        for <alsa-devel@alsa-project.org>;
 Thu, 21 Sep 2023 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695304831; x=1695909631;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tc23TH0KdG9d7oJL/fNpMbI3CeGhcYjMRjPeLFllkb4=;
        b=j4W6k51IIr14xR1AfFNiQ2Qmz9BLLmXWbcyEdBuZLt4Pyay+13zUzxJatiDSnjq/uR
         kLQda9s8nSCBcITwsdYkvgIbr+HbtvBOJtAOSmv01F7NQf48gihOU6puzOb7oL9WEOI0
         C5skQs0JdoKMwuYzwp6Bnvrqz3E8mUvVK3E9/vNErbALuOWj82LqwPnfbIAfska8E3XQ
         gGFS58QssWtC019y4XB8xzFs2x8UXc715HCtP01ypafvAPJDxsCp2B+DS44sWo0bfKS4
         xSZV0W7KNVPpJOaI3pgJSEnDxCPAd5TTQKdDVKoAxahFgtknK5HL87YD+I+I3lwEMfGg
         pysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695304831; x=1695909631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tc23TH0KdG9d7oJL/fNpMbI3CeGhcYjMRjPeLFllkb4=;
        b=TVV32vsZdiqi6yLWWArbPnNqlf9kW0g1oa3I9Gx48hWYrZGRw6r+0QqkK9YfbO0PwA
         aBhgBX/3xfLp1P9cQJBYZfR37L16IG+XJ+vMKJaP/p8/FxpVD7KC1sC0Wc5c3PjEWNEH
         ABLhnm3UV4gdBy62rxYgHn9APR3C97wXBBRl9aYxeeS5dGt8A32TLh2h42cVLOosoSSN
         9H3SUiyM0PQ7XoDza+AnUEkTlbsqjFHQqzgkjDu2qHoU2zEiGTD0WfybTmnifsCsavaO
         xrx9vWmjdITzZTTcmGGI7UJvp0QyOggWC1Zkbnq+0gZ6ZW3fqLl3AfaRyTVOH/QClDvc
         V97g==
X-Gm-Message-State: AOJu0Yx2a3+KAfx4vBKVwdsfjHg7e2HJLhPSIxqFlhoA24gLVrpqXdaC
	YUaBwQjCVdXnbEWrHnvYtCVkDKDhzvXn5uKE+kA=
X-Google-Smtp-Source: 
 AGHT+IFhRwDvm/yyhVcWlHi6I3H4gEl8VRUEkcWr8N8SNVEqUHsIKOIva4COX9kmaaCRUgrPCfUAVQ4pAN/e6dsvzV4=
X-Received: by 2002:a05:6a21:339e:b0:145:3bd9:1377 with SMTP id
 yy30-20020a056a21339e00b001453bd91377mr6044154pzb.5.1695304831383; Thu, 21
 Sep 2023 07:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230921084808.840381-1-emas@bang-olufsen.dk>
In-Reply-To: <20230921084808.840381-1-emas@bang-olufsen.dk>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 21 Sep 2023 11:00:20 -0300
Message-ID: 
 <CAOMZO5B2L4OxtDTcUhn_w3K5zimDMOFB--DVL_d6TjeBjD5VUQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: sw reset consumer on pause/stop
To: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	Matus Gajdos <matuszpd@gmail.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HJSU6NBUTYDJBDDLXM3ACA7M5I4QTZWC
X-Message-ID-Hash: HJSU6NBUTYDJBDDLXM3ACA7M5I4QTZWC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HJSU6NBUTYDJBDDLXM3ACA7M5I4QTZWC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 21, 2023 at 5:48=E2=80=AFAM Emil Abildgaard Svendsen
<EMAS@bang-olufsen.dk> wrote:
>
> When in consumer mode with BCLK disabled (FSL_SAI_CSR_BCE =3D 0) the
> FIFO's can still contain data when resumed. It might also be possible
> with BCLK enabled but just less likely.
>
> When the FIFO's still contain data on resume it can cause channel
> shifting on e.g. XRUNS. A Software Reset will reset the FIFO's and make
> sure channels are aligned.
>
> Fixes: 269f399dc19f ("ASoC: fsl_sai: Disable bit clock with transmitter")
> Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
