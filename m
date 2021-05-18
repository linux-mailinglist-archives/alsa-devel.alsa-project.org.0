Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9A5387D33
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 18:17:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B734172F;
	Tue, 18 May 2021 18:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B734172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621354674;
	bh=h0KaMRxDBNAe65N3j3qecdvuFF6Y6k3ZtLNrU0HEx/g=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n6QgoaUDynv+rUDGhcHxmbI/nomNO+GfAFMeIjmr8SOUduC/HnHWwfYnxHCCRJtXT
	 a0LdhP5zsgF0aynvg19xCxWIBfUC9VsKUw9s7cVwcMbqkDy0KnLAfdi1xBypF2kz91
	 Q4RiUDoME/uw69h3EEcnzlDmxlqFV3Nfljl6tXZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C88C0F80229;
	Tue, 18 May 2021 18:16:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 666DFF80217; Tue, 18 May 2021 18:16:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDDA8F8012C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 18:16:18 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 755EBA003F;
 Tue, 18 May 2021 18:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 755EBA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1621354577; bh=vatbyHpKFW3QCrHOuh+ZoyakhdT0ssrTpaZVBp4lfYc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=htmoBFss5d9t45P6HcuURtMlU1mYwUON5OXtzo1zYxMWhV+bezct5NB4EJ7/7E/wn
 8EwLmCvsqo8vTy1dV2b+1+HwLJspXT589if5SUArF6Gg1HrDdjA4M1O4jkGv+aen3F
 GJSm3tu1cIQeubbcNx0y1iHaFPx4b55toTAyS6TI=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 18 May 2021 18:16:15 +0200 (CEST)
Subject: Re: [PATCH alsa-lib 0/5] Add generic exception mechanism for
 non-standard control-names
To: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
References: <20210503205231.167346-1-hdegoede@redhat.com>
 <0f7f1063-4a14-5d99-71b2-e700c74828c2@perex.cz>
 <67840562-7f54-bb9b-7876-6079b4ff7f47@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <95924d6e-e2b7-0b9b-b62c-27e57fe88a80@perex.cz>
Date: Tue, 18 May 2021 18:16:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <67840562-7f54-bb9b-7876-6079b4ff7f47@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 04. 05. 21 v 17:47 Hans de Goede napsal(a):
> Hi Jaroslav,
> 
> On 5/4/21 10:53 AM, Jaroslav Kysela wrote:
>> Dne 03. 05. 21 v 22:52 Hans de Goede napsal(a):
>>> Hi All,
>>>
>>> This series seems to have fallen through the cracks,
>>> so here is a resend of it.
>>>
>>> Regards,
>>
>> Thank you, Hans. The problem with this implementation is that it's really card
>> specific. Also, ASoC codec drivers have usually ID names based on registers so
>> the mapping for the user is problematic anyway (the functionality is different
>> from the name or not related to the name). I'm actually evaluating another
>> solution which is more flexible:
>>
>> 1) add control remap plugin to allow the control ID remapping in the
>> alsa-lib's control API, so we can mangle those identifiers there (already
>> implemented)
>>
>> 2) add local and global alsa-lib configurations per UCM card specified in the
>> UCM configuration files; the configurations may be for both control and PCM
>> devices (restrict or set specific parameters)
> 
> Ok, thank you for working on this.
> 
>> I will notify you when I finish my tests.
> 
> Yes, please let me know when you've something ready to test, then I'll take
> a look at adding the necessary bits for the bycr-rt5640 and cht-bsw-rt567
> UCM profiles, as some control renaming is necessary to make sure that
> the hw-volume control on these devices also correctly controls the
> hw mute controls (which in turn are necessary for both full muting and
> for mute LED control).

It seems that things started to work. I pushed everything to the repos
(alsa-lib/alsa-utils/alsa-ucm-conf) and picked bits from your configs. If you
can give a look and a test, it would be nice. The changes for the specific
codecs are quite straight like:

https://github.com/alsa-project/alsa-ucm-conf/commit/2072ab794b69cdf4f070db5467387d08a65c4309

The global alsa-lib's configuration does the redirects to the hw specific
configs (if found) per card. UCM can store this "per card" configuration to
/var/lib/alsa/card<NUMBER>.conf.d tree, which allows us to define the hw
specific configuration. Both control and PCM devices can be (re)configured.

UCM was extended to allow inline the alsa-lib's configuration which can be
private to UCM or saved to a global config file (/var/lib/alsa tree for example).

By default, I made the private alsa-lib's configuration for all UCM
applications, so the users cannot break UCM with their configuration changes.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
