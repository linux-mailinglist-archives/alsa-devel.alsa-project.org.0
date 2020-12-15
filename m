Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1A12DAACD
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 11:25:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1180C17E3;
	Tue, 15 Dec 2020 11:24:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1180C17E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608027907;
	bh=hD7oXNIPpLCQe8EUvTgaEBgNT6PCIn+D+UH0hbwJECI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p/etho0nfcR+rGPQX0nWUwnfFY4ZZZwwAkePYKcnGt2w1MI4sxArRb0TTVxKEA4aT
	 qqtH6GSeCoKLUwJF05GVuEFX9Z5C/TO50jJPRCeUcV22sBa3VnRaOprCYD/7p00qil
	 p3V/EznosuaUekxb1n2RoiF+N1MGUkT0pAtre17k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42A70F8014B;
	Tue, 15 Dec 2020 11:23:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A232F80278; Tue, 15 Dec 2020 11:23:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32DE3F8014B
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 11:23:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32DE3F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="PwGRccYF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BFAMkmt031377; Tue, 15 Dec 2020 04:23:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=tvQrv/ItfE78XRSohMF/HJEtdwtZZi+AiD3Wfw82lT4=;
 b=PwGRccYFmlBlAWmufhrIJD0yvLKqLJi0MosBRl7FsXhox0AL77Mj9nDPm+HrBmxW8NZr
 W/wWLESYPYtqcdwwjvrURPsowQZubuqAwUhI1x7BHbiWL3KRdWy6p5GGhfcgggDU56xP
 8pklTAy9DLO8sDeR2gZPUCPB3IsOkue8RF7hn3jD2gMxZmrG8ixal13ijvbNjJBy851a
 tFF7kbo/tKjBFrzll31oM2audzjTuZkdg3WI4F3G7SDtWYG7tGfrzPXgBe4R0R/PE4Qu
 NZqTrBHWMsujwiturDSQtVlsz7RhxsCmDALiCpRAY1XvHZx9RxWg7OWtE+uxjFYT5KTX PA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 35cv56kkmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 15 Dec 2020 04:23:15 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 15 Dec
 2020 10:23:13 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 15 Dec 2020 10:23:13 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 881E811CC;
 Tue, 15 Dec 2020 10:23:13 +0000 (UTC)
Date: Tue, 15 Dec 2020 10:23:13 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Thomas Hebb <tommyhebb@gmail.com>
Subject: Re: [PATCH] ASoC: dapm: remove widget from dirty list on free
Message-ID: <20201215102313.GD9673@ediswmail.ad.cirrus.com>
References: <f8b5f031d50122bf1a9bfc9cae046badf4a7a31a.1607822410.git.tommyhebb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f8b5f031d50122bf1a9bfc9cae046badf4a7a31a.1607822410.git.tommyhebb@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0
 clxscore=1011 impostorscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012150073
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
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

On Sat, Dec 12, 2020 at 05:20:12PM -0800, Thomas Hebb wrote:
> A widget's "dirty" list_head, much like its "list" list_head, eventually
> chains back to a list_head on the snd_soc_card itself. This means that
> the list can stick around even after the widget (or all widgets) have
> been freed. Currently, however, widgets that are in the dirty list when
> freed remain there, corrupting the entire list and leading to memory
> errors and undefined behavior when the list is next accessed or
> modified.
> 
> I encountered this issue when a component failed to probe relatively
> late in snd_soc_bind_card(), causing it to bail out and call
> soc_cleanup_card_resources(), which eventually called
> snd_soc_dapm_free() with widgets that were still dirty from when they'd
> been added.
> 
> Fixes: db432b414e20 ("ASoC: Do DAPM power checks only for widgets changed since last run")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
> ---
> 
>  sound/soc/soc-dapm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index 7f87b449f950..148c095df27b 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -2486,6 +2486,7 @@ void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w)
>  	enum snd_soc_dapm_direction dir;
>  
>  	list_del(&w->list);
> +	list_del(&w->dirty);

I can't help but wonder if we should be taking the DAPM lock for
snd_soc_dapm_free_widgets. However your patch doesn't look like it
is making that any more scary and looks like we should be making
sure we remove the widget from the dirty list.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
