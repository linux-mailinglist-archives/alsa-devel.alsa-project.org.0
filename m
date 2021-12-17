Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 773ED478A12
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 12:35:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 047281F48;
	Fri, 17 Dec 2021 12:34:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 047281F48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639740902;
	bh=TcHfDKGRT7zYA974xKXcVOQ9HHZSt/g9IUkFv3/IU8c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U9gcfqtNE1iTH4RASe4sCHjWuQGhBHDQhLmDlkGBi+lGnsG6Fco3yCxDRlrEwasLr
	 NXMLsvgiMSr57ri8DE+oSvuMbz91EURdXPWx6RoOMBf+6At8OCSDP5Nk7e1vmU3fYA
	 BVfDzW0DN46AbC7V/SyLBoyorU0gKlZlEpCrUGoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24C40F800B0;
	Fri, 17 Dec 2021 12:33:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CD32F8014D; Fri, 17 Dec 2021 12:33:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB7FAF800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 12:33:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB7FAF800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Yg+MvWuv"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BH8OJiB016240;
 Fri, 17 Dec 2021 05:33:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=qQFrIlpFszZ1RBg9pe9JzRRyFu+mammDM6kqccfXLE8=;
 b=Yg+MvWuvysTVkyIgfPcJ5PQtMnreTVx82mpk3ZiP8ycfdJdl/WRhkDSEycI4U7OpTenz
 zxkYqASWtupMkWASRAYLb/xgBjF7UlAFFFPI6VGaknAcc5t4+6sYDRNkjgiNjQjEBabZ
 tTUgzBOilnmmA3TwDlMDQLi40TDhzCnLPi/QXNxz20VkZ/iUDQQUtL/AcVs7ZIu4XBBo
 ETX8cPnerazAewrqi7UbsS31QohDCX0EagbjjcWjgoTLYMHjgin5DR8G/+ErZEI3zAaD
 TcFfoQKwUZ4VO9SoqrNq69Fyuk9W3AG9aWeWfpDXeNozq+YS/G/kJIEr4lTe+hAvZ9Rr zQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3d0q0m05wg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 17 Dec 2021 05:33:41 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 17 Dec
 2021 11:33:40 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 17 Dec 2021 11:33:40 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 96C10478;
 Fri, 17 Dec 2021 11:33:39 +0000 (UTC)
Date: Fri, 17 Dec 2021 11:33:39 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 1/1] pinctrl: Propagate firmware node from a parent
 device
Message-ID: <20211217113339.GV18506@ediswmail.ad.cirrus.com>
References: <20211216151227.58687-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211216151227.58687-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: nzCZZVgiqNxCMOFILECwBs6o2giAwtqQ
X-Proofpoint-GUID: nzCZZVgiqNxCMOFILECwBs6o2giAwtqQ
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org,
 Support Opensource <support.opensource@diasemi.com>,
 patches@opensource.cirrus.com, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>
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

On Thu, Dec 16, 2021 at 05:12:27PM +0200, Andy Shevchenko wrote:
> When creating MFD platform devices the firmware node is left unset.
> This, in particular, prevents GPIO library to use it for different
> purposes. Propagate firmware node from the parent device and let
> GPIO library do the right thing.
> 
> While at it, slightly modify the headers to reflect the usage of APIs.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

For the Madera bits:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
