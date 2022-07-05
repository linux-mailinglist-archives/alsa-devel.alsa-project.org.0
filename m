Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD7E56792C
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 23:05:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B343A16BA;
	Tue,  5 Jul 2022 23:05:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B343A16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657055153;
	bh=JbckoV+QNGPptjP36PjqECpnvr+9j7ly3hMx2cieoH8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RGmegt0VkJ33xQLo+fO+tXFx6617dhnpVimkL+72PoDA+ubE70pPp69rqXMtYos+i
	 CnE4yP/bNtvhe/4JS9NcyXmcFYftGvJROowTxnZakikDCGHvKuNaPdb7ndnxF0OsAO
	 8gD11sVb3x66tsHqDmEQ3qhgSwQ9a6BjccmHVpAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CE28F804B2;
	Tue,  5 Jul 2022 23:05:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED262F8012A; Tue,  5 Jul 2022 23:05:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 601C8F8012A
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 23:04:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 601C8F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XOF5A6dC"
Received: by mail-ej1-x62c.google.com with SMTP id u12so23711584eja.8
 for <alsa-devel@alsa-project.org>; Tue, 05 Jul 2022 14:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xsDCVa++41WRsgJcRaNP0nRk9zNglrTjlOIi6M6lplg=;
 b=XOF5A6dCni+ZyA8p8TlPz8MUPc21YfwPx7xJuMY/HpC52rpPnKWv5EfVyK67gYyt+u
 yNJPH8CxYcbiC4noI3S8MiQ6J77MlPanIhNHzSDssQDSHUWPdu+BgHPN8n6WRLDU4etu
 Y0djmPEhHSkr5zYGVcodvWy5zoGuM6AA2wKgQxZRJj+rqR3UK7DlXL6X1yXmlCiyCrJE
 AfPwBpZabBtwvofL+TBbsJxH2hsraxFAJqZwoNQOz32bInt8xNhNKHKcJW0cv2eCgwbH
 NLV0fGDkmslmL1e7sb6+U06pcPEjuL6fKlApKB7IWn+1qYj61feMosZ4nkDuswc8m4j/
 0pFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xsDCVa++41WRsgJcRaNP0nRk9zNglrTjlOIi6M6lplg=;
 b=XF/d36OaYA81hRrQt2XVtJ0bGB0T2XiTTv5gpv91qQZXdCvamfn4YPbU/CaXgzlXtv
 1p0Gkotm1w6rh8DmAMHrSG39MjTZ9o8Ms12IQjxOqC3FL1snHFFD1mcdTWAwyiX/PwQo
 q35BfgrJUPvO09whD2w+NAHTNEwp13DL3ZfLYgSqcP2nzlcaAGr0pblfZQM4hCmy2ZKl
 3b5OhyH1nUmJFaQnAVTqGXb7CH+6Uu6uibd+VsXwC1KfZbuj/02ws0ujaLC1tLoojwUn
 KFqjbDMBktZsZv7HbgIZlTn589yFxcVzTSgbmqXD7xHilGjpO2zLiW1SEAj2xtNPl0y5
 1wWg==
X-Gm-Message-State: AJIora902dejj2OF1biV+FDd2fThTPc4hccwmYwwoeBVc0f6kbH/O87I
 cHfaqqY0DXgejjJF6se1McTyPta9pAg/1g==
X-Google-Smtp-Source: AGRyM1vRC15LiW8FGGShUPVfcpOv23sewSq/KWTbXpNcQHbmwubioDrDq1AhZ5YHPF561xVHmSUzpQ==
X-Received: by 2002:a17:906:d54e:b0:726:3709:605a with SMTP id
 cr14-20020a170906d54e00b007263709605amr34558192ejc.424.1657055096474; 
 Tue, 05 Jul 2022 14:04:56 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-3-76.dynamic.telemach.net.
 [213.161.3.76]) by smtp.gmail.com with ESMTPSA id
 d8-20020a056402000800b0043a71c376a2sm3617210edu.33.2022.07.05.14.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 14:04:56 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: (subset) [PATCH v2 0/3] ASoC: sun50i-codec-analog: Internal bias
 support
Date: Tue, 05 Jul 2022 23:04:54 +0200
Message-ID: <1819721.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <YsSl+JOmMpGLK1Xc@sirena.org.uk>
References: <20220621035452.60272-1-samuel@sholland.org>
 <3139722.aV6nBDHxoP@kista> <YsSl+JOmMpGLK1Xc@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, arnaud.ferraris@collabora.com,
 alsa-devel@alsa-project.org, samuel@sholland.org, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, mripard@kernel.org, wens@csie.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne torek, 05. julij 2022 ob 22:58:32 CEST je Mark Brown napisal(a):
> On Tue, Jul 05, 2022 at 10:12:56PM +0200, Jernej =C5=A0krabec wrote:
> > Dne ponedeljek, 27. junij 2022 ob 22:46:30 CEST je Mark Brown napisal(a=
):
> > > On Mon, 20 Jun 2022 22:54:49 -0500, Samuel Holland wrote:
> > >=20
> > > [1/3] ASoC: dt-bindings: sun50i-codec: Add binding for internal bias
> > >=20
> > >       commit: 24e0b04dd42be34ec4b18dc1a1e139d66eb572a3
> > >=20
> > > [2/3] ASoC: sun50i-codec-analog: Add support for internal bias
> > >=20
> > >       commit: 25ae1a04da0d32c22db0b018e5668129b91fa104
> >=20
> > Can you also take patch 3? You picked bindings change, so it's easiest =
if
> > DT change goes through your tree too.
>=20
> I can if the sunxi maintainers like, but normally changes to the DTs go
> via the platform tree.

I am sunxi maintainer. Wouldn't my branch generate warnings, if I have only=
 DT=20
changes but not bindings?

Best regards,
Jernej


