Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB2E5597DF
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 12:31:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00BB11825;
	Fri, 24 Jun 2022 12:30:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00BB11825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656066677;
	bh=5LCyOsyluBGURt0W/2QyJq3snL7fBV60vuIpfaNIuXA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L7hzEZAgaFXO2w4J/5kQ60h8+sDTCpl7nhnmMsDRVlxXYX5w5QNONwZ78J+RUD8ic
	 7IhHGb/OrxNZQqW375AUSMup6rfjQGNnrISuRgybd3wnZA+fo/guULjyu7SwO9bva/
	 n8A67jGn2BBlr3Gmbw69SUUdRTthCJRRAFYiMi00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66EBFF8016E;
	Fri, 24 Jun 2022 12:30:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D44FF80165; Fri, 24 Jun 2022 12:30:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C434F80109
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 12:30:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C434F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="D+CzyVFW"
Received: by mail-pf1-x429.google.com with SMTP id p14so2195227pfh.6
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 03:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5LCyOsyluBGURt0W/2QyJq3snL7fBV60vuIpfaNIuXA=;
 b=D+CzyVFWDKpdUK7ffbpwVF8w+hcO4Z+cVF2Ei4kvbhy93De4B3hvQrM48gAMHEHDGu
 C8/kGNxOzUCSETa1RHJyT/5b4tiFg8e8un/FNHD5xGj5kueJZxTNQsFjU3WD7/4JPsi5
 zZjUSMOt/M26e/Y2RkMxk3xsrC/E7m9psJIhmsykj0A7RKigPTuclhnmqC0UBA6pVFTf
 PkFeSBSEcKuRxwbekNViGswDsrJ0DRlOD5SC/nm4NHmEO2/CxBS4QbTboKbuVIRQzubm
 HsQkcQlujx1ob/6x13/uviFHgfp5W/2wRa+zl8askxA1fQafxHPx4Iyn11s6yrhLdl+/
 7ajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5LCyOsyluBGURt0W/2QyJq3snL7fBV60vuIpfaNIuXA=;
 b=gBDBSSM1xshInq1atIevg4y3bLL03NcVTcjIFm9btotL3dXfzKd/FmmSwCZOHI8MdF
 djNpi6XJljI90/S43Qg3Sh/R+wQcC9eulSg22mvXalg6T7H4WpW6ttl4DBUBxy6fZXsi
 UrGBDBAqxxNQo24kTjZUkTH2VbUeQ8M20HhKsbM/0yDgiMwEYE19W0SIhUftRSFZE46U
 CxJEDlB7wuoMnFj9gPViokELhL2KG57cDiT1V4HI8mLPBXTROo1BIGmRs1lHKOaWwDxl
 uxIkEarCGTbFhFXM1ebhe62yI3Sb8xhl8C7nJsuVFybfQoogEoO5wQw6Bi3Se4AdZy2R
 jHUA==
X-Gm-Message-State: AJIora+AEkOwR+iyqzpiERt6U6dkHvBbqARu6ASPPbBPPM0jCu/G12fy
 xWirFddYv6g38Pngnzcd0Dd9o/G1dpvngtmThOo=
X-Google-Smtp-Source: AGRyM1tpeYsiiE0QwiFvULRUjMNnNHNG9ITYa35WIGznME9L7PWJjg2AV9fvc9L+A45NmUs0QF5SztE6+rpMsVNprM4=
X-Received: by 2002:a05:6a00:792:b0:525:3605:61d2 with SMTP id
 g18-20020a056a00079200b00525360561d2mr18935050pfu.71.1656066605839; Fri, 24
 Jun 2022 03:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220624101301.441314-1-francesco.dolcini@toradex.com>
In-Reply-To: <20220624101301.441314-1-francesco.dolcini@toradex.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 24 Jun 2022 07:29:54 -0300
Message-ID: <CAOMZO5AmopdssNX9QhsO=_W+y-F3SYFR6LPuSCsH8=bkLaKHnQ@mail.gmail.com>
Subject: Re: [PATCH v1] ASoC: sgtl5000: Fix noise on shutdown/remove
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Zeng Zhaoming <zhaoming.zeng@freescale.com>
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

Hi Francesco,

On Fri, Jun 24, 2022 at 7:13 AM Francesco Dolcini
<francesco.dolcini@toradex.com> wrote:
>
> Put the SGTL5000 in a silent/safe state on shutdown/remove, this is
> required since the SGTL5000 produces a constant noise on its output
> after it is configured and its clock is removed. Without this change
> this is happening every time the module is unbound/removed or from
> reboot till the clock is enabled again.
>
> The issue was experienced on both a Toradex Colibri/Apalis iMX6, but can
> be easily reproduced everywhere just playing something on the codec and
> after that removing/unbinding the driver.
>
> Fixes: 9b34e6cc3bc2 ("ASoC: Add Freescale SGTL5000 codec support")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Thanks for the fix:

Reviewed-by: Fabio Estevam <festevam@denx.de>
