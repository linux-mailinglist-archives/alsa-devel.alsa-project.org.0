Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B768F7C93E8
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 11:31:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E67A2850;
	Sat, 14 Oct 2023 11:30:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E67A2850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697275907;
	bh=JFTKa1TtV0G1CDm3muLv3qTh3It6MIq3bHvrgqdNSg0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=erWSzJB+MojRBKG3ZUkw8XjcJhFH0TSgil/WTI5iKTIisARa/KWPZMTZjBkuSZZMP
	 Kw6QHaeXQ/gvncbYSOj0VzmRNQx+ZKZIy/zJTOqhPbQlCn9KrdSDMgYIevzkriMrWf
	 Bs1GRxs7QMK6RutMdgeUK6/BIF5gx8mPA91Ah7JY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C604CF80608; Sat, 14 Oct 2023 11:27:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E1EEF80602;
	Sat, 14 Oct 2023 11:27:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBA61F802BE; Fri, 13 Oct 2023 13:25:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.andi.de1.cc (unknown [IPv6:2a02:c205:3004:2154::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09645F80166
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 13:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09645F80166
Received: from p5dc58bc7.dip0.t-ipconnect.de ([93.197.139.199] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1qrGHx-004ueB-FE; Fri, 13 Oct 2023 13:25:05 +0200
Date: Fri, 13 Oct 2023 13:25:03 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: =?UTF-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>, bcousson@baylibre.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 jarkko.nikula@bitmer.com, dmitry.torokhov@gmail.com,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/3] ASoC: ti: omap-mcbsp: Ignore errors for getting
 fck_src
Message-ID: <20231013132503.25d63933@aktux>
In-Reply-To: <db511d14-f2fe-4b4e-bd13-223e7a33f933@gmail.com>
References: <20230705190324.355282-1-andreas@kemnade.info>
	<20230705190324.355282-2-andreas@kemnade.info>
	<7d58d52d-2087-45af-b29e-2515b63ead13@gmail.com>
	<20230920063353.GQ5285@atomide.com>
	<dac768d2-2c66-4d6b-b3d3-d1ef69103c76@gmail.com>
	<20230921121626.GT5285@atomide.com>
	<20231006102348.GK34982@atomide.com>
	<20231006213003.0fbac87a@aktux>
	<20231007062518.GM34982@atomide.com>
	<20231007091156.588d7ba1@aktux>
	<db511d14-f2fe-4b4e-bd13-223e7a33f933@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: andreas@kemnade.info
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: K54OMWQQTT2FHDEXVLW27Q6SPKHJWPPS
X-Message-ID-Hash: K54OMWQQTT2FHDEXVLW27Q6SPKHJWPPS
X-Mailman-Approved-At: Sat, 14 Oct 2023 09:27:01 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K54OMWQQTT2FHDEXVLW27Q6SPKHJWPPS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 12 Oct 2023 17:41:34 +0300
P=C3=A9ter Ujfalusi <peter.ujfalusi@gmail.com> wrote:

> On 07/10/2023 10:11, Andreas Kemnade wrote:
> >> OK good to hear it works, I'll send out fixes for omap4 and 5, seems
> >> the runtime PM warning is something different.
> >> =20
> >>> omap-mcbsp 40124000.mcbsp: Runtime PM usage count underflow!
> >>> # cat /sys/bus/platform/devices/40124000.mcbsp/power/runtime_status=20
> >>> active
> >>>
> >>> even with no sound.   =20
> >> =20
> > Well, it is a regression caused by your fix. Without it (and not revert=
ing
> > the already applied ignore patch), runtime is properly suspended. Don't=
 know
> > why yet. =20
>=20
> I guess it is because of the pm_runtime_put_sync() in the
> omap2_mcbsp_set_clks_src() around the fclk re-parenting.
> That is a bit dubious thing for sure. We need to disable the device to
> be able to re-parent the fclk but if we disable the device it is going
> to be powered down, right? I think we have appropriate context handling,
> so it might work, but it is certainly not a rock solid code... If you
> have a stream running already, you don't really want to kill the McBSP.
>=20
Ok, so if the device is powered of at omap2_mcbsp_set_clks_src()=20
we get the usage count underflow, and the counter is incremented
immediately again in the runtime put function. So things get out of balance=
...
I'll check Tony's fix here.

> The problem is that this mux is outside of the McBSP IP, so we need a
> system level (iow, clk API) way to change it runtime.
>=20
> What is the machine driver where this happens? If you set the sysclk in
> hw_params of the machine driver, it will be OK, but if you do that in
> probe time then it is likely going to fail as you experienced
>=20
As you see in the other patches of this series,
it is a simple-audio-card with a tlv320aic3x codec
in combination with the mcbsp.

Regards,
Andreas
