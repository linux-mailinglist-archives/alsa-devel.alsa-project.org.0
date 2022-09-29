Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 466D75EF15A
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 11:09:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8A3115CA;
	Thu, 29 Sep 2022 11:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8A3115CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664442553;
	bh=KxjNYUY8yaDPZ1Pl6MfIPMAhDcfPbGgBDXMj2r+zZMg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K447cO9LLEOHphJNSvF+ZCbY4Pn5m69P4htXUAbFxgXf8IIf5MPyWhrHNQSBpUkw8
	 iQML2KCHFxzLFXQ3P1wsopB5ttWgOTu3JZqX+VV77UJBML7iJrIvisgwV5YhovrWKW
	 wjNcx9k3yccWZXsCMlLGL9CvTsLDJZd/IdlTOjTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 494D7F800AA;
	Thu, 29 Sep 2022 11:08:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 205EDF804CA; Thu, 29 Sep 2022 11:08:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47C1CF8023A
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 11:07:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47C1CF8023A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="CA7HvUxN"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28T3krFF021124;
 Thu, 29 Sep 2022 04:07:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=HFdcsJcr68aYNNGQexiOZ6KFBlU78jamvV693+menlM=;
 b=CA7HvUxNr/lQBUQ/XVMyAh+sWfPA3M4GV5rOWcOg5WNIhklOroQ6TnkrDLR9JG+vPDOw
 ggXue7+Kj5qo/luewcDn9Sbn/n++3tsZkloAlN0w3IUAIoiVPoZksUxCQ+5izBjaer8g
 tjH5WNZflMJKB0GI2erQMmVwlpAZoefLBxpAoQq6v2N71UvVOA7pOHgTIf6x6W/7eMuJ
 zFsNDtkC51BZ0V9WH5N7gXokcaZwQSnG0554xIR3VqkyRPNkJi1hH4gSN+eXmAggT1TS
 Gh2JpZy0xGrPMxJJfF5SdJ0YRGhj2XnNJZD4HIvGQM5LFDfpZVoP0Utev6XYpkqDF6lk GQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3jsya2e02x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Sep 2022 04:07:52 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Thu, 29 Sep
 2022 04:07:50 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via
 Frontend Transport; Thu, 29 Sep 2022 04:07:50 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8EC062D4;
 Thu, 29 Sep 2022 09:07:50 +0000 (UTC)
Date: Thu, 29 Sep 2022 09:07:50 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shang XiaoJing <shangxiaojing@huawei.com>
Subject: Re: [PATCH -next 2/4] ASoC: wm8978: Use DIV_ROUND_UP() instead of
 open-coding it
Message-ID: <20220929090750.GS92394@ediswmail.ad.cirrus.com>
References: <20220927140948.17696-1-shangxiaojing@huawei.com>
 <20220927140948.17696-3-shangxiaojing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220927140948.17696-3-shangxiaojing@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: oOM0RB30t99o8IJK6xDBRb7GH7Vmivuu
X-Proofpoint-GUID: oOM0RB30t99o8IJK6xDBRb7GH7Vmivuu
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, tanureal@opensource.cirrus.com,
 patches@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 david.rhodes@cirrus.com, rf@opensource.cirrus.com, broonie@kernel.org,
 christophe.jaillet@wanadoo.fr, james.schulman@cirrus.com,
 peter.ujfalusi@gmail.com
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

On Tue, Sep 27, 2022 at 10:09:46PM +0800, Shang XiaoJing wrote:
> Use DIV_ROUND_UP() instead of open-coding it, which intents and makes it
> more clear what is going on for the casual reviewer.
> 
> The Coccinelle references Commit e4d8aef21403 ("ALSA: usb: Use
> DIV_ROUND_UP() instead of open-coding it").
> 
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
