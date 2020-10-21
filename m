Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0715B294ACF
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 11:52:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93699172B;
	Wed, 21 Oct 2020 11:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93699172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603273967;
	bh=oPQhGn9w1nGr0cozowNbvQ7iwFqbq1n9DsbXP9WfbVU=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KF4CjSm2/dVQ/KEanItP4iZ6YJhm4gmEwh0TtgEuIicADtuwjT1T2tLj4lAbJCw7X
	 Vxc5HURXIHQ0U6fWgX1Z50FMxX8FNnEWgAzdTe0w4DM38wsi9P6zX1E1RubVoih5AY
	 l+nmkJjd9e40IYQv+5wbT+P61kHfihvAp9EGOA1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DF2FF8011C;
	Wed, 21 Oct 2020 11:51:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 249BCF80264; Wed, 21 Oct 2020 11:51:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from omr.mail.isx.net.nz (omr.mail.isx.net.nz [111.65.230.130])
 (using TLSv1 with cipher ADH-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB86AF80111
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 11:50:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB86AF80111
Received: from [192.168.1.210] (unknown [27.252.196.81])
 (Authenticated sender: eliot@blennerhassett.gen.nz)
 by omr.mail.isx.net.nz (Postfix) with ESMTPA id 61B59AE660A
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 22:50:48 +1300 (NZDT)
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Eliot Blennerhassett <eliot@blennerhassett.gen.nz>
Subject: dapm, device tree, clock control - questions
Autocrypt: addr=eliot@blennerhassett.gen.nz; prefer-encrypt=mutual; keydata=
 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
 qoaBAZrJutMr3qtEjA==
Message-ID: <e0e695de-cbb3-58c4-cc4f-49faa1e7333c@blennerhassett.gen.nz>
Date: Wed, 21 Oct 2020 22:50:47 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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

Greetings,

First the basic questions, so you can quickly stop reading if this is
not your thing.  Background details follow. Specific answers, or
pointers to relevant reading both appreciated.

1) How do I force a DAI clock to keep running even when no audio is
streaming? Can I do this with DT, or some runtime switch?  OR how do I
disable dapm so everything is powered on all the time?

2) Two devices: one DAC, one dumb digital audio transmitter both
connected to same serial audio data - how to model the second one in DT
(or not)? it has some settings needed after clock starts, must keep
clock running.


I have host CPU imx8mm

DAI is sound/soc/fsl/fsl_sai.c

The codec is sound/soc/codecs/ak4458.c

The digital audio transmitter is CS8406 (no driver yet?).

Both the above are connected to the same DAI signals (MCLK, TXC, TXFS, TXD)

CS8406 needs MCLK before it can be configured, and loses config if clock
stops.  Currently it is configured via I2C from userspace, but this is
completely unaware of stream stop/start.  Is there a way to hook into
stream state events so that this setup can be done after the MCLK starts
before audio starts?

I desire for no discontinuity in analog or digital outputs as streams
stop and start.

I have read
Documentation/sound/soc/dapm.rst and its brothers.
Documentation/devicetree/*
is there elsewhere I should read to get a newbies intro to this stuff?

It must be about 8 years since I did any ALSA development, and then I
wasn't in the ASoC space, so quite a learning curve here.

many thanks

-- 
Eliot
