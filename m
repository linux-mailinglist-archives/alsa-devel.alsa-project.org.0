Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B3A70153
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 15:42:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CED817CD;
	Mon, 22 Jul 2019 15:41:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CED817CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563802969;
	bh=0GQBq2ltiu5w/luz7AtchpbYfcNmRs7epB74dlTuNKc=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ON6SYbZ0Wh95Us+YPAW7Cvk08ZI+yZVJJGqhUQ2QBi8P0ZIanfD4Ej+3Quq/zJmFq
	 iEQKVU+JRE+r9brFl319gCtxY4pd14yDIxgxLmQyoUiHl1a3koEHyh+mnzkMFpzBKz
	 82MyxvttyIR+LIs9yNoEXg+EiKCEGe+4ItdqmR1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE72FF803F3;
	Mon, 22 Jul 2019 15:41:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3535F803D6; Mon, 22 Jul 2019 15:41:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from node.akkea.ca (node.akkea.ca [192.155.83.177])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D231F8015B
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 15:41:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D231F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="b0Aw88nL"; 
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="rCmnGnT6"
Received: from localhost (localhost [127.0.0.1])
 by node.akkea.ca (Postfix) with ESMTP id 08F964E2006;
 Mon, 22 Jul 2019 13:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1563802885; bh=IacJxPGvijdjYD5rOT0Om29cf7LCqZ+St1BExi/2B8s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=b0Aw88nLtuPyJUV4OlFyN7WeI8WBMk3d8fS659/ydi0kUAyjs6MLe9oZ2b9V+X/5/
 KFM8RQpkbnI0VhalN6c53ysX4Acr6uZtvJjBy25bMWR7QyglUt7ps6D/FX41CJHpHZ
 k5vJCpUdbHSO9F3S2PTwPSerMARgEOVvFKK6R7Hk=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
 by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JTJGuKubOCW3; Mon, 22 Jul 2019 13:41:24 +0000 (UTC)
Received: from www.akkea.ca (node.akkea.ca [192.155.83.177])
 by node.akkea.ca (Postfix) with ESMTPSA id 9E1C14E2003;
 Mon, 22 Jul 2019 13:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1563802884; bh=IacJxPGvijdjYD5rOT0Om29cf7LCqZ+St1BExi/2B8s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=rCmnGnT6OT8ze+jSOby/5pNMMavQxOKJpjKzDOT3/IWT+grGPMWN11LFT0Z2s7Oma
 Ujly7yEu3b+MIjwco9KYj3rMBeeVPyXH8GRKsbQVL7j+ymMnli/ZyXrVJFVyiMiO9v
 Q18HJWd43Yu0nXXB2+zI15ZTaIKsq+Q6gNgC4vz8=
MIME-Version: 1.0
Date: Mon, 22 Jul 2019 06:41:24 -0700
From: Angus Ainslie <angus@akkea.ca>
To: Daniel Baluta <daniel.baluta@gmail.com>
In-Reply-To: <CAEnQRZBXjXPq6UL2tPshOtoRu4SJ3XZ8DRVnw13fyi3SL_EqXA@mail.gmail.com>
References: <20190717105635.18514-1-l.stach@pengutronix.de>
 <20190717105635.18514-4-l.stach@pengutronix.de>
 <18b4d49b410248766e834f3a0444e106@akkea.ca>
 <CAEnQRZBXjXPq6UL2tPshOtoRu4SJ3XZ8DRVnw13fyi3SL_EqXA@mail.gmail.com>
Message-ID: <0b25c90b0a9bd77849ae76e1fe06340e@akkea.ca>
X-Sender: angus@akkea.ca
User-Agent: Roundcube Webmail/1.3.6
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 patchwork-lst@pengutronix.de, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: fsl_sai: add i.MX8M support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Daniel,

On 2019-07-22 03:39, Daniel Baluta wrote:
> On Thu, Jul 18, 2019 at 1:36 PM Angus Ainslie <angus@akkea.ca> wrote:
>> 
>> On 2019-07-17 04:56, Lucas Stach wrote:
>> > The SAI block on the i.MX8M moved the register layout, as 2 version
>> > registers were added at the start of the register map. We deal with
>> > this by moving the start of the regmap, so both register layouts
>> > look the same to accesses going through the regmap.
>> >
>> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>> 
>> checkpatch has a complaint about mixing code and device tree bindings.
> 
> Hello Angus, Lucas,
> 
> What imx-sdma firmware have you used to test this with linux-next? I've
> finished my changes but aplay gets stuck sending the first audio frame.
> 

I'm just using the ROM firmware, I have no additional firmware in the 
filesystem.

Angus

> Daniel.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
