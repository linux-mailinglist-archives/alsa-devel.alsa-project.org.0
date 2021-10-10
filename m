Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C281B42808D
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Oct 2021 12:42:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56FDE1689;
	Sun, 10 Oct 2021 12:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56FDE1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633862523;
	bh=sitD1RLXHWtKjd7jVzsaGvhnXnA5aLUFEMdxXa/HKZA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EKOpy/Cc80ve2hYrJBE8v4yotuKlTe93ENlLdbBfwun8VKvh/LzqfOHAIqqYSqK/B
	 ezbNX41CuPfPGFYK+nTczM4Y/zl61CpYMN274qrNGgX1yQ+YqwTNnz4/vyw9meOoQa
	 ygUaE7gZqpcCmeufCOaKdryi5E0JrBoecSZkdTyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC2CFF80212;
	Sun, 10 Oct 2021 12:40:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEDEBF801F7; Sun, 10 Oct 2021 12:40:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 040D0F800F0
 for <alsa-devel@alsa-project.org>; Sun, 10 Oct 2021 12:40:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 040D0F800F0
Received: from bagend.localnet (86-126-20-31.ftth.glasoperator.nl
 [31.20.126.86]) (Authenticated sender: didi.debian@cknow.org)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 7B7CD1C0006;
 Sun, 10 Oct 2021 10:40:31 +0000 (UTC)
From: Diederik de Haas <didi.debian@cknow.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: simple-card: Fill in driver name
Date: Sun, 10 Oct 2021 12:40:00 +0200
Message-ID: <5069869.zQgEQKRxDW@bagend>
Organization: Connecting Knowledge
In-Reply-To: <61a82214-0de8-816f-ff63-3979b86343bf@perex.cz>
References: <YNGe3akAntQi8qJD@qwark.sigxcpu.org> <4974503.Y8KB3sNASq@bagend>
 <61a82214-0de8-816f-ff63-3979b86343bf@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart9604810.WXvppzzZfE";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
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

--nextPart9604810.WXvppzzZfE
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: simple-card: Fill in driver name
Date: Sun, 10 Oct 2021 12:40:00 +0200
Message-ID: <5069869.zQgEQKRxDW@bagend>
Organization: Connecting Knowledge
In-Reply-To: <61a82214-0de8-816f-ff63-3979b86343bf@perex.cz>
References: <YNGe3akAntQi8qJD@qwark.sigxcpu.org> <4974503.Y8KB3sNASq@bagend> <61a82214-0de8-816f-ff63-3979b86343bf@perex.cz>

On Sunday, 10 October 2021 10:40:09 CEST Jaroslav Kysela wrote:
> > Unfortunately this change broke multichannel audio on my Rock64 device
> > running Debian. My Rock64 is connected to my AVR (Pioneer SC-1224) via a
> > HDMI cable.
> This looks like an user space configuration problem.

I have placed ALSA card definitions (I think) from LibreELEC on my system from
https://github.com/LibreELEC/LibreELEC.tv/tree/master/projects/Rockchip/
filesystem/usr/share/alsa/cards

I have just prepended "LE-" and appended ".bak" to those files and rebooted and 
that resulted in only "output:stereo-fallback" profiles.
Just like in what I considered 'failures' that I tracked down to this commit.

So it appears that LE's card definitions *gave* me multichannel output, whereas 
I wouldn't have had it otherwise. 
It also explains why the sound issue occurs with LE too.

Note that I took/used LE's work as 'inspiration' to improve things on Debian.
Their work seems very good to me and one of their card definitions was also 
referenced from (kernel) commit 25572fb5aa986bdbb35d06c0fb52a9b9d9b3b2c9 
titled "arm64: dts: rockchip: enable HDMI sound nodes for rk3328-rock64"

> if a PA profile or an UCM configuration is used (in the PA debug log).

While I don't consider myself clueless wrt Linux (running Sid for 10+ years), 
I am clueless wrt how ALSA/PA/audio-in-general works (on Linux).
When I do 'journalctl -b -u pulseaudio --since="2021-10-10 12:00:00"' I get a 
lot of output and also several 'errors', but I have no clue how to interpret 
that. I also get that when AFAIC (from a user standpoint) everything 'works'.
So I'd need some help with that.

I could attach output of (several runs of) "journalctl" and f.e. the output of 
'alsa-info', but I haven't yet as it may not be appropriate and may also no 
longer be considered a kernel problem (and the 'To:' list is (far) larger then 
I'm used to). So I'd need some guidance with that too.

Regards,
  Diederik
--nextPart9604810.WXvppzzZfE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCYWLDAAAKCRDXblvOeH7b
bhY0AQCQonSziFIkdstiX3euzGfJ/VA3DGwfPowhsWaKGS3xXwEA1GuxWxCPsYrj
fxWSnqQiikaZvAB1joo64fn0IKyH5Qw=
=blow
-----END PGP SIGNATURE-----

--nextPart9604810.WXvppzzZfE--



