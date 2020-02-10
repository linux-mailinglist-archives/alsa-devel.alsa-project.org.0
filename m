Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1DE1583FF
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 21:02:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2C1C1670;
	Mon, 10 Feb 2020 21:02:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2C1C1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581364972;
	bh=/EZUZU8u0h7lavCkol2KHMAe0SPMBtY4RQ8Isyid07g=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nSOl4nQqU3GxqIMf2N4qjvfr/mC3RIXqcFsDpCvPVpyLCvoWRvkrX6q5krf2MHn0W
	 FaWMBSQLeFqfpYmLRiJbjcvyHSbLS061jDJ2o4TIYmCDrM0fc3QQkJ9HBGpCvyGYAf
	 INqYECxdIW1iUHt/k/NclHxDw2mz6tnC5JUjAPAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20A6BF800E7;
	Mon, 10 Feb 2020 21:01:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB3DBF80157; Mon, 10 Feb 2020 21:01:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.serbinski.com (mail.serbinski.com [162.218.126.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE35EF800FD
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 21:01:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE35EF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=serbinski.com header.i=@serbinski.com
 header.b="eQXczSjB"
Received: from localhost (unknown [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id 74951D006F9;
 Mon, 10 Feb 2020 20:01:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
 by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPrZs-h4-A_j; Mon, 10 Feb 2020 15:00:55 -0500 (EST)
Received: from mail.serbinski.com (localhost [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id 322B0D00693;
 Mon, 10 Feb 2020 15:00:55 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 322B0D00693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
 s=default; t=1581364855;
 bh=FC0suK3LacpLEIkSR/LMi90MqKyqvjqaemkIxiuQnsQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eQXczSjBjgUAdnSoYpeMqwFZ++51LDVybQH+o0mOVj6TcppiRNma7GYgngajWpLRy
 N6apQTaUgSnSEihCmL0eSKt2yLk+lUhE28D5bW1nv/0dJy98An3AE25X7JUaLGvfLK
 GtTjy77x+JbNHujwNXTMNPs6FAJNhsD0x7FHRaIM=
MIME-Version: 1.0
Date: Mon, 10 Feb 2020 15:00:55 -0500
From: Adam Serbinski <adam@serbinski.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <20200210182609.GA14166@sirena.org.uk>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-9-adam@serbinski.com>
 <20200210133636.GJ7685@sirena.org.uk>
 <18057b47c76d350f8380f277713e0936@serbinski.com>
 <20200210182609.GA14166@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4-beta
Message-ID: <f88d21773f47f5a543a17ad07d66f9b7@serbinski.com>
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

On 2020-02-10 13:26, Mark Brown wrote:
> On Mon, Feb 10, 2020 at 10:45:16AM -0500, Adam Serbinski wrote:
>> On 2020-02-10 08:36, Mark Brown wrote:
> 
>> > This would seem like an excellent thing to put in the driver for the
>> > baseband or bluetooth.
> 
>> The value that must be set to this control is not available to the 
>> bluetooth
>> driver. It originates from the bluetooth stack in userspace, typically
>> either blueZ or fluoride, as a result of a negotiation between the two
>> devices participating in the HFP call.
> 
> To repeat my comment on another patch in the series there should still
> be some representation of the DAI for this device in the kernel.

Respectfully, I'm not sure I understand what it is that you are 
suggesting.

Is it your intention to suggest that instead of adding controls to the 
machine driver, I should instead write a codec driver to contain those 
controls?

Or is it your intention to suggest that something within the kernel is 
already aware of the rate to be set, and it is that which should set the 
rate rather than a control?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
