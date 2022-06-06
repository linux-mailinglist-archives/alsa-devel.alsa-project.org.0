Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF7753F5E5
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 08:11:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81687193C;
	Tue,  7 Jun 2022 08:11:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81687193C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654582310;
	bh=TI4P18/3vyoUu1YoM1I93ZEGQv/UWUtMjgpV3is+1kU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CNWPy7s+fTZ+MGUOFIrbwA26YpMQp8dMXzUs0DQ082SoWbicDjed8IjL2kbX/YgyN
	 6Te/RQrztGcLdG9MDmq0nhs+CUygLdJJSBkRHhtZRSyYjjP0KdmDML+pRmCRfqhyAQ
	 C16jmCVZ+Q38GPQPAdBJhbH7aaG1D0GlxSgOEdxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F6C4F80302;
	Tue,  7 Jun 2022 08:10:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 588F9F801D8; Mon,  6 Jun 2022 05:33:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99EA4F80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 05:33:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99EA4F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tFJZusU1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A8C760EE6;
 Mon,  6 Jun 2022 03:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18083C341C0;
 Mon,  6 Jun 2022 03:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654486430;
 bh=TI4P18/3vyoUu1YoM1I93ZEGQv/UWUtMjgpV3is+1kU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tFJZusU1hxG2s1CJAu/uiv0E+bAvVegQhojDIoAHyJhGf2CpfQHdYfd63OYaXP0/3
 tl9nzWxkaafABij8lqsZ5MrgoRiCJkmKhT6mUps3kQJJUcarzBWjvqhX+nnzU7KuuH
 M1sITb9nLev16/CnmDOBLDR9sft1NqYa56mDK6TYh+XhuSxzBGaz00U17pkjsv1ykO
 1xbqro3byn4WFq2ZXjDSp5Mx6gkf+iadKrRgaEInhfU6CUJOoXak/Exda99R6yHsRc
 ZpeQ/WkQ7MtuWXRB2kZKovQ5cRR+ulL6ulkGtXTJWKxLQIUAMOP2Du9HlLMaTPj68u
 6fltf6QTe+EWQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E9551E737F0; Mon,  6 Jun 2022 03:33:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: Fix properties without any type
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <165448642995.20111.10251737230487275413.git-patchwork-notify@kernel.org>
Date: Mon, 06 Jun 2022 03:33:49 +0000
References: <20220519211411.2200720-1-robh@kernel.org>
In-Reply-To: <20220519211411.2200720-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
X-Mailman-Approved-At: Tue, 07 Jun 2022 08:10:18 +0200
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-pci@vger.kernel.org, linus.walleij@linaro.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, groeck@chromium.org,
 sam@ravnborg.org, chrome-platform@lists.linux.dev, herbert@gondor.apana.org.au,
 brgl@bgdev.pl, linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org, kvalo@kernel.org,
 mripard@kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 mpm@selenic.com, bhelgaas@google.com, mchehab@kernel.org, bleung@chromium.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 dmitry.torokhov@gmail.com, sre@kernel.org, peda@axentia.se,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org, krzk+dt@kernel.org,
 davem@davemloft.net
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

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Rob Herring <robh@kernel.org>:

On Thu, 19 May 2022 16:14:11 -0500 you wrote:
> Now that the schema tools can extract type information for all
> properties (in order to decode dtb files), finding properties missing
> any type definition is fairly trivial though not yet automated.
> 
> Fix the various property schemas which are missing a type. Most of these
> tend to be device specific properties which don't have a vendor prefix.
> A vendor prefix is how we normally ensure a type is defined.
> 
> [...]

Here is the summary with links:
  - dt-bindings: Fix properties without any type
    https://git.kernel.org/chrome-platform/c/4e71ed985389

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


