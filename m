Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D51614F8755
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 20:48:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61BF117DB;
	Thu,  7 Apr 2022 20:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61BF117DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649357328;
	bh=SVrHOFOrp4LkSdxf9IrDTGBKQw2pW5xOGs2OcPhHsLI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YaP5aL+/pVrGHuRwVA3Y27zsYN0mWq/Ivj1lGJBQCHmCOQ7dzaFiKeDEL9Crt9/cq
	 9KuW5vb5rfpgLR6tapqxz6+CicdCXjdf9/AFewcCYMae9AP0EhSe0GFlUIuA7zn6XY
	 21ybsu1zv5RP5IYgOiqACE9/CWooO5Rj1sb6tPIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8868F8026A;
	Thu,  7 Apr 2022 20:47:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5AEFF8024C; Thu,  7 Apr 2022 20:47:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 729DDF80054
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 20:47:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 729DDF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WeeIz+LT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5BEC761DB6;
 Thu,  7 Apr 2022 18:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A729C385A4;
 Thu,  7 Apr 2022 18:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649357254;
 bh=SVrHOFOrp4LkSdxf9IrDTGBKQw2pW5xOGs2OcPhHsLI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WeeIz+LTk9Khndp+7GXzQ84jQ5ZQVEDaV71Nd4ySkPevv8V5xyAqR60zMiDUrVK0V
 Wia4OdAcUABKcolcbzNqWkDDSQiN2dzZxjUWHmGHw85ZJDYssq5llnQ+pNAxpDAwKo
 yrxmRBXninI7xL1hM2BFCgEJplx8LTib1Qc1pmXPGGoO9DFSlJCHHsBe76CMZSF4/g
 kuQRHY08smB1uQJ+6JNrc93gagqQSMMi4EUcTmgBophBZuvIyR7TA2X/oECBLNKdkT
 amQjgDCqW+tODzyuUOAY3NZ3EJDirmJuTGw+B/fcqJ4VitYdCfrFPmgZ9WexHFC/Lm
 SDAJSe8NJCDeQ==
Date: Thu, 7 Apr 2022 20:47:28 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v4 3/4] ASoC: Intel: sof_es8336: add a quirk for headset
 at mic1 port
Message-ID: <20220407204728.7710ebfa@coco.lan>
In-Reply-To: <0dac70ef-1355-3379-ef41-eec6467886b1@linux.intel.com>
References: <cover.1649275618.git.mchehab@kernel.org>
 <baf412bc431650fc7f3a157c6ab96d08120940fc.1649275618.git.mchehab@kernel.org>
 <0dac70ef-1355-3379-ef41-eec6467886b1@linux.intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 linux-kernel@vger.kernel.org
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

Em Wed, 6 Apr 2022 22:08:53 -0500
Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> escreveu:

> >   static int sof_es8316_speaker_power_event(struct snd_soc_dapm_widget *w,
> > @@ -145,13 +148,23 @@ static const struct snd_soc_dapm_route sof_es8316_audio_map[] = {
> >   	{"Speaker", NULL, "HPOL"},
> >   	{"Speaker", NULL, "HPOR"},
> >   	{"Speaker", NULL, "Speaker Power"},
> > +
> > +	{"Differential Mux", "lin1-rin1", "MIC1"},
> > +	{"Differential Mux", "lin2-rin2", "MIC2"},
> > +	{"Differential Mux", "lin1-rin1 with 20db Boost", "MIC1"},
> > +	{"Differential Mux", "lin2-rin2 with 20db Boost", "MIC2"},  
> 
> this is surprising, shouldn't this be part of the codec driver?
> 
> The part that should be machine-specific is really how MIC1 or MIC2 are 
> connected (as done below), but the routes above seem machine-independent?

Yeah, this should be there... and it is there already ;-)

Tested without it and it still works.

So, I'll just drop the above.

Thanks,
Mauro
