Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F298B4CA62E
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 14:41:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81DFC1DE1;
	Wed,  2 Mar 2022 14:40:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81DFC1DE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646228498;
	bh=6q2kRdswExBAa2xgwYObFAs5vGYmm8B9taGuz5HLlXw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mLdhJgxWgnMfIXnd896WTuEDJID3IWeY+T/2rElFaSefLiQQ58yZdv9u19FiADR3H
	 zJGtk+1ImoQiAVKe6mHh73mfePUtJic7E66waWcwbammRNfPUqZQC1vyQiHA+ycwyM
	 5wORvCpgGPgyC7zoa5OHfRCdn5c2WKDcA6hwFkOQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D096BF804AC;
	Wed,  2 Mar 2022 14:40:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B71ACF80054; Wed,  2 Mar 2022 14:40:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DD65F80054
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 14:40:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DD65F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="art1XNi3"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 222CLnEh014849;
 Wed, 2 Mar 2022 07:40:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=+ZHXvfB4+x5sXa1tYzjh7at6YCaVtS1TQokImGO6/U4=;
 b=art1XNi3skDpM/2pyDTn7p/ES/4BUFe5soXDHLNkGKwPu41eqxjRRDYh23M+Hsv/ZJ5J
 LzZaAj+yAv99YwvENqkX8N/5bjTUmbFukb6YV+wgqw4pg58YTimVVYZyW3WrRRycDTv0
 WuXlD1H1hMGBXLAcTIQzem+xVfzYEGs+D2pfd1DRdxswUyW2XCFN+kK2haZdYh59fx3Y
 gNaAP23TRAwH9BtXps6Rdbyh2BgUeCPCbXzRY/R+vR1oxE4S/8Pgu5dqQggOZ/+uLjkY
 6MJPueAIQkCD+TiTX/H6cPCr30ts3rKhDB2BEUDWXzqmdl7HV9ev6WECEenFs04kIaML IA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3eh5bq2kw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 02 Mar 2022 07:40:19 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 2 Mar
 2022 13:40:17 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Wed, 2 Mar 2022 13:40:17 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2EF597C;
 Wed,  2 Mar 2022 13:40:17 +0000 (UTC)
Date: Wed, 2 Mar 2022 13:40:17 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: Re: [PATCH] wm8962: add a simple DMIC enable control
Message-ID: <20220302134017.GL38351@ediswmail.ad.cirrus.com>
References: <20220202133511.GB18506@ediswmail.ad.cirrus.com>
 <62ee89792a3f8921b4aad4d47f4db0bf2adb33f0.camel@puri.sm>
 <20220203110518.GF18506@ediswmail.ad.cirrus.com>
 <7b3306d7a80f605973c932a0a4679bcac067ae8a.camel@puri.sm>
 <20220204172116.GG18506@ediswmail.ad.cirrus.com>
 <fca54f527f619e21c19918ed3165d9ec8f85f6f6.camel@puri.sm>
 <20220207142129.GB112838@ediswmail.ad.cirrus.com>
 <20220301134441.GK38351@ediswmail.ad.cirrus.com>
 <b867e8d576536907d383e66f85afee995074b53b.camel@puri.sm>
 <ebede30e994b8178c4a929814c7f85739656c621.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ebede30e994b8178c4a929814c7f85739656c621.camel@puri.sm>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: IgL7BZZZhX6_aNLDUHeuK1Zq9G8kNQun
X-Proofpoint-ORIG-GUID: IgL7BZZZhX6_aNLDUHeuK1Zq9G8kNQun
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, kernel@puri.sm, patches@opensource.cirrus.com,
 tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org, geert@glider.be,
 daniel.baluta@nxp.com
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

On Wed, Mar 02, 2022 at 12:48:28PM +0100, Martin Kepplinger wrote:
> Am Dienstag, dem 01.03.2022 um 15:00 +0100 schrieb Martin Kepplinger:
> > Am Dienstag, dem 01.03.2022 um 13:44 +0000 schrieb Charles Keepax:
> > > On Mon, Feb 07, 2022 at 02:21:29PM +0000, Charles Keepax wrote:
> > > > On Mon, Feb 07, 2022 at 11:49:32AM +0100, Martin Kepplinger
> > > > > Am Freitag, dem 04.02.2022 um 17:21 +0000 schrieb Charles
> > > > > > On Fri, Feb 04, 2022 at 10:43:53AM +0100, Martin Kepplinger
> > that's really nice of you to ask. Sorry for not replying earlier.
> > Mainly cset "name='MIXINR PGA Volume' 0,0" made things much better
> > indeed. I took a break from this then and the issue is still open,
> > here:
> > https://source.puri.sm/Librem5/librem5-base/-/merge_requests/296
> > or if you want to look at the current ucm file:
> > https://source.puri.sm/Librem5/librem5-base/-/blob/bb48912242dd0db1f35c6de8425984414c6d37bb/default/audio/ucm2/Librem_5/HiFi.conf
> > 
> > As you know I'm no expert with the codec and this definitely can be
> > improved: When visualizing the signal, it doesn't look "good" yet and
> > the signal strength seems to only go to 50% of the available scale
> > (in
> > the gnome volume setting). Actually I'll talk about this to Guido
> > tomorrow and even though it is kind of usable now, I hope to that we
> > can come up with a profile that we're preliminarliy happy with.
> Let me forward the commit message I just did for the ucm settings here,
> now that I have a *bit* of an overview of the codec:
> 
> There are 3 Volume controls for the analog parts, all before the ADC.
> In order from Jack to ADC, they are:
> 
> numid=10,iface=MIXER,name='Capture Volume'
>    ; type=INTEGER,access=rw---R--,values=2,min=0,max=63,step=0
>    : values=63,63
>    | dBscale-min=-23.25dB,step=0.75dB,mute=0
> 
> "Input PGA Volume Control". 31=0dB. We use 39=+6dB.
> 
> numid=7,iface=MIXER,name='MIXINR PGA Volume'
>    ; type=INTEGER,access=rw---R--,values=1,min=0,max=7,step=0
>    : values=7
>    | dBrange-
>      rangemin=0,,rangemax=1
>        | dBscale-min=0.00dB,step=6.00dB,mute=0
>      rangemin=2,,rangemax=2
>        | dBscale-min=13.00dB,step=13.00dB,mute=0
>      rangemin=3,,rangemax=4
>        | dBscale-min=18.00dB,step=2.00dB,mute=0
>      rangemin=5,,rangemax=5
>        | dBscale-min=24.00dB,step=0.00dB,mute=0
>      rangemin=6,,rangemax=7
>        | dBscale-min=27.00dB,step=3.00dB,mute=0
> 
> "Right input PGA to Right input Boost-Mixer Gain"
> 0=0dB. we use 1=+3dB.
> 
> 
> numid=8,iface=MIXER,name='MIXINR IN3R Volume'
>   ; type=INTEGER,access=rw---R--,values=1,min=0,max=7,step=0
>   : values=6
>   | dBscale-min=-15.00dB,step=3.00dB,mute=0
> 
> 5=0dB. we use 6=+3dB. That's a later amplifier, "Boost-Mixer Gain".
> 
> ("quotes" are from the datasheet)
> 
> Still, the recording sounds pretty good I think, but since gnome sound-
> recording doesn't visualize the signal waves - whatever that means :)
> I'll look at the file in audacity or something similar later.
> 

Yeah I have been having a look at your patch you linked. I think
there are still maybe a couple things I am not sure on. I would
try removing these two lines:

cset "name='MIXINR IN3R Switch' on"
cset "name='MIXINR IN3R Volume' 6"

I am pretty sure we want to be using the PGA path here. If you
check Figure 13 in the datasheet, you can route IN3R to
MIXINR either through the IN3R input or through the PGA input.
I suspect we want to come through the PGA. Using the IN3R path
should mean the PGA volume has no effect, it is effectively
bypassing the PGA. You may need to also add:

cset "name='MIXINR PGA Switch' on"

Although your previous control dumps had that input set
on. I suspect if you have both enabled you will get some slightly
weird effects, there is probably a slightly phase delay through
the PGA and there won't be on the direct path, so when they mix
together it will likely sound weird.

Hopefully that gets us to a clean signal. The settings described
in your commit message give +9dB analogue gain which seems
reasonable to me, and from the patch itself looks like you have
+15dB digital gain, which feels a little high but not total
unreasonable.

Thanks,
Charles
