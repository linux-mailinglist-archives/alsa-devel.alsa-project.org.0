Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B13613B58
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 17:32:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA5BA166E;
	Mon, 31 Oct 2022 17:31:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA5BA166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667233968;
	bh=Yxk389Oko1Xowes1bh+Yv0J9CRj5ruDQLPlvAn7GIx0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DMinapR5/U3k1yYqj6NVoeOYwoklWZMhnDRiLigCGb9bPQ/zLpimrWVU9hUC8vIQ+
	 RxN96p63ZBap2vyjjtewC0UMnVoIZuoCUjNSI0UcWMJSjgn4/xXBma115QhcX68ER3
	 ZDp/wFkvbl0g6gmsJyJyhASnMDJVLVg2Y0nARv8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AFE3F8021D;
	Mon, 31 Oct 2022 17:31:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48751F80163; Mon, 31 Oct 2022 17:31:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD54CF800CC
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 17:31:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD54CF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="RDQRg+uL"
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B27166028E6;
 Mon, 31 Oct 2022 16:31:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667233907;
 bh=Yxk389Oko1Xowes1bh+Yv0J9CRj5ruDQLPlvAn7GIx0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RDQRg+uLzerCB0xhQ8duM3SCEXldqat+qYPRNZopSXktpbUe0vtF9oI9hxhel3nJA
 gpwawB0OHHGf67bU1t/QTphq/HWLFQcZPYh3LkKXRq/RoxBDFNnhae5zOsZvssnX9x
 R+jTMMBoAKNFPnWH+eXL278CNIyjxJbCqNsnf7lSvkqGXwKcOh/ne/PZc9i2e6Hh00
 s2Xr96N0wHg4hgcVb40ACKjkMqqdzfDVhJBF5yi7w342CK8WSpHxIAjUIy50WJVjPr
 DaP56b50by9AHAQLLsBFKFf0bRfS8M0kuah0kCVLK4u9mayouc+HHRZ9y35LsiSSB7
 hxo6mAvqjLkUg==
Date: Mon, 31 Oct 2022 12:31:40 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 6/8] ASoC: rt5682: Support dbvdd and ldo1-in supplies
Message-ID: <20221031163140.h63kjpivwg7xpvs3@notapiano>
References: <20221028205540.3197304-1-nfraprado@collabora.com>
 <20221028205540.3197304-7-nfraprado@collabora.com>
 <Y1/JCN+mtlT0r/rw@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y1/JCN+mtlT0r/rw@sirena.org.uk>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Oct 31, 2022 at 01:09:28PM +0000, Mark Brown wrote:
> On Fri, Oct 28, 2022 at 04:55:38PM -0400, Nícolas F. R. A. Prado wrote:
> 
> > @@ -35,6 +35,8 @@ const char *rt5682_supply_names[RT5682_NUM_SUPPLIES] = {
> >  	"AVDD",
> >  	"MICVDD",
> >  	"VBAT",
> > +	"dbvdd",
> > +	"ldo1-in",
> 
> Why are we making these inconsistent in style with the other supplies?

In short because the other supplies already have users while these are new ones.
My understanding was that new supplies should have lowercase names, following DT
convention. But I do see the argument on having them all be consistent for a
single driver/binding. If there are no remarks from Rob or Krzysztof I can
change it in the next version.

Thanks,
Nícolas
