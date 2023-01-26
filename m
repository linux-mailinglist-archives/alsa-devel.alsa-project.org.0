Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFA467CEAD
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 15:47:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A2A4ECE;
	Thu, 26 Jan 2023 15:46:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A2A4ECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674744469;
	bh=NFwY2BWIpL7kH9CM4E4HGuWFLWH3bgEikOO/eVjO/3A=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=uSQPzKMx+S1B3fAweRH6XCpWvcCPZDMCp7N3hgUFRynR+zx26A/HGaqNiP/8tty2z
	 J8ibCQGdgpceWjz041mLnUjrvuNUL7oGgP+rMO5av68LVSulbzzzPtkEtX4rsk1/4o
	 9C+dDa1IXEbGqY1WY2X4ejEVfJDtreJIGw4Y1qSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B2BAF802DF;
	Thu, 26 Jan 2023 15:46:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2054F8027D; Thu, 26 Jan 2023 15:46:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C26CF80224
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 15:46:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C26CF80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=P59Tw6WW
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30QEkccP016162; Thu, 26 Jan 2023 08:46:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=1it7hPA2inysBeJabD1ZO5LdTjzt22MjxOWqMTFDfuo=;
 b=P59Tw6WWZ+ii/DiKrvxex7CLWC6cDKRZngNrfSRCsi9dPxilFoRDHgEpcmV91n3ZnkPg
 fuHZ2b1ZBi+QQjwbFZ9myYTJ7dcIiSD4cQPmNYMoXnUzN65Jj1BuIO/2stRQwHd3t2/d
 bGIDx/skVahdUCCK3UDCVdV5zPgaVvk7InN55o5XOI+2afN/wWjWsVQxBOLeqJMrAunl
 MipSgCEp+fXjbNJt2f9Td9qnSoe7OHxt9XhteJldbtUhFgio55Inm3s24LH67Bb4Kp1I
 oDSyIimNSmJ1SmsnGMxYCA/F3+eZX9xBZ188x49o2G1Hp+54/3trRIAWdcnV0X6KkDJe vQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3n8eb60t4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jan 2023 08:46:38 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Thu, 26 Jan
 2023 08:46:35 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via
 Frontend Transport; Thu, 26 Jan 2023 08:46:35 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 88DDD11CC;
 Thu, 26 Jan 2023 14:46:35 +0000 (UTC)
Date: Thu, 26 Jan 2023 14:46:35 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: cs42l56: fix DT probe
Message-ID: <20230126144635.GA36097@ediswmail.ad.cirrus.com>
References: <20230126135552.3625887-1-arnd@kernel.org>
 <Y9KIN7GerLd4ziw0@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y9KIN7GerLd4ziw0@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: VbqhXAb8-NZ7R5_DRLhPEJawqKGXlLr3
X-Proofpoint-ORIG-GUID: VbqhXAb8-NZ7R5_DRLhPEJawqKGXlLr3
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
Cc: Arnd Bergmann <arnd@kernel.org>, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, Lucas
 Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>, Wolfram Sang <wsa@kernel.org>,
 linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jan 26, 2023 at 02:03:35PM +0000, Mark Brown wrote:
> On Thu, Jan 26, 2023 at 02:55:29PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > While looking through legacy platform data users, I noticed that
> > this one could never be used with DT based probing as the
> > platform_data structure gets overwritten directly after it
> > is initialized.
> > 
> > There have never been any boards defining the platform_data in
> > the mainline kernel either, so this driver so far only worked
> > with patched kernels.
> 
> Or there is no mandatory properties/platform data and the
> defaults are fine for most systems (which is a common case).

I think Arnd is right here, the driver appears to allocate a big
block of zeros and then blat that over the top of everything it
read from device tree. So you can literally never use any of the
DT properties as it stands.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
