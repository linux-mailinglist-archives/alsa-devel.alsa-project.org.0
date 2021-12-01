Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1897A464B84
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 11:22:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EB6A258C;
	Wed,  1 Dec 2021 11:21:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EB6A258C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638354149;
	bh=LMWx/dBrUq33oaMPYPVzEZQcyCuMuSupyCLhch7HdqU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGrZeO2VhB7Ty8wWM8CVipDUYUlZI1f0DriPGEIWgy5NFX7l4+TzYEqdVqNnhi1q4
	 5lOGlF2akUYxgSQRS+ff0x3MWSzRKXs/7J7x8w45Djgry+vrelGqm8CEU7+r7EYBHe
	 khxNDTQrgKpuAvBp3YTBHV2DRdaCh9nzGkXHDgsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67DB6F80249;
	Wed,  1 Dec 2021 11:21:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E5E5F80246; Wed,  1 Dec 2021 11:21:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72E53F80121
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 11:20:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72E53F80121
Received: by mail-ua1-f49.google.com with SMTP id n6so47883785uak.1
 for <alsa-devel@alsa-project.org>; Wed, 01 Dec 2021 02:20:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=urLNBsFGliR6FhvwlQWsAIf0ZWR7LeLf64IUUPE+zmE=;
 b=v9+oF2qACSG8EfuGjHZfmUrW6ZOXYoPHFJDJgtvvcWRc9/Wn4HMxNwOa+vriBYEIe1
 9SUrVWaiWzw5ELYhQ1EZxRXjgLPthqyO6stGkj9R8rWO+FXyVN6MujXzt1z/i/9A1Kzc
 w+sKRkXuFU6ymslu/O2SfQPvmx2Jn6LiaechpOHW4SFvnaimtomCgusSjIIJ+sD2+ROI
 rHqJNRtyPHhNzypjQiNsah6R9uDr2JEGiH1xTROoG4P7eAguy7kR3Ahxqo3/7oTRWU9x
 UFEBe+TXGBYZqnNXtP6rTfA1HEDfQJO5uQJOhDgzJW87ZFwvCPi7owQJxr6c4dh7n9RA
 I5MQ==
X-Gm-Message-State: AOAM530e/5qGZflaoAbdpd5l4m/zexB2lwdUKG2SZVd2+VFjHyjeQH5s
 497D7P7U2+1lj1ypeDYdN+BYBoSTtMi6BQ==
X-Google-Smtp-Source: ABdhPJwipIwVghDCxEQpohj4agFQBC+tlErkFSzrgL35vQckR8dlmf44A3Xw82DKLX2SLET+2QpHuw==
X-Received: by 2002:a05:6102:953:: with SMTP id
 a19mr5434904vsi.28.1638354056048; 
 Wed, 01 Dec 2021 02:20:56 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com.
 [209.85.221.178])
 by smtp.gmail.com with ESMTPSA id l28sm11670405vkn.45.2021.12.01.02.20.55
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 02:20:55 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id j1so15734382vkr.1
 for <alsa-devel@alsa-project.org>; Wed, 01 Dec 2021 02:20:55 -0800 (PST)
X-Received: by 2002:a05:6122:2193:: with SMTP id
 j19mr5849899vkd.7.1638354055034; 
 Wed, 01 Dec 2021 02:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
 <20211117093734.17407-8-daniel.baluta@oss.nxp.com>
 <CAMuHMdVV6Os8Gzc9JVjD2CAtN38=7KFn9GqosnWvByQc-7uA=Q@mail.gmail.com>
 <bdbea252-09e4-eb60-acf8-4ea8a1d924c4@linux.intel.com>
 <YaZZzSPQDz0vHRQY@sirena.org.uk>
In-Reply-To: <YaZZzSPQDz0vHRQY@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Dec 2021 11:20:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5Lc9x4mnoKn2xUPku1tT1XM=ALY-vPtos=NBjcrzAWQ@mail.gmail.com>
Message-ID: <CAMuHMdU5Lc9x4mnoKn2xUPku1tT1XM=ALY-vPtos=NBjcrzAWQ@mail.gmail.com>
Subject: Re: [PATCH 07/21] ASoC: amd: Add module to determine ACP configuration
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: daniel.baluta@gmail.com, AjitKumar.Pandey@amd.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Balakishore.pati@amd.com, linux-mediatek@lists.infradead.org,
 Bard Liao <bard.liao@intel.com>, Julian.Schroeder@amd.com,
 yc.hung@mediatek.com, vishnuvardhanrao.ravulapati@amd.com,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 daniel.baluta@nxp.com, vsreddy@amd.com
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

Hi Mark,

On Tue, Nov 30, 2021 at 6:05 PM Mark Brown <broonie@kernel.org> wrote:
> On Tue, Nov 30, 2021 at 10:49:30AM -0600, Pierre-Louis Bossart wrote:
> > To Geert's point, there may be an additional need to add a
>
> > depends on SND_SOC_AMD_ACP
>
> > There are also a set of
>
> > SND_SOC_AMD_ACPyx options, not sure if any applies as a dependency here?
>
> Or put them in an if block (IIRC I thought they were which was why the
> dependency wasn't needed but I don't know what I was looking at if I did
> check that).

Probably you were looking at sound/soc/amd/acp/Kconfig, where all the
other ACP options live, and where you had applied my earlier patch
to wrap everything in a big "if".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
