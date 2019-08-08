Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D29D85DEB
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 11:11:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51E6A857;
	Thu,  8 Aug 2019 11:11:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51E6A857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565255510;
	bh=AEoHG+ZvKB43jVPkSApLnKm4f9lIoQqCOsbIzz0nwSs=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C4Qz9TtYpjvJmlHhKvcMhiwpGh+TBUdk2iwtxqfR8eS4kekDVJf5FsxwnBJxq7Lf3
	 5psvu5IA8jcOq4aNkz9lu54gg+55wVbMx+6ELW6S5SEHDe/LtJ5IVF8lLa+u6hFXBw
	 dRXVJRQMZnQgUVWN3qmAl9UWjyYXEDgT/aNbdpRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3D6CF80535;
	Thu,  8 Aug 2019 11:10:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A9FFF80534; Thu,  8 Aug 2019 11:10:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FROM_EXCESS_BASE64,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 712EBF800E3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 11:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 712EBF800E3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 02:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,360,1559545200"; d="scan'208";a="374083672"
Received: from xxx.igk.intel.com (HELO xxx) ([10.237.93.170])
 by fmsmga005.fm.intel.com with ESMTP; 08 Aug 2019 02:09:55 -0700
Date: Thu, 8 Aug 2019 11:14:17 +0200
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20190808111417.7033df42@xxx>
In-Reply-To: <f3ead090-8c2c-6be5-70b8-c6530239302a@intel.com>
References: <87pnlhahr6.wl-kuninori.morimoto.gx@renesas.com>
 <87y305932s.wl-kuninori.morimoto.gx@renesas.com>
 <f3ead090-8c2c-6be5-70b8-c6530239302a@intel.com>
MIME-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH v2 19/25] ASoC: soc-core: don't call
 snd_soc_component_set_jack()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 7 Aug 2019 20:49:09 +0200
Cezary Rojewski <cezary.rojewski@intel.com> wrote:

> On 2019-08-07 03:31, Kuninori Morimoto wrote:
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > 
> > snd_soc_component_set_jack() is used for both setting/clearing.
> > Setting purpose is used under each driver.
> > Hence, clearing purpose should be used under each driver, not
> > soc-core.
> > 
> > soc-core shouldn't touch it even though its purpose was for
> > clearing, otherwise, code becomes very confusable.
> > This patch removes snd_soc_component_set_jack() from soc-core.c
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> > v1 -> v2
> > 
> > 	- no change
> > 
> >   sound/soc/soc-core.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> > index 80703618..e708095 100644
> > --- a/sound/soc/soc-core.c
> > +++ b/sound/soc/soc-core.c
> > @@ -938,7 +938,6 @@ static int soc_bind_dai_link(struct
> > snd_soc_card *card, 
> >   static void soc_cleanup_component(struct snd_soc_component
> > *component) {
> > -	snd_soc_component_set_jack(component, NULL, NULL);
> >   	list_del(&component->card_list);
> >   	snd_soc_dapm_free(snd_soc_component_get_dapm(component));
> >   	soc_cleanup_component_debugfs(component);
> >   
> 
> This has been added lately for a reason - reload/ unload series.
> Amadeusz, could you comment on this change?

This was done on assumption that we want to always make sure that it is
cleaned up, independent of if driver author accidentally forgets to do
this.

We can of course add handler to our driver to do this, first version of
patch actually did this, before we decided on global option.

Amadeusz
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
