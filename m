Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E83076BEAB8
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 15:09:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00EDAF67;
	Fri, 17 Mar 2023 15:08:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00EDAF67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679062153;
	bh=1k4ExcCQDDcAeZlFdpBatjTRv7COF4iRvM1hSyJesbc=;
	h=Date:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=Aip3T1C6x/DLtGslXYALZFrkOTGCLiFxkr33tynNIzMPLnuGMLnqsqi3TgWdoib9H
	 SNuDMZSkBggovP5klNcGxX9w3naBSKayP8a+C4ugBnzRp+4/tzRGEKBX9tjwl5T0d/
	 eNuZNdjbgoKk/hX4tNXR75Emk3OiVL+hMKT4NJcY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A54BF8032D;
	Fri, 17 Mar 2023 15:08:22 +0100 (CET)
Date: Fri, 17 Mar 2023 14:08:07 +0000
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/2] soundwire: bus: Update sdw_nread/nwrite_no_pm to
 handle page boundaries
References: <20230316155734.3191577-1-ckeepax@opensource.cirrus.com>
 <20230316155734.3191577-2-ckeepax@opensource.cirrus.com>
 <447cac77-4cc7-b2a3-23e7-978e1641a401@linux.intel.com>
In-Reply-To: <447cac77-4cc7-b2a3-23e7-978e1641a401@linux.intel.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I2YTZHWTJTZSTHSU6CH6XXXX7WRJQDVU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167906210132.26.2857505700065614255@mailman-core.alsa-project.org>
From: Charles Keepax via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99002F80423; Fri, 17 Mar 2023 15:08:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E867F80093
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 15:08:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E867F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=n4v5zv0M
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32HDk5Yo002807;
	Fri, 17 Mar 2023 09:08:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=H4ggXK1Md9Bl/gFWgbNqPW1hTdT0QlUPDN7cqK9juWI=;
 b=n4v5zv0M9zrOnUE26M00QfQkUPac50atub66LqY8vWDeKUV/g1T7AeLTAhYxDknJeLUA
 KQOrxH0wDJHF7Mx195dXT4pA+ePcOpABDqAPgbOOpT2GjrEMxXuCWYJK8mo8IbWbznk9
 JmSIzHOtGEx1Hq2yWfr7mcnKf4OBlp2D7DR2R3E+MW+L/OXOCaLfF3DUqsOFfHgoqwuQ
 dB9iWzhmTBHa79a44tgyJBCt1Gxspvpqs6yh+E+7yRrQBuuahSdy3T2QZreJUGXmXluA
 8/moZ0jWjO0hA8QxtoxpvqKSHWH2nShlu0/8QBOugTNd5MgjnO2f2IlMuquB+Rz7/eQU dw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pbs2ntj82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Mar 2023 09:08:08 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Fri, 17 Mar
 2023 09:08:07 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 17 Mar 2023 09:08:07 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3269711D3;
	Fri, 17 Mar 2023 14:08:07 +0000 (UTC)
Date: Fri, 17 Mar 2023 14:08:07 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/2] soundwire: bus: Update sdw_nread/nwrite_no_pm to
 handle page boundaries
Message-ID: <20230317140807.GI68926@ediswmail.ad.cirrus.com>
References: <20230316155734.3191577-1-ckeepax@opensource.cirrus.com>
 <20230316155734.3191577-2-ckeepax@opensource.cirrus.com>
 <447cac77-4cc7-b2a3-23e7-978e1641a401@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <447cac77-4cc7-b2a3-23e7-978e1641a401@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: JMdtH2Aj5Hij6muQ-VxAE3SfVder22uf
X-Proofpoint-ORIG-GUID: JMdtH2Aj5Hij6muQ-VxAE3SfVder22uf
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: I2YTZHWTJTZSTHSU6CH6XXXX7WRJQDVU
X-Message-ID-Hash: I2YTZHWTJTZSTHSU6CH6XXXX7WRJQDVU
X-MailFrom: prvs=8440ae90cc=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I2YTZHWTJTZSTHSU6CH6XXXX7WRJQDVU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Mar 16, 2023 at 01:46:57PM -0500, Pierre-Louis Bossart wrote:
> 
> 
> On 3/16/23 10:57, Charles Keepax wrote:
> > Currently issuing a sdw_nread/nwrite_no_pm across a page boundary
> > will silently fail to write correctly as nothing updates the page
> > registers, meaning the same page of the chip will get rewritten
> > with each successive page of data.
> > 
> > As the sdw_msg structure contains page information it seems
> > reasonable that a single sdw_msg should always be within one
> > page. It is also mostly simpler to handle the paging at the
> > bus level rather than each master having to handle it in their
> > xfer_msg callback.
> > 
> > As such add handling to the bus code to split up a transfer into
> > multiple sdw_msg's when they go across page boundaries.
> 
> This sounds good but we need to clarify that the multiple sdw_msg's will
> not necessarily be sent one after the other, the msg_lock is held in the
> sdw_transfer() function, so there should be no expectation that e.g. one
> big chunk of firmware code can be sent without interruption.
> 

I will update the kdoc for nread/nwrite to specify that
transactions that cross a page boundry are not expected to be
atomic.

> I also wonder if we should have a lower bar than the page to avoid
> hogging the bus with large read/write transactions. If there are
> multiple devices on the same link and one of them signals an alert
> status while a large transfer is on-going, the alert handling will
> mechanically be delayed by up to a page - that's 32k reads/writes, isn't it?
> 

I think its 16k, but I would be inclined to say this is a
separate fix. The current code will tie up the bus for longer
than my fix does, since it only calls sdw_transfer once, and it
will write the wrong registers whilst doing it. Also to be clear
this wasn't found with super large transfers just medium sized
ones that happened to cross a page boundry.

If we want to add some transaction size capping that is really
a new feature, this patch a bug fix. I would also be inclined
to say if we are going to add transaction size capping, we
probably want some property to specify what we are capping to.

Thanks,
Charles

> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >  drivers/soundwire/bus.c | 47 +++++++++++++++++++++++------------------
> >  1 file changed, 26 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> > index 3c67266f94834..bdd251e871694 100644
> > --- a/drivers/soundwire/bus.c
> > +++ b/drivers/soundwire/bus.c
> > @@ -386,37 +386,42 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
> >   * Read/Write IO functions.
> >   */
> >  
> > -int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
> > +static int sdw_ntransfer_no_pm(struct sdw_slave *slave, u32 addr, u8 flags,
> > +			       size_t count, u8 *val)
> >  {
> >  	struct sdw_msg msg;
> > +	size_t size;
> >  	int ret;
> >  
> > -	ret = sdw_fill_msg(&msg, slave, addr, count,
> > -			   slave->dev_num, SDW_MSG_FLAG_READ, val);
> > -	if (ret < 0)
> > -		return ret;
> > +	while (count) {
> > +		// Only handle bytes up to next page boundary
> > +		size = min(count, (SDW_REGADDR + 1) - (addr & SDW_REGADDR));
> >  
> > -	ret = sdw_transfer(slave->bus, &msg);
> > -	if (slave->is_mockup_device)
> > -		ret = 0;
> > -	return ret;
> > +		ret = sdw_fill_msg(&msg, slave, addr, size, slave->dev_num, flags, val);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		ret = sdw_transfer(slave->bus, &msg);
> > +		if (ret < 0 && !slave->is_mockup_device)
> > +			return ret;
> > +
> > +		addr += size;
> > +		val += size;
> > +		count -= size;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
> > +{
> > +	return sdw_ntransfer_no_pm(slave, addr, SDW_MSG_FLAG_READ, count, val);
> >  }
> >  EXPORT_SYMBOL(sdw_nread_no_pm);
> >  
> >  int sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
> >  {
> > -	struct sdw_msg msg;
> > -	int ret;
> > -
> > -	ret = sdw_fill_msg(&msg, slave, addr, count,
> > -			   slave->dev_num, SDW_MSG_FLAG_WRITE, (u8 *)val);
> > -	if (ret < 0)
> > -		return ret;
> > -
> > -	ret = sdw_transfer(slave->bus, &msg);
> > -	if (slave->is_mockup_device)
> > -		ret = 0;
> > -	return ret;
> > +	return sdw_ntransfer_no_pm(slave, addr, SDW_MSG_FLAG_WRITE, count, (u8 *)val);
> >  }
> >  EXPORT_SYMBOL(sdw_nwrite_no_pm);
> >  
