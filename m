Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D31C15053BA
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Apr 2022 14:59:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 543A716D4;
	Mon, 18 Apr 2022 14:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 543A716D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650286789;
	bh=6qvbSZPsRQ2QK7L0KsygJhGgQaH0vRfdVk+d0/VFA/Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QVbU+3NHtLPMa0ZAfLeOjrNKMkvfMHYEGmpw/pM1qNmTPG6NJsROJK3RAaetNbRhw
	 ncxWCBLl5Gfy5AczSLSIRQevrapFpHsVrDYIActsPk5/wP1O6s29ppVkMFxrAJjo4Q
	 8+hLKBpzcuSVkDIxkc8Iz+IRwirEaP8TGLgHQ1fE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5BF6F80311;
	Mon, 18 Apr 2022 14:58:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D77CF8014E; Mon, 18 Apr 2022 14:58:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 062B3F800D8
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 14:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 062B3F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="C97ZD9Bc"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23IAwEtM010624;
 Mon, 18 Apr 2022 07:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=wtcSYcZxtfhTiECiHdXdRT35LqK5yyZ+wgb/9w9e73c=;
 b=C97ZD9Bcagu+qpg2/X/NKwG8OnkKtuyzokDA2spaXWbIv6es9hPk9D9h8pW4hGaAzWTF
 sZ59as0uBHSx7PEFwrINncW7mrTAW+qUkOKkClDDwpF2pRrJUZ3GplZa+R07kccq6OH7
 yL3WbCDjJVrfgygXozG/3P6pcoj1gDs+ScdIJYXlD4s9Em/GEOuALChRiYGM+Sgt8gwg
 orRnLuKqZpSxCtvQnYMj/aKmunBSVvdcYxoPL3EKLiSr/d6kK7q8WAeO87amukfGaCvY
 g2OfLJqJvwfhyxpS2TrZFWD+qbuLnZe3UcmXVD3ZXcSkf9IEK6MDcG/9wqmwXNFH9NM8 SQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ffu70hvg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 18 Apr 2022 07:58:40 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 18 Apr
 2022 13:58:38 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 18 Apr 2022 13:58:38 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5A1AFB10;
 Mon, 18 Apr 2022 12:58:38 +0000 (UTC)
Date: Mon, 18 Apr 2022 12:58:38 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: wm8958: Fix change notifications for DSP controls
Message-ID: <20220418125838.GB38351@ediswmail.ad.cirrus.com>
References: <20220416125408.197440-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220416125408.197440-1-broonie@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: qyPhmTm-nkLrzb9xMSD0gUsNGhZ0mEKx
X-Proofpoint-GUID: qyPhmTm-nkLrzb9xMSD0gUsNGhZ0mEKx
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>
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

On Sat, Apr 16, 2022 at 01:54:08PM +0100, Mark Brown wrote:
> The WM8958 DSP controls all return 0 on successful write, not a boolean
> value indicating if the write changed the value of the control. Fix this
> by returning 1 after a change, there is already a check at the start of
> each put() that skips the function in the case that there is no change.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
