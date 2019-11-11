Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5F3F6E0C
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 06:26:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A3B41671;
	Mon, 11 Nov 2019 06:25:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A3B41671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573449985;
	bh=1Yn4//I6GyFcLnF/KORS87hF0PbQVIr5X9/3Idlz2zU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O4CE9DmvpuYnr40CpYahES90NmndZMLPodkwXYOmDkARDa9p9FuolapNpZCAfMaPy
	 h9s60YOUdbiSBru3SIGHgYW7CIy0UN0YrMyuwQreRsE+r4DM4bbpd3QUzicwg+5SzS
	 Q9zCYzVmuscksVBwVlJ/XPp6OhgWzVuuwWnlFF9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3521F80506;
	Mon, 11 Nov 2019 06:24:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FF1CF804FF; Mon, 11 Nov 2019 06:24:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_13,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB09BF8015C
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 06:24:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB09BF8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=accosted-net.20150623.gappssmtp.com
 header.i=@accosted-net.20150623.gappssmtp.com header.b="ayc+8Ce+"
Received: by mail-lj1-x244.google.com with SMTP id y23so12296033ljh.10
 for <alsa-devel@alsa-project.org>; Sun, 10 Nov 2019 21:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=accosted-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8AXbit/pMrjvlNl3mkjRRb/oZ1xVYakBZFTsndCJK5M=;
 b=ayc+8Ce+jXYF5BC9RVXIGoGY7r8UpXaDGtAyD/vYAymTILWGjnjOfS/hG+Uu+HoZUw
 wt+K5mjD2K8E86tkw+t54bKxU+uJblC++HeMG/ZFMTx2x4nn/KAmrOTdDbAygFgjiYml
 IvZjoI4VXlyCr4XaM4agHH/zjF3gGYeJInaZb/OfW1YfRuF64u3djFbwszA8JCZHAfQY
 pOpShOGygkE1xlIrE/V3mKdTXxVNUtIdXP3nEdnszG4Hu5YvohUvRf4dZ+X/jnX2Anw8
 /KwI62J/L5qp7aI4B+nxzztNj0TNeODrbe/3j1twCCSTOmEe25U5FQc7244O4a+4s+O0
 N0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8AXbit/pMrjvlNl3mkjRRb/oZ1xVYakBZFTsndCJK5M=;
 b=b3ZM8kFudR+S/Ejqzotl7sYfL4Zval5iupI81jJJ2zKrBD3iADmjiYEDxHdlGsaiWl
 FMsjXKb1vtoFSd5no62O/ez8rXs6d2qHmXXsw74Uxrm2/gwtG8vVNw+tb0URjFNh/sED
 Ha/0s4WS+vjnDqWqew8X0NAtyvRBJrbU8K2vikUSxUBmCYZGXWxealWqAmrm6kDThHG+
 wjcpGK+J3LmhIS8UpcM6j3MxyL92vlDgbgjwhjdg7KVUEPaVt2ntoYlsQoDc+TjhzL5c
 Ux5NbUijEdHmq9HzvFCG73r6L68LL8/gfDcThxxemp57Gy/ihoUUH6ZFZ5t57RRCc9xR
 o/NA==
X-Gm-Message-State: APjAAAUE6lhgUSfrccO0tXU9yyXHrTkO9mUa+oWSRxLJ74c9iau98ozH
 czNRA657hRP5vEHBAcXJ7Pficf8pewjI2LGuFUxCQQ==
X-Google-Smtp-Source: APXvYqz3aNbz1CXQlhR0mc0xzJTwwBPUdocnHA8r+1NuP4iKF+qFOsnsTyJC3K5+Ym5DaqhzM3JCvNb+5dK3JhVKgE0=
X-Received: by 2002:a2e:558:: with SMTP id 85mr14866856ljf.67.1573449871808;
 Sun, 10 Nov 2019 21:24:31 -0800 (PST)
MIME-Version: 1.0
References: <20191030122124.GA7218@sirena.co.uk>
 <CACuU-+jRNgQbdhvQfqikkhGYiAOyeBkzZyDsBtb=uwA95JEe7g@mail.gmail.com>
In-Reply-To: <CACuU-+jRNgQbdhvQfqikkhGYiAOyeBkzZyDsBtb=uwA95JEe7g@mail.gmail.com>
From: Arun Raghavan <arun@accosted.net>
Date: Mon, 11 Nov 2019 10:53:21 +0530
Message-ID: <CACuU-+ixghwBaAh57HdQ7DcWYg9W=m5Vum1AjuiNB3jWkTRU_A@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Patrick Lai <plai@codeaurora.org>, Daniel Baluta <daniel.baluta@gmail.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [ANNOUNCE] Schedule for 2019 Linux Audio
	miniconference
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

On Wed, 30 Oct 2019 at 22:51, Arun Raghavan <arun@accosted.net> wrote:
>
> On Wed, 30 Oct, 2019, 1:22 pm Mark Brown, <broonie@kernel.org> wrote:
>>
>> Hi,
>>
>> As in previous years we're going to have an audio miniconference so we can
>> get together and talk through issues, especially design decisions, face to
>> face.  This year's event will be held on October 31st in Lyon, France,
>> the day after ELC-E.  This will be held at the Lyon Convention Center (the
>> ELC-E venue) and will be free of charge to attend, generously
>> sponsored by Intel.
>>
>> The plan is to gather at 9am and start once enough people are there and
>> ready.  I look forward to seeing you all tomorrow!
>>
>> The agenda is looking pretty full now, what we've got so far is:
>>
>>  - Introductions (me)
>>  - Use case management enhancements (Curtis)
>>  - DSP framework integration (Liam)
>>   - SOF integration with ACPI and DT (Daniel)
>>   - SOF support for non-modular drivers (Daniel)
>>    - Gapless compressed playback (Patrick)
>>   - Soundwire status (Liam?)
>>    - Multi-CPU support
>>    - Mixing with HDA/I2S in a single system
>>   - PCM issues (Patrick)
>>    - PCM device volume control
>>    - Attaching timestamps to buffers
>>   - kcontrol issues (Takashi)
>>    - Standardization
>>    - Confirmance testing
>>   - Virtualization (Liam)
>>   - User experiences (Jerome)
>>   - Unified graph (Patrick)
>>   - Componentisation status/plans (Me)
>
>
> Unfortunately my talk at GstConf (on compressed offload with PulseAudio/GStreamer!) is tomorrow, so as much as I'd like to be there for practcially every topic, I will likely miss a bunch of stuff. Hope were able to capture detailed minutes like the previous years.

A bunch of folks had asked about this, the talk video is now up at:
https://gstconf.ubicast.tv/videos/gstreamer-pulseaudio-and-compress-offload/

Comments welcome!

Cheers,
Arun
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
