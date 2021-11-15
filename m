Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 401084504A6
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 13:44:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2D0616AF;
	Mon, 15 Nov 2021 13:43:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2D0616AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636980273;
	bh=xBU9M5zvSzPvUWKsbscg+uN4oQE7vFN7ga2bHvEGUUs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=su3q+Yrhjv4VE3Dp8Hg+KZ81q1tgO6sVcThcTeQQsy5zN6z1pqb+wenWuOVnULl6m
	 BFtqtE1SmKzKUCOnDjlZmbm8UwgP6ELEj+MFaudAH2MZmUve0wUkcAumtUDYI7D4kT
	 esxvokKhKjIFKFRqZVXeKrB/ErsOov98ZJuuhmW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 868AFF80134;
	Mon, 15 Nov 2021 13:43:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D78EF802A0; Mon, 15 Nov 2021 13:43:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0142AF80134
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 13:42:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0142AF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="hUq6LzPo"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AFBu7JO030566;
 Mon, 15 Nov 2021 06:42:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=TbN+T5UbW/pTZkZG+D5XfPYWd0dn7t2lMCwb7Cp5rjk=;
 b=hUq6LzPoRIb7mIw5aTUt6/FzmVTc6U1ltCNPAdXwz1D/TQz9QytVAfADDHtgCirwHmAW
 qTFBGWazzZbQSXNYDXvKFXxzZ/fMuLXEzdL3gquzvEidoW+A2MjD029Za78f9OsNxTih
 ErscuKc8st63gdnFxHKPZVLUHF8j9+O4L5/YTr6lS7c+eOFhqlA2sgN0bEUeV+Ae7LsT
 3SSREYkNV/htiMLu+air3tOpBjXqT3pthve0wOEn4S0tDJcjKeQ4cfIJUiJvz9lo7sNc
 XNL87Iw1go2D+rkLq2J4nGLHKzii4S3dpqdoQg5MsZvnofd6WInSa8gX+QfxF3On4DpN Lw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3cbdjgrgk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 15 Nov 2021 06:42:54 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 15 Nov
 2021 12:42:53 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 15 Nov 2021 12:42:53 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E7F7811DC;
 Mon, 15 Nov 2021 12:42:52 +0000 (UTC)
Date: Mon, 15 Nov 2021 12:42:52 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: tidy includes in cs_dsp.c and cs_dsp.h
Message-ID: <20211115124252.GB18506@ediswmail.ad.cirrus.com>
References: <20211115120215.56824-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211115120215.56824-1-simont@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: hmLB5-5mIBc3XMAvWS7Suut0HITb8a46
X-Proofpoint-GUID: hmLB5-5mIBc3XMAvWS7Suut0HITb8a46
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Nov 15, 2021 at 12:02:15PM +0000, Simon Trimmer wrote:
> This patch removes unused included header files and moves others into
> cs_dsp.h to ensure that types referenced in the header file are properly
> described to prevent compiler warnings.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
