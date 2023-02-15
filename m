Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0F0697E20
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 15:12:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F97184C;
	Wed, 15 Feb 2023 15:11:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F97184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676470329;
	bh=3KXA7Q8dXCFWly42F+h0eMF9IX+Kz+Sz4VIIjU3HpbQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CqZE/+U1cqyBFZdAVEIpH5OgopWp7XGCnYpxnLGhw/w+fcHho94ExdT4+ny/jDAoB
	 JWnwFP202rLjbOw1vedlhuL+T9DxDEyuDu1ibggeKqQiWhpwLoJEMrYJetAB2wBtcT
	 nvbJB+bBIwnB4J76YklLV25KUbThhIgstX0tYvpI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5332F804B0;
	Wed, 15 Feb 2023 15:11:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BE0EF804B2; Wed, 15 Feb 2023 15:11:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9B08F80083
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 15:11:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9B08F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=eUBpXj5a
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31F5OBjw028232;
	Wed, 15 Feb 2023 08:11:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=JO2Wghy+/B2i4HG4R9M/qPIE2gTTg72OCq7HCmwWerY=;
 b=eUBpXj5a460A4gs7PmawWZhbSgLKXIcCD2Zria2TPxYLbTnR72yIIpYG5ZUHxebD6lVF
 uX09uqoEMINGW1NtLJgYmXPSeX0cDNsz4WkdlcNRjr3ZwqfWqHp9mhd333v7bIEPrNqr
 efHBWwDrhFd5wmm/XcDu5JJqt+IOEF/0lm+gyE6Eq5ijbdv9OZMxUw1+iredGXPH9mz1
 oNSn5K7KmPyDpT/c+boaqkVcSanZM2fJ3wcX8chqEq5pMYCVd/89ZdeHZKW/LWftKXET
 +UD+aRoiXHwUW0SiMNWDHE1IqBFxtsEqXCHmJhEGXg5+OUhW9hmBiymXvb0eJgwF4p1G 6w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3np9a75as2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 08:11:05 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Wed, 15 Feb
 2023 08:11:03 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.21 via Frontend Transport; Wed, 15 Feb 2023 08:11:03 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EFE9611A8;
	Wed, 15 Feb 2023 14:11:02 +0000 (UTC)
Date: Wed, 15 Feb 2023 14:11:02 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lucas Tanure <lucas.tanure@collabora.com>
Subject: Re: [PATCH v2] ASoC: soc-dapm.h: fixup warning struct
 snd_pcm_substream not declared
Message-ID: <20230215141102.GK68926@ediswmail.ad.cirrus.com>
References: <20230215132851.1626881-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230215132851.1626881-1-lucas.tanure@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: OQd2qvMT58_Angtooa0v4dYuDy0l_OOc
X-Proofpoint-ORIG-GUID: OQd2qvMT58_Angtooa0v4dYuDy0l_OOc
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: D34CD2GAKZEBRKP6FD5A3XQ2W3GVZUI5
X-Message-ID-Hash: D34CD2GAKZEBRKP6FD5A3XQ2W3GVZUI5
X-MailFrom: prvs=74104ead9d=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D34CD2GAKZEBRKP6FD5A3XQ2W3GVZUI5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Feb 15, 2023 at 01:28:51PM +0000, Lucas Tanure wrote:
> Add struct snd_pcm_substream forward declaration
> 
> Fixes: 078a85f2806f ("ASoC: dapm: Only power up active channels from a DAI")
> Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
