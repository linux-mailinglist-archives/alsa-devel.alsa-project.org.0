Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D47818CB7
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 17:46:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFDF0E82;
	Tue, 19 Dec 2023 17:46:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFDF0E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703004387;
	bh=bl44HJuQn4JTEFKkZUfjvLthamCXYsJdL81KA0Ekw5E=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vR5aPK3A6jrK/e/K84h7Z7mVUGEfL7HSfA+p3Tquk4+ehnXbJ2TR/KfrLTd5eT44j
	 6AgMw9isosyeLJyxEvjjfY/GE6pgRPThBMWjesDGIkcKiJ2i4b3iE77ewxS9xcLCMq
	 POAjpd7TGWVpQiEnKyTQ8JputPgdDgL/342jie8g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB8E5F80431; Tue, 19 Dec 2023 17:45:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 891E4F80431;
	Tue, 19 Dec 2023 17:45:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34E95F80537; Tue, 19 Dec 2023 17:45:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04FBFF80212
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 17:45:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04FBFF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=hpVG1kNT
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BJ3WQlk023136;
	Tue, 19 Dec 2023 10:45:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=zMlmFnX4j3+VAzo
	VltaNs0kr7AebPY3xvoaenBxIJyk=; b=hpVG1kNT5HWblK4OsaOFfti5SBS6wm6
	U6wMLYxLGnAYfI3S3V4bMCHf0uDH3narqfVjneK/aUXj0udp8rfSL/WWIeXKSr9A
	RkH83VkoZM1LM3gMMS5EsdKC+OP2iu1WQimKJJuyntLFL0uBkBDNUKN3tOkdMNLS
	Y6MNAs6ITmVXUGyV4mxoHNr3YXHGEzqkBEZaDeflJwKp5xujVc0yQoO1pRdmiftW
	NAqkpaRcX9ygF5Ld9ta8UBy1oYMUE/2ZA7uv/IWgyoscE6lCCg2JhpSV2spsM716
	ZtxwwUmxganzzEQCdW1x4PWKACT/Kt371odEVqnhdgDrcqFY4yn5zBQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3v196nc944-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Dec 2023 10:45:40 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 19 Dec
 2023 16:45:39 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Tue, 19 Dec 2023 16:45:39 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1F5F015B6;
	Tue, 19 Dec 2023 16:45:39 +0000 (UTC)
Date: Tue, 19 Dec 2023 16:45:39 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <mengdong.lin@intel.com>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>
Subject: Re: [PATCH alsa-ucm-conf v3 1/2] sof-soundwire: Add basic support
 for cs42l43
Message-ID: <20231219164539.GB14858@ediswmail.ad.cirrus.com>
References: <20231206164612.1362203-1-ckeepax@opensource.cirrus.com>
 <adef7c2f-7c52-46b4-b595-cbf8970b273b@perex.cz>
 <20231207095524.GM14858@ediswmail.ad.cirrus.com>
 <d3ed56d5-2b1a-4626-8b18-0f9c8bb48c73@perex.cz>
 <20231208120026.GO14858@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231208120026.GO14858@ediswmail.ad.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: ablkN8Ips7Fl5YP_gQjhKmtANTQ2imu0
X-Proofpoint-GUID: ablkN8Ips7Fl5YP_gQjhKmtANTQ2imu0
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZWCBX2VCJZH7PDZHBVIKUBN7TNXGWU3C
X-Message-ID-Hash: ZWCBX2VCJZH7PDZHBVIKUBN7TNXGWU3C
X-MailFrom: prvs=7717c8505a=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZWCBX2VCJZH7PDZHBVIKUBN7TNXGWU3C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Dec 08, 2023 at 12:00:26PM +0000, Charles Keepax wrote:
> On Thu, Dec 07, 2023 at 02:56:17PM +0100, Jaroslav Kysela wrote:
> > On 07. 12. 23 10:55, Charles Keepax wrote:
> > >On Wed, Dec 06, 2023 at 06:26:17PM +0100, Jaroslav Kysela wrote:
> > >>On 06. 12. 23 17:46, Charles Keepax wrote:
> > >Oh, I was not aware we could do that. I would yes much rather
> > >handle the switches and volumes in this way. I will see if I can
> > >figure it out, but if you had any good examples that already
> > >exist that would really be handy?
> > 
> > You may look for "LibraryConfig.remap.Config" and
> > "Include.ctl-remap.File" strings in .conf files.
> 
> Apologies still struggling to get this working. I think there must
> some important boiler plate or limitation I am missing. Would really
> appreciate if you could have a look at this and let me know if it
> looks sane. I am starting out with just the simplest thing I can
> think of, just trying to rename a control:
> 

Ok it seems starting with the simplest thing was not the best
idea :-)

If you only have a remap, no map then it looks like one needs to
do something like this:

+++ b/src/control/control_remap.c
@@ -1192,7 +1192,7 @@ int snd_ctl_remap_open(snd_ctl_t **handlep, const char *name, snd_config_t *rema
                goto _err;
        }
 
-   priv->numid_remap_active = priv->map_items > 0;
+ priv->numid_remap_active = priv->map_items > 0 || priv->remap_items > 0;

Otherwise the check at the start of remap_find_numid_app will
keep failing and you get stuck in an infinite loop in
remap_numid_child_new. I will likely send a patch soon (might
slip into the new year, getting close to the end of the year and I
am rather unfamiliar with the user side of the alsa code), but I
want double check things a little more first.

Any input on this change would be greatly appreciated?

> LibraryConfig.remap.Config {
> 	ctl.default.remap {
> 		"name='cs42l43 PDM2 Switch'" "name='cs42l43 Decimator 3 Switch'"
> 	}
> }

To answer part of my own question, and in the hope that if anyone
else is having similar difficulties they will find this thread,
the remapping works the other way around, it should go:

"name='cs42l43 Decimator 3 Switch'" "name='cs42l43 PDM2 Switch'"

With the newly mapped control second, kinda confusing as the .map
sections do it the other way around, but fair enough.

> 
> SectionDevice."Mic"
> {
> 	Comment "Microphones"
> 
> 	EnableSequence
> 	[
> 		cset "name='cs42l43 PDM2 Switch' 1"
> 	]
> 
> 	DisableSequence
> 	[
> 		cset "name='cs42l43 PDM2 Switch' 0"
> 	]
> 
> 	Value
> 	{
> 		CapturePriority 100
> 		CapturePCM "hw:${CardId},4"
> 	}
> }

It would seem the primary issue is here, one needs to add:

CaptureCTL "default:${CardId}"
PlaybackCTL "default:${CardId}"

This is because the control device will normally be the hw: one,
which doesn't have the renaming applied to it, you need to switch
to the device with the remapping, which was added as the one
named default in lib/ctl-remap.conf.

Seems weird you have to do the PlaybackCTL in a capture only use
case, but otherwise it complains about them being mismatched. Also
weirdly you need to add this into some other devices in the same
use-case, otherwise it appears it just ignores these lines and
uses the hw device anyway. Still looking at what is going on with
that but I would appreciate any thoughts on that as well?

> Also if there are any docs I should read happy to go there first?

Updating this to any suggestions on where to add some docs would
also be appreciated?

Hopefully I can find sometime to document some of this a little
and save someone else spending the quite large amount of time I
have sunk into working this lot out so far.

> 

Finally, does anyone have any idea what is going on with the
current users of the remap. It looks like rt5660, rt5677, rt5651,
rt5645, rt5640, rt5682 all currently have remap sections in their
config. However almost the remapped controls are never used, which
might not be surprising given the likely bug at the start of this
email. But curious if anyone has any ideas that the remapping is
actually being used for something non-obvious on those devices?
Kinda wonder if we should just remove some of the unused
remapping as I found it quite confusing whilst trying to figure
this out.

Anyway any extra thoughts/corrections on all this would be really
really appreciated. I am still very new to the ALSA userspace
side of things, so sure I am still making lots of mistakes.

Thanks,
Charles
