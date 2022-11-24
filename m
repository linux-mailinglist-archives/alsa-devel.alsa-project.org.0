Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FA163750F
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 10:23:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47B2616D3;
	Thu, 24 Nov 2022 10:22:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47B2616D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669281820;
	bh=skvq8lltv59UBkQSjhJTL/14dArzIx5Imo6teXv6wT0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TRlQ912lWOzoRDL14RwNIvv4+i+V+YzlBddm3Bj3PSgMy47teEzKmpai29/yP4EIe
	 Fzf009tH1FlfzRSvD+PkmdrMbbmRgSlzcS9shqabyeLTKNaaPlAhHalTKHSMdKxvDD
	 j8uoeV0z/7R3fOHQ4KBycMSJZ4xNj+pQfl9OQTww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0A62F80115;
	Thu, 24 Nov 2022 10:22:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23E88F80431; Thu, 24 Nov 2022 10:22:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CE9AF80115
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 10:22:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CE9AF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="i5gjlt74"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AO7sBjC004512; Thu, 24 Nov 2022 03:22:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=wsQRThLlbccZrJZvbPoJQTj1QE08PMaYf1MzGwUSMRs=;
 b=i5gjlt74FrlTQbWhuAAPG3dJqgx3eK04h7TQlp/bjl8NA4f1QKJ8Ykj2IuygpBH7WJ2r
 sapLXTgMk6fy2e3/bo55WcuUyPf/04Yit3K8coqNyAWRAqqCruxMvkTYIguPW9fcxJDU
 QzhjkjRs+lw5/dfmcOO6Kwqdg/oLR24aHU6H6GoNk8vBIbT6q4FlTmGzzS4k3QmlTR8P
 6yae4ieGttCq7NphI5bG1IaMjJhuUr+GhDN20OBNKXBSkkf4BivUzPObd/A048U4EAjK
 gaIo0p0t7uZqYAdThtKDwFsyhTQxQ+OWJ2bwwKDIB5HAVeiVv4czWpxYJaF5hGVd8WJN qQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6wygd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Nov 2022 03:22:33 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Thu, 24 Nov
 2022 03:22:31 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Thu, 24 Nov 2022 03:22:31 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A87282BA;
 Thu, 24 Nov 2022 09:22:31 +0000 (UTC)
Date: Thu, 24 Nov 2022 09:22:31 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 2/4] soundwire: Provide build stubs for common functions
Message-ID: <20221124092231.GD105268@ediswmail.ad.cirrus.com>
References: <20221121141406.3840561-1-ckeepax@opensource.cirrus.com>
 <20221121141406.3840561-3-ckeepax@opensource.cirrus.com>
 <Y374VPAQcX6MkG22@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y374VPAQcX6MkG22@matsya>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: iKGQYZSxFjDxzItSCcsTmehsj3BpSXOI
X-Proofpoint-GUID: iKGQYZSxFjDxzItSCcsTmehsj3BpSXOI
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

On Thu, Nov 24, 2022 at 10:21:32AM +0530, Vinod Koul wrote:
> On 21-11-22, 14:14, Charles Keepax wrote:
> > Provide stub functions when CONFIG_SOUNDWIRE is not set for functions
> > that are quite likely to be used from common code on devices supporting
> > multiple control buses.
> > 
> > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> > +static inline int sdw_stream_add_slave(struct sdw_slave *slave,
> > +				       struct sdw_stream_config *stream_config,
> > +				       struct sdw_port_config *port_config,
> > +				       unsigned int num_ports,
> > +				       struct sdw_stream_runtime *stream)
> > +{
> > +	return 0;
> 
> Should this and other here not return error...? Indicating sdw is not
> available..? Silently ignoring may not be very helpful in debugging
> 

Yeah I was a little unsure which way to go on that, in the end I
opted for returning zero as it was more likely code would get
optimised out. But I am happy to switch to returning an error, it
would as you say making debugging misconfigurations easier.
-ENOSYS seems kinda reasonable I think.

Thanks,
Charles
