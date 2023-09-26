Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1E97AE828
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 10:34:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 031BAA4E;
	Tue, 26 Sep 2023 10:33:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 031BAA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695717288;
	bh=dbbX1FFj5odJESaYerWrSHZZitlFANR1mu4B8lsyCEg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vhKyXPDwtDFtI0K1SSFp8eQNZ/5LJJaTRp0Q9WnL4/4AErhBQWFUljiON5XQrCnAb
	 8aJP86wVQqPxMd6bkbx3UUYnEohbkXpBuqE/g0EsslRJSQoLreQBOklU4S41wJ+BKX
	 qBFeqvq8UdjHZLZnnqEZVQ8n8HUtz3rLmOyexpZg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6239DF80290; Tue, 26 Sep 2023 10:33:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCA83F80166;
	Tue, 26 Sep 2023 10:33:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D498F8016A; Tue, 26 Sep 2023 10:33:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BA4AF8001D
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 10:33:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BA4AF8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=CQSJsrUH
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38Q50jYn008767;
	Tue, 26 Sep 2023 03:33:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=pAigu0GNj8nsOQO
	fvrw9g4qUfEwLPwCd3czBjlCEqgE=; b=CQSJsrUH2IFeRqEisV/o6fnrhKPVocY
	ClBdQbnZEdE8PTsF/GlnNdzzq/H251jFHPFxmKdIrMQ+oYOx+b2EXP5CDXEZZBaZ
	tUZyNMwBj1k1l7GjU7Ljor51HSeVRE7GBhCxKouqkcLfH+636+o1QwA/DewBvZTB
	XBUv7Q/QKugNX1IwUfc7AoQBEFmKs/jK9IBsagTteRn7NRC/0nCOQ2P8SurhSRrV
	f1t+5Pn47ddUaK2RDk9tZG5JG63GtOsKD4Fg6OULSPDuaM7avT9Z8+bxhv2gnVj5
	r6b6zZwYhdzZcwU4HM7l5FDMwIXNzjC5ypW91UNCVz5yjxeSHVcA4AQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t9wdxktyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Sep 2023 03:33:32 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 26 Sep
 2023 09:33:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Tue, 26 Sep 2023 09:33:30 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DE7E411CD;
	Tue, 26 Sep 2023 08:33:29 +0000 (UTC)
Date: Tue, 26 Sep 2023 08:33:29 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: David Rhodes <david.rhodes@cirrus.com>,
        James Schulman
	<james.schulman@cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood
	<lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v2 39/54] ASoC: codec: cs47lxx: convert not to use
 asoc_xxx()
Message-ID: <20230926083329.GK103419@ediswmail.ad.cirrus.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
 <87ttrhfo3e.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87ttrhfo3e.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: MC0hPptXhD6pZaG5ydsX4W5T9ocHlttA
X-Proofpoint-GUID: MC0hPptXhD6pZaG5ydsX4W5T9ocHlttA
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: OGK6PHBBSC42EYITEQMHHBSBT72EJBC2
X-Message-ID-Hash: OGK6PHBBSC42EYITEQMHHBSBT72EJBC2
X-MailFrom: prvs=4633103414=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OGK6PHBBSC42EYITEQMHHBSBT72EJBC2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Sep 26, 2023 at 06:25:10AM +0000, Kuninori Morimoto wrote:
> ASoC is now unified asoc_xxx() into snd_soc_xxx().
> This patch convert asoc_xxx() to snd_soc_xxx().
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
