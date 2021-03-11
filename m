Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3751C336EE5
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 10:31:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD26F1775;
	Thu, 11 Mar 2021 10:30:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD26F1775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615455088;
	bh=pIaGJzBGIwcHc/rgyoyKEbchPHiZ5wLlNVi6ya5abgA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sKdIf+g1YE2VtuOAwXXMcDFw4yaqJ116BTd2ozv0iZiJQ3Nb51wIbRd5MvfdtI6CW
	 pFwu85429knxoNlk+9AnBHdwOLUUjuluq7jfs9mVrAM8JLo9u9PtXA1gnttfMlZpFA
	 59B8E11nLCagJpoYRqcwv3S1zrxnzgTEd2vdRv5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25E04F80227;
	Thu, 11 Mar 2021 10:29:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 852C5F80227; Thu, 11 Mar 2021 10:29:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38A78F8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 10:29:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38A78F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="f3hoTHW+"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12B9BdGx015624; Thu, 11 Mar 2021 03:29:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=MpdJUdvLSDU/m+lQ2xgBR3vFcEEsDEoAI/DT5S1uhqM=;
 b=f3hoTHW+iKu1im9HbsSFOoxAXIcGvt9+nKGZt7bVe8G5UF1w3uwuzHpzDgrE0rCqtLaL
 nS8G2vQRzu0/OJHw2PXzRw3aJnD8BI0FYzg0KYFPMoZ8WHdtmlvaR1g8L5iHhmabDwTM
 oD4CKxz+Lq5Zkz2FKresosdI+EhejrC8ElOdUDoRke9KSY+B0cVb4H5zm9JFPjgcgoez
 1sKgJqfEdmdtP7kJMOATkyUU4D+m2Bvka0Vxt0rUfadi/C1hFPrEhyywgQirhP7TVbbo
 JvLR7QdifVAhbJZzJTmryMnuq4mzSp3sdEn5ty8iGBYC2fmwBXBGNUww5Jk9DnfZYfA7 Dg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 37471vx18h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 11 Mar 2021 03:29:40 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 11 Mar
 2021 09:29:38 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 11 Mar 2021 09:29:38 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8665411CF;
 Thu, 11 Mar 2021 09:29:38 +0000 (UTC)
Date: Thu, 11 Mar 2021 09:29:38 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 05/10] ASoC: wm8958-dsp2: rename local 'control' arrays
Message-ID: <20210311092938.GM106851@ediswmail.ad.cirrus.com>
References: <20210311004332.120901-1-pierre-louis.bossart@linux.intel.com>
 <20210311004332.120901-6-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210311004332.120901-6-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 adultscore=0
 malwarescore=0 mlxlogscore=976 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103110050
Cc: tiwai@suse.de, patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 broonie@kernel.org
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

On Wed, Mar 10, 2021 at 06:43:27PM -0600, Pierre-Louis Bossart wrote:
> cppcheck complains about shadowed variables:
> 
> sound/soc/codecs/wm8958-dsp2.c:926:27: style: Local variable 'control'
> shadows outer variable [shadowVariable]
> 
>   struct snd_kcontrol_new control[] = {
>                           ^
> sound/soc/codecs/wm8958-dsp2.c:900:17: note: Shadowed declaration
>  struct wm8994 *control = wm8994->wm8994;
>                 ^
> sound/soc/codecs/wm8958-dsp2.c:926:27: note: Shadow variable
>   struct snd_kcontrol_new control[] = {
>                           ^
> sound/soc/codecs/wm8958-dsp2.c:952:27: style: Local variable 'control'
> shadows outer variable [shadowVariable]
>   struct snd_kcontrol_new control[] = {
>                           ^
> sound/soc/codecs/wm8958-dsp2.c:900:17: note: Shadowed declaration
>  struct wm8994 *control = wm8994->wm8994;
>                 ^
> sound/soc/codecs/wm8958-dsp2.c:952:27: note: Shadow variable
>   struct snd_kcontrol_new control[] = {
>                           ^
> sound/soc/codecs/wm8958-dsp2.c:978:27: style: Local variable 'control'
> shadows outer variable [shadowVariable]
>   struct snd_kcontrol_new control[] = {
>                           ^
> sound/soc/codecs/wm8958-dsp2.c:900:17: note: Shadowed declaration
>  struct wm8994 *control = wm8994->wm8994;
>                 ^
> sound/soc/codecs/wm8958-dsp2.c:978:27: note: Shadow variable
>   struct snd_kcontrol_new control[] = {
>                           ^
> sound/soc/codecs/wm8958-dsp2.c:1006:27: style: Local variable
> 'control' shadows outer variable [shadowVariable]
>   struct snd_kcontrol_new control[] = {
>                           ^
> sound/soc/codecs/wm8958-dsp2.c:900:17: note: Shadowed declaration
>  struct wm8994 *control = wm8994->wm8994;
>                 ^
> sound/soc/codecs/wm8958-dsp2.c:1006:27: note: Shadow variable
>   struct snd_kcontrol_new control[] = {
>                           ^
> 
> fix by adding a prefix related to each control.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
