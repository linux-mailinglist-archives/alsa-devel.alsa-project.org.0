Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4FB68EC46
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 11:03:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71C9A846;
	Wed,  8 Feb 2023 11:03:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71C9A846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675850632;
	bh=Jj1emTekUzPacqDvU/HxjCHSGkeoO+obGxoGnql/TZs=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xi3IDr4wtJ20AqtgOHy17B85JbwI2subFCU4fKk1WkYTCJl7TKpoSum6R8RYh6LGz
	 0Me2qc5huUDzEbtA/Z8VQcXiTxZwSpHShySZKY8cE1DLQcKxhZkOBoC63v0pjDI664
	 oUXE3HBB+0WJsxJorFqiY+05kFty2mr2hSvhKerY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B42BF80095;
	Wed,  8 Feb 2023 11:03:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC102F8012B; Wed,  8 Feb 2023 11:02:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8D0BF80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 11:02:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8D0BF80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=JURhOFVf
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3183TBEN010218;
	Wed, 8 Feb 2023 04:02:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=ix0NSZcDZRRO7mkidkQUjWySPIOK6axDiNLFsl+FgGs=;
 b=JURhOFVfF6VjquYHFMkuDrYzaQyHZYb4riLwfVvejT0AyKtTijSSP9mountka1v+btpR
 vGoiMValeQ9BE8x0VeXlKPBK44F5ZI5QTGg1NhSk4y6zoYjhkjxCzw29MzNZgW39Mj2B
 OH+CMn9ImtQMbHTtHHB01tuwHNB82nCW3hgCw8QTBunSI9dzeElRrQPjLv2X+h7uBDqL
 GENgzQeoXmoU0mTTnWpULAj9dsxNbUNPySqJHg87MSML4FFFwd4KWEp1iFO8QkvvdUyI
 B/ynPFi3TGe9z+u331fn4tpqpHpCnzk+9TRI+Brl/ak9E9V8FNASC+4WWtV24igGN8kl fg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3nhnn7wsn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 04:02:45 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Wed, 8 Feb
 2023 04:02:43 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via Frontend
 Transport; Wed, 8 Feb 2023 04:02:43 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 13BBF11C7;
	Wed,  8 Feb 2023 10:02:43 +0000 (UTC)
Date: Wed, 8 Feb 2023 10:02:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lucas Tanure <lucas.tanure@collabora.com>
Subject: Re: [PATCH v2 1/5] ASoC: cs35l41: Only disable internal boost
Message-ID: <20230208100243.GD36097@ediswmail.ad.cirrus.com>
References: <20230207162526.1024286-1-lucas.tanure@collabora.com>
 <20230207162526.1024286-2-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230207162526.1024286-2-lucas.tanure@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 3cmNYM5ZB62VFtii5Orae4dChnwZCC9S
X-Proofpoint-ORIG-GUID: 3cmNYM5ZB62VFtii5Orae4dChnwZCC9S
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 43ZK5LHI5CJ2I43GFQ5J34ZIYJMPWR33
X-Message-ID-Hash: 43ZK5LHI5CJ2I43GFQ5J34ZIYJMPWR33
X-MailFrom: prvs=74039f8db2=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/43ZK5LHI5CJ2I43GFQ5J34ZIYJMPWR33/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 07, 2023 at 04:25:22PM +0000, Lucas Tanure wrote:
> In error situations, only the internal boost case
> should be disabled and re-enabled.
> Also, for other boost cases re-enabling the boost
> to the default internal boost config is incorrect.
> 
> Fixes: 6450ef559056 ("ASoC: cs35l41: CS35L41 Boosted Smart Amplifier")
> Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
> ---

Would quite like David to review as well, but looks good to me.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
