Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4807029C7
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 11:58:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A68F208;
	Mon, 15 May 2023 11:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A68F208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684144736;
	bh=aV4FlqYYhKzJ7fUvmvCLR9CtZVBiZJtKKnxMMZRJoss=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nSrP+6iTPLeZNJs7wYxIbEZAX8kmLRWAb8d1LOsLvh9KhGTz1V/iXLW0hl2Lo/pqn
	 uKaCOnaURX+Gwi5nD8jHC6oEUan8DxSeS906M6J538eFI7HtslhG4evWQFlKBcsr35
	 g/SPqbiMbQ2J/maUVLDCxzBbBDITsjzWHEWWNKdY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A81AEF80272; Mon, 15 May 2023 11:58:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40DBDF8025A;
	Mon, 15 May 2023 11:58:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 206CCF80272; Mon, 15 May 2023 11:58:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34CC7F8024E
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 11:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34CC7F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=n1ev97nD
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34F6Fla8029603;
	Mon, 15 May 2023 04:57:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=fVXZo9QUEpij5PoSS2UHn6KP8HowvSC0ezonm6gqMfA=;
 b=n1ev97nDDtUw8I4lyBasev4lFaovSJbjP71tmEypieWA7TOzXqM+JcMT9DDqoKUXi4Vr
 slWpAvQX0Fx845pM5MfzvFaqkpf7LCRchKYSaY18t4LLyagJtX/lsvOsNLjAo9H2QdVC
 tRXBWWY7+WNc6u6cCo8AO2DPWcjjkxqFcRaOFxNhqYequjlmgsNTpX1d9A/O3GMlO5qz
 9indsEu5nywdeW3vAmJ2WmQMvq1YXSHU9pZlZ27UE4NsweF+kYCrqm+a1K8y0+uB/wjc
 52KSoS7ORFD+6W4gyP6uwl+L7jv9whjaruCupApO550dDtotIFu7devYRIPmASprx2gH /Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qj6ymtp31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 May 2023 04:57:54 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 15 May
 2023 04:57:52 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 15 May 2023 04:57:52 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CA70F45;
	Mon, 15 May 2023 09:57:52 +0000 (UTC)
Date: Mon, 15 May 2023 09:57:52 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <tglx@linutronix.de>, <linus.walleij@linaro.org>, <vkoul@kernel.org>,
        <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 07/10] irqchip/cs42l43: Add support for the cs42l43 IRQs
Message-ID: <20230515095752.GQ68926@ediswmail.ad.cirrus.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-8-ckeepax@opensource.cirrus.com>
 <86o7mpmvqq.wl-maz@kernel.org>
 <20230512153933.GH68926@ediswmail.ad.cirrus.com>
 <86mt29mt2m.wl-maz@kernel.org>
 <20230512164233.GN68926@ediswmail.ad.cirrus.com>
 <ZGGGGcZNEx7o8GC6@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZGGGGcZNEx7o8GC6@finisterre.sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: lWnGF2LbEFzXlgDSJ7wqSHx-nXoGofXe
X-Proofpoint-ORIG-GUID: lWnGF2LbEFzXlgDSJ7wqSHx-nXoGofXe
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IQH4MV5LXFDJY67SAFWRVCELVICLNMJB
X-Message-ID-Hash: IQH4MV5LXFDJY67SAFWRVCELVICLNMJB
X-MailFrom: prvs=04990c9ac7=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IQH4MV5LXFDJY67SAFWRVCELVICLNMJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, May 15, 2023 at 10:08:41AM +0900, Mark Brown wrote:
> On Fri, May 12, 2023 at 04:42:33PM +0000, Charles Keepax wrote:
> 
> > I guess if Mark doesn't mind I think the only internal bit of the
> > device that uses the IRQs is the CODEC driver so I could move the
> > IRQ handling in there, it does seem a little odd to me, but I
> > guess I don't have any problems with it.
> 
> The obvious (and previously standard) place for it would be the MFD.

Alright I certainly have no objection to moving it there, although
would be good to get Lee's thoughts, make sure he is happy with
that too.

Thanks,
Charles
