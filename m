Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7B530B22D
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 22:39:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C2C91753;
	Mon,  1 Feb 2021 22:38:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C2C91753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612215547;
	bh=sO70nGecdb88Gg3jvjXkw137cL/n94PWMuO/IlwsZQs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F/jVZtj92UliKODmbFiczPnlHRFJWoqvjvizxa9FJR5pv17UWXrYKwKSp31XB92DH
	 yonsNeSeQoWomeOCJBjMU+yAI2MuJqGQPLizaiJFxGgwwOA9nkGu6AvDvj852IeCeW
	 OlLrcHgNxL6N1rt1mt9L/0hznFkRFXPA10dRPBGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69A59F80152;
	Mon,  1 Feb 2021 22:37:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C05DF80153; Mon,  1 Feb 2021 22:37:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC0B6F800E2
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 22:37:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC0B6F800E2
Received: from artex.localnet ([46.142.75.5]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N0Ip5-1lv3wb2moB-00xG3F; Mon, 01 Feb 2021 22:37:22 +0100
From: Fabian Lesniak <fabian@lesniak-it.de>
To: =?utf-8?B?RnJhbnRpxaFlayBLdcSNZXJh?= <konference@frantovo.cz>
Subject: Re: [PATCH] ALSA: usb-audio: Add DJM750 to Pioneer mixer quirk
Date: Mon, 01 Feb 2021 22:37:21 +0100
Message-ID: <18968431.YylxmPiuJ6@artex>
In-Reply-To: <ed9f5c04-0898-e66d-a7ce-ce161efc753a@frantovo.cz>
References: <20210128160338.dac4vrj7wjiykcxm@base.nu>
 <3031135.XsSY7s2paC@artex> <ed9f5c04-0898-e66d-a7ce-ce161efc753a@frantovo.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:DBoYpnfFFL0Kf6s14G89ICCaIMfpIU/lkefeO3xjwd6pL5yeIUp
 MjZvRxd2M2nHGOYlvkZdalqTe8+jNr3+qFGiYhR8qI0hdsje/s2761IQDE+xAxHM8YEfWXj
 G9Xu/T9IRnNYP+pWcGiV+eLClG6GfGYyWYiJ0cGLiPtJnH7xT19yqxgwOqzRvPXBq8cDpLi
 J2XUB1gsFCrHXM38CGY5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w+swQ2xrS9U=:n+uBbjmDkj8TVuyrbvxVg2
 JWo9Oszi4mpkDq8guV6xZ3X5d9tnre8B6M7irm9i+Mt6XoyaYSa0xHrX0LvrvKoEIcTU32vpe
 YSQCkeGJxChkQk4ITsBi43xB544Bg1gfcqLyASm9rw+68/hJomF5buPDlrixOJykTa8Y825nR
 73Vso4sSe8If3FWCM+xz2neX/0hnIQpa5RR3gmzkcWNgPhCLElCFWG8b+zm7eFmnQ/XGzEf22
 6IDn2jZs1A/I49dZD6KsOkce1nFKPGWjb0CrkHHyWb3fOw2Ake73jfTGgm2nk0UFijxelVM0s
 RaUb/DgJixJCsQPe7YToq9m2Os+NpYXNK4PcEUceI8NXnlCXLFVz9o5yNm3oitXoE3kr3wbgF
 n44UfPlLjJsIl2+qx6a3SEnVJYipAzbNxNrN+AIrayewxkStQ/Zxv1th/DwmK2oeJLSPsyeBN
 PTA86itDfQ==
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Olivia Mackintosh <livvy@base.nu>
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

Hi Franta,

I've just submitted mixer quirks for the 900NXS2, following the design of=20
Olivia and you. Seems quite clean, but if anyone comes up with a clever ide=
a=20
on how to share code between the channel arrays, I'd highly appreciate that=
=2E=20
My experiments so far turned out quite complex: I thought about adding flag=
s=20
like "DEVICE_HAS_DIGITAL", "DEVICE_HAS_AUX" etc. which are evaluated during=
=20
control creation and usage. The code became unreadable and complex, so I=20
ditched that idea. Creating the controls arrays dynamically would maybe hel=
p.

The 900NXS2 uses the same wValue/wIndex as your 250Mk2, just expanded to fi=
ve=20
channels. It does not allow to set playback channels via USB, that can only=
 be=20
done in hardware using the input source knob. I guess that is same for the=
=20
DJM-700. The 900NXS2 allows querying the currently selected playback channe=
l=20
though, but I think this is of no great use so I did not implement it in th=
is=20
patch (although it was in my original draft from last year: https://
gist.github.com/flesniak/074ab23bbc833663b782f44174eae6a4). If you think it=
's=20
worth it, I could have a look at that again.

Cheers
=46abian

Am Montag, 1. Februar 2021, 16:34:29 CET schrieb Franti=C5=A1ek Ku=C4=8Dera:
> Dne 29. 01. 21 v 15:09 Fabian Lesniak napsal(a):
> > In general, I'm wondering whether it is a good way to implement more and
> > more Pioneer devices in such a hard coded way. mixer_quirks.c already h=
as
> > >3k LOC, and the 900NXS2 support will add at least 100 more if written =
in
> > the same scheme. It may be good to either dynamically create controls
> > depending on the model or move pioneer support to an extra file.
>=20
> The original idea was to reduce complexity rather than lines of code and
> keep it straightforward without many IF branching and special cases.
>=20
> Maybe more data/configuration (declared arrays) can be shared among multi=
ple
> devices =E2=80=93 like the capture_level.
>=20
> Does not the DJM750 support also mapping of MIC, AUX and REC OUT or any
> playback mapping? If it would, more configuration might be shared. And is
> it DJM-750MK2 or DJM-750-K? At least the specification of DJM-750-K talks
> about a sound card with 4 stereo inputs and 4 stereo outputs.
>=20
> Does anybody know/have other DJM hardware? Does it use the same codes
> (wValue/wIndex)?
>=20
> Franta


