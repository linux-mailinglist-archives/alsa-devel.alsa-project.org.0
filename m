Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DC65234D7
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 15:58:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9074816D9;
	Wed, 11 May 2022 15:57:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9074816D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652277499;
	bh=sXr7mS9iZg7qsSdydUyzZ/Rv/zIeDXQ6Nxy6h23Myl8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EjJGpZHa+5yEg5QAHhzb78XkjUFkD2iSFLE9EF9XLfAqGbOU4pFATEmLqiGAQzF1n
	 sTTGnl9Mgb4CIku7v3b9OBzeV1gz/R0ib7u+lOagyizifmTdeSeSz9Hb+WtpFeLDkU
	 1xFnWH6VGbSxmF/0PCa9WxTEZUh1MFmDSYm/0Mk8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDAFAF80212;
	Wed, 11 May 2022 15:57:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FBC3F8015B; Wed, 11 May 2022 15:57:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8089AF8011C
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 15:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8089AF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="bCLVtnRD"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24BCpef1022202;
 Wed, 11 May 2022 08:57:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=TN8RR9EaBO+hAhlVbIdyqpYrWj8bS16Ite1oDdSN+R8=;
 b=bCLVtnRDzVgxcm9i2sRIv2/xJQrZNM2POoWHfNHsHx1vuOXPWgFW9NaBliGQG5frp90j
 q1SF3UujTLuNaLc+0tmBzVJqvBVfLgO5xfbNuYTE1NoOANa8Jo3AO/ltIJxvgPzrk6l+
 1s8z9dG2jYhuA9LeZsrmd8+dzrWmigAr04KDQUKoeIN2dkeyhDhhgU9DvTsMLrKj4SAp
 76bct/3cAiANvHT7hiXtz7zkCox2vQEkZ3Fg3UBIIfNgWGjtKLQtgpOulV0pmUUn569B
 y5rouiGSpv4gwf7CnjFbmzrTQg5fbEZ3iSSujUKxu2+xF6rWM+8q6DfgFrFAzpWYwnXe 1A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fwn6nx1fd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 May 2022 08:57:08 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 11 May
 2022 14:57:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 11 May 2022 14:57:07 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 047F9B10;
 Wed, 11 May 2022 13:57:07 +0000 (UTC)
Date: Wed, 11 May 2022 13:57:07 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 10/26] ALSA: hda: hda_cs_dsp_ctl: Add Library to
 support CS_DSP ALSA controls
Message-ID: <20220511135707.GH38351@ediswmail.ad.cirrus.com>
References: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
 <20220509214703.4482-11-vitalyr@opensource.cirrus.com>
 <s5hzgjofacn.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <s5hzgjofacn.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: b3RPXGFwwriDeFA5r8doCCs5lwSCDkNo
X-Proofpoint-GUID: b3RPXGFwwriDeFA5r8doCCs5lwSCDkNo
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Wed, May 11, 2022 at 03:49:12PM +0200, Takashi Iwai wrote:
> On Mon, 09 May 2022 23:46:47 +0200,
> Vitaly Rodionov wrote:
> > 
> > From: Stefan Binding <sbinding@opensource.cirrus.com>
> > 
> > The cs35l41 part contains a DSP which is able to run firmware.
> > The cs_dsp library can be used to control the DSP.
> > These controls can be exposed to userspace using ALSA controls.
> > This library adds apis to be able to interface between
> > cs_dsp and hda drivers and expose the relevant controls as
> > ALSA controls.
> 
> Hmm, quite lots of things aren't explained here.
> 
> First off, as far as I see, the control elements that are implemented
> in this patch are pretty unique, they don't follow the standard way.
> Admittedly, ASoC core (ab)uses the TLV read/write for the arbitrary
> data bytes, and this seems following that instead.  If so, it needs
> more clear explanation in the comments add/or commit logs.
> 

Hm... yes I think we should be very clear on if the TLV support
is needed here. This should only be needed if the firmware has
controls (and we need to use those controls) over 512 bytes, and
most firmwares don't. Can we check this and remove the TLV
support if we can? We probably don't want to add more users of
that stuff if we can help it.

Thanks,
Charles
