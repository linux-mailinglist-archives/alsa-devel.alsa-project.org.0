Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C041976BE
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 10:40:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B09861666;
	Mon, 30 Mar 2020 10:39:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B09861666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585557617;
	bh=k+6SJjzYNL5BHTKzHwllOwh9emwzyRR5+BMPVSJ4eho=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OvUETVMQS6YPu+JURNBPFErD0Bb4wnoGOVeJLmdD6DH8lBAJr6SkJS0H0hnACQ/BJ
	 KmV+kQZDPXIpeUlHUQbsqeHybXXslW2da7EAaLv0kSz0TdivVbBCO9r/3/25nPRzoO
	 pouOWfkTYhX2D8DPkaHF6JeDgrlnU2mbstX77xJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFEB3F8014A;
	Mon, 30 Mar 2020 10:38:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 449FAF80148; Mon, 30 Mar 2020 10:38:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30C26F800AA
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 10:38:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30C26F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QwBMkhl+"
Received: by mail-wm1-x342.google.com with SMTP id z14so2567791wmf.0
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 01:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d7dT77Mj8SFfgoSadzsoTpTpaeQ7c6h2QTZMTMg5w18=;
 b=QwBMkhl+nqKTSY1XSOzTHAjPupV6mq5wO4yaX4cblyxkTiak2UrTY+Z7Su93Z7aQf0
 x3Vs6FIhR4Y2a6mR0PQUel5wUIrNAGOGHMPBVvpIft7fn61c+cGNrebVDjZdsHrc1wgx
 GDZ3lbzKaGaLqxwbdefO2ZN3TxgY8ZGDyDJn5sC+XWMBiHTIKlHN8SBdK9m23wo8v3rQ
 CiN81B4HqXHILMC0uUOw1z53jHcIiiB8FvxTpkrgl+yBBBcQk7FB2WIhGLZxfpZfHi2q
 qgYgAuRENu31KypW6q27ab/jZzv/JCNRnvHX6jfi4kYHHI4cRQC86qI/jifE3Ia2YEl0
 c7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d7dT77Mj8SFfgoSadzsoTpTpaeQ7c6h2QTZMTMg5w18=;
 b=IRxT5Zw1KCo/0H26a+cjmpD93BZTi7bh2kqbj5dg6etrT/yUT3uieHgOGbKfHSqHMK
 J03OYkz6aHm+BMtm2QfvboesE6+gj/nLS6S+tprHB0K+suzQDQnRIUXx7YPUb7K7QEEZ
 Xpxwa/aK2unGSlHCOLgFckawNCG11da2e1neNFKyJxlmXGlDJYCvAeCVUz1rFGipu2Qg
 x59rIS5p2N75kf8UR1yjUJcYt1oHLsdu75zDSxtkKahCpjirdOFpY5jMtPs/hKlIwIdS
 b7Ib6XYP3jUEj64HehalGMKBeS224UeF7YzcdGDES7vj/xUMz591zy+XrNbkfhvkhwFT
 2fNQ==
X-Gm-Message-State: ANhLgQ2DXPlU8pUDbCsSrzM7TsQy0kxpQGCO1UOYWwNV1pEBmg+mZAFy
 NbgZNGqTVsICSFmMHkaRJoaDpwfOhYeNJEHsYOI=
X-Google-Smtp-Source: ADFU+vuF1lMbuqMXNh6El+A/BD+TdA9UFO6/f3q1PrZ1gEs2kWmu/sTZ17ZP9QJo3REUe7XlcvpwTMeY7D1ca8YEN7A=
X-Received: by 2002:a1c:c3c3:: with SMTP id
 t186mr12576715wmf.118.1585557505217; 
 Mon, 30 Mar 2020 01:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200304121943.28989-1-daniel.baluta@oss.nxp.com>
In-Reply-To: <20200304121943.28989-1-daniel.baluta@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 30 Mar 2020 11:38:13 +0300
Message-ID: <CAEnQRZDsfSohbkbLd73AjN=2C3C6MTBdKqt84DHXkscjpq9rKQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/2] Introduce multi PM domains helpers
To: Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Aisheng Dong <aisheng.dong@nxp.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, rafael.j.wysocki@intel.com
Content-Type: text/plain; charset="UTF-8"
Cc: Daniel Baluta <daniel.baluta@nxp.com>, "Brown, Len" <len.brown@intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, linux-pm@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, khilman@kernel.org, rjw@rjwysocki.net,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Olaru <paul.olaru@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

Rafael / Ulf / Aisheng,

Any comments?

On Wed, Mar 4, 2020 at 2:20 PM Daniel Baluta <daniel.baluta@oss.nxp.com> wrote:
>
> From: Daniel Baluta <daniel.baluta@nxp.com>
>
> i.MX8QXP/i.MX8QM has IPs that need multiple power domains to be up
> in order to work. In order to help drivers, we introduce multi PM
> domains helpers that are able to activate/deactivate multi PM domains.
>
> First patch introduces the helpers and second patch demonstrates how
> a driver can use them instead of hardcoding the PM domains handling.
>
> Changes since v1: (addressed Ranjani's comments)
>         - enhanced description for dev_multi_pm_attach return value
>         - renamed exit_unroll_pm label to exit_detach_pm
>
> Daniel Baluta (2):
>   PM / domains: Introduce multi PM domains helpers
>   ASoC: SOF: Use multi PM domains helpers
>
>  drivers/base/power/common.c | 93 +++++++++++++++++++++++++++++++++++++
>  include/linux/pm_domain.h   | 19 ++++++++
>  sound/soc/sof/imx/imx8.c    | 60 ++++--------------------
>  3 files changed, 121 insertions(+), 51 deletions(-)
>
> --
> 2.17.1
>
