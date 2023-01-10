Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E5566388E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 06:25:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32F3DCFAA;
	Tue, 10 Jan 2023 06:24:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32F3DCFAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673328311;
	bh=owWx00G6JLlh0EGsUNHTjp0+l+XIqpPfiyv0opZQz8Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pdo3gHlOx8ZxVmhOI0xSpRV15eTkdv0ZA3pA/GezHaYC/3PGe3KT3Ej/RQaRERK37
	 MrNr07deI/03LbmeRii0bdUO3RoH4vzXlz5sDHvyfeov44zCbjgO4Y9M/fo95xNqVF
	 EaRm+k8VD03X5SuprgH8QvbiJI6gS9PCiHjAIAds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEDCDF80539;
	Tue, 10 Jan 2023 06:24:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C23FBF804DD; Tue, 10 Jan 2023 06:24:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E478F804CA
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 06:24:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E478F804CA
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MiQzMifB
Received: by mail-wm1-x331.google.com with SMTP id
 p3-20020a05600c1d8300b003d9ee5f125bso4410738wms.4
 for <alsa-devel@alsa-project.org>; Mon, 09 Jan 2023 21:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A3cDpS6/3dC49msHBZYpxYzKA6JfiV17XYL7gmQpytQ=;
 b=MiQzMifByEhjYfvHPnYXTL9VdIEuTRGD/zGFzV1g6cqOFt1Wrl1x5iwIVgq6kmelpe
 Z9UqO1Cn0gyfyGSCuLrAXqNQdj7RblKKCgZS93cKEd6u9dY+TeuRyS/AoqiShiSJndEn
 sAqYa0PQb0teSBcP0jMOj5ILlbsED7grNDJwPxcck8rs0wKkBkIUa9x4W3ZUQQiIos5i
 lYQAzJ9gvzyq6Welu6vVWf4EWuGisnp1oIqv2fbGbvv3NbEEfDw6zdWXPfXOaIk+zPKH
 3T7ueOm/9c8+jx8+xtaV0Z3UFaI+OJzF38PEA6Il/dofXAqu+Cr3p3MgkXZmaYq6fhzi
 9O5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A3cDpS6/3dC49msHBZYpxYzKA6JfiV17XYL7gmQpytQ=;
 b=kwRlKqoDMAJ+8flhq+AP0RZN9wNYb541wenzf9G+YMxnE93cH6niGHeRurudEd38MI
 z2ne8ETGiNRRzAuLo0xRDuaxlaxhD8H/knjnOHIqI7IpYTtWWbPAWntq++KdWPR9n00+
 0Mk5e5K6slSUOdn6GAG0JU9YZyU/LSAALXi0LBJ0/IKbzgLhrUb/HTGhPWFOcz7PmNxh
 lyVUPFQB0OaCDvPaZtZ1BvnrCsg/Nqi6KjvSuQOwy+YHFmNhFSutrs2QERjq4lvdIYbY
 CHLKc1B7l5uenWxVQpQwvW9zbOKXskU6qq4TEUNenYTCXs6PuwWqjxXYtCD3bbvHrZes
 UUAA==
X-Gm-Message-State: AFqh2krJ27caeRE0nsMZZU7VYORV2P0r1mdfr0dx1wpsIqgPznFjOREV
 7ksh6oTwtI0T4gztEN1hLpDXCjl/VgjK6cJY0VU=
X-Google-Smtp-Source: AMrXdXt3r2rH7m6hmK0voOMCDInxlccQWIH6kZLRCDj0/wiDxpoMr1L0GdQSTQHXs7GVxQrtfOiv6GrYPJ1wOeqNHck=
X-Received: by 2002:a05:600c:255:b0:3d0:a5e0:db7e with SMTP id
 21-20020a05600c025500b003d0a5e0db7emr2711486wmj.21.1673328252071; Mon, 09 Jan
 2023 21:24:12 -0800 (PST)
MIME-Version: 1.0
References: <20230106-asoc-udoo-probe-v1-0-a5d7469d4f67@kernel.org>
In-Reply-To: <20230106-asoc-udoo-probe-v1-0-a5d7469d4f67@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 10 Jan 2023 13:24:00 +0800
Message-ID: <CAA+D8APPw46=LL6VfFc+kTZ49GYJW4DBzgGu3P5tNmcGuiefAg@mail.gmail.com>
Subject: Re: [PATCH 0/2] ASoC: fsl: Fix fsl-asoc-card AC'97 support
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sat, Jan 7, 2023 at 7:16 AM Mark Brown <broonie@kernel.org> wrote:

> The generic driver for Freescale cards with ASRC does not so far as I
> can tell work for AC'97 cards, it's certainly not working for the two
> Udoo boards I have that use it and I'm not clear how it ever worked.
> These patches fix the card well enough to probe and make it through
> pcm-test for playback at standard rates, though there are still issues
> with capture and some playback configurations getting confused about
> constraints.
>
> To: Shengjiu Wang <shengjiu.wang@gmail.com>
> To: Xiubo Li <Xiubo.Lee@gmail.com>
> To: Fabio Estevam <festevam@gmail.com>
> To: Nicolin Chen <nicoleotsuka@gmail.com>
> To: Liam Girdwood <lgirdwood@gmail.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Mark Brown <broonie@kernel.org>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang shengjiu

>
> ---
> Mark Brown (2):
>       ASoC: fsl_ssi: Rename AC'97 streams to avoid collisions with AC'97
> CODEC
>       ASoC: fsl-asoc-card: Fix naming of AC'97 CODEC widgets
>
>  sound/soc/fsl/fsl-asoc-card.c | 8 ++++----
>  sound/soc/fsl/fsl_ssi.c       | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> ---
> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
> change-id: 20230106-asoc-udoo-probe-54daa107cbcb
>
> Best regards,
> --
> Mark Brown <broonie@kernel.org>
>
