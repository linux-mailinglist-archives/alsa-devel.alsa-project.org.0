Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9DB45B524
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:16:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F95217A2;
	Wed, 24 Nov 2021 08:15:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F95217A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637738181;
	bh=Vr/dM/ftN5bqhgUJf6g7nimmfs4ROl4z3IDNQw3/cqM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k3DNfTY0ixnljPrlO74NdaoNX6aNCMaTYPJizbVHH7V+npLWIt6ZTGBoza9w8FlDS
	 uROhNXV1LSFEaNR4u8WLQUzEH7IkNq3KG6kAvH5FMGRNDWpjrFqhiw9k8vZLAlAUmj
	 xoeVqgiqklDFdov7uCThJfcch9vhPTfsB0WvhrFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA4C0F805E4;
	Wed, 24 Nov 2021 08:06:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A958F8049E; Tue, 23 Nov 2021 19:06:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85238F800E7
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 19:05:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85238F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="lFtM5YPs"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AN6osxY017977;
 Tue, 23 Nov 2021 12:05:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=6gSWvozBqN0ZbLTsSNcyVmRfNtwK0xzP5jEqM1vSJ+A=;
 b=lFtM5YPsXw00qcrRm8spyUnIqoT3ZfqObN7GLyqyT8nkinP/uDFXogiHGe+UgX+cEWev
 L7aOtNbuBnfy+z5vRNZIj/UKrpwwl8rQm74nHv73DuDYuM4IynfEt+M9QQ9Z2aU3uU8O
 sEgPXwl8La0TCcC0QQeKRT6coesCtzXetoG4pncdXjbO/m1f7VCpdB1LpAleHdU2wvFf
 lxQJFK/rUj9RBVJeKD3CrwE2uxbutIkoZd0ynNsuQL1LAYE4WRNHdybvbOzToH6aeuTx
 +499//1qAh1MPOAJJlA0a+3OCD0ahiszgxDEh0OkefaTo1ReFzzbLp+VREjxnP68xcG2 xA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3cg3v7a5qx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Nov 2021 12:05:56 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 23 Nov
 2021 18:05:54 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 23 Nov 2021 18:05:54 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 33C80B06;
 Tue, 23 Nov 2021 18:05:54 +0000 (UTC)
Date: Tue, 23 Nov 2021 18:05:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 02/11] ASoC: cs35l41: Convert tables to shared source code
Message-ID: <20211123180554.GG18506@ediswmail.ad.cirrus.com>
References: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
 <20211123163149.1530535-3-tanureal@opensource.cirrus.com>
 <YZ0qgjJnoljpmc9s@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YZ0qgjJnoljpmc9s@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: bsCgKBoG4TH8rZmypNK8_d58F7k35PpN
X-Proofpoint-ORIG-GUID: bsCgKBoG4TH8rZmypNK8_d58F7k35PpN
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Wed, 24 Nov 2021 08:05:53 +0100
Cc: Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Elia Devito <eliadevito@gmail.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, alsa-devel@alsa-project.org,
 Werner Sembach <wse@tuxedocomputers.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Shuming Fan <shumingf@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 Jeremy Szu <jeremy.szu@canonical.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, linux-acpi@vger.kernel.org,
 Sami Loone <sami@loone.fi>, Len Brown <lenb@kernel.org>,
 platform-driver-x86@vger.kernel.org, Chris Chiu <chris.chiu@canonical.com>,
 Arnd Bergmann <arnd@arndb.de>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Cameron Berkenpas <cam@neo-zeon.de>,
 Jack Yu <jack.yu@realtek.com>, Kailang Yang <kailang@realtek.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, David Rhodes <david.rhodes@cirrus.com>
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

On Tue, Nov 23, 2021 at 05:53:06PM +0000, Mark Brown wrote:
> On Tue, Nov 23, 2021 at 04:31:40PM +0000, Lucas Tanure wrote:
> > --- a/sound/soc/codecs/Makefile
> > +++ b/sound/soc/codecs/Makefile
> > @@ -54,8 +54,8 @@ snd-soc-cs35l33-objs := cs35l33.o
> >  snd-soc-cs35l34-objs := cs35l34.o
> >  snd-soc-cs35l35-objs := cs35l35.o
> >  snd-soc-cs35l36-objs := cs35l36.o
> > -snd-soc-cs35l41-spi-objs := cs35l41-spi.o cs35l41.o cs35l41-tables.o
> > -snd-soc-cs35l41-i2c-objs := cs35l41-i2c.o cs35l41.o cs35l41-tables.o
> > +snd-soc-cs35l41-spi-objs := cs35l41-spi.o cs35l41.o cs35l41-lib.o
> > +snd-soc-cs35l41-i2c-objs := cs35l41-i2c.o cs35l41.o cs35l41-lib.o
> >  snd-soc-cs42l42-objs := cs42l42.o
> >  snd-soc-cs42l51-objs := cs42l51.o
> >  snd-soc-cs42l51-i2c-objs := cs42l51-i2c.o
> 
> As was already called out on the HDA part of this patch I was expecting
> this to be more like how we handle sharing the PXA2xx driver code
> between the ASoC and AC'97 implementations - making it a library rather
> than linking the object files directly into both drivers.  I'm not sure
> that the current approach would DTRT if one or both of the drivers is
> built in.

Yeah looking closer the Prince driver itself is kinda weird here
since it is building separate modules for SPI and I2C but
including cs25l41.o into both, rather than the more normal 3
modules approach.

I will have a look at doing a patch to fix that up, separately
from Lucas's series here.

Thanks,
Charles
