Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 402182227B5
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 17:45:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6EAB84D;
	Thu, 16 Jul 2020 17:44:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6EAB84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594914322;
	bh=ei4gBjfdAtk+hxlbKLfG/Ki7E6MgOCTpRvL1S5fCnyM=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k08eaZdR656kXMOEAgkzVB2hkMQA0srCRePINb9bNkhbS9MwyWZkzewhqvZNAfFxA
	 phbCSpcPmoC1SXsZBMNfHqH5hBeKz90lU5zGnF79dSglPwkMsjSNhIV4PtL7rYk15s
	 ygHXAIxCe/JGLM2qvsQLVv9a9hjKsNdxCD/Xnq4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 739F9F802E9;
	Thu, 16 Jul 2020 17:40:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86C0FF801EC; Thu, 16 Jul 2020 13:49:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B9C3F8014C
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 13:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B9C3F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rCwFb7kg"
Received: by mail-wm1-x343.google.com with SMTP id w3so11305568wmi.4
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 04:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=yfbzLHHcXrWqLy0p2f9WLJbzwEat6UUwiUFItT++s0M=;
 b=rCwFb7kgVyJSCd4OZIYO2btf/9sxzypDeCAzFC2W+oN+yF4GDR60mvZsGmXQKJ6hEm
 nzy+adXMh2SeEzYD5taL9P4WuPfTWHPGgiDTLzwn23scQZD3QuxcdIDGdfaVozEM9bba
 WQqujfP5eUlLE24haAD1Jn+QfimAyVW1Ct5iJbx2H7ox6kmHltGmXQSBWv7Ct2wmVVqA
 P8BEgeExHFIu8BE2Lvk3vRnmD10gdP0dAoMJ7ez4cRwUxOY6Xa7JE8ijFTvc1ckTz83F
 d+zFUCzzPr+nlXJGKL8mzjIJ6whQXEcDVq4PNE5VQmGWjiyYiY4nxgOtcwdKSNgbrHz9
 5YJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=yfbzLHHcXrWqLy0p2f9WLJbzwEat6UUwiUFItT++s0M=;
 b=GjgfRLxqiZsrXhjvdm/mbLJDDbxhRVxbaxkcW05th8CHkPl7d9klB1BaC3/7fqRZI/
 NPktAS8a2ovXPcrwoPHsFahrmh6WeTVfBjoTk0pmNsORpTPPEJc4RAiEZvUFyo9Tvnjy
 3GfDM7aHNzUkOQL5SxCE+qeZgTOHqMzhDR7MJrfQCH/jKe6pZ2LtjV1k3Gw2uIQNwcUl
 ADUaemqh1nDNGCEz9GY0+5OGo8uGLDi0uhE+sNI8+87nHI28nzN/AzE8fDWIdKDJbcR8
 I9MrRAV5Nl08kiUItzvQZ00UpIdOzrH5v8mOWfUcwQ/UCziMVDhJ9cBi6qleJJzxfYqm
 dI3g==
X-Gm-Message-State: AOAM533i54aXflXJeoaA6u28a1WEFm4e22gXljq9bFd1dMzCXNpVRwVZ
 TN2TZ8eeKFheQHT68o4FL5w=
X-Google-Smtp-Source: ABdhPJw0OtWlYMt7xDWjMv8pWSP74h3A1lsoV4P/FVFzX+6kZb91pM40rn9jF9vo7hHlub3nWJ6AHg==
X-Received: by 2002:a1c:9a06:: with SMTP id c6mr3826398wme.23.1594900175364;
 Thu, 16 Jul 2020 04:49:35 -0700 (PDT)
Received: from [192.168.0.74] ([178.233.178.9])
 by smtp.gmail.com with ESMTPSA id v12sm8835593wrt.31.2020.07.16.04.49.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2020 04:49:34 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Subject: Speaker pops with max98357a on rk3399-gru-kevin since v5.7
To: Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>
Message-ID: <f2ca985f-7dbd-847a-1875-dd0e1044ef02@gmail.com>
Date: Thu, 16 Jul 2020 14:49:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 16 Jul 2020 17:40:15 +0200
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-rockchip@lists.infradead.org,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>
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

I have been getting "pop" sounds from the speaker on my rk3399-gru-kevin
for a while, and bisected it to 128f825aeab7 ("ASoC: max98357a: move
control of SD_MODE to DAPM"), but looks like the pops were somewhat
expected:

On 12 Feb 2020 13:55:15 +0800, Tzung-Bi Shih wrote [1]:
> Possible drawback: may generate pop noise when BCLK=on but LRCLK=off.
> As the datasheet[2] mentioned:
> > Do not remove LRCLK while BCLK is present.
> > Removing LRCLK while BCLK is present can cause unexpected output behavior
> > including a large DC output voltage.

[1] https://lore.kernel.org/alsa-devel/20200212055517.122728-1-tzungbi@google.com/

As of v5.8-rc5 I'm still getting the speaker pops. More info below, but
not all pops coincide with "set sdmode" messages, and vice versa.
Reverting that commit stops the pops, but then the "Speakers Switch" can
no longer mute the speakers.

I don't really know much about these things, could anyone have a look at
it? I'll try to read relevant documentation and code to make sense of it,
but wanted to send an email in case there is an immediately obvious
solution (besides reverting) and maybe just nobody had the time to
implement it yet.

Thanks in advance.

---

I've experimented a bit on a Debian userspace (with #define DEBUG 1
to get sdmode messages), here's what happens without PulseAudio:
- When playback starts, speaker pops with "set sdmode to 1".
- During playback, toggling "Speakers Switch" sets sdmode to 0/1 and
  mutes/unmutes speakers without any pops.
- Pausing/resuming playback (like seeking on a media player) make pops
  without changing sdmode. Also pops when playback ends (e.g. when
  "speaker-test -l 1" quits).
- A few seconds after playback ends, speaker pops for the last time with
  "set sdmode to 0".
- Within that few seconds, toggling "Speakers Switch" sets sdmode to 0/1
  and makes a pop each time.

It's mostly the same with PulseAudio but:
- Pause/resume during playback doesn't make any pops.
- The penultimate pop happens a few seconds after playback stops, when
  PA says it's suspending the max98357a device (no sdmode changes).
- The final pop comes a few seconds after that (still with "set sdmode
  to 0").

Even without any playback it makes several pops during boot when e.g.
PulseAudio starts/stops running in the display manager or in the user
session.
