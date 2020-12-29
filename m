Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 426A62E7193
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Dec 2020 16:08:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D016A17F1;
	Tue, 29 Dec 2020 16:07:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D016A17F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609254507;
	bh=xkc02s0VlnYKTge1dFGMGzG0S2FoSI79sYVHtj/y19U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XZrX7QR/Nf4gJuK0rxSZ7dy+Wxx3rbLlIKMfn7Q1cTh8zaGcspotBGvn3sBXcH9of
	 Kp7Z9T6Wgv+httgDibHDD4dmc9pEFO7Kz7RaPmPNhHwQaSsdKfnhK1fEeeE0CE47kN
	 TlbdLwuvs2+p5S/0edIirYGgcX8wILy0+r+gnBd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C73CF8020C;
	Tue, 29 Dec 2020 16:06:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E699F8022B; Tue, 29 Dec 2020 16:06:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5857F80162
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 16:06:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5857F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="HdBmQEh4"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BTEurMH029389; Tue, 29 Dec 2020 09:06:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=ft0FMgPygPHnrN9sJcmJjuza0kcCsmbf1k6oQa0rk2s=;
 b=HdBmQEh46qeegNcVwn1awTiM0qTkcxbhViwGhtbI9qwNc89LYFPDDrrGH2lhwSAWGY/c
 mam1HNLmSUlbQqCVn6lFZxw+JYKD5A8C2yJ6aHZD0D/5/H7YITvarhD7YZ+tpD1o4eRt
 OqnP828B+jqNf/MhmnbiUBgvkn9+6Kx4e0SEqxLV6JdfSNAEISjroaXXR58BeZbXJbtu
 kfsXzckDEI1MUVIhYWYV4/KUKrFnkPJiPAxsJzdLlMwbBa2EicsSaYy+hkHnuxhsCzXe
 A9CNLCHVhNmN0bNT4aZnKTHZnLfoP5q8E56o3EmuYTCatq4B+1iSbK0xbUjBrf48PHDH 6w== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35p2fs2ecw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 29 Dec 2020 09:06:37 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 29 Dec
 2020 15:06:35 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 29 Dec 2020 15:06:35 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AD5442AB;
 Tue, 29 Dec 2020 15:06:35 +0000 (UTC)
Date: Tue, 29 Dec 2020 15:06:35 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 01/14] mfd: arizona: Add jack pointer to struct arizona
Message-ID: <20201229150635.GP9673@ediswmail.ad.cirrus.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-2-hdegoede@redhat.com>
 <20201228122138.GA5352@sirena.org.uk>
 <44f84485-8efc-39f9-d0a7-cb8db2ea3faa@redhat.com>
 <20201228162807.GE5352@sirena.org.uk>
 <20201229130657.GN9673@ediswmail.ad.cirrus.com>
 <19c2d056-4f71-2c4c-c243-cdcc0115876c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <19c2d056-4f71-2c4c-c243-cdcc0115876c@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012290095
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mark Brown <broonie@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Lee Jones <lee.jones@linaro.org>
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

On Tue, Dec 29, 2020 at 02:57:38PM +0100, Hans de Goede wrote:
> On 12/29/20 2:06 PM, Charles Keepax wrote:
> > On Mon, Dec 28, 2020 at 04:28:07PM +0000, Mark Brown wrote:
> >> On Mon, Dec 28, 2020 at 02:16:04PM +0100, Hans de Goede wrote:
> >>
> >>> And more in general AFAIK extcon is sort of deprecated and it is
> >>> not advised to use it for new code. I would esp. not expect it to
> >>> be used for new jack-detection code since we already have standard
> >>> uAPI support for that through sound/core/jack.c .
> >>
> >> Has Android been fixed to use the ALSA/input layer interfaces?  That's
> >> why that code is there, long term the goal was to have ALSA generate
> >> extcon events too so userspace could fall over to using that.  The basic
> >> thing at the time was that nobody liked any of the existing interfaces
> >> (the input layer thing is a total bodge stemming from it having been
> >> easy to hack in a key for GPIO detection and using ALSA controls means
> >> having to link against alsa-lib which is an awful faff for system level
> >> UI stuff) and there were three separate userspace interfaces used by
> >> different software stacks which needed to be joined together, extcon was
> >> felt to be a bit more designed and is a superset so that was the
> >> direction we were heading in.
> > 
> > Android has been updated to have the option to catch input events
> > for jack detection now.
> > 
> > I have always been slightly confused between extcon and the ALSA
> > jack reporting and have been unsure as to what is the longer term
> > plan here. I vaguely thought there was a gentle plan to move to
> > extcon, it is interesting to see Hans basically saying the
> > opposite that extcon is intended to be paritially deprecated. I
> > assume you just mean with respect to audio jacks, not other
> > connector types?
> 
> No I mean that afaik extcon is being deprecated in general. Extcon
> is mostly meant for kernel internal use, to allow things like
> charger-type-detection done by e.g. a fsa micro-usb mux or a
> Type-C PD controller to be hooked up to the actual charger chip
> and set the input-current-limit based on this.
> 

Fascinating thanks for taking the time to write such detailed
answers. I thought it was mostly intended for user-space usage,
but I guess I never really thought through that most of this
stuff you don't really need to know from user-space.

> > I would agree with Mark though that if extcon exists for external
> > connectors it seems odd that audio jacks would have their own
> > special way rather than just using the connector stuff.
> 
> Well as I said above in me experience the extcon code is (was) mostly
> meant for kernel internal use. The sysfs API is more of a debugging
> tool then anything else (IMHO).
> 
> Also the kernel has support for a lot of sound devices, including
> many with jack-detection support. Yet a grep for EXTCON_JACK_HEADPHONE
> over the entire mainline kernel tree shows that only extcon-arizona.c
> is using it. So given that we have dozens of drivers providing jack
> functionality through the sound/core/jack.c core and only 1 driver
> using the extcon interface I believe that the ship on how to export
> this to userspace has long sailed, since most userspace code will
> clearly expect the sound/core/jack.c way of doing things to be used.
> 
> Arguably we should/could maybe even drop the extcon part of extcon-arizona.c
> but I did not do that as I did not want to regress existing userspace
> code which may depend on this (on specific embedded/android devices).
> 

All reasonable arguments, with Android now supporting input
events for jacks I guess there would be no need for us to use
extcon for future devices.

There is maybe more argument for porting the Arizona code across
anyways, since for a long time Android didn't properly support extcon
either. It supported the earlier out of tree switch stuff, extcon
had a switch compatibility mode, but that didn't actually work I
think due to android hard coding some sysfs naming or something
(memory is a little fuzzy on the details was a while ago now).

I think extcon support was fixed in Android at about the same time
the support for input events was added. So it might be harmless but
someone probably needs to go and check the timeline before we go
changing stuff.

Thanks,
Charles
