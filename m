Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 728436356D2
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 10:34:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A15D1679;
	Wed, 23 Nov 2022 10:34:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A15D1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669196092;
	bh=hGYhrHx5wdEy0AuLqg53tdUJkdZmaI049AmKdJ+M0nA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NabgLG+yW7zVrkrWcvTMfqKtx0BaVSDz4hNEAOaO0eDoqGg/h//Ik1St9bqgIuZyP
	 mDx2YCfD73vFv2SYcb8s08uAjI0CdHZrfIn0i4f7k4Q0Vy5KAL8eEdzkOQ+JLqL0QH
	 9qHcHjjzbxopqqko+BoeeXpSwenCmFiwAyJwf2wk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94978F804D2;
	Wed, 23 Nov 2022 10:33:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E78F8F8049C; Wed, 23 Nov 2022 10:33:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53141F8030F
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 10:33:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53141F8030F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="B5MFmusV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AN6wMto030293; Wed, 23 Nov 2022 03:33:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=m6sZqZu8DE0JOM+DEU5I47tkDmeAPj54tBuAsnifHLI=;
 b=B5MFmusVOSPUOipkGpbkzKYiDHNiX+J9kJGRbLEnHcuOSm005ElGIhlhKNVbDB4Sc0/V
 Nh1mBDjhB8VxK/Ga6hPPhZnOaDQ+CatBkCfCNKsDHH1fslge1fvrIax4d4c5sTvQ5cb/
 /L1Azm4IQUkLLAKFoxlgVopDxK0KAH0znpag/aO+fgPBCcpTsrUC5TezBl+9oudJTJ3d
 QSJS/JBxYCV7d90vzI03TcRty3C6GV88Hbh0mzIRPmukV+QBj3boUReVBVt3FXRViugz
 3o4wy47hsakqgvojHNWGe/UzX92iSQ/9OIFwtdJTnm+5Fgh353of3Vt4Ki1HuLTmim7D vQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6vp7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 03:33:47 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Wed, 23 Nov
 2022 03:33:45 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Wed, 23 Nov 2022 03:33:45 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1A46F2BA;
 Wed, 23 Nov 2022 09:33:45 +0000 (UTC)
Date: Wed, 23 Nov 2022 09:33:45 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 2/2] soundwire: enable optional clock registers for
 SoundWire 1.2 devices
Message-ID: <20221123093345.GB105268@ediswmail.ad.cirrus.com>
References: <20221118025807.534863-1-yung-chuan.liao@linux.intel.com>
 <20221118025807.534863-3-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118025807.534863-3-yung-chuan.liao@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: pfEt5VDAONvi441qWvEOxEi_eMzeJgPv
X-Proofpoint-GUID: pfEt5VDAONvi441qWvEOxEi_eMzeJgPv
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

On Fri, Nov 18, 2022 at 10:58:07AM +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The bus supports the mandatory clock registers for SDCA devices, these
> registers can also be optionally supported by SoundWire 1.2 devices
> that don't follow the SDCA class specification.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
