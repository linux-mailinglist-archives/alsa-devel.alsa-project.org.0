Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEBD2DAE5
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2019 12:36:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC41016F8;
	Wed, 29 May 2019 12:35:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC41016F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559126192;
	bh=1wx1YWPH63wkKP7LTK0sQII5mkhdCqJRor65KEBTxZo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o4t2ayShxngvzk+jM+T89shO58cIkvFrslg/Fxw4xgHpjGfPcp1ze493MmUM1+8Re
	 8BdSXG3TdYsKbI14Krl81QkZIZeM1ykHp/b9NzUHJtoFpvjHL0cuJpRQ9s/4aM9zfx
	 toTma5sw2uiWpHNOo9/j8BYooxSbja515Dj3VPQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF104F896E8;
	Wed, 29 May 2019 12:34:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F19C2F896E4; Wed, 29 May 2019 12:34:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A80EF8065A
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 12:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A80EF8065A
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4TAY1f2012811; Wed, 29 May 2019 05:34:40 -0500
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
 by mx0b-001ae601.pphosted.com with ESMTP id 2sq24q4ksn-1;
 Wed, 29 May 2019 05:34:40 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
 by mail1.cirrus.com (Postfix) with ESMTP id 4EE38611C8B3;
 Wed, 29 May 2019 05:34:40 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 29 May
 2019 11:34:39 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Wed, 29 May 2019 11:34:39 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A83C845;
 Wed, 29 May 2019 11:34:39 +0100 (BST)
Date: Wed, 29 May 2019 11:34:39 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190529103439.GI28362@ediswmail.ad.cirrus.com>
References: <87woi9x4ho.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87woi9x4ho.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=910 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905290071
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Question about dapm setup
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, May 29, 2019 at 01:50:07PM +0900, Kuninori Morimoto wrote:
> 
> Hi ALSA ML
> 
> snd_soc_instantiate_card() setups dapm, but its timing seems
> very randomly for me.
> In my understanding, dapm setup timing is not so serious.
> So, I think we can do it in one place,
> but are there some reasons ?
> For example, "xxxx should be called after yyyy"
> 

There are certainly reasons for some of it, but might be easier
to explain what you are thinking of moving, rather than trying to
list all dependencies.

> 
> static int snd_soc_instantiate_card(struct snd_soc_card *card)
> {
> 	...
> 
> =>	snd_soc_dapm_debugfs_init(&card->dapm, card->debugfs_card_root);
> 
> 	...
> 
> 	if (card->dapm_widgets)
> 		snd_soc_dapm_new_controls(&card->dapm, card->dapm_widgets,
> 					  card->num_dapm_widgets);
> 
> 	if (card->of_dapm_widgets)
> 		snd_soc_dapm_new_controls(&card->dapm, card->of_dapm_widgets,
> 					  card->num_of_dapm_widgets);
> 
> 	...
> 
> 	snd_soc_dapm_link_dai_widgets(card);
> 	snd_soc_dapm_connect_dai_link_widgets(card);

For example we need the calls to snd_soc_dapm_new_controls to
be before these two so that the widgets exist for linking them.

> 
> 	if (card->controls)
> 		snd_soc_add_card_controls(card, card->controls,
> 					  card->num_controls);
> 

This needs to be before the routes are added so that the routes
can find their associated controls.

> 	if (card->dapm_routes)
> 		snd_soc_dapm_add_routes(&card->dapm, card->dapm_routes,
> 					card->num_dapm_routes);
> 
> 	if (card->of_dapm_routes)
> 		snd_soc_dapm_add_routes(&card->dapm, card->of_dapm_routes,
> 					card->num_of_dapm_routes);
> 	...

And the routes also obviously need to be after the widgets are
added as well.

> 
> 	snd_soc_dapm_new_widgets(card);
> 
> 	...
> 
> 	dapm_mark_endpoints_dirty(card);
> 	snd_soc_dapm_sync(&card->dapm);
> 	...
> }
> 
> 

Hope that is roughly the sort of thing you were interested in.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
