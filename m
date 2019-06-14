Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0369345A5C
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 12:27:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 816B71865;
	Fri, 14 Jun 2019 12:26:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 816B71865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560508021;
	bh=Ln0AlCnRcoeWIAX0GMwp3k/bX4olw2OTSb83ZJtdNqE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OCmst78HtucFgcD5qFPzR2NIj2jpaGuZ62whyU5+2r+pc+MmgBvp3gWAVzCVL9myK
	 fdnX8CjDttj8WLmetYnEx162JFW0QdH/6+AxaRtKtfTrxOWgISLVovFgb/Ltjtn0Kz
	 5Xpm2tNePbmRbbC8Oi9oo7kdAKXTgh6ecvTpGgK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4EADF89728;
	Fri, 14 Jun 2019 12:24:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 879E7F89717; Fri, 14 Jun 2019 12:24:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE755F896EA
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 12:24:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE755F896EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="btknUZos"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5EAONNV022074; Fri, 14 Jun 2019 05:24:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=m9IUtCvcQ8JcWzDh5m7QU8ffEnFJYlH4SZ1yqAxCaDk=;
 b=btknUZosmkEroC3yVUFvZj6bB69vBm9fPkzFIcb8SEn0G+QhcqAlo/07nh5m3u91OwMa
 AaFR0snxXXGB/ZAMoUypjKfkHTEujkyPwSvk1uukOKnwvCGMvSupi0gP0wWfzcJcqpav
 8r69jX1UToGXdWOf/F/Y+3IqnQYdVyeK0zBQXiVA4N4rtezu9DpcwIJzESDR/zXtSYSu
 b2UsqX2/5nO2Z5BqzLkkHW7zdRzles01QuhymcvEo/mSIag7DnDe7+z/IadjFzS8mmfB
 G76o3iHQnbPxUO6nvEFTEH36qmoUNSHtoQaNtWrY51/UG5cUI/5Cj+12xjyTwl5crD2w 3A== 
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=rf@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
 by mx0b-001ae601.pphosted.com with ESMTP id 2t09ep8x1w-1;
 Fri, 14 Jun 2019 05:24:39 -0500
Received: from EDIEX02.ad.cirrus.com (ediex02.ad.cirrus.com [198.61.84.81])
 by mail4.cirrus.com (Postfix) with ESMTP id C9480611C8AC;
 Fri, 14 Jun 2019 05:24:50 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 14 Jun
 2019 11:24:39 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Fri, 14 Jun 2019 11:24:39 +0100
Received: from [198.90.251.101] (edi-sw-dsktp006.ad.cirrus.com
 [198.90.251.101])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2AB122A1;
 Fri, 14 Jun 2019 11:24:39 +0100 (BST)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20190614094756.2965-1-gregkh@linuxfoundation.org>
 <20190614094756.2965-3-gregkh@linuxfoundation.org>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <acbebcc1-810a-c16e-0413-84bb1c5417ca@opensource.cirrus.com>
Date: Fri, 14 Jun 2019 11:24:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190614094756.2965-3-gregkh@linuxfoundation.org>
Content-Language: en-US
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906140087
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [PATCH 3/5] sound: soc: codecs: wm_adsp: no need
 to check return value of debugfs_create functions
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 14/06/19 10:47, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
> 
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: <patches@opensource.cirrus.com>
> Cc: <alsa-devel@alsa-project.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>   sound/soc/codecs/wm_adsp.c | 37 +++++++------------------------------
>   1 file changed, 7 insertions(+), 30 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
> index b26e6b825a90..8f301cb07745 100644
> --- a/sound/soc/codecs/wm_adsp.c
> +++ b/sound/soc/codecs/wm_adsp.c
> @@ -731,41 +731,18 @@ static void wm_adsp2_init_debugfs(struct wm_adsp *dsp,
>   	struct dentry *root = NULL;
>   	int i;
>   
> -	if (!component->debugfs_root) {
> -		adsp_err(dsp, "No codec debugfs root\n");
> -		goto err;
> -	}
> -
>   	root = debugfs_create_dir(dsp->name, component->debugfs_root);
>   
> -	if (!root)
> -		goto err;
> -
> -	if (!debugfs_create_bool("booted", 0444, root, &dsp->booted))
> -		goto err;
> +	debugfs_create_bool("booted", 0444, root, &dsp->booted);
> +	debugfs_create_bool("running", 0444, root, &dsp->running);
> +	debugfs_create_x32("fw_id", 0444, root, &dsp->fw_id);
> +	debugfs_create_x32("fw_version", 0444, root, &dsp->fw_id_version);
>   
> -	if (!debugfs_create_bool("running", 0444, root, &dsp->running))
> -		goto err;
> -
> -	if (!debugfs_create_x32("fw_id", 0444, root, &dsp->fw_id))
> -		goto err;
> -
> -	if (!debugfs_create_x32("fw_version", 0444, root, &dsp->fw_id_version))
> -		goto err;
> -
> -	for (i = 0; i < ARRAY_SIZE(wm_adsp_debugfs_fops); ++i) {
> -		if (!debugfs_create_file(wm_adsp_debugfs_fops[i].name,
> -					 0444, root, dsp,
> -					 &wm_adsp_debugfs_fops[i].fops))
> -			goto err;
> -	}
> +	for (i = 0; i < ARRAY_SIZE(wm_adsp_debugfs_fops); ++i)
> +		debugfs_create_file(wm_adsp_debugfs_fops[i].name, 0444, root,
> +				    dsp, &wm_adsp_debugfs_fops[i].fops);
>   
>   	dsp->debugfs_root = root;
> -	return;
> -
> -err:
> -	debugfs_remove_recursive(root);
> -	adsp_err(dsp, "Failed to create debugfs\n");
>   }
>   
>   static void wm_adsp2_cleanup_debugfs(struct wm_adsp *dsp)
> 

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
