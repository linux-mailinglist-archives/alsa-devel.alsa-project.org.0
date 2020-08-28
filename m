Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 781E925591D
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 13:08:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17CA7185E;
	Fri, 28 Aug 2020 13:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17CA7185E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598612889;
	bh=FPX2swMTxRR8YfDbLM/FJy7kNSVt0W8tH3+50yt/EME=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sBYkASpa5maL+A1Od9Z0jAzjilbt/W1kIoC8Tfw7zzhLH0vhFooKHRS2XXoN/crp+
	 ohAhpHml0Ft/+IXHwk+bZHMAFq84O4C/LyS8oRqiUL7yTJd1xioNl+fB4n6AkUqj/d
	 JZxkhxwEWUruadHhPPjZ36PuAnzqB9V3GJbA9uQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42F59F801D9;
	Fri, 28 Aug 2020 13:06:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76095F8016F; Fri, 28 Aug 2020 13:06:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50903F800EB
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 13:06:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50903F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="gAj03ZAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=1074; q=dns/txt; s=axis-central1;
 t=1598612780; x=1630148780;
 h=date:from:to:subject:in-reply-to:message-id:references:
 mime-version; bh=PEdfquxULEGmJU4HcJ4Lbg8+401VlkPBzzaKrqN4NZY=;
 b=gAj03ZAWcIDy7xQcCMECf4Xtr9wIwUfkP0KYUy3EaX0hzl8RX0zxCRRB
 Xg/58sb2FrXF7KnKim7I2y3NL1GgHz/LSo/W9DKzQa7WM3HIRzjThNqhn
 UdwxWwbMAzQhcRjc4HOtj6FeLzcjbX6L+UKT6y1Y4dB0Kmw8WKD7fH0Py
 Mw5qtEenZGjS1dtSmcksYtFUAchc0qU5sVRVwCxPGKRFIJx+1enjiXs42
 zHJO3IIaJ8RJAcrN8pYa9mGDTAKKSgEbXhlvaTdEKY9CmixP++jXcmwh2
 R170DCHld0mizkSmdqHpDxWjgohgoDyxyFrm+Jm2pMAgiTVBdVEMoFoRv w==;
IronPort-SDR: qVwuOihaeZRqLSMxrpYPeq6StuHK2Y5BkB6YGtncQnlCBer77AgwttwzniIqMsth6wlMjNRXlz
 jP4Dqwbhpd84FhwmEzYk29KeoXmgDsJzSK4ruu0HPpUMCNAq3bhT29t0byKlniKA+E20SpAreq
 jn0rvSAcwa/Vp7KzWi8RKNvYKzAiHU7KLjgrUR+HmaJ8DGmAFcclXrz3R0gDpA3YfAkBfBWKMl
 M62lWp/YCJpcLj4iGY7G5FPfymjASDRyQlgjrtaBjii8tB3bFwQ2Ej57gTSkqDUUSa/ckSvySO
 +mg=
X-IronPort-AV: E=Sophos;i="5.76,363,1592863200"; d="scan'208";a="11961677"
Date: Fri, 28 Aug 2020 13:05:59 +0200
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: alsa-devel <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 0/7] Allwinner A64 digital audio codec fixes
In-Reply-To: <20200828104948.sdq2ftwiwyjhh3lc@gilmour.lan>
Message-ID: <alpine.DEB.2.21.2008281300530.19501@lnxricardw1.se.axis.com>
References: <20200726012557.38282-1-samuel@sholland.org>
 <20200828104948.sdq2ftwiwyjhh3lc@gilmour.lan>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To XBOX03.axis.com (10.0.5.17)
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


This caught my eye and brought up an issue I've been wondering about for 
some time:

On Fri, 28 Aug 2020, Maxime Ripard wrote:

> On Sat, Jul 25, 2020 at 08:25:50PM -0500, Samuel Holland wrote:

> > ... some DAPM widgets still have incorrect or confusing names; those 
> > and other issues will be fixed in later patch sets.

As a general and firm rule in the Linux kernel when it comes to upgrades 
and fixes is "We do not break userspace". Which means that for instance an 
application must not stop working after a kernel upgrade due to some API 
changing.

So does this mean that the name of an ALSA control, once it's in the 
mainline kernel, can never be changed, for whatever reason?

Or devicetree properties, does the same apply there? Say a property as a 
confusing name, is it possible to change it at all?

Or are these things open to debate, depending on the severity and 
consequences etc?

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
