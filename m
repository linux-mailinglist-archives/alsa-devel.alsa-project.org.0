Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DCB706AAA
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 16:12:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D308B1F4;
	Wed, 17 May 2023 16:11:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D308B1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684332762;
	bh=V85zZU9K+ebn9I4WS/QhOULxzw4WjXXhE4w7yyJEDSA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IBuXxT3woYh+HGfz8Zwq+CvbeayYLNSMPkufu5W3beZ/rWwvI/jmLxtR2mZ7Mcjf+
	 8nOHq8QKM+XqxSWLxlZ1sanIGnhWNIoex8u8dmZ+7MqdMcEH78qllSdx2KCYvoUmf7
	 2FDGMSBD6w8zEh8UVCTkiDifKgD5utkbcKYUbIVo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9022BF80431; Wed, 17 May 2023 16:11:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17FE7F8025A;
	Wed, 17 May 2023 16:11:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C15C6F80272; Wed, 17 May 2023 16:11:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECBCBF8016A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 16:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECBCBF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=P67yW/dr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684332683; x=1715868683;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=V85zZU9K+ebn9I4WS/QhOULxzw4WjXXhE4w7yyJEDSA=;
  b=P67yW/dr/FCnCA5wzscU/Z5u9fSOsAcCo1SONwLkSqfY+CbzaQDkKq09
   +bVJSo0veZD/PhGm77nHrSHiEO+crb4D2khs3APA1xWWdGoKMsAwupPgX
   Q7iLmy9xSM07uzUOE0yNJWET9AjdQYq/gqEdCkEP1xp8YQxQ44pr6tHRH
   g02/vgKapjDQ13LSN2F9VZCBihXXAmoFiIB0mt0KuOLLLvncyVsFmvMKy
   3sqx3++lCshImg6zFXv5osrTbPsrQK1X2g/CC3WgNttKCIyGAOLmAzNJ7
   mRg0HKSZ8frP7jvVULNXvwGtEyIgtnI3BpfmLvAH+6B6XQirW7GOYcJwH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="349273295"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200";
   d="scan'208";a="349273295"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 07:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="734709640"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200";
   d="scan'208";a="734709640"
Received: from rdealba-mobl.amr.corp.intel.com (HELO [10.209.16.101])
 ([10.209.16.101])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 07:11:17 -0700
Message-ID: <4aae458b-6919-2999-9293-028737c9a6e1@linux.intel.com>
Date: Wed, 17 May 2023 09:11:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH 08/10] pinctrl: cs42l43: Add support for the cs42l43
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, tglx@linutronix.de,
 maz@kernel.org, linus.walleij@linaro.org, vkoul@kernel.org,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-9-ckeepax@opensource.cirrus.com>
 <ZF6RMqElYZVMpWRt@surfacebook>
 <20230515101350.GS68926@ediswmail.ad.cirrus.com>
 <CAHp75Vcizrucc-2KFdFNeHNrxCzz4GwX1OzZYyjPH7P9RgnKYQ@mail.gmail.com>
 <20230517101301.GV68926@ediswmail.ad.cirrus.com>
 <CAHp75VchpbiYcd2yaP1WTjX17P0hg3qON5JGAXu08aDVw6Ydkw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CAHp75VchpbiYcd2yaP1WTjX17P0hg3qON5JGAXu08aDVw6Ydkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: R3JYBST5FLMJJXIFZH4ABTEZ6OMLBYKP
X-Message-ID-Hash: R3JYBST5FLMJJXIFZH4ABTEZ6OMLBYKP
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R3JYBST5FLMJJXIFZH4ABTEZ6OMLBYKP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/17/23 08:59, Andy Shevchenko wrote:
> On Wed, May 17, 2023 at 1:13 PM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
>> On Tue, May 16, 2023 at 10:03:45PM +0300, Andy Shevchenko wrote:
>>> On Mon, May 15, 2023 at 1:13 PM Charles Keepax
>>> <ckeepax@opensource.cirrus.com> wrote:
>>>> On Fri, May 12, 2023 at 10:19:14PM +0300, andy.shevchenko@gmail.com wrote:
>>>>> Fri, May 12, 2023 at 01:28:36PM +0100, Charles Keepax kirjoitti:
>>>>>> +   if (!of_property_read_bool(dev_of_node(cs42l43->dev), "gpio-ranges")) {
>>>>>> +           ret = gpiochip_add_pin_range(&priv->gpio_chip, priv->gpio_chip.label,
>>>>>> +                                        0, 0, CS42L43_NUM_GPIOS);
>>>>>> +           if (ret) {
>>>>>> +                   dev_err(priv->dev, "Failed to add GPIO pin range: %d\n", ret);
>>>>>> +                   goto err_pm;
>>>>>> +           }
>>>>>> +   }
>>>>>
>>>>> Besides the fact that we have a callback for this, why GPIO library can't
>>>>> handle this for you already?
>>>>
>>>> Apologies but I am not quite sure I follow you, in the device
>>>> tree case this will be handled by the GPIO library. But for ACPI
>>>> this information does not exist so has to be called manually, the
>>>> library does not necessarily know which values to call with,
>>>> although admittedly our case is trivial but not all are.
>>>
>>> Why can't the firmware provide this information? _DSD() is a part of
>>> ACPI v5.1 IIRC.
>>
>> I am very very far from confident we can guarantee that will be
>> present in the ACPI. The ACPI is typically made for and by the
>> Windows side.
> 
> Why? You may insist firmware vendors / OEMs to use that as a
> requirement to the platforms that would like to use your chip. The
> _DSD() is part of the specification, I don't see how the above can be
> an argument.
> 
> The times when ACPI == Windows are quite behind.

This is one of those Yogi Berra-isms: In theory, there is no difference
between theory and practice. In practice there is.

DSD is not really used indeed for audio devices. Even for SoundWire
where we inked the requirement to use DSD in a MIPI standardization
document, the only _DSD properties are for the manager side, the
peripheral side information is not populated or mostly
useless/incorrect. Most codec drivers hard-code the properties that were
intended to be set in the DSDT.

Unless there is firm evidence that the firmware does provide the
required DSD properties we can assume it does not. We can't force the
ecosystem to use DSD, even if it makes sense. it's frustrating but it is
what it is.
