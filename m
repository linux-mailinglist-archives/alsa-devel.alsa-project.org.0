Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DF218F4FA
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 13:48:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5970315F8;
	Mon, 23 Mar 2020 13:47:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5970315F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584967717;
	bh=7C/45yxMVezqPY/AYGZVlsZQoI91jW9qnhU3Os7B61w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JPsBqD3LFmjJNvu8Dpp3zjAwcKr8oQJFsPTs8bNQR4h/OGAFNw4KADN2B7K91kAdZ
	 dhzUeq24MbgwlngS51l+7Z/MYvfshM7k4D2usGj4Lh5YUA2yCetwcOVMTaKKEsXiH6
	 H41nP6pnwPTc6dGQIt/QQswU7tlq5q5VeReX1Hpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DBCEF8015A;
	Mon, 23 Mar 2020 13:46:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E459DF80158; Mon, 23 Mar 2020 13:46:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3F74F800B9
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 13:46:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3F74F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NXIMczFa"
Received: from localhost (unknown [122.178.205.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ACA7C2072E;
 Mon, 23 Mar 2020 12:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584967601;
 bh=7C/45yxMVezqPY/AYGZVlsZQoI91jW9qnhU3Os7B61w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NXIMczFaCjgjWefIoljSdvKnyxoa/R+pZ0836WIdz3F7JJTFUPn43gKihTEtub0EV
 S9f0XkaoQGnBo362s/XqyLWh4Tz4MUi3qiekMOxc/gfvjFd1fJ5+zIU2NLJnvZnD17
 m7iRdJ9HdqB4e2YPr2gI4zMSpKN01TILfaUD2gdI=
Date: Mon, 23 Mar 2020 18:16:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] soundwire: stream: only change state if needed
Message-ID: <20200323124636.GN72691@vkoul-mobl>
References: <20200317105142.4998-1-pierre-louis.bossart@linux.intel.com>
 <20200320141528.GI4885@vkoul-mobl>
 <f212f561-27aa-265c-3f4c-45b2336ac145@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f212f561-27aa-265c-3f4c-45b2336ac145@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On 20-03-20, 09:33, Pierre-Louis Bossart wrote:
> On 3/20/20 9:15 AM, Vinod Koul wrote:
> > On 17-03-20, 05:51, Pierre-Louis Bossart wrote:
> > > In a multi-cpu DAI context, the stream routines may be called from
> > > multiple DAI callbacks. Make sure the stream state only changes for
> > > the first call, and don't return error messages if the target state is
> > > already reached.

Again I ask you to read emails carefully and not jump the gun.

> > For stream-apis we have documented explicitly in Documentation/driver-api/soundwire/stream.rst
> > 

< begins with quote from the file stream.rst>

> > "Bus implements below API for allocate a stream which needs to be called once
> > per stream. From ASoC DPCM framework, this stream state maybe linked to
> > .startup() operation.
> > 
> > .. code-block:: c
> > 
> >    int sdw_alloc_stream(char * stream_name); "

<end quote>

> > This is documented for all stream-apis.

This line is very important. But seems to have skipped

> > This can be resolved by moving the calling of these APIs from
> > master-dais/slave-dais to machine-dais. They are unique in the card.

This is suggestion, feel free to do anything as long as that conforms to
documentation laid out, which incidentally was written by Sanyog and
signed off by you. See 89634f99a83e ("Documentation: soundwire: Add more documentation")

> this change is about prepare/enable/disable/deprepare, not allocation or
> startup.

Sad to see this. Now am going to quote for all these, since you skipped
the line in above email.

For prepare:
"Bus implements below API for PREPARE state which needs to be called
once per stream. From ASoC DPCM framework, this stream state is linked
to .prepare() operation. Since the .trigger() operations may not
follow the .prepare(), a direct transition from
``SDW_STREAM_PREPARED`` to ``SDW_STREAM_DEPREPARED`` is allowed."

See the point about "once per stream".

On Enable:
"Bus implements below API for ENABLE state which needs to be called once per
stream. From ASoC DPCM framework, this stream state is linked to
.trigger() start operation."

See the point about "once per stream".

For Disable:
"Bus implements below API for DISABLED state which needs to be called once
per stream. From ASoC DPCM framework, this stream state is linked to
.trigger() stop operation."

See the point about "once per stream".

For deprepare:
"Bus implements below API for DEPREPARED state which needs to be called
once per stream. ALSA/ASoC do not have a concept of 'deprepare', and
the mapping from this stream state to ALSA/ASoC operation may be
implementation specific."

See the point about "once per stream".

> I see no reason to burden the machine driver with all these steps. It's not
> because QCOM needs this transition that everyone does.
> 
> As discussed earlier, QCOM cannot use this functionality because the
> prepare/enable and disable/deprepare are done in the hw_params and hw_free
> respectively. This was never the intended use, but Intel let it happen so
> I'd like you to return the favor. This change has no impact for QCOM and
> simplifies the Intel solution, so why would you object?
> 
> Seriously, your replies on all Intel contributions make me wonder if this is
> the QCOM/Linaro SoundWire subsystem, or if we are going to find common
> ground to deal with vastly different underlying architectures?

It is extremely sad that you chose to say this and didn't even try to
read the email and recheck the documentation you have signed off.

This has nothing to do with Qcom/Linaro. If you look at git tree in
Intel you will find that the original implementation was to use these from
machine driver. I am sure of this fact as I had written that code.

I am really getting extremely annoyed at your attitude in your
conversations and accusing me. This is not nice.
My replies are based on documentation and questioning the
implementation, which is my job here. I dont care if you feel bad about
me questions. I guess you dont like that someone is questioning, but I
dont care.

-- 
~Vinod
