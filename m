Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 073F1675388
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 12:41:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C314318A;
	Fri, 20 Jan 2023 12:41:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C314318A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674214915;
	bh=BZ6sfrG1qkb7V9Q/EAParnsx0yMxPCvZaSp3AbNRtjo=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Nv4VsQPrFk4xg3N3mYRbasyZ0mmr+3zwF3gI4C7qbhoO0f6Sa+3+9hcwf68VtXt61
	 7u+/m7wRv7wg9ELqShYG9nUSkcy1TjICcm7AtOEoOVhJE2RX03KeGN27Uja7+WuJR0
	 bofUAfkCO7lidJ+Nzt0SU+U0NyORfuE/bgCgzRTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29F6BF800F0;
	Fri, 20 Jan 2023 12:40:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C172F8026D; Fri, 20 Jan 2023 12:40:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3B3CF8024C
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 12:40:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3B3CF8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Y2n3n5Hx
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30K6qOJ4008272; Fri, 20 Jan 2023 05:40:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=y39eDEK9ZUeMIxp9ytUOJfpj4PFMC+SXT6xSWwK70jc=;
 b=Y2n3n5Hxh1/VpMdUfCIsf+gdGPDaEH5797XxKkz1uWaPyQtEYMPqK7q5oWAk/8R0t3iH
 tXCnylYxyWfgHZ5JRY6cae1BjqG33yu0L1qrCK9vAVEu6MfEyTX1LjTHH05i5HAc+aYL
 QUE3V78O7ffbCPe2UNphnnTdlQMqNHSpyFs31B0V1CHk21ticNfrwBmdyIjAPjs4vJM9
 JOvLFCyhBxu2CY+eIQg8oaaoBtvBw5y3n2H/PAgcpx9CTA6jJbJCxy6APm1R1toD1kj8
 WdtzJN0pSU3HyLOUD8qbzar2GIn3V2mT7SmPQbiQdgz1hZaxLVzBNzRz6SAt70OfnHlr Ug== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3n3spxb05g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 05:40:52 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Fri, 20 Jan
 2023 05:40:51 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.7 via Frontend Transport; Fri, 20 Jan 2023 05:40:51 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4F12F2C5;
 Fri, 20 Jan 2023 11:40:51 +0000 (UTC)
Date: Fri, 20 Jan 2023 11:40:51 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 25/25] ASoC: soc-dai.h: cleanup Playback/Capture data for
 snd_soc_dai
Message-ID: <20230120114051.GV36097@ediswmail.ad.cirrus.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
 <87a62dk7pt.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87a62dk7pt.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: wynU5YstYP8MhBxrzYVkD_ZbSQwnk-Eb
X-Proofpoint-ORIG-GUID: wynU5YstYP8MhBxrzYVkD_ZbSQwnk-Eb
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

On Fri, Jan 20, 2023 at 07:04:14AM +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current snd_soc_dai has data for Playback/Capture, but it is very
> random. Someone is array (A), someone is playback/capture (B),
> and someone is tx/rx (C);
> 
> 	struct snd_soc_dai {
> 		...
> (A)		unsigned int stream_active[SNDRV_PCM_STREAM_LAST + 1];
> 
> (B)		struct snd_soc_dapm_widget *playback_widget;
> (B)		struct snd_soc_dapm_widget *capture_widget;
> 
> (B)		void *playback_dma_data;
> (B)		void *capture_dma_data;
> 
> 		...
> 
> (C)		unsigned int tx_mask;
> (C)		unsigned int rx_mask;
> 	};
> 
> Because of it, the code was very complicated.
> This patch creates new data structure to merge these into one,
> and tidyup the code.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
