Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BEB5715BF
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 11:31:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF6C1827;
	Tue, 12 Jul 2022 11:30:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF6C1827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657618262;
	bh=QArCS3zy/H+pihaxJ+LbmPLederaiugvsXn4lgLsxko=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mqn1Ib9AvOWFRdGShjXohL586S/WGq6NhzIk1kuYb5g3SVTFWx0xWSkQcjGTKePjf
	 F4i/vG8VtAV76JwYheCjC4jam6ejKnJ8Luhm7BqQDK7TsieiWFEEOhStycONi+EqUI
	 BIVowFxLUuR0zTqHukWhSyYUPDcO/zUkE+D5J+c4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 543D0F800BD;
	Tue, 12 Jul 2022 11:30:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89533F80246; Tue, 12 Jul 2022 11:29:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9B7CF8012B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 11:29:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9B7CF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="p9MA2OEW"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="mGHzDPeZ"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 15C85201E3;
 Tue, 12 Jul 2022 09:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657618194; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+MiFjo69AKZMuiBYGmwUATDG22mkCWi/qQrq4f4DR6o=;
 b=p9MA2OEWxr/Zlw3fh1z5M7ux3yGGGG/qYZcbdhEOIVdE/4HiUAsfIygF40hb7Mi4gtm7GX
 sm0BsNvFwiDO5uP9TTuw0z2sc0p4XZhcXHSOoCWYvv85cJle2cKAhbyzGjRk8bB9G27sqq
 zAEBCaEzA6RhmnTo4wi3iFxfZBHazx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657618194;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+MiFjo69AKZMuiBYGmwUATDG22mkCWi/qQrq4f4DR6o=;
 b=mGHzDPeZCQ41Tmc4ii8BFIXrdM23fAKhk5IwWuUUP/98L57LNfth06So0mJt64Y3DbwY7T
 /Aks2ALFpbBjZyCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA74413638;
 Tue, 12 Jul 2022 09:29:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id J5upLxE/zWL3UAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 12 Jul 2022 09:29:53 +0000
Date: Tue, 12 Jul 2022 11:29:53 +0200
Message-ID: <87fsj6r84u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: Sound not working after commit
 bbf7d3b1c4f40eb02dd1dffb500ba00b0bff0303 on Amlogic A311D device
In-Reply-To: <b3e3d969-606f-dede-0319-7b8ed2a975f7@linux.intel.com>
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
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Alex Natalsson <harmoniesworlds@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Mon, 11 Jul 2022 16:33:14 +0200,
Pierre-Louis Bossart wrote:
> 
> 
> 
> On 7/9/22 06:19, Alex Natalsson wrote:
> >>> +       if (!fe_substream) {
> >>> +               dev_err(fe->dev, "%s: fe_substream not initialized\n",
> >>> __func__);
> >>> +               return -EINVAL;
> >>> +       }
> >>> +       if (!be_substream) {
> >>> +               dev_err(be->dev, "%s: be_substream not initialized\n",
> >>> __func__);
> >>> +               return -EINVAL;
> >>> +       }
> >>> +
> > 
> > Will be this in upstream or needing bugzilla reporting message?
> I created a patch based on this, see
> https://github.com/thesofproject/linux/pull/3735
> 
> I am not sure however if this is the 'right' fix. There was a comment
> from Peter Ujfalusi that a BE substream may be initialized later, but if
> that's the case then the atomicity check that was introduced is done in
> the wrong location.
> 
> Takashi, we could use your guidance here.

I guess that the check of fe_substream there is superfluous.  It must
be never NULL.  And, in principle, passing the invalid BE to this
function itself sounds already wrong.  That said, if any check is
needed, it should be done beforehand at choosing the right BE.

A fix like below might work instead?  (Totally untested)


thanks,

Takashi

-- 8< --
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1318,6 +1318,9 @@ static struct snd_soc_pcm_runtime *dpcm_get_be(struct snd_soc_card *card,
 		if (!be->dai_link->no_pcm)
 			continue;
 
+		if (!snd_soc_dpcm_get_substream(be, stream))
+			continue;
+
 		for_each_rtd_dais(be, i, dai) {
 			w = snd_soc_dai_get_widget(dai, stream);
 
