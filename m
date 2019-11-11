Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F383F78C5
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 17:29:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0FE91678;
	Mon, 11 Nov 2019 17:28:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0FE91678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573489747;
	bh=9sCFgadBYjpsBKLbH2V3aIVeJbsJODjZpO+XleHNT0o=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hfHYGiMBUxqtAuqyP5EDysPR0G1wjwoOeKQW5PlcSbfahua78W+akJ+miEFRYt54P
	 CbT1+pl0FzCotAm0L8odjGXTuMF3bWaEqVKErS09vw8cjSS8IGtCPixeit/88B9DQY
	 OKmiema/bkTfldWcoVEYQJDgWmhObfpyonl3f7E8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3663F80506;
	Mon, 11 Nov 2019 17:27:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75EAEF804FF; Mon, 11 Nov 2019 17:27:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83A6AF80275
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 17:27:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83A6AF80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="oue6YP5q"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xABGOcTX022487; Mon, 11 Nov 2019 10:27:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=LA4A7J6Ne2Y8iSl9rFw0dPXecqUpEhjzWKaWvos0f0o=;
 b=oue6YP5qiYN+D+UQarAK7G2NDFJrU0GWj2njbUpNUTSZQPDvteW6p0LWZuN7e/AJPSdX
 toGNXGDncHcU+c2Inmryf/ertpuoAgjtx4JMyXR1voAqWPpEJcey7CUBRIpuzmghz/+4
 3zKyx+uZaesjPpEYktk3++y5TLXKafvSQ+3Ftw71uz29OtUkNMvCXbb2oe1fQAF4lqiM
 n5XkZy279pC8Wqm94ZIEqMMbETDVUYEy/6ikGdMdJ/3M+u86FRe5j6mu4prOjXYttD5A
 4STv9XPSV8Z36StXpIpW9XfzsvhoqRkicf3u6QZs3sI9y4nUqYlssrJxvJUgg4/XvLxr Ew== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2w5ur2khbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 11 Nov 2019 10:27:10 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 11 Nov
 2019 16:27:08 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Mon, 11 Nov 2019 16:27:08 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 696E82A1;
 Mon, 11 Nov 2019 16:27:08 +0000 (UTC)
Date: Mon, 11 Nov 2019 16:27:08 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Michael Walle <michael@walle.cc>
Message-ID: <20191111162708.GC10439@ediswmail.ad.cirrus.com>
References: <20191108203152.19098-1-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108203152.19098-1-michael@walle.cc>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=579
 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911110149
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com
Subject: Re: [alsa-devel] [PATCH v2] ASoC: wm8904: configure sysclk/FLL
	automatically
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Nov 08, 2019 at 09:31:52PM +0100, Michael Walle wrote:
> This adds a new mode WM8904_CLK_AUTO which automatically enables the FLL
> if a frequency different than the MCLK is set.
> 
> These additions make the codec work with the simple-card driver in
> general and especially in systems where the MCLK doesn't match the
> required clock.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
