Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AFC48138D
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 14:32:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E92951786;
	Wed, 29 Dec 2021 14:31:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E92951786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640784748;
	bh=ZqDtFpd5E7RCayDIuJTdbOi1BxCVByjz3U/4x35jlmw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VUtDU4cb5byApBehnjIqOEGm7FeDssypHhCXiXemdLv4O9baNb6lrvDSvWxRQT0wo
	 R5JxdOBMgqQtoY7VRkXMQ88JhG0pqb5SxB08dFKBJ8aP9j1L1T/gibvZM543wGcFba
	 Vvxnkpelakka6JVBOmoes3De1BSKype6+Su30ypk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C415F8051D;
	Wed, 29 Dec 2021 14:30:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E70FFF8051C; Wed, 29 Dec 2021 14:30:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C81BF8051A
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 14:30:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C81BF8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="oMFRGnha"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BTBEBSm019454;
 Wed, 29 Dec 2021 07:30:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=YeKfRMoZIKCVf5PXdKVcGT6HAIA2l8eCUy1cOZI0g/s=;
 b=oMFRGnhaRqqM5lnCBFz1YJedCP9RS47ZIP82uHWC910xURM+cdCTk20/uA6nMwSpxqIR
 yDILWG/YbzMpxMjFHlhFgNUmphf4Vt37tWoIl6E2VxbEM5xVSXuqaSdskHwgsaym5c66
 xl4kj5qcF11nq/KwY045Cyl1MEnxR3uy+VK6aUs1znh0EUIChlBOVyc7xHSBBnmUgwxM
 a/d5ON8LZAONaQE/guaX4x4MAO5J1+nzz/9UE626UOV9/o9XCSy4iioWUjXQFRkmD93a
 rJqhngH7TFVjwxLVbAOmSOLA2okr+suNW19YDHs7drTvAdb4HwbyIYzUwXlVoYBhKFiU JQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3d7ksg9ps0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Dec 2021 07:30:02 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 29 Dec
 2021 13:30:00 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 29 Dec 2021 13:30:00 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6E05211C7;
 Wed, 29 Dec 2021 13:30:00 +0000 (UTC)
Date: Wed, 29 Dec 2021 13:30:00 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: cs4265: Fix the reset_gpio polarity
Message-ID: <20211229133000.GB18506@ediswmail.ad.cirrus.com>
References: <20211229114457.4101989-1-festevam@gmail.com>
 <20211229114457.4101989-2-festevam@gmail.com>
 <20211229115352.GA18506@ediswmail.ad.cirrus.com>
 <CAOMZO5DcXUR2Z6-cokwizDbAKnEs877AjbX9FEow2RFHfebnuw@mail.gmail.com>
 <YcxX3XFWO9jQWlLJ@sirena.org.uk>
 <CAOMZO5ANC34SoxB9YeiLQo8FsjYana9uXiogtktJZ_ghx9JiQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAOMZO5ANC34SoxB9YeiLQo8FsjYana9uXiogtktJZ_ghx9JiQw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: JwEMYNG6iFA9U-hhu8o4-dozQ376NEx8
X-Proofpoint-ORIG-GUID: JwEMYNG6iFA9U-hhu8o4-dozQ376NEx8
X-Proofpoint-Spam-Reason: safe
Cc: Fabio Estevam <festevam@denx.de>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, "Handrigan, Paul" <Paul.Handrigan@cirrus.com>,
 james.schulman@cirrus.com
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

On Wed, Dec 29, 2021 at 10:11:57AM -0300, Fabio Estevam wrote:
> On Wed, Dec 29, 2021 at 9:43 AM Mark Brown <broonie@kernel.org> wrote:
> 
> > There might be more out of tree users of course - there's no requirement
> > for people to upstream their DTs.  Probably better to play it safe.
> 
> If someone correctly describes the gpio_reset as active-low, then the
> driver will not work.
> 
> If there is any out-of-tree user of the gpio_reset property, they are
> passing the incorrect polarity in the device tree
> and things are working by pure luck. (wrong polarity in dts + wrong
> polarity handling in the driver = working state)

Yeah a fair bit of this sort of thing kinda happened in the early
gpiod conversion, and it is indeed a bit sad.

> 
> Ok, if this can't be fixed, then let's drop patches 2 and 3, which is
> unfortunate.

I think we can still keep patch 3 here, still valuable to put the
device back into reset, even if we are using the backwards reset.

Thanks,
Charles
