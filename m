Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE90B157F23
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 16:47:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72FE0166F;
	Mon, 10 Feb 2020 16:46:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72FE0166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581349624;
	bh=tNIWVWCEE4uhxY4z1QCzIA5Ywp5CNkwwWZmnEGy5K48=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ALpeCKG/7QWKa3njFAGHCEviM4ON0WSC9pm0LN/EVS76XbfsdNQU0l2RpXeES6Sgb
	 H8jKT64cPZoJn9X1WLYM9EAkjnY8VcFxVBr1sMQM+C6jPEeX8rRHjh4nxdtXQp8bTs
	 Ey2ml826wvcxX4+EbWl8Qobc97r1QbWGh2VMj6wo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05ABFF80228;
	Mon, 10 Feb 2020 16:45:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CEB3F8020B; Mon, 10 Feb 2020 16:45:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.serbinski.com (mail.serbinski.com [162.218.126.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CA82F80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 16:45:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CA82F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=serbinski.com header.i=@serbinski.com
 header.b="R95TpP03"
Received: from localhost (unknown [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id 8BD69D006F9;
 Mon, 10 Feb 2020 15:45:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
 by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RU0dbJpuXSmK; Mon, 10 Feb 2020 10:45:16 -0500 (EST)
Received: from mail.serbinski.com (localhost [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id 264F5D00693;
 Mon, 10 Feb 2020 10:45:16 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 264F5D00693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
 s=default; t=1581349516;
 bh=cgzaas0LPv50cOT+2MC0flSgiGLs+1OYFMtEFdzI+9Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R95TpP03Z2najOK0N607cJhi1GKdKti38DMqwwGSmgYAXHDbUTpNfJy94pKthGMkl
 VY+b5ALw30rca8MF3RzDpXXmgCF4Ua3ISzhn4la3kag0BP7BSKsGxgAWZtmozbwK0M
 aWvAj8ofKAwd9n0MZxeaYQo2yJ+PQjJ8C8R/w9ho=
MIME-Version: 1.0
Date: Mon, 10 Feb 2020 10:45:16 -0500
From: Adam Serbinski <adam@serbinski.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <20200210133636.GJ7685@sirena.org.uk>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-9-adam@serbinski.com>
 <20200210133636.GJ7685@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4-beta
Message-ID: <18057b47c76d350f8380f277713e0936@serbinski.com>
X-Sender: adam@serbinski.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 8/8] ASoC: qcom: apq8096: add kcontrols
	to set PCM rate
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2020-02-10 08:36, Mark Brown wrote:
> On Sun, Feb 09, 2020 at 10:47:48AM -0500, Adam Serbinski wrote:
>> This makes it possible for the backend sample rate to be
>> set to 8000 or 16000 Hz, depending on the needs of the HFP
>> call being set up.
> 
> This would seem like an excellent thing to put in the driver for the
> baseband or bluetooth.

The value that must be set to this control is not available to the 
bluetooth driver. It originates from the bluetooth stack in userspace, 
typically either blueZ or fluoride, as a result of a negotiation between 
the two devices participating in the HFP call.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
