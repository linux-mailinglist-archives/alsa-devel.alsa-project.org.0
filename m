Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1364A86C0
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 18:58:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AAF11683;
	Wed,  4 Sep 2019 18:57:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AAF11683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567616303;
	bh=xjiv/NllM/2TUBxU7A1g1SvCXLjSNwuOECeaETyWWxo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TpoYQoVumro7xNQugWUrlBrymWhto2XNHWjenlpu3ZsTSz6haMxsTzbXSUwaf3O7e
	 zqflacr7VwvkXZvkMacp4tilVh//tAuC0BtVEaZV2IyJJEWd29EsortMjfjNsGWgB9
	 eZ3KaIQCgW5bXtVEIecmDLUQwbOnPmD/Yw23pQMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 173F0F803D6;
	Wed,  4 Sep 2019 18:56:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E17A4F803A6; Wed,  4 Sep 2019 18:56:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFA68F80171
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 18:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFA68F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JdmbD9LV"
Received: from localhost (unknown [122.182.201.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B16A21670;
 Wed,  4 Sep 2019 16:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567616191;
 bh=/PClAjiL1I36PVpeMuFaSLb4sjjsS6Cd5FfGsDw5IzU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JdmbD9LVQPoKI53zMWAA3IwYish6qxu2qRdAaqk8p8XEvQFLoTyYLgPdIJgHn0NyX
 ttE6Up4kR0Sikt83zDFqOWaidpp9aRf/hCT+zGqTw6iMq4djQhr/fTyuARnGgDGRr6
 wZbQ2hwwuBLdi6tSHnepGrkr31MSRE8m80GYyzAY=
Date: Wed, 4 Sep 2019 22:25:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190904165522.GC2672@vkoul-mobl>
References: <20190821201720.17768-1-pierre-louis.bossart@linux.intel.com>
 <20190821201720.17768-5-pierre-louis.bossart@linux.intel.com>
 <20190822071835.GA30262@ubuntu>
 <f73796d6-fcfa-97c8-69ae-0a183edbbd97@linux.intel.com>
 <20190904073549.GL2672@vkoul-mobl>
 <4de9613c-2da4-8d39-6f99-3039811673b8@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4de9613c-2da4-8d39-6f99-3039811673b8@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de, gregkh@linuxfoundation.org,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 4/5] ASoC: SOF: Intel: hda: add
 SoundWire stream config/free callbacks
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

On 04-09-19, 08:31, Pierre-Louis Bossart wrote:
> On 9/4/19 2:35 AM, Vinod Koul wrote:
> > On 22-08-19, 08:53, Pierre-Louis Bossart wrote:
> > > Thanks for the review Guennadi
> > > 
> > > > > +static int sdw_config_stream(void *arg, void *s, void *dai,
> > > > > +			     void *params, int link_id, int alh_stream_id)
> > > > 
> > > > I realise, that these function prototypes aren't being introduced by these
> > > > patches, but just wondering whether such overly generic prototype is really
> > > > a good idea here, whether some of those "void *" pointers could be given
> > > > real types. The first one could be "struct device *" etc.
> > > 
> > > In this case the 'arg' parameter is actually a private 'struct snd_sof_dev',
> > > as shown below [1]. We probably want to keep this relatively opaque, this is
> > > a context that doesn't need to be exposed to the SoundWire code.
> > 
> > This does look bit ugly.
> > 
> > > The dai and params are indeed cases where we could use stronger types, they
> > > are snd_soc_dai and hw_params respectively. I don't recall why the existing
> > > code is this way, Vinod and Sanyog may have the history of this.
> > 
> > Yes we wanted to decouple the sdw and audio bits that is the reason why
> > none of the audio types are used here, but I think it should be revisited
> > and perhaps made as:
> > 
> > sdw_config_stream(struct device *sdw, struct sdw_callback_ctx *ctx)
> > 
> > where the callback context contains all the other args. That would make
> > it look lot neater too and of course use real structs if possible
> 
> the suggested sdw_callbback_ctx is really intel-specific at the moment, e.g.
> the notion of link_id and alh_stream_id are due to the hardware, it's not
> generic at all. And in the latest code we also pass the dai->id.

s/sdw_callback_ctx/intel_sdw_callback_ctx

Yes this code is intel specific and this would be intel specific too

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
