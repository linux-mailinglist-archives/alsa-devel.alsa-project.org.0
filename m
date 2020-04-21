Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A761B26B7
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 14:51:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 245AF1690;
	Tue, 21 Apr 2020 14:50:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 245AF1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587473501;
	bh=ZP9kS/OJQp68dDoqkzaCkK8dxP4BMqLckgr1TcV9z+E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JvwP++Od8Cj0BwhPYt8l37WyWhTvXUSCS4Wu7kUvDX52m0Pq9W5UO/IYWFL8sHUZU
	 P0krMmHGuzJ0oZ/YAsff9ahvwLe6uskv3eddzfd5ZoJE4YKpvLkTuYjFZ6RaDpxWob
	 zYjpUIpuot1b0hsbDriYWclNkEpO9kWza6pnPRxc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 274CDF801ED;
	Tue, 21 Apr 2020 14:50:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83AEAF801EC; Tue, 21 Apr 2020 14:49:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74376F8012F
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 14:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74376F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="O2ARpDS1"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LCmCJt030802; Tue, 21 Apr 2020 07:49:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=SgHqmh1uc4UqcAS4Bo9xKkoAQRqLGIZrQn3ZYTOwRRk=;
 b=O2ARpDS1U7P/EI8nC8b+CPH9q5YN35WylmKJnsm+db3qDHhYXBJmiSSE69Alpnsa/nPY
 f2t4yJqwL6uotamVzmy2XUhjeQAcwoVpH+czG9HK/eNNvEF84rZmoptLKRYR8rXeEcMF
 HspDGKdd2Q960pe+4zN6YKNJwdH2MTZ7+7lyYOPfqj79j3nsAXFQWjptFYoK1mKhOhPc
 RoEVVLkP8PQJLw202Mq58cYz8jdTEW1nDHpIxT9Ie2TdZ5yyc7L3w43mDL4eQRbIh/qX
 PN0q1ICImuxh/wsI27L9ghxNkrK6DcM3ycLaFfLPpucsDlic5f5MQW7cnXD/Hgm8vmVb aQ== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 30fxy4cvpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 21 Apr 2020 07:49:27 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 21 Apr
 2020 13:49:25 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 21 Apr 2020 13:49:25 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DED92448;
 Tue, 21 Apr 2020 12:49:25 +0000 (UTC)
Date: Tue, 21 Apr 2020 12:49:25 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 1/8] ASoC: soc-compress: add snd_compress_ops
Message-ID: <20200421124925.GD44490@ediswmail.ad.cirrus.com>
References: <87wo6avdq1.wl-kuninori.morimoto.gx@renesas.com>
 <87v9luvdmh.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87v9luvdmh.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004210101
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On Mon, Apr 20, 2020 at 04:07:50PM +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current snd_soc_component_driver has compr_ops, and each driver can
> have callback via it. But, it is mainly created for ALSA, thus, it
> doesn't have "component" as parameter.
> Thus, each callback can't know it is called for which component.
> Each callback currently is getting "component" by using
> snd_soc_rtdcom_lookup() with driver name.
> 
> 	--- ALSA SoC  ---
> 	...
> 	if (component->driver->compr_ops &&
> 	    component->driver->compr_ops->open)
> =>		return component->driver->compr_ops->open(stream);
> 	...
> 
> 	--- driver ---
> 	static int xxx_open(struct snd_compr_stream *stream)
> 	{
> 		struct snd_soc_pcm_runtime *rtd = stream->private_data;
> =>		struct snd_soc_component *component = snd_soc_rtdcom_lookup(..);
> 		...
> 	}
> 
> It works today, but, will not work in the future if we support multi
> CPU/Codec/Platform, because 1 rtd might have multiple same driver
> name component.
> 
> To solve this issue, each callback need to be called with component.
> We already have many component driver callbacks.
> This patch adds new snd_compress_ops, and call it with "component".
> 
> 	--- ALSA SoC  ---
> 	...
> 	if (component->driver->compress_ops->open)
> =>		return component->driver->compress_ops->open(
> 			component, substream);
> 			~~~~~~~~~
> 	...
> 
> 	--- driver ---
> 	static int xxx_open(struct snd_soc_component *component,
> 			    struct snd_compr_stream *stream)
> 	{
> =>		/* it don't need to use snd_soc_rtdcom_lookup() */
> 		...
> 	}
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
