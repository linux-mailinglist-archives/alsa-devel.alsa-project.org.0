Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E363D28B1
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 14:05:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA286166B;
	Thu, 10 Oct 2019 14:04:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA286166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570709140;
	bh=P8RO+MhnLK9XvLCT8XK58eYy+0MXq2HeKLFlJRaBojk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mvpQw1cLKlcxICxjfVf1DcDiblU71C8vgFHUFWfYP+m9YzWnIObzCSp+5EwxGndeg
	 8w225d1beyVT6YfeQzG/nVjEy3dIBNQbWONcgpZ2/M/2zafos4+/eJofL7k4IF04Vo
	 OZBMauJoZHRYy9wl6z5Ce6BtpAIKeFZDCvRx3C5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 259FFF8038F;
	Thu, 10 Oct 2019 14:03:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA46CF8038F; Thu, 10 Oct 2019 14:03:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F0DAF80113
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 14:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F0DAF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="nDTMNqax"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9ABwU2S025432; Thu, 10 Oct 2019 07:03:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=4byw5jSm2/714LOkmlocLaf87NTPpDf7GI4f/qV1tN4=;
 b=nDTMNqax1/FPcs2phz9QMiPEquLRhE9ioBRLAhPZzVUxjqO1ZrODSTPWYOY7h4TSsg1N
 QNKCQ8Ou6V+WW89SobRqYf9biUFNrP2jm5T6FOLOD3uOr4tqAnYqzDYwcSVWcfgJoUBm
 Ns+aazMoP5FzafQ8B5OtPVeCvqYHYnz2O8I3uRa9P2NGvqwr9Wx3GyS0yiFkbTfxVScr
 TmwKgYTp259FSbOOVfsSxDkI/dSvv1DfH18eevGE33f5v2LFW9GGaS3Fg7SH1FZinVME
 Ka/9eNWzxyqgi/tDKYvTLQXCYUTK6jFJdnYaF90B5R1yojFetvSWEuN+EzvWuLvNTXx1 uQ== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 2veqkp7h7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 10 Oct 2019 07:03:39 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 10 Oct
 2019 13:03:37 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 10 Oct 2019 13:03:37 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 903A82A1;
 Thu, 10 Oct 2019 12:03:37 +0000 (UTC)
Date: Thu, 10 Oct 2019 12:03:37 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191010120337.GB31391@ediswmail.ad.cirrus.com>
References: <20190813191827.GI5093@sirena.co.uk>
 <cc360858-571a-6a46-1789-1020bcbe4bca@linux.intel.com>
 <20190813195804.GL5093@sirena.co.uk>
 <20190814041142.GU12733@vkoul-mobl.Dlink>
 <99d35a9d-cbd8-f0da-4701-92ef650afe5a@linux.intel.com>
 <5e08f822-3507-6c69-5d83-4ce2a9f5c04f@linaro.org>
 <53bb3105-8e85-a972-fce8-a7911ae4d461@linux.intel.com>
 <95870089-25da-11ea-19fd-0504daa98994@linaro.org>
 <2326a155-332e-fda0-b7a2-b48f348e1911@linux.intel.com>
 <34e4cde8-f2e5-0943-115a-651d86f87c1a@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34e4cde8-f2e5-0943-115a-651d86f87c1a@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxscore=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910100111
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 robh+dt@kernel.org, lgirdwood@gmail.com, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
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

On Thu, Oct 10, 2019 at 09:50:22AM +0100, Srinivas Kandagatla wrote:
> On 09/10/2019 19:53, Pierre-Louis Bossart wrote:
> >On 10/9/19 11:01 AM, Srinivas Kandagatla wrote:
> >>On 09/10/2019 15:29, Pierre-Louis Bossart wrote:
> >>>On 10/9/19 3:32 AM, Srinivas Kandagatla wrote:
> >>>>On 14/08/2019 15:09, Pierre-Louis Bossart wrote:
> >>>>>On 8/13/19 11:11 PM, Vinod Koul wrote:
> >>>>>>On 13-08-19, 20:58, Mark Brown wrote:
> >>>>>>>On Tue, Aug 13, 2019 at 02:38:53PM -0500, Pierre-Louis
> >>>>>>>>Indeed. I don't have a full understanding of that
> >>>>>>>>part to be honest, nor why
> >>>>>>>>we need something SoundWire-specific. We already
> >>>>>>>>abused the set_tdm_slot API
> >>>>>>>>to store an HDaudio stream, now we have a rather confusing stream
> >>>>>>>>information for SoundWire and I have about 3 other
> >>>>>>>>'stream' contexts in
> >>>>>>>>SOF... I am still doing basic cleanups but this has
> >>>>>>>>been on my radar for a
> >>>>>>>>while.
> >>>>>>>
> >>>>>>>There is something to be said for not abusing the TDM
> >>>>>>>slot API if it can
> >>>>>>>make things clearer by using bus-idiomatic mechanisms,
> >>>>>>>but it does mean
> >>>>>>>everything needs to know about each individual bus :/ .
> >>>>>>
> >>>>>>Here ASoC doesn't need to know about sdw bus. As Srini
> >>>>>>explained, this
> >>>>>>helps in the case for him to get the stream context and
> >>>>>>set the stream
> >>>>>>context from the machine driver.
> >>>>>>
> >>>>>>Nothing else is expected to be done from this API. We
> >>>>>>already do a set
> >>>>>>using snd_soc_dai_set_sdw_stream(). Here we add the
> >>>>>>snd_soc_dai_get_sdw_stream() to query
> >>>>>
> >>>>>I didn't see a call to snd_soc_dai_set_sdw_stream() in Srini's code?
> >>>>
> >>>>
> >>>>There is a snd_soc_dai_get_sdw_stream() to get stream
> >>>>context and we add slave streams(amplifier in this case) to
> >>>>that context using sdw_stream_add_slave() in machine
> >>>>driver[1].
> >>>>
> >>>>Without this helper there is no way to link slave streams to
> >>>>stream context in non dai based setup like smart speaker
> >>>>amplifiers.
> >>>>
> >>>>Currently this driver is blocked on this patch, If you think
> >>>>there are other ways to do this, am happy to try them out.
> >>>
> >>>So to be clear, you are *not* using snd_soc_dai_set_sdw_stream?
> >>Yes, am not using snd_soc_dai_set_sdw_stream().
> >
> >It's been a while since this thread started, and I still don't
> >quite get the concepts or logic.
> >
> >First, I don't understand what the problem with "aux" devices is.
> >All the SoundWire stuff is based on the concept of DAI, so I guess
> >I am
> 
> That is the actual problem! Some aux devices does not have dais.
> 

Usually aux devices are used for things like analog amplifiers that
clearly don't have a digital interface, thus it really makes no sense
to have a DAI link connecting them. So I guess my question here
would be what is the thinking on making the "smart amplifier" dailess?
It feels like having a CODEC to CODEC DAI between the CODEC and
the AMP would be a more obvious way to connect the two devices
and would presumably avoid the issues being discussed around the
patch.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
