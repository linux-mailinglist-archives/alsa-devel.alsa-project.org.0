Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 846C1571AD0
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 15:06:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4136F1699;
	Tue, 12 Jul 2022 15:06:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4136F1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657631210;
	bh=6Iz5iXIRB+mMx6gOjvj3JoapiCL97QYIIOBgJxU3pmI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gMvFk59n2iOt8dxNBUBVXWO4+8Hx7NEVmtzkc8ZO80FwKWo2pZc7doX5lH2aBkPMf
	 fnTHJAx5AuWiVGysNbNdnsy+WPCptuN4nymcLHZ4q/JK4dSSJrMGja3m33PwhAk2ZN
	 xiK7wleBn/3kn1lOfWh7B9yJ7AiEqT1AWbOZjjJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5142F80279;
	Tue, 12 Jul 2022 15:05:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4BC3F80246; Tue, 12 Jul 2022 15:05:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35E59F8012B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 15:05:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35E59F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JDT3tzpa"
Received: by mail-pg1-x52e.google.com with SMTP id g4so7546135pgc.1
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 06:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7imqj63btt7D4zx/bwWujC0xJp+NL1hLcSWeuhzgv/A=;
 b=JDT3tzpaOMFzx/U43cl1SCrqmZUjm7ZJdKf7jNRmXUjP4oGvyWlfYcmnvjhcsQ8oyW
 xkjFvO7HqE8/CQKyjj5ae2bnwfjFOWKL//V/RIvJwrXIa1/czt5qGilZFGlyFY9flClU
 IfU5dR7fxXDwe750YbjvBZX1NUngD/TA88w/YaYUX8TimFkKT3l+DU89xjGWwcm4dDqY
 YULqWABb+PJLuvOaiIULfvtBg9LxBd2YPYCfre7QVecQCJVC1Ogf4aDFmEXlRM3yxr7t
 MmOBeIEuLNKoEbR440nTwKRVqy0CG/6+y4mw5iD0eqoGhAA/Zs5njpdelk3Jt9EON2hL
 Vf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7imqj63btt7D4zx/bwWujC0xJp+NL1hLcSWeuhzgv/A=;
 b=235YquZKUMVPCxmp2kroS7voLOPANSRGdKk60+fY5ahq6eIS2g4hQAoFeGDMXNyY2k
 a0nurnffnhcwMfzno8Ah2XdquOr6cJoGJheGR/lA4zaXtSwDK8H01OnA5mA1SIR7G/2D
 iu8KPuYGBFk2z4oR5QMk6hbuOrxIz0s+V+Mq+kbOqbX6Z+905rDnex14gYtG19/HkHc9
 BVXDBtL2KPg5VgI7uK42K6E+GHbBqKbDyVrF0Wqkhx19iFsNwKa6BzHCclIJCNH5PoeX
 Q224HqZuwmTwyUZwVp6J2DZoPFMhjZvsV0XKK0CEkpiyI+hSauuZJ3o/MsohdJEKWSb6
 /qGQ==
X-Gm-Message-State: AJIora9UOI61k8FOVJGaCu4/hsvx1deThySU8pkks2dixZpsTIKJqt/V
 SBQZS1xCk1B9eVhrYszbhtJcbT344KN7zY7Immk=
X-Google-Smtp-Source: AGRyM1sLBHUSNveOCAeR6Qbn1TH2Bvj2/onf64vXQypwoAOs02M/vzkRJ9uroAQYe7wxhHhBUGidhv/ZMvxZUwd2dXQ=
X-Received: by 2002:a05:6a00:f85:b0:52a:c718:ff9 with SMTP id
 ct5-20020a056a000f8500b0052ac7180ff9mr13305499pfb.85.1657631143033; Tue, 12
 Jul 2022 06:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <CADs9LoPZH_D+eJ9qjTxSLE5jGyhKsjMN7g2NighZ16biVxsyKw@mail.gmail.com>
 <15259e38-eccf-d294-a330-a48b5bbbdedf@linux.intel.com>
 <CADs9LoN-L0X1Dr1sP2K7xrcWm7dpHW6MhF47c2eBB0moLNnPRQ@mail.gmail.com>
 <18d3e724-e43f-c166-e322-26cc5e3890b7@linux.intel.com>
 <CADs9LoOZjK=cUuNSEELtgxYoA+yHVFKM_Y9YLcY74smqx8XsjQ@mail.gmail.com>
 <c554b69c-0c73-158d-85d8-95a0375babeb@linux.intel.com>
 <CADs9LoOOOXVC0p8R=b1y+Kfb1+ESEyMaVe9eoW=F5gdp0_GitQ@mail.gmail.com>
 <c4d32547-5f99-595e-21d3-fdb22a1af237@linux.intel.com>
 <CADs9LoNMuwbiSfgF1buDoY6=ecpR-BuZvTgXbFxe3qyL1=roUQ@mail.gmail.com>
 <CADs9LoOJu-NYxPhDL+N+xBtocPNw2y0nRHbSaO-NmGO284GPfA@mail.gmail.com>
 <b3e3d969-606f-dede-0319-7b8ed2a975f7@linux.intel.com>
 <87fsj6r84u.wl-tiwai@suse.de>
In-Reply-To: <87fsj6r84u.wl-tiwai@suse.de>
From: Alex Natalsson <harmoniesworlds@gmail.com>
Date: Tue, 12 Jul 2022 16:05:31 +0300
Message-ID: <CADs9LoOOLYXm=dmGswrAcSoQ0NaRXz1ify=H=vq+Onh8v+hizg@mail.gmail.com>
Subject: Re: Sound not working after commit
 bbf7d3b1c4f40eb02dd1dffb500ba00b0bff0303 on Amlogic A311D device
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-sound@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
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

> +               if (!snd_soc_dpcm_get_substream(be, stream))
> +                       continue;
> +
And this good works for me too and kernel not oopsing)
