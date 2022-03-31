Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 315CB4EDA8D
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 15:30:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B501E18F6;
	Thu, 31 Mar 2022 15:29:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B501E18F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648733421;
	bh=sFy6QpPvIDdJYTswBjya6Xk7eXCzJXSPutI+c8w0gBg=;
	h=To:References:From:Subject:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iYgsA/ts2MkiflBMzOwskLrG7wVxcVQos6zJfacG2SAAaJ/x5/+tzmiGf9+ggmh39
	 thddCihmoCnGjFR8GqrD9zhnjhZb3UTaDmA5JV2kmqG2x5EtccFh5PzBhEFa/sESvj
	 dPFoh53GKuMkGjbDHOv9efoMaM8MyKW/YDj57ATs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4211AF800E4;
	Thu, 31 Mar 2022 15:29:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 215F1F80227; Thu, 31 Mar 2022 15:29:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FB78F800E4
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 15:29:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FB78F800E4
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 8740941E96;
 Thu, 31 Mar 2022 13:28:59 +0000 (UTC)
To: Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Martin_Povi=c5=a1er?=
 <povik+lin@cutebit.org>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
 <YkWfziQzprEsWL72@sirena.org.uk>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [RFC PATCH 0/5] Apple Macs machine-level ASoC driver
Message-ID: <ea0e8079-a184-996f-47ac-3e00b63166c9@marcan.st>
Date: Thu, 31 Mar 2022 22:28:56 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YkWfziQzprEsWL72@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
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

On 31/03/2022 21.34, Mark Brown wrote:
> On Thu, Mar 31, 2022 at 02:04:44AM +0200, Martin Povišer wrote:
> 
>> I put together a machine-level ASoC driver for recent Apple Macs (the
>> ones with ARM64 SoCs) and want to gauge opinions.
> 
> This would be a bit easier to review with a description of the hardware.
> 
>> Commit 2 adds a new ASoC card method (filter_controls) to let the card
>> prevent some codec kcontrols from being visible to userspace. For example
>> the TAS2770 speaker amp driver would be happy to expose TDM slot selection
>> and ISENSE/VSENSE enables which is ridiculous. I am all ears on how to
>> make the patch acceptable to upstream.
> 
> The broad issue here is that what you consider ridiculous someone else
> might have some bright ideas for configuring dynamically - if things are
> being exposed for dynamic configuration it's probably because someone
> wanted them, if the control is genuinely useless then it should just be
> removed.  Rather than getting in the way of people's policy arguments
> about how to set things we expose them to userspace and let userspace
> worry about it, usually with the help of UCM files.  The general
> userspace model is that people interact with their sound server more
> than the hardware card.  This is also helpful for people developing use
> cases, it means they're not having to get the kernel rebuilt to tune
> things.

The problem with this model is that, in particular in the case of
speaker amps, incorrect settings can cause your speakers to blow up.
This has been a longstanding problem with ASoC platforms (I should know,
I *melted* the speakers in a Chromebook by toggling the wrong alsamixer
control once, it even warped the external case, all without making any
audible noise).

It's the kernel's job to ensure that broadly exposed user controls are
safe and cannot be used to cause hardware damage; if that is possible,
then that's a kernel security vulnerability worthy of a CVE, in my
opinion. I think this idea of exposing what is effectively raw codec
chip registers as ALSA controls that is so popular these days was a
terrible idea from the start, and only makes some sense within the world
of highly integrated vendor-controlled embedded platforms running
kiosk-style software with no user control. It is completely unsuitable
for a desktop Linux system, since it means users *will* destroy their
hardware accidentally. So, some way or another, whatever is exposed has
to be sanitized so that it can't go outside the envelope of what is safe
for the hardware design. That cannot be known at the level of codec
chips and speaker amp chips; it requires platform integration knowledge.

That knowledge is what is (intended to be) encoded in the macaudio
driver. It's supposed to know how to drive the underlying codec chips
and disable access to things that don't make any sense on the platform,
and expose controls to the user that are reasonable for what a user
would want to do on that specific hardware platform, and no more.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
