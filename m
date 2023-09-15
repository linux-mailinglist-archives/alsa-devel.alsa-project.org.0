Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C04BB7A190A
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 10:40:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F8A3DF8;
	Fri, 15 Sep 2023 10:39:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F8A3DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694767205;
	bh=dcJ0YF656Gqyw4TwkIVu38nmGFD+TIOI6rP0TNwnO88=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DmtTKPpPiP8d7zzrO2DsFcb2sz6zvKJYFqV4zPJGBoY1OkuPwcgutUkpl1czg2adL
	 d2HxU+fSRRFGqyM/pHdAUh5G1yIBx1MPGHCULbJnaGI33d8CfxsWef2hUS1RwUx7wJ
	 zosi80R+pQkrFNWP5iFhIOup/Rnss5gtTzPfJelM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBFFBF80552; Fri, 15 Sep 2023 10:39:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B04EF80246;
	Fri, 15 Sep 2023 10:39:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 554F7F80425; Fri, 15 Sep 2023 10:39:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5CA7F8007C
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 10:39:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5CA7F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NJ6e9HSG
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-52bd9ddb741so2313564a12.0
        for <alsa-devel@alsa-project.org>;
 Fri, 15 Sep 2023 01:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694767146; x=1695371946;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcJ0YF656Gqyw4TwkIVu38nmGFD+TIOI6rP0TNwnO88=;
        b=NJ6e9HSGapHpSNS0lZDR3F+P6zYU3ntfGAJOogKh3R8ROf4cmIcI4ugacHyic3N43J
         YSyMR8D+tsOhoHw68wRik4Kb9sD9sma8YfGyaPMn9WHADTBNFlpVmMNqVE8WNAQtZN+D
         li7pLSh14dVl0kgF98z1qT+SYkohwtS+6Z2fMz7dl/kyp+7yO4cCV5BfaxhmZLI6VdJu
         cgv6/k7Bx3MBlk9IsvS/McfndYHs6ycfZ49M4F35vCD4lUyb9PS73RyO6VLsEudiQ3Pc
         KWKIo6YBe3cESr7H0Gqt/ctnv48TWUZLKk3NglVb7vz1o9ALulkpaidGbno0a+o3iHzG
         sxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694767146; x=1695371946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcJ0YF656Gqyw4TwkIVu38nmGFD+TIOI6rP0TNwnO88=;
        b=vb0DGWFQTmrXk0jB3oIEhMFiwd80UsCl6Lu85n2np9NTpNrAx3Dsxl7WbcnOFG76fI
         yhAytdkshZGxUpKSCQucjxdRglO0qAQw72gLkLFaJHOOKGJobvULyixRvG/g9o+XBQVj
         NB4rOMEzpr9WH+sTevsYSMekkWTRYkMzGPUmXP1DiWTDgrPK/yO0OuoXk9XG50U3aLpX
         KZ+lN1IgIZ5HXpdRyMTLI9B9M1cdTX62JM4QboG6rSn6s4ieK0XFoAKm1amesZf32OCA
         W0TG46IoFMwXBjaaNWnJ+o0XA6IfWVF7MirROrM9QzVbsMPaOQ39gnjETGCkPYIrKpaS
         7s/w==
X-Gm-Message-State: AOJu0Yw1yIv3H6sbDb85TGhxZichgr9sQ1wHGhI/NGzzHXTCEb2spcRG
	WWenAkbmgWlVe6waeD8MuLiF9nFPEINKS7pCFL5wMG5S5eQ=
X-Google-Smtp-Source: 
 AGHT+IFqWx5uj2DHjRauIvxPCOhENMc7x02MgQj1RmKhG/d1C1fdZNN3IRf0HXHut2+w8tXTNZoGQcO6LcoXjI6pYko=
X-Received: by 2002:aa7:cd57:0:b0:52d:212d:78e8 with SMTP id
 v23-20020aa7cd57000000b0052d212d78e8mr847795edw.34.1694767146186; Fri, 15 Sep
 2023 01:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <1694757731-18308-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1694757731-18308-1-git-send-email-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 15 Sep 2023 11:38:54 +0300
Message-ID: 
 <CAEnQRZAU01qbeVjcEVnL0emc3ovo+NSs_N5=xUB2fVaswnjVqg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-audmix: Fix return error with devm_clk_get()
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QAL23UXFPOBIZQEG6UI7OQXBHBVQNOLV
X-Message-ID-Hash: QAL23UXFPOBIZQEG6UI7OQXBHBVQNOLV
X-MailFrom: daniel.baluta@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QAL23UXFPOBIZQEG6UI7OQXBHBVQNOLV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 15, 2023 at 9:38=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> The devm_clk_get() can return -EPROBE_DEFER error,
> modify the error code to be -EINVAL is not correct, which
> cause the -EPROBE_DEFER error is not correctly handled.
>
> This patch is to fix the return error code.
>
> Fixes: b86ef5367761 ("ASoC: fsl: Add Audio Mixer machine driver")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
