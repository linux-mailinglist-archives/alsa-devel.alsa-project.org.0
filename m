Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 250D9227271
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 00:42:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B354E825;
	Tue, 21 Jul 2020 00:41:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B354E825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595284935;
	bh=uNNT8JtJvtLpWMRVzssfYsOaESN4ASu9B1lx3s8VPXo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AEQBug/92zrBeDSgve81eTCD5od6WXS8qy7Q3bYOoKhLgx42Lv+T0GC5JC+4ucUPc
	 hnKYrVebcqTizhBiWxVYAFeuiANc/TB8XUSv0UqpR3NnTP1QSBPcvCTyvDhIEGpOfR
	 MpxDLUn7PThmjr29yiakT3w+XNBydhjgEg4G7GC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FA56F800E0;
	Tue, 21 Jul 2020 00:40:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81359F800F5; Tue, 21 Jul 2020 00:40:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,PRX_BODYSUB_10,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76693F800C1
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 00:40:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76693F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Y54+52P/"
Received: by mail-wr1-x431.google.com with SMTP id b6so19312777wrs.11
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 15:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tdzStXPHhn/lPCcmGPCaBvtaXY8ZKM9Cp45GAKfxt9s=;
 b=Y54+52P/XnjtilisJNCnGinNUWBD1b9Cvz+O4isdAveWxDMPbnyfUL7l8PH2vQGasT
 vl3INNIKsFFzrET9BFHvb+Ue0N3aZ4z75lX0PzZpTLERLsjAXYUd84XeeCJt+whtg/n+
 AzY6AQ64NTNFlEgiVdsU6QsgFUBdbR2SjY+cAGcED1wahHvRR8vY5/ICQ9L4an3LDNVC
 /k3EpFMu853pFmtQOWpfE/xLcgBsChLYtYfh1k2d+lqevnP98D0iDMW/11k5723XfJlD
 MuEksnUiyX+c/oF2wwGA43PgPCDU027fBzfMN8/XRYzdP+waUPU1Zvxwrg0fvUn05JNG
 1PBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tdzStXPHhn/lPCcmGPCaBvtaXY8ZKM9Cp45GAKfxt9s=;
 b=CPkZ6avxldC9v6ZFHzVoQbUu7OligiIDXfrllLE7YP6g8GD1Vlca2bCmXDmMCDqNM3
 4odnBMe1IgBtqhpe3V1xSAXE7J/VOCNL4mokEJ4ILkqM/7ZxYZ+yVgBNttFx2xRjgRQo
 EbSBAA7egrgVlVd9vJ97kXs6MckuwjRgehtnvWxTje0B+bZqmxRHEAqlEQ847Fy0MCty
 I80hZ7+ZXGSb7Jf+jhj6SnRaZVU1vKH2bTYKHZm372MENVg6xtFvb/7/MrH/+oI4RnqS
 nBO7eW5VpFPas6JwwOthyHSrWr8VpWuW7P5LtWdzK2JRzDadRcJYxcILsBb+LlFXpAXx
 ZJ2A==
X-Gm-Message-State: AOAM533Hs+wnLgqjNEn0Jgk+zxxjXUaQb/f9Ox8MrLjsfhLljx8TOjRK
 7fOGfo5nL8hBKVpHXTjQ6CE=
X-Google-Smtp-Source: ABdhPJxMuvjHZthcawt8WUmiSHPwNllUGkXx5YnfTh7/mggvie8pQKteaMNu69ak3ikuRjX9cBkcVQ==
X-Received: by 2002:a5d:4bc4:: with SMTP id l4mr22765783wrt.97.1595284819931; 
 Mon, 20 Jul 2020 15:40:19 -0700 (PDT)
Received: from [192.168.0.74] ([178.233.178.9])
 by smtp.gmail.com with ESMTPSA id i67sm1153944wma.12.2020.07.20.15.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2020 15:40:19 -0700 (PDT)
Subject: Re: Speaker pops with max98357a on rk3399-gru-kevin since v5.7
To: Tzung-Bi Shih <tzungbi@google.com>
References: <f2ca985f-7dbd-847a-1875-dd0e1044ef02@gmail.com>
 <CA+Px+wU1S1EqtW-yZH9z9aCF3ggSriBqy73SRYy8q61x0GkdQQ@mail.gmail.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Message-ID: <846feea6-e2b6-3a0e-b05f-d70e898f9ea5@gmail.com>
Date: Tue, 21 Jul 2020 01:40:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+Px+wU1S1EqtW-yZH9z9aCF3ggSriBqy73SRYy8q61x0GkdQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>
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

On 17/07/2020 05:27, Tzung-Bi Shih wrote:
> I am not convinced the pop comes from 128f825aeab7.

Maybe some pre-existing defect in rk3399_gru_sound got exposed by
128f825aeab7 or the machine driver needs some changes to complement
that commit?

> (I don't have a rk3399-gru-kevin so I got another test machine with MAX98357A.)
> (I was testing with and without an audio server.)

Your observations are also a bit different from mine, which IMO also
suggests the machine driver is the true culprit -- I'd guess the pops
you hear would be from a different problem in your test machine's
machine driver?

(Let me restate my observations to contrast with yours, as I feel my
previous explanation was too wordy:)

> Observations:
> - I can hear the pop either with or without 128f825aeab7 (with and
> without sdmode-delay).

I never hear pops without 128f825aeab7, but always hear pops with it.
(no change when I remove "sdmode-delay" from the device-tree)

> - The pop noise is not always.  Higher probability after stopping
> playback than before starting.

I always hear one pop when starting playback, and two pops (with a few
seconds between them) when stopping playback.
