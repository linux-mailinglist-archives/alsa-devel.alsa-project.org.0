Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C90D635692
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 10:34:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E4D21672;
	Wed, 23 Nov 2022 10:33:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E4D21672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669196066;
	bh=zCo7ajEmSY8jY8Unn0nPGGUOsczvyUkjEYnkj0jkUOE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Edxl1ETCgZUvD4gBTrxL/fJH0TlpKHkoGocCMzB+HC2IHCkbRBgNiCx83zxec4YdQ
	 F79Bjka1aAF5njOsF3bL8zT1aSyC5llGIfiztjKUeqOMbv+oG/ADUJ58FVRo4Y8tbu
	 dzgodJk4h7GkhNXLb0wNXVa6vqtrs8cPP6D+4Nas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADFC9F80115;
	Wed, 23 Nov 2022 10:33:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17FFCF8025D; Wed, 23 Nov 2022 10:33:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E73C2F80149
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 10:33:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E73C2F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="XHCfL++S"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AN5dcSs006071; Wed, 23 Nov 2022 03:33:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=43OuMipr3HIsSVvhBLEXUhwnuMv3J0F1QVkHMBSEfQE=;
 b=XHCfL++ShRfy93X2sIFXflbdbuvS6IGshUYXCBbdkUHxRLaR+pJeEY1n0DPDwa3LwNaC
 wPSSV9KDlKsYIQySbRrEKyRLopir2yd+WPgXWDQ/NCN0Nmo57ZZtvJytYoKv0dPYFHJ5
 j+GQ6S+Y0lynvpt8eT92cddiNHWQmnhIx+pZQzuc5hC+OlxO5ZTb/ZJHzas36EmIwc3O
 exSOlOfKTvCERCAMkrTIkprH8fW1HmIz7vdeVFVvZNYSNcYPInEKDmUJN7ImnBYM7UPl
 AuSO6B/HMS0jGFGs2xBa1hMzw0AeS+O9C6K/ccSQyskhbeoCZWMkUt5Ax7mAITxK+Oai 6Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kxvet4q8t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 03:33:14 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Wed, 23 Nov
 2022 03:33:13 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Wed, 23 Nov 2022 03:33:13 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 07556B10;
 Wed, 23 Nov 2022 09:33:13 +0000 (UTC)
Date: Wed, 23 Nov 2022 09:33:13 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 1/2] ASoC/soundwire: remove is_sdca boolean property
Message-ID: <20221123093313.GA105268@ediswmail.ad.cirrus.com>
References: <20221118025807.534863-1-yung-chuan.liao@linux.intel.com>
 <20221118025807.534863-2-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118025807.534863-2-yung-chuan.liao@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: mrKgfILDBs874C5LQVVnYVosQp6eU3qi
X-Proofpoint-GUID: mrKgfILDBs874C5LQVVnYVosQp6eU3qi
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org, tiwai@suse.de,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
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

On Fri, Nov 18, 2022 at 10:58:06AM +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The Device_ID registers already tell us if a device supports the SDCA
> specification or not, in hindsight we never needed a property when the
> information is reported by both hardware and ACPI.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
