Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B297932223
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2024 10:44:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50C65857;
	Tue, 16 Jul 2024 10:44:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50C65857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721119450;
	bh=+cb+A396TX01g/+krPAkegLsduwSJBAoVPNUU5Z37no=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S4IJc1AqZAQynuzGE3koBrlkKPzRnpb3jgHUG+6d3shDIwpjm298MjbMQBnWzrGlm
	 CLnQl0rxp03lQ3rn3TNWHyE4PRhTCdA5IFYu94iZHw36/xx26V60R3l+2M+0kIdsYG
	 3Da6Y1J3LV79oAJoAOCvw0ETiTpMvICHy+ZyUbUM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF216F805B5; Tue, 16 Jul 2024 10:43:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BC8DF805A1;
	Tue, 16 Jul 2024 10:43:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1BAAF8026D; Tue, 16 Jul 2024 10:39:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 982A4F800C1
	for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2024 10:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 982A4F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Gq2vRck/
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46G4hlA9004722;
	Tue, 16 Jul 2024 03:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ITk2kB8sB5irsmZZA3IWAt7qcuvh9CDhBEbjd9TVeBs=; b=
	Gq2vRck/Wc9wYqV7eTMmO+E3SpDVljLtpleVSPMImSgY/I4HhEASKihLW6QwD+Nd
	ai2OI5iikP0hq+P/pZhfPZeXSVdiZsd4hX0wJb5oJqtuBEWkZgbOBQhDF51yuHSD
	38F8jxO8C9qhjXkV98aoqcvc4A6/jeg7ODvo1Lnrf43li7FU7Ve0/Pn/JuV6+p/v
	QgqU7V+zuOg6Y3fZxlKCcc4FBUIRHgPz7sJYCWTv78J/HAQpwN5eUyN3ZhCgveRb
	4LlEo4Jw33TFDt+R0yjeRT0y/u/E3v+j6sGJut4o0lRd2gCRtiJL65VAhL8sjfoI
	5K0iptwj7xZ0F900KuvvGQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 40bp0jjrcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 03:39:49 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Jul
 2024 09:39:47 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 16 Jul 2024 09:39:47 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 4258D820244;
	Tue, 16 Jul 2024 08:39:47 +0000 (UTC)
Message-ID: <f551bffd-43f1-4162-9eaa-aac64ab227d0@opensource.cirrus.com>
Date: Tue, 16 Jul 2024 09:39:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs42l42: Convert comma to semicolon
To: Chen Ni <nichen@iscas.ac.cn>, <david.rhodes@cirrus.com>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <pierre-louis.bossart@linux.intel.com>,
        <sbinding@opensource.cirrus.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240716025307.400156-1-nichen@iscas.ac.cn>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20240716025307.400156-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OGq9hTF291lQclwBhHxKYphq6Eq1Plre
X-Proofpoint-ORIG-GUID: OGq9hTF291lQclwBhHxKYphq6Eq1Plre
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZIBIQANNO6UWJZTGOFQH3TPOBFW722R7
X-Message-ID-Hash: ZIBIQANNO6UWJZTGOFQH3TPOBFW722R7
X-MailFrom: prvs=49271bd683=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZIBIQANNO6UWJZTGOFQH3TPOBFW722R7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/07/2024 03:53, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Fixes: 90f6a2a20bd2 ("ASoC: cs42l42: Add SoundWire support")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>   sound/soc/codecs/cs42l42-sdw.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs42l42-sdw.c b/sound/soc/codecs/cs42l42-sdw.c
> index 94a66a325303..29891c1f6bec 100644
> --- a/sound/soc/codecs/cs42l42-sdw.c
> +++ b/sound/soc/codecs/cs42l42-sdw.c
> @@ -323,15 +323,15 @@ static int cs42l42_sdw_read_prop(struct sdw_slave *peripheral)
>   	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
>   
>   	/* DP1 - capture */
> -	ports[0].num = CS42L42_SDW_CAPTURE_PORT,
> -	ports[0].type = SDW_DPN_FULL,
> -	ports[0].ch_prep_timeout = 10,
> +	ports[0].num = CS42L42_SDW_CAPTURE_PORT;
> +	ports[0].type = SDW_DPN_FULL;
> +	ports[0].ch_prep_timeout = 10;
>   	prop->src_dpn_prop = &ports[0];
>   
>   	/* DP2 - playback */
> -	ports[1].num = CS42L42_SDW_PLAYBACK_PORT,
> -	ports[1].type = SDW_DPN_FULL,
> -	ports[1].ch_prep_timeout = 10,
> +	ports[1].num = CS42L42_SDW_PLAYBACK_PORT;
> +	ports[1].type = SDW_DPN_FULL;
> +	ports[1].ch_prep_timeout = 10;
>   	prop->sink_dpn_prop = &ports[1];
>   
>   	return 0;
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
