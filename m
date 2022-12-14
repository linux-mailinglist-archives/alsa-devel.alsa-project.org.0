Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9876164CB5E
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 14:32:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D8282301;
	Wed, 14 Dec 2022 14:31:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D8282301
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671024763;
	bh=Go7wSYFOk6gPsR/GZCNL1BzhPFL2gd+rSrYwfpeeL1Q=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=brN9oAxyfUIi3VXvy8Nx6eUYKluNZ4M097KOVKiaEHowhmi19CkkUCId6/b1LRkhY
	 P/GS+YYxcSx+txSaqYdmQ6jVcpxddM9ZdinFSu676ZIjJFZR5vcsSaScAeEuw1TEpg
	 oJh5orIlePVPKt7ZZG0dB1WSWf+R1IXbEqLkWZh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF7FFF804D0;
	Wed, 14 Dec 2022 14:31:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39827F80141; Wed, 14 Dec 2022 14:31:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BD5DF80141
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 14:31:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BD5DF80141
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Z/8I6l8E
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BEAosHJ030155; Wed, 14 Dec 2022 07:31:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=0ZmkgIHHH2z0Z3N58VJyuMPU40yJoMjSH3qtapRnbuE=;
 b=Z/8I6l8EL/lnWOsYK5CeeicPmqPN5go0y339LUCcw8HrJ6+Ka5Rjt0UXENYdilkwsAkG
 8+VUYXqOl7k/rsn24/SL6CqwIfWEhxG81w/cdFvB26fkj1Zv+S7Kp/X5kyEQ8529qVLe
 Ce615jIL9q5q2W6mMdrh3Cc8HKigIXI5l4x0+/It+cgdyDxF0j/w70ozNYfXqz1y5AAa
 UuIRpoNIDYay9MTPUW7u0InZ3b59hBkUjLKeDYK7hcukJxc11E7OQsXyRa0D6qsvAF5Y
 Et0uAUBNCk8yjsLFE9NMKQH0UQcvt8PkamwPwo1Tlg0UvrPKnt1BnO8dlvmY8Jybyh1k Cw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3mf6rh8e69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Dec 2022 07:31:37 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Wed, 14 Dec
 2022 07:31:36 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Wed, 14 Dec 2022 07:31:36 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3153E458;
 Wed, 14 Dec 2022 13:31:36 +0000 (UTC)
Date: Wed, 14 Dec 2022 13:31:36 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH 2/4] ASoC: wm8940: Rewrite code to set proper clocks
Message-ID: <20221214133136.GQ105268@ediswmail.ad.cirrus.com>
References: <20221214123743.3713843-1-lukma@denx.de>
 <20221214123743.3713843-3-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221214123743.3713843-3-lukma@denx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: ciLYuOB-zJb_vroAegOl3Jla7YXlKn3d
X-Proofpoint-GUID: ciLYuOB-zJb_vroAegOl3Jla7YXlKn3d
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
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Dec 14, 2022 at 01:37:41PM +0100, Lukasz Majewski wrote:
> Without this change, the wm8940 driver is not working when
> set_sysclk callback (wm8940_set_dai_sysclk) is called with
> frequency not listed in the switch clause.
> 
> This change adjusts this driver to allow non-standard frequency
> set (just after the boot) being adjusted afterwards by the sound
> system core code.
> 
> Moreover, support for internal wm8940's PLL is provided, so it
> can generate clocks when HOST system is not able to do it.
> 
> Code in this commit is based on previous change done for wm8974
> (SHA1: 51b2bb3f2568e6d9d81a001d38b8d70c2ba4af99).
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
>  	struct snd_soc_component *component = dai->component;
> +	struct wm8940_priv *priv = snd_soc_component_get_drvdata(component);
>  	u16 iface = snd_soc_component_read(component, WM8940_IFACE) & 0xFD9F;
>  	u16 addcntrl = snd_soc_component_read(component, WM8940_ADDCNTRL) & 0xFFF1;
>  	u16 companding =  snd_soc_component_read(component,
>  						WM8940_COMPANDINGCTL) & 0xFFDF;
>  	int ret;
>  
> +	priv->fs = params_rate(params);
> +	ret = wm8940_update_clocks(dai);
> +	if (ret)
> +		return ret;
> +

I think this all looks mostly good, my only slight concern would
be the interaction with the manual functions for settings the PLL
etc. I guess under this code, whatever manual settings were
configured will be overwritten with the new auto settings, I
think this should be fine as the PLL wants to be run in a pretty
narrow band anyway, so the settings are likely identical. Do you
have any thoughts?

Thanks,
Charles
