Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F714C4FB7
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 21:35:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C1E61EDD;
	Fri, 25 Feb 2022 21:34:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C1E61EDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645821348;
	bh=uoXQ1debS+H4xXZqIAR56nVJFXjinPrThr0EZu70S2U=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=p5y873mibDs4z8kS/q8Cyg/nTklyW+iWldgLvRp104EyKMfuUc/OTvv8P+4TCVQ6e
	 YZL6ALN2UoBjJXbo+odddBLWVKmS8gJtJY6dNNYT/DMnIq8CEeskUnWylxwFlhrPrk
	 r1/ap1nDPzuH2mnQwCg/g+KqeUL9BYFy3Cvo+O88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A70CF80159;
	Fri, 25 Feb 2022 21:34:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30BE8F80132; Fri, 25 Feb 2022 21:34:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-40141.protonmail.ch (mail-40141.protonmail.ch
 [185.70.40.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB29CF80118
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 21:34:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB29CF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="QuF6Jbrz"
Date: Fri, 25 Feb 2022 20:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1645821269;
 bh=uoXQ1debS+H4xXZqIAR56nVJFXjinPrThr0EZu70S2U=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc:Date:Subject:
 Reply-To:Feedback-ID:Message-ID;
 b=QuF6JbrzzhCDEhLznOA0euWLX6CHoBMsawai8C2ptpt+aacYNlIkzYqJ9JJ/TlbiR
 Z8G92u3q0Jgf5/tet+T49KQ3pRBstybt43C+g4S0l5lO4uYHjvh5KwKWR9hK9r9UAG
 /MFYDUEQnyTQzTAvUf0Ey/NBQNlw8Ipt+ZNKjLfNi9XdEW+9A4g+0hQZO7kx+fSUGd
 qOwh5Zfm8N7AsdZe8kBGQCaa2ePnQfc4zp3DOVfXJrJ7L8lSLiKe90IX34o/B9HvB7
 CN1pSDyIji+Z+dqJSifV6vC7WH6WljFWUQrREbeR+JyY2AdR6rf5n+5zXj5W4fV4aw
 g5Snzg+vNRVwQ==
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Aidan MacDonald <amachronic@protonmail.com>
Subject: Need help understanding DPCM
Message-ID: <SvMkvfzxuNa8gYMrFFKa5NabdAfGl9KboEp0tD0D1u284QLgNObnyHcBkLONXpIlX8OC7OZ2yEkjrxUqlApZk4dWc_tbyKfUWRRi0CFx_dg=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Aidan MacDonald <amachronic@protonmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi all. I want to extend an existing ASoC driver (jz4740-i2s) so it can be =
used with an external (discrete) codec; currently it is hardcoded to use a =
SoC internal codec. I'd like to be able to switch between the two codecs at=
 runtime.

Switching between the internal and external codecs is done by toggling a bi=
t in a register. The switch determines where the I2S signals get routed: to=
 the internal codec or the external one. Because of this only one of the co=
decs can be used at a time.

It sounds like I need DPCM to handle this sort of thing - I have a single F=
IFO on the CPU for audio data (an FE DAI?) and it can connect to one of two=
 codecs (the BE DAIs?) via a switch. But most of the drivers I see using DP=
CM look way more complicated: big DSP chips, and CPUs with a lot of DAIs. I=
 am having a hard time separating out the essential bits from the overall "=
mess." The documentation is not very helpful either.

Could someone helpfully explain what a (presumably) very basic DPCM setup f=
or this situation would look like? Or is DPCM overkill - should I be doing =
something else entirely? I want to do this the "right" way so I can send pa=
tches upstream.

If possible, I'd like to use one of the 'generic' audio card drivers like s=
imple-audio-card. BTW, what is the difference between simple-audio-card, au=
dio-graph-card, and audio-graph-card2? They all seem to do very similar thi=
ngs and share a lot of code.

Thanks!

Best regards,
Aidan
