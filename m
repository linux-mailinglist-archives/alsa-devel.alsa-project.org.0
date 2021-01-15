Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD432F813A
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 17:51:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07E211827;
	Fri, 15 Jan 2021 17:50:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07E211827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610729507;
	bh=SWpj2XgdzHNr8tZWUV/07/8gWoJsTqOO6FB0z9pFSkk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vIRIZnoAVyBTHxzpIDzeeeQGxtfTt6w1KJRkmsSnkktiAwcKHXz5PwCJWzLLqTB4B
	 azvGsdQAS3hEiA8gpL2LTG4vpn3Jv3JHPDYnYZgvhFk/Yehn/B8FpYzD76pFw55yoD
	 2OjbuV9cEo2RBtK3FoRtIdicD6nDjyjJ8rxRLvuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5D52F80254;
	Fri, 15 Jan 2021 17:50:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB40BF801ED; Fri, 15 Jan 2021 17:50:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08492F80113
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 17:50:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08492F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="nA6QuNAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610729404;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:From:
 Subject:Sender;
 bh=bnq8rv1k3mm+/qdYaU41apCzjRUj7JEz0HH/JJ/53pQ=;
 b=nA6QuNATJa1Yutu0Tdv59mw97bLVbzrEZTOWmUFcL6BGxsuiEVd/MWX6IHU/P4+TtM
 0faV6Jw1jFN5OtJrlDEN3rVj1IcwP39osBI5xLbH2p7xDE9Qb0AAQSNL7NJ6VQxVb4RA
 NRsIRwXRkuF5nJWmdIlBvDGoKFg1dlozd+PkqX0S3OqsKoIg793wZtuDQVagNrUpL3+I
 mCE2pge9GVJMsyXtDBPj+J1sW9LjyDEVQmTQF41rWX16eny7ZUF/sw57X7ZW8lzv+chK
 z2kTCsG+Z1kZ3rMnA2M4cllYAaxsus7H6nqBJwZZXnooxrl1vf+8CKjs4yPCNS6K8zC3
 Gkcw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j5Icup"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id R0a218x0FGo3rl4
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 15 Jan 2021 17:50:03 +0100 (CET)
Date: Fri, 15 Jan 2021 17:49:58 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: qcom: lpass: Fix hardcoded SC7810 DAI IDs
Message-ID: <YAHHtup8hgfdf1qm@gerhold.net>
References: <20210114094615.58191-1-stephan@gerhold.net>
 <68691a9f-f65d-da1a-a413-b624567ccc5f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68691a9f-f65d-da1a-a413-b624567ccc5f@linaro.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
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

Hi Srinivas,

On Fri, Jan 15, 2021 at 04:14:05PM +0000, Srinivas Kandagatla wrote:
> On 14/01/2021 09:46, Stephan Gerhold wrote:
> > [...]
> > The problem was introduced in commit 7cb37b7bd0d3 ("ASoC: qcom: Add support
> > for lpass hdmi driver"). The mistake made there is that lpass.h now contains
> > 
> >    #include <dt-bindings/sound/sc7180-lpass.h>
> > 
> 
> This thing was obviously missed in the review and testing, and its really
> bad idea to have multiple header files based on different SOC for the same
> driver. We are planning to add some basic tests in ciloop to catch such
> issues!
> 
> IMO, Its better to sort it out now, before this gets complicated!
> 
> Am thinking of making a common header file ("lpass,h") and include that in
> the existing SoC specific header for compatibility reasons only.
> 
> In future we should just keep adding new DAI index in incremental fashion to
> common header file rather than creating SoC specific one!
> 
> 
> > [...]
> > ---
> > Srinivas mentioned a potential different fix here:
> > https://lore.kernel.org/alsa-devel/4b34bd4f-e7bc-84f9-5e8a-b2348c17b7aa@linaro.org/
> > 
> > Instead of this patch, we could change the dt-bindings for LPASS,
> > so that all SoCs use consistent DAI IDs.
> 
> TBH, Am inclined to do the right thing and make DAI ID's consistent!
> Like we do at the dsp afe interfaces.
> 
> This will also bring in the need to add .of_xlate_dai_name callback along
> with fixing sc7180_lpass_cpu_dai_driver array index.
> 
> Without this the code will end up very confusing!
> 

I agree that this would be cleaner, as I mentioned here:

> 
> > 
> > In general, I think this might be cleaner, especially in case more special
> > DAIs are added in the future. However, when I made this patch (before Srinivas
> > mentioned it) I tried to avoid changing the dt-bindings because:
> > 
> >    - Changing dt-bindings after they are added is generally discouraged.
> > 
> > but more importantly:
> > 
> >    - lpass-ipq806x.c does not seem to have PRIMARY, SECONDARY, ...
> >      but something completely different. I know nothing about that
> >      platform so I don't know how to handle it.
>

... but it's still not clear to me how to handle ipq806x. The DAIs it
has don't really look similar to what MSM8916 and SC7180 have.

Right now it declares just a single DAI, but multiple "ports":

enum lpaif_i2s_ports {
	IPQ806X_LPAIF_I2S_PORT_CODEC_SPK,
	IPQ806X_LPAIF_I2S_PORT_CODEC_MIC,
	IPQ806X_LPAIF_I2S_PORT_SEC_SPK,
	IPQ806X_LPAIF_I2S_PORT_SEC_MIC,
	IPQ806X_LPAIF_I2S_PORT_MI2S,
};

static struct snd_soc_dai_driver ipq806x_lpass_cpu_dai_driver = {
	.id	= IPQ806X_LPAIF_I2S_PORT_MI2S,
	/* ... */
};

I suppose we could just declare this as MI2S_PRIMARY but not sure if
that is accurate. Do you have more information about this platform?

Thanks,
Stephan
