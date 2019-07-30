Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4353E7AD8C
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 18:30:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9C2F17C1;
	Tue, 30 Jul 2019 18:29:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9C2F17C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564504224;
	bh=7y+ofwM6bCdOAg946cxnKv7WBi6+wrCMnlqF0cK3T4U=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dzzz4fdPE6zE+6gwSEnYbfkrchx+HYz1M68+6tM+Iz55h7Ie3dfSkH8jeXCteT6RQ
	 8jW/85yHdB9eqv6tk1dujwrl25fjM2lt4xNY+XOnQ6HA32rbJH7akxOSKa6rGTkRkA
	 rVkN2IdmCoX3LVVmaTCrtJs8vNg5qaeZkA4SAUFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE98EF804CA;
	Tue, 30 Jul 2019 18:28:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFD22F804CA; Tue, 30 Jul 2019 18:28:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E873DF800BF
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 18:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E873DF800BF
Received: from [167.98.27.226] (helo=[10.35.6.253])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hsUyy-0002cI-8m; Tue, 30 Jul 2019 17:28:12 +0100
To: Mark Brown <broonie@kernel.org>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-4-thomas.preston@codethink.co.uk>
 <20190730141935.GF4264@sirena.org.uk>
 <45156592-a90f-b4f8-4d30-9631c03f1280@codethink.co.uk>
 <20190730155027.GJ4264@sirena.org.uk>
From: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <9b47a360-3b62-b968-b8d5-8639dc4b468d@codethink.co.uk>
Date: Tue, 30 Jul 2019 17:28:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730155027.GJ4264@sirena.org.uk>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Annaliese McDermond <nh6z@nh6z.net>, Marco Felsch <m.felsch@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [PATCH v2 3/3] ASoC: TDA7802: Add turn-on
 diagnostic routine
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 30/07/2019 16:50, Mark Brown wrote:
> On Tue, Jul 30, 2019 at 04:25:56PM +0100, Thomas Preston wrote:
>> On 30/07/2019 15:19, Mark Brown wrote:
> 
>>> It is unclear what this mutex usefully protects, it only gets taken when
>>> writing to the debugfs file to trigger this diagnostic mode but doesn't
>>> do anything to control interactions with any other code path in the
>>> driver.
> 
>> If another process reads the debugfs node "diagnostic" while the turn-on 
>> diagnostic mode is running, this mutex prevents the second process
>> restarting the diagnostics.
> 
>> This is redundant if debugfs reads are atomic, but I don't think they are.
> 
> Like I say it's not just debugfs though, there's the standard driver
> interface too.
> 

Ah right, I understand. So if we run the turn-on diagnostics routine, there's
nothing stopping anyone from interacting with the device in other ways.

I guess there's no way to share that mutex with ALSA? In that case, it doesn't
matter if this mutex is there or not - this feature is incompatible. How
compatible do debugfs interfaces have to be? I was under the impression anything
goes. I would argue that the debugfs is better off for having the mutex so
that no one re-reads "diagnostic" within the 5s poll timeout.

Alternatively, this diagnostic feature could be handled with an external-handler
kcontrol SOC_SINGLE_EXT? I'm not sure if this is an atomic interface either.

What would be acceptable?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
