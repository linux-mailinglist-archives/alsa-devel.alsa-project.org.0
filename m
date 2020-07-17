Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ED3223BDD
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 15:03:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF97A1661;
	Fri, 17 Jul 2020 15:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF97A1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594991016;
	bh=dt+aLEsN1HJT5FCKs8xziB2emE9jkxQQFp3CtZVsb1I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jGuEHHfUjpcA0U59+5aSncGf4LMjlmCe2wS8JwuXauZlfY7RXYpYBczXU+zpXJqMJ
	 c1JmwjZ3q+AvPH9Fk/vEYB0pqTb/WdISd4WzOC6Rh5uar6B1OD5T06IKfpHJFT+yOM
	 1ZYDbFFkvT5VBzZqrg+ZgIOwmN3ZNc3OpWyRRMQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09B90F800E4;
	Fri, 17 Jul 2020 15:01:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EE85F80217; Fri, 17 Jul 2020 15:01:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74FCAF800E4
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 15:01:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74FCAF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DN0doYbH"
Received: by mail-lj1-x230.google.com with SMTP id j11so12496068ljo.7
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 06:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D636UYH9q2nc7cxHlnlJgw1dqlyfEa9LcotE89FcVwk=;
 b=DN0doYbHyifJvdfCKNtbIyNTHicWJfkCmL0WRzxMhVAzDDDn3N2y4MauyTJuQUCMxU
 10G7scwmT8VIl7U9xB3xyxxiGtocUo1DI0nekvgeQzvO8yQpnPzwkD1fburGE1sRKa1T
 LXDpqQkJcXH/b7rTk0AJG1zXxYkWVMZJcvTdpQ5bnbj4gTGoggW0sC6TQw6jc1G8YheR
 695S5VQgrY7BjrcSlfgZAKJbXdsa6OHyDkpO/8b62W0yneNbB+nxPS8t0hhtoE1AgZoO
 dnoCgIIvKy7v6LY2PvEEzRvrlY3bQd7eIuYSzSDDZ2fHuZczQFHO4VcSP9k1dvR7nSco
 WNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D636UYH9q2nc7cxHlnlJgw1dqlyfEa9LcotE89FcVwk=;
 b=T2V3EPTF8z+K/siw9pojqV0XBFJuNGrCz2XXpZkN12HEIetewTUF5Qt9M4wQmnls+U
 3jdVayPc0JWU7Eg6nshw6J49il0PH3Wm0ruqdFOUwoTfj0mZcqUriQUDTjEfWrQXWZRM
 0AHOSeeLcvD0mKjHwwTQ/CJSOet6+f0YF/kXVhIJfKM8ojRxFBHnMWo4Oz/kc48ty/rM
 1vMEY7+/VrjNX7EoO/DhlxpaAhFnXd6D6C4SoEYyiwV/VIAGuoNbDveoE6DyzMjcP6EJ
 5kxJB/v9lhgU0ZqrFlyEkq8iNv2yqEtZsptG8up+mVnIoRR6dOg7eaTUZEa34VuD9lg0
 HSOw==
X-Gm-Message-State: AOAM5311c68vtj990q3UTdlexKIRzYnqZDPgqFMWF13Xl6rqhdH1HQbu
 gtJvK90uJMBgua64GwTOhmtdrddhOWItXSmSh4Y=
X-Google-Smtp-Source: ABdhPJwJ07w5QwIu+B7pa48+qJMS2Q4MeqDQwpp0mSPktPlzORp3V8pZ+Xix+npfpwA8dP9ZnGwHAdBVdkOLNo+gmJA=
X-Received: by 2002:a05:651c:544:: with SMTP id
 q4mr4777046ljp.310.1594990901605; 
 Fri, 17 Jul 2020 06:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5Bhhcmm6ex0nP6MnYq0Uf8EMYCMMFOMav-fCrVJvOY+vQ@mail.gmail.com>
 <87o8of2gb8.wl-kuninori.morimoto.gx@renesas.com>
 <20200717112332.GB4316@sirena.org.uk>
 <CAOMZO5D1BMjNcf-2z11uzCc46yCA2-GTWh+V28Y7WhrSAM_+Cg@mail.gmail.com>
In-Reply-To: <CAOMZO5D1BMjNcf-2z11uzCc46yCA2-GTWh+V28Y7WhrSAM_+Cg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 17 Jul 2020 10:01:30 -0300
Message-ID: <CAOMZO5CjMa0JHfSrMdntmj1_gHoZoqsJhdjU8xR9-1LPupcDAw@mail.gmail.com>
Subject: Re: wm8962: error at soc_component_read_no_lock
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Fri, Jul 17, 2020 at 9:52 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Fri, Jul 17, 2020 at 8:23 AM Mark Brown <broonie@kernel.org> wrote:
>
> > Right, IIRC the wm8962 had some registers that weren't accessible all
> > the time and possibly also some volatile bits - the driver will need
> > updates to handle things better for these widgets.
>
> Thanks, Mark.
>
> I instrumented the code to print the register names so we can see
> where soc_component_read_no_lock fails:
>
> [    6.010526] ************ register is 512 (WM8962_GPIO_BASE)
> [    6.014540] wm8962 0-001a: ASoC: error at
> soc_component_read_no_lock on wm8962.0-001a: -16
>
> [    6.030852] ************ register is 515 (This register does not exist)
> [    6.034806] wm8962 0-001a: ASoC: error at
> soc_component_read_no_lock on wm8962.0-001a: -16
>
> [    6.162651] ************ register is 48 (WM8962_ADDITIONAL_CONTROL_4)
> [    6.166524] wm8962 0-001a: ASoC: error at
> soc_component_read_no_lock on wm8962.0-001a: -16
> [    6.174911] ************ register is 48 (WM8962_ADDITIONAL_CONTROL_4)
> [    6.178779] wm8962 0-001a: ASoC: error at
> soc_component_read_no_lock on wm8962.0-001a: -16
>
> Charles, Shengjiu, any suggestions, please?

If I move WM8962_ADDITIONAL_CONTROL_4 to the non-volatile region, the
two errors related to this register are gone:

--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -149,6 +149,7 @@ static const struct reg_default wm8962_reg[] = {
        { 38, 0x0008 },   /* R38    - Right input PGA control */

        { 40, 0x0000 },   /* R40    - SPKOUTL volume */
+       { 48, 0x0000 },   /* R48    - Additional control(4) */
        { 41, 0x0000 },   /* R41    - SPKOUTR volume */

        { 49, 0x0010 },   /* R49    - Class D Control 1 */
@@ -790,7 +791,6 @@ static bool wm8962_volatile_register(struct device
*dev, unsigned int reg)
        case WM8962_CLOCKING1:
        case WM8962_SOFTWARE_RESET:
        case WM8962_THERMAL_SHUTDOWN_STATUS:
-       case WM8962_ADDITIONAL_CONTROL_4:
        case WM8962_DC_SERVO_6:
        case WM8962_INTERRUPT_STATUS_1:
        case WM8962_INTERRUPT_STATUS_2:

Is this a correct approach?

Thanks
