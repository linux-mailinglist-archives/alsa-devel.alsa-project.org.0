Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 095EF2DBF5A
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Dec 2020 12:28:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8867517AF;
	Wed, 16 Dec 2020 12:27:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8867517AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608118088;
	bh=A1HTWkrMiCWdXjch8Wdo2LEnpiN677jiCEapc6u0XM0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G3Vu0wVBjXUurcaDNiMB8Gzp7BA4JaYLc3XuEe4RICSjrgjYNS9ySniav2Mea2EBe
	 ySQPUfSSTDfvvXrJAWD+tksJu/cQgKBbInAHyMJ9ttjTH9lp9cxrcGHho5LULB7Znp
	 WS1vEkE+/HKC9Ab23Z8riOfP8en06fANsQDSZcPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63778F8014B;
	Wed, 16 Dec 2020 12:26:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3354F80276; Wed, 16 Dec 2020 12:26:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C403FF8014B
 for <alsa-devel@alsa-project.org>; Wed, 16 Dec 2020 12:26:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C403FF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VubTArQy"
Received: by mail-lf1-x12b.google.com with SMTP id a12so47428634lfl.6
 for <alsa-devel@alsa-project.org>; Wed, 16 Dec 2020 03:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A1HTWkrMiCWdXjch8Wdo2LEnpiN677jiCEapc6u0XM0=;
 b=VubTArQyVKuBy9L0rcU2Q1ai7i/hMZSI0M3LocyMZkbn40L9Pa4IE3DCjUd3BePaJk
 HIPrW2ucNhY60O1nQ+wubUIaRpxry4wVQkGLP1LMST3busHi10lTW3pOvVWG13o5r6a6
 h+tU2Gxt3mbmvTTsnjz6MZkurzo93qEug9iioXyMdQ0jHJGUS/29ssxKUB0mzkx+aGYk
 QjGN5XJzxIlC5dc/tL/ZoaXGJMHkgpTYh3Gq1TKLPnJhAHoYNAqdWwweISe+/QbkUkZH
 4Y9H8NOwsLkfLLN7A/TBdlNmKUGweFK+vUwFI4z5ZwWoxObXUjq7aE62sRtn8VEvivD9
 kHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A1HTWkrMiCWdXjch8Wdo2LEnpiN677jiCEapc6u0XM0=;
 b=asiLbzhzvNCuY2Qjhmi1Myrb3mUqjFT30mrSPEyBKtV+aRZtR5f0mGmOvC6YaA/aBH
 kxIrirfgW7/I9+N95JBQ3WU7Q52fbJHh+bdWxxCPdezalj9QxRC/XFJyiOeKF85oROKY
 PC5FzD5RbJZq8IfkzoQwpkOjvgHrLESlQLYeFGkvCT3o2OE4JvlfN/Y1WF6SLZjKwkdM
 3PAjNkpf8EExBwGK+FW0dMERGaSJBAp8aTxO7tdznTyqCucMunimOnm3DoATipSkgeLk
 A8drMIlHItoo9rU4M0SZzlk2s8TDq0Nv1ThwAaOFIvlSk1NsoTyThQLoew/JaXQ1d5cS
 inNA==
X-Gm-Message-State: AOAM530iTSRHvMLg8AtQc8SD7kA6s4vBnvoaVkuoUTX6JDXJqfbutOXM
 TGtGyiatcYlgCQx5tf1xB0PyLPFXZVV0pn3xKbA=
X-Google-Smtp-Source: ABdhPJzk/F6xIDInXWPZPHeXBh5fRXip+E/mflmi6fxiAaY9HM5oFMwVy4lMd60HPoOAvl0PjA0S0EIA+xOtADyK5iA=
X-Received: by 2002:a2e:8416:: with SMTP id z22mr14917310ljg.347.1608118002624; 
 Wed, 16 Dec 2020 03:26:42 -0800 (PST)
MIME-Version: 1.0
References: <1608115464-18710-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1608115464-18710-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 16 Dec 2020 08:26:31 -0300
Message-ID: <CAOMZO5AgZhJL-wPXwAt0J=fCt+RA-Toj56X6t9W+HaWuat5VMg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-hdmi: Fix warning of the uninitialized variable
 ret
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
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

Hi Shengjiu,

On Wed, Dec 16, 2020 at 7:52 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> From: shengjiu wang <shengjiu.wang@nxp.com>
>
> When condition ((hdmi_out && hdmi_in) || (!hdmi_out && !hdmi_in))
> is true, then goto fail, the uninitialized variable ret will be
> returned.
>
> Signed-off-by: shengjiu wang <shengjiu.wang@nxp.com>
> Reported-by: kernel test robot <lkp@intel.com>

Thanks for the fix.

This should have:

Fixes: 6a5f850aa83a ("ASoC: fsl: Add imx-hdmi machine driver")

Reviewed-by: Fabio Estevam <festevam@gmail.com>
