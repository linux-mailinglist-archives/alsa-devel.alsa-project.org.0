Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1645A15849C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 22:15:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B55251671;
	Mon, 10 Feb 2020 22:14:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B55251671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581369348;
	bh=mZNMvw0Amqqx15bwT2knV75UAJtgD53KvMr/W+pLGRU=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SLMDDzThgKnzWUFMrR9UkR/uqhxGda4zly60lE/TovgxatH1FX9qH9ZIpxpXhHi6e
	 099/giyxap199TLVWUQbABH0P79oQE0pXIvSEz4RFHqaaEX5fwFK7VKulbvigRJlrQ
	 eZ9FHgOrDVINutSF23oa/me67q7gGuXPaLd6wJs0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF02FF8014F;
	Mon, 10 Feb 2020 22:14:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E8B5F80157; Mon, 10 Feb 2020 22:14:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.serbinski.com (mail.serbinski.com [162.218.126.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60AAAF800E7
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 22:14:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60AAAF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=serbinski.com header.i=@serbinski.com
 header.b="WOvn/ALS"
Received: from localhost (unknown [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id 61398D006F9;
 Mon, 10 Feb 2020 21:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
 by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zu_DfRZFKs-n; Mon, 10 Feb 2020 16:13:52 -0500 (EST)
Received: from mail.serbinski.com (localhost [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id 9949FD00693;
 Mon, 10 Feb 2020 16:13:52 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 9949FD00693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
 s=default; t=1581369232;
 bh=I3EkcQkTwwd2J+O4KVzA9fWCbXcpR3MPvY39AeBuXPc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WOvn/ALSo44nlC/+0cDovkez1JTNslVLaIIbhuvoM+/3oa4nBGa1pnceTS0UoWX6c
 08w+kT2ztltcs1aFhDmLxRRrQlebR647uWLrm5h5kITpI1/Gl9QgmcVGSIoIFTvokp
 NeLvnj41zH+LetieRTbae51hBYAK18UL2QF9t+xE=
MIME-Version: 1.0
Date: Mon, 10 Feb 2020 16:13:52 -0500
From: Adam Serbinski <adam@serbinski.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <20200210200839.GG14166@sirena.org.uk>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-9-adam@serbinski.com>
 <20200210133636.GJ7685@sirena.org.uk>
 <18057b47c76d350f8380f277713e0936@serbinski.com>
 <20200210182609.GA14166@sirena.org.uk>
 <f88d21773f47f5a543a17ad07d66f9b7@serbinski.com>
 <20200210200839.GG14166@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4-beta
Message-ID: <7c57801d8f671c40d4c6094e5ce89681@serbinski.com>
X-Sender: adam@serbinski.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 8/8] ASoC: qcom: apq8096: add kcontrols
	to set PCM rate
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2020-02-10 15:08, Mark Brown wrote:
> On Mon, Feb 10, 2020 at 03:00:55PM -0500, Adam Serbinski wrote:
>> On 2020-02-10 13:26, Mark Brown wrote:
> 
>> > To repeat my comment on another patch in the series there should still
>> > be some representation of the DAI for this device in the kernel.
> 
>> Respectfully, I'm not sure I understand what it is that you are 
>> suggesting.
> 
>> Is it your intention to suggest that instead of adding controls to the
>> machine driver, I should instead write a codec driver to contain those
>> controls?
> 
> I have already separately said that you should write a CODEC driver for
> this CODEC.  I'm saying that this seems like the sort of thing that
> might fit in that CODEC driver.

I see. My initial thought with respect to the codec driver would be just 
to use bt-sco.c, which is a dummy codec. I can certainly implement a new 
codec driver.

>> Or is it your intention to suggest that something within the kernel is
>> already aware of the rate to be set, and it is that which should set 
>> the
>> rate rather than a control?
> 
> That would be one example of how such a CODEC driver could be
> configured, and is how other baseband/BT devices have ended up going
> (see cx20442.c for example).

I am not aware of how this could be done for bluetooth, since the value 
still has to originate from userspace. The driver you referred to 
supports only a single sample rate, whereas for bluetooth, 2 sample 
rates are required, and nothing in the kernel is aware of the 
appropriate rate, at least in the case of the qca6174a I'm working with 
right now, or for that matter, TI Wilink 8, which I've also worked with.

My concern with implementing this in a new codec driver, is that this 
codec driver will be bound to qdsp6, since its purpose is to work around 
a characteristic of this DSP. Under simple-card, for instance, it would 
be redundant, since in that case, the parameters userspace uses to open 
the pcm will be propagated to the port. But under qdsp6, userspace could 
open the pcm at 44.1 kHz, yet the backend port is still set to 8 or 16 
kHz, and the DSP resamples between them, so the sole purpose of this 
change is to allow userspace to deliver the required sample rate to the 
back end of qdsp6.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
