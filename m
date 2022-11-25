Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D25638E4E
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 17:36:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B2AB174C;
	Fri, 25 Nov 2022 17:35:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B2AB174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669394178;
	bh=g40pFWPzDJGqfo7QU/noH31MgDXUIYtqCcp5QsZcEpU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eJxemzYljXJ4ulwEqgxl6xsnoisVdAsqBysl0YWXY1zHnJ78CYBZAxouwiW8qtOiv
	 l2dvW7VL5qtD2Mk9nF0k4rbTMy6mi2MilRYy856KqBja3eYA7vKjl4o9Ogiw7kDNK8
	 8DlefW3f71o3Xw4ML86loWLcWO0cOTbUpqegvnf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8CB6F8047C;
	Fri, 25 Nov 2022 17:35:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD993F80236; Fri, 25 Nov 2022 17:35:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5569CF800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 17:35:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5569CF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="aPbR9MoV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2APCOf18022885; Fri, 25 Nov 2022 10:35:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=5lSh8Cox5wsrEQw/pCfF0O9UM1R2f5q0CsMN299s1Fc=;
 b=aPbR9MoVF9JgSCmhwLr8Sr5GeBkEs11JEmkl6hn4WKlbR5qHtKJ86U2zXe4v7T0jUcvD
 ffzuQvcs2ilNp9EuTq9W3IHYKSwXugsC5qgKtm//WFXWkuulaCZ8djWf8grq0g3TqITN
 xPkrGh/EaCLGKR4xHr7Kif72vATqTjhXGCKlRULhRqq7ZejV9gLvEeY3WCVWF9sZ+J3U
 S9lPRpV0JYo6+h5irzcCHHjw19N0AU6ijvYoKB1PCxBe5sTxCMPoSTAWSkrDTyyICVuA
 v9g/gWEEDgziIfY9V5YAI5JZaHmNhEtyqVPA80q6UAmcDivF7DXk/jCab3H1SGNh9kuL cA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6yha3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Nov 2022 10:35:11 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 25 Nov
 2022 10:35:09 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Fri, 25 Nov 2022 10:35:09 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CC9002BA;
 Fri, 25 Nov 2022 16:35:09 +0000 (UTC)
Date: Fri, 25 Nov 2022 16:35:09 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: ops: Correct bounds check for second channel
 on SX controls
Message-ID: <20221125163509.GG105268@ediswmail.ad.cirrus.com>
References: <20221125162348.1288005-1-ckeepax@opensource.cirrus.com>
 <Y4DthUIxViHZnh/Q@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y4DthUIxViHZnh/Q@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: t9aVNlfLF_x86uDvs3L3bq3fs2pxBevw
X-Proofpoint-GUID: t9aVNlfLF_x86uDvs3L3bq3fs2pxBevw
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, guille.rodriguez@gmail.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, david.rhodes@cirrus.com,
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

On Fri, Nov 25, 2022 at 04:29:57PM +0000, Mark Brown wrote:
> On Fri, Nov 25, 2022 at 04:23:47PM +0000, Charles Keepax wrote:
> 
> > Fixes: e9b397afabb8 ("ASoC: ops: Check bounds for second channel in snd_soc_put_volsw_sx()")
> 
> You probably mean 97eea946b93961fffd29448dcda7398d0d51c4b2.

Sigh, sorry about that will send a new version.

Thanks,
Charles
