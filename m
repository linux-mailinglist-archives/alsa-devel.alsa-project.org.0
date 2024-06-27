Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC55791A896
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 16:03:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E49F211E;
	Thu, 27 Jun 2024 16:03:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E49F211E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719497033;
	bh=VIIcG860LvMdZdQC4jTXUBtt7N6YFumbDuN42dVo0UA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZpS6NID3n8V5h5S7fiSmqZmWK+cTLCsp1s4X491/jSR2gQmpJRM4AK3R+pYTZC7Md
	 wtE1sRN5RkSxRDnruijtk9uUOsPWun0TBljFMz35Rh4V6UMq1vBoMeK1Xuz23IrM/e
	 +9i+ehwlYlrFSducFlC85yI6Wya8cFGfChAnP5Q0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03AEEF805BB; Thu, 27 Jun 2024 16:03:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62A79F805AF;
	Thu, 27 Jun 2024 16:03:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBED5F80423; Thu, 27 Jun 2024 16:03:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71826F800ED
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 16:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71826F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=oKl3SlYZ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45RCpZTu009358;
	Thu, 27 Jun 2024 09:02:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=lMs6K/mOZoAmxBnac3
	zApgu94aKMO+ZYtHM+yXOxYRI=; b=oKl3SlYZ6ylYeUwgPnAG6t8qBluy4Jns/9
	gRquDAuebt2TnZNPsEgy0URE1IttNTaTfLwT56lAImydFO0ghopqkCZSrRzuHZ3V
	ET9PSpiJVpa2ME82LTDPSHPijYAcBZzDgUo6QcB1ogTOLeoe5XPzlvQEAkh/534N
	ry7BNgUJbrwo94TXH6jgcVe6RV/niR54KsDP/FsqxODsKzc5iIJg1JavudSxl0Y9
	cZwfvVJumMCmYNczBRoKyPhvCs41CytZTlDO9ijqnyizMYFNahhxEJVYqlkXwTJ9
	cFycCBGaW5QzgkuJxlflll/HMCy8so3VZVGtvmGt695pS88oLifQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 400nbds72v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 09:02:55 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 15:02:53 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 27 Jun 2024 15:02:53 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 876EB820270;
	Thu, 27 Jun 2024 14:02:53 +0000 (UTC)
Date: Thu, 27 Jun 2024 15:02:52 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>
Subject: Re: [PATCH alsa-ucm-conf v2 2/2] sof-soundwire: Add support for
 cs42l43/cs35l56 bridge configuration
Message-ID: <Zn1xDAXt8F7+/wX6@opensource.cirrus.com>
References: <20240624153719.1053093-1-ckeepax@opensource.cirrus.com>
 <20240624153719.1053093-2-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240624153719.1053093-2-ckeepax@opensource.cirrus.com>
X-Proofpoint-ORIG-GUID: XY2wgcVYkKg5ylulKyIqH6ERLFB1H9Wh
X-Proofpoint-GUID: XY2wgcVYkKg5ylulKyIqH6ERLFB1H9Wh
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: JFUWDM74KBTBNRSWOX7A4DEEL5HY46WG
X-Message-ID-Hash: JFUWDM74KBTBNRSWOX7A4DEEL5HY46WG
X-MailFrom: prvs=39085b32b2=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JFUWDM74KBTBNRSWOX7A4DEEL5HY46WG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 24, 2024 at 04:37:19PM +0100, Charles Keepax wrote:
> The cs42l43 has both a SPI master and an I2S interface, in some
> configurations 2 cs35l56 amplifiers are connected to these to provide
> bass speakers whilst the cs42l43's internal speaker drivers are used for
> the tweeters. Add UCM configuration for this type of system.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> Changes since v1:
>  - Update control names to just "Speaker Switch/Volume"
> 
> Thanks,
> Charles
> 
>  ucm2/sof-soundwire/cs35l56-bridge.conf | 61 ++++++++++++++++++++++++++
>  ucm2/sof-soundwire/sof-soundwire.conf  |  2 +-
>  2 files changed, 62 insertions(+), 1 deletion(-)
>  create mode 100644 ucm2/sof-soundwire/cs35l56-bridge.conf
> 
> diff --git a/ucm2/sof-soundwire/cs35l56-bridge.conf b/ucm2/sof-soundwire/cs35l56-bridge.conf
> new file mode 100644
> index 0000000..dcf5e5c
> --- /dev/null
> +++ b/ucm2/sof-soundwire/cs35l56-bridge.conf
> @@ -0,0 +1,61 @@
> +# Use case Configuration for sof-soundwire card
> +
> +LibraryConfig.remap.Config {
> +	ctl.default.map {
> +		"name='Speaker Switch'" {
> +			"name='AMPL Speaker Switch'".vindex.0 0
> +			"name='AMPR Speaker Switch'".vindex.1 0
> +		}
> +		"name='Speaker Volume'" {
> +			"name='AMPL Speaker Volume'".vindex.0 0
> +			"name='AMPR Speaker Volume'".vindex.1 0
> +		}
> +	}

Turns out there is an issue here. The machine driver already
creates a PIN_SWITCH control called Speaker Switch, so creating
these controls will fail. How would you feel about renaming them
back to something less generic?

Thanks,
Charles
