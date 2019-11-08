Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C786F4CFE
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 14:18:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EE101675;
	Fri,  8 Nov 2019 14:17:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EE101675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573219117;
	bh=5Lh/Zr5I/f+/KQFPpJ1/C2Ibb7WC5F4XwVLskDJ+++U=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pJARFhiI+U5tI5FPf5nPhh4Fx7sr2Hcf/xzSxjK9sIgGqOZ5bLas15yypAtLSumuh
	 YQJ09kUFnYezS22aLi+h9MA944Mat/NvQgDZ49DQx8qRJhM6aKbSHTLTrnCexJ7wTq
	 Csa9ww1UnDE5NWrlkJYok8UkKgoU4bXS4qNLv46Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A016F800F3;
	Fri,  8 Nov 2019 14:16:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 578FFF803D0; Fri,  8 Nov 2019 14:16:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAC19F800F3
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 14:16:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAC19F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="bX5eYgtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573219005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i/TbUweoV5/uy9Gy763L+o22Ekb02/9YtoJz4WXnTUk=;
 b=bX5eYgtnljqkTI279z8XcvAV25w+LI8oWeKxoENNS7Bppc5Rkqmz4i9te0loXsgBB86AP+
 qyN2dcvnHkP8Vrw4D2j/o3lqX2Sfd021M69+1SAmfyvLb6PJNX+5qdSta1peA9yB1I3Tp+
 EVqKqAkQMii03F4QuK1VaUwlIv2tgGU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-NsA5h5qmOUieIUZCqcrtlA-1; Fri, 08 Nov 2019 08:16:40 -0500
Received: by mail-wm1-f72.google.com with SMTP id i23so2314399wmb.3
 for <alsa-devel@alsa-project.org>; Fri, 08 Nov 2019 05:16:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1w7nyntEOMmt0CqjadRMS0k5+0iX+jIntmBEuJO8+Lg=;
 b=HfVylrKO96m1lFITRlRse1I2O69CnL8jo+ZbEni1KTMcwNvJVsbvN27l5RgmPEl7Nl
 zsvnOya2jCy4c1gqyDsxeUD54dszH1VWSINGd33kzuwFZLa7txQwKYHQ8NGkJGxTACi7
 /oU1UPZJRMCuJgLINktnegcZj0nnbTsXEzWff/z9jwoJRpVJSG0G7Lb20vq5TqNqqFIw
 p8uTkkmYh0kuRxkRhEOW3FLjybz7ml6CWtxwDQwwvf5wLnBTPQ1qCdUCzcj7Qm+EJ7WK
 eLQxBA5Xd+0w4NEwxALeX2o6a83B5sQdJL81jrHFSDRxcRiqWG+yH8BEe6ceDaD17JWh
 J36w==
X-Gm-Message-State: APjAAAU1bZIXSYfflgaq/K6G13s11++w5i474M07EUSsxePdpZFHr5Xs
 Lm7KyrzJOQVcG1VkSfg5ppf2wUXKMW38qKYHKlG2eJzz6hwYUAFkw0GZr/Kg82V+gJ0D4P0bCQ2
 LNTFnATFZjNtTkkWMzzcl2WE=
X-Received: by 2002:a7b:c925:: with SMTP id h5mr8865196wml.115.1573218998658; 
 Fri, 08 Nov 2019 05:16:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqx1oYDSViJVQa1iUHqVH3zEYNV052/Mm9/4zhe3K7viwnu+xe9QxZyGoCBT0DbWyAVfenzEMQ==
X-Received: by 2002:a7b:c925:: with SMTP id h5mr8865171wml.115.1573218998419; 
 Fri, 08 Nov 2019 05:16:38 -0800 (PST)
Received: from dhcp-44-196.space.revspace.nl
 ([2a0e:5700:4:11:6eb:1143:b8be:2b8])
 by smtp.gmail.com with ESMTPSA id 19sm8604853wrc.47.2019.11.08.05.16.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2019 05:16:37 -0800 (PST)
To: Ross Zwisler <zwisler@google.com>, Bard Liao <bardliao@realtek.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <CAGRrVHz0LZOXWprAqR+_e59k+NQwiax7je4dSHf85yeHepHV+g@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <093f1caf-dbb7-2d6f-9a1f-af19f4bee53d@redhat.com>
Date: Fri, 8 Nov 2019 14:16:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAGRrVHz0LZOXWprAqR+_e59k+NQwiax7je4dSHf85yeHepHV+g@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: NsA5h5qmOUieIUZCqcrtlA-1
X-Mimecast-Spam-Score: 0
Cc: Curtis Malainey <cujomalainey@google.com>, alsa-devel@alsa-project.org,
 Jacob Rasmussen <jacobraz@google.com>,
 Fletcher Woodruff <fletcherw@google.com>
Subject: Re: [alsa-devel] issue with jack detect using rt5645
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

Hi Ross,

On 11/7/19 11:31 PM, Ross Zwisler wrote:
> We are trying to get a piece of Google hardware which uses the rt5645
> driver working correctly with newer kernels (currently one based on
> the latest v4.14 stable), and noticed that the following commit:
> 
> commit 6b5da66322c5 ("ASoC: rt5645: read jd1_1 status for jd detection")
> 
> broke jack support for our device.  Basically with that patch we never
> correctly see a jack insertion event, and audio is never routed to the
> headphones.
> 
> With just that one patch reverted, things work correctly on our
> system.  The revert applies cleanly to linus/master.
> 
> Here is the series where that patch was originally upstreamed:
> 
> https://www.spinics.net/lists/alsa-devel/msg64331.html
> 
> If we reverted that patch upstream, would it break other devices (the
> "GDP Win" device?) that use the rt5645 driver?

Yes likely it will, the commit in question was added to fix jd
issue in the GDP win and other Cherry Trail devices using
standard Intel reference designs.

> If so, how would you
> recommend proceeding?
> 
> Does anyone have one of the "GDP Win" devices so we can test that and
> our device and make sure whatever solution we end up coming up with
> works for everyone?

I have acccess to the following devices with a rt5645 codec:


rt5645:         Spk     Mic     JDmod   UCM
-Acer One S1003 stereo  ana     3       chtrt5645
-Asus T100HA    stereo  dmic1   3 inv   custom
-GPD Pocket     mono    diff    3 inv   chtrt5645-mono-speaker-analog-mic
-GPD win        mono    ana     3 inv   chtrt5645-mono-speaker-analog-mic
-Kazam Vision   stereo  ana     3       chtrt5645
-Lenovo Miix310 stereo  diff    3       chtrt5645
-Lenovo Miix320 stereo  dmic2   3       custom
-Teclast X80Pro mono    ana     3       chtrt5645-mono-speaker-analog-mic

Which all work fine with the current code, have you tried all the
different jdmode values through the quirk moodule param?

If Playing with the quirk settings does not help, then I believe that
the best approach to fix this is to figure out which bit of the
pre 6b5da66322c5 behavior you need and to activate this behind a new
quirk option and set that quirk for the system in question.

Regards,

Hans

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
