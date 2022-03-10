Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2114D4F7F
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 17:42:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C2851939;
	Thu, 10 Mar 2022 17:41:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C2851939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646930527;
	bh=HcuVTivZh75RB1ykpWwiN7NHwBnFra61LeU9PZh9+DQ=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P0nBnj+RndJnWih0WWhhT9DYnQbEGTvLCO5j8kBHsIjUUIosERH3u14BrTBLedIsb
	 CUMaA3ykFY3TkUVMccLQ99ESeXfeTZODWngGoSn2YZqJKZ1PYXTF/RSpE9LyC06Dhj
	 9bhdOtcUbZVy+/hyYKkR+iuzoPRZHEhvgP+/8TPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9D1BF8013C;
	Thu, 10 Mar 2022 17:40:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69686F80137; Thu, 10 Mar 2022 17:40:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A5C9F800D2
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 17:40:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A5C9F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MjCm65YB"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22ACrQ0b029203;
 Thu, 10 Mar 2022 10:40:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : from : to : subject : references : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=xt9jZcsbIc3uRwCBEAO7UWcKQ/BRR3pjfdwtdFoPCvo=;
 b=MjCm65YBhjQqTx8nYg+XemIJG21ENMfZDKNF82HZUvyie42dm4Tto6XCSdtAqXaG/gGR
 Y37IMrZSJW1VmAffmhfa11aJaSCw6snjw/2B3J4bEUvHbhhBm3oDJjNknxsy4fo+uiiy
 n0QshAZt42LCTjiBBsMhmH33LHsyTyJSWhqvljEtLnSJZrSWJ+YW/T/IKCFbehZTmEGk
 R96VroBI3R0z60hC0uANrIgennXgwTHE0JzmWg6oZL+TUIxH88P7dBX4VwxkAr157yYJ
 ik1yQtQiq9gKUyl/oM3akj/pey3qQ0hGxltaSM+YLftA9XF3NscxkTHVA4zyH99DMzE1 mw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3em55sybva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 10 Mar 2022 10:40:47 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 10 Mar
 2022 16:40:45 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 10 Mar 2022 16:40:45 +0000
Received: from [198.61.65.38] (unknown [198.61.65.38])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 551EBB16;
 Thu, 10 Mar 2022 16:40:45 +0000 (UTC)
Message-ID: <fa73e75d-9500-43c5-5697-b86a5fb594a0@opensource.cirrus.com>
Date: Thu, 10 Mar 2022 16:40:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: <tanureal@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 01/16] sound: cs35l41: Unify hardware configuration
References: <20220308171730.454587-1-tanureal@opensource.cirrus.com>
 <20220308171730.454587-2-tanureal@opensource.cirrus.com>
 <s5hbkydgbx2.wl-tiwai@suse.de>
In-Reply-To: <s5hbkydgbx2.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vG94vteHVVNXs2KSuFkG7uoGHw8T7SbI
X-Proofpoint-GUID: vG94vteHVVNXs2KSuFkG7uoGHw8T7SbI
X-Proofpoint-Spam-Reason: safe
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

On 3/10/22 1:44 PM, Takashi Iwai <tiwai@suse.de> wrote:
> On Tue, 08 Mar 2022 18:17:15 +0100,
> Lucas Tanure wrote:
> > +enum cs35l41_gpio_func {
> > +	CS35L41_HIZ,
> > +	CS35L41_GPIO,
> > +	CS35L41_INT_OPEN_DRAIN_GPIO2,
> > +	CS35L41_MCLK,
> > +	CS35L41_INT_PUSH_PULL_LOW_GPIO2,
> > +	CS35L41_INT_PUSH_PULL_HIGH_GPIO2,
> > +	CS35L41_PDM_CLK_GPIO2,
> > +	CS35L41_PDM_DATA_GPIO2,
> > +	CS35L41_MDSYNC_GPIO1 = 2,
> > +	CS35L41_PDM_CLK_GPIO1 = 4,
> > +	CS35L41_PDM_DATA_GPIO1 = 5,
> >   };
> 
> So CS35L41_MDSYNC_GPIO1 is identical with *_DRAIN_GPIO2, i.e. it's an
> alias?
> 
> 
> thanks,
> 
> Takashi
> 

The value 2 sets GPIO1 as MDSYNC pin and GPIO2 as IRQ pin (Open drain).
It could be the same label, like CS35L41_GPIO1_MDSYNC_GPIO2_IRQ, but I think separating them is better for understanding the code and organizing the code.
