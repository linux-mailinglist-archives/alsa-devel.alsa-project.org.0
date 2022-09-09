Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B715B3595
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 12:51:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3D511679;
	Fri,  9 Sep 2022 12:50:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3D511679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662720702;
	bh=lUmDMhiF8lwwv2lKAciOsvwyDyYY7c9q5moMPEB33mg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HqcLABAmlUEfrc7EGoj03EKKOHUJCmA52j0/b6b9U9xfVlPUf/xl1t34CuFeBKU9i
	 H6Y3+TtF9jqShX5saMtl/3R8Xdykf+F8gCb5LLra4HZi4GvtYUmlJbCZGuE5HPUrw1
	 kq7c0AikO+mZdErLt0Se6JF5hDVHNeRF51qtFZpk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 624DDF8032B;
	Fri,  9 Sep 2022 12:50:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0D07F8023A; Fri,  9 Sep 2022 12:50:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2ADDBF8016C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 12:50:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ADDBF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="YvwYAveu"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2896qFBf009110;
 Fri, 9 Sep 2022 05:50:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=wwd6UnFJ7T4llYdZ8VQvB3ojTi24MgDoWfc6lbC7Jk0=;
 b=YvwYAveuvw93cgOueUwhcOA8wUNKNrMWlx5a5iQ9aizi7kXdLYN98tNXu76E5WSjDNxO
 WxM1tHxkN1jCgaM1b1MfCXI5lScxHSnY9xY0w40FZ3DBJVBIWQUn0nIZqlCdleAqsWPH
 sDLudUQ58ze+B/Wt38B0pZgGIWC8JQccAZlj0SX1/G/fm71yd89PrGY60tGPzk8s5zsJ
 4x3EUvfRkG3oTnsCPTmKYXVgBGQbeMNTysOcCEoBZGxvf0LxMo4sm1oU5H5tMukFMJN5
 UULtgm7hWaEIcFYH0qPoOKTgCx+Lj+noRb6ElvY85WyxVg8vIP6drdYAh4t4zA/UZGzX TQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jc3bq0uus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Sep 2022 05:50:30 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Fri, 9 Sep
 2022 05:50:29 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Fri, 9 Sep 2022 05:50:29 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 62BB9B16;
 Fri,  9 Sep 2022 10:50:29 +0000 (UTC)
Date: Fri, 9 Sep 2022 10:50:29 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: hdmi-codec.c: use devm_kzalloc() for DMA data
Message-ID: <20220909105029.GQ92394@ediswmail.ad.cirrus.com>
References: <874jxhmjgw.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <874jxhmjgw.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Q3OjWEcahQeOw2TRMc2dWnONKeAJMuR1
X-Proofpoint-ORIG-GUID: Q3OjWEcahQeOw2TRMc2dWnONKeAJMuR1
X-Proofpoint-Spam-Reason: safe
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Chao Song <chao.song@intel.com>,
 Dmitry Osipenko <digetx@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Fri, Sep 09, 2022 at 01:20:48AM +0000, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> hdmi-codec.c is using kzalloc(), but we can replace it to
> devm_kzalloc() and then, we can remove .remove callback.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
