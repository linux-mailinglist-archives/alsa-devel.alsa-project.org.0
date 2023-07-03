Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7711974572D
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 10:20:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BEBF210;
	Mon,  3 Jul 2023 10:19:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BEBF210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688372427;
	bh=3UEGfrgPju3zSaFmHw2TFWmfbSB44g35w5Prp+BGBKE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nWYqeRRB+c2kjacJV7D8MIV08MiNS9U1Yz1ovaAKIwSHpChI2DOviD1snCuNxesyL
	 pkKIoGshYVh6jDhJ9t2XfI34t1oHji164wQoD1a6K1VX+j+Ui0kI3G9uc5ry2/yuca
	 lJ5YmfUMRSHZ3SwB7Z7QCm2iM6D5IEgETHgYZyNI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D40C3F80104; Mon,  3 Jul 2023 10:19:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88FCCF80104;
	Mon,  3 Jul 2023 10:19:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 045C4F80125; Mon,  3 Jul 2023 10:19:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3754F80093
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 10:19:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3754F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=aJje8umu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jmqiKABT
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3368B218F6;
	Mon,  3 Jul 2023 08:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688372370;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UpkuB3/PahTMC3E01tkVXYrfpgLpPbrbEH63Q3jfRXo=;
	b=aJje8umumX+wbjeh/5WR+y740OPtf3TqtEYdg8fi56N38n6f+o5F4bQKfkU1tGir/mD2Pk
	JtD0nyrvIaIPHs9Y2dmpNwfRdR0s7ygD8MbOfwlSdp2Gs/Oj3uSPqibe8KFrjCUPMPDlFf
	BykWceTpucFYTP0aqh27bgWta1D2FZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688372370;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UpkuB3/PahTMC3E01tkVXYrfpgLpPbrbEH63Q3jfRXo=;
	b=jmqiKABTTV2EIlXnmTNx//2wzH20PGtjQsULnm6Zpk+W33q4yANxojTDrMLbWEhhuyqajv
	dYmEfZFeF01bH1CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E4FCB138FC;
	Mon,  3 Jul 2023 08:19:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0OLxNpGEomQZbwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 03 Jul 2023 08:19:29 +0000
Date: Mon, 03 Jul 2023 10:19:29 +0200
Message-ID: <877crh76ge.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Johan Hovold <johan@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	johan+linaro@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	Stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: qdsp6: q6apm: use dai link pcm id as pcm device
 number
In-Reply-To: <ZKKA6K44mp_vjwtp@hovoldconsulting.com>
References: <20230628092404.13927-1-srinivas.kandagatla@linaro.org>
	<ZKJ9UrB8FRkLzLc-@hovoldconsulting.com>
	<ZKKA6K44mp_vjwtp@hovoldconsulting.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: ASCRYTGBB4KUOMWZWFPVLPDHFZYAPBTZ
X-Message-ID-Hash: ASCRYTGBB4KUOMWZWFPVLPDHFZYAPBTZ
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ASCRYTGBB4KUOMWZWFPVLPDHFZYAPBTZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 03 Jul 2023 10:03:52 +0200,
Johan Hovold wrote:
> 
> On Mon, Jul 03, 2023 at 09:48:34AM +0200, Johan Hovold wrote:
> > On Wed, Jun 28, 2023 at 10:24:04AM +0100, Srinivas Kandagatla wrote:
> > > For some reason we ended up with a setup without this flag.
> > > This resulted in inconsistent sound card devices numbers which
> > >  are also not starting as expected at dai_link->id.
> > >  (Ex: MultiMedia1 pcm ended up with device number 4 instead of 0)
> > > 
> > > With this patch patch now the MultiMedia1 PCM ends up with device number 0
> > > as expected.
> > 
> > This appears to fix the intermittent probe breakage that I see every
> > five boots or so:
> > 
> > [   11.843320] q6apm-dai 3000000.remoteproc:glink-edge:gpr:service@1:dais: Adding to iommu group 23
> > [   11.867467] snd-sc8280xp sound: ASoC: adding FE link failed
> > [   11.867574] snd-sc8280xp sound: ASoC: topology: could not load header: -517
> > [   11.867725] qcom-apm gprsvc:service:2:1: tplg component load failed-517
> > [   11.867933] qcom-apm gprsvc:service:2:1: ASoC: error at snd_soc_component_probe on gprsvc:service:2:1: -22
> > [   11.868379] snd-sc8280xp sound: ASoC: failed to instantiate card -22
> > [   11.873645] snd-sc8280xp: probe of sound failed with error -22
> > 
> > and which I've reported here:
> > 
> > 	https://lore.kernel.org/lkml/ZIHMMFtuDtvdpFAZ@hovoldconsulting.com/
> > 
> > as unrelated changes in timings resulting from that series made the
> > problem much harder (but not impossible) to hit.
> > 
> > With this fix, I've rebooted 20+ times without hitting the issue once.
> > 
> > I'm guessing that you found this issue while investigated that probe
> > race, Srini? It does look related, and it does seem to make the problem
> > go away, but I'm not comfortable claiming that the intermittent probe
> > breakage has been resolved without some analysis to back that up.
> 
> Ok, scratch that. I just hit the race again also with this patch
> applied:
> 
> [   11.815028] q6apm-dai 3000000.remoteproc:glink-edge:gpr:service@1:dais: Adding to iommu group 23
> [   11.838667] snd-sc8280xp sound: ASoC: adding FE link failed
> [   11.838774] snd-sc8280xp sound: ASoC: topology: could not load header: -517
> [   11.838916] qcom-apm gprsvc:service:2:1: tplg component load failed-517
> [   11.838996] qcom-apm gprsvc:service:2:1: ASoC: error at snd_soc_component_probe on gprsvc:service:2:1: -22
> [   11.839430] snd-sc8280xp sound: ASoC: failed to instantiate card -22
> [   11.844801] snd-sc8280xp: probe of sound failed with error -22

Isn't it rather an issue about the error code passing in qcom driver?
How about the change like below?


Takashi

--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1276,10 +1276,8 @@ int audioreach_tplg_init(struct snd_soc_component *component)
 	}
 
 	ret = snd_soc_tplg_component_load(component, &audioreach_tplg_ops, fw);
-	if (ret < 0) {
-		dev_err(dev, "tplg component load failed%d\n", ret);
-		ret = -EINVAL;
-	}
+	if (ret < 0)
+		dev_err_probe(dev, ret, "tplg component load failed %d\n", ret);
 
 	release_firmware(fw);
 err:
