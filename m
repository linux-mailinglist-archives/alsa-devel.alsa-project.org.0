Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE29382A6A
	for <lists+alsa-devel@lfdr.de>; Mon, 17 May 2021 12:58:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12393844;
	Mon, 17 May 2021 12:57:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12393844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621249118;
	bh=bhsf03WCAU5VR7gDbkWzkDvcq1KimHLzEmVtZ13sPXs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DAjbux9oBYc8Td8ukUkVMfR8ceeOh/zAyJFVDTT5sPY1+Fz8Mbk+dDHp90Je1b/ns
	 W09cR7PVKfuHHuuRF1X4IDu/rLm3k2ieOKu8+agCoDysbnvEHzE8gfVEOJ4vbe4uhB
	 HVGoHNzQEaphXyU4NIIoNQiQgPojSD3W3aFOTbEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DF4BF80246;
	Mon, 17 May 2021 12:57:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B442F8020B; Mon, 17 May 2021 12:57:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 009DAF80082
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 12:56:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 009DAF80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RE26Ae9j"
Received: by mail-qt1-x82b.google.com with SMTP id v4so4495874qtp.1
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xULAoSsHU2psX2VG0qF90GajX4WbVpZyRpzX3ewwy9E=;
 b=RE26Ae9jS9kLTiE7fYGBWExaibp7ZjVLQmoqXAzNeSdHR9u31zfI7so12UiJl8gaAH
 40gBR3KFMNzle6nO7pR3ICx3pzCKGh9Tt+YB90ArqV0uLgWr752eo/F6QD9fyM5u8wGP
 1yZha3wGJ0wSnSQ5Thjz+UX7x9iLLGjuJcVJkUQxv6OrDaJZx5W0Lu3fFufivyca912j
 +mHcsfmuPOw0zKPMbijsau/CII/axc4Sr4tM3qqNyjTiSFHxAXUu+C00e3kp2h0YmQ5n
 DNN84FmJmWcUc1+73qzPRRPWSqAVxkrHAa4CC6zmDleRydpWWzbQiZicS0irzDgzRgZz
 KmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xULAoSsHU2psX2VG0qF90GajX4WbVpZyRpzX3ewwy9E=;
 b=WayyU/3KbP4d4zUi2KtmiEofc2eVQoQYgUwL4XyRUzuPTews4nqAi20zB2C1GKPNWa
 9U4rKweK3hBDhQoTZjxMwHkscyEIavHBIHedI0smyInjEXAlgvDTAPrEdXMzSbp92rDQ
 JS/fz162hRGB7LbV6x8VTAV5Aub+WX5Vf3vs12VobU9uKYExH8AxJMm4T2cbDflsLfE6
 pSWCGGWAXRgueoDUSMSZRhlufAxq3KqqSl/pmtc+Mx8vyKNm6Guf/DzBDfUV5CVMQXMc
 fgvHVyg5rs5NTUFnOuwli6aMKTUmvyjnCl/PmONO49JeguFDh0VRYtTQWH1h+inOLQb+
 UPRQ==
X-Gm-Message-State: AOAM531G6rgIqU7p9Iia2I81+gZULDsBUbMpadlcTDRSqjdjRN1EXd73
 1iOf0A5Jg1togKetVgzdMNJbhZU2bp7hT2vrmEI=
X-Google-Smtp-Source: ABdhPJzgGeYq6XyfP59AYy3eG/5/dPH5GFT2NC4BqTz90/7V6DyFbIZDPncGv87Nh+TTBAWk1vA9eDrycYqmOVexodY=
X-Received: by 2002:ac8:47da:: with SMTP id d26mr55254795qtr.292.1621249014870; 
 Mon, 17 May 2021 03:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210514213118.630427-1-arnd@kernel.org>
In-Reply-To: <20210514213118.630427-1-arnd@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 17 May 2021 18:56:44 +0800
Message-ID: <CAA+D8AOAUd3t8TBNtvf8rm_dXgYgL9nZe95wizaoyf5rTfNAcA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: fix SND_SOC_IMX_RPMSG dependency
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel <linux-kernel@vger.kernel.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Viorel Suman <viorel.suman@nxp.com>,
 Fabio Estevam <festevam@gmail.com>
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

On Sat, May 15, 2021 at 5:33 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Kconfig produces a warning with SND_SOC_FSL_RPMSG=y and SND_IMX_SOC=m:
>
> WARNING: unmet direct dependencies detected for SND_SOC_IMX_RPMSG
>   Depends on [m]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_IMX_SOC [=m] && RPMSG [=y]
>   Selected by [y]:
>   - SND_SOC_FSL_RPMSG [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && COMMON_CLK [=y] && RPMSG [=y] && SND_IMX_SOC [=m]!=n
>
> Add a dependency to prevent this configuration.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu
