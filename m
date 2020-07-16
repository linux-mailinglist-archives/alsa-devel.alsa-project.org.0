Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E38772228BB
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 19:11:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 809A315F9;
	Thu, 16 Jul 2020 19:10:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 809A315F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594919467;
	bh=5B29s1KUziKE6koHLN6oW0iuE7m19Y0Va2AgLY9ktw8=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R31kKWf0JZ8V3xSvGQQENHv4ICnvvLzO3tLNLRSJ6chZdW7NzQlU0RyP1zcXmnK1P
	 gSKrPHhR/QVUvkRDo7pQgWQt2LES2QeXq4ivjTM9XvS3fERl7Fl8DtB2pXTV6/RtwG
	 AIy6yFrZ3xfHyMhCXQRNPiHfkI7waPWjSKxyn0Jc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEDFBF80110;
	Thu, 16 Jul 2020 19:09:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23777F801EC; Thu, 16 Jul 2020 19:09:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21A33F80110
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 19:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21A33F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iTxwKge6"
Received: by mail-wr1-x430.google.com with SMTP id s10so7795561wrw.12
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 10:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=5B29s1KUziKE6koHLN6oW0iuE7m19Y0Va2AgLY9ktw8=;
 b=iTxwKge6pcfmYNKP6jyBVptCS/rfvo1bQdOZBXSDQIF3OYep0xXIAIB2wQE1bGnnl3
 9cLf4buMkrdvhxAbd3TmgXQxLiWnEBTY9VfJsFc2Lu10Y65r0LT+WaNzpXIgmQ6S4iu+
 pSvLxQzoL995nuKQpWSfMz82fT4A167JqCGPCB6IdkMuxvXrLlaVM7yEN2M3rGBdfhL1
 qbS7dKq0lbu8/5ZTfzmxeY0l/S4WfAs4JcfKYYGgS4WoDnt4H18iqY7CiKrlokhZoB1e
 uuRdUHrvWLnfDcsuXKtASDF1sLAoNBEWdjDIIR85qxm2DIVAXxVRaBNuPQCgLGLFoqNR
 7a7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=5B29s1KUziKE6koHLN6oW0iuE7m19Y0Va2AgLY9ktw8=;
 b=Uh4YCWm/Ta0cI9GkXJ6mGWgsFMnq2gsm4kD/l15M+GyEUwgsBZoUXlhISWPf5j0Vq/
 6MxyOqEtsgwbwq3LKPQaQvSr1NgY+JWZEmZ7z9N72YOgpv+vw1HP+rXYBGUgGrJ9SdfH
 juC3WTjNeyId1HhEd3rW4eCJZihgvXN2qsMDBgpPreyQfYOivglZjuZKMMRvcavUttnC
 /SQbOhS13VN251XOwXCQbsn39AiVOM/kpRMd1uPZJnqUvKResndVO0zBjYSOfgOH74Dl
 elrDLpIaqBGuPaL9QFo9z+IhDO+4t7se9Ar0z6JjgNcKLfuLQQdEjkNbDSeLEYgTfFXI
 P3kg==
X-Gm-Message-State: AOAM531hhQUPkHKt84aJhyc+mfKl2dPB3HTAkXsdISDOm4ZRklCBQRum
 3OrD5eQFfLmo/biChPa4XPnbPTCeHp4FCi34cJJ18uGWcc0=
X-Google-Smtp-Source: ABdhPJzFhnO6Le2c3r479EuN+r3NKOqJGO0KUea9b0N6fGzHdqeh2BLTUaZ/IVcr4v9THk1yjC2pSA/cbkmtSzUhsRs=
X-Received: by 2002:a2e:a375:: with SMTP id i21mr2595900ljn.403.1594918945508; 
 Thu, 16 Jul 2020 10:02:25 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 16 Jul 2020 14:02:14 -0300
Message-ID: <CAOMZO5Bhhcmm6ex0nP6MnYq0Uf8EMYCMMFOMav-fCrVJvOY+vQ@mail.gmail.com>
Subject: wm8962: error at soc_component_read_no_lock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

Running linux-next 20200714 on a imx6q sabresd I see the following errors:

wm8962 0-001a: ASoC: error at soc_component_read_no_lock on wm8962.0-001a: -16
wm8962 0-001a: ASoC: error at soc_component_read_no_lock on wm8962.0-001a: -16
 input: WM8962 Beep Generator as
/devices/platform/soc/2100000.bus/21a0000.i2c/i2c-0/0-001a/input/input3
wm8962 0-001a: ASoC: error at soc_component_read_no_lock on wm8962.0-001a: -16
wm8962 0-001a: ASoC: error at soc_component_read_no_lock on wm8962.0-001a: -16

Despite these errors, the codec probes fine.

What is the correct way to avoid such errors?

Thanks,

Fabio Estevam
