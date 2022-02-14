Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C780B4B5AC9
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 21:00:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 759341878;
	Mon, 14 Feb 2022 20:59:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 759341878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644868801;
	bh=QgDRn4dvRNUXSTXj9SM4t3mwury/rCBVsi81XfQ4Ql8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGtsDbI3isAhFZsFStrermesUIRtSRP5niczGQ6lSX2jUwmW0SHw7Ai2sARzwIfDL
	 mULDSUAAMqTj7p8WOLm61K8VDxS8zM903vBRVhM8ue0eAzGt84OKkG1qgIPe86qSVl
	 e3ePhH1QiQtOYaiA0HfW/6wxWvc06cYSj9W6ulls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEBAFF804CF;
	Mon, 14 Feb 2022 20:58:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9824FF80430; Mon, 14 Feb 2022 20:58:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D098F8012F
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 20:58:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D098F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YPDGXeyh"
Received: by mail-ej1-x632.google.com with SMTP id h8so13200290ejy.4
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 11:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=APPbbU4C/GqF/6yshMoRTZ/FCekQzbCqSEJI5rVVJIo=;
 b=YPDGXeyh8/L/EH/r5TUYUTwNZ8wvwMvZ3M2cnDWVaIsD5xWr2X2hP9iAiK7nhUu5bg
 FgcKvqambIjpHaYxF874JFVkWS0OQ3DEHXWhRREn4iwWfoPNpAaX1F9DJMrQ3xd0Y5gU
 9d8wyn4pPvyTrnPMaAr6mcHjGtQptJZvHwSzhkF4LEzO5eT4wl5af6VtyYhHSxc6jzEY
 iRMpXsfqZYV0T8CbE+SEN8HLEo9Aiu4mjUH5V6gZET4NbMy9/IXvSmDhPsWFNCAl/mLa
 DplI2w2fvxneyucR/4DcerXUGgWCi+mPfYalPideMmUFfP8Q94PO0FJ1651szhlFYYyV
 2FUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=APPbbU4C/GqF/6yshMoRTZ/FCekQzbCqSEJI5rVVJIo=;
 b=du0oa2wYYqzDqDDhHshcZtnveYpI9MnTO1zQOARtf8oLY9N8XV+5Pi4BJXz82GBrj2
 zPY4p7KB8gyEbNEOSMHVCWkRcYXPmtXRHLgWAso3/f8xRtiZBrYSBmFZ90titWfX0UFn
 mf9pDT2AacYie8c8zK+VrC0pfkUkzADElZxGTZXqQOaarunTCKuQFV6JzEmlKuAFy4Kk
 uJqgqZ/JE+Dbh8MLDjvBwZoSLMeXfvEtB3th8qXV3P4Z9/B1P0ns3ERfTGXcZHosYvx9
 aeqUMs0t7vOL2yjv0cJNPo4B/CTzrVdXQ2az6IYWx4TLQmr0NwRy7E5QRNYQLdJrsjPi
 ckIA==
X-Gm-Message-State: AOAM532ZxAnGhPBKPc2sMEzDkg6FPojnHnnuO/TpDRyGR+xr9TLYBKB4
 w/u225zY37c+EULhtwjcgYhg/bOJtZx7u6dKZ/E=
X-Google-Smtp-Source: ABdhPJz+mhPWNkndXCx5/VGtXvPzciSVR3wzM6esM7N4GpAnaidEfdzbrsawEHDLLXEopEC02UpGzAOWv4TpgNc2Iq8=
X-Received: by 2002:a17:906:c112:: with SMTP id
 do18mr331547ejc.492.1644868725882; 
 Mon, 14 Feb 2022 11:58:45 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5C9qqxLMA4Nw=YKvZth4_G-rMxCkOLOQ3a80nK8WWDURQ@mail.gmail.com>
 <YgqN5T3ObHvUNBKV@sirena.org.uk>
In-Reply-To: <YgqN5T3ObHvUNBKV@sirena.org.uk>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 14 Feb 2022 16:58:34 -0300
Message-ID: <CAOMZO5DdMJkUGTCOKcCuK9HuDgLDD26iSQumfn_vopM-TdHOHg@mail.gmail.com>
Subject: Re: cs4265: failed to add widget SPDIF dapm kcontrol
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
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

Hi Mark,

On Mon, Feb 14, 2022 at 2:14 PM Mark Brown <broonie@kernel.org> wrote:

> The driver is just plain buggy, it defines both a regular SPIDF Switch
> control and a SND_SOC_DAPM_SWITCH() called SPDIF both of which will
> create an identically named control, it can never have loaded without
> error.  One or both of those has to be renamed.

Thanks. That did the trick. I have just sent a patch.

Thanks
