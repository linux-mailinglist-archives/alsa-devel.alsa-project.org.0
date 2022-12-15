Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EE364D955
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 11:15:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8A5B2129;
	Thu, 15 Dec 2022 11:14:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8A5B2129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671099300;
	bh=WgYuRX18jkeCrtH9knZbT61VJPwb3C7IWOPKtqoabwU=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=L4F32RIb5BRdAjV25rtCOwpHbxP0zebp9q8bA80cNVht/YQBfKprouPLVeQpvANMB
	 bBOz+yJ9Nf3vRARbUd2XoEUs/h9dcLh4NZM7eWVAGFcrZZLtKqmRBCeHEMKLZFvzvZ
	 cTFsnVG+BOqVzC+9KPLrfklSdkHi4YFfrmYUgFD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ABDDF80141;
	Thu, 15 Dec 2022 11:14:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F014EF804E7; Thu, 15 Dec 2022 11:14:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07A17F801D5
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 11:13:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07A17F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=lzzDYrDu
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BFA8v1K008119; Thu, 15 Dec 2022 04:13:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=Un3qCBxpCzido0mQnarkArNgTyyWKhnUSal2XP1EUNo=;
 b=lzzDYrDuG05Zvlx77Kxo+7HMLjQt1P/bb6ZJ7UWrKgDb52nfK1qhs3m7tfiLrj05UEW9
 3O38UpM9A15DMsZBB9ep5NK4mIMFhMYDNpVN8BinGJxwc7+z56IpAx3AJO6LTPQF/ILK
 Traf9uRmhG2/cuz7dwfdlRZ6G1NsLXX9+X01lP7WPyn6fvpLEeNw2a5nl1GS+bdW30Ts
 Y4Qu+kn/snemPnGxc67Knjsd5KcvQYYAGo02w4ji8st72QdrqEgj0AEaS7387MZX2/ki
 2uhjU4KProe2/m+xgpzbnoZfgOV4ZDoPakBLmDCoKAHeGzYPxVA9CblU3pgo4iBlAiIE xA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3mf6rw9fne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 04:13:56 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Thu, 15 Dec
 2022 04:13:53 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Thu, 15 Dec 2022 04:13:53 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D2F6011CB;
 Thu, 15 Dec 2022 10:13:53 +0000 (UTC)
Date: Thu, 15 Dec 2022 10:13:53 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH v2 2/3] ASoC: wm8940: Rewrite code to set proper clocks
Message-ID: <20221215101353.GA36097@ediswmail.ad.cirrus.com>
References: <20221214123743.3713843-1-lukma@denx.de>
 <20221215093615.3794156-1-lukma@denx.de>
 <20221215093615.3794156-2-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221215093615.3794156-2-lukma@denx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: tpQK4WjaN9ppPmobgYMS1GO9dUJSfxvG
X-Proofpoint-ORIG-GUID: tpQK4WjaN9ppPmobgYMS1GO9dUJSfxvG
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Dec 15, 2022 at 10:36:14AM +0100, Lukasz Majewski wrote:
> This patch enables support for internal wm8940's PLL and proper
> divider to set proper value for 256x fs clock.
> 
> This approach is more flexible and replaces hardcoded clock
> values and makes the codec work with the simple-card driver.
> Card drivers calling set_pll() and set_clkdiv() directly are
> unaffected.
> 
> For the reference - code in this commit is based on:
> "ASoC: wm8974: configure pll and mclk divider automatically"
> (SHA1: 51b2bb3f2568e6d9d81a001d38b8d70c2ba4af99).

Minor nit this doesn't quite match the commit <12-chars of SHA>
("<description>") format in Submitting-patches.rst.

> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---

But the patch looks good to me:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
