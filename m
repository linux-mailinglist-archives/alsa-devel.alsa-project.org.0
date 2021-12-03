Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13453467A18
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 16:10:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A79D92334;
	Fri,  3 Dec 2021 16:09:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A79D92334
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638544243;
	bh=u7v8dTDDxfk/B55gmLGIbW6jjLtetQCFgWPCWjMr4Pc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ztw6t8zjS0WlMtlWiRxqZvX5E6wgFs8TBoJ2JegGhtsQZhs+pLImvL3j9/YLf/ty0
	 3UZUXELwXeARv9rEYIM3AgrsZ8MFLNgxjDJyaJQp+jT16JL+S8NOojIWN9QkRvsFL5
	 YpXcKNAkJW3TWfD8Jrc63puAhDNNcmTCNf7Ziz90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE457F80249;
	Fri,  3 Dec 2021 16:09:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51C16F80246; Fri,  3 Dec 2021 16:09:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B512F80085
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 16:09:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B512F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="TjuLqaye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638544158;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=2bjcp/msHQ00yL90ECtPop5IeeDvIBRlvfdATMh29ng=;
 b=TjuLqaye4iM4Q7PUGROvuuz9fNjHspIJFXD/K6vmYSMPNnN0p6fhMIooaUFTd2GgGN
 mSHtVuM2E8JGx75lH7UQ5ct99upPJ7QNd/pui5QPJaCgPA9DMTn1Vclb4rZ3m5XGg4nq
 j32huNUhTFmx1nVkKXH+0snCynQHN3AH9dCdQ+y7lR4DL7uldDgC3R4L1ZVhlMKDTNPV
 IzKCnsfnODGM0RqTRBKvUSw3bT/3+Hil5H/mgstTYH2twOr0rRB7tvTCPAmN/Q0LK/Qh
 ToGIpB4jv69l8QNf3JTMlUAYkPbQdOkJygK+7ORjNye9c6UZ4f6ZZkd3I9/T8nNBrp7J
 a/sQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLUrKY7lg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.34.10 AUTH)
 with ESMTPSA id j03bcbxB3F9Hvz4
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 3 Dec 2021 16:09:17 +0100 (CET)
Date: Fri, 3 Dec 2021 16:09:13 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 5/5] ASoC: qcom: apq8016_sbc: Allow routing audio through
 QDSP6
Message-ID: <YaozGfiaL2RjeY9W@gerhold.net>
References: <20211202145505.58852-1-stephan@gerhold.net>
 <20211202145505.58852-6-stephan@gerhold.net>
 <455604c2-9b73-4b9b-2ce7-890aafe41845@linaro.org>
 <YaorZnQTwvXo6vrO@gerhold.net>
 <5c6607cc-ad2a-6f90-e087-78ef3bd39e80@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c6607cc-ad2a-6f90-e087-78ef3bd39e80@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht
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

On Fri, Dec 03, 2021 at 02:52:43PM +0000, Srinivas Kandagatla wrote:
> On 03/12/2021 14:36, Stephan Gerhold wrote:
> > On Fri, Dec 03, 2021 at 10:35:08AM +0000, Srinivas Kandagatla wrote:
> > > I have tested DB410c this use case in the past using similar patch [1].
> > > 
> > 
> > Did you use a different modem DSP firmware? (An older one maybe?)
> 
> It was very old which came with some Android release I guess.
> 

Right, that should be similar to the ones used on MSM8916
smartphones/tablets. I was really glad that the qdsp6 drivers (q6asm,
q6afe, ...) worked without any changes on MSM8916 by the way, thanks a
lot for all your work on them!

> > > > @@ -148,11 +266,16 @@ static const struct snd_soc_dapm_widget apq8016_sbc_dapm_widgets[] = {
> > > >    static int apq8016_sbc_platform_probe(struct platform_device *pdev)
> > > >    {
> > > > +	void (*add_ops)(struct snd_soc_card *card);
> > > >    	struct device *dev = &pdev->dev;
> > > >    	struct snd_soc_card *card;
> > > >    	struct apq8016_sbc_data *data;
> > > >    	int ret;
> > > > +	add_ops = device_get_match_data(&pdev->dev);
> > > > +	if (!add_ops)
> > > > +		return -EINVAL;
> > > 
> > > We will never hit the error case here because without a match we can not
> > > even enter the probe function.
> > > 
> > 
> > Theoretically it's possible to create platform devices through other
> > ways than the device tree (think of old board C files for example).
> > I agree that nobody should do that, but having this check here
> > at least avoids a NULL pointer dereference in this unlikely scenario.
> > 
> > Please let me know if I should remove it anyway, that's fine for me!
> 
> TBH, I don't have very strong opinion on this.
> 

Great, can I assume your Reviewed-by: applies without any changes then?

Thanks,
Stephan
