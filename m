Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C255A119B
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 15:12:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC03815C3;
	Thu, 25 Aug 2022 15:11:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC03815C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661433166;
	bh=81MMH4JtqHM08MIZghEBJpzywWB7Y0uaF6P5Up4l5OU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hGdfNEEm74sL7Ls+fxrG50SM3G3RDdPxmmjE+nmrEpWHcV5/c5fswHDLPy/bGfhvI
	 6+Q281G1semNUkLGHVOS2SFSnsRsSYex8kGExLHYhBnXNo+/8rkxSiXCYoGsfVHJIM
	 XpU94eMLVvn8CCJN43NcRxKnDkMu5VaJNrvJwZFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 047A5F800BD;
	Thu, 25 Aug 2022 15:11:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B88E0F8025A; Thu, 25 Aug 2022 15:11:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EC4FF8014B
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 15:11:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EC4FF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="LHZ6MGRg"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27P50VaP015174;
 Thu, 25 Aug 2022 08:11:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=lEDkLsQ5eAOXGKaEe0Dxa69/PDopKKRsOYrCq0dTwzg=;
 b=LHZ6MGRgbAFqMtMnWTDvDKcSpbyPcB189+K939SiRb3gszOjEBB2/4T27Uja8JXuLeV4
 lHwRnaONauSire/0Ji8WMfYLczQEqKj7+mIS/I5DW7Q3abyK2Lle7kKjC0yGsHxX3okS
 r8MQ/3DioK8k5CgHsdSqMcc90IrIELK2B7tJ5wTWPsLZxnghKC0I0UWk/0qZiUSLPzVE
 ASwmg9TUnqxvIoKClnuHyQ4tGmO0y6P00EafIL6RBo7lIOYJ6CuKSJ6XmQ8gPY/KwjI3
 40/w7qRRl1+z1IWyS83egJVtKnHjwSvUfL4gbs7/JOqhC9cj/UR7CWry5ovAr05vckR0 fA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3j4dgmbw21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Aug 2022 08:11:34 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Thu, 25 Aug
 2022 08:11:32 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Thu, 25 Aug 2022 08:11:32 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1F521B0E;
 Thu, 25 Aug 2022 13:11:32 +0000 (UTC)
Date: Thu, 25 Aug 2022 13:11:32 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: dapm: Export new 'graph.dot' file in debugfs
Message-ID: <20220825131132.GN92394@ediswmail.ad.cirrus.com>
References: <20220822095242.3779-1-povik+lin@cutebit.org>
 <YwN2Pd4Ez08yDFno@sirena.org.uk>
 <3234D74E-0DFF-4BB5-87ED-6135BAC1F31D@cutebit.org>
 <YwN+0yHSOSC2aD+J@sirena.org.uk>
 <6EDC1D4B-4B84-49A2-A60A-EA15D27251A7@cutebit.org>
 <YwOqgSrs6YC6yPm6@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YwOqgSrs6YC6yPm6@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 4Q1OSp4L-fb9xBYYP8pVWlqvdTE-tqIm
X-Proofpoint-GUID: 4Q1OSp4L-fb9xBYYP8pVWlqvdTE-tqIm
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
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

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Aug 22, 2022 at 05:10:41PM +0100, Mark Brown wrote:
> On Mon, Aug 22, 2022 at 03:11:48PM +0200, Martin Povišer wrote:
> > > On 22. 8. 2022, at 15:04, Mark Brown <broonie@kernel.org> wrote:
> > > On Mon, Aug 22, 2022 at 02:38:09PM +0200, Martin Povišer wrote:
> 
> > >> simply having a ‘graph.dot’ at hand, especially since it requires
> > >> little code. (Although sure there’s the danger of it growing.)
> 
> > > I'm also worried about people going in and wanting other more tool
> > > specific formats adding, if we didn't have anything at all it'd be one
> > > thing but we do have something.
> 
> > Sure, although I would argue DOT is by a large margin the standard
> > format to represent graphs in.
> 
> Well, the debugfs stuff there is more a general tool for introspecting
> the current DAPM state than it is indended to draw a pretty picture.
> When I wrote it the scale of the devices I was working with was such
> that I'm not usre a full graph would've been terribly useful, and
> there's even larger devices since then (though also a lot of systems
> like yours which do use very much smaller devices).

I still seem to have a copy of Dimitris's tool lying around
(attached), yes apologies we don't seem to have that publicly hosted
anymore at some point it feels like we need to look at what was
lost when the older Wolfson stuff was shutdown.

Thanks,
Charles

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="vizdapm"

#!/bin/bash
#
# Copyright 2011, 2012, 2013 Wolfson Microelectronics plc
# Author: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# A tool to generate a visual graph of the current DAPM configuration.
# Active paths are shown in green, inactive in red.
#
# This program requires `graphviz' to be installed.

if [ $# -ne 2 ]; then
	echo "usage: $(basename $0) dapm-debugfs-path out-png" 1>&2
	exit 1
fi

widgets="$1"
outpng="$2"
graphviztmp=$(mktemp)

trap "{ rm -f $graphviztmp; exit 1; }" SIGINT SIGTERM EXIT

widget_active() {
	local w="$1"
	head -1 "$w" | grep -q ': On'
	if [ "$?" -eq 0 ]; then
		echo 1
	else
		echo 0
	fi
}

echo "digraph G {" > "$graphviztmp"
echo -e "\tbgcolor = grey" >> "$graphviztmp"

cd "$widgets"
for widget in *; do
	echo -n "Parsing widget $widget..."
	while read line; do
		echo "${line}" | grep -q '^in'
		if [ ! "$?" -eq 0 ]; then
			continue
		fi
		source=$(echo "$line" | awk -F\" '{print $4}')
		active=$(widget_active "$widget")
		if [ "$active" -eq 1 ]; then
			echo -e "\t\"$source\" [color = green]" >> "$graphviztmp"
			echo -e "\t\"$widget\" [color = green]" >> "$graphviztmp"
		else
			echo -e "\t\"$source\" [color = red]" >> "$graphviztmp"
			echo -e "\t\"$widget\" [color = red]" >> "$graphviztmp"
		fi
		echo -e "\t\"$source\" -> \"$widget\"" >> "$graphviztmp"
	done < "$widget"
	echo "OK!"
done
cd - >/dev/null

echo "}" >> "$graphviztmp"

echo -n "Generating $outpng..."
dot -Kfdp -Tpng "$graphviztmp" -o "$outpng"
echo "OK!"

--82I3+IH0IqGh5yIs--
