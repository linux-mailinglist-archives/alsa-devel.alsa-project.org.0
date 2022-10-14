Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C155FF203
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Oct 2022 18:06:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C55D46BBD;
	Fri, 14 Oct 2022 18:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C55D46BBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665763618;
	bh=HaUl+E4P4JcAoX3iAG/sHl0oIUv8HrOxx5RX7jsjzIw=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c7weh+s4vGoshDVDNhABnWV9hW2U8+zzz2Mh6AnwNCV4ZxvwImkqY2kwsPhh6XJgx
	 Jfd/lkNysKHL6oS0tlwCoxC6WVu9doCfJlJJKoroR8NdbNikQzXtjdKRPux4QS+pHB
	 z8X8Xq5gDK6IqgufkurO2pf9sX+uHyKA0wM5AR1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 382C6F80240;
	Fri, 14 Oct 2022 18:06:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 096B4F80224; Fri, 14 Oct 2022 18:06:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DA7DF80115
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 18:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DA7DF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="QWQM8sWs"
Received: (Authenticated sender: theo.lebrun@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7655DC0004
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 16:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1665763554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KbUr5+1g6uyXogd2LO8381/uGd3Wc/DWgdFJnEvVUhs=;
 b=QWQM8sWsPOzJ43Wk1PQssk93UMvx5T2SZ9jCnI9pAuqzAXGBe53KL278FXoYLraPTpA18M
 5jDTvnHE+UDxRo3HPmTOKRUJfoIZdjL7BvXQxzcjbPvkibkT4i+fDCxMS+yFWtkLxk+U2c
 r+uJkAQI6iCuhlcBv+giUFMg3/AFIQN0NW8JSDw86KNmDZZ6zfvkVgzie+woUKYSvfthVz
 SWy2gn8sfFYy/FbeLqaafnvjiBGXatqT626UksGf5Bu/bIgM+/FlrbyVdlGiidxt7BWCrW
 YoGyv98wFSBVNNkdw2yM2nLiMnYqcTfYU0gb9c/X8v3A3FIktV9bql0rH/PFvw==
Message-ID: <7fa7f0ac-eebf-2d91-bc25-882e94da83f6@bootlin.com>
Date: Fri, 14 Oct 2022 18:05:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: alsa-devel@alsa-project.org
From: =?UTF-8?Q?Th=c3=a9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: A2B codec chain implementation
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,

Automotive Audio Bus (A2B) is a bus that carries a clock, I2S/TDM, I2C,
GPIO and mailboxes over a two wire connection that carries power as
well. It has a leader-follower (master-slave in the spec) structure,
with no obligation to have all samples going from or to the leader.

Analog Devices sells transceivers, that can also decode PDM inputs.
Their configuration is register based, with ways of accessing follower
registers from the leader. Here is their technical reference:
https://www.analog.com/media/en/technical-documentation/user-guides/AD242x_TRM_Rev1.1.pdf

The goal is to implement support for those, when the host is connected
to the leader. The implementation would be done by registering a new
bus_type and device_type, with a device for each functionality (on each
bus node) provided by the bus. Two issues were faced though:

  - At runtime, when an PCM stream is started, not only do the CPU and
    codec need to be configured, but also the leader and follower need
    some dynamic configuration based on hw_params. We have something
    resembling a chain, and all 4 devices need to be configured
    I2S-wise:
    CPU <-I2S-> leader node <-A2B-> follower node <-I2S-> codec.
    That does not fit the standard form of a DAI link that only has a CPU
    and a codec. Is there a way to have a sound card that contains
    multiple codecs, all actived?

  - Clocks will have to be handled at the bus level and not at the
    soundcard level, as the master clock is needed at all times for the
    bus to be functional. Sadly it's probably not doable to use the
    clocks provided by the I2S/TDM CPU codec (which would be ideal as
    they are audio rate, which is what the bus expects), because they
    only get enabled when a PCM stream is active. On the hardware used
    for testing (SAMA7G54), we can't use an external (relative to the
    CPU codec) clock as master clock and use the peripheral to generate
    the bitclock, it doesn't support it; therefore both have to be
    handled at the bus level using board specific clocks.

So the first point is the main question: how could a codec chain be
modeled?

I was potentially thinking about a custom soundcard? That could surely
help? Would it be the right solution? Any pointers would help.

The clock aspect would have been an issue as a codec is either a clock
provider or consumer but for this particular use it is not as we'll use
the bus and not the soundcard to handle the clock management.

Thanks!

Théo

-- 
Théo Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
