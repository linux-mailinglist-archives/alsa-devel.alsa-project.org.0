Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C37E1E6411
	for <lists+alsa-devel@lfdr.de>; Thu, 28 May 2020 16:35:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6EA517D2;
	Thu, 28 May 2020 16:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6EA517D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590676504;
	bh=UN2rnZyWpLMqF8ExVnHsDsnDlZA39XDQP/BvQVtEDTo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pFb+Ba7rU3GU+FP4Mt/1qGi8DId6d7GtVX3WaKZM0qie4/pu5OdrShQ9hHbfEVdyD
	 GrUT/BY5wY2daqFQ4ig2A1WMDSuWxiAALNuN7nGD7yFwUSCAFkV1Yqb7JpSRu09j7i
	 1DEV0gprSBlqOR5FSgPNCHtte5lpdH6eYDmwFyZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75EFDF8014A;
	Thu, 28 May 2020 16:33:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4C72F80150; Thu, 28 May 2020 16:33:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F8F0F800E4
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 16:33:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F8F0F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b+vldjs4"
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FC9620897
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 14:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590676391;
 bh=UN2rnZyWpLMqF8ExVnHsDsnDlZA39XDQP/BvQVtEDTo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b+vldjs4gnjLoWxmvcqq5AyLYuS5kZtIwnn6GUD7lv0/EVgVH5QvYHaHIH4okfxxE
 jWafMsKhTdQxjZBr+xr/yGkBFyOu4z0hlYzwxdkavv0guaQM663BHhp7sQRwGCJa9Q
 lthAll+uCepibhP0gjK4Hy/3z3rgfcgIEMQva0t4=
Received: by mail-ot1-f42.google.com with SMTP id z3so2488744otp.9
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 07:33:11 -0700 (PDT)
X-Gm-Message-State: AOAM531LUvomndTzu/jAbHFd6fP3wYMMwd9hLmGZLJ8Biywy/jd2zkk7
 NdbFY4pFNFf5uni2uYNLGLG9TWJMdWeAslYuJw==
X-Google-Smtp-Source: ABdhPJzSac9fblEg4fvh1xMALOim19c1Ul+G+BxgigsqfG3+dwRkFMrik7yaQaER/EVzB2pW8mIWcXlAZrXsUMHziys=
X-Received: by 2002:a05:6830:18d9:: with SMTP id
 v25mr2288369ote.107.1590676390311; 
 Thu, 28 May 2020 07:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200526200917.10385-1-dmurphy@ti.com>
 <20200528140525.GA4166160@bogus>
 <23500301-1076-ac47-327e-f7731525657c@ti.com>
In-Reply-To: <23500301-1076-ac47-327e-f7731525657c@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 28 May 2020 08:32:58 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLPDahwYakepLP4b-Cf4fRAYrGoW0qit_ET3AKbYOYERg@mail.gmail.com>
Message-ID: <CAL_JsqLPDahwYakepLP4b-Cf4fRAYrGoW0qit_ET3AKbYOYERg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: tlv320adcx140: Add GPI config
 property
To: Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
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

On Thu, May 28, 2020 at 8:20 AM Dan Murphy <dmurphy@ti.com> wrote:
>
> Rob
>
> On 5/28/20 9:05 AM, Rob Herring wrote:
> > On Tue, May 26, 2020 at 03:09:16PM -0500, Dan Murphy wrote:
> >> Add an array property that configures the General Purpose Input (GPI)
> >> register.  The device has 4 GPI pins and each pin can be configured in 1
> >> of 7 different ways.
> > Dan seems to have trouble running get_maintainers.pl and Cc'ing the DT
> > list. Running 'make dt_binding_check' also seems to be a problem. Now
> > linux-next has these warnings:
>
> I don't have an issue with doing get_maintainers.  All the maintainers
> listed were added to the patch.
>
> And devicetree@vger.kernel.org was cc'd.

Indeed, sorry for my rant. Some reason my search didn't find it.

Not sure why my tester didn't flag this either...

Rob
