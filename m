Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CF0CEC29
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 20:52:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 423841654;
	Mon,  7 Oct 2019 20:51:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 423841654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570474362;
	bh=yavLJ+UYVv6ZXxlqUIQr9/n4TwwBW7NBSxr4sxbAbAM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qaEoVNhKsvHTGQxzSpSMI0Gtq2kHxwiAfgvH8ufRqSUN3jUxvmsQC223BQlaUQ9Nr
	 MO1yDM21x5c4IytocQXZOOJfXopE5iQw6tOrsqKSLBW7C9FsTLYKjzi4tY/dWAH0L7
	 08QkJeEe4BDVkoCBwPfOh3VOrwWOLSeJD9y0kQOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18C3AF802BD;
	Mon,  7 Oct 2019 20:51:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5564AF8059F; Mon,  7 Oct 2019 20:51:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE3FAF800BF
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 20:51:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE3FAF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="OVAe8zoq"
Received: by mail-vk1-xa44.google.com with SMTP id v78so3222506vke.4
 for <alsa-devel@alsa-project.org>; Mon, 07 Oct 2019 11:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Py90T7+TOHoY4y4lQF72qi6auVcn9VleVh+vvTZakMs=;
 b=OVAe8zoqFnXj2Iv/T3srEGEE1Kd0JS8O49MQyreVdxAUfbrHgl8+3b09Opie6N0kA4
 N7LebgCcZO00dhMKgEFV8FCEA5mkFivAHI9vNyglEltwMeYiiQBHPRCfwzMkoWZhdjlf
 jfGPvIvTAtt069I4+IeaPVd8GHxj5K2eRhizY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Py90T7+TOHoY4y4lQF72qi6auVcn9VleVh+vvTZakMs=;
 b=ECxvtU/zutt4BE5ZMznxd8kdZSV0e7eIo/UXPlAJqZLgxArd0SKceNmuou/bm4OClo
 ow27yzgB1OMVc1lEqnHRw6XV4bYEpbqVwxuqJ5EoOGNtIdQ1nN+k/N+q9+Lmhh0TY2Pr
 3iMevVPDfxQnr89+YYi/IsRFpIhf9+ldPK7bNgui7oY7LnzNJDSobrPf+1cQOSEgRoM9
 Ke2+heXreVw2IVV5Sf6ZVsPF+TDJmx7b5Y8RRYMcRoZ6Em5/P9q2wLVvFl3Jb+JtLvaV
 TY0vCmCcmZ3gFwZm9wR25YsEQOGg60c4YJJHEx4/R1sZ/IYNcVx0GNn5T9hL8FIAD1fD
 ZMmA==
X-Gm-Message-State: APjAAAU2/69UVb9jlMDRGdUFtWp6XaWCygfqt5slfnSb1Qt0ZKAYkaPb
 /DPQEytWHDAzL5xjElYSyIblu1mIjPbczWEkhr+N/w==
X-Google-Smtp-Source: APXvYqzKcYn+QyEkep5BPOvhXlmMCn4pYfv1ojDrA+z7FDOd4AW/2yHhLJhMd3ZbFPU80M3ZE1qO494JaRdPjJnSuk8=
X-Received: by 2002:a1f:cd81:: with SMTP id d123mr15355291vkg.21.1570474258651; 
 Mon, 07 Oct 2019 11:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191007071610.65714-1-cychiang@chromium.org>
 <CA+Px+wWkr1xmSpgEkSaGS7UZu8TKUYvSnbjimBRH29=kDtcHKA@mail.gmail.com>
 <ebf9bc3f-a531-6c5b-a146-d80fe6c5d772@roeck-us.net>
 <CAFv8NwLuYKHJoG9YR3WvofwiMnXCgYv-Sk7t5jCvTZbST+Ctjw@mail.gmail.com>
 <5d9b5b3e.1c69fb81.7203c.1215@mx.google.com>
In-Reply-To: <5d9b5b3e.1c69fb81.7203c.1215@mx.google.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 8 Oct 2019 02:50:31 +0800
Message-ID: <CAFv8Nw+x6V-995ijyws1Q36W1MpaP=kNJeiVtNakH-uC3Vgg9Q@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hung-Te Lin <hungte@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Mark Brown <broonie@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dylan Reid <dgreid@chromium.org>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [alsa-devel] [PATCH] firmware: vpd: Add an interface to read
	VPD value
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

On Mon, Oct 7, 2019 at 11:35 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Cheng-yi Chiang (2019-10-07 06:58:41)
> >
> > Hi Guenter,
> > Thanks for the quick review.
> > I'll update accordingly in v2.
>
> I'd prefer this use the nvmem framework which already handles many of
> the requirements discussed here. Implement an nvmem provider and figure
> out how to wire that up to the kernel users. Also, please include a user
> of the added support, otherwise it is impossible to understand how this
> code is used.
>
Hi Stephen,
Thanks for the suggestion.
My usage is for Intel machine driver to read a string for speaker calibration.

https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1838091/4/sound/soc/intel/boards/cml_rt1011_rt5682.c#325

Based on the comments in this thread, its usage would look like

#define DSM_CALIB_KEY "dsm_calib"
static int load_calibration_data(struct cml_card_private *ctx) {
          char *data = NULL;
          int ret;
          u32 value_len;

          /* Read calibration data from VPD. */
          ret = vpd_attribute_read(1, DSM_CALIB_KEY,
                                         (u8 **)&data, &value_len);

          /* Parsing of this string...*/
}

It is currently pending on unmerged machine driver cml_rt1011_rt5682.c
in ASoC so I can not post it for review for now.

As for nvmem approach, I looked into examples of nvmem usage, and have
a rough idea how to do this.

1) In vpd.c, as it parses key and value in the VPD section, add nvmem cell  with
{
.name=key,
.offset=consumed,   // need some change in vpd_decodec.c to get the
offset of value in the section.
.bytes=value
}
Implement read function with vpd_section as context.

2) In vpd.c, register an nvm_device using devm_nvmem_register in
coreboot_driver's probe function vpd_probe.

3) As my use case does not use device tree, it is hard for ASoC
machine to access nvmem device. I am wondering if I can use
nvm_cell_lookup so machine driver can find the nvmem device using a
con_id. But currently the cell lookup API requires a matched device,
which does not fit my usage because there will be different machine
drivers requesting the value.
I think I can still workaround this by adding the lookup table in
machine driver. This would seem to be a bit weird because I found that
most lookup table is added in provider side, not consumer side. Not
sure if this is logically correct.

IMO the nvmem approach would create more complexity to support this
simple usage. Plus, the underlying assumption of accessing data with
offset in a buffer does not fit well with the already parsed VPD
values in a list of vpd_attrib_info. But if you strongly feel that
this is a better approach I can work toward this.

Thanks!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
