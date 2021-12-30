Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDFE481F58
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Dec 2021 19:57:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26E7916FA;
	Thu, 30 Dec 2021 19:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26E7916FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640890663;
	bh=/yk13rheqGka2ge4GhFf/aojZppTQ3ctiZZurzU3hDk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zw3LPV9uE3xXEHG1v1Hb6HuWuCGasj92cVczY9RG1PIyq01FfH2d+6gDTurUC1gNM
	 ifWzaxct7TaUy/iJZ64gKB31ubJCED6OniCvw6mJ4EnQOKRPEC1x9ybM5udK+y8xan
	 FXphGxL/hmcbacQ0Q9iuvDuV+t65H1HjfOwBDis4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 843C3F80149;
	Thu, 30 Dec 2021 19:56:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C296BF800EB; Thu, 30 Dec 2021 19:56:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EC2EF800EB
 for <alsa-devel@alsa-project.org>; Thu, 30 Dec 2021 19:56:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EC2EF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="eu2+UfBC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1640890587;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=1J/neBQ7w84N+9rxydRlVdDkkRNU4FCfuZ2vnfusmIQ=;
 b=eu2+UfBCtS0ipi8sJcvGxBzM2k2leRFKA6t3MEKKDVcnSMie7qkeifL9kln8setXlB
 7FAapC9n/NBTzakv0g8f+xcrnzb4+sXZP2tJCLAvyFCfZCsZ4GvO81cdn0kaEpOSGYLF
 rDiwHxqMW9Gl5uYHysGRfTFaPUYwNaB+RO2o9krKpYinfaBksf0QjyVCTVl5438fepE3
 uEd/tPnImgycToHnYd68AiXg9uwRu/865fBj5DQgRHStibQLAV1dZxMeQse4YqK+pma4
 ru1Vc17wJV3zy8oGmK+aTXcE1Dk16Lu9dKtrvjel20hBqm0gb8KQeKmaawOVgQtg7yGn
 ywIA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrK88/6Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.35.3 SBL|AUTH)
 with ESMTPSA id x08baexBUIuRY96
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 30 Dec 2021 19:56:27 +0100 (CET)
Date: Thu, 30 Dec 2021 19:56:26 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 5/5] ASoC: Intel: bytcr_rt5640: Add support for external
 GPIO jack-detect
Message-ID: <Yc4A2sa/tmRqcjrU@gerhold.net>
References: <20211227153344.155803-1-hdegoede@redhat.com>
 <20211227153344.155803-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211227153344.155803-5-hdegoede@redhat.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bard.liao@intel.com>
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

On Mon, Dec 27, 2021 at 04:33:44PM +0100, Hans de Goede wrote:
> Some boards have the codec IRQ hooked-up as normally, so the driver can
> still do things like headset vs headphones and button-press detection,
> but instead of using one of the JD pins of the codec, an external GPIO
> is used to report the jack-presence switch status of the jack.
> 
> Add support for boards which have this setup and which specify which
> external GPIO to use in the special Android AMCR0F28 ACPI device.
> 
> And add a quirk for the Asus TF103C tablet which uses this setup.
> 

Can you clarify what exactly is the difference between the setup on
ME176C and the TF103C? I'm a bit confused why you're using the GpioInt
as GPIO for TF103C and as IRQ for ME176C. It's GPO2 pin 0x0004 for both
of them as far as I can tell.

If I remember correctly the vendor kernel from ASUS also used it as
simple GPIO on ME176C. I'm not sure if it actually belongs to the
RT5640, I just tried using it in a way that is compatible with your
headphone detection code. :)

Before I switched to your code I was actually using it as simple GPIO
similar to your changes here (this could only detect headphones though):
https://github.com/me176c-dev/linux-me176c/commit/ea3de8e47414371fdeeae819c686f737c02fac7d#diff-28a5a6c5e3db2a315d022023f3cda69ef0475ef036e22dd5ffa0fb4af31c9f81

In other words, my question is: Should we also use BYT_RT5640_JD_SRC_EXT_GPIO
for ME176C? Or can TF103C also use the same setup as ME176C?

Thanks,
Stephan
