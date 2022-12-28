Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B2D657512
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Dec 2022 11:05:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20EF38C31;
	Wed, 28 Dec 2022 11:04:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20EF38C31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672221948;
	bh=qalDd+myo2qLfenOpxcXbxWoIdeR+/3NaNwCAVGLQQA=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SDAGJBCcxTYaY5FssMwLeXBTo+jiTVS13zcgnEHLwDqi9cwlWWOG0ZolMLobQBWwW
	 tTUglcszbWjI/xrFnyAoCBbX9eKZZ4O8KZsLUzUYu5p24TS9EcKPsLOJqAqfXQ7+vz
	 63ip/aFlLf1BnXWAP1iOTCXk4TMS4zLfcTwaj8/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52058F804FE;
	Wed, 28 Dec 2022 11:04:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F598F80534; Wed, 28 Dec 2022 11:04:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65BCCF804D6
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 11:04:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65BCCF804D6
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=NqHR7X4A
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BS9nxMQ022393; Wed, 28 Dec 2022 04:04:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=OG9XGS/yzG0LuEw8LPDFuMlP88HYFc2qStzDlJJtW+o=;
 b=NqHR7X4A6wfz8J0YYlg96YqW820jwFZ1lMirs314sGM3ghE1UETOGhoO7mHXJWGzOupm
 asKh/Wg48GYsRmWuQaOhLMXR8cuSnPnQvjy8/wfy7lnhYCupDwwcGxBeFl5a/TuRN531
 xB9YcZX6KFCJX50lZUc4E0OYw2gF1pwdc2i5ES5J8sMqnKsEMUF2opqnF+66ZNTkpnwx
 bxCp83AskePmm8VpMNoCgxy3/LIleN6RJgPm0NQAsFOIRywlgz7TJ4+wvhZPMjsBu2d0
 ztz8Iyhl0/tnSLTy6J+vkTGdaiGOfoHnKQoFP0+ohpTiGxlorXzZLpL1gJaNFSZFa4Wc aQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3mnyq7axtu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Dec 2022 04:04:47 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Wed, 28 Dec
 2022 04:04:45 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Wed, 28 Dec 2022 04:04:45 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 849B511CC;
 Wed, 28 Dec 2022 10:04:45 +0000 (UTC)
Date: Wed, 28 Dec 2022 10:04:45 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v1] ASoC: wm8904: fix wrong outputs volume after power
 reactivation
Message-ID: <20221228100445.GG36097@ediswmail.ad.cirrus.com>
References: <20221223080247.7258-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221223080247.7258-1-francesco@dolcini.it>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Fu9yuUhQccCSoGTvaTaywYAJ3xlovysj
X-Proofpoint-ORIG-GUID: Fu9yuUhQccCSoGTvaTaywYAJ3xlovysj
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
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Dec 23, 2022 at 09:02:47AM +0100, Francesco Dolcini wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Restore volume after charge pump and PGA activation to ensure
> that volume settings are correctly applied when re-enabling codec
> from SND_SOC_BIAS_OFF state.
> CLASS_W, CHARGE_PUMP and POWER_MANAGEMENT_2 register configuration
> affect how the volume register are applied and must be configured first.
> 
> Fixes: a91eb199e4dc ("ASoC: Initial WM8904 CODEC driver")
> Link: https://lore.kernel.org/all/c7864c35-738c-a867-a6a6-ddf9f98df7e7@gmail.com/
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
