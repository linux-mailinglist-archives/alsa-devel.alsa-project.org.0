Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE36692D173
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2024 14:20:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3031614F;
	Wed, 10 Jul 2024 14:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3031614F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720614052;
	bh=WkU9BfW3pAExft9EM42LNfPQ5lLYTbNJeLEt6/5L3U4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IUWmCyAHynZuse77x5qAYmtgMtvKAd+f+CoevkGUhmrrPKMBgfWv0cPn74rBG7CLb
	 2UZE9IuL+uaxAhYj65g9eov28zViE7CzHD1BtPnTQAm9GydJBve/bOItb2WWaRE8BR
	 Otw9CgFSAkEnn7BmJsDpOESf/phA4ngerUHQ9HxE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71C13F805B6; Wed, 10 Jul 2024 14:20:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1DFBF8020D;
	Wed, 10 Jul 2024 14:20:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BFBCF801F5; Wed, 10 Jul 2024 14:20:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A012F8013D
	for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2024 14:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A012F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=keWugzRq
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46AAoWrX023331;
	Wed, 10 Jul 2024 07:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=/9T282nrPufNecAfzI
	OmDR/SirUSNMBN8IkI2jQajq8=; b=keWugzRqABpcqvjLfRq0KquBRyyQLj+Abe
	Q0bM+uZQbRXyDOcdE2dnnqo8S/fyVnibU84GgqiGFaW6DGTFQvtYLBTxmkFZkmlR
	W3FPjDhFplTu69eUqEBBIQujK6eiszOQ+trdmwr8HRw/JRYSYKp93sDZSrQh5GjP
	Yw+ZoA0f2kgG/RT/tNMAVTMx2on7+WqT699yhG5apNdnlSE/wYRyAeR5q7LAYB6t
	tOHwcpGUPk8SpOK6MHXbxTqB/ppTzB/Jm4sckhuY5ujpL+ebGuQuReMO8cqgtTCH
	82udK33OI3MBV0YfR9yavc0Ac1FLva9vRGJG1S4VT2fQow96Loxw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 409b72rpku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 07:20:06 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Jul
 2024 13:20:04 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 10 Jul 2024 13:20:04 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 47152820244;
	Wed, 10 Jul 2024 12:20:04 +0000 (UTC)
Date: Wed, 10 Jul 2024 13:20:03 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
CC: <broonie@kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] firmware: cs_dsp: Some small coding improvements
Message-ID: <Zo58c0J11bbAiEdO@opensource.cirrus.com>
References: <20240710103640.78197-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240710103640.78197-1-rf@opensource.cirrus.com>
X-Proofpoint-ORIG-GUID: EU7ANkoBC7lrXUyDenlwZoXswcwZ2qGS
X-Proofpoint-GUID: EU7ANkoBC7lrXUyDenlwZoXswcwZ2qGS
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: M3JHHVRSPGFNE3D5UZGYXFQZ74U7FWHM
X-Message-ID-Hash: M3JHHVRSPGFNE3D5UZGYXFQZ74U7FWHM
X-MailFrom: prvs=49211d85ea=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M3JHHVRSPGFNE3D5UZGYXFQZ74U7FWHM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 10, 2024 at 11:36:36AM +0100, Richard Fitzgerald wrote:
> Commit series that makes some small improvements to code and the
> kernel log messages.
> 
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
