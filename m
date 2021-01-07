Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2C72ED4B9
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 17:49:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99F2C1694;
	Thu,  7 Jan 2021 17:48:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99F2C1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610038140;
	bh=T4JV9RGym6W8KHChs3hbmT9y/UEjB4S59PeI0+GDSGU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a+7AvOJeWJv4NxaSKOVOWlWjI0NENFDBgQtQ+HK/5kC2tfRKty5leTB2HKjzfBhVg
	 g7gjhfFKJ/Vq/L38i7hIioCYvFuzxVga2Ihry8U/7kSDr5o0PV2NqJWmEyfOJx8P9F
	 +giJp6o7AiGD8mnJBt0qQ5O9w6GOOjeS7SJjsiY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B8E8F80268;
	Thu,  7 Jan 2021 17:47:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F93DF80258; Thu,  7 Jan 2021 17:47:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8EACF800FD
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 17:47:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8EACF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="ZaywqVgT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610038040;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:From:
 Subject:Sender;
 bh=X9XzwfzJf0RYI3CMdzGR9FkBLKJdmQnbMp6CNAxJCJA=;
 b=ZaywqVgTR+A1Tu0kG37pKVSJS8JCrw9DnW2hXLrDQiHUOI4Ym5Z6wZZbraUH2iuk/z
 4lRmWFEmQvhji6AIe7gEOcj56YNrOtGrQPHN/LHl4HZzulKL/Pq7MixOUyqH2TgBjnTc
 PT8vChwptp9kWwhNuwozKPitI49r87A29xtxvriyRsEXE6orm6vkijIUZUFG2lIpRjwj
 UnFKZNGgdomCNCLcsL1SUt71WTIgTSAkqZCDR0qgY9NzrBGPwHLmmNmbvSMEfEqWymbJ
 WwgPB3AjuzEYRBbQmikFKAeJrgYkngZ8MKyKjuAwrzSHLIgwH6MR6geRnWMiSyWo5kPk
 1eqg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8jwIc/AY4o="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id R0a218x07GlJ6Aw
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 7 Jan 2021 17:47:19 +0100 (CET)
Date: Thu, 7 Jan 2021 17:47:16 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: hdmi-codec: Fix return value in
 hdmi_codec_set_jack()
Message-ID: <X/c7B5c382TV/f76@gerhold.net>
References: <20210107162640.313859-1-stephan@gerhold.net>
 <20210107163600.GE4726@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210107163600.GE4726@sirena.org.uk>
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Cheng-Yi Chiang <cychiang@chromium.org>
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

On Thu, Jan 07, 2021 at 04:36:00PM +0000, Mark Brown wrote:
> On Thu, Jan 07, 2021 at 05:26:40PM +0100, Stephan Gerhold wrote:
> 
> > However, hdmi_codec_set_jack() returns -E*OP*NOTSUPP if jack detection
> > is not supported, which is not handled in apq8016_sbc and soc_component_ret().
> > Make it return -ENOTSUPP instead to fix sound and silence the errors.
> 
> You will also need to update imx-hdmi, it is explicitly checking for
> -EOPNOTSUPP so this will break it.  Having two error codes with such
> similar names is rather unfortunate.

Right, thanks for mentioning this! Apparently I only checked 5.10 for
other uses of -EOPNOTSUPP... Will send a v2 shortly!

Thanks,
Stephan
