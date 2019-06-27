Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 151115802A
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 12:25:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B9E31727;
	Thu, 27 Jun 2019 12:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B9E31727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561631140;
	bh=Ouo0sC6/F/goeHp42J5Bev3fmzUZydm3WEnNzvsktYY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vL2CYHEXHhjYXwp823LW/Hc+5teOvTZxTyJUAhFmEYS+Uaojy0Vqlm7WTkjQGi/po
	 p5iWKImCz4FaHYlmNRHI92ejlW89YkBGBDHLVDH6KN8d1/5t5jJRuot9QJ24EREmt1
	 hTWi0jJrYEdB9ocfTng6Z5RjsucoDWDWj7oVReRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B9FCF896F0;
	Thu, 27 Jun 2019 12:23:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD4F5F896F6; Thu, 27 Jun 2019 12:23:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 KHOP_DYNAMIC,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCFA6F89678
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 12:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCFA6F89678
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="JqyMctuV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5RAEd0O016069; Thu, 27 Jun 2019 05:23:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=/SLbXZX6AA9C3wW/Ho9qCV4/4q0Ztya7LGeYh/278XY=;
 b=JqyMctuVjCGHFHl64x+dZNe66l/9dW0RGadWfeeyp7LHQ8MlpKmjopPnGW2QY05k4qMg
 LyICL60PsEIh8NnsT7biQ77kq9/pdEmiDxtdHsE4LTNcrms9+firwghwF3S5pgPGDLH9
 FPH1CcgHwjUQSBrYpjFbk8T+xu8yvbcmx+EpOx/lTEUA9bj1jebAjDS4x/2iJG9mY4cH
 FyTfV/jHNLYgEUhhsEjKy+SYzNe628E7HP28wEW2Z5otsGUUl5QwE/HfR+gzWEKjn+Oo
 h7Cu1zs46lJ1P9QoV5/7nxpa7LWVirwJLj947Hnu8CkluNrlmW6IK8pHFdcPQ5qBQ/4c tw== 
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
 by mx0a-001ae601.pphosted.com with ESMTP id 2t9hr2gtsm-1;
 Thu, 27 Jun 2019 05:23:46 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
 by mail1.cirrus.com (Postfix) with ESMTP id 3034F611C8B2;
 Thu, 27 Jun 2019 05:23:46 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 27 Jun
 2019 11:23:45 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 27 Jun 2019 11:23:45 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 860DF2A1;
 Thu, 27 Jun 2019 11:23:45 +0100 (BST)
Date: Thu, 27 Jun 2019 11:23:45 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Message-ID: <20190627102345.GG54126@ediswmail.ad.cirrus.com>
References: <20190626153611.10170-1-ckeepax@opensource.cirrus.com>
 <CAJZ5v0hvN=8YmF+v6wKx9mQ=DRosAtK7QU=EWYf5PXEDsn4FEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hvN=8YmF+v6wKx9mQ=DRosAtK7QU=EWYf5PXEDsn4FEQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906270120
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com
Subject: Re: [alsa-devel] [PATCH 1/2] device property: Add new array helper
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jun 27, 2019 at 11:39:10AM +0200, Rafael J. Wysocki wrote:
> On Wed, Jun 26, 2019 at 5:36 PM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> > +       n = device_property_read_u32_array(dev, propname, NULL, 0);
> > +       if (n == -EINVAL) {
> > +               return 0;       /* missing, ignore */
> 
> Why can't the caller use the (scheduled for merging in the 5.3 cycle)
> new device_property_count_u32() to get the size of the array?
> 

I wasn't aware of it, am now.

> > +       } else if (n < 0) {
> > +               dev_warn(dev, "%s malformed (%d)\n", propname, n);
> 
> Why dev_warn()?  Is there any reason real for anything higher-level
> that dev_dbg() here?
> 

Nice to know that your DT wasn't valid, but could be left to the
caller I guess.

> > +               return n;
> > +       } else if ((n % multiple) != 0) {
> 
> I guess the reason why this matters is that the caller expects a
> certain number of full "rows" and n values are read.  Why not to
> discard the extra values instead of returning an error here?
>

No reason really why it couldn't. Although my expectation would
generally be this helper is for reading a variable number of
fixed size groups. As in each group represents a "whole" item but
you don't know how many of those you have.

> > +               dev_warn(dev, "%s not a multiple of %d entries\n",
> > +                        propname, multiple);
> > +               return -EOVERFLOW;
> 
> Why this error code?
> 

As that is the error code all the device_property functions
return when the size is not as expected.

> > +       if (n > nval)
> > +               n = nval;
> > +
> > +       ret = device_property_read_u32_array(dev, propname, val, n);
> 
> So this reads "copy at most nval values from the array property".
> 
> If that's really what you need, it can be done in two lines of code in
> prospective callers of this wrapper.
> 

Indeed the helper here is basically exactly what would be done in
the caller if no helper existed.

> > +int device_property_read_u32_2darray(struct device *dev, const char *propname,
> > +                                    u32 *val, size_t nval, int multiple);
> >  int device_property_read_u64_array(struct device *dev, const char *propname,
> >                                    u64 *val, size_t nval);
> >  int device_property_read_string_array(struct device *dev, const char *propname,
> > --
> 
> I don't see much value in this change, sorry.

That is fine, I don't have any problem with the helper living
within our driver instead. Basically the issue from my side is I
need to read 6 different device tree properties all of which
require this behaviour, ie. read a variable number of fixed
groups and check I have whole groups. Open coding this for each
call is indeed only going to be 5-10 lines of code for each one
but since there are 6 of them it makes sense to put those 5-10
lines into a helper and have 5-10 lines not 30-60 lines. Seemed
the helper might be generally more useful, but if it is not then
it can go back into the driver.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
