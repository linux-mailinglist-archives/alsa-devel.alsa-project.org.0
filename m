Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDBC2FEAF
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 16:58:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94EE81612;
	Thu, 30 May 2019 16:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94EE81612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559228288;
	bh=wojVYtolnmcDTzZ0JeYrOv/Gz0oj6SsxzEeou4aRNEE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ObFXbH71Gxrdw+KLBMJu0lQTA+tZNXqExXfYLsLTVKTSYlotYDsda3hnAuhzSvOkL
	 0gFaYb/swNjpNQ0Vwqw611PChtUg003Z8ZF+u2wOxulSBpqNg5Ir/oVQRHA4gv4Wmx
	 n9L6EyFWfnlofpJuj7LbFCD+o1m8WbrtWrgQWeNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C957F89706;
	Thu, 30 May 2019 16:56:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E465EF896F8; Thu, 30 May 2019 16:56:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C9ABF8072E
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 16:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C9ABF8072E
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4UEnlnl015082; Thu, 30 May 2019 09:56:15 -0500
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
 by mx0b-001ae601.pphosted.com with ESMTP id 2sq24q6b6t-1;
 Thu, 30 May 2019 09:56:14 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
 by mail1.cirrus.com (Postfix) with ESMTP id 562BE611E122;
 Thu, 30 May 2019 09:56:14 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 30 May
 2019 15:56:13 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 30 May 2019 15:56:13 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B292D44;
 Thu, 30 May 2019 15:56:13 +0100 (BST)
Date: Thu, 30 May 2019 15:56:13 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190530145613.GJ28362@ediswmail.ad.cirrus.com>
References: <87woi9x4ho.wl-kuninori.morimoto.gx@renesas.com>
 <20190529103439.GI28362@ediswmail.ad.cirrus.com>
 <87zhn4g6g3.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zhn4g6g3.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905300106
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

On Thu, May 30, 2019 at 09:12:10AM +0900, Kuninori Morimoto wrote:
> But, it was my fault, the question was not clear.
> I wanted to know was that there are many non dapm functions
> are called between dapm setup.
> pseudo code is..
> 
> It looks very random. So my original question was
> can we do like this (with keeping dapm order)?
> 

Ah ok I see, sorry I understand now.

> 	static int snd_soc_instantiate_card(struct snd_soc_card *card)
> 	{
> 
> =>		snd_soc_dapm_debugfs_init()
> =>		snd_soc_dapm_new_controls(...)
> =>		snd_soc_dapm_link_dai_widgets()
> =>		snd_soc_dapm_connect_dai_link_widgets()
> =>		snd_soc_add_card_controls()
> =>		snd_soc_dapm_add_routes()
> =>		snd_soc_dapm_new_widgets()
> =>		dapm_mark_endpoints_dirty()
> =>		snd_soc_dapm_sync()
> 
> 		card->probe(..)
> 		soc_probe_link_components(...)
> 		soc_probe_aux_device(...)
> 		soc_bind_dai_link(...)
> 		soc_probe_link_dais
> 		snprintf(...)
> 		card->late_probe()
> 		snd_card_register()
> 
> =>		/* or dapm setup here instead ? */
> 	}
> 
> For example, snd_soc_dapm_xxx() should be called before/after
> card->probe() etc, etc...
> 

There are definitely some dependencies for example component probes
will add widgets, controls and routes from those components so
those will need to be done before the card level routes are
added. The card level routes may link to widgets on individual
components.

Also the DAPM sync definitely needs to be after everything has
been setup.

I wouldn't be surprised if there are others as well, things like
creating the DAI link widgets are probably done through some
of these helpers and probably need to be at certain points in the
process.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
