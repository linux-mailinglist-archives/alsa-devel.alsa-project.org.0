Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C44F34ACC8
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 17:46:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30D5A1685;
	Fri, 26 Mar 2021 17:45:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30D5A1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616777174;
	bh=Md3wvqe5lpQG5KHQ3OcRLbNbVIl2xDInwFXV42O5xJM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qLlUUVkAuCr9LNiIwTH2iX9ydF7vPR6io/iBM1Hh7kto+kbm9gLB1MsXRzFeqxmu6
	 GnCMZvJQhqemqZyuTzeqCxvFh0vGMwbsIg9gvaoz6EcimGdafaGrT+g44oJ8AHXOWI
	 6YEvX9vJ3N8gptShp7SAh+iR/scqkavx10l+pHxc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCAE2F80240;
	Fri, 26 Mar 2021 17:45:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DC16F801EC; Fri, 26 Mar 2021 17:45:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F8D7F801D5
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 17:45:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F8D7F801D5
Received: from mail-ot1-f54.google.com ([209.85.210.54]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MqrsF-1m3tIY1V9F-00mt1s for <alsa-devel@alsa-project.org>; Fri, 26 Mar
 2021 17:45:07 +0100
Received: by mail-ot1-f54.google.com with SMTP id
 w31-20020a9d36220000b02901f2cbfc9743so5770126otb.7
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 09:45:06 -0700 (PDT)
X-Gm-Message-State: AOAM533dls0O+6n1dcfhbfinUUnV8pOp9ty45ccve4wbQtM4pG71BHaI
 2mhlzJvGRF8Gkb4Y6kbWFH7RHD6mmjZwFwOvNeM=
X-Google-Smtp-Source: ABdhPJwI2Qsw1sWTOFhkHH3uplM9/Zbn4oxxxmqJ1LvEGTO2EKJkU2GG1NEpUCYJ/hXdG9knvq0hYYTsIszKxXiGQpM=
X-Received: by 2002:a05:6830:14c1:: with SMTP id
 t1mr12487281otq.305.1616777105952; 
 Fri, 26 Mar 2021 09:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <1616777074-5151-1-git-send-email-Vijendar.Mukunda@amd.com>
 <1616777074-5151-2-git-send-email-Vijendar.Mukunda@amd.com>
In-Reply-To: <1616777074-5151-2-git-send-email-Vijendar.Mukunda@amd.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 26 Mar 2021 17:44:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0aM4GRZ62TvNpwtMY0Bw7JGJNVs55UkpdBVYeKgWhMaQ@mail.gmail.com>
Message-ID: <CAK8P3a0aM4GRZ62TvNpwtMY0Bw7JGJNVs55UkpdBVYeKgWhMaQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: amd: fix acpi dependency kernel warning
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:JZSf2W3RwnTZ1y3kB1/rROlkYnumYayyGXGGUYUEnNwARBG+N4R
 zlXhJ87+9DBwRK7rVvU8b1FXMmlBP8a/3+TqAV9uDQiLRp6v4jkuelAOWdU70ttnU44vNVu
 C6qiBmguuBoGLs5RtrmNYQ8h7M+ylUtHWJiSpbwCvfw+Ht/UoDVLBp4DtnLcyEwkJClnW1V
 kmkgcgMebOueFQGK8JMmg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:b4Nxtnt1cWA=:6tP2JN/0+4dUYSPuSx6Mn6
 Bux4t3AdbFNHg1Bd1CnsL8We+LMxPa2VfLyUmHYwVFymayg0+u6MaIYIqOkIVkZY+QJh6dC8o
 s4lQy1J02//mScyt3wNgs1pSlmhDyV5FrhFcElv93heeNz8fE/0ZWpAoJFj73E6Hfl8Xo9mZs
 41yYbBW6felmhhpHegRgoA/7cACqTMrHHJrsf/n8rmj1ThzLcaoPYB0gTM2VeRaAkDm152RTv
 GbTHOIg5wWMfQTwDyF/LHGQxsOobq/oLEnvArYYydwl8lhfp2bS9qxcENZNEASrOAVviAnTew
 G71mIqLf0yroY20VtQcNZwbShnIJ1P7ykjrfIDKHmnkfqpG+3Uz8RHLkb7pfZAhNXM3Gbml49
 +B12OqMXpt7pcj/wOMftsORJrJKM1vOutHo9yVUk7epxeGKv1pmytluSlaUQ5aMsMTD3vEymu
 zxlIIkm6BB6vxlPLwTIjwV3w4TMxm7A0TC7XTnjAYBku6LoWljcOsBxA7cL5S8w3sb/XjvKU9
 GNVfcyA6iIwA1I0XI16mrLKA7Sin0yRiz6hySLKEpfUb8b3F+0erNWWsV/PDcqe5lblgSdYWm
 BIiVbiLdyu4yfxGT0rXzKE+Fc5AhBXX+Xp
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Alex Deucher <Alexander.Deucher@amd.com>
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

On Fri, Mar 26, 2021 at 5:44 PM Vijendar Mukunda
<Vijendar.Mukunda@amd.com> wrote:
>
> Fix ACPI dependency kernel warning produced by powerpc
> allyesconfig.
>
> sound/soc/amd/acp-da7219-max98357a.c:684:28: warning:
> 'cz_rt5682_card' defined but not used [-Wunused-variable]
>
> sound/soc/amd/acp-da7219-max98357a.c:671:28: warning: 'cz_card'
> defined but not used [-Wunused-variable]

I would suggest simply dropping the unnecessary #ifdef and
ACPI_PTR() guard.

It might be helpful to hide the Kconfig submenu under
'depends on X86 || COMPILE_TEST'.

       Arnd
