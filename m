Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0D2613916
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 15:35:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE8FB167D;
	Mon, 31 Oct 2022 15:35:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE8FB167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667226955;
	bh=FjJXvazHCK/+ZS6up1WpvRYu6LTIu4mrq5ltFinlSl0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NupBoweL05lEyE6WkAMcH04IMXp7ht5yifCL0gcrVjkQOBckPiOTsTmwS1UjPWHAt
	 qpdgsAW/1R3iyuyNH3f+418+erFQ8MHDYmp/LcAoavGdQNsmVdFyWXaMwimKV0KvAn
	 JIhsKED1nNWvIUeYyt/4LW61oM0zASRoiWi/aI54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AF85F8021D;
	Mon, 31 Oct 2022 15:35:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B0ABF80163; Mon, 31 Oct 2022 15:34:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35A1EF800F3
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 15:34:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35A1EF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Rhf10q6s"
Received: by mail-qv1-xf2f.google.com with SMTP id x15so8450923qvp.1
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 07:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kKV7aE0TxR3j7oQ5UpL5QeWqb8LMrLP1KR71Ce0rJdQ=;
 b=Rhf10q6s3JMCa80g+eJaEamzQZpN1yURXdbXndhTf19Lbs3ezO4iuqo9uCGZW7Qm5P
 OHoKidMajn+7raOR+VijMDz1lfTx5Ij4kHzoiy5yHFJetjbXtPUKr40IOUzdPieqj/JQ
 RIghApZkawv0hVCb5r00KXhtyRLVm2JqKOHXnh0tlHrGvUaBs8dJ5ilwrXDVyzSqewrV
 w67gXZBGThncWtznOjXrW65E/z9KhCBsp5JNzgC5/hXUDVWl7jrlGaGrm9uD+lASH20f
 eEVc2pKGC2je1ff8W3kyK9KtemtXtOpACjwljeIdHdw93OfVeDEmLhb8vp96rVVDZBTJ
 MnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kKV7aE0TxR3j7oQ5UpL5QeWqb8LMrLP1KR71Ce0rJdQ=;
 b=x3BWs7AgIIGR1DEcdL0PSIP2kkLbvCMYah9YIbti0CFcDUgnO/8xQXLS6xlnJ5IHs+
 8E47dt6KwR85kkoHx3vb5WlbrFtdeDKwKNQeCOC2fkxmikJtQcO+bm3Biv7k434gnjyo
 SDrhT863z//b7m7uQj5qW22vNg8dOTYe0uN0rw+xaDa5urYTwkhvoS6TzIOPnm1SSB8Q
 GfdDFq4CRRIFS1L14FM28D5Q9XyrOmcsTR+wOMPaSrQiRC9CQv009R1oJjEMzRM9DUbi
 o1B/JLKaRqt5T42I0DgEfViDTgJ0mLGe6bQukZowY3WxKHsRGHDP2Y9f1gDMT/V4PfEG
 YU2Q==
X-Gm-Message-State: ACrzQf0+wTjMGup6xaHGhanNHRjfH12pc0bFCREUSTcTjHhJG80+wR/L
 WAsXj2DxBRe1vuVyEW/mAomLgJI/sxmMGJ3+8Y4=
X-Google-Smtp-Source: AMsMyM4y1ykqVDED54Le5Jc1Sa/VyglNecTz9VeFpLkd8G+tt9SRPN/a7OQaD8oOiHi640FBB8gcp0b+oCBxz/xd/D4=
X-Received: by 2002:a0c:f00f:0:b0:4bb:6167:d338 with SMTP id
 z15-20020a0cf00f000000b004bb6167d338mr11256789qvk.11.1667226891093; Mon, 31
 Oct 2022 07:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211217115708.882525-1-tanureal@opensource.cirrus.com>
 <20211217115708.882525-8-tanureal@opensource.cirrus.com>
 <CAHp75VdQGBixkUStPiq3VuoL+9TJo946ObfRA-L-D72DaFHnrw@mail.gmail.com>
 <Y19fSL2Z6xq8TCFS@google.com>
In-Reply-To: <Y19fSL2Z6xq8TCFS@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 31 Oct 2022 16:34:14 +0200
Message-ID: <CAHp75VfwqsiiRM-=BGii45-kX_6v4CHxDMTgwPnG5SBwu6655w@mail.gmail.com>
Subject: Re: [PATCH v6 07/10] hda: cs35l41: Add support for CS35L41 in HDA
 systems
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Len Brown <lenb@kernel.org>
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

On Mon, Oct 31, 2022 at 7:38 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Thu, Jan 06, 2022 at 02:29:58PM +0200, Andy Shevchenko wrote:
> > On Fri, Dec 17, 2021 at 5:45 PM Lucas Tanure
> > <tanureal@opensource.cirrus.com> wrote:

...

> > > +       cs35l41->reset_gpio = fwnode_gpiod_get_index(&adev->fwnode, "reset", cs35l41->index,
> >
> > Please, do not dereference fwnode pointers.
> > Also, why can't you use the device instead of fwnode?
>
> We are doing "acpi_dev_put(adev);" a few lines above, so using adev in
> the call to fwnode_gpiod_get_index() is technically use-after-free,
> isn't it?

Right, but I believe this is in response to the author and not to me.

> Also, why can't we do
>
>         cs35l41->reset_gpio = gpiod_get_index(acpi_dev, "reset",
>                                               cs35l41->index,
>                                               GPIOD_OUT_LOW);
>
> since acpi_dev is device structure corresponding to adev and we are
> getting the rest of the properties from it?

I remembered that I have also stumbled over that, but IIRC the point
here is that ACPI tables might be broken (since the multi-instance
device is a gray area to begin with). So we need clarification from
Cirrus to understand what the cases they want to cover with this
twisted code to get a GPIO.

> I saw downthread that there was supposed to be a patch addressing
> several issues raised by Andy, was it ever submitted?

-- 
With Best Regards,
Andy Shevchenko
