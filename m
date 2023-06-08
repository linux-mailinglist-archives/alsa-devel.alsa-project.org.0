Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7148E727CDF
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 12:32:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D72A6C1;
	Thu,  8 Jun 2023 12:31:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D72A6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686220347;
	bh=/hwBnuhUJCdUO8eN3hSnVVTEzbwyS/GkozYlrCaUZJ0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ieFm/t+/6R85px9sQTOplON6zBjB3HOm5jzdizZliRF/qlMDP35yq/e1px3qZstlB
	 heqcY+1DUDotoCPwzBcNfDdRyKLfG7WFNhFSq65ndC/+btsU4452HkKvxH6qyDs/fm
	 ldn+IkIX3Rahc4gpeQTZZoXvi89PbmJZtlaWQimw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2208F80494; Thu,  8 Jun 2023 12:31:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02801F80130;
	Thu,  8 Jun 2023 12:31:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96C78F80199; Thu,  8 Jun 2023 12:31:29 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6ACB5F80130
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 12:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ACB5F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=CwjNGIA6
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3584xgdN018105;
	Thu, 8 Jun 2023 05:31:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=onEs+P+sIu+a4Zcln3hInvx0cjruyK9SVUbur0I3E4s=;
 b=CwjNGIA6GlRTHdHq3p/hzCDlb5K/sGZuS5i8SifUWCPDfGMQYAF8xGoIlVKCiKA97hHo
 TnHRTJQZtOSfF9Yrwd1QksHEs+nb1nLAzIL+BFMQ3JUPLcNZUoCOUAvYfnhHIJrffFrD
 OX9s2t3z38VUeg8YcXLP+jPIV7zzQOdtJfHrV4irI2kzW8WouiHBNXdfZnZDLbUFq2yT
 1kb3s6cEaJgD4w8m8CfCXzxW/QabXr19GAvVSAX0S8qPN+bN9jssCa9EP5P+c3YDigi1
 iTio+/QxaUI4AJ0Ca2LaP905iqfAmW8GCccWDEJHyhjcSeWSObizvFTx9ZNxA2dcX9m0 dw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3r2a7aj1yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jun 2023 05:31:18 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 8 Jun
 2023 11:31:16 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 8 Jun 2023 11:31:16 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C8B4911AA;
	Thu,  8 Jun 2023 10:31:16 +0000 (UTC)
Date: Thu, 8 Jun 2023 10:31:16 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>, <tiwai@suse.de>,
        <alsa-devel@alsa-project.org>, <bard.liao@intel.com>,
        -
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: add N cpus to M codecs dai link support
Message-ID: <20230608103116.GN68926@ediswmail.ad.cirrus.com>
References: <20230607031242.1032060-1-yung-chuan.liao@linux.intel.com>
 <8411fd34-0326-ae92-1d1e-ff171318ebf2@opensource.cirrus.com>
 <c183a76f-38d9-8e20-af80-32b40e1caffa@linux.intel.com>
 <47053ebb-4157-49a2-bfeb-cf090d502a81@sirena.org.uk>
 <20230607170520.GM68926@ediswmail.ad.cirrus.com>
 <042775c7-0d61-441b-8684-80960d041bdc@sirena.org.uk>
 <3c73b1f7-e8fd-02a1-a4c7-a0fe33423966@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3c73b1f7-e8fd-02a1-a4c7-a0fe33423966@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: evqsl1BrbW7gxmWiRMYdnzdk6xhgxMv0
X-Proofpoint-ORIG-GUID: evqsl1BrbW7gxmWiRMYdnzdk6xhgxMv0
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VSSQSE6GO6WMFIFFCFAPO22E2NXOQLO2
X-Message-ID-Hash: VSSQSE6GO6WMFIFFCFAPO22E2NXOQLO2
X-MailFrom: prvs=152312ad09=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VSSQSE6GO6WMFIFFCFAPO22E2NXOQLO2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 07, 2023 at 01:13:49PM -0500, Pierre-Louis Bossart wrote:
> On 6/7/23 12:18, Mark Brown wrote:
> > On Wed, Jun 07, 2023 at 05:05:20PM +0000, Charles Keepax wrote:
> >> On Wed, Jun 07, 2023 at 05:22:45PM +0100, Mark Brown wrote:
> >> CPU A -> CODEC A
> >> CPU B -> CODEC B
> > 
> >> What makes this a single DAI link, rather than 2 DAI links? And
> >> does the information within the DAI link about what is connected
> >> to what not just start looking like DAI links?
> > 
> > Ah, indeed.  My expectation would be that for things on the same
> > physical set of wires we'd at some point be able to get to a point where
> > the the SoundWire routing would be exposed to userspace for control,
> > probably at the point where we get digital routing working (whenever in
> > the far far future that might be, it's only been a bit more than a
> > decade thus far).  I have to say Pierre's example looked like two
> > separate buses.
> 
> They are separate buses indeed at the hardware level, and even on the
> Linux side we have one manager device per link.
> 
> The key point is that all buses are synchronized with a common hardware
> signal, typically 4kHz, on the SOC/PCH side.
> 
> The dailink .trigger is translated as a multi-link bank switch which
> will start transmission exactly at the same time on all links.
> 
> That's the big difference with using multiple dailinks, if we had one
> dailink per physical pair of (clock, data) wires, we would not be able
> to synchronize amplifiers, leading to random phase offsets between
> amplifiers. Not so good.

Indeed, not so good. I had a chat with Richard and we were wonder
if this is really one of those we have started down a path and it's
a bit late to change course now situations. I don't think either
of us have a great objection to the within the DAI link hook up
table really, just hard to get my head around what a DAI link
means in that case. I guess if I just think of DAI links as being
more a logical grouping, that is being treated as a single stream,
rather than representing physical links?

To provide the other side, in my head, where most things are
C2C links rather than DPCM, the situation really looks something
like this:

            +----------+     +---------+
            +    SDW A + <-> + CODEC A +
+-----+     +          +     +---------+
+ CPU + <-> + DSP      +
+-----+     +          +     +---------+
            +    SDW B + <-> + CODEC B +
            +----------+     +---------+

And the responsibility for starting the bank switch would lie with
the DSP driver. It gets a single trigger from its DAI to the CPU,
which provides the sync point. But this seems fairly removed from
how things are presently implemented and it perhaps feels like
the effort to get there isn't worth it, especially since me and
Richard are unlikely to have the time in the near term to do a
lot of it.

Thanks,
Charles
