Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E09A369E7E3
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 19:50:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA632E9C;
	Tue, 21 Feb 2023 19:49:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA632E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677005418;
	bh=M3oqQLiVeiKFcSkxvyf9FUxCmoqIq16Mpy7MB7rQ9hQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OF0H8P2vyFR6Znuzd/9p1Q/Dc1k85HKnktO9VOJ7MY5h5kD8xqEfsK7wHpjS00GF5
	 shEOcKmo+75N0535SsGzi+Dk0BNe7Dl28BHPMexLvyTajfdc5nsAvVMwpdi2ucuRvB
	 GNcH/FSV5ZDP9cK19FZzrpnXkb6hMhdmdX1iDiGM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FBD6F8025A;
	Tue, 21 Feb 2023 19:49:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C94A7F80266; Tue, 21 Feb 2023 19:49:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBC03F80125
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 19:49:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBC03F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=joYQ8WL6
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31LHHMac001982;
	Tue, 21 Feb 2023 12:49:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=2yIT5sQ3F8uH9sOOaYmVBC+bo+0d0nFSg4rXQhVBuT8=;
 b=joYQ8WL637xlEGwSS/ZtKncTOn59Hg+pltTOUSJ2WA8bi1w4tMu+J5gatQU7/DvPvyw9
 CtVqOfGOf/NK9gJ3TpBGEHlOaGG/HQUwvTgjk/iwK33pwZImOK3TybVc6xoTJUOF4zuu
 tPSmkLkD2Qo6IAlGAQLw1NmgLygCTE3eZtoSp0dIyOTtM/G+NTAvqBf3saMBHPglNJHi
 0mUvweLcFuk2aHWXsbSxIcC8C8AECgv1hNyzjVvlz4CBARIbWMZUDDH644N35h/m3qsm
 1Omv+mYDjjQtjjCFXtAeqZYAFNN81szJqTdqioU7i0Fb5kZzxBXcaTJ6KNu/tmrT9X7B wQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3nvmnqs1xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Feb 2023 12:49:18 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Tue, 21 Feb
 2023 12:49:16 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.21 via Frontend Transport; Tue, 21 Feb 2023 12:49:16 -0600
Received: from [141.131.215.58] (david-linux.ad.cirrus.com [141.131.215.58])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B77EFB0E;
	Tue, 21 Feb 2023 18:49:14 +0000 (UTC)
Message-ID: <c09675da-5259-d8f3-77de-da54aef939d4@opensource.cirrus.com>
Date: Tue, 21 Feb 2023 12:49:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 3/4] ALSA: cs35l41: Add shared boost feature
Content-Language: en-US
To: Lucas Tanure <lucas.tanure@collabora.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>
References: <20230210091942.10866-1-lucas.tanure@collabora.com>
 <20230210091942.10866-4-lucas.tanure@collabora.com>
 <20230210134341.GF68926@ediswmail.ad.cirrus.com>
 <cfacc3d6-2daa-6aa3-ba19-281b7e48bb47@collabora.com>
 <20230211170638.GG68926@ediswmail.ad.cirrus.com>
 <1e3ef067-9b39-dc19-5fbc-75436c67f206@collabora.com>
 <d86d989b-0d82-74b3-a5da-9972324e9477@opensource.cirrus.com>
 <09bf8e07-6275-654f-4a70-d46b54e9b853@collabora.com>
From: David Rhodes <drhodes@opensource.cirrus.com>
In-Reply-To: <09bf8e07-6275-654f-4a70-d46b54e9b853@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lW4awi_3iOB0bT4v7fYDunC_lLoNfel_
X-Proofpoint-GUID: lW4awi_3iOB0bT4v7fYDunC_lLoNfel_
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: DALW5IIY4KQPLXFECGCDNQHCXUUONPDR
X-Message-ID-Hash: DALW5IIY4KQPLXFECGCDNQHCXUUONPDR
X-MailFrom: prvs=74167ab121=drhodes@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: David Rhodes <david.rhodes@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DALW5IIY4KQPLXFECGCDNQHCXUUONPDR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2/21/23 02:28, Lucas Tanure wrote:
> David can you confirm that both sides should use MDSYNC for boost 
> control source?

Both amps can use the value 'MDSYNC' for BST_CTL_SEL.
The value for the passive amp does not affect the behavior because BST_EN=0.


On 2/21/23 02:28, Lucas Tanure wrote:
 >> I believe there is another change needed for the Deck, to handle the
 >> 'legacy' property names instead of bst-type?
 > I am working with valve to update their bios.

Great, I think that's a better solution.

Thanks,
David
