Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C299B453785
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 17:31:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B8F817B7;
	Tue, 16 Nov 2021 17:30:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B8F817B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637080295;
	bh=2bZCjn3IeDy4snUzjHGzaHh04rK2qpJ3SDMZ/6EL3wI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JhtSgoLeDamEkzflw2MGobIFjvt0qwbreAY3odJHPurRlUp4ocgry0mqnbfeRilHm
	 S9jWzNvV92o2p4mtB6b0NLctorHw34n66UJ6oLHCESG0M+/grYHPtkP4qB7kwTntdM
	 Wrnm/WMPH3qxeQP38UrOHvyPyM+QjRebIZ2Mw4xA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ABB9F804C1;
	Tue, 16 Nov 2021 17:29:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C8EEF80423; Tue, 16 Nov 2021 17:29:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0E5BF80134
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 17:29:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0E5BF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Ndmm5Ycz"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AG4SSx1022254;
 Tue, 16 Nov 2021 10:29:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=hCa5aNmSupBd70sCNM3jwyNpevNiQT5zW8SgZNKS7Ac=;
 b=Ndmm5Ycz9QQ44Y5ueNNSycXvujsQ41s5NP0NY4qynHZVldZ9znRdVPpqq9ZHVAMZbP2i
 h9GZu0w68YUyEBT/4nvrdm5NkN0H8B67upTx28BnNKAR8r+Dafg22EDjHYOyAtks6y4y
 aKnL89W5Z7vBw+AO8xfjJOY2OW/JWMyJx/3KKXRxwY77H3FNE7eFvqh6NbG/pCvorNFi
 21ME7NHMYg9Xa7x7KrlUGlU1Lrlt1m6DNtKh0tkq4VcIfibp2rGAtCDXPwN7QkJQ3tXe
 TvDybrCwEo598BobzeEBH1kuIYZQCIb7WMb4kSFFWkP8R/32164ikb/jJD/SOPmZ/rDR tw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3cbdjgt3ej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 16 Nov 2021 10:29:13 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 16:29:11 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 16 Nov 2021 16:29:11 +0000
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.65.41])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1EB0411DB;
 Tue, 16 Nov 2021 16:29:11 +0000 (UTC)
Subject: Re: [PATCH 0/4] ASoC: cs42l42: Remove redundant code
To: <broonie@kernel.org>
References: <20211116162652.45225-1-rf@opensource.cirrus.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <3cd0991b-a396-e885-d324-808e5c5d76c3@opensource.cirrus.com>
Date: Tue, 16 Nov 2021 16:29:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116162652.45225-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OTEESrYZwGo5on_RuiGEDqNY6OESvZI0
X-Proofpoint-GUID: OTEESrYZwGo5on_RuiGEDqNY6OESvZI0
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Sorry, ignore this chain. Some old patches have risen from the dead
and attached themselves to this.

Will re-send.

On 16/11/2021 16:26, Richard Fitzgerald wrote:
> - Remove field writes in regmap_update_bits() calls where the code
>    intends that the field value is not changed.
> 
> - Remove unnecessary complexity from reporting jack unplug event
> 
> - Remove a PLL config value member that was introduced in a bugfix
>    but made redundant by a later bugfix.
> 
> Richard Fitzgerald (4):
>    ASoC: cs42l42: Remove redundant writes to DETECT_MODE
>    ASoC: cs42l42: Remove redundant writes to RS_PLUG/RS_UNPLUG masks
>    ASoC: cs42l42: Simplify reporting of jack unplug
>    ASoC: cs42l42: Remove redundant pll_divout member
> 
>   sound/soc/codecs/cs42l42.c | 42 +++++++-----------------------------------
>   sound/soc/codecs/cs42l42.h |  1 -
>   2 files changed, 7 insertions(+), 36 deletions(-)
> 
