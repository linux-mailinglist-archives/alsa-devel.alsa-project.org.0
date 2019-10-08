Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E668CCF97C
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 14:12:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 693261616;
	Tue,  8 Oct 2019 14:11:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 693261616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570536759;
	bh=RhByLoeBp6tofJ5fTO1dX+AE6K9BVqrG71qfoAoSm14=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AzwpPidQAOPUQVzfYV6CFf3we9aaUys+mgmOX4bBeQoCCZgSqZejwMMtVZ5ew/O+/
	 zK4DWbUyuKZX5s2TuZ6Aukah0A41/lYCdN8d8GSVnvBYxlNo3TeaxUjz0Kwbyv7LNa
	 NrBUa5Tpp7Zbv5Tp39eZm/9hgUzC/g4N6PhoUO8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9FB1F8045E;
	Tue,  8 Oct 2019 14:10:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A221F8038F; Tue,  8 Oct 2019 14:10:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A62B7F800BF
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:10:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A62B7F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="lmcxJg+W"
Received: by mail-vk1-xa41.google.com with SMTP id q25so3679863vkn.12
 for <alsa-devel@alsa-project.org>; Tue, 08 Oct 2019 05:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qc61QyZfZZYMqB8OD9rsg9gHOoNYnkxxv7LFR8LDv3U=;
 b=lmcxJg+WAumgYsryhw1/rF2wSdetdsrVtKSmsoEXbgowdVvGVIzdMGBxgiUogalR6w
 pdGBW7IF1uVYrcXD1XWnUsJPNXl/lfI2wl2UaHC04Fy6NjB2SOukNg8I1TqSTn4iNQbX
 FAh8tSWkRqkUrXnaB/WQ/Ow2m+iIkdMG/YENI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qc61QyZfZZYMqB8OD9rsg9gHOoNYnkxxv7LFR8LDv3U=;
 b=dlY5yyrr0sBY/99Onv+1HUHzuF4ZGGDdlH+Sv4569BpnDeXVDWs5PDEBTfCUCZBlz7
 6hkVd3Bj5F9NYTYNlnUirQUUDAO5L2/RSRUrl73xG00hCHh479onJxZ1AoLbO0/qkGwH
 +1JD9F/WPQ9EuUTS198XAy6m6xn3bIyfhF/cgCOd8Uoh8hdIn9brrdAGRi+lWX+SWIGw
 a+OzQ2HMq2oSNk9uKUdc6sDTz3dzV2dURFkIZwb+VgW1MVD+Td/Qcxvvw/LwRJnotr4g
 xaW7fBJoTZhOQb+BusBYO8dX5aFT1vW0754KMDlLamQntYmhePndFdZTUASoqu1nq5+M
 8gSQ==
X-Gm-Message-State: APjAAAXauQDgp67WE2UAbTSsV9uAZXWCrympoAmnaxNJzo8dCawIT2ql
 6MuFo4ocIP5BVJvukOA3omK7LwRA8y3Y531qW0si0A==
X-Google-Smtp-Source: APXvYqwxv7te0+g5CNTJMkvkyE0zFacwdpsQDxej3YHeqIGBVQ5w5lPw/kLCFgvz5h6g5SEqlsPKUjZrX2lW7zRSn0o=
X-Received: by 2002:a1f:2192:: with SMTP id h140mr16721053vkh.92.1570536648132; 
 Tue, 08 Oct 2019 05:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191008101144.39342-1-cychiang@chromium.org>
 <20191008120649.GC2761030@kroah.com>
In-Reply-To: <20191008120649.GC2761030@kroah.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 8 Oct 2019 20:10:21 +0800
Message-ID: <CAFv8NwL2xRFUSRwiD4=mPg1zWm0gmzUQmhaU9SKCdc+=r7pjrg@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Hung-Te Lin <hungte@chromium.org>, "M R,
 Sathya Prakash" <sathya.prakash.m.r@intel.com>,
 Mark Brown <broonie@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Shuming Fan <shumingf@realtek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dylan Reid <dgreid@chromium.org>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [alsa-devel] [PATCH v2] firmware: vpd: Add an interface to read
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

On Tue, Oct 8, 2019 at 8:06 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 08, 2019 at 06:11:44PM +0800, Cheng-Yi Chiang wrote:
> > Add an interface for other driver to query VPD value.
> > This will be used for ASoC machine driver to query calibration
> > data stored in VPD for smart amplifier speaker resistor
> > calibration.
> >
> > The example usage in ASoC machine driver is like:
> >
> > #define DSM_CALIB_KEY "dsm_calib"
> > static int load_calibration_data(struct cml_card_private *ctx) {
> >     char *data = NULL;
> >     int ret;
> >     u32 value_len;
> >
> >     /* Read calibration data from VPD. */
> >     ret = vpd_attribute_read(1, DSM_CALIB_KEY,
> >                             (u8 **)&data, &value_len);
> >
> >     /* Parsing of this string...*/
> > }
> >
> >
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
>
> I can't take this patch without a real user of this function in the
> kernel tree at the same time.  Please submit it as part of a patch
> series with that change as well.
>

Hi Greg,
I see.
There is an ongoing discussion with Mark in

https://patchwork.kernel.org/patch/11179237/

I will resend this after machine driver is merged, and after codec
driver change get sorted out there.
Thanks!

> thanks,
>
> greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
