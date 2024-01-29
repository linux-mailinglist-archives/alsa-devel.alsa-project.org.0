Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6ED840B59
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 17:28:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04A1286F;
	Mon, 29 Jan 2024 17:27:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04A1286F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706545679;
	bh=U2e1W5oI8/J4cPBAshZCwvAQB+UNl7ic7ITb9kxduGs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fKniUmmYU+cFgfRGgGh0aJG2uz04br+x4HBT8wU/bQQhohoXtgQujSW1e07rNnsIj
	 yUoTwSx7fKTacPktsaeJvsj/LDpPO0VCN3i00/4ROfp6T3evQz83gB6PlV0+V9Q7zQ
	 og4TL0JcEMYplJyxgcOO/rT1P+Jo9NOmBpA54WsA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67A2DF8057D; Mon, 29 Jan 2024 17:27:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D36A7F805A8;
	Mon, 29 Jan 2024 17:27:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20997F80563; Mon, 29 Jan 2024 17:27:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AE36F80548
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 17:27:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AE36F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Us4flF+N
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T5Upj4006490;
	Mon, 29 Jan 2024 10:27:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=
	PODMain02222019; bh=tAteh6KFAibWfbZe814d/E/E/D/jDOhwi0vIZQGxGs0=; b=
	Us4flF+NeUAdVQ/bqKtn4RDFdTpFZ/ewjTMGZWqLvaGbDel7jnYVuDd088V/NOea
	049ApQClifAbFjqFIFT2KMx76gCaZV8taOVProIg6uT3bUikwSGFhA77hLQnnHKf
	pphtK/N4vVRO1osY+Pq7vsUuG6sCeUQ3d796hvBfE2DA4wHgWW1WXWEmaiK63B+S
	JXxpVvYYX1iO+7WnK9wkeAw/wvFoPuLBJdmNn4QHM/+EXzSsEqgDxG4ARamJvdQf
	Kx08ulodgdg3eEHNjLOe8Rizw+vn532ZYwpZF0AMTo185x8CC+DC9Bk53iVckbMi
	iO7Ek8v5HfmV7ZZKEG4cfw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vw043t8yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:27:11 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 16:27:09 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 16:27:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 8DC61820242;
	Mon, 29 Jan 2024 16:27:09 +0000 (UTC)
Date: Mon, 29 Jan 2024 16:27:08 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v2 6/7] ASoC: cs42l43: Refactor to use for_each_set_bit()
Message-ID: <ZbfR3IzRYpP7YCns@ediswmail9.ad.cirrus.com>
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
 <20240125103117.2622095-6-ckeepax@opensource.cirrus.com>
 <CAHp75Ver-NMTtHmeE9+sdnt1FVH2iGhXQxQf21jjDGOn+6mbhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <CAHp75Ver-NMTtHmeE9+sdnt1FVH2iGhXQxQf21jjDGOn+6mbhw@mail.gmail.com>
X-Proofpoint-ORIG-GUID: xb17VPz_JLHetAmvqOmmQH0VUv2Mhr57
X-Proofpoint-GUID: xb17VPz_JLHetAmvqOmmQH0VUv2Mhr57
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2MBC5YNLRX3AFSXW7BLJTN5TMKOTVCM7
X-Message-ID-Hash: 2MBC5YNLRX3AFSXW7BLJTN5TMKOTVCM7
X-MailFrom: prvs=9758a52b9a=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2MBC5YNLRX3AFSXW7BLJTN5TMKOTVCM7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jan 25, 2024 at 09:11:44PM +0200, Andy Shevchenko wrote:
> On Thu, Jan 25, 2024 at 12:31 PM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> Adding nslots parameter is a good idea, but I still think the code can
> be refactored better (have you checked the code generation, btw? I
> believe my version would be better or not worse).
> 
> > +       for_each_set_bit(slot, &mask, BITS_PER_TYPE(mask)) {
> > +               if (i == nslots) {
> > +                       dev_warn(priv->dev, "Too many channels in TDM mask: %lx\n",
> > +                                mask);
> >                         return;
> > +               }
> >
> > +               slots[i++] = slot;
> >         }
> 
>        i = 0;
>        for_each_set_bit(slot, &mask, CS42L43_ASP_MAX_CHANNELS)
>                slots[i++] = slot;
> 
>        if (hweight_long(mask) >= CS42L43_ASP_MAX_CHANNELS)
>                dev_warn(priv->dev, "Too many channels in TDM mask\n");
> 
> The code is simpler and behaviour is not changed.

I don't think this works, the limit here is on the number of
channels not on the position of those channels. The last parameter
of for_each_set_bits appears to measure against the bit position
not the number of set bits. So for example 0xFC000000 would be a
valid 6 channel mask, but would result in no slot positions being
set in the above code.

Thanks,
Charles
