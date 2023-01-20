Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD37675341
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 12:14:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 257F73129;
	Fri, 20 Jan 2023 12:13:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 257F73129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674213288;
	bh=rE3ydR2KmG5bMaKnfzNlFCWWXZaYGiOoX20ln7dEf60=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=S8Gins5Drqr4yrsGozNy7MNbCkNvuwWsVXljIVH3EXI4sqbXZrl5KszjVOL0F5uBe
	 u2aICoXjpstCJNGaC9VLVubz4Mia/H3AnOeURmCDcgjYJ3RLB2FWPECeD2fsmd7Sx4
	 ZUup6++vBhDqgxQBRRqH7WXRCT9TNhkQkKvRhyrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 092CBF80482;
	Fri, 20 Jan 2023 12:13:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B68AF8026D; Fri, 20 Jan 2023 12:13:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66D45F8024C
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 12:13:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66D45F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=qqXuQgF2
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30K8xNwG025055; Fri, 20 Jan 2023 05:13:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=IZDXqZlJGZwthME05uz1nCeTHtS+dlW50m1/8HkrGHo=;
 b=qqXuQgF2bLbSuv7h+02zm+pjSfq3gw1hD3RqbChF58xkvInbS1ighgSl1XKG7FfutThy
 X58903MicQqgGxhUwuOCj1mtPTXuTAAFei7ZRmbJ/kU2GezjdM2KAerKeD0mQONSJj9I
 iqQv8/P7q1ibiSnPw6uv7kx22NElvsNntXTg6hR2U06MtFAn03jK0DWFKtpNpmpXuHDC
 XNQ7AlM80YORM0RQZiSuORmwTNw7NUWAl6/cx80QeWIQVP3A3tB+vFwkbE9gEs0X2I5Q
 fbGa0HUkb+sAQ1Q1V18AqmTi3z3am8h0hczzxrg1bOe9hfi2LYX0Dgj7JxKGCOadKn0x Zw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3n3tp6hue6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 05:13:46 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Fri, 20 Jan
 2023 05:13:44 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via
 Frontend Transport; Fri, 20 Jan 2023 05:13:44 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 020C32C5;
 Fri, 20 Jan 2023 11:13:44 +0000 (UTC)
Date: Fri, 20 Jan 2023 11:13:44 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 02/25] ASoC: soc-dai.h: add
 snd_soc_dai_dma_data_set/get() for low level
Message-ID: <20230120111343.GR36097@ediswmail.ad.cirrus.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
 <877cxhlmef.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <877cxhlmef.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: GrgFN3wKrjeNLyXRCS-J7NsX1MvyeQHa
X-Proofpoint-GUID: GrgFN3wKrjeNLyXRCS-J7NsX1MvyeQHa
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Heiko Stuebner <heiko@sntech.de>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jan 20, 2023 at 07:01:45AM +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current ASoC has snd_soc_dai_set/get_dma_data() which is assuming
> struct snd_pcm_substream to get Playback/Capture direction.
> 
> But, many drivers want to use it not through snd_pcm_substream.
> This patch adds more low level snd_soc_dai_dma_data_set/get() for it,
> and previous functions will be macro for it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
