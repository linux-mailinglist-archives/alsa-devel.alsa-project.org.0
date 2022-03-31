Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D13F74EE2D0
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 22:45:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7246D18DE;
	Thu, 31 Mar 2022 22:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7246D18DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648759552;
	bh=Iaf2xkyeMRIggqdjNvujpO57+DQT1YTkiSERIlFe1CU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jV+3j/K/debztENsYLE6aA0uKU+kY8jMlKdd/ohY3kIaNHXVflGqBni6xBJpx2VJl
	 45gR1Nrc18g40vaUN6sZyFpTcqDz6iIGJm8TdK7CZrlp3Uya0dLBhTyPHa0v/jRXGM
	 pZTrSRzeGgXiYbrPWW6e74GxhnV8SL4XznvhwrgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2453F800B8;
	Thu, 31 Mar 2022 22:44:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C616FF80227; Thu, 31 Mar 2022 22:44:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9DE7F800B8
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 22:44:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9DE7F800B8
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M6lUk-1ney8T40Tu-008Nmq for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022
 22:44:35 +0200
Received: by mail-wm1-f44.google.com with SMTP id n35so500261wms.5
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 13:44:35 -0700 (PDT)
X-Gm-Message-State: AOAM5339kY7e9wtpTZfH9GDKbd2+LnQrLlnkGzRll3MdGc7dytQJuTpE
 Yhg6RRe39Q60mxzwwYBkdS2/ic51GMkEfg6g0kk=
X-Google-Smtp-Source: ABdhPJyFeJUAUK6GAZ/NhueIXRM9Oewyb4HUoVhUwi2uLC9MSZns5oEWdhfhtv0wykqSw0IptauyUmpRy+Fn8YuUnQE=
X-Received: by 2002:a05:600c:4e11:b0:38c:bd19:e72c with SMTP id
 b17-20020a05600c4e1100b0038cbd19e72cmr6187817wmq.174.1648759475650; Thu, 31
 Mar 2022 13:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220325153121.1598494-1-broonie@kernel.org>
 <20220325153121.1598494-8-broonie@kernel.org>
In-Reply-To: <20220325153121.1598494-8-broonie@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 31 Mar 2022 22:44:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a00ejR8aJtxLPfoKU104J6yD44fS2tRyzCQvT4pUF4m6A@mail.gmail.com>
Message-ID: <CAK8P3a00ejR8aJtxLPfoKU104J6yD44fS2tRyzCQvT4pUF4m6A@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] ARM: configs: Update multi_v5_defconfig for WM8731
 bus refactoring
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:xGJCZIwOUumy8qXAbie+IhtypMea37TD91BIVGZ2UyOeEl5bDvR
 AR9BFXqfdjLsEEqIxavKaQL4IiFLbdMRNamjds/nWGQ6NrT5ttZLsLKjU1FVwNEXRFI+kTT
 TZAJfyfL3OpSSSKuJuO7RO8KSm+gwNd5qSbUQYuERRRH4ZcvoJ10Dz/6IQlyakbd6Z7wSWC
 QnrLY/vgfcL3cIihzm2Tg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:u7E+KYdsFaA=:62BCXsbzvhvayR3bX/qamR
 JzKkErverCmYEuMdzwLscFikF4yC/ieBu408lTVw+5aKiYA3aVFzak89DwJgBnmH3YCecUI5W
 RijIrBgpSE7KWTyUne90xkhdJ0/4ncvSzJPAkop1vkIXi4+UEi8xfTb6SWX0J1EvpVsyx8KO7
 k2nP0zcufwfw8IKLNsuvM3tNPDDwTwQuYpZWOhxCVOLSh5uSYDcX9PxdCN4UF5Hfvcn+qwnaH
 VQxs2RaY0D7uEOg4e85X71W93cEUc4FboIaa8TM03fps8c6E+lCc7QKTM4C3Ycvmxhk+ouO6C
 TT4IF/kH9g56KLTWAVV2yuEMbWv3A+LTAqOhgUeIWcjnvmM7Y+CtsVY1el1LAgyEsrfy0Js/N
 GWUBUgiQ+GwQCzZ9J7ZopyT27NZ9/nbVY3Ggq3YLeZn6i0hBhyQyiqIfiKin1AnQF7VtdYoIq
 EpL7ms+uj15nU5RCQAM8pPd4NgdlkyKKoKPwZFF5H+rAec3McXl3oXYonErwSho3pb4HUc7b4
 VNIadAo0sOt5lBz5y7CDp779lfutUhbUVauwXTbU6M9mPLIjYjb3XeKsLSzfGrhiEHwELml0q
 oaj6hm7dkjEv9uF/uFmHjWmmcjq4JeqgyJdAfEyUtCffNxC9gNuBXKcDuFDl4Jwiet9AG+zFw
 TmjCXGkOefy89qMYRTO7MZCcIq7f0dkuYYLwJLuXDisW3S2299vrjO0J0GtDPBa0ni/Q=
Cc: SoC Team <soc@kernel.org>, patches@opensource.cirrus.com,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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

On Fri, Mar 25, 2022 at 4:31 PM Mark Brown <broonie@kernel.org> wrote:
>
> The WM8731 driver has been refactored so the I2C and SPI bus code is
> separate modules. Refresh multi_v5_defconfig to reflect this.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Cc: soc@kernel.org
> ---

Acked-by: Arnd Bergmann <arnd@arndb.de>

If you prefer to keep it together with the driver patches, please merge through
your tree.

      Arnd
