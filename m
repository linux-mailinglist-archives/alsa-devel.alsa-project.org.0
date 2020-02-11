Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E1B1590A7
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 14:54:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0269B165F;
	Tue, 11 Feb 2020 14:53:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0269B165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581429259;
	bh=ikRTsg6YtcX3ut5XmQ/kI5tLoCoTQ+3REGTToKP1Zi4=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sedmhcfYNMpDFyefIMOC3z0p/tM8XrzIV4bJFfMsykL1grx/rvWr+J0aX14u8FZwe
	 VFyBDNwj82st4Xh3/XDiYBjI2F8NLc/aBflwOj3xCNNwiCWiDYGqYSpVqqGqkleR3x
	 CcchJHhQsuY8ZniKDoPKXRceohnr+qW75LwGBnOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11774F80146;
	Tue, 11 Feb 2020 14:52:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76764F800F0; Tue, 11 Feb 2020 14:52:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.serbinski.com (mail.serbinski.com [162.218.126.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9730F800F0
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 14:52:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9730F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=serbinski.com header.i=@serbinski.com
 header.b="Ssoit/C7"
Received: from localhost (unknown [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id CADA7D006F9;
 Tue, 11 Feb 2020 13:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
 by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MnOnwGJcKCEn; Tue, 11 Feb 2020 08:52:23 -0500 (EST)
Received: from mail.serbinski.com (localhost [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id 4F86CD00693;
 Tue, 11 Feb 2020 08:52:23 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 4F86CD00693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
 s=default; t=1581429143;
 bh=4UgsNF2DfSAJSAEAuD7fkyhncR/ncVh8kAIH7kgJv2A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ssoit/C7jtU+uEyLBQlHyTfLDiONn8FBviOZQ0wZQ7bzpeDh/52Y6RjL0hK95iw6w
 CAsfhZGI5lqAnLqnO/pA3fRbCr2t+TeGXKjon6ZvGiVTc+vduNIAZmmKhNUTBOCw0b
 nwYbCqj3d60oW8U+tkAROVgAxx84Q5ivNylYa9tA=
MIME-Version: 1.0
Date: Tue, 11 Feb 2020 08:52:23 -0500
From: Adam Serbinski <adam@serbinski.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <20200211114256.GC4543@sirena.org.uk>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-9-adam@serbinski.com>
 <20200210133636.GJ7685@sirena.org.uk>
 <18057b47c76d350f8380f277713e0936@serbinski.com>
 <20200210182609.GA14166@sirena.org.uk>
 <f88d21773f47f5a543a17ad07d66f9b7@serbinski.com>
 <20200210200839.GG14166@sirena.org.uk>
 <7c57801d8f671c40d4c6094e5ce89681@serbinski.com>
 <20200211114256.GC4543@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4-beta
Message-ID: <b386237a1c21a417afb25f79a8b3d4ce@serbinski.com>
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

On 2020-02-11 06:42, Mark Brown wrote:
> On Mon, Feb 10, 2020 at 04:13:52PM -0500, Adam Serbinski wrote:
> 
>> I am not aware of how this could be done for bluetooth, since the 
>> value
>> still has to originate from userspace. The driver you referred to 
>> supports
>> only a single sample rate, whereas for bluetooth, 2 sample rates are
>> required, and nothing in the kernel is aware of the appropriate rate, 
>> at
>> least in the case of the qca6174a I'm working with right now, or for 
>> that
>> matter, TI Wilink 8, which I've also worked with.
> 
> There's generic support in the CODEC<->CODEC link code for setting the
> DAI configuration from userspace.

Ok. Its going to take some time to get my head around that, so for the 
time being I'm going to drop this feature and get the rest fixed for 
inclusion.

Thanks.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
