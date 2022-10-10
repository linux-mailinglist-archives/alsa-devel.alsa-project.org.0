Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 188535FA0C5
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 16:58:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E4D02CC7;
	Mon, 10 Oct 2022 16:57:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E4D02CC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665413915;
	bh=X12sBoMZ3NtsS0oQuY+HqCZEzhVDgriE1pt6zZPNX98=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RXQv+N9i332EmbfiV+vUxdOeI8Ls5c8E7p97Xj0T6DGUnKpwwjiNlowX2uRrymMC+
	 QZQxe0l/zVHDu6TxgD9irya7sAjlXxr5OVaGhIUFSNWGcyKeYXjRBxxAiPezkJ+iBU
	 aKu4ilHtlneFZAAkdiVC2BJx1o7RTxxrae8tGWDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1C90F80155;
	Mon, 10 Oct 2022 16:57:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F03C9F80256; Mon, 10 Oct 2022 16:57:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B54CF800B8
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 16:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B54CF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="PhEkOhV1"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29ABfpOe008858;
 Mon, 10 Oct 2022 09:57:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=3cuiG9m6vIhjwqp/IWKVUxSa8Ym/VaVsO8Icgx0or3w=;
 b=PhEkOhV1EFCAlSWBlcFbVi8iXloP49/wnrlRN4680dp+XnnqH150J260Z+p4xlcunlrL
 I9fEvT+uNXes6at0cnhM5ekMptUU7zzfQzYeAeruxvMQy1y1ybPKcyMUzxH/3IFn4Avc
 Z+ZlJ5YsX0/cZHlPgmxkvaOQRJ5XlC6iBDDbpAElNyciU8S7LFOj4NEameb4ecZ4ujIW
 zSehU8XfcP1mHj5q588B+VWlALaSKLne7PX6NNhuKRgMeV034o6Se2ORnd/0heKvtdG2
 PmGSVKLFl4QVFYb5L+N/Hp+GgJE/7KO/uHNWS+8gf7Y5cJfqd6vP77gYmahUOrRgPFHd hg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3k36m1t472-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Oct 2022 09:57:28 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Mon, 10 Oct
 2022 09:57:26 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via
 Frontend Transport; Mon, 10 Oct 2022 09:57:26 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C2AA1468;
 Mon, 10 Oct 2022 14:57:26 +0000 (UTC)
Date: Mon, 10 Oct 2022 14:57:26 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Subject: Re: [PATCH] ASoC: wm8962: Add an event handler for TEMP_HP and
 TEMP_SPK
Message-ID: <20221010145726.GD92394@ediswmail.ad.cirrus.com>
References: <20221010092014.2229246-1-xiaolei.wang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221010092014.2229246-1-xiaolei.wang@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: hsjsF0xQgJbGqZcG_8mLtdHL5xkhVTFg
X-Proofpoint-ORIG-GUID: hsjsF0xQgJbGqZcG_8mLtdHL5xkhVTFg
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, steve@sk2.org, geert+renesas@glider.be,
 patches@opensource.cirrus.com, tiwai@suse.com, chi.minghao@zte.com.cn,
 lgirdwood@gmail.com, broonie@kernel.org, aford173@gmail.com,
 linux-kernel@vger.kernel.org
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

On Mon, Oct 10, 2022 at 05:20:14PM +0800, Xiaolei Wang wrote:
> In wm8962 driver, the WM8962_ADDITIONAL_CONTROL_4 is used as a volatile
> register, but this register mixes a bunch of volatile status bits and a
> bunch of non-volatile control bits. The dapm widgets TEMP_HP and
> TEMP_SPK leverages the control bits in this register. After the wm8962
> probe, the regmap will bet set to cache only mode, then a read error
> like below would be triggered when trying to read the initial power
> state of the dapm widgets TEMP_HP and TEMP_SPK.
>   wm8962 0-001a: ASoC: error at soc_component_read_no_lock
>   on wm8962.0-001a: -16
> 
> In order to fix this issue, we add event handler to actually power
> up/down these widgets. With this change, we also need to explicitly
> power off these widgets in the wm8962 probe since they are enabled
> by default.
> 
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
