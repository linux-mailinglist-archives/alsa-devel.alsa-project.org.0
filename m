Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E317F17BF
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 16:47:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B98B784B;
	Mon, 20 Nov 2023 16:46:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B98B784B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700495253;
	bh=IgAgDYDX3LUFm//f5wUA3IZTEznLrr5E42Vz9LsPTto=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GZb89M2n86HP0fRo+7GXCiDttPWpVlzFbW75aVMusPeV2fOuKJ9jfHTxlux/d0rIv
	 GzGS9Ao9Vz6noPj38aQlDnlN1fToyvJKnNA7CwT7+tzKUpQUWiJ8GXPD1W110lZ3db
	 IGXpW3yGBuGujaV3HghAbN1dnVieIYjdj0jilTYc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6800F80310; Mon, 20 Nov 2023 16:46:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69ACEF80249;
	Mon, 20 Nov 2023 16:46:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC8DBF80254; Mon, 20 Nov 2023 16:46:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6C36F80114
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 16:46:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6C36F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=TV9sdrhP
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AK7Mki9010313;
	Mon, 20 Nov 2023 09:46:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=ZWsOkye7UA4T0s4t60u2ycugx+e4XSK9YWc9TxBmReo=; b=
	TV9sdrhPNKZqS+UgIAdn10dmFdAucUKlXtsTW+qQQVzUnOdt+S/QYnit16BnhNjR
	W0CzC4vL9Hu1IBpbik0M8MLH4+ryUF4bPamIN5RQfPN19oLE9s8t51VN6VBpkZ4C
	+tIyb1GgagnJ99rt9hFjYCG4zz3TO+KdosQ3bmUJgKOMXlytQdm2X53Wj8zoai+k
	z/ifXSy9p4VUYDPxhJ5ltHi4kVVkomhWCAnezX9FuQMzuvMrLmqAexHEE8oOAcGO
	94SoF22J7oEnl+nLMg+ITkCg0vyZlwnFvrii4cIMwoFXsWWhN8IjP9+1Zin1FNxZ
	QTHMDvNkV/pjoe8V9Tjvqg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3uetjpa0m2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 09:46:29 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 20 Nov
 2023 15:46:27 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.39 via Frontend
 Transport; Mon, 20 Nov 2023 15:46:27 +0000
Received: from [198.61.65.51] (unknown [198.61.65.51])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DFDC811D2;
	Mon, 20 Nov 2023 15:46:26 +0000 (UTC)
Message-ID: <261e118d-529b-0ce0-5524-d24d767fa92f@opensource.cirrus.com>
Date: Mon, 20 Nov 2023 15:46:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v3] ASoC: cs43130: Allow driver to work without IRQ
 connection
Content-Language: pl
To: Mark Brown <broonie@kernel.org>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20231120141734.76679-1-mstrozek@opensource.cirrus.com>
 <7248897a-0b59-4cdc-9915-d3297f2d6efe@sirena.org.uk>
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
In-Reply-To: <7248897a-0b59-4cdc-9915-d3297f2d6efe@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fafY-Yt29z7owcKc-n0D8v_s9HwIvl_V
X-Proofpoint-ORIG-GUID: fafY-Yt29z7owcKc-n0D8v_s9HwIvl_V
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VVPFDFXSX4SMPY7MVHRXLAT4PSS3RRLR
X-Message-ID-Hash: VVPFDFXSX4SMPY7MVHRXLAT4PSS3RRLR
X-MailFrom: prvs=668862412b=mstrozek@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VVPFDFXSX4SMPY7MVHRXLAT4PSS3RRLR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

W dniu 20/11/2023 o 14:40, Mark Brown pisze:
> On Mon, Nov 20, 2023 at 02:17:34PM +0000, Maciej Strozek wrote:
>> +		if (to_poll == &cs43130->xtal_rdy) {
>> +			offset = 0;
>> +			flag = CS43130_XTAL_RDY_INT;
>> +		} else if (to_poll == &cs43130->pll_rdy) {
>> +			offset = 0;
>> +			flag = CS43130_PLL_RDY_INT;
>> +		} else if (to_poll == &cs43130->hpload_evt) {
>> +			offset = 3;
>> +			flag = CS43130_HPLOAD_NO_DC_INT | CS43130_HPLOAD_UNPLUG_INT |
>> +				CS43130_HPLOAD_OOR_INT | CS43130_HPLOAD_AC_INT |
>> +				CS43130_HPLOAD_DC_INT | CS43130_HPLOAD_ON_INT |
>> +				CS43130_HPLOAD_OFF_INT;
>> +		} else {
>> +			return 0;
>> +		}
> 
> Is it a bug to call this function without to_poll set to something
> known?  This will just silently ignore it which seems wrong and is
> inconsitent with the handling in the interrupt case which will wait for
> the the completion to be signalled and report a timeout on error.
> 

In interrupt case 0 means timeout (and calling function should expect 0 
as error/timeout), so the only inconsistency I see is in not waiting 
before returning a timeout, but that would be needlessly wasting time?
Do you think adding a debug print or a comment would help here?
