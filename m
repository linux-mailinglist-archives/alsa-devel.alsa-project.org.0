Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EF6582AD
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 14:35:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A0EE16CE;
	Thu, 27 Jun 2019 14:34:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A0EE16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561638938;
	bh=x30VCiK1wV7toX2WxrHuPaGdJSwsAJDrlnIdoxgFbwc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TcWpRaRo58eaYxKFoCor+7aAxja2E0/pxYh+RmI7/95xIOBhrLZmVRjW5LC0gZO11
	 JufrHOChI+4Vh3LNjb1oVrcSho01lBvdXek6DioMoI8c3WaXmddu/GKKTeGjQhBxKl
	 Vhy8vUujqIWYqpk8Pdeb5NbWRcIih/YQ2hM3ni+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E34B6F896F6;
	Thu, 27 Jun 2019 14:33:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03AA1F896F6; Thu, 27 Jun 2019 14:33:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 KHOP_DYNAMIC,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D75EEF806F0
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 14:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D75EEF806F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="BX4jKeIW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5RCTRkV002115; Thu, 27 Jun 2019 07:33:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=FCeiWNpqHXKcvbELMFxb5outzLNg2XZ0Ix2/exfdLRw=;
 b=BX4jKeIW93Mw3s5aFaF8AwrDjnKlDxnKY6BdHcCk1zoEAD0l3l818FDSsoFZuklJgWFs
 2cr3USu0leYcfbB6soIEz4oVOo/tv43t0IV0Z3GccG5JbnpmsmjHX0Sa6kmKvBFTEodc
 TDhvlhtnEAkRT4N6/k+fPxDQWvdjEcghEYVifgdNsk5h6I+PpQ2HzHJWrQ2bCiBJOHX8
 fIXY0gUwafY0ovTmdP0Rd7LNdPGCy8LXOT3zbrUSzU4hENrraZkHo98EigmJZKN1rHYg
 NT8VNyggI6Lbbuh3d1YylIXuTIKsGtddm/txSNxj7S2EZmGRmoYN3r/vNl06cmJNVJ6N NA== 
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail2.cirrus.com (mail2.cirrus.com [141.131.128.20])
 by mx0b-001ae601.pphosted.com with ESMTP id 2tc7gt9whn-1;
 Thu, 27 Jun 2019 07:33:44 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
 by mail2.cirrus.com (Postfix) with ESMTP id 7201E605A6B4;
 Thu, 27 Jun 2019 07:33:44 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 27 Jun
 2019 13:33:43 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 27 Jun 2019 13:33:43 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C66F145;
 Thu, 27 Jun 2019 13:33:43 +0100 (BST)
Date: Thu, 27 Jun 2019 13:33:43 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Message-ID: <20190627123343.GH54126@ediswmail.ad.cirrus.com>
References: <20190626153611.10170-1-ckeepax@opensource.cirrus.com>
 <CAJZ5v0hvN=8YmF+v6wKx9mQ=DRosAtK7QU=EWYf5PXEDsn4FEQ@mail.gmail.com>
 <20190627102345.GG54126@ediswmail.ad.cirrus.com>
 <CAJZ5v0hmMW-3UvvJch+NuYgQ+0iGP-LMrxP8p9wkmaGm1zAQoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hmMW-3UvvJch+NuYgQ+0iGP-LMrxP8p9wkmaGm1zAQoQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906270147
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

On Thu, Jun 27, 2019 at 01:02:32PM +0200, Rafael J. Wysocki wrote:
> On Thu, Jun 27, 2019 at 12:23 PM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> > On Thu, Jun 27, 2019 at 11:39:10AM +0200, Rafael J. Wysocki wrote:
> > > On Wed, Jun 26, 2019 at 5:36 PM Charles Keepax
> > > <ckeepax@opensource.cirrus.com> wrote:
> > That is fine, I don't have any problem with the helper living
> > within our driver instead. Basically the issue from my side is I
> > need to read 6 different device tree properties all of which
> > require this behaviour, ie. read a variable number of fixed
> > groups and check I have whole groups. Open coding this for each
> > call is indeed only going to be 5-10 lines of code
> 
> Exactly two:
> 
> n = device_property_count_u32(dev, name);
> ret = device_property_read_u32_array(dev, propname, val, n > nval ? nval : n);
> 
> And I would be fine with adding wrappers like this (and for the other
> data types too for that matter).
> 
> It would take more lines if you wanted to complain about the format,
> but as pointed out above, that would need to be done in the caller
> anyway.
> 

Ok I think that helps me to follow the situation. If
device_property_count cuts down the code required and leaves the
majority of the code as printing the messages which then wants to
live in the end driver anyways it probably isn't worth adding a
core helper for this.

Thank you for the review and the explanation. I will update the
driver patches to use the new function and resend those.

Thanks,
Charles

> > for each one  but since there are 6 of them it makes sense to put those 5-10
> > lines into a helper and have 5-10 lines not 30-60 lines. Seemed
> > the helper might be generally more useful, but if it is not then
> > it can go back into the driver.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
