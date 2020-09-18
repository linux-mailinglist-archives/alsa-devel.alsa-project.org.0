Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0EA27019C
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 18:07:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D24216AF;
	Fri, 18 Sep 2020 18:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D24216AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600445276;
	bh=1pPWI3tGqdE3sjl7n8Nkm/Du5Ii/JiP1sJP58en8Fy8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rGK6q3TtDHboqGp5knrobjf2tXRer3cV7jWo4u926R2kib/srgR76I5bmU2Y8OIKu
	 tXDGQFR6pOhdXWd3oXMxp2pzziXGhlF3SX31sNRJngUuwsWPIvl/N/0inpsB7mCSwi
	 9aym4fDrkqvJOW8e1/YAm6QoWuFKZ6UMfvzBXWRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3F6EF8015C;
	Fri, 18 Sep 2020 18:06:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCDF8F800E8; Fri, 18 Sep 2020 18:06:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF69BF800E8
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 18:06:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF69BF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sMuOUFRp"
Received: from [10.20.113.185] (unknown [12.97.180.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 55424206A4;
 Fri, 18 Sep 2020 16:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600445163;
 bh=1pPWI3tGqdE3sjl7n8Nkm/Du5Ii/JiP1sJP58en8Fy8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=sMuOUFRpKhNx62cOeLq8r3XiweG3+oH+HQ5ARJFYrqRwI0rtwsXirIB8NlHDGu75P
 e/thqMV7HSpbh5YQpTfErTaxp2vvG3jgp5HhHsesYWxbd2rtaHY0RNKn6qtsVW1U4X
 2OUqEA6d7Wt97I57tgwnc5CC2ttU5meMjx3RzqU0=
Subject: Re: [PATCH 1/2] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
References: <1600247876-8013-1-git-send-email-viorel.suman@oss.nxp.com>
 <1600247876-8013-2-git-send-email-viorel.suman@oss.nxp.com>
 <20200917071431.GA17970@Asurada-Nvidia>
 <VI1PR0401MB2272659A8126D01D9A53F7C5923F0@VI1PR0401MB2272.eurprd04.prod.outlook.com>
From: Timur Tabi <timur@kernel.org>
Message-ID: <f4d4cd9d-b716-cd7b-da55-7d1a2d003344@kernel.org>
Date: Fri, 18 Sep 2020 11:06:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <VI1PR0401MB2272659A8126D01D9A53F7C5923F0@VI1PR0401MB2272.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Viorel Suman <viorel.suman@gmail.com>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On 9/18/20 9:21 AM, Viorel Suman (OSS) wrote:
>>> +static const u32 fsl_xcvr_earc_channels[] = { 1, 2, 8, 16, 32, }; /*
>>> +one bit 6, 12 ? */
>> What's the meaning of the comments?
> Just a thought noted as comment. HDMI2.1 spec defines 6- and 12-channels layout when
> one bit audio stream is transmitted - I was wandering how can this be enforced. Is a @todo like of comment.

Please don't add comments that other developers could never understand.

The text that you just wrote here would be a great starting point for a 
better comment.
