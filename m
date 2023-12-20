Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A632181A018
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Dec 2023 14:44:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73862843;
	Wed, 20 Dec 2023 14:44:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73862843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703079891;
	bh=j4ElhWgH0hZN15uFb82O96zyDTJksQQJGuX5n4xQ5CQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sgwwGTpSH+ywBbZoZtfL9eteOLGn9qKFFioraqjHYB5Ui6M7naFrrpoG94/Bs6DM9
	 h+xmSrhHuoRCvDfZ6vmR3QH7WWeNdSLq4EHP4FXRkhfYRZp3pZ11c7tAZmJ5tkgp49
	 k+fSBioOLo2zrdbzyyoDSf0rkc3VN9EketGg6xsY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F00D4F8057A; Wed, 20 Dec 2023 14:44:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13D01F8057A;
	Wed, 20 Dec 2023 14:44:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72328F80425; Wed, 20 Dec 2023 14:44:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99E44F8016E
	for <alsa-devel@alsa-project.org>; Wed, 20 Dec 2023 14:44:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99E44F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=SdJP7RPx
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BK4mAWI007661;
	Wed, 20 Dec 2023 07:43:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=/1zZp2T9SCFVazsLTZinSc7wiio2ryvn9pz9Ao5CZIk=; b=
	SdJP7RPx++fX2gXunIkfrGpeRB5yYQvNPlnmBsR3OZbwZaaZB0W8jk7NfWP6xjot
	sGxggMbl2iH+awYK9e65qce9hLPSt4Y5AHzUMNGTbelM9UNxufqS9M0PskshJ3eX
	kvc/hqo+iX1wuwD67vAw1mrszNJqf8TVwoYHahTr4kiUJkHVQ0b5BYfIx/t9rVD2
	ZeaFetYIoxVJS7d/vrCX1qoMzrPUB7qJX9eZYbHGldbbr0QrrSVo2X3//nTrp8rK
	7RKH9zeDBMDs/L6DP2K8Cww2Z0d8nMm0w5Zy+cXgIXk/AbMqLo+0NhLrXJW/Hd/V
	c0PQToEqTEmq/fUHVodlcQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3v1a625fta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Dec 2023 07:43:58 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 20 Dec
 2023 13:43:56 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Wed, 20 Dec 2023 13:43:56 +0000
Received: from [198.61.64.132] (LONN2DGDQ73.ad.cirrus.com [198.61.64.132])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2E5FD468;
	Wed, 20 Dec 2023 13:43:56 +0000 (UTC)
Message-ID: <8170413d-07a8-4e77-b43d-78cd9e4ea76f@opensource.cirrus.com>
Date: Wed, 20 Dec 2023 13:43:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ALSA: hda: cs35l41: Safety-guard against capped
 SPI speed
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, <tiwai@suse.de>
CC: <alsa-devel@alsa-project.org>, <david.rhodes@cirrus.com>,
        <james.schulman@cirrus.com>, <josbeir@gmail.com>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <perex@perex.cz>, <stuarth@opensource.cirrus.com>, <tiwai@suse.com>
References: <87ttokpyws.wl-tiwai@suse.de>
 <20231220073809.22027-1-alex.vinarskis@gmail.com>
 <20231220073809.22027-2-alex.vinarskis@gmail.com>
Content-Language: en-GB
From: Stefan Binding <sbinding@opensource.cirrus.com>
In-Reply-To: <20231220073809.22027-2-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fHR91hkR7HjeDRkq3aT_8gm0mahY-tp6
X-Proofpoint-ORIG-GUID: fHR91hkR7HjeDRkq3aT_8gm0mahY-tp6
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: W5ONRJL6MAF7CCLYKN36PKYSZ63D7JKZ
X-Message-ID-Hash: W5ONRJL6MAF7CCLYKN36PKYSZ63D7JKZ
X-MailFrom: prvs=7718def8b8=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W5ONRJL6MAF7CCLYKN36PKYSZ63D7JKZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 20/12/2023 07:38, Aleksandrs Vinarskis wrote:
> Some devices with intel-lpss based SPI controllers may have misconfigured
> clock divider due to firmware bug. This would result in capped SPI speeds,
> which leads to longer DSP firmware loading times.
> This safety guards against possible hangs during wake-up by not
> initializing the device if lpss was not patched/fixed UEFI was not
> installed
>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>   sound/pci/hda/cs35l41_hda_property.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
> index c9eb70290973..cb305b093311 100644
> --- a/sound/pci/hda/cs35l41_hda_property.c
> +++ b/sound/pci/hda/cs35l41_hda_property.c
> @@ -210,6 +210,19 @@ static int generic_dsd_config(struct cs35l41_hda *cs35l41, struct device *physde
>   
>   	if (cfg->bus == SPI) {
>   		cs35l41->index = id;
> +		/*
> +		 * Some devices with intel-lpss based SPI controllers may have misconfigured
> +		 * clock divider due to firmware bug. This would result in capped SPI speeds,
> +		 * which leads to longer DSP firmware loading times.
> +		 * Avoid initializing device if lpss was not patched/fixed UEFI was not installed
> +		 */
> +		spi = to_spi_device(cs35l41->dev);
> +		if (spi->max_speed_hz < CS35L41_SPI_MAX_FREQ/2) {
> +			dev_err(cs35l41->dev,
> +				"SPI's max_speed_hz is capped at %u Hz, will not continue to avoid hanging\n",
> +				spi->max_speed_hz);
> +			return -EINVAL;
> +		}

Not sure I agree with completely disabling the CS35L41 Speaker Driver if 
the SPI speed is low (for laptops without _DSD).
With a slow speed the driver does not hang - it just takes a long time 
(~80s per amp) to load the firmware.
Instead I would prefer that we instead disable the loading of the 
firmware in this case.
Without loading firmware, the volume is much lower, but at least you 
still have audio.
I have a patch to do that, which I was planning on pushing up 
(hopefully) today.

Thanks,

Stefan

>   		/*
>   		 * Manually set the Chip Select for the second amp <cs_gpio_index> in the node.
>   		 * This is only supported for systems with 2 amps, since we cannot expand the
> @@ -219,8 +232,6 @@ static int generic_dsd_config(struct cs35l41_hda *cs35l41, struct device *physde
>   		 * first.
>   		 */
>   		if (cfg->cs_gpio_index >= 0) {
> -			spi = to_spi_device(cs35l41->dev);
> -
>   			if (cfg->num_amps != 2) {
>   				dev_warn(cs35l41->dev,
>   					 "Cannot update SPI CS, Number of Amps (%d) != 2\n",
