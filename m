Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C1847558B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 10:54:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1D0A1A40;
	Wed, 15 Dec 2021 10:53:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1D0A1A40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639562069;
	bh=6BWS/qGMLw5FyeQvsvsKnuAHnoYpUz9xng9Tz+cPE7s=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oQZT0Hz+OXcjVTmy1Dij1ekWK7YTZNInZFCSBlIM/DoJHZVdegIDZdi2pepYKQcZ3
	 l1q0juinS5AxdG8E04fccMVFGIrUQcrzzU0eOd5jDp/57B3kpAyjYWk7O/vltPKCFl
	 OEa6xAEMUHhS4wQUEwFwZYf8vsleYqhDemoV/RHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E2F5F80237;
	Wed, 15 Dec 2021 10:53:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C616BF80236; Wed, 15 Dec 2021 10:53:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54E1EF80158
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 10:53:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54E1EF80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="fI/HZK4Z"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BF5wvrL030058;
 Wed, 15 Dec 2021 03:53:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : from : to : subject : references : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=B4Fw+WEddM5gJZ4DB6SEFyYS2/WKsthS3qgAqUmboi4=;
 b=fI/HZK4ZqVdFdm2RbGPbUyXbn+I/YidTkygPBd6jKpsALvXIzbsJoCMNF2ZDDefc/ZA5
 qKvTTnvcFequnyJdd/lXvSvm+b81i44Y01vnvFOVy+rxWS9YA4uMlweR6Yjqp9L+L6TY
 Bx3iRwxoGSfFPR8a3t0igbplplt21zRJurzDRJwqNKNECET4jVQCwLA5Xu2r9wltZAog
 e1jbWeT/mUfADIUtbA/jyf4hNzL7uxemhZUkGsmmxeSQWdtbw2dLAo1Zt6xKNp1NeIPr
 ITBid5BEAcwCf+qC/XPm+GmRzr2a/Jzu5W1NC2YolsmSqoKFt9npDb3O8kaD53JSbFfX fw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cxh14j27n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 15 Dec 2021 03:53:10 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 09:53:08 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 15 Dec 2021 09:53:08 +0000
Received: from [198.61.64.39] (unknown [198.61.64.39])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BC4D345A;
 Wed, 15 Dec 2021 09:53:07 +0000 (UTC)
Message-ID: <cdb216ff-f5b4-34f0-3d4d-93ea7061c660@opensource.cirrus.com>
Date: Wed, 15 Dec 2021 09:53:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From: <tanureal@opensource.cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, Rafael J.Wysocki
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Mark Brown
 <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 <alsa-devel@alsa-project.org>, <linux-acpi@vger.kernel.org>,
 <patches@opensource.cirrus.com>, <platform-driver-x86@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 03/10] ASoC: cs35l41: Move power initializations to
 reg_sequence
References: <20211214135959.1317949-1-tanureal@opensource.cirrus.com>
 <20211214135959.1317949-4-tanureal@opensource.cirrus.com>
 <20211215091031.GS18506@ediswmail.ad.cirrus.com>
In-Reply-To: <20211215091031.GS18506@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -lKqbpk72kVZ-o565_UisJBgCNeqdImc
X-Proofpoint-ORIG-GUID: -lKqbpk72kVZ-o565_UisJBgCNeqdImc
X-Proofpoint-Spam-Reason: safe
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

On 12/15/21 9:10 AM, Charles Keepax <ckeepax@opensource.cirrus.com> wrote:
> On Tue, Dec 14, 2021 at 01:59:52PM +0000, Lucas Tanure wrote:
> > +	{ CS35L41_PWR_CTRL2,		 0x00000000 },
> > +	{ CS35L41_AMP_GAIN_CTRL,	 0x00000000 },
> >   };
> > -	ret = regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
> > -				 CS35L41_AMP_EN_MASK, 0);
> > -	if (ret < 0) {
> > -		dev_err(cs35l41->dev, "Write CS35L41_PWR_CTRL2 failed: %d\n", ret);
> > -		goto err;
> > -	}
> > -
> > -	ret = regmap_update_bits(cs35l41->regmap, CS35L41_AMP_GAIN_CTRL,
> > -				 CS35L41_AMP_GAIN_PCM_MASK, 0);
> > -	if (ret < 0) {
> > -		dev_err(cs35l41->dev, "Write CS35L41_AMP_GAIN_CTRL failed: %d\n", ret);
> > -		goto err;
> > -	}
> 
> Sorry for not spotting earlier but just noticed these two writes
> are update bits, so you shouldn't just be setting the values to
> zero in the patch you just want to clear the relevant bit.
> 
> Thanks,
> Charles
> 
Hi, sorry, that was intentional. This patch is also disabling other
parts of the amp and setting all gains to zero.
I will update the commit message to reflect that.

Thanks
Lucas
