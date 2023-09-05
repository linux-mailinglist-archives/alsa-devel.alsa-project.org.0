Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E36F3792162
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 11:20:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA4B3825;
	Tue,  5 Sep 2023 11:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA4B3825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693905612;
	bh=WtGdgfu2i4YJu9h1a9Y/mMaVMIoLNjRUXdKHX/NzDhE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oy6pFgLEiITd91+TDb6NcC/PZ1rAJBsWgeEiZ8F/93eiwy78LtIIvT1Ihr6VwHGBV
	 G2YGqoI2NTKwUbnr9BqabDW9GZlJBBl6UsR1pmAI/woxEJGuG3bUHyz1ym2NRB9Guy
	 2bHTZ+t2NOT6acp0RPXSYFCYcsvub9eiwc1wr/7A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22D37F80551; Tue,  5 Sep 2023 11:19:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8DB9F800F5;
	Tue,  5 Sep 2023 11:19:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04C57F8047D; Tue,  5 Sep 2023 11:19:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E45BF800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 11:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E45BF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=hISa7PZh
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3858YFR6006187;
	Tue, 5 Sep 2023 04:19:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=kOfMXB5T5kAp/+Z
	hTB0EnsKb+TNVPnk4Dhyt9ZGf3ys=; b=hISa7PZhFiRgh8G136BpKiuXlk7ncLz
	BRYp2Z2rogGd8j0phgdK2a0yCiOC2OQY3f/zjD6nDE0WFhyMCmMi3+Uu7jSpQtIC
	UptygqaZusCZ80vMCOf1K8CIPYg1KJnT1PocWnwMWNHECnuVQhLnog9JRzgi2Kmn
	PVihMEnnk/I/YdkqLd3Ln863pFIz8WuVDyRT27QtA8YSQlhAjC5+8RC029J6nY41
	ZHX2O5c6RY5DABmpoSH4qGOicblXxsDCzHQ5IUeDhlJS4uS2XDwub6n3ub7bOvn2
	O8ydWjfpeWo3shQYomTGv3ONPfZ1Tj43rQ7LdEUPrhR6LqcwxjLcTnQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sv1fhtrke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 04:19:10 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 5 Sep
 2023 10:19:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Tue, 5 Sep 2023 10:19:09 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E24BD357D;
	Tue,  5 Sep 2023 09:19:08 +0000 (UTC)
Date: Tue, 5 Sep 2023 09:19:08 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <kernel@collabora.com>
Subject: Re: [PATCH 1/9] ASoC: cs35l41: Handle mdsync_down reg write errors
Message-ID: <20230905091908.GD103419@ediswmail.ad.cirrus.com>
References: <20230902210621.1184693-1-cristian.ciocaltea@collabora.com>
 <20230902210621.1184693-2-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230902210621.1184693-2-cristian.ciocaltea@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: V7XBfCy45kaA7Y_PFHQ6LcQNY5VKPnoM
X-Proofpoint-GUID: V7XBfCy45kaA7Y_PFHQ6LcQNY5VKPnoM
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: K3LWVWSSTVHF7DA2NDBWYCPBCI6OP2PV
X-Message-ID-Hash: K3LWVWSSTVHF7DA2NDBWYCPBCI6OP2PV
X-MailFrom: prvs=4612d7e67e=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K3LWVWSSTVHF7DA2NDBWYCPBCI6OP2PV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Sep 03, 2023 at 12:06:13AM +0300, Cristian Ciocaltea wrote:
> The return code of regmap_multi_reg_write() call related to "MDSYNC
> down" sequence is shadowed by the subsequent
> wait_for_completion_timeout() invocation, which is expected to time
> timeout in case the write operation failed.
> 
> Let cs35l41_global_enable() return the correct error code instead of
> -ETIMEDOUT.
> 
> Fixes: f5030564938b ("ALSA: cs35l41: Add shared boost feature")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  sound/soc/codecs/cs35l41-lib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
> index 4ec306cd2f47..a018f1d98428 100644
> --- a/sound/soc/codecs/cs35l41-lib.c
> +++ b/sound/soc/codecs/cs35l41-lib.c
> @@ -1243,7 +1243,7 @@ int cs35l41_global_enable(struct device *dev, struct regmap *regmap, enum cs35l4
>  		cs35l41_mdsync_down_seq[2].def = pwr_ctrl1;
>  		ret = regmap_multi_reg_write(regmap, cs35l41_mdsync_down_seq,
>  					     ARRAY_SIZE(cs35l41_mdsync_down_seq));
> -		if (!enable)
> +		if (ret || !enable)
>  			break;

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
