Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2BF57A3C4
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 17:55:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 228D816F3;
	Tue, 19 Jul 2022 17:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 228D816F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658246152;
	bh=CvuqKzLW8z/oBJmCq4X8fDD9L8499sdFh/qoYJ5CYPo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sE3xfQm15XCJZRNQcShtVYwKpKesv2toxsp3XT5auQDNirUIU5HGm0jva5ZgujDb2
	 WO/QPA9f/0U6VQnZ9uqWReOLNe4aiYvqCF3W2WO2TGE5NoNxoriRCA1BAMGDe60+kP
	 pHVAf5XR0jmuAYj4L5JFXOsKBslQrXM+dXNeOAe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89433F80169;
	Tue, 19 Jul 2022 17:54:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6AA4F801EC; Tue, 19 Jul 2022 17:54:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C827F80118
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 17:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C827F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="pu4IfSAu"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26JASFEo009799;
 Tue, 19 Jul 2022 10:54:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=nxj0BWv0JUj+DLYX8W3ZX/5fDJ5e7VgoDYp+YPmbytk=;
 b=pu4IfSAunWHKyI6sOHeEpbfoNBxHhNUitGyfpa+wccIerMlKo9F7xNAEhX7y4R5rrjhk
 d5ovH3oephXf+XK9QpWB1wf3mgnaIz4qJ5SIVRyoEiVKsRKi2aEkXcfrDv2fNbItd4TG
 xYgdP/aHMeP15qRb8jxTeLikSHcKdg++Zk6RkyCpUWk7KktlN5DfifMEfLhfr0aplkH4
 hjtG9Wx7ah9PvsYD4MjjlRUP+a2s2gI6bBUhJ/7ZyMWHEW9niGWolV/qURZovf6DyUav
 bTwO4xX4FB4PXi0hOV4ODnQpTaGzH4O2h8x7AHW3VnN0WlSe86UYubNPet150gXYW8O0 ng== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hdrqfgkd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jul 2022 10:54:42 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Tue, 19 Jul
 2022 10:54:40 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Tue, 19 Jul 2022 10:54:40 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B0751475;
 Tue, 19 Jul 2022 15:54:40 +0000 (UTC)
Date: Tue, 19 Jul 2022 15:54:40 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: ASoC: Is this bug ? DAPM source vs sink
Message-ID: <20220719155440.GC92394@ediswmail.ad.cirrus.com>
References: <87o7xloca2.wl-kuninori.morimoto.gx@renesas.com>
 <d7307c80-47e1-ef4b-42a9-dcbb8f555789@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d7307c80-47e1-ef4b-42a9-dcbb8f555789@metafoo.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: eyITfN3SmTyJDL7WIAWebKgOKC8D9hWH
X-Proofpoint-GUID: eyITfN3SmTyJDL7WIAWebKgOKC8D9hWH
X-Proofpoint-Spam-Reason: safe
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Tue, Jul 19, 2022 at 10:50:57AM +0200, Lars-Peter Clausen wrote:
> On 7/19/22 08:19, Kuninori Morimoto wrote:
> >So, I guess current for_each is wrong, but I'm not 100% sure
> >
> >
> I don't think DAPM would work if this was wrong. If you look at that
> patch it consistently converted
> 
> `sources` to `edges[SND_SOC_DAPM_DIR_OUT]` and `sinks` to
> `edges[SND_SOC_DAPM_DIR_IN]`

I think this is just one of those perspective things, OUT ->
audio comes out of the node ie. is a source. IN -> audio goes into
the node, ie. is a sink.

Thanks,
Charles
