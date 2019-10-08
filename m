Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6389BCF807
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 13:24:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E320D165D;
	Tue,  8 Oct 2019 13:23:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E320D165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570533875;
	bh=Oc8QDrGkKgGbNmSrOjXuY1a4uovS/0QsZM3F7VENYxg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GN3hVHbyn+VaMieevXQ/m2W717SFycOkeS5acVNjYCoWa/bKMoOX3DmyeLojhgi3F
	 feA9l/TTZCPKF9oE30VcUoZyfyCqlyP8foBfnckh+KbiZtR6YkHw5XszVGDoJ5Ecvp
	 tngMsk4dl1iTx+ic/1Jwpg0hNt/wa6Fk5hI/wbnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 321CBF8045E;
	Tue,  8 Oct 2019 13:22:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 331C7F8038F; Tue,  8 Oct 2019 13:22:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B858BF80113
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 13:22:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B858BF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="cX3T49ip"
Received: by mail-ua1-x942.google.com with SMTP id w7so5043170uag.4
 for <alsa-devel@alsa-project.org>; Tue, 08 Oct 2019 04:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9DelI9l/tPyAatXsWxEA7ENrUJpqr9VtyvJyQnqibnU=;
 b=cX3T49iphc+chTagMvbhQO9sgBWLKcMGvB9GLyNSvJfQb5dpu/xYat4l0/DeEEjKd9
 kGi3R1eJ4X4q6XuZUtXSN6RV7Pd8GSuVHDqbjzo29Hq5lUJ/vADsWtrXePo/p7ub7YLM
 Zd8U1Zeu7bwglxWAtakrznQ2SAdWU590wbX3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9DelI9l/tPyAatXsWxEA7ENrUJpqr9VtyvJyQnqibnU=;
 b=nhniW66BIqfnsQsRja1Vf3hDEh4Ge/x8A0jdvoqrV35DZjNnfx1I3xIsqXxO0ltkyb
 PP5Yt4muOpMxmH2PKFBug6BnnbjPr9QDXvbrMARMMQH4Qb4DiNGPKjC2b0PF0+9B8og3
 F/SxKXJGGmeJk6WZckm24u0f7cicutStyXOO6IycZh7PAhg4i3Uka6ndiwZ5HExwDbC+
 QVKKasmtnOfMRq4LevDALzPfkoxPIh+xoD4Kj5wgNOV1LH/Q2VI8kuf/E3W8TunWUTFO
 1NQa1PRwVDLOPXQKIy2yTCOyMfr/vOnzh2ix58uW56vVSoCPZlTgv082jSck+JmGNp9Q
 KeWA==
X-Gm-Message-State: APjAAAXeIYLKQI/oi5eeHH/fIAxEKEKAJAEXdTeietDfCoavY/+hWbLp
 No45NIIw0u6UNVEjveWUZK4XkweiDswAO6l9LidLBw==
X-Google-Smtp-Source: APXvYqxVXmqBWjJSOraQJMkFXrwKR/cFFqHn0ndgDqwfeU8P2uMUu/Ahr2H7X/M1cFJLJR+2VksCMa4m74odQ/jVx+c=
X-Received: by 2002:ab0:5e85:: with SMTP id y5mr6888802uag.55.1570533763652;
 Tue, 08 Oct 2019 04:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <8f933cee57fc4420875e1e2ba14f1937@realtek.com>
 <20191008105138.GC4382@sirena.co.uk>
 <CAFv8NwJ+g+ESJJ5JxaLHADhBASKsjTE7pqY=HhcZZcT2Yy+Ygw@mail.gmail.com>
 <20191008110643.GD4382@sirena.co.uk>
In-Reply-To: <20191008110643.GD4382@sirena.co.uk>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 8 Oct 2019 19:22:17 +0800
Message-ID: <CAFv8Nw+68LkmCmPnq5+rvf3Ffnh1kRROdjrx=nN8tgMTGEq+xQ@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, SteveS.Lee@maximintegrated.com,
 George.Song@maximintegrated.com, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 pierre-louis.bossart@linux.intel.com, "M R,
 Sathya Prakash" <sathya.prakash.m.r@intel.com>, jinho.ahn@maximintegrated.com,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 Dylan Reid <dgreid@chromium.org>, "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1011: export r0 and temperature
	config
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

On Tue, Oct 8, 2019 at 7:06 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Oct 08, 2019 at 06:59:57PM +0800, Cheng-yi Chiang wrote:
>
> > The calibration data (R0 values and temperature) were measured and
> > written to VPD in the factory. When machine driver initializes sound
> > card, it reads the value from VPD and uses the exported API to set
> > calibration value for codec. The purpose is to protect speaker. This
>
> So the VPD is not part of the CODEC?  One question would be why the
> CODEC driver doesn't directly read this information.
+Maxim folks as they are also interested in setting calibration data in driver.

Hi Mark,
The VPD is not part of the codec.
It is a binary blob in system firmware where we can store important
information per-device.
The calibration data is written to RO section of VPD in the factory
during calibration step.
The codec driver is not suitable of reading this information directly
because the string format written into VPD is customized per board.
For example on cml_rt1011_rt5682.c there are four R0 values for four
speakers, and one temperature values . So in this case, there are
totally 5 values in a VPD dsm_calib key. In VPD, the format is like
"dsm_calib"="0x00278F09 0x00251E1B 0x0021AFE6 0x0022720A 0x0000012E"
We put all the information into one string to allow arbitrary
calibration data needed for smart amp calibration in the future.
On other system using smart amp, there might be two speakers, with two
temperature values..etc. The format will be changed accordingly.
Number of temperature values depends on number of temperature sensor
available near the speakers.
Since machine driver knows the combination of speakers and the
available temperature sensor, we think that machine driver is the
better place to put this per-board logic.
Thanks!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
