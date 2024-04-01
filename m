Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CABA2893A71
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:54:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18A0122CB;
	Mon,  1 Apr 2024 12:53:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18A0122CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711968841;
	bh=Q7GANCjRh80CQba/fnfSkuitQ921ge7SCfNK5HAY0M0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xec1vnyywftx6m5SWySebcius1AWlVyjNxDNKPsGLLNLDA1aer+e9fkVEKT0jDYW0
	 KUpKCYXymVILU8iN85YZJT3LYe1mlHGzG9ubQFTOn7uBexaUrPx6MyoiypYqMz5LhF
	 5pVeq+sKawWjSg94E+/JUp6iKc1xSBxP/M46QRfg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79892F805A8; Mon,  1 Apr 2024 12:53:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD4ECF805A8;
	Mon,  1 Apr 2024 12:53:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4A97F80236; Mon,  1 Apr 2024 12:53:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD97DF8016E
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:53:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD97DF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=M2K7sYih
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711968799; x=1712573599;
	i=oswald.buddenhagen@gmx.de;
	bh=Q7GANCjRh80CQba/fnfSkuitQ921ge7SCfNK5HAY0M0=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:
	 In-Reply-To;
	b=M2K7sYihKjG+8cIA97ntUSZQ1+eDnSJ0WshAbPY9aS8r7mgrDwYitOjjIPcC+cjc
	 jNvy7O/7KOBJN4XuTu3ZkogIALDw05SD+4H966iUzKHo8IFhzfNcqAM/I11RYmLay
	 CDHDDaT5rU3wm4oLC3rpr0Ac095AIUfGLkpUlBsog2KgzBVWJ9iquNBSpE3YLp7E2
	 hY4F2KB2QHSx3bo+MoFsJdopcpuwO5rdmgAW/fFhkBFneZdtAkGqbTb/TKq8K79SA
	 MSALcOBku1VcV9b8e7hqEDXMl3zMxxWACCXtrJ5c9JMgShRZcYfg7zF13YSP7X9I4
	 NrHJcRmM3sg40PWBIw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mj8mV-1sW4Lb3zRl-00fAFx; Mon, 01
 Apr 2024 12:53:19 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrFHy-8Oo-00; Mon, 01 Apr 2024 12:53:18 +0200
Date: Mon, 1 Apr 2024 12:53:18 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: aaci: report FIFO size in frames
Message-ID: <ZgqSHq6obzwRDfXs@ugly>
References: <20240401101339.506625-1-oswald.buddenhagen@gmx.de>
 <ZgqNFjOU4mpcyHH8@shell.armlinux.org.uk>
 <ZgqOZ0B8h3l48aoh@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZgqOZ0B8h3l48aoh@shell.armlinux.org.uk>
X-Provags-ID: V03:K1:Ckpwp+QOLc/GeweA2QbRt8uN4qvDmxMlJ4OZpO9vKRO/+d572rS
 BVspTz2AazZkopZrpyMDwTK354nNA4qhgGTBDMAbX4s76O7DCyxPUR/NvCFEo4cb/365Cxb
 GYMQeyt1I7xOjsmv1bvClOI5H2JRc+cK8vcu8ubZybsvLoFDzuwajP3RDudFgW3shJI+ols
 WaJUhZqFEzSkwb9ltR0cQ==
UI-OutboundReport: notjunk:1;M01:P0:7ctv/T8clqU=;b+KFrxJQItXkXrFK9OEdbfzxFrP
 EAFg7oeiwOaMM3AGBr77b/HTndIHhNIzSAQwt86ZmFFu/EBbQSM2L21fPcL3SIBkdWvocp29n
 bTFC5xk1SMUswwz661m2H51EqoD3av66PYHMEszDN+zBKoWx3SrMfhQcC8GfmjP1BOz3/LqkQ
 YGJQGLycWah0BMkDDVcOgTMht+qq96RzEaUUd9nddIkIAmpdBTIR16/6S0flfov3iykFU05Ve
 hf1Kz2hnialw3ChedtdUMaZ/Rz3sg8kq5323ytDt2B0XUYu4tzEx38yJ/49TIHEFKfNJiLeaE
 sQCEVBolH70VEU1bVoR/fCq0BCC/2bVThBfv76Q5vq7xdBfT7od876dD96axAT33po0Vc6Ws0
 2NE+j0cB/OoC/o+fgxaBNZhGggmj/A9QqFlh2+L/3mxwj6eB5Dt1yq3kAGGvXd1wZUlQlqV73
 sUtXhlSkN1/cOUD9Pc8ZhmbFypHXyO9WCTz8jUEp1r0mWDFxApExqelqzoLE8Q6aZPGyhBQW1
 YrgamKes50hIUF+CJP8G368WEPGumeqFC27R5LY9sR6LA2Deq+I+OIeVqhUbjrpExBRI8rA5a
 VMfrj7z2pgQM3e5XKTdUe1YQ0/turUFHJCYIFcxx4gdbK/QVOlQwbu2gi+P9+DyFM0I+D3dZ1
 wJ+m2XxKl4B8+CWOdHxLlJS47x8XG3m1XzemCclPje51c2G50wnCpm71E03GOYjtSbLozGSlK
 eYGBe5qJT3GrmRjuQQdaGSjZw22e+TaTnUvvk7D6gGm1gL4xnShlsphIcy1hGSiEPcOLlo0Jj
 IQopkgogaHsDbahHDB0ZK/+pJNg1oVMgg/7i3kRVG4Fg8=
Message-ID-Hash: OV7UXT6ZEBXYJNVTRPKQZGOXOJ6C7DIE
X-Message-ID-Hash: OV7UXT6ZEBXYJNVTRPKQZGOXOJ6C7DIE
X-MailFrom: oswald.buddenhagen@gmx.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OV7UXT6ZEBXYJNVTRPKQZGOXOJ6C7DIE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 01, 2024 at 11:37:27AM +0100, Russell King (Oracle) wrote:
>runtime->hw.fifo_size is only measured in _frames_ if
>SNDRV_PCM_INFO_FIFO_IN_FRAMES is set.
>
yes, which is exactly why the other hunk in the patch sets it.

>So now I have to ask what caused you to generate this patch. I don't
>think you've actually run this driver, so presumably it's by []
>code inspection...
>
yes, it was a random find while trying to make sense of this parameter.
