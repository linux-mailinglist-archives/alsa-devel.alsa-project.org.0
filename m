Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B379306DA8
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jan 2021 07:37:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B45F216CB;
	Thu, 28 Jan 2021 07:36:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B45F216CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611815836;
	bh=QDOSqhvU7In7AP5y3fBRGjSMcbYvxVMLRZUuhnF0Q24=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TIk6Mqcjd6uv9ZaFypWpz81++Zls4R90VKiIpa+ItHST6BYStN8a6Zla9FHrMDU9J
	 QSAqYgTbrG/OVR3SDgdnXpfXSgjEuBFJIQQQ779Y3dQSsvsB7418lJojz1Q/JH56VN
	 +Ht9+SQD+P+MWyDmS4pDNDOZ98JlhYaXlVr/EHs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12E89F80158;
	Thu, 28 Jan 2021 07:35:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03DEDF8015B; Thu, 28 Jan 2021 07:35:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from muru.com (muru.com [72.249.23.125])
 by alsa1.perex.cz (Postfix) with ESMTP id 4B322F800D1
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 07:35:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B322F800D1
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 2C6A680A9;
 Thu, 28 Jan 2021 06:35:39 +0000 (UTC)
Date: Thu, 28 Jan 2021 08:35:30 +0200
From: Tony Lindgren <tony@atomide.com>
To: =?utf-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH] ASoC: ti: Allocate dais dynamically for TDM and audio
 graph card
Message-ID: <YBJbMqt4PbeU/fD4@atomide.com>
References: <20210124092713.GA22195@amd>
 <2a9e7655-3d32-feb5-080c-8928a96f417e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a9e7655-3d32-feb5-080c-8928a96f417e@gmail.com>
Cc: Carl Philipp Klemm <philipp@uvos.xyz>, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, aaro.koskinen@iki.fi, merlijn@wizzup.org,
 sre@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 Pavel Machek <pavel@ucw.cz>, phone-devel@vger.kernel.org, spinal.by@gmail.com,
 jarkko.nikula@bitmer.com
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

* Péter Ujfalusi <peter.ujfalusi@gmail.com> [210126 06:00]:
> On 1/24/21 11:27 AM, Pavel Machek wrote:
> > From: Tony Lindgren <tony@atomide.com>
> > +	for (i = 0; i < mcbsp->dai_count; i++) {
> > +		struct snd_soc_dai_driver *dai = &mcbsp->dais[i];
> > +
> > +		dai->name = devm_kasprintf(mcbsp->dev, GFP_KERNEL, "%s-dai%i",
> > +					   dev_name(mcbsp->dev), i);
> > +
> > +		if (i == 0) {
> > +			dai->probe = omap_mcbsp_probe;
> > +			dai->remove = omap_mcbsp_remove;
> > +			dai->ops = &mcbsp_dai_ops;
> > +		}
> 
> You are effectively creating extra dummy-dais (no ops), but naming them as
> McBSP.
> The dummy-dais will only work if the real dai is in use and the dai link
> which contains the real dai must be configured (TDM slots, format, channels)
> to accomodate the link which contains the dummy-dai.
> 
> The idea did not aged well for me ;)
> It still looks and sounds like a hack to model the TDM slots on a single DAI
> as multiple DAIs just to satisfy a generic binding which is not aimed to
> satisfy the droid4 setup (which is far from anything simple).

After thinking about this a bit more, I think the voice call dai should be
created by the voice dai. When we have an active voice call, the data
transfer is completely out of control of the kernel mcbsp driver. It needs
to be only configured on the pmic.

So I'm suggesting tha we create the modem voice call dai as a child for
sound/soc/codecs/cpcap.c, does that sound OK to you guys?

I think from snd-soc-audio-graph-card binding point of view, we'd just move
the cpu_dai_mdm endpoint out of the mcbsp in the device tree and drop the
$subject patch. Then the dts for the pmic voice codec becomes something
like this (untested):

cpcap_audio: audio-codec {
	#sound-dai-cells = <1>;
	#address-cells = <1>;
	#size-cells = <0>;

	port@0 {
		reg = <0>;
		cpcap_audio_codec0: endpoint {
		};
	};
	port@1 {
		reg = <1>;
		cpcap_audio_codec1: endpoint@0 {
		};
		cpu_dai_mdm: endpoint@1 {
			reg = <1>;
			dai-format = "dsp_a";
			frame-master = <&cpcap_audio_codec1>;
			bitclock-master = <&cpcap_audio_codec1>;
			remote-endpoint = <&mot_mdm6600_audio_codec0>;
		};
        };
};

For things like recording a voice call, I think mcbsp could be configured
to also listen on the traffic and dump it out. I guess that could also
happen directly with calls from the sound/soc/codecs/cpcap.c driver to
the mcbsp driver since we havethe audio graph mapping. Anyways, that's a
separate series of patches, still something to consider.

Regards,

Tony
