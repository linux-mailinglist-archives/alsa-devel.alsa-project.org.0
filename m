Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB2E7456E1
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 10:05:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F39A7F1;
	Mon,  3 Jul 2023 10:04:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F39A7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688371501;
	bh=64oGb5ihfm4X63PYKvuMZKR34aUYooJu4D3Jsi79c0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VfQ4QEcHa2n1eFaZ0RT2Clp8XfgCvCLfqCcCklByGjdPMjdzmSc4oOjfOe1IFGTSm
	 NnrzKTKPda/Fw8FJikp07SElQTHcbfIvVWGnK8BHfhB11DMuChKYX+ZKURFYr9+3v3
	 MiaOOBBIcY1lV5bIbAEyKOnBXTh1/wvXHrkFA8RU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 219C2F80153; Mon,  3 Jul 2023 10:03:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEBE2F80124;
	Mon,  3 Jul 2023 10:03:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E18DEF80125; Mon,  3 Jul 2023 10:03:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDE25F80093
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 10:03:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDE25F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YARn7hEe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A36B060DFC;
	Mon,  3 Jul 2023 08:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70354C433C9;
	Mon,  3 Jul 2023 08:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688371418;
	bh=64oGb5ihfm4X63PYKvuMZKR34aUYooJu4D3Jsi79c0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YARn7hEeYvnYuhmItmaC1E7Nsf/3kr9CeC+L45w+pJDt1I5Q6074Rhul8TwyaQ2eX
	 +s9HwxY5eVDIFTUdsNuqnzgiXxZ/nYruWZ5FXub9537nFg5CGCqJipYZR1/xZZK46L
	 hPJqX6NV43l9MXwHhuxkrSvBaADp7k19xPtgsSQBlD3vKPxEMR+yZhZaQtCM+6fBxB
	 htsZsBJ2fj0yMv4ISRc4kw2J7F+1ymOOjC5QsdV0x2hTmQrKwkC77mEbg+3o1HaaC9
	 +qwBWcRapGI7ILMsiWAaSo2iH8GzRIfYFIPiwTnlSXgBnQcmQabWXzj8UVUic0fqp8
	 65zeDBgnNK7xQ==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qGEXI-0006af-2F;
	Mon, 03 Jul 2023 10:03:52 +0200
Date: Mon, 3 Jul 2023 10:03:52 +0200
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mark Brown <broonie@kernel.org>
Cc: johan+linaro@kernel.org, perex@perex.cz, tiwai@suse.com,
	lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	Stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: qdsp6: q6apm: use dai link pcm id as pcm device
 number
Message-ID: <ZKKA6K44mp_vjwtp@hovoldconsulting.com>
References: <20230628092404.13927-1-srinivas.kandagatla@linaro.org>
 <ZKJ9UrB8FRkLzLc-@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKJ9UrB8FRkLzLc-@hovoldconsulting.com>
Message-ID-Hash: 46HWKHTX22TFG5IYCFNRW4FMSLCRQ62S
X-Message-ID-Hash: 46HWKHTX22TFG5IYCFNRW4FMSLCRQ62S
X-MailFrom: johan@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/46HWKHTX22TFG5IYCFNRW4FMSLCRQ62S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 03, 2023 at 09:48:34AM +0200, Johan Hovold wrote:
> On Wed, Jun 28, 2023 at 10:24:04AM +0100, Srinivas Kandagatla wrote:
> > For some reason we ended up with a setup without this flag.
> > This resulted in inconsistent sound card devices numbers which
> >  are also not starting as expected at dai_link->id.
> >  (Ex: MultiMedia1 pcm ended up with device number 4 instead of 0)
> > 
> > With this patch patch now the MultiMedia1 PCM ends up with device number 0
> > as expected.
> 
> This appears to fix the intermittent probe breakage that I see every
> five boots or so:
> 
> [   11.843320] q6apm-dai 3000000.remoteproc:glink-edge:gpr:service@1:dais: Adding to iommu group 23
> [   11.867467] snd-sc8280xp sound: ASoC: adding FE link failed
> [   11.867574] snd-sc8280xp sound: ASoC: topology: could not load header: -517
> [   11.867725] qcom-apm gprsvc:service:2:1: tplg component load failed-517
> [   11.867933] qcom-apm gprsvc:service:2:1: ASoC: error at snd_soc_component_probe on gprsvc:service:2:1: -22
> [   11.868379] snd-sc8280xp sound: ASoC: failed to instantiate card -22
> [   11.873645] snd-sc8280xp: probe of sound failed with error -22
> 
> and which I've reported here:
> 
> 	https://lore.kernel.org/lkml/ZIHMMFtuDtvdpFAZ@hovoldconsulting.com/
> 
> as unrelated changes in timings resulting from that series made the
> problem much harder (but not impossible) to hit.
> 
> With this fix, I've rebooted 20+ times without hitting the issue once.
> 
> I'm guessing that you found this issue while investigated that probe
> race, Srini? It does look related, and it does seem to make the problem
> go away, but I'm not comfortable claiming that the intermittent probe
> breakage has been resolved without some analysis to back that up.

Ok, scratch that. I just hit the race again also with this patch
applied:

[   11.815028] q6apm-dai 3000000.remoteproc:glink-edge:gpr:service@1:dais: Adding to iommu group 23
[   11.838667] snd-sc8280xp sound: ASoC: adding FE link failed
[   11.838774] snd-sc8280xp sound: ASoC: topology: could not load header: -517
[   11.838916] qcom-apm gprsvc:service:2:1: tplg component load failed-517
[   11.838996] qcom-apm gprsvc:service:2:1: ASoC: error at snd_soc_component_probe on gprsvc:service:2:1: -22
[   11.839430] snd-sc8280xp sound: ASoC: failed to instantiate card -22
[   11.844801] snd-sc8280xp: probe of sound failed with error -22

Sorry about the noise.

Johan
