Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1898E2FB1
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 13:02:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77AA61678;
	Thu, 24 Oct 2019 13:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77AA61678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571914923;
	bh=JUKa33v9GVuR4xaBxaw5r235Eb9N0BjAbRRKl5ik9zE=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GjOUEbLmo4d6yxyVQMGRha4ocj/ev8EyK3Of+tQQ7P4DLfOOxWfzWwkeVO4m7qjq7
	 atcs4rHrN/MvsnnSPeKOy3gO5yH1Oy8Vw8a6i4Dq+Uxp9jHMZ0KxkU1p/YVnePAc/a
	 FHIK0M0RmOJpFKUoYrlrheyqBt3+82UIU05srQu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D496F80377;
	Thu, 24 Oct 2019 13:00:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3846AF8036B; Thu, 24 Oct 2019 13:00:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A23A8F80112
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 13:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A23A8F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Iiz/V/ju"
Received: by mail-qt1-x843.google.com with SMTP id w14so37163157qto.9
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 04:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=7+Voo40EgrPJBrysTn6cMHnvtdyMKzOWHVBla1sz2y4=;
 b=Iiz/V/juk/Tk6cXqCxH69/S4zqlhPJ1AAUaht727tjqpdXs1KmhTNUi65GKb71utnD
 py6ARNDxwNnzhfEx+8zUoIUl564j84enJXvbTQiatP6BxdWaQTWVE2ywMiOunTEAWOxn
 JPlWRJb2pIiRdrkx6winTL1XswBxMl2kgtU2rnFPPrVOVNs5Y1L3tQoTPnWLv2E8MurU
 M2/7GllnXfuuIqIIFoXWufGdsofl63bNasP6OgkCCpX74WU4+WyGTpHL5wvHE3VSzizf
 ORUBskJsCfwVHJNV2/P0/K5Ol9fplOhfU+OWATZ6oHXOgx7Au+nAhwh7YasZuymQ9pjV
 JKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7+Voo40EgrPJBrysTn6cMHnvtdyMKzOWHVBla1sz2y4=;
 b=cDPTZotiB3hYS0iJkxBOPpd3pE7FQ+MD0iwjl4GN6Zu0qnkdTPV7v8ahTLC5q41Iye
 EwnC5Iax2RqzbQLC82h3zYnR3aUbrG0WjTviJWr0lTVuZ1YlZMkfoIVyVtIIpOXxmvxD
 9nxX2/SupXjJTd4tlNebLeWF8aNOPKZZXtrsWrU0ZoC9NkEGgYKADrIs86GGn3599UXI
 wwo1Wk3OkV2CDFy8OP4OwYeUfuFAZ+0HaeyYHRO3YPdTO2247xbg6xd1sK0Z1i3kK/AN
 ClzsA435pq64x7b9Kt4/s5FMp9TPMpR8JamzjIZKvZx8+kzf0XkyVLsFFAs+G1esXC0O
 RNwA==
X-Gm-Message-State: APjAAAXIAL4c20Q5FRvpjNc79MQjh8hxP7QuOg17JaCfbfOKnGnQrIqP
 ZH//3yyImP8xaWoAQEeI+B7xvVewhqaRGLjruLH0GZGu
X-Google-Smtp-Source: APXvYqzR5z6JY1210K3irTliJ2O1smuQUUUxYXgko3/KFSODJ1oLABft+I+H8tvdrf3YhSfyiYte4Y5rVhIutAXcAJ4=
X-Received: by 2002:ac8:44da:: with SMTP id b26mr3424289qto.299.1571914811358; 
 Thu, 24 Oct 2019 04:00:11 -0700 (PDT)
MIME-Version: 1.0
From: Matej Kupljen <matej.kupljen@gmail.com>
Date: Thu, 24 Oct 2019 12:59:59 +0200
Message-ID: <CAHMF36Eir10B0zdM51qu4TbsbsM-2a0jUJwKjqM5vhWmEKj4hQ@mail.gmail.com>
To: alsa-devel@alsa-project.org
Subject: [alsa-devel] AC97 audio-routing [was: Recording on WM9712]
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi all,

I am not sure how to specify audio-routing for AC97 codec. If I use
the similar setting as the  UDOO board (which was the only board that
uses AC97 codec I could find) I get warnings during booting:

[    3.261369] fsl-asoc-card sound: ac97-hifi <-> 202c000.ssi mapping ok
[    3.267917] fsl-asoc-card sound: ASoC: no sink widget found for Playback
[    3.274642] fsl-asoc-card sound: ASoC: Failed to add route AC97
Playback -> direct -> Playback
[    3.283309] fsl-asoc-card sound: ASoC: no source widget found for Capture
[    3.290141] fsl-asoc-card sound: ASoC: Failed to add route Capture
-> direct -> AC97 Capture

This was tested on kernel Linux version 4.14.134.

However, the card is detected:

[    4.041646] ALSA device list:
[    4.044628]   #0: ac97-audio

and I can use it for playback normally, but the capture is "slow" as
described in my previous e-mail.

Then I tried to build and boot the latest kernel from GIT (Linux
version 5.4.0-rc4) using the same DTS, I get additional warnings from
the kernel:

[    2.639878] fsl-asoc-card sound: ac97-hifi <-> 202c000.ssi mapping ok
[    2.651321] fsl-asoc-card sound: ASoC: source widget AC97 Playback
overwritten
[    2.658595] fsl-asoc-card sound: ASoC: no sink widget found for Playback
[    2.665317] fsl-asoc-card sound: ASoC: Failed to add route AC97
Playback -> direct -> Playback
[    2.673974] fsl-asoc-card sound: ASoC: sink widget AC97 Capture overwritten
[    2.680986] fsl-asoc-card sound: ASoC: no source widget found for Capture
[    2.687822] fsl-asoc-card sound: ASoC: Failed to add route Capture
-> direct -> AC97 Capture
[    2.718636] fsl-asoc-card sound: snd_soc_register_card failed (-19)

and the card is not detected:

[    3.285543] ALSA device list:
[    3.288518]   No soundcards found.

As you can see, there are additional warnings about widget overwrite,
because this check was added to the latest kernel, as seen from the
kernel source code.

This is the setting from my DTS file:

        sound {
                compatible = "fsl,imx-audio-ac97";
                model = "fsl,imx6q-ac97";
                audio-cpu = <&ssi2>;
                audio-routing =
                        "RX", "Mic Jack",
                        "Headphone Jack", "TX";

                mux-int-port = <2>;
                mux-ext-port = <5>;
        };

As you can see, I do not even specify any routing about AC97
Playback/Capture and I still get those warnings.

For the test, I commented out the code in sound/soc/soc-core.c in
function snd_soc_instantiate_card, to ignore the return values from
the call to snd_soc_dapm_add_routes and then I can use the card for
playback, but the recording has the issues again.

What seems to be wrong with this AC97 audio routing?
Any suggestions?

I am willing to test this on the latest kernel, or from some other GIT
repo if needed.

Thanks and BR,
Matej
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
