Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 593F45F2EF5
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Oct 2022 12:42:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ED4320E6;
	Mon,  3 Oct 2022 12:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ED4320E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664793757;
	bh=uad3dNh9d/XSIDffu7J4tRoRasRkIRaGz+Y58BMHAas=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e9b5X0CxrLVjBW81pGhzkQDiV2AdJOdOOGc3FrDqWnwnH5b/f90tPEXIF6cCjBV+U
	 axL45oSHuswPOga0kjtpvbd/u0toS1T6m5tk66sfOHHdpS1l7KAof+j7lq1i+ftxSm
	 lDTX5Un7zr8p2slMmu+V5H+F+btcilBrHjmgBMls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD003F800CC;
	Mon,  3 Oct 2022 12:41:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7B73F80269; Mon,  3 Oct 2022 12:41:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43811F800C1
 for <alsa-devel@alsa-project.org>; Mon,  3 Oct 2022 12:41:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43811F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MgNj1M/D"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2934p18v020482;
 Mon, 3 Oct 2022 05:41:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=XNW8k2v/IgZvNPBpWcdpVssXnaQLZdj/J/xI6lXfffk=;
 b=MgNj1M/DSwptdHEWqcqQbHlCgVz4GxoiX+b27qf/m/MMP1MpsUT3Soz/Sx9TBK1v0tdS
 PYZSpmyg31qGq2GLsewtEkjXbNwtKdO7XbtwL5HonVn5If3g9UwXhLfQxj2tggbxpKyI
 7wem/NqT2NX+q6Q3uHF8r98pBEg5EJ5A72vgLVblLkIg9Rv0lN+MfIwmDm5TgQwnn5bk
 Bpu756/JwjB9KhVBd8YvsNMWIqyN9PNvtbAORBO8RlwNiSbafGLpw7nIrJ/T0IQpKMYw
 /zDaT/wDjdYNaSmbUzhtjPdg3QYbgu5j3wgionfnUOc4OpQ3bhiOHdCHLPK3Y0So9U9v EA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jxhyq22jm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 05:41:35 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Mon, 3 Oct
 2022 05:41:33 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Mon, 3 Oct 2022 05:41:33 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 92AA715A3;
 Mon,  3 Oct 2022 10:41:33 +0000 (UTC)
Date: Mon, 3 Oct 2022 10:41:33 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Wang, Xiaolei" <xiaolei.wang@windriver.com>
Subject: Re: wm8962 0-001a: ASoC: error at soc_component_read_no_lock on
 wm8962.0-001a: -16
Message-ID: <20221003104133.GB92394@ediswmail.ad.cirrus.com>
References: <MW5PR11MB57644C9D9797BB1F5B30B70795549@MW5PR11MB5764.namprd11.prod.outlook.com>
 <20220929092403.GU92394@ediswmail.ad.cirrus.com>
 <77903e11-e586-64ee-4c5e-f72cd67d924f@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <77903e11-e586-64ee-4c5e-f72cd67d924f@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: snDvI_W48IawJdtAYW4tUyolWHAB0jhc
X-Proofpoint-ORIG-GUID: snDvI_W48IawJdtAYW4tUyolWHAB0jhc
X-Proofpoint-Spam-Reason: safe
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "steve@sk2.org" <steve@sk2.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "chi.minghao@zte.com.cn" <chi.minghao@zte.com.cn>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "aford173@gmail.com" <aford173@gmail.com>
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

On Fri, Sep 30, 2022 at 12:59:24PM +0800, Wang, Xiaolei wrote:
> On 9/29/2022 5:24 PM, Charles Keepax wrote:
> >On Wed, Sep 28, 2022 at 02:44:30AM +0000, Wang, Xiaolei wrote:
> >>snd_soc_bind_card
> >>      snd_soc_dapm_new_widgets
> >>          soc_dapm_read
> >>              snd_soc_component_read(dapm->component, reg);
> >>
> >>There is no runtime resume, which cannot perform normal
> >>reading and writing for volatile reg, because it has been
> >>switched to regcache only in the process of runtime suspend. I
> >>can't find the right place to resume, can you give me any
> >>advice?
> >>
> >I think the first step would be could you clarify which register
> >is being read here? Reading a volatile register as part of
> >setting up the widgets does feel rather problematic.
> 
> Yes, this is reading the 0x30 register of the wm8962, it can adjust
> Microphone Bias Voltage.

Yes, that is some rather poor hardware design there, the chip has
a bunch of volatile status bits mixed in with a bunch of
non-volatile control bits in the same register. It would seem
the problem is likely the two widgets TEMP_HP and TEMP_SPK.

Probably the simplest solution would be to add an event handler
for TEMP_HP and TEMP_SPK and move the register handling in there,
if there is no register specified on the widgets the core will
not attempt to read it on probe and will assume the widget is
off. Although you will also need to turn them off during probe as
they do default to on.

Is that something you are comfortable writing a patch for or do
you want me to have a look at pulling one together for you?
Although note this might take a few days and I don't have hardware
to test it here.

Thanks,
Charles
