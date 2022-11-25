Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB7D638DC1
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 16:51:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5CEB174D;
	Fri, 25 Nov 2022 16:50:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5CEB174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669391492;
	bh=b5IcuunDzA+pjT19l/9rq8LoojN9Q+/SGRLbtRzKOz4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZFeoW1WQeN8bc4J8GDq7+neWOGHlchXbmdXx6WfHmByvhqtJCCDEKpoHlYHeO6f0H
	 kauPYXufoW0Sw51Gboq7IxWYSsoWfc1htvGig5O4XNcQbkdJVqoX9NBz/1qGoZm5IU
	 caxiecMWihrHXx/jHJnCefngxW+yAtqUuj1Dv9kA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F107F804C2;
	Fri, 25 Nov 2022 16:50:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5788F8047C; Fri, 25 Nov 2022 16:50:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85459F8014E
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 16:50:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85459F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="fW/z/+Mv"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2APDajpE016694; Fri, 25 Nov 2022 09:50:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=wp5bEiofcFAuumJ4kmy+pC74tinHVBJltbLqOj0XD6E=;
 b=fW/z/+MvNFjoFpk5N9FQUKpDEPiSSJ1KlY1AZn5x/9Tsn/emq+gwkYPhwwk4v4wNhh96
 RnehhYb5xvysd/BA2Fol4/CY2u3gUJDGbcrH92S7gccHrVOdQwo8DfjoKUOw/v8rC9+4
 yiI0srnvLObfIVjo1FT71zYGW9BsY88a0n6R+N/BpLMmptu3ZUSkgZygZdYNhC/E9/L2
 BaJU7OO5FE+bnI71FZ0/qoI80AgA8IQNBv3zTUvTrp8dQoY6pSPP0sMkaW4pOiaezrCJ
 uIOtLLXPqs7amneCMZzZdYT99YO+qhGMYpbO6KQTVopByhzM8sql2OVH8GoENBrv9SIh 5A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6yfyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Nov 2022 09:50:25 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 25 Nov
 2022 09:50:23 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Fri, 25 Nov 2022 09:50:23 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5C2D62BA;
 Fri, 25 Nov 2022 15:50:23 +0000 (UTC)
Date: Fri, 25 Nov 2022 15:50:23 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>
Subject: Re: SOC_DOUBLE_R_SX_TLV controls broken in cs24l51 driver
Message-ID: <20221125155023.GF105268@ediswmail.ad.cirrus.com>
References: <CABDcavYdsk-O4x3oPX4i4+T5wsoZV26_kpEq6JvpD8A_cAGHxg@mail.gmail.com>
 <20221124111336.GE105268@ediswmail.ad.cirrus.com>
 <CABDcavbRryENG58LO7+gbJeKbBBPP1uG1Xc00yXUBNzspWpWoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABDcavbRryENG58LO7+gbJeKbBBPP1uG1Xc00yXUBNzspWpWoA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: oEp1YLz9lHd_bE8JVFLILUcI_6rcWsLf
X-Proofpoint-GUID: oEp1YLz9lHd_bE8JVFLILUcI_6rcWsLf
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 James Schulman <james.schulman@cirrus.com>,
 Tan =?utf-8?B?TmF5xLFy?= <tannayir@gmail.com>
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

On Thu, Nov 24, 2022 at 02:54:15PM +0100, Guillermo Rodriguez Garcia wrote:
> El jue, 24 nov 2022 a las 12:13, Charles Keepax
> (<ckeepax@opensource.cirrus.com>) escribió:
> >
> > On Thu, Nov 24, 2022 at 10:57:34AM +0100, Guillermo Rodriguez Garcia wrote:
> > > Hi all,
> > >
> > > I am using a dev board with a Cirrus Logic cs24l51 codec.
> > >
> > > This used to work fine prior to kernel version 5.x, however after 5.x
> > > it is not possible to set certain values for ALSA controls from
> > > userspace.
> > >
> > > I believe this is related to the input validation that is mentioned in
> > > this thread: https://lore.kernel.org/all/Yph8C3bRxcr6ogW7@sirena.org.uk/T/,
> > > and possibly in this commit: 4f1e50d6a9cf9c1b8c859d449b5031cacfa8404e
> > > ("ASoC: ops: Reject out of bounds values in snd_soc_put_volsw_sx()")
> > >
> > > For the cs24l51, all the controls that fail are using the
> > > SOC_DOUBLE_R_SX_TLV macro.
> > >
> > > I have traced this to the checks in snd_soc_put_volsw_sx, specifically
> > > the (val > max - min) check:
> > >
> >
> > Can you try these two patches:
> >
> > https://lore.kernel.org/all/165236477046.1016627.15470197691244479154.b4-ty@kernel.org/
> 
> Thanks.
> In my tests, these patches seem to fix the problem for some values,
> but not for all of them:
> 
> $ amixer cset name='Analog Playback Volume' '208','208'
> numid=3,iface=MIXER,name='Analog Playback Volume'
>   ; type=INTEGER,access=rw---R--,values=2,min=0,max=228,step=0
>   : values=208,208
>   | dBscale-min=-102.00dB,step=0.50dB,mute=0
> 
> $ amixer cset name='Analog Playback Volume' '180','180'
> amixer: Control default element write error: Invalid argument
> 
> Looking at the code I'd say that patch 1/2 is correct however I have
> doubts about patch 2/2:
> 
>         val_mask = mask << rshift;
>         val2 = (ucontrol->value.integer.value[1] + min) & mask;
> +
> +       if (mc->platform_max && val2 > mc->platform_max)
> +           return -EINVAL;
> +       if (val2 > max)
> +           return -EINVAL;
> +
>         val2 = val2 << rshift;
> 
>         err = snd_soc_component_update_bits(component, reg2, val_mask,
> 
> The checks for max and platform_max are done on val2, but val2 is
> already the result of adding the minimum value ('min') and applying
> the mask.
> Shouldn't the checks be done on ucontrol->value.integer.value[1] instead?
> 

Yeah they definitely should, I have resent the two patches
including that fixup, lets see what Mark says. You are CCed
on them so be great if you could give them a test too.

Thanks,
Charles
