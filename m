Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A10114F1F
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Dec 2019 11:36:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BA7B1673;
	Fri,  6 Dec 2019 11:36:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BA7B1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575628614;
	bh=WlHqqJNOx45R3lGpShimml5DKklHX1EQz3t+2scix04=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ApnxOydA34buvzdZwL29HTfrinHfiU8/qRP3tPngQGn//hWrDrRuRP7fSAvg5QNOH
	 b8b4zmBKa++i/esKbssPQOTRsAal4EUlbBZeGA75pqgBYY+0xflHso+Ahk+kO9ozjU
	 7VjtTEkmBJeHZEDoQbtBBZcd32DnFRRqvJw6GdpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78F54F80214;
	Fri,  6 Dec 2019 11:35:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8C64F801EC; Fri,  6 Dec 2019 11:35:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB3FAF80108
 for <alsa-devel@alsa-project.org>; Fri,  6 Dec 2019 11:35:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB3FAF80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="JGYVJCRK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB6AXb4K012056; Fri, 6 Dec 2019 04:34:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=gODTI0lW1pdRgw8ARzPT2hG/hZAyqOBktg59aJ0itXo=;
 b=JGYVJCRKfWlj4U1CRVRaNLheVAXMN0UpKhO5wWhF1OVVjzTtLapt6rXwRwuiQLvvWYOq
 ZqzmENVuZie+QlP8jdkmkcrlsA5R9SKs49XH+Ko7CyKJQ0JfsWo9Lf6QfsVFpyHjcb+2
 6dZ7LTkDPM7fgSDWDvPQnpMd7Wg9c710J3WXJXOceQJ/k9+wC+s++QSfLq0h7Hn/IrwK
 Y4Su51rR09YwwUzh7HxBBZDkJOSz8vCukobzSho6xbRMQq5jOvWbaK3GncRrWTZHS/Ez
 Sjll2JKiW8K73nM/LPN0bGnhFRucaro9iU4jq//KRCfM034+IKggAlYHpq8vvia8JsBW hQ== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([5.172.152.52])
 by mx0b-001ae601.pphosted.com with ESMTP id 2wqmq101fa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 06 Dec 2019 04:34:57 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 6 Dec
 2019 10:34:53 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Fri, 6 Dec 2019 10:34:53 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D991F2D1;
 Fri,  6 Dec 2019 10:34:53 +0000 (UTC)
Date: Fri, 6 Dec 2019 10:34:53 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Chuhong Yuan <hslester96@gmail.com>
Message-ID: <20191206103453.GC10451@ediswmail.ad.cirrus.com>
References: <20191206075300.18182-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191206075300.18182-1-hslester96@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0
 suspectscore=2 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 mlxlogscore=977 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912060091
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: wm5100: add missed
	regulator_bulk_disable
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

On Fri, Dec 06, 2019 at 03:53:00PM +0800, Chuhong Yuan wrote:
> The driver forgets to call regulator_bulk_disable() in remove like that
> in probe failure.
> Add the missed call to fix it.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  sound/soc/codecs/wm5100.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
> index 91cc63c5a51f..d985b2061169 100644
> --- a/sound/soc/codecs/wm5100.c
> +++ b/sound/soc/codecs/wm5100.c
> @@ -2653,6 +2653,8 @@ static int wm5100_i2c_remove(struct i2c_client *i2c)
>  		gpio_set_value_cansleep(wm5100->pdata.ldo_ena, 0);
>  		gpio_free(wm5100->pdata.ldo_ena);
>  	}
> +	regulator_bulk_disable(ARRAY_SIZE(wm5100->core_supplies),
> +			       wm5100->core_supplies);
>  

This is a bit trickier than this since these regulators are being
controlled by PM runtime, and it doesn't necessarily leave things
in an enabled state when it is disabled.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
