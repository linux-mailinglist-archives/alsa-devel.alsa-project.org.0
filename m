Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B50DECFD5A
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 17:16:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40BF71654;
	Tue,  8 Oct 2019 17:15:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40BF71654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570547798;
	bh=njc5QAn2CgWzoH49zcCT0TxriAwMBCrssDi6Rwq5PTs=;
	h=In-Reply-To:References:From:To:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rBBggY6MJC/iVz5wkCwltOAPG5nzozV/uqqdH8DmQ/Ee9a3EzMIWJPIaBAIF0Ic9x
	 OTC/mc7vmQSlC077BrJnhMH+qsPbWDrEUqDdL7hyad8JR/bS3sWmbCcqshH4QNJgNZ
	 97NAoO5zmH6I/UMEB8CNlPgFMWyMev+C1SVFsDq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C13DF8038F;
	Tue,  8 Oct 2019 17:14:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC6EBF8038F; Tue,  8 Oct 2019 17:14:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8356F80135
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 17:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8356F80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="W70crH8R"
Received: by mail-pg1-x543.google.com with SMTP id y35so10437980pgl.1
 for <alsa-devel@alsa-project.org>; Tue, 08 Oct 2019 08:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=message-id:mime-version:content-transfer-encoding:in-reply-to
 :references:from:to:cc:subject:user-agent:date;
 bh=b0SnpNhMUbVCEQgJptnlWM+4wSJCqeG8y6NSSqT0tLc=;
 b=W70crH8RHO9sJtcShnUUaAlhOqFx2fMphJf1FO7wncUFAdi+rPx2p2X7u3oTQd8EC8
 ++vTMzXltZIE+ovOXoCoiQHFZewsdb4/vLA0FByTnqyF0lP07t6J9LlLGfO5MaJHb4JK
 f8/vvpD8yJ1PAxVUxdM2BGMSJbc49rHkSdgXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version
 :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
 :user-agent:date;
 bh=b0SnpNhMUbVCEQgJptnlWM+4wSJCqeG8y6NSSqT0tLc=;
 b=fAr0QUprGDLuaOmAhN/4pHPtV39PGxhdqiQdlgnbre8BGc07zdleiJlHP+f7bW15fN
 w0sU7nu9/hFtgKggctvh7HhZtM+h+lY2NNw4xD2F+HECx/dboS54AeWSXkTCzYSNZ9qw
 hx/JU9g1UZm2wb6CqutqaOU4U/6oQ8fyIot/q7A+xgzopnGrvQTabGfmCBvmeznFnSva
 VShEN6LLQSEYEB/V+5PwmliGOXpdlpcYfftBGM9yZcPwayvUmvUxfNLCjIZcD6riLflH
 CQhBoZTGcfbOIQI3fcuMyTs1dWBzivFE13V4B+uyNJ6zLpei3xC/yCI9lG0JEgw/piz/
 RJKw==
X-Gm-Message-State: APjAAAWvyuBBa7SqntSC9TZUUqLUJ5bfPGrkGEIknzCUyfisbOf8HMzY
 IUBmGd9GmH//RUm4V52sH9hzmQ==
X-Google-Smtp-Source: APXvYqwEyFPtcLS13yv1gL8f/6Ms8qqajmvMZiGwmNGwHT4zxY9yfThc0vYuQ761Jws4hBNSomME4Q==
X-Received: by 2002:a17:90a:cc08:: with SMTP id
 b8mr6352843pju.119.1570547685494; 
 Tue, 08 Oct 2019 08:14:45 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id l21sm15295740pgm.55.2019.10.08.08.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 08:14:44 -0700 (PDT)
Message-ID: <5d9ca7e4.1c69fb81.7f8fa.3f7d@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <CAFv8Nw+x6V-995ijyws1Q36W1MpaP=kNJeiVtNakH-uC3Vgg9Q@mail.gmail.com>
References: <20191007071610.65714-1-cychiang@chromium.org>
 <CA+Px+wWkr1xmSpgEkSaGS7UZu8TKUYvSnbjimBRH29=kDtcHKA@mail.gmail.com>
 <ebf9bc3f-a531-6c5b-a146-d80fe6c5d772@roeck-us.net>
 <CAFv8NwLuYKHJoG9YR3WvofwiMnXCgYv-Sk7t5jCvTZbST+Ctjw@mail.gmail.com>
 <5d9b5b3e.1c69fb81.7203c.1215@mx.google.com>
 <CAFv8Nw+x6V-995ijyws1Q36W1MpaP=kNJeiVtNakH-uC3Vgg9Q@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
To: Cheng-yi Chiang <cychiang@chromium.org>
User-Agent: alot/0.8.1
Date: Tue, 08 Oct 2019 08:14:43 -0700
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

Quoting Cheng-yi Chiang (2019-10-07 11:50:31)
> On Mon, Oct 7, 2019 at 11:35 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Cheng-yi Chiang (2019-10-07 06:58:41)
> > >
> > > Hi Guenter,
> > > Thanks for the quick review.
> > > I'll update accordingly in v2.
> >
> > I'd prefer this use the nvmem framework which already handles many of
> > the requirements discussed here. Implement an nvmem provider and figure
> > out how to wire that up to the kernel users. Also, please include a user
> > of the added support, otherwise it is impossible to understand how this
> > code is used.
> >
> Hi Stephen,
> Thanks for the suggestion.
> My usage is for Intel machine driver to read a string for speaker calibration.
> 
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1838091/4/sound/soc/intel/boards/cml_rt1011_rt5682.c#325
> 
> Based on the comments in this thread, its usage would look like
> 
> #define DSM_CALIB_KEY "dsm_calib"
> static int load_calibration_data(struct cml_card_private *ctx) {
>           char *data = NULL;
>           int ret;
>           u32 value_len;
> 
>           /* Read calibration data from VPD. */
>           ret = vpd_attribute_read(1, DSM_CALIB_KEY,
>                                          (u8 **)&data, &value_len);
> 
>           /* Parsing of this string...*/
> }
> 
> It is currently pending on unmerged machine driver cml_rt1011_rt5682.c
> in ASoC so I can not post it for review for now.
> 
> As for nvmem approach, I looked into examples of nvmem usage, and have
> a rough idea how to do this.
> 
> 1) In vpd.c, as it parses key and value in the VPD section, add nvmem cell  with
> {
> .name=key,
> .offset=consumed,   // need some change in vpd_decodec.c to get the
> offset of value in the section.
> .bytes=value
> }
> Implement read function with vpd_section as context.
> 
> 2) In vpd.c, register an nvm_device using devm_nvmem_register in
> coreboot_driver's probe function vpd_probe.
> 
> 3) As my use case does not use device tree, it is hard for ASoC
> machine to access nvmem device. I am wondering if I can use
> nvm_cell_lookup so machine driver can find the nvmem device using a
> con_id. But currently the cell lookup API requires a matched device,
> which does not fit my usage because there will be different machine
> drivers requesting the value.
> I think I can still workaround this by adding the lookup table in
> machine driver. This would seem to be a bit weird because I found that
> most lookup table is added in provider side, not consumer side. Not
> sure if this is logically correct.

Maybe Srini has some input here. It looks like your main concern is
consumer to provider mapping?

> 
> IMO the nvmem approach would create more complexity to support this
> simple usage. Plus, the underlying assumption of accessing data with
> offset in a buffer does not fit well with the already parsed VPD
> values in a list of vpd_attrib_info. But if you strongly feel that
> this is a better approach I can work toward this.
> 

I'm not sure how an ACPI system like this would work because my exposure
to ACPI is extremely limited. I would expect there to be some sort of
firmware property indicating that an nvmem should be used and it's
provided by VPD or for firmware to parse VPD itself and put the
information into the ACPI table for this device.

Has either of those things been done? If it is a reference/property in
firmware then it should be possible to connect consumer devices like the
audio device you mention to VPD via the nvmem APIs with some changes to
the nvmem framework assuming there's an approach for nvmem in ACPI in
some "standard" way. 

I'd like to use nvmem for two reasons. First, it is a kernel framework
for reading non-volatile memories, which is fairly close to what VPD is
for. Second, it makes a standard, i.e. non-vpd/coreboot specific, API
that drivers can use to read memories. Of course in ASoC the machine
driver is already very platform specific, but the idea is to avoid
platform specific APIs so that drivers are loosely coupled with the rest
of the kernel. We shouldn't push against that goal by introducing more
platform specific APIs.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
