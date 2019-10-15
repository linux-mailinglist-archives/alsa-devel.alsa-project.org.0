Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C12D752A
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 13:37:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A5929F6;
	Tue, 15 Oct 2019 13:36:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A5929F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571139425;
	bh=opw/5SmWBDlxGgqbg25NPU6J6X1eW5ddYsULni2Satk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qQcAeEv8Qf93lYcaXbJYjcP6jsmnTn8KliUiPkkGPfTONFvNqtW4u8eqUsKSeEqiP
	 S2Koye0jovhdmoijW7bOQeEJ3qTzG1Zi9w9ynOvo+rmdHoL4bcklMRHEOsWbk/v9Y3
	 sD9l3dJT8dfXDi/PIOLmegxn3haM7B5IggS1t4Xk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 733B5F80529;
	Tue, 15 Oct 2019 13:35:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47C64F804AA; Tue, 15 Oct 2019 13:35:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B48AF800F4
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 13:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B48AF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G0WeyfkM"
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0033621D7D
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 11:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571139312;
 bh=RmwTSDIV8FwauP/TKSSY3ZDlw7e1niXdhbfrZ3cn/3U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G0WeyfkMI8DUD6k61eGb9P15FohcAbMve2CgAE71mA3q0NuhSFaIOCYWT+ANYz48D
 j7UQl8M4Uc8QXB/vzKMB3Uu3pUcir3dR6wceFeR5ZYk5hNrvxA7JsCU/pOj6LX1Ft8
 EsI3IjAGOKwQBxelIRslQ/SWxt142ZO17244Iohg=
Received: by mail-qt1-f178.google.com with SMTP id o12so30044533qtf.3
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 04:35:11 -0700 (PDT)
X-Gm-Message-State: APjAAAURE7MTdr1RW7LZxsbtWkZ9bBonsp9kk1Lq27R6pIF8muPlPm74
 5AbjFd+qOpR47DP3AtGVz3atV7FNfQyM/w7JKw==
X-Google-Smtp-Source: APXvYqwV4ka+h8Ai6FzlPXTB/SteBHk/rshSYgJyQG3n6WwcEMODovifEQMVxtQT5VJ5SFVHSgIdavwnJcXTiUug4Fg=
X-Received: by 2002:ac8:44d9:: with SMTP id b25mr39135730qto.300.1571139311121; 
 Tue, 15 Oct 2019 04:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20191011154423.2506-1-srinivas.kandagatla@linaro.org>
 <20191011154423.2506-2-srinivas.kandagatla@linaro.org>
 <20191014171241.GA24989@bogus>
 <76be1a0d-43ea-44c3-ef6c-9f9a2025c7a2@linaro.org>
In-Reply-To: <76be1a0d-43ea-44c3-ef6c-9f9a2025c7a2@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Oct 2019 06:35:00 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+ZBhh2A3yLtOyReHHAET_bvM-ygBtRXeFihAxf0jvDKQ@mail.gmail.com>
Message-ID: <CAL_Jsq+ZBhh2A3yLtOyReHHAET_bvM-ygBtRXeFihAxf0jvDKQ@mail.gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 spapothi@codeaurora.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v3 1/2] dt-bindings: soundwire: add
	bindings for Qcom controller
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

On Mon, Oct 14, 2019 at 12:34 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> Thanks Rob for taking time to review,
>
> On 14/10/2019 18:12, Rob Herring wrote:
> > On Fri, Oct 11, 2019 at 04:44:22PM +0100, Srinivas Kandagatla wrote:
> >> This patch adds bindings for Qualcomm soundwire controller.
> >>
> >> Qualcomm SoundWire Master controller is present in most Qualcomm SoCs
> >> either integrated as part of WCD audio codecs via slimbus or
> >> as part of SOC I/O.
> >>
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> ---
> >>   .../bindings/soundwire/qcom,sdw.txt           | 167 ++++++++++++++++++
> >>   1 file changed, 167 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> >
> > Next time, do a DT schema.
> >
> Sure! I can do that in next version!

I meant the next binding you write, not v4. However, ...

[...]

> >> += SoundWire devices
> >> +Each subnode of the bus represents SoundWire device attached to it.
> >> +The properties of these nodes are defined by the individual bindings.
> >
> > Is there some sort of addressing that needs to be defined?
> >
> Thanks, Looks like I missed that here.
>
> it should be something like this,
>
> #address-cells = <2>;
> #size-cells = <0>;
>
> Will add the in next version.

You need a common soundwire binding for this. You also need to define
the format of 'reg' and unit addresses. And it needs to be a schema.
So perhaps this binding too should be.

Rob
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
