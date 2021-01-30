Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 552F730963A
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Jan 2021 16:31:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE6F6172D;
	Sat, 30 Jan 2021 16:30:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE6F6172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612020666;
	bh=tzVXTRaQR8A3qrd/uo50+JBboSI+FmSZcYr/9azDoUw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p9jtHcAuhy1jEDTE8OJMLToZoNK++t9Q5yuhebix903MSYleF8j+nJoRMpdNAysHJ
	 tBN44lt0XzP3kaXK44al6uoGhtfavOvJq799Aat13nvKOsD6IaI6v7bDoMgUoFZfbR
	 uwDJtSaMb6wUGzer0GlG/760ZL9oqNJN29dSVgb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1AC0F801D8;
	Sat, 30 Jan 2021 16:29:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC7BDF8015B; Sat, 30 Jan 2021 16:29:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B072F800BE
 for <alsa-devel@alsa-project.org>; Sat, 30 Jan 2021 16:28:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B072F800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="H/ADGv7d"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10UFNtbL032436; Sat, 30 Jan 2021 09:28:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=fx3dkMJOLSIWNaFDZpEzH9Ayv8+vFheSBmg7vPaoZAY=;
 b=H/ADGv7dBadeen5KXtwLE3d4vd7T0aK/MkB8Iv+yMQs8jshzwELzFp+1xcXBEh3SMyoI
 sRoL/nTF3TahcWsdS3LfvnyzEMSBXetLKLhcNdPkSma67xgHIP8RhURhnYk6WXryNpSg
 fB9cFKUCeOrfV5cfgdlwjojA6B6E8RUVzsmcMpRSspPuqT6kieNZrPa5IRwiwmoSKRrx
 DYIUjE9uEVEyL8jMlC11INb7V1OxHMBUEKHNCuwOZeLdZoXwtRGRbCI0kbV3RKrHMbjw
 eJtFQ0nBZD2MKEG23c23qMlSKEhCPP+7rxN3270Bk4qg9dW9RmW/QBuh5wWYbmgnFbME Eg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 36d4rtg65c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 30 Jan 2021 09:28:52 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Sat, 30 Jan
 2021 15:28:50 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Sat, 30 Jan 2021 15:28:50 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A31D045;
 Sat, 30 Jan 2021 15:28:50 +0000 (UTC)
Date: Sat, 30 Jan 2021 15:28:50 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 10/13] ASoC: arizona-jack: Use snd_soc_jack to report
 jack events
Message-ID: <20210130152850.GU106851@ediswmail.ad.cirrus.com>
References: <20210123121313.79530-1-hdegoede@redhat.com>
 <20210123121720.79863-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210123121720.79863-1-hdegoede@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101300085
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>
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

On Sat, Jan 23, 2021 at 01:17:17PM +0100, Hans de Goede wrote:
> Use the snd_soc_jack code to report jack events, instead of using extcon
> for reporting the cable-type + an input_dev for reporting the button
> presses.
> 
> The snd_soc_jack code will report the cable-type through both input_dev
> events and through ALSA controls and the button-presses through input_dev
> events.
> 
> Note that this means that when the codec drivers are moved over to use
> the new arizona-jack.c library code instead of having a separate MFD
> extcon cell with the extcon-arizona.c driver, we will no longer report
> extcon events to userspace for cable-type changes. This should not be
> a problem since "standard" Linux distro userspace does not (and has
> never) used the extcon class interface for this. Android does have
> support for the extcon class interface, but that was introduced in
> the same release as support for input_dev cable-type events, so this
> should not be a problem for Android either.
> 
> Note this also reduces ARIZONA_MAX_MICD_RANGE from 8 to 6, this is
> ok to do since this info is always provided through pdata (or defaults)
> and cannot be overridden from devicetree. All in-kernel users of the
> pdata (and the fallback defaults) define 6 or less buttons/ranges.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
