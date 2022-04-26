Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0EA5103AA
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 18:37:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 741161856;
	Tue, 26 Apr 2022 18:36:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 741161856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650991063;
	bh=aayBXJ/zeK0CaGspcrexa2j8cKiJh49bQchMUDOFKDE=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dE/zQ2CmI7fc9s2TtuM2cD/RIjriOSCnqAXJzrM5TOON4uFkLET4wg/sdw75oq710
	 fbt4lbjJq0Ei3shRkWOq85vFEF6BasSywslNJlHQEjvmpG2pmlKClp/rzs/ImHqDuZ
	 69+JiSDjp2zZjyd3ADSDvUjfk4T5ga/OHX31Fns8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9A3AF80171;
	Tue, 26 Apr 2022 18:36:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43A35F80152; Tue, 26 Apr 2022 18:36:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5C4FF80105
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 18:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5C4FF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ju0tDEl4"
Received: by mail-ed1-x532.google.com with SMTP id d6so17969570ede.8
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 09:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=FJp2GszXaUUYd0FTj+zKkFOledHEnE7077N6+TPFxPQ=;
 b=Ju0tDEl4iLaxAJIiajcwookxRoFjwmT2Z5TceFxESZk12UtRSRgrmtlV3XGRaZgLgA
 iBhTfQZaG+0/4CzxTDZ/lgdyGK2JwnbuEI7FsTboFfvRcKXNYvaq0u/WqmkQ04RBhg8G
 rArn7H5tjf/sTbEnEGujfYEb5eMCgI6WCyb8DxUxWvjuRRHUIpQ+NDUek3rin96I7RQM
 UWhdx6p9gZJPJ/4bQsorE6FKM32O3YGUm0MPvYjed4+JqAB+vDg3zcHNY3wtd7dWEQLS
 zPAM6/fgujnB2hNwVEA6XN+Yzyw3arclLpxfyCuTazdqH/ZnPq/lU60Bu0stsXSmfCL4
 q/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FJp2GszXaUUYd0FTj+zKkFOledHEnE7077N6+TPFxPQ=;
 b=boYYrUUsku60gfx9hDVA3S4CJdBO/x1j4vlSnbJ8Snt713jcyQYIJl0SaTm5biWYHn
 mLwPUjh7QP7f96AaM99oOAdigt8f9eia3qzAkHqbeILAbUqFWQoLzvzJlAF0gkMyWeYD
 QqxgkYOKSKiXlBRnekeZ4pS0eRHYw6qTV571/jEQUeJV4IqDxrQfSL2Jf/lLZw3yi4qF
 Kno8BJyvDKg6wpfs0B0n1SGaOCeaPE/XSgRgZODhTGCyBtIY24EkWeikI9qxDRqnFuuj
 1AxpRb2EcPgz55g6/glKDl7D1zIipzxZSepKIjIT5VcyOeqhYBM6ku79sKG4o4nDq1xh
 +hHQ==
X-Gm-Message-State: AOAM533DO40TF0+YaBxIJ7Qjrqjk+zRyzcfEXERDjFsVeACsfuUfTyFI
 NnhLVqHv1f7m4l+12uwE6AHNtJwXKqlNY0MOJ8w=
X-Google-Smtp-Source: ABdhPJxQLQkmBcAW3Sqn2hFM/qXsQMEQifeWc1ZfcPCdS1KcCXL3bL7pyHxFElh4m6s6oqmBNxW1v6RNo8YsyaiDd5k=
X-Received: by 2002:aa7:c619:0:b0:425:b14f:1183 with SMTP id
 h25-20020aa7c619000000b00425b14f1183mr25303560edq.254.1650990997549; Tue, 26
 Apr 2022 09:36:37 -0700 (PDT)
MIME-Version: 1.0
From: Adam Ford <aford173@gmail.com>
Date: Tue, 26 Apr 2022 11:36:26 -0500
Message-ID: <CAHCN7xJuAuGmSQsmBfg-C6jOdJmf1Li=YWp7Jdi29nU3kk1GcA@mail.gmail.com>
Subject: WM8962 crashing on suspend
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 patches@opensource.cirrus.com, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
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

I have an imx8m Mini with a wm8962 codec.  If I run a speaker test and
suspend the board while the speaker test is running, I get the
following upon wake:

wm8962 3-001a: ASoC: error at soc_component_read_no_lock on wm8962.3-001a: -16

This message repeats itself over and over again.  If I attempt to use
any audio, it fails until I reboot the board.

If I run the audio test, then exit and suspend, the audio works upon
resume, so it appears to be related to suspending while running.

I am hoping someone might have a suggestion as to what I might be able
to do or try to allow this to successfully suspend and resume if the
device is playing sound.

thank you,

adam
