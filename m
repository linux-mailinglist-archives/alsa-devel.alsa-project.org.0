Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFC0BCA80
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 16:45:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92DBC16AE;
	Tue, 24 Sep 2019 16:44:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92DBC16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569336305;
	bh=/RnIhvYLvqPaIgdt3Sa5El8aYJ+WkS8TNGFsEdNgiVA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ezXtB105ZJ4BhDFxwc8T9yBPZS9VduoBpLmV4lzavniNIy/cGIFPppi7UlNxWVJ+T
	 StF0t+2h3u8k06HXwgp2PSpQEBLznI8RHGpdD6pil8XuXkuwataCEu5Oy216xnF1YI
	 Lqp0uiCUjz8WSYNWdpLFy82sb8jKAUmjWq+IKGwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 018E9F80533;
	Tue, 24 Sep 2019 16:43:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2628DF8045F; Tue, 24 Sep 2019 16:43:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C72AF800B4
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 16:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C72AF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Cxj5atKI"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8OET12f022472; Tue, 24 Sep 2019 09:43:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=M+iR1mD79pPbPZbf104VCjun/XmmKkExdoMry0cB9X0=;
 b=Cxj5atKIHUWS+ImvdUchCqd26uIFjh98e4qKxbzV94aeFiYzeA1V66dubVusGhxOeSeT
 RICSqUPXW6EIX2aDhJiUPm9ggjkBquz3OZ7mWCr99J5fqpXn9QVTYI53lTxHjk1AVLeP
 af1qPrgkEs9ahGHwQ/0pC7kRXrfcNLpkEPGCGlK06Lr0fRvzLm0KDa6H1k2ckom+mXTO
 JirifPjqHZrkOWsZDPF7n3ebpKAnW+xvaS0ZpXXQdheaiikjUotRYrYbopzq+/k/W12W
 PtFdX+QyHCnEf1ksBTGyDLTbArfeiAbyLGNFB2RAjYnYu/JOMhWOndmIhU8FMy6U7ci/ fg== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 2v5g9pn9e5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 24 Sep 2019 09:43:03 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 24 Sep
 2019 15:42:59 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 24 Sep 2019 15:42:59 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 614792C1;
 Tue, 24 Sep 2019 14:42:59 +0000 (UTC)
Date: Tue, 24 Sep 2019 14:42:59 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <20190924144259.GR10204@ediswmail.ad.cirrus.com>
References: <f7861989-8a2d-ed89-8f1f-68bad7013a34@free.fr>
 <d67b68b9-49c0-6f78-4649-27b3b437a65f@free.fr>
 <878168cb-07e0-cdfd-37e9-9b9fb229155b@free.fr>
 <20190924135219.GQ10204@ediswmail.ad.cirrus.com>
 <0a1bd89e-c6b7-d9ce-dac2-fa324e42b31d@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a1bd89e-c6b7-d9ce-dac2-fa324e42b31d@free.fr>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1909240143
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] Propagating audio properties along the audio path
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

On Tue, Sep 24, 2019 at 04:26:20PM +0200, Marc Gonzalez wrote:
> On 24/09/2019 15:52, Charles Keepax wrote:
> 
> > In general the ALSA framework doesn't really allow for stream
> > params to change whilst the stream is active. Doing so is
> > also normally very hard for the types of hardware usually
> > involved. For example changing the clocks on a running I2S bus,
> > very difficult to get both ends to pick up those changes at
> > exactly the correct sample. Some newer buses like soundwire
> > have more support for things like this were the ends of the
> > link can synchronise changes but even there that is normally
> > used for adding/removing streams from the bus, not reconfiguring
> > a running stream.
> 
> This jives with what "filt3r" wrote on #alsa-soc
> 
> "at one point we were just closing the stream (somehow) if we detected
> a change in e.g. sample-rate, so the user-space application would fail
> on snd_pcm_readi()"
> 
> 	snd_pcm_stop(p_spdif->capture_stream, SNDRV_PCM_STATE_DISCONNECTED);
> 

Ah ok yeah that seems like a pretty good option to me thus
forcing user-space to re-open at the new params.

> > In your case above I would imagine the system would probably be
> > setup where the DSP handles the conversion between the params
> > requested from the receiver and those requested by user-space.
> > One of the intentions of DPCM was to allow the backend
> > (DSP-receiver here) to have different params to the frontend
> > (DSP-userspace here). Although as you note you still probably
> > need to add something to propagate those changes to the DSP. What
> > form does the physical link between the receiver and the DSP
> > take?
> 
> The setup looks like this:
> 
> A = Some kind of audio source, typically a TV or game console
> B = The arm64 SoC, equipped with some nice speakers
> 
>    HDMI
> A ------> B
> 
> If we look inside B, we actually have
> B1 = an eARC receiver (input = HDMI, output = I2S)
> B2 = an audio DSP (input = I2S, output = speakers)
> 
>     I2S        ?
> B1 -----> B2 -----> speakers
> 
> To answer your question, B1 and B2 are connected via I2S.
> 

As yeah reconfiguring the I2S whilst it is running would be a
terrifying prospect.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
