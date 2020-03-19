Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 092B618C32E
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 23:45:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85D6817C5;
	Thu, 19 Mar 2020 23:45:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85D6817C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584657953;
	bh=6ksAcemTia6Tug5uVYWbMleUtPvEWIWTUYav0tQDJVA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=na6bpNhMlZtn7tn7/obn0B+unt8jbq2/rK8ZWu8deZUTzx6Cx3LrsOl7AMTQcWOnm
	 SpjlMBcuJEI9KOY5Pdt9JPzDJrm4slrFYG7jISpaRE5F132426m4lqcHNBIV9vmaaJ
	 OLIGB0egM7xD/DUKUreNJJ/cHkx8V+FBXlbnh078=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77B9EF8012F;
	Thu, 19 Mar 2020 23:44:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C78DF8022B; Thu, 19 Mar 2020 23:44:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 224F2F800C0
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 23:44:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 224F2F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="ng4EIYkx"
Received: by mail-qv1-xf42.google.com with SMTP id z13so2016225qvw.3
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 15:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ksAcemTia6Tug5uVYWbMleUtPvEWIWTUYav0tQDJVA=;
 b=ng4EIYkxJv8MLHZsLnP8Jf0XH9DYuA8KZb4SLPWCdxXXo+NhQ2Umd0rVUZyRmoVuMp
 2nQjLWIaHYCEXfOsEe8ZOzi5xggFm0kXltjkP7eg6jS7F1Xpu5dgzosbx4YWVkvtN+Bn
 XxLqhF3zjkJvmxbEgBI0I5p6c2QCdGNTcjJiyOID5E3+2lQfWWUM7iDadJ5IFP4FHLQw
 dY/394bhN3fXk73Kp/Yl4UIubK3jEHkjZLZoqC3qamHHl+PEVzIdZLby8oOyYxOFKMmk
 jnirQ3jxzqvhEjXXqrromG2bMTcLoYZgxvUHsL0qxtBCBO//xkAIexPmMn7GL0mbQtuc
 e77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ksAcemTia6Tug5uVYWbMleUtPvEWIWTUYav0tQDJVA=;
 b=b6ENf0HBCbESMK2eFk19KgRJOkNMd5/btBh5MecYWvgH6KURFIoAdXrq/qSMLLwLKu
 sXYKMSh1GxmoopyINZUVl9T6c1eY1Es4Pckry3WboymC+oyRf4TM6r4NAew9qRsckZ53
 3ylZFinFmt+c+lNMq7y7nGg6MgzKhfSe2r7FUO0D8UUa/bS0W/o7F0om9EuSxoPKbbRd
 JjByqy309ICYk6JC21zFgcmkxpTmVIXtJe1rVOTM58F4V6e9xL25reagVGm9w3Du+LWo
 waoqBcejCnEZE35cGwvKDJCJ6Mg/ALHSMrlsqdzP2ld5gEoZ4NGgmCrtEt/HQQgUSOAQ
 1eqw==
X-Gm-Message-State: ANhLgQ1+wQPshadO6U0y/u1fmhCkiDMIIdLQyPNVcblCe6BRZMONQ/9I
 Er3l+BS4WY8YNLH4I3s2RMaQGJCvt1YiC+KEiLdqng==
X-Google-Smtp-Source: ADFU+vvW1nGrNQQTSdLAi6JSYI33w933Nby/KpA6KRFhsvQE5sEu8ZNy3ahrCg5lD3ConGlUtAm5e50dzjQ9pGNSYL0=
X-Received: by 2002:ad4:54d4:: with SMTP id j20mr5315025qvx.75.1584657842196; 
 Thu, 19 Mar 2020 15:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200319204947.18963-1-cezary.rojewski@intel.com>
 <20200319204947.18963-4-cezary.rojewski@intel.com>
 <dea20cf7-f324-a933-8f8e-e70a4dffa249@linux.intel.com>
In-Reply-To: <dea20cf7-f324-a933-8f8e-e70a4dffa249@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 19 Mar 2020 15:43:51 -0700
Message-ID: <CAOReqxj=DBO2FyL466jWHDUG6_A4uU_o0cSyVPHbH8mjWs=JTg@mail.gmail.com>
Subject: Re: [PATCH 3/4] ASoC: Intel: bdw-rt5677: Remove ignore_suspend flag
 from SSP0 dai link
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, Ben Zhang <benzh@google.com>
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

On Thu, Mar 19, 2020 at 3:15 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 3/19/20 3:49 PM, Cezary Rojewski wrote:
> > As of commit:
> > ASoC: soc-core: care .ignore_suspend for Component suspend
> >
> > function soc-core::snd_soc_suspend no longer ignores 'ignore_suspend'
> > flag for dai links. While BE dai link for System Pin is
> > supposed to follow standard suspend-resume flow, appended
> > 'ignore_suspend' flag disturbs that flow and causes audio to break
> > right after resume. Remove the flag to address this.
> >
> > Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Cc: Dominik Brodowski <linux@dominikbrodowski.net>
> > Cc: Mark Brown <broonie@kernel.org>
> > Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>
> we should ask Ben and Curtis @ Google if the changes related to suspend
> interfere with the wake-on-voice support?

I have a samus with me so I can test it but my backlog is definitely
growing due to WFH slowness. I will see if I can take a look tomorrow.
