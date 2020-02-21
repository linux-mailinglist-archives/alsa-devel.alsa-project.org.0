Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE958167FAC
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 15:09:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26A3416C1;
	Fri, 21 Feb 2020 15:08:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26A3416C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582294170;
	bh=SQW2Tloj+P9ieTRVVtdKX5w/tBEVAZo/nmkjOkt/Agw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fnC2XqoqaGOS04WCatBc6bQDq+U+gV4Rg7sIPeBYi42rBcR8XJw/4CPhWDihC3W6n
	 rraIVHl5qU9fpg+tj9w7O8RH0sn6U0uNRgXK9DARTfVia0/ZReI1JPHQRETOVXFLiQ
	 Am0WT9IUcRp700qp1BT7KQNI7gu+lZlAzdlg9MsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B487F80273;
	Fri, 21 Feb 2020 15:07:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0927F8025F; Fri, 21 Feb 2020 15:07:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43CEBF800C5
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 15:07:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43CEBF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bo1t81zT"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01LE7d5q096493;
 Fri, 21 Feb 2020 08:07:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582294059;
 bh=/Bb8CwQv8zisZ+6sPwBaCyfYRotEM3SsyxwHKM2b2ns=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=bo1t81zThvTF/48gnEsr9H67q6De6cTc0vV5dbWBKUHfZByXwwa+nHm/nvvO00qAx
 pwdiY4cijVhaVEjS2yGvPFcDBhMYYNaYLa5rEP9nT8Gz+p5KcmBA1MaGulp7G2X+rb
 5ZkTTot1WdZ6T7nlHZ1At8T4fXr5AK0szfngoJTQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01LE7dEa045994
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 21 Feb 2020 08:07:39 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 21
 Feb 2020 08:07:38 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 21 Feb 2020 08:07:38 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01LE7YRU099845;
 Fri, 21 Feb 2020 08:07:35 -0600
Subject: Re: [PATCH] ASoC: ti: Allocate dais dynamically for TDM and audio
 graph card
To: Tony Lindgren <tony@atomide.com>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
 <20200214170322.GZ64767@atomide.com>
 <d9a43fcb-ed0f-5cd5-7e22-58924d571d17@ti.com>
 <20200217231001.GC35972@atomide.com>
 <5402eba8-4f84-0973-e11b-6ab2667ada85@ti.com>
 <20200218152833.GH35972@atomide.com>
 <40a803e2-6a08-2c73-0312-666441716daa@ti.com>
 <20200220201338.GW37466@atomide.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <6795a41e-87ad-b475-d3e4-e3a0be3c0ccc@ti.com>
Date: Fri, 21 Feb 2020 16:07:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200220201338.GW37466@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, linux-kernel@vger.kernel.org,
 Merlijn Wajer <merlijn@wizzup.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>, "Arthur D
 ." <spinal.by@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>
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

Hi Tony,

On 20/02/2020 22.13, Tony Lindgren wrote:
> * Peter Ujfalusi <peter.ujfalusi@ti.com> [200220 14:08]:
>> On 18/02/2020 17.28, Tony Lindgren wrote:
>>> Right. I'm not attached to the dummy dai, but looks like currently
>>> snd-soc-audio-graph-card won't work without it.
>>
>> The generic cards will link up a dummy dai/codec when it is needed by DPMC.
> 
> Not sure what should be fixed here..

The ASoC core creates dummy codec and dummy dai. They can be used by
machine drivers when there is a need for a dummy connection.

>>> And we potentially
>>> do need a place to configure TDM slot specific stuff for mcbsp.
>>
>> Yes, but you still have one port and one endpoint should not change the
>> configuration which is already in used for the other endpoint.
> 
> OK so what's the fix for snd-soc-audio-graph-card expecting a
> separate DAI then?

If it expects separate DAI in place where you don't actually have a DAI
then it should use the dummy dai.

>>> Oh, I think there are Android apps to do that though.. Never tried
>>> if they work on droid4. But if they do, doing a register dump of
>>> mcbsp3 would show up how it's configured.
>>
>> I don't see how you could record the data from the line which is
>> connected to McBSP_DX pin (the pin is output).
>>
>> But I might be missing something.
> 
> Yeah I don't know either, but the pins we have muxed for
> mcbsp3 are:
> 
> /* 0x4a100106 abe_pdm_ul_data.abe_mcbsp3_dr ag25 */
> OMAP4_IOPAD(0x106, PIN_INPUT | MUX_MODE1)
> 
> /* 0x4a100108 abe_pdm_dl_data.abe_mcbsp3_dx af25 */
> OMAP4_IOPAD(0x108, PIN_OUTPUT | MUX_MODE1)
> 
> /* 0x4a10010a abe_pdm_frame.abe_mcbsp3_clkx ae25 */
> OMAP4_IOPAD(0x10a, PIN_INPUT | MUX_MODE1)
> 
> /* 0x4a10010c abe_pdm_lb_clk.abe_mcbsp3_fsx af26 */
> OMAP4_IOPAD(0x10c, PIN_INPUT | MUX_MODE1)
> 
> Isn't the data receive there as mcbsp3_dr?

Yes, that's the one. _dx is the tx pin from McBSP pow.

>>> I think the link for the patches you posted is patching the
>>> snd-soc-audio-graph-card already?
>>
>> Yes it does, but the functionality is there via custom machine drivers.
>> What I afraid is that such a complex wiring as the Droid4 have it might
>> be not possible to use a generic - fits everything - driver without
>> making it a customized one ;)
>>
>> Otho, if the only thing is the machine level DAPM switching and linking
>> the paths then it might be relatively straight forward to extend the
>> simple-card family.
> 
> Yeah or maybe it just needs to be handled directly in the cpcap,
> mdm6600 codec drivers?

The cpcap driver should no nothing about mdm6600 or anything which is
outside of it, similarly to mdm6600.
The machine driver knows that in the driod4 you have McBSP2, McBSP3,
CPCAP, MDM6600 and WL1285. It is the role of the machine driver to make
these work together.

>>> Right. So right now it seems that for snd-soc-audio-graph-card
>>> needs the dummy dai, but it's unclear what would need to be
>>> changed to not use a dummy dai for mcbsp.
>>
>> Since simple-card family can and will connect up dummy dai/codec when
>> needed based on the setup, I would look at that and make it do so.
> 
> Oh so make simple-card spin up the dummy dai instead of mcbsp?

Not really, we have dummy dai/codec from core, the machine driver should
use them.

Just think about: what if you move the audio setup to a new board with
am5 for example? You will have McASP in place of McBSP, so you will also
patch it up to create dummy mcasp dais?
What if you move the setup to Tegra or imx, or qc? Patch everything up
to create dummy dais?

>>> The dts snippets I posted earlier do follow the graph bindings
>>> as far as I know. But just to confirm, do you see any need to
>>> move things around there?
>>
>> It also states that a port is a physical port which can have multiple
>> endpoints. But multiple endpoint != DAI. port == dai.
> 
> I guess I'm getting really confused now.. Are you saying
> the dts needs to be changed too now?

In a graph the port is the DAI. We have only one port in McBSP and it is
bi-directional (dr/dx pins + clk lines).

Usually you have one McBSP connected to one codec, graph is clean: port
to port.

In droid4 the physical lines are connecting together the 4 ports:
McBSP3, CPCAP_voice, MDM6600 and Wl1285, right?
It is a web ;)

But you still have _one_ port on the McBSP3 and not three. I guess the
endpoints are coming into picture at this point to represent that the
port is connected to multiple ports.
The endpoints should control the port which is their parent.

mcbsp3_port {
	reg = <0>;
	mcbsp3_ep0: endpoint0 { remote-endpoint = <&cpcap_voice_ep0>; };
	mcbsp3_ep1: endpoint1 { remote-endpoint = <&dmd6600_ep0>; };
	mcbsp3_ep2: endpoint2 { remote-endpoint = <&wl1285_ep0>; };
};

cpcap_voice_port {
	reg = <0>;
	cpcap_voice_ep0: endpoint0 { remote-endpoint = <&mcbsp3_ep0>; };
	cpcap_voice_ep1: endpoint1 { remote-endpoint = <&dmd6600_ep1>;};
	cpcap_voice_ep2: endpoint2 { remote-endpoint = <&wl1285_ep1>; };
};

Or something...

If the cpcap_voice_ep1 <-> dmd6600_ep1 link is enabled then the McBSP3
port is not, it is not part of the graph.

In any case you will need DPCM for this to work to push the needed
parameters to the codecs in case of codec2codec connection.

> 
> Regards,
> 
> Tony
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
