Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEB85955E5
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 11:07:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28F761FA;
	Tue, 16 Aug 2022 11:06:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28F761FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660640826;
	bh=U8hPHbJ3Mo1h7NemDQcHPh7ib7RFiULFQB/3M2RbHi4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=scHWggFjlzeW75m1JrmA+YMpTAbiXs1MCXRmHWlkt90jEuEClkwhCeqZ9ONX+OeQe
	 ruD98lUeZTzyPRVebznq1kM2E/SikMJ4SiPBLbe2VNiDjksjssatQOW9Pfftu9U+3l
	 auKIrVedrY2B+r7K4tDqP1YgsXNxZ/X0BcTuy9jQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B508F80082;
	Tue, 16 Aug 2022 11:06:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44739F80095; Tue, 16 Aug 2022 11:06:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C097F80095
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 11:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C097F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="hDeJAig6"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27G1cRYr013154;
 Tue, 16 Aug 2022 04:05:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=V7+EmkrSuZ84Bb1gS/wxH1FOr6TUaRrdnHDtztrgSTo=;
 b=hDeJAig6BJnBTD5z4jiBt1IdQiSF3hjYucAxgdiRHbbX9J7cMmMBxy78RMBBQFj4J1O+
 rToQ/FZui015D/7EUuAA/s83U3/Ci89croC9zkjR6NzuvELgsRAluF5vkg+ofgMikp0h
 CI9vVF4KiolPUQqymIcCtNJhyelnl+DOOjhxRIn6Qt8ESg7FGxee9UR5w9nc6Jq7GK9Y
 JyQe6K3vwTCiRBTViHq0/pt8n1GzXaChw/SvNx+Fuft8zbRw4J0JGUPKsZyp5XWnqwhp
 QcwFDv62Q3rlE4Bsp6CEWKALJTuoBaK7NSn8gdNzVUxa1yLdtghmiFB75X8Dez3aif0Y zA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hx8cpbav1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Aug 2022 04:05:55 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Tue, 16 Aug
 2022 04:05:54 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Tue, 16 Aug 2022 04:05:54 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5A7F57C;
 Tue, 16 Aug 2022 09:05:54 +0000 (UTC)
Date: Tue, 16 Aug 2022 09:05:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: Fix the include guard used for
 include/sound/wm8904.h
Message-ID: <20220816090554.GJ92394@ediswmail.ad.cirrus.com>
References: <eff524b78d1f851e3dc42999e68c286492f92b21.1659800938.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <eff524b78d1f851e3dc42999e68c286492f92b21.1659800938.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: Cv0SVka0lPbtKA-6rDUgNcbQ73hqUg6g
X-Proofpoint-GUID: Cv0SVka0lPbtKA-6rDUgNcbQ73hqUg6g
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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

On Sat, Aug 06, 2022 at 05:49:14PM +0200, Christophe JAILLET wrote:
> __MFD_WM8994_PDATA_H__ is already used for:
>   include/linux/mfd/wm8994/pdata.h
> 
> Based on file names, use __MFD_WM8904_PDATA_H__ instead here.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
