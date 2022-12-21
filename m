Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A2F653471
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 17:57:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DEB1A4D;
	Wed, 21 Dec 2022 17:56:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DEB1A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671641829;
	bh=j5F05MU2JwoH1KEd3zm5Ts3u7xR5wXz/w9GyCwK/Yfs=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GwN2xsSmNuXWjTtpj0+QNX8orIQuYbqeTAqCG6Yr0lyfwxLPms+dOUYNXdnIEhPn5
	 TVnUCHhhuE5hjlMgb3brl02AChyvkLv+BAlooXKlrlXoF6hSOYH9ykrmC7FhpNW8sN
	 H5JRC0zV0d9TEfI4ZdrQF/hvVWt2dx8SIQ3vDEF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A233AF801C1;
	Wed, 21 Dec 2022 17:56:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0A11F801C1; Wed, 21 Dec 2022 17:56:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5579F801C1
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 17:56:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5579F801C1
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=TCg8RvPw
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLENU5Q013959; Wed, 21 Dec 2022 10:56:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=sEG6PTrFaBgIIekSodPUS27VEBNgDRTsmQA6Y4VtPmg=;
 b=TCg8RvPw9wT+7dV2pa93Pcez1mHfe+UGR++ndaj1psuOCSWitv10z3c0P3dqIWCG1OQM
 2MbXDwQ8iF07fxkxhYwrnYqkusFJ1B7dq6Yvn9PLUvToJP6cuJms3pFrjHs6DD/oIVao
 SsxDXyTGb8dViDKmPfC2chrHjV7lBIL9Kq0yXAxjAHAieanW2sjZv93eEs1WAn4pFjqu
 MVG801E5TkXMqggD5OFMkBYFUWhAULSPoY9MjEj0fD/hIz6YEe0ngR/FuUSVcjc/Xjzi
 /fVKkBF4LWVmX/FjFt/hPO6BzvHgF3hG4W5jk/fwb1w/3SoaSvu6Ag88ddlMWJi24w/p Qg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3mhc27dt11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 10:56:03 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Wed, 21 Dec
 2022 10:56:01 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Wed, 21 Dec 2022 10:56:01 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C8C9111CC;
 Wed, 21 Dec 2022 16:56:01 +0000 (UTC)
Date: Wed, 21 Dec 2022 16:56:01 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Subject: Re: wm8904 and output volume control
Message-ID: <20221221165601.GE36097@ediswmail.ad.cirrus.com>
References: <c7864c35-738c-a867-a6a6-ddf9f98df7e7@gmail.com>
 <20221219095846.GC36097@ediswmail.ad.cirrus.com>
 <a8770d51-86f8-2a68-dd38-9b380f9c355a@gmail.com>
 <20221220100005.GD36097@ediswmail.ad.cirrus.com>
 <9657ab8d-0c60-7c81-b1cb-8a5b43d07c40@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9657ab8d-0c60-7c81-b1cb-8a5b43d07c40@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: VOtW_Gg8Ys4rLWuxzv-4iQtWcKXJOmZB
X-Proofpoint-GUID: VOtW_Gg8Ys4rLWuxzv-4iQtWcKXJOmZB
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Michael Walle <michael@walle.cc>,
 Mark Brown <broonie@kernel.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 emanuele.ghidoli@toradex.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Dec 20, 2022 at 08:12:23PM +0100, Emanuele Ghidoli wrote:
> On 20/12/2022 11:00, Charles Keepax wrote:
> >On Mon, Dec 19, 2022 at 04:20:10PM +0100, Emanuele Ghidoli wrote:
> >>On 19/12/2022 10:58, Charles Keepax wrote:
> >>>On Sat, Dec 17, 2022 at 12:47:14AM +0100, Emanuele Ghidoli wrote:
> >I see that that CP_DYN_PWR bit is disabled when audio is going
> >through one of the bypass paths. Would you be able to enable one
> >of the bypass paths and see if you can manually adjust the volume
> >on the headphone output, with a bypass path active?
> With the previous change, I tested all the possible combination with
> one channel from the DAC and the other toggling from DAC to Bypass
> changing the volume and it's always correct.
> 
> >Would also perhaps be interesting as a test to completely remove
> >the write to CP_DYN_PWR from probe and leave things set to manual
> >and see how the volume behaves then?
> When I tried to remove any write to this register my modification
> stopped working.
> 

Apologies just to be totally clear here, you are saying that
whilst a bypass path is active (ie. the class G widget has
cleared CP_DYN_PWR), you can still control the volume? But if you
remove the set of CP_DYN_PWR from probe, the volume doesn't
update at all, audio playing or not?

> >I guess the interests here are to find out if the SYSCLK is
> >involved at all.
> I tested keep the clock always enabled, removing
> clk_disable_unprepare when going into SND_SOC_BIAS_OFF and it has
> zero effects.
> Or did you mean something else?
> 

Yeah that is not quite what I was getting at. I am wondering if
volume updates work whilst CP_DYN_PWR==0 and CLK_SYS_ENA==1.

> Said all of that, I did one last test, forcing a volume update on
> the charge pump enable callback, cp_event(), with this and only this
> modification in everything is working fine.
> 
> Could it just be as easy as that the volume is applied only when the
> charge pump is already active?
> 
> From the datasheet this seems a good explanation:
> 
>  The Charge Pump is enabled by setting the CP_ENA bit. When enabled, the
>  charge pump adjusts the output voltages (CPVOUTP and CPVOUTN).
> 
> What do you think?

I think we are getting pretty close, but we need to try and
narrow down what the requirement is here, is it the charge pump,
or the sysclk? That needs to be on for the volume update to work.

Thanks,
Charles
