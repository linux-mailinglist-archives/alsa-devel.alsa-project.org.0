Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E0863943E
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:01:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D84D17F8;
	Sat, 26 Nov 2022 09:00:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D84D17F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669449696;
	bh=7vY1oRHvWX2z8ha1+wPrjMKMWdl008t36kDC82qVHIg=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IST4jAkYU0KKrZTCtUQ3Rb3OPQes2OMmT3OVZ/m+TivpuxK0ohwfvK48RjVUdRHMw
	 LONasIOFDEV1feLrCEecrjijkYGn0JHMYTH8KyhNyc7Y+n3FFi+6d3vQMS4Ebal6Nm
	 Om2Uhvqt+Q6sD9VEJ6XifLnyujoUgquouxow0qSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27C6CF8057B;
	Sat, 26 Nov 2022 08:58:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0D8EF80431; Thu, 24 Nov 2022 10:57:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FAD4F8014E
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 10:57:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FAD4F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FsQyigU5"
Received: by mail-yb1-xb2a.google.com with SMTP id z192so1316197yba.0
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 01:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r/inbI+y1fhrxyLW9sS+q/7x6KkspXDB7h9KT6wBhFI=;
 b=FsQyigU5X9Bj9xZiNwYg2vk1ek0GVhZG+zbSZ3vYiapFPlAQUN1xt3rSqtvzfV2J0o
 xn34AJ262EZYn2nnGIyRHGnlUbJL/Ecj+cE9/nguY3T/aDuwKpTUmTkCIShYtgNJoqJ6
 S+oSflzGcP2f6TMQwdf/Uqc3W+iufoDZ5qIrmRnn+wEJIxLZcDcvcGWYSRe8V3BNRzgl
 X5pfGd6YRxRlZWJBqxbiE5b9oBOh4m/QQneZJjN5a90umabI+6XNKCBALBGTsy86LiFl
 yhS7VqlNE1bn/uB9f0sMRct+oHhUAme3rh1NsgpPJVtF+ukY/BxuBNM+1XHkuRQJo8J9
 n07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r/inbI+y1fhrxyLW9sS+q/7x6KkspXDB7h9KT6wBhFI=;
 b=L3aBx1iydN9xYILSHuyJGwqfjefyBVKHH+YitWihbIRzHLxhI7vUcvdpi44Bu8nk6G
 aPyNFOZASizaHCCd8p27XHzAegIbykZOClqcqE+LkQCJHkFccvfTuQXrOt0BCucO06PJ
 PtWDFbQRbKsHiauX8qDZN7j6XOQUQGrRSP4F2TrufZWgCL9ZNXKkE60AOG0Y2Sf0mZl0
 jV5E6lQh1vuKpiJ+1L3jEwedak0C8uPjRix5aKtmCvBvVlV63vUNppzJW6QA9qD92ifC
 tUFjUZLtPevhETulL6q+AGUVETT+QwVw+th5tH6X0z11m8UnXWdLvdEK40x2jrZEV4Zj
 zacw==
X-Gm-Message-State: ANoB5pnxRdmJy5O63uMDz5KyoxFHcqEl9snl0uJtwnoR+DNDKOe1fjkb
 T5AVd90FiH/yhm4RHzIl4DiKMGDPEAVNC3QM7+Y=
X-Google-Smtp-Source: AA0mqf4qkrdY9iSNek494zZjiqDs6tUrY9sSvGelHCP42eGUIvgdfUL9wM1QFB3i6woY0JwsbG4QB5ulMunhWiUYhGg=
X-Received: by 2002:a25:f302:0:b0:6dd:4825:ba8f with SMTP id
 c2-20020a25f302000000b006dd4825ba8fmr30016399ybs.103.1669283865119; Thu, 24
 Nov 2022 01:57:45 -0800 (PST)
MIME-Version: 1.0
From: Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>
Date: Thu, 24 Nov 2022 10:57:34 +0100
Message-ID: <CABDcavYdsk-O4x3oPX4i4+T5wsoZV26_kpEq6JvpD8A_cAGHxg@mail.gmail.com>
Subject: SOC_DOUBLE_R_SX_TLV controls broken in cs24l51 driver
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:51 +0100
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 James Schulman <james.schulman@cirrus.com>,
 =?UTF-8?Q?Tan_Nay=C4=B1r?= <tannayir@gmail.com>
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

Hi all,

I am using a dev board with a Cirrus Logic cs24l51 codec.

This used to work fine prior to kernel version 5.x, however after 5.x
it is not possible to set certain values for ALSA controls from
userspace.

I believe this is related to the input validation that is mentioned in
this thread: https://lore.kernel.org/all/Yph8C3bRxcr6ogW7@sirena.org.uk/T/,
and possibly in this commit: 4f1e50d6a9cf9c1b8c859d449b5031cacfa8404e
("ASoC: ops: Reject out of bounds values in snd_soc_put_volsw_sx()")

For the cs24l51, all the controls that fail are using the
SOC_DOUBLE_R_SX_TLV macro.

I have traced this to the checks in snd_soc_put_volsw_sx, specifically
the (val > max - min) check:

pr_warn("Max: %d, Min: %d, Value: %d", max, min, val);
pr_warn("platform_max: %d", mc->platform_max);
if (mc->platform_max && val > mc->platform_max)
{
    return -EINVAL;
}
if (val > max - min){
    pr_warn("(val > max - min) check failed");
    return -EINVAL;
}
if (val < 0)
    return -EINVAL;

According to the datasheet of the CS24L51, section 6.13, page 61, the
PCMMIXX_VOL registers accept the following range of values:

Binary Code / Volume Setting
001 1000 / +12.0 dB
=C2=B7=C2=B7=C2=B7 =C2=B7=C2=B7=C2=B7
000 0000 / 0 dB
111 1111 / -0.5 dB
111 1110 / -1.0 dB
=C2=B7=C2=B7=C2=B7 =C2=B7=C2=B7=C2=B7
001 1001 / -51.5 dB

Minimum value is 0x19 (001 1001) corresponding to -51.5 dB, then there
are 127 possible gain settings from -51.5 dB to +12.0 dB, in 0.5 dB
steps.

This is declared in the driver as follows:

SOC_DOUBLE_R_SX_TLV("PCM Playback Volume",
CS42L51_PCMA_VOL, CS42L51_PCMB_VOL,
0, 0x19, 0x7F, adc_pcm_tlv),

0x19 =3D min value
0x7F =3D number of gain settings

This seems to be correct according to the semantics of the
SOC_DOUBLE_R_SX_TLV macro as described in commit
34198710f55b5f359f43e67d9a08fe5aadfbca1b ("ASoC: Add info callback for
SX_TLV controls").

However, the (val > max - min) check in snd_soc_put_volsw_sx fails in
the above example because val =3D 127, max - min =3D 127 - 25 =3D 102.

So I am not sure how this should be fixed. Is the SX_TLV macro being
used incorrectly here? Is the check in snd_soc_put_volsw_sx wrong?

Any pointers are welcome.

Thanks,

(If possible, please CC me in any replies)

Guillermo Rodriguez Garcia
guille.rodriguez@gmail.com
