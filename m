Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B52A485066
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 10:53:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20EA917AD;
	Wed,  5 Jan 2022 10:52:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20EA917AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641376389;
	bh=xV4Twu8a+Cx2s/Kdz6KqQaDtGsmE0jUMVrNyFryX818=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TnMLjzW+iduyH3DuonvAjw1SL7DiIetIRLrAA4pU8c2kYAMjW7PDzNEpQQvmceIy7
	 3783BUnTtJratz9pj4M+pNt4fjeaoKSpmbLSouC9mYr/SshSRc2nwjsk9ratOV4Z3V
	 aXjY7K3Uqx5Yd3F7OKtDTF7Ckmixqt18Czk9Su/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2395F8007E;
	Wed,  5 Jan 2022 10:52:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBC28F801D8; Wed,  5 Jan 2022 10:51:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BE3CF8007E
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 10:51:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BE3CF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Xc2HJr+u"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2059IO7f015567;
 Wed, 5 Jan 2022 03:51:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=kKkWS1xGVlFJIrJzXQrCAsIJbh4nE/EyroCanAHwblA=;
 b=Xc2HJr+unJYsgK1gfaiJixn0r3ga/krt498xD9rmkSlTsiPPLjM7RulqK3EiIL9jzZjP
 7l8BfRN9i5RhUT0ywizx8vv3Xsc8ZGLtemSRoQippjMfccZjgjKn4XFs6Gs58iBWDm/s
 MiwDUptjaGnLCXybDBmLrQ452D/KPw3t+zZ/Tu4lbCUJxP9GrNCLLtJZrSdIbgyEDw+x
 pdXki8S441lZ5eG53iKQQJ+r5mYJ+DUPM/3Me0ZyXk7k1XtGMKW8Hm8bwprtveENNVHo
 7ET27dOrly9J1MjbElFel+6uFUPVOmt719mC1kphrgpxtmEmBmSa8WPF+vvoXr/dDGpk aQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dd8jy80xf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 05 Jan 2022 03:51:45 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 5 Jan
 2022 09:51:42 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 5 Jan 2022 09:51:42 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E017AB0E;
 Wed,  5 Jan 2022 09:51:42 +0000 (UTC)
Date: Wed, 5 Jan 2022 09:51:42 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3] ASoC: cs4265: Add a remove() function
Message-ID: <20220105095142.GC18506@ediswmail.ad.cirrus.com>
References: <20220104180613.639317-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220104180613.639317-1-festevam@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 46bql3AI91CzqdjyNfK8CYk1OUSDPyjB
X-Proofpoint-ORIG-GUID: 46bql3AI91CzqdjyNfK8CYk1OUSDPyjB
X-Proofpoint-Spam-Reason: safe
Cc: Fabio Estevam <festevam@denx.de>, alsa-devel@alsa-project.org,
 broonie@kernel.org
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

On Tue, Jan 04, 2022 at 03:06:13PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> When the reset_gpio GPIO is used, it is better to put the codec
> back into reset state when the driver unbinds.
> 
> Add a remove() function to accomplish that.
> 
> Suggested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
