Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A23C06ADD66
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 12:31:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B336B1422;
	Tue,  7 Mar 2023 12:30:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B336B1422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678188687;
	bh=l9dwd2u143LYMCn/dqXT6AR5U8CYTFdijWmuNWjriSc=;
	h=Date:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=MZ8CWsb2k3aKsBQ6pg8DC+XecyRx3hRwmYSpKHKgrJKqcRy47AxCEK6Z6HE3MciYZ
	 I0yJnEm3/b9A8hflyo0kxiE7mKt7qek7Shl+NlmscyXMKAliVrrcSIQwpQ8OOeMND9
	 Jdn2VNR3MyI+E8gLfnkC60Dx+jokqna4v8Jp1zpo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED1B0F8042F;
	Tue,  7 Mar 2023 12:30:36 +0100 (CET)
Date: Tue, 7 Mar 2023 11:30:16 +0000
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH] ASoC: do not include pm_runtime.h if not used
References: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
In-Reply-To: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3GF3XDMGTDLY4IZFQJWTALLYZ67D4B5E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167818863631.26.6699494131684260973@mailman-core.alsa-project.org>
From: Charles Keepax via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com,
 oder_chiou@realtek.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, linux-imx@nxp.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 matthias.bgg@gmail.com, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 vkoul@kernel.org, daniel.baluta@nxp.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, jarkko.nikula@bitmer.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, sound-open-firmware@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A81E3F8042F; Tue,  7 Mar 2023 12:30:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C79E1F800C9;
	Tue,  7 Mar 2023 12:30:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C79E1F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=RLWayBHY
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3277tv94022730;
	Tue, 7 Mar 2023 05:30:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=8Gw+hMjGj1I9H2fg3ljNbnH8D9RaMuxw0VHL6fBZJv4=;
 b=RLWayBHYAC3WRv9HPpNTERg+r3oTqRoc1PhTaiH7YBIi+g27pmBKE71aOiAvS27S3N07
 +QHcy5hOfjEbFGHVcXXvt9qIN3WGOS3Bqlri7NiCAQhOhMOgUcVD/jtynzPS4OAO8V4x
 y0soTVGFyQ8h0rjtQN8pahOoaJaEwQF+b1XRYG7PlC2fH/BI33BVKPohDXEuq+sfwinQ
 st9ocuKEdqcae/7gnnLT1gkEC3NHxNf2+QnaoIAl+yku5tDVskg+wvMD2woy7I197Y8b
 atlA+qMh5usVUKVHiqBqRp3egA8oAV2JdrRPRQRVEwGGY4zU2uz2Qv/12AeFgHJufFHL 1A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3p4497427y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Mar 2023 05:30:19 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Tue, 7 Mar
 2023 05:30:16 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 7 Mar 2023 05:30:16 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C72ED11D3;
	Tue,  7 Mar 2023 11:30:16 +0000 (UTC)
Date: Tue, 7 Mar 2023 11:30:16 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH] ASoC: do not include pm_runtime.h if not used
Message-ID: <20230307113016.GS68926@ediswmail.ad.cirrus.com>
References: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 8AhJH_Etb0kWl8-U4QDOKiyr044l28y7
X-Proofpoint-ORIG-GUID: 8AhJH_Etb0kWl8-U4QDOKiyr044l28y7
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3GF3XDMGTDLY4IZFQJWTALLYZ67D4B5E
X-Message-ID-Hash: 3GF3XDMGTDLY4IZFQJWTALLYZ67D4B5E
X-MailFrom: prvs=8430349259=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com,
 oder_chiou@realtek.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, linux-imx@nxp.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 matthias.bgg@gmail.com, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 vkoul@kernel.org, daniel.baluta@nxp.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, jarkko.nikula@bitmer.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, sound-open-firmware@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3GF3XDMGTDLY4IZFQJWTALLYZ67D4B5E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 07, 2023 at 12:30:22PM +0200, Claudiu Beznea wrote:
> Do not include pm_runtime.h header in files where runtime PM support is
> not implemented.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  sound/soc/codecs/cs35l45.h                                | 1 -
> diff --git a/sound/soc/codecs/cs35l45.h b/sound/soc/codecs/cs35l45.h
> index 53fe9d2b7b15..0555702eac03 100644
> --- a/sound/soc/codecs/cs35l45.h
> +++ b/sound/soc/codecs/cs35l45.h
> @@ -11,7 +11,6 @@
>  #ifndef CS35L45_H
>  #define CS35L45_H
>  
> -#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  

cs35l45 does already make use of some functions from that header,
and more support is in the process of being upstreamed. So this
part should be dropped.

Thanks,
Charles
