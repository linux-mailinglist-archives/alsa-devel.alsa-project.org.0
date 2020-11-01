Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9662A1EF8
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Nov 2020 16:21:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B865D169E;
	Sun,  1 Nov 2020 16:20:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B865D169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604244081;
	bh=H90sTvhKMB8EiwgfIPFPM/TSDEqN4HeghGfowoFgVdY=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gbKXmTo1uuoqD8thnut2EJKod4rDVclTKemhBYRKTp694cAjv4xNqLxFMJ+ijrZgN
	 yWjOzygcaaAjU0NimLYrhowdBJfj2eu+7RO3uLFz45LI9N1DEgkXDrhsDoMWu7TREq
	 ekTVoBoM1/KHerXh7FnxChFWVhxuEN7t+dJBxv1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0466BF80171;
	Sun,  1 Nov 2020 16:19:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDBE6F80162; Sun,  1 Nov 2020 16:19:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93A2BF8015D
 for <alsa-devel@alsa-project.org>; Sun,  1 Nov 2020 16:19:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93A2BF8015D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="X721Y2w+"
Received: by mail-lj1-x22a.google.com with SMTP id m8so6174545ljj.0
 for <alsa-devel@alsa-project.org>; Sun, 01 Nov 2020 07:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=H90sTvhKMB8EiwgfIPFPM/TSDEqN4HeghGfowoFgVdY=;
 b=X721Y2w+FYp1nxqsDsr9pfZc7Y7i+/FqxZ9ACJNEUmPMYnSH2TtheyNibLD4wgJQRZ
 OOtUk/AB/POV8TPz7G8RxM77TdX8sbRsAIQU0dagrX/cu6HNtW+RrppOAPJxStkXaD/s
 sGmxUpzV1aupsA4TILdAKnhWvu567SILADYvpvDgIidYOQrsDCTzMi0gdM1GOot4lwu9
 pkdfIyr4zfLQtxeVvRMIPds3mnkazcqANS4zmCTgLQ1Afd3oP2xnKwe8XCwluXZSjgty
 IhJD0oxhQ5iuaGho0bHDykAANAU8tzp70EYI7NZ4VQDX8lD/3NpEObm4J9WoplgvJkKM
 xfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=H90sTvhKMB8EiwgfIPFPM/TSDEqN4HeghGfowoFgVdY=;
 b=Wmc6sHWzzSaxx+BTvJ7YFOCqIFlkomIeqBFXoJFiGZwQTiJhU/ENancosPbAnEC0YX
 ysbXu2dofcjAMaarhQMBMj8XbAMB8/oatVfHvXEpR7F4rxaP51laviBHEgRbz2OhNJ/p
 4S5Oc5Zina9EqwYmFsIKnfcza0ZIMd7xhEwbjyA5Izzjv0XG2GiD3yE8atGi9RGXkMWP
 2VqTBr6Qn0f4KpulB/VMBNr7f5NsOUE+Rg5mo0L+YmmAO0J4z9nshjlVZH4Tco6cXgWk
 /QuyIG1w4n6CRegdZqICz96PbY9pzMKF2UmJyK7o4ApxEk44GFMpj+1pv9JsYyq6b7/+
 TVhA==
X-Gm-Message-State: AOAM531cGMh14ibkgMx9zNCEdz0+EuTx1jbj1fxR8mFLxCDQE5HAyrRz
 Tv6+Jx5y/GDBDp13hokD3FffQIssVJrf3ML9UGM=
X-Google-Smtp-Source: ABdhPJyoH2FTimtOJSeuc8b34DKHvtNlP8Z/Ak55qw82C77HVwYLl1FZWAYzXyLo+vu6rLQ5RegP0JUZeVzu73KzHFo=
X-Received: by 2002:a2e:b169:: with SMTP id a9mr5262169ljm.84.1604243980938;
 Sun, 01 Nov 2020 07:19:40 -0800 (PST)
MIME-Version: 1.0
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Sun, 1 Nov 2020 20:49:29 +0530
Message-ID: <CAHhAz+jd3h6YdBvv5+4zEr0546qRUuCgHfKJtoF=EQ=+4tQoGg@mail.gmail.com>
Subject: sound: PCM/I2S Digital Mic & SPDIF
To: kernelnewbies <kernelnewbies@kernelnewbies.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org
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

Hello all,

I=E2=80=99m having a Linux X86 machine and interfacing with Xilinx FPGA
endpoint over PCIe. FPGA endpoint supports various audio engines like
PCM/I2S ,Digital Mic & SPDIF.

I=E2=80=99m looking for any existing linux device driver to port it for my =
hardware.

Does the Linux kernel tree have any reference examples for these audio
engines which I can use for porting it to my hardware? If so can
someone please share your inputs on this.

--=20
Thanks,
Sekhar
